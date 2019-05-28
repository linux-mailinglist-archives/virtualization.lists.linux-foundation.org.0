Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 858AE2C4FA
	for <lists.virtualization@lfdr.de>; Tue, 28 May 2019 12:58:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3373D1C17;
	Tue, 28 May 2019 10:58:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3D0C21C02
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 10:56:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EA3FB891
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 10:56:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70E1CF74CF;
	Tue, 28 May 2019 10:56:47 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-13.ams2.redhat.com
	[10.36.117.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F19260BE2;
	Tue, 28 May 2019 10:56:45 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH 4/4] vsock/virtio: free used buffers during the .remove()
Date: Tue, 28 May 2019 12:56:23 +0200
Message-Id: <20190528105623.27983-5-sgarzare@redhat.com>
In-Reply-To: <20190528105623.27983-1-sgarzare@redhat.com>
References: <20190528105623.27983-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 28 May 2019 10:56:47 +0000 (UTC)
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

Before this patch, we only freed unused buffers, but there may
still be used buffers to be freed.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/virtio_transport.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index ad093ce96693..6a2afb989562 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -669,6 +669,18 @@ static void virtio_vsock_flush_works(struct virtio_vsock *vsock)
 	flush_work(&vsock->send_pkt_work);
 }
 
+static void virtio_vsock_free_buf(struct virtqueue *vq)
+{
+	struct virtio_vsock_pkt *pkt;
+	unsigned int len;
+
+	while ((pkt = virtqueue_detach_unused_buf(vq)))
+		virtio_transport_free_pkt(pkt);
+
+	while ((pkt = virtqueue_get_buf(vq, &len)))
+		virtio_transport_free_pkt(pkt);
+}
+
 static void virtio_vsock_remove(struct virtio_device *vdev)
 {
 	struct virtio_vsock *vsock = vdev->priv;
@@ -702,13 +714,11 @@ static void virtio_vsock_remove(struct virtio_device *vdev)
 	vdev->config->reset(vdev);
 
 	mutex_lock(&vsock->rx_lock);
-	while ((pkt = virtqueue_detach_unused_buf(vsock->vqs[VSOCK_VQ_RX])))
-		virtio_transport_free_pkt(pkt);
+	virtio_vsock_free_buf(vsock->vqs[VSOCK_VQ_RX]);
 	mutex_unlock(&vsock->rx_lock);
 
 	mutex_lock(&vsock->tx_lock);
-	while ((pkt = virtqueue_detach_unused_buf(vsock->vqs[VSOCK_VQ_TX])))
-		virtio_transport_free_pkt(pkt);
+	virtio_vsock_free_buf(vsock->vqs[VSOCK_VQ_TX]);
 	mutex_unlock(&vsock->tx_lock);
 
 	spin_lock_bh(&vsock->send_pkt_list_lock);
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
