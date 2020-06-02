Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0A81EBC68
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 15:06:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A46A587FB5;
	Tue,  2 Jun 2020 13:06:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SGmbIfSwokSv; Tue,  2 Jun 2020 13:06:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8581287EE6;
	Tue,  2 Jun 2020 13:06:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 615B0C0178;
	Tue,  2 Jun 2020 13:06:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8673C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D38E9876B4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AuPTczEkIgn9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7C18286B28
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591103181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6LjFF09GNTgapUCQye5EFdG/jfLEFmFuYlAzJu5ptC0=;
 b=DiLqHXo26X1wi1ip2eSb47EUcRX5tjKqdKJcIpjE1JUSyztzMXsXvu1nX2Glo7khj8o/Ge
 10BCmI02zpRurr1Pjznlehsn8KRRv+bBEi0ShUFN9yHegHdpccfGOFtIjR0t0zVMOAZq6S
 ITjwrl36KqVdZsfZcYp1v8DHAGjUnZI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-YnqEx2CCPyWhe7Cv_rD1-Q-1; Tue, 02 Jun 2020 09:06:17 -0400
X-MC-Unique: YnqEx2CCPyWhe7Cv_rD1-Q-1
Received: by mail-wr1-f71.google.com with SMTP id h6so1389948wrx.4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 02 Jun 2020 06:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6LjFF09GNTgapUCQye5EFdG/jfLEFmFuYlAzJu5ptC0=;
 b=i8E41y9b42pDF5e8zWD5AUwyhTuHgy8Qw3aqjAQK8rgQCuKg3jXm40LbebN4/JhowR
 kyDtX+/+/kB26lGzX8ieCP+nwmjoXsdxX99IGFESsIb1yBpP9daEunC9dCihi6RCftcw
 Rdpg1QQReQDdlr7L3f8TTgYi+6T6JkwuQVeBzMVtXMTPUJtoKReG1bMQFV2ujkQbW+LP
 zkfVIrUGiFxUUQGG3j4hIL6Ri7eTv5fgVaIwloM+23zL4UhfjRpLEYtV7ZvQQ5OZzCac
 tH3TONn7SyQyVTTHHdExQy0nEw8vuDuF4vXHGv5L6mB787DnxTy8DLe3IpWD9dAE8eoZ
 RhMg==
X-Gm-Message-State: AOAM530Xdyxp4zq1Z/V/73wCdAyjmVcayXsjbobx8MpDjzkMx/S5Wp5p
 X4Bba6uILZfwZnQ5NhGE7IlFd6MAeI9f91b9nX3fp7MyT6LcrEcM3jiHHD36pBBFN7pP6XiBBjH
 s/oJPCGfUlegse7opz+AhGSNT2xIl7kY7BljlO+9PRQ==
X-Received: by 2002:adf:f58b:: with SMTP id f11mr26486565wro.155.1591103175573; 
 Tue, 02 Jun 2020 06:06:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJk2gPbQL5PIo6tiUhknyXIJdqgEJHs3GNaPHN+6GAAY4cxZnjQts8QfWklgl+QRzL6ncSOg==
X-Received: by 2002:adf:f58b:: with SMTP id f11mr26486535wro.155.1591103175036; 
 Tue, 02 Jun 2020 06:06:15 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 e5sm3853312wrw.19.2020.06.02.06.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 06:06:14 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:06:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 08/13] vhost/net: convert to new API: heads->bufs
