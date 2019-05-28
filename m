Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A44E2C4F7
	for <lists.virtualization@lfdr.de>; Tue, 28 May 2019 12:58:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 489771C12;
	Tue, 28 May 2019 10:58:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 985361C02
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 10:56:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1D3B5891
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 10:56:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7202307D925;
	Tue, 28 May 2019 10:56:42 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-13.ams2.redhat.com
	[10.36.117.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D2F97D59A;
	Tue, 28 May 2019 10:56:39 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH 2/4] vsock/virtio: stop workers during the .remove()
Date: Tue, 28 May 2019 12:56:21 +0200
Message-Id: <20190528105623.27983-3-sgarzare@redhat.com>
In-Reply-To: <20190528105623.27983-1-sgarzare@redhat.com>
References: <20190528105623.27983-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 28 May 2019 10:56:42 +0000 (UTC)
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

Before to call vdev->config->reset(vdev) we need to be sure that
no one is accessing the device, for this reason, we add new variables
in the struct virtio_vsock to stop the workers during the .remove().

This patch also add few comments before vdev->config->reset(vdev)
and vdev->config->del_vqs(vdev).

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/virtio_transport.c | 49 +++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index d3ba7747aa73..e694df10ab61 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -39,6 +39,7 @@ struct virtio_vsock {
 	 * must be accessed with tx_lock held.
 	 */
 	struct mutex tx_lock;
+	bool tx_run;
 
 	struct work_struct send_pkt_work;
 	spinlock_t send_pkt_list_lock;
@@ -54,6 +55,7 @@ struct virtio_vsock {
 	 * must be accessed with rx_lock held.
 	 */
 	struct mutex rx_lock;
+	bool rx_run;
 	int rx_buf_nr;
 	int rx_buf_max_nr;
 
@@ -61,6 +63,7 @@ struct virtio_vsock {
 	 * vqs[VSOCK_VQ_EVENT] must be accessed with event_lock held.
 	 */
 	struct mutex event_lock;
+	bool event_run;
 	struct virtio_vsock_event event_list[8];
 
 	u32 guest_cid;
@@ -98,6 +101,10 @@ static void virtio_transport_loopback_work(struct work_struct *work)
 	spin_unlock_bh(&vsock->loopback_list_lock);
 
 	mutex_lock(&vsock->rx_lock);
+
+	if (!vsock->rx_run)
+		goto out;
+
 	while (!list_empty(&pkts)) {
 		struct virtio_vsock_pkt *pkt;
 
@@ -106,6 +113,7 @@ static void virtio_transport_loopback_work(struct work_struct *work)
 
 		virtio_transport_recv_pkt(pkt);
 	}
+out:
 	mutex_unlock(&vsock->rx_lock);
 }
 
@@ -134,6 +142,9 @@ virtio_transport_send_pkt_work(struct work_struct *work)
 
 	mutex_lock(&vsock->tx_lock);
 
+	if (!vsock->tx_run)
+		goto out;
+
 	vq = vsock->vqs[VSOCK_VQ_TX];
 
 	for (;;) {
@@ -192,6 +203,7 @@ virtio_transport_send_pkt_work(struct work_struct *work)
 	if (added)
 		virtqueue_kick(vq);
 
+out:
 	mutex_unlock(&vsock->tx_lock);
 
 	if (restart_rx)
@@ -314,6 +326,10 @@ static void virtio_transport_tx_work(struct work_struct *work)
 
 	vq = vsock->vqs[VSOCK_VQ_TX];
 	mutex_lock(&vsock->tx_lock);
+
+	if (!vsock->tx_run)
+		goto out;
+
 	do {
 		struct virtio_vsock_pkt *pkt;
 		unsigned int len;
@@ -324,6 +340,8 @@ static void virtio_transport_tx_work(struct work_struct *work)
 			added = true;
 		}
 	} while (!virtqueue_enable_cb(vq));
+
+out:
 	mutex_unlock(&vsock->tx_lock);
 
 	if (added)
@@ -352,6 +370,9 @@ static void virtio_transport_rx_work(struct work_struct *work)
 
 	mutex_lock(&vsock->rx_lock);
 
+	if (!vsock->rx_run)
+		goto out;
+
 	do {
 		virtqueue_disable_cb(vq);
 		for (;;) {
@@ -461,6 +482,9 @@ static void virtio_transport_event_work(struct work_struct *work)
 
 	mutex_lock(&vsock->event_lock);
 
+	if (!vsock->event_run)
+		goto out;
+
 	do {
 		struct virtio_vsock_event *event;
 		unsigned int len;
@@ -475,7 +499,7 @@ static void virtio_transport_event_work(struct work_struct *work)
 	} while (!virtqueue_enable_cb(vq));
 
 	virtqueue_kick(vsock->vqs[VSOCK_VQ_EVENT]);
-
+out:
 	mutex_unlock(&vsock->event_lock);
 }
 
@@ -611,12 +635,18 @@ static int virtio_vsock_probe(struct virtio_device *vdev)
 	INIT_WORK(&vsock->send_pkt_work, virtio_transport_send_pkt_work);
 	INIT_WORK(&vsock->loopback_work, virtio_transport_loopback_work);
 
+	mutex_lock(&vsock->tx_lock);
+	vsock->tx_run = true;
+	mutex_unlock(&vsock->tx_lock);
+
 	mutex_lock(&vsock->rx_lock);
 	virtio_vsock_rx_fill(vsock);
+	vsock->rx_run = true;
 	mutex_unlock(&vsock->rx_lock);
 
 	mutex_lock(&vsock->event_lock);
 	virtio_vsock_event_fill(vsock);
+	vsock->event_run = true;
 	mutex_unlock(&vsock->event_lock);
 
 	the_virtio_vsock = vsock;
@@ -647,6 +677,22 @@ static void virtio_vsock_remove(struct virtio_device *vdev)
 	/* Reset all connected sockets when the device disappear */
 	vsock_for_each_connected_socket(virtio_vsock_reset_sock);
 
+	/* Stop all work handlers to make sure no one is accessing the device */
+	mutex_lock(&vsock->rx_lock);
+	vsock->rx_run = false;
+	mutex_unlock(&vsock->rx_lock);
+
+	mutex_lock(&vsock->tx_lock);
+	vsock->tx_run = false;
+	mutex_unlock(&vsock->tx_lock);
+
+	mutex_lock(&vsock->event_lock);
+	vsock->event_run = false;
+	mutex_unlock(&vsock->event_lock);
+
+	/* Flush all device writes and interrupts, device will not use any
+	 * more buffers.
+	 */
 	vdev->config->reset(vdev);
 
 	mutex_lock(&vsock->rx_lock);
@@ -677,6 +723,7 @@ static void virtio_vsock_remove(struct virtio_device *vdev)
 	}
 	spin_unlock_bh(&vsock->loopback_list_lock);
 
+	/* Delete virtqueues and flush outstanding callbacks if any */
 	vdev->config->del_vqs(vdev);
 
 	kfree(vsock);
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
