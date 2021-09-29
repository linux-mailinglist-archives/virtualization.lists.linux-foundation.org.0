Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF7F41C7F8
	for <lists.virtualization@lfdr.de>; Wed, 29 Sep 2021 17:11:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 437A540762;
	Wed, 29 Sep 2021 15:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUfF1DoMBLfa; Wed, 29 Sep 2021 15:11:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D332F40727;
	Wed, 29 Sep 2021 15:11:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE8FCC0025;
	Wed, 29 Sep 2021 15:11:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B4AEC0011
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 15:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDDDF60E2F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 15:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=axis.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yDUC6PVmahIq
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 15:11:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC58860C1B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 15:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1632928288;
 x=1664464288; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MzYbA0bW/O2YRknujPHqmWmFDtAuyM+1z3OFVDXtNn4=;
 b=NbGexN8Ua1ocuuA3ZxFqhPF3Teao53GzQ+LAHFmID4AHauFuCq1ittXK
 4OAhTXUwe16qaB+mRp9fYnxkqiPXOSszOyv/Hk5MxCHIwLZxvctlQMwQX
 hMea/NPigNG5bkXsiDv0E/ro0mZ14AWhi++n8W27nWV4lnSnkdG9FVG8u
 R7uEmxm0Lp2Lm5u8cUAEqtM6mpsLnoefwFEO1epfyoSaOM4H4JyXTgqao
 1ZIFdNUYp0rw9SeR8K/IBG9PQxUS9M3CLi/rpxttWGZdm3TJZaCQOISAT
 2+bmbzq7DHrjw4U5UAHd1Ard/8ovaLABMF5sfbuRSdKXe3XhBuCzOI9KP g==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <mst@redhat.com>, <jasowang@redhat.com>
Subject: [RFC PATCH 08/10] vhost: net: add support for kernel control
Date: Wed, 29 Sep 2021 17:11:17 +0200
Message-ID: <20210929151119.14778-9-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210929151119.14778-1-vincent.whitchurch@axis.com>
References: <20210929151119.14778-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kernel@axis.com,
 stefanha@redhat.com, pbonzini@redhat.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Add support for kernel control to virtio-net.  For the vhost-*-kernel
devices, the ioctl to set the backend only provides the socket to
vhost-net but does not start the handling of the virtqueues.  The
handling of the virtqueues is started and stopped by the kernel.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/vhost/net.c | 106 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 98 insertions(+), 8 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index b5590b7862a9..977cfa89b216 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -144,6 +144,9 @@ struct vhost_net {
 	struct page_frag page_frag;
 	/* Refcount bias of page frag */
 	int refcnt_bias;
+	/* Used for storing backend sockets when stopped under kernel control */
+	struct socket *tx_sock;
+	struct socket *rx_sock;
 };
 
 static unsigned vhost_net_zcopy_mask __read_mostly;
@@ -1293,6 +1296,8 @@ static struct vhost_dev *vhost_net_open(struct vhost *vhost)
 	n = kvmalloc(sizeof *n, GFP_KERNEL | __GFP_RETRY_MAYFAIL);
 	if (!n)
 		return ERR_PTR(-ENOMEM);
+	n->tx_sock = NULL;
+	n->rx_sock = NULL;
 	vqs = kmalloc_array(VHOST_NET_VQ_MAX, sizeof(*vqs), GFP_KERNEL);
 	if (!vqs) {
 		kvfree(n);
@@ -1364,6 +1369,20 @@ static struct socket *vhost_net_stop_vq(struct vhost_net *n,
 	return sock;
 }
 
+/* Stops the virtqueue but doesn't unconsume the tap ring */
+static struct socket *__vhost_net_stop_vq(struct vhost_net *n,
+					  struct vhost_virtqueue *vq)
+{
+	struct socket *sock;
+
+	mutex_lock(&vq->mutex);
+	sock = vhost_vq_get_backend(vq);
+	vhost_net_disable_vq(n, vq);
+	vhost_vq_set_backend(vq, NULL);
+	mutex_unlock(&vq->mutex);
+	return sock;
+}
+
 static void vhost_net_stop(struct vhost_net *n, struct socket **tx_sock,
 			   struct socket **rx_sock)
 {
@@ -1394,6 +1413,57 @@ static void vhost_net_flush(struct vhost_net *n)
 	}
 }
 