Message-ID: <20200602130543.578420-9-mst@redhat.com>
References: <20200602130543.578420-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200602130543.578420-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, netdev@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Convert vhost net to use the new format-agnostic API.
In particular, don't poke at vq internals such as the
heads array.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/net.c | 153 +++++++++++++++++++++++---------------------
 1 file changed, 81 insertions(+), 72 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 749a9cf51a59..47af3d1ce3dd 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -59,13 +59,13 @@ MODULE_PARM_DESC(experimental_zcopytx, "Enable Zero Copy TX;"
  * status internally; used for zerocopy tx only.
  */
 /* Lower device DMA failed */
-#define VHOST_DMA_FAILED_LEN	((__force __virtio32)3)
+#define VHOST_DMA_FAILED_LEN	(3)
 /* Lower device DMA done */
-#define VHOST_DMA_DONE_LEN	((__force __virtio32)2)
+#define VHOST_DMA_DONE_LEN	(2)
 /* Lower device DMA in progress */
-#define VHOST_DMA_IN_PROGRESS	((__force __virtio32)1)
+#define VHOST_DMA_IN_PROGRESS	(1)
 /* Buffer unused */
-#define VHOST_DMA_CLEAR_LEN	((__force __virtio32)0)
+#define VHOST_DMA_CLEAR_LEN	(0)
 
 #define VHOST_DMA_IS_DONE(len) ((__force u32)(len) >= (__force u32)VHOST_DMA_DONE_LEN)
 
@@ -112,9 +112,12 @@ struct vhost_net_virtqueue {
 	/* last used idx for outstanding DMA zerocopy buffers */
 	int upend_idx;
 	/* For TX, first used idx for DMA done zerocopy buffers
-	 * For RX, number of batched heads
+	 * For RX, number of batched bufs
 	 */
 	int done_idx;
+	/* Outstanding user bufs. UIO_MAXIOV in length. */
+	/* TODO: we can make this smaller for sure. */
+	struct vhost_buf *bufs;
 	/* Number of XDP frames batched */
 	int batched_xdp;
 	/* an array of userspace buffers info */
@@ -271,6 +274,8 @@ static void vhost_net_clear_ubuf_info(struct vhost_net *n)
 	int i;
 
 	for (i = 0; i < VHOST_NET_VQ_MAX; ++i) {
+		kfree(n->vqs[i].bufs);
+		n->vqs[i].bufs = NULL;
 		kfree(n->vqs[i].ubuf_info);
 		n->vqs[i].ubuf_info = NULL;
 	}
@@ -282,6 +287,12 @@ static int vhost_net_set_ubuf_info(struct vhost_net *n)
 	int i;
 
 	for (i = 0; i < VHOST_NET_VQ_MAX; ++i) {
+		n->vqs[i].bufs = kmalloc_array(UIO_MAXIOV,
+					       sizeof(*n->vqs[i].bufs),
+					       GFP_KERNEL);
+		if (!n->vqs[i].bufs)
+			goto err;
+
 		zcopy = vhost_net_zcopy_mask & (0x1 << i);
 		if (!zcopy)
 			continue;
@@ -364,18 +375,18 @@ static void vhost_zerocopy_signal_used(struct vhost_net *net,
 	int j = 0;
 
 	for (i = nvq->done_idx; i != nvq->upend_idx; i = (i + 1) % UIO_MAXIOV) {
-		if (vq->heads[i].len == VHOST_DMA_FAILED_LEN)
+		if (nvq->bufs[i].in_len == VHOST_DMA_FAILED_LEN)
 			vhost_net_tx_err(net);
-		if (VHOST_DMA_IS_DONE(vq->heads[i].len)) {
-			vq->heads[i].len = VHOST_DMA_CLEAR_LEN;
+		if (VHOST_DMA_IS_DONE(nvq->bufs[i].in_len)) {
+			nvq->bufs[i].in_len = VHOST_DMA_CLEAR_LEN;
 			++j;
 		} else
 			break;
 	}
 	while (j) {
 		add = min(UIO_MAXIOV - nvq->done_idx, j);
-		vhost_add_used_and_signal_n(vq->dev, vq,
-					    &vq->heads[nvq->done_idx], add);
+		vhost_put_used_n_bufs(vq, &nvq->bufs[nvq->done_idx], add);
+		vhost_signal(vq->dev, vq);
 		nvq->done_idx = (nvq->done_idx + add) % UIO_MAXIOV;
 		j -= add;
 	}
@@ -390,7 +401,7 @@ static void vhost_zerocopy_callback(struct ubuf_info *ubuf, bool success)
 	rcu_read_lock_bh();
 
 	/* set len to mark this desc buffers done DMA */
-	nvq->vq.heads[ubuf->desc].in_len = success ?
+	nvq->bufs[ubuf->desc].in_len = success ?
 		VHOST_DMA_DONE_LEN : VHOST_DMA_FAILED_LEN;
 	cnt = vhost_net_ubuf_put(ubufs);
 
@@ -452,7 +463,8 @@ static void vhost_net_signal_used(struct vhost_net_virtqueue *nvq)
 	if (!nvq->done_idx)
 		return;
 
-	vhost_add_used_and_signal_n(dev, vq, vq->heads, nvq->done_idx);
+	vhost_put_used_n_bufs(vq, nvq->bufs, nvq->done_idx);
+	vhost_signal(dev, vq);
 	nvq->done_idx = 0;
 }
 
@@ -558,6 +570,7 @@ static void vhost_net_busy_poll(struct vhost_net *net,
 
 static int vhost_net_tx_get_vq_desc(struct vhost_net *net,
 				    struct vhost_net_virtqueue *tnvq,
+				    struct vhost_buf *buf,
 				    unsigned int *out_num, unsigned int *in_num,
 				    struct msghdr *msghdr, bool *busyloop_intr)
 {
@@ -565,10 +578,10 @@ static int vhost_net_tx_get_vq_desc(struct vhost_net *net,
 	struct vhost_virtqueue *rvq = &rnvq->vq;
 	struct vhost_virtqueue *tvq = &tnvq->vq;
 
-	int r = vhost_get_vq_desc(tvq, tvq->iov, ARRAY_SIZE(tvq->iov),
-				  out_num, in_num, NULL, NULL);
+	int r = vhost_get_avail_buf(tvq, buf, tvq->iov, ARRAY_SIZE(tvq->iov),
+				    out_num, in_num, NULL, NULL);
 
-	if (r == tvq->num && tvq->busyloop_timeout) {
+	if (!r && tvq->busyloop_timeout) {
 		/* Flush batched packets first */
 		if (!vhost_sock_zcopy(vhost_vq_get_backend(tvq)))
 			vhost_tx_batch(net, tnvq,
@@ -577,8 +590,8 @@ static int vhost_net_tx_get_vq_desc(struct vhost_net *net,
 
 		vhost_net_busy_poll(net, rvq, tvq, busyloop_intr, false);
 
-		r = vhost_get_vq_desc(tvq, tvq->iov, ARRAY_SIZE(tvq->iov),
-				      out_num, in_num, NULL, NULL);
+		r = vhost_get_avail_buf(tvq, buf, tvq->iov, ARRAY_SIZE(tvq->iov),
+					out_num, in_num, NULL, NULL);
 	}
 
 	return r;
@@ -607,6 +620,7 @@ static size_t init_iov_iter(struct vhost_virtqueue *vq, struct iov_iter *iter,
 
 static int get_tx_bufs(struct vhost_net *net,
 		       struct vhost_net_virtqueue *nvq,
+		       struct vhost_buf *buf,
 		       struct msghdr *msg,
 		       unsigned int *out, unsigned int *in,
 		       size_t *len, bool *busyloop_intr)
@@ -614,9 +628,9 @@ static int get_tx_bufs(struct vhost_net *net,
 	struct vhost_virtqueue *vq = &nvq->vq;
 	int ret;
 
-	ret = vhost_net_tx_get_vq_desc(net, nvq, out, in, msg, busyloop_intr);
+	ret = vhost_net_tx_get_vq_desc(net, nvq, buf, out, in, msg, busyloop_intr);
 
-	if (ret < 0 || ret == vq->num)
+	if (ret <= 0)
 		return ret;
 
 	if (*in) {
@@ -761,7 +775,7 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
 	struct vhost_net_virtqueue *nvq = &net->vqs[VHOST_NET_VQ_TX];
 	struct vhost_virtqueue *vq = &nvq->vq;
 	unsigned out, in;
-	int head;
+	int ret;
 	struct msghdr msg = {
 		.msg_name = NULL,
 		.msg_namelen = 0,
@@ -773,6 +787,7 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
 	int err;
 	int sent_pkts = 0;
 	bool sock_can_batch = (sock->sk->sk_sndbuf == INT_MAX);
+	struct vhost_buf buf;
 
 	do {
 		bool busyloop_intr = false;
@@ -780,13 +795,13 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
 		if (nvq->done_idx == VHOST_NET_BATCH)
 			vhost_tx_batch(net, nvq, sock, &msg);
 
-		head = get_tx_bufs(net, nvq, &msg, &out, &in, &len,
-				   &busyloop_intr);
+		ret = get_tx_bufs(net, nvq, &buf, &msg, &out, &in, &len,
+				  &busyloop_intr);
 		/* On error, stop handling until the next kick. */
-		if (unlikely(head < 0))
+		if (unlikely(ret < 0))
 			break;
 		/* Nothing new?  Wait for eventfd to tell us they refilled. */
-		if (head == vq->num) {
+		if (!ret) {
 			if (unlikely(busyloop_intr)) {
 				vhost_poll_queue(&vq->poll);
 			} else if (unlikely(vhost_enable_notify(&net->dev,
@@ -808,7 +823,7 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
 				goto done;
 			} else if (unlikely(err != -ENOSPC)) {
 				vhost_tx_batch(net, nvq, sock, &msg);
-				vhost_discard_vq_desc(vq, 1);
+				vhost_discard_avail_bufs(vq, &buf, 1);
 				vhost_net_enable_vq(net, vq);
 				break;
 			}
@@ -829,7 +844,7 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
 		/* TODO: Check specific error and bomb out unless ENOBUFS? */
 		err = sock->ops->sendmsg(sock, &msg, len);
 		if (unlikely(err < 0)) {
-			vhost_discard_vq_desc(vq, 1);
+			vhost_discard_avail_bufs(vq, &buf, 1);
 			vhost_net_enable_vq(net, vq);
 			break;
 		}
@@ -837,8 +852,7 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
 			pr_debug("Truncated TX packet: len %d != %zd\n",
 				 err, len);
 done:
-		vq->heads[nvq->done_idx].id = cpu_to_vhost32(vq, head);
-		vq->heads[nvq->done_idx].len = 0;
+		nvq->bufs[nvq->done_idx] = buf;
 		++nvq->done_idx;
 	} while (likely(!vhost_exceeds_weight(vq, ++sent_pkts, total_len)));
 
@@ -850,7 +864,7 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 	struct vhost_net_virtqueue *nvq = &net->vqs[VHOST_NET_VQ_TX];
 	struct vhost_virtqueue *vq = &nvq->vq;
 	unsigned out, in;
-	int head;
+	int ret;
 	struct msghdr msg = {
 		.msg_name = NULL,
 		.msg_namelen = 0,
@@ -864,6 +878,7 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 	struct vhost_net_ubuf_ref *uninitialized_var(ubufs);
 	bool zcopy_used;
 	int sent_pkts = 0;
+	struct vhost_buf buf;
 
 	do {
 		bool busyloop_intr;
@@ -872,13 +887,13 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 		vhost_zerocopy_signal_used(net, vq);
 
 		busyloop_intr = false;
-		head = get_tx_bufs(net, nvq, &msg, &out, &in, &len,
-				   &busyloop_intr);
+		ret = get_tx_bufs(net, nvq, &buf, &msg, &out, &in, &len,
+				  &busyloop_intr);
 		/* On error, stop handling until the next kick. */
-		if (unlikely(head < 0))
+		if (unlikely(ret < 0))
 			break;
 		/* Nothing new?  Wait for eventfd to tell us they refilled. */
-		if (head == vq->num) {
+		if (!ret) {
 			if (unlikely(busyloop_intr)) {
 				vhost_poll_queue(&vq->poll);
 			} else if (unlikely(vhost_enable_notify(&net->dev, vq))) {
@@ -897,8 +912,8 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 			struct ubuf_info *ubuf;
 			ubuf = nvq->ubuf_info + nvq->upend_idx;
 
-			vq->heads[nvq->upend_idx].id = cpu_to_vhost32(vq, head);
-			vq->heads[nvq->upend_idx].len = VHOST_DMA_IN_PROGRESS;
+			nvq->bufs[nvq->upend_idx] = buf;
+			nvq->bufs[nvq->upend_idx].in_len = VHOST_DMA_IN_PROGRESS;
 			ubuf->callback = vhost_zerocopy_callback;
 			ubuf->ctx = nvq->ubufs;
 			ubuf->desc = nvq->upend_idx;
@@ -930,17 +945,19 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 				nvq->upend_idx = ((unsigned)nvq->upend_idx - 1)
 					% UIO_MAXIOV;
 			}
-			vhost_discard_vq_desc(vq, 1);
+			vhost_discard_avail_bufs(vq, &buf, 1);
 			vhost_net_enable_vq(net, vq);
 			break;
 		}
 		if (err != len)
 			pr_debug("Truncated TX packet: "
 				 " len %d != %zd\n", err, len);
-		if (!zcopy_used)
-			vhost_add_used_and_signal(&net->dev, vq, head, 0);
-		else
+		if (!zcopy_used) {
+			vhost_put_used_buf(vq, &buf);
+			vhost_signal(&net->dev, vq);
+		} else {
 			vhost_zerocopy_signal_used(net, vq);
+		}
 		vhost_net_tx_packet(net);
 	} while (likely(!vhost_exceeds_weight(vq, ++sent_pkts, total_len)));
 }
@@ -1004,7 +1021,7 @@ static int vhost_net_rx_peek_head_len(struct vhost_net *net, struct sock *sk,
 	int len = peek_head_len(rnvq, sk);
 
 	if (!len && rvq->busyloop_timeout) {
-		/* Flush batched heads first */
+		/* Flush batched bufs first */
 		vhost_net_signal_used(rnvq);
 		/* Both tx vq and rx socket were polled here */
 		vhost_net_busy_poll(net, rvq, tvq, busyloop_intr, true);
@@ -1022,11 +1039,11 @@ static int vhost_net_rx_peek_head_len(struct vhost_net *net, struct sock *sk,
  * @iovcount	- returned count of io vectors we fill
  * @log		- vhost log
  * @log_num	- log offset
- * @quota       - headcount quota, 1 for big buffer
- *	returns number of buffer heads allocated, negative on error
+ * @quota       - bufcount quota, 1 for big buffer
+ *	returns number of buffers allocated, negative on error
  */
 static int get_rx_bufs(struct vhost_virtqueue *vq,
-		       struct vring_used_elem *heads,
+		       struct vhost_buf *bufs,
 		       int datalen,
 		       unsigned *iovcount,
 		       struct vhost_log *log,
@@ -1035,30 +1052,24 @@ static int get_rx_bufs(struct vhost_virtqueue *vq,
 {
 	unsigned int out, in;
 	int seg = 0;
-	int headcount = 0;
-	unsigned d;
+	int bufcount = 0;
 	int r, nlogs = 0;
 	/* len is always initialized before use since we are always called with
 	 * datalen > 0.
 	 */
 	u32 uninitialized_var(len);
 
-	while (datalen > 0 && headcount < quota) {
+	while (datalen > 0 && bufcount < quota) {
 		if (unlikely(seg >= UIO_MAXIOV)) {
 			r = -ENOBUFS;
 			goto err;
 		}
-		r = vhost_get_vq_desc(vq, vq->iov + seg,
-				      ARRAY_SIZE(vq->iov) - seg, &out,
-				      &in, log, log_num);
-		if (unlikely(r < 0))
+		r = vhost_get_avail_buf(vq, bufs + bufcount, vq->iov + seg,
+					ARRAY_SIZE(vq->iov) - seg, &out,
+					&in, log, log_num);
+		if (unlikely(r <= 0))
 			goto err;
 
-		d = r;
-		if (d == vq->num) {
-			r = 0;
-			goto err;
-		}
 		if (unlikely(out || in <= 0)) {
 			vq_err(vq, "unexpected descriptor format for RX: "
 				"out %d, in %d\n", out, in);
@@ -1069,14 +1080,12 @@ static int get_rx_bufs(struct vhost_virtqueue *vq,
 			nlogs += *log_num;
 			log += *log_num;
 		}
-		heads[headcount].id = cpu_to_vhost32(vq, d);
 		len = iov_length(vq->iov + seg, in);
-		heads[headcount].len = cpu_to_vhost32(vq, len);
 		datalen -= len;
-		++headcount;
+		++bufcount;
 		seg += in;
 	}
-	heads[headcount - 1].len = cpu_to_vhost32(vq, len + datalen);
+	bufs[bufcount - 1].in_len = len + datalen;
 	*iovcount = seg;
 	if (unlikely(log))
 		*log_num = nlogs;
@@ -1086,9 +1095,9 @@ static int get_rx_bufs(struct vhost_virtqueue *vq,
 		r = UIO_MAXIOV + 1;
 		goto err;
 	}
-	return headcount;
+	return bufcount;
 err:
-	vhost_discard_vq_desc(vq, headcount);
+	vhost_discard_avail_bufs(vq, bufs, bufcount);
 	return r;
 }
 
@@ -1113,7 +1122,7 @@ static void handle_rx(struct vhost_net *net)
 	};
 	size_t total_len = 0;
 	int err, mergeable;
-	s16 headcount;
+	int bufcount;
 	size_t vhost_hlen, sock_hlen;
 	size_t vhost_len, sock_len;
 	bool busyloop_intr = false;
@@ -1147,14 +1156,14 @@ static void handle_rx(struct vhost_net *net)
 			break;
 		sock_len += sock_hlen;
 		vhost_len = sock_len + vhost_hlen;
-		headcount = get_rx_bufs(vq, vq->heads + nvq->done_idx,
-					vhost_len, &in, vq_log, &log,
-					likely(mergeable) ? UIO_MAXIOV : 1);
+		bufcount = get_rx_bufs(vq, nvq->bufs + nvq->done_idx,
+				       vhost_len, &in, vq_log, &log,
+				       likely(mergeable) ? UIO_MAXIOV : 1);
 		/* On error, stop handling until the next kick. */
-		if (unlikely(headcount < 0))
+		if (unlikely(bufcount < 0))
 			goto out;
 		/* OK, now we need to know about added descriptors. */
-		if (!headcount) {
+		if (!bufcount) {
 			if (unlikely(busyloop_intr)) {
 				vhost_poll_queue(&vq->poll);
 			} else if (unlikely(vhost_enable_notify(&net->dev, vq))) {
@@ -1171,7 +1180,7 @@ static void handle_rx(struct vhost_net *net)
 		if (nvq->rx_ring)
 			msg.msg_control = vhost_net_buf_consume(&nvq->rxq);
 		/* On overrun, truncate and discard */
-		if (unlikely(headcount > UIO_MAXIOV)) {
+		if (unlikely(bufcount > UIO_MAXIOV)) {
 			iov_iter_init(&msg.msg_iter, READ, vq->iov, 1, 1);
 			err = sock->ops->recvmsg(sock, &msg,
 						 1, MSG_DONTWAIT | MSG_TRUNC);
@@ -1195,7 +1204,7 @@ static void handle_rx(struct vhost_net *net)
 		if (unlikely(err != sock_len)) {
 			pr_debug("Discarded rx packet: "
 				 " len %d, expected %zd\n", err, sock_len);
-			vhost_discard_vq_desc(vq, headcount);
+			vhost_discard_avail_bufs(vq, nvq->bufs + nvq->done_idx, bufcount);
 			continue;
 		}
 		/* Supply virtio_net_hdr if VHOST_NET_F_VIRTIO_NET_HDR */
@@ -1214,15 +1223,15 @@ static void handle_rx(struct vhost_net *net)
 		}
 		/* TODO: Should check and handle checksum. */
 
-		num_buffers = cpu_to_vhost16(vq, headcount);
+		num_buffers = cpu_to_vhost16(vq, bufcount);
 		if (likely(mergeable) &&
 		    copy_to_iter(&num_buffers, sizeof num_buffers,
 				 &fixup) != sizeof num_buffers) {
 			vq_err(vq, "Failed num_buffers write");
-			vhost_discard_vq_desc(vq, headcount);
+			vhost_discard_avail_bufs(vq, nvq->bufs + nvq->done_idx, bufcount);
 			goto out;
 		}
-		nvq->done_idx += headcount;
+		nvq->done_idx += bufcount;
 		if (nvq->done_idx > VHOST_NET_BATCH)
 			vhost_net_signal_used(nvq);
 		if (unlikely(vq_log))
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
