Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8D2C4F9
	for <lists.virtualization@lfdr.de>; Tue, 28 May 2019 12:58:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B419C1C11;
	Tue, 28 May 2019 10:58:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0B7201C02
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 10:56:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AE480891
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 10:56:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 350F5300502A;
	Tue, 28 May 2019 10:56:45 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-13.ams2.redhat.com
	[10.36.117.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F2B67D59A;
	Tue, 28 May 2019 10:56:42 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH 3/4] vsock/virtio: fix flush of works during the .remove()
Date: Tue, 28 May 2019 12:56:22 +0200
Message-Id: <20190528105623.27983-4-sgarzare@redhat.com>
In-Reply-To: <20190528105623.27983-1-sgarzare@redhat.com>
References: <20190528105623.27983-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 28 May 2019 10:56:45 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

We flush all pending works before to call vdev->config->reset(vdev),
but other works can be queued before the vdev->config->del_vqs(vdev),
so we add another flush after it, to avoid use after free.

Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/virtio_transport.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index e694df10ab61..ad093ce96693 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -660,6 +660,15 @@ static int virtio_vsock_probe(struct virtio_device *vdev)
 	return ret;
 }
 
+static void virtio_vsock_flush_works(struct virtio_vsock *vsock)
+{
+	flush_work(&vsock->loopback_work);
+	flush_work(&vsock->rx_work);
+	flush_work(&vsock->tx_work);
+	flush_work(&vsock->event_work);
+	flush_work(&vsock->send_pkt_work);
+}
+
 static void virtio_vsock_remove(struct virtio_device *vdev)
 {
 	struct virtio_vsock *vsock = vdev->priv;
@@ -668,12 +677,6 @@ static void virtio_vsock_remove(struct virtio_device *vdev)
 	mutex_lock(&the_virtio_vsock_mutex);
 	the_virtio_vsock = NULL;
 
-	flush_work(&vsock->loopback_work);
-	flush_work(&vsock->rx_work);
-	flush_work(&vsock->tx_work);
-	flush_work(&vsock->event_work);
-	flush_work(&vsock->send_pkt_work);
-
 	/* Reset all connected sockets when the device disappear */
 	vsock_for_each_connected_socket(virtio_vsock_reset_sock);
 
@@ -690,6 +693,9 @@ static void virtio_vsock_remove(struct virtio_device *vdev)
 	vsock->event_run = false;
 	mutex_unlock(&vsock->event_lock);
 
+	/* Flush all pending works */
+	virtio_vsock_flush_works(vsock);
+
 	/* Flush all device writes and interrupts, device will not use any
 	 * more buffers.
 	 */
@@ -726,6 +732,11 @@ static void virtio_vsock_remove(struct virtio_device *vdev)
 	/* Delete virtqueues and flush outstanding callbacks if any */
 	vdev->config->del_vqs(vdev);
 
+	/* Other works can be queued before 'config->del_vqs()', so we flush
+	 * all works before to free the vsock object to avoid use after free.
+	 */
+	virtio_vsock_flush_works(vsock);
+
 	kfree(vsock);
 	mutex_unlock(&the_virtio_vsock_mutex);
 }
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