+static void vhost_net_start_vq(struct vhost_net *n, struct vhost_virtqueue *vq,
+			       struct socket *sock)
+{
+	mutex_lock(&vq->mutex);
+	vhost_vq_set_backend(vq, sock);
+	vhost_vq_init_access(vq);
+	vhost_net_enable_vq(n, vq);
+	mutex_unlock(&vq->mutex);
+}
+
+static void vhost_net_dev_start_vq(struct vhost_dev *dev, u16 idx)
+{
+	struct vhost_net *n = container_of(dev, struct vhost_net, dev);
+
+	if (WARN_ON(idx >= ARRAY_SIZE(n->vqs)))
+		return;
+
+	if (idx == VHOST_NET_VQ_RX) {
+		vhost_net_start_vq(n, &n->vqs[idx].vq, n->rx_sock);
+		n->rx_sock = NULL;
+	} else if (idx == VHOST_NET_VQ_TX) {
+		vhost_net_start_vq(n, &n->vqs[idx].vq, n->tx_sock);
+		n->tx_sock = NULL;
+	}
+
+	vhost_net_flush_vq(n, idx);
+}
+
+static void vhost_net_dev_stop_vq(struct vhost_dev *dev, u16 idx)
+{
+	struct vhost_net *n = container_of(dev, struct vhost_net, dev);
+	struct socket *sock;
+
+	if (WARN_ON(idx >= ARRAY_SIZE(n->vqs)))
+		return;
+
+	if (!vhost_vq_get_backend(&n->vqs[idx].vq))
+		return;
+
+	sock = __vhost_net_stop_vq(n, &n->vqs[idx].vq);
+
+	vhost_net_flush(n);
+	synchronize_rcu();
+	vhost_net_flush(n);
+
+	if (idx == VHOST_NET_VQ_RX)
+		n->rx_sock = sock;
+	else if (idx == VHOST_NET_VQ_TX)
+		n->tx_sock = sock;
+}
+
 static void vhost_net_release(struct vhost_dev *dev)
 {
 	struct vhost_net *n = container_of(dev, struct vhost_net, dev);
@@ -1405,6 +1475,14 @@ static void vhost_net_release(struct vhost_dev *dev)
 	vhost_dev_stop(&n->dev);
 	vhost_dev_cleanup(&n->dev);
 	vhost_net_vq_reset(n);
+	if (n->tx_sock) {
+		WARN_ON(tx_sock);
+		tx_sock = n->tx_sock;
+	}
+	if (n->rx_sock) {
+		WARN_ON(rx_sock);
+		rx_sock = n->rx_sock;
+	}
 	if (tx_sock)
 		sockfd_put(tx_sock);
 	if (rx_sock)
@@ -1518,7 +1596,7 @@ static long vhost_net_set_backend(struct vhost_net *n, unsigned index, int fd)
 	mutex_lock(&vq->mutex);
 
 	/* Verify that ring has been setup correctly. */
-	if (!vhost_vq_access_ok(vq)) {
+	if (!vhost_kernel(vq) && !vhost_vq_access_ok(vq)) {
 		r = -EFAULT;
 		goto err_vq;
 	}
@@ -1539,14 +1617,17 @@ static long vhost_net_set_backend(struct vhost_net *n, unsigned index, int fd)
 		}
 
 		vhost_net_disable_vq(n, vq);
-		vhost_vq_set_backend(vq, sock);
+		if (!vhost_kernel(vq))
+			vhost_vq_set_backend(vq, sock);
 		vhost_net_buf_unproduce(nvq);
-		r = vhost_vq_init_access(vq);
-		if (r)
-			goto err_used;
-		r = vhost_net_enable_vq(n, vq);
-		if (r)
-			goto err_used;
+		if (!vhost_kernel(vq)) {
+			r = vhost_vq_init_access(vq);
+			if (r)
+				goto err_used;
+			r = vhost_net_enable_vq(n, vq);
+			if (r)
+				goto err_used;
+		}
 		if (index == VHOST_NET_VQ_RX)
 			nvq->rx_ring = get_tap_ptr_ring(fd);
 
@@ -1572,6 +1653,13 @@ static long vhost_net_set_backend(struct vhost_net *n, unsigned index, int fd)
 		sockfd_put(oldsock);
 	}
 
+	if (vhost_kernel(vq)) {
+		if (index == VHOST_NET_VQ_TX)
+			n->tx_sock = sock;
+		else if (index == VHOST_NET_VQ_RX)
+			n->rx_sock = sock;
+	}
+
 	return 0;
 
 err_used:
@@ -1733,6 +1821,8 @@ static const struct vhost_ops vhost_net_ops = {
 	.open           = vhost_net_open,
 	.release        = vhost_net_release,
 	.ioctl		= vhost_net_ioctl,
+	.start_vq	= vhost_net_dev_start_vq,
+	.stop_vq	= vhost_net_dev_stop_vq,
 };
 
 static struct vhost *vhost_net;
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
