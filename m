Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9750E3AC89B
	for <lists.virtualization@lfdr.de>; Fri, 18 Jun 2021 12:14:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1226183CA3;
	Fri, 18 Jun 2021 10:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mewLOMQ5af8A; Fri, 18 Jun 2021 10:14:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 74E4E83C4E;
	Fri, 18 Jun 2021 10:14:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF96BC000B;
	Fri, 18 Jun 2021 10:14:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3897C000B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 10:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D59E76061D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 10:14:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cLgEdqtEt1GK
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 10:14:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92926605E5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 10:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624011242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PG9kQEO0Xvlq67gCKJvol3+2bzvTWPsNHeGxPNvocdU=;
 b=FkxPMW+tRtNBsK/NtG/ZBNOd4qrscQoOGfnwpEApQtnCk14RiC6Bdy2AVr9CI/6Tt3LrkL
 5fzDyxh92PODUeG/z+/1z3uZTlxTaXsPzU9frgQmZPrkF8QfY79evvXTInHGZ33DiA85t6
 DkTCXfxMT/nl7fb908e7GFeKnHrax7A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-J9iJIpxAOreFK_XtS0KtlQ-1; Fri, 18 Jun 2021 06:14:01 -0400
X-MC-Unique: J9iJIpxAOreFK_XtS0KtlQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 t11-20020a056402524bb029038ffacf1cafso3292732edd.5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 03:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PG9kQEO0Xvlq67gCKJvol3+2bzvTWPsNHeGxPNvocdU=;
 b=iL2SQqV16rlha+OwDGoMOg/YGxuj69yw3AWsK0yOGV8F74/H9UpHV8gX4P0D4FVknA
 pE0aHl15NcyR5QQj5Ev5BXGn6Vwx7hkgqyVxUVdJMflFSZB3QAeo8bJvYij73LvsFeNd
 Gp7PvZWjNkka5zU9EOc4yIhiOiIMhvlSyuh24bYnN6uoSLBgZJu7GYFY/jTgpFOBJSFc
 AeG36SIikgUNstrAcHHALflWIyBORRpC2WpVNDe/LjzS4EzQ2fBnTuaKzuxu0JYRHA8B
 JL5jf4CIeno7YP5kRJGZ0qlS4IIk0Q2sJYRB1TAW6BT8S4TU/5/fvyQofCR7zWcZXlpX
 LI/A==
X-Gm-Message-State: AOAM531SOb2YIfbcmg8hoANxDWxBSSd2r3qPsKAWjHBUJj1tHt2o509W
 H4x3uKciRPJLrMOcssqury0vu6kDYb5vyg5ka7blaKOIO8bikDZS/BD+wB7FGmeCyxnZOE/kLC4
 r5IavKeT2luz+FHTX4HdMsDYzugRA03w0jpdMKI8QDQ==
X-Received: by 2002:a17:906:b0c4:: with SMTP id
 bk4mr10319595ejb.422.1624011240120; 
 Fri, 18 Jun 2021 03:14:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqjx7l+1ie57Zelg2AaVQNWLm5swn6bzW9IM0lFThnJqtVK8Qpe1Tm8x770ilNnat6wEqWmg==
X-Received: by 2002:a17:906:b0c4:: with SMTP id
 bk4mr10319580ejb.422.1624011239917; 
 Fri, 18 Jun 2021 03:13:59 -0700 (PDT)
Received: from steredhat.lan ([5.170.128.252])
 by smtp.gmail.com with ESMTPSA id i26sm6010735edq.54.2021.06.18.03.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 03:13:59 -0700 (PDT)
Date: Fri, 18 Jun 2021 12:13:54 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jiang Wang <jiang.wang@bytedance.com>
Subject: Re: [RFC v1 3/6] vhost/vsock: add support for vhost dgram.
Message-ID: <20210618101354.nucgcghnjxoxrame@steredhat.lan>
References: <20210609232501.171257-1-jiang.wang@bytedance.com>
 <20210609232501.171257-4-jiang.wang@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210609232501.171257-4-jiang.wang@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: cong.wang@bytedance.com, Andra Paraschiv <andraprs@amazon.com>,
 kvm@vger.kernel.org, mst@redhat.com, virtualization@lists.linux-foundation.org,
 Norbert Slusarek <nslusarek@gmx.net>, jhansen@vmware.comments,
 duanxiongchun@bytedance.com, Jeff Vander Stoep <jeffv@google.com>,
 xieyongji@bytedance.com, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Alexander Popov <alex.popov@linux.com>,
 Steven Rostedt <rostedt@goodmis.org>, chaiwen.cc@bytedance.com,
 stefanha@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Colin Ian King <colin.king@canonical.com>, arseny.krasnov@kaspersky.com,
 "David S. Miller" <davem@davemloft.net>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

We should use le16_to_cpu when accessing pkt->hdr fields.

On Wed, Jun 09, 2021 at 11:24:55PM +0000, Jiang Wang wrote:
>This patch supports dgram on vhost side, including
>tx and rx. The vhost send packets asynchronously.
>
>Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
>---
> drivers/vhost/vsock.c | 199 +++++++++++++++++++++++++++++++++++++++++++-------
> 1 file changed, 173 insertions(+), 26 deletions(-)
>
>diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
>index 81d064601093..d366463be6d4 100644
>--- a/drivers/vhost/vsock.c
>+++ b/drivers/vhost/vsock.c
>@@ -28,7 +28,10 @@
>  * small pkts.
>  */
> #define VHOST_VSOCK_PKT_WEIGHT 256
>+#define VHOST_VSOCK_DGRM_MAX_PENDING_PKT 128
>
>+/* Max wait time in busy poll in microseconds */
>+#define VHOST_VSOCK_BUSY_POLL_TIMEOUT 20
> enum {
> 	VHOST_VSOCK_FEATURES = VHOST_FEATURES |
> 			       (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
>@@ -45,7 +48,7 @@ static DEFINE_READ_MOSTLY_HASHTABLE(vhost_vsock_hash, 8);
>
> struct vhost_vsock {
> 	struct vhost_dev dev;
>-	struct vhost_virtqueue vqs[2];
>+	struct vhost_virtqueue vqs[4];
>
> 	/* Link to global vhost_vsock_hash, writes use vhost_vsock_mutex */
> 	struct hlist_node hash;
>@@ -54,6 +57,11 @@ struct vhost_vsock {
> 	spinlock_t send_pkt_list_lock;
> 	struct list_head send_pkt_list;	/* host->guest pending packets */
>
>+	spinlock_t dgram_send_pkt_list_lock;
>+	struct list_head dgram_send_pkt_list;	/* host->guest pending packets */
>+	struct vhost_work dgram_send_pkt_work;
>+	int  dgram_used; /*pending packets to be send */
>+
> 	atomic_t queued_replies;
>
> 	u32 guest_cid;
>@@ -90,10 +98,22 @@ static void
> vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 			    struct vhost_virtqueue *vq)
> {
>-	struct vhost_virtqueue *tx_vq = &vsock->vqs[VSOCK_VQ_TX];
>+	struct vhost_virtqueue *tx_vq;
> 	int pkts = 0, total_len = 0;
> 	bool added = false;
> 	bool restart_tx = false;
>+	spinlock_t *lock;
>+	struct list_head *send_pkt_list;
>+
>+	if (vq == &vsock->vqs[VSOCK_VQ_RX]) {
>+		tx_vq = &vsock->vqs[VSOCK_VQ_TX];
>+		lock = &vsock->send_pkt_list_lock;
>+		send_pkt_list = &vsock->send_pkt_list;
>+	} else {
>+		tx_vq = &vsock->vqs[VSOCK_VQ_DGRAM_TX];
>+		lock = &vsock->dgram_send_pkt_list_lock;
>+		send_pkt_list = &vsock->dgram_send_pkt_list;
>+	}
>
> 	mutex_lock(&vq->mutex);
>
>@@ -113,36 +133,48 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 		size_t nbytes;
> 		size_t iov_len, payload_len;
> 		int head;
>+		bool is_dgram = false;
>
>-		spin_lock_bh(&vsock->send_pkt_list_lock);
>-		if (list_empty(&vsock->send_pkt_list)) {
>-			spin_unlock_bh(&vsock->send_pkt_list_lock);
>+		spin_lock_bh(lock);
>+		if (list_empty(send_pkt_list)) {
>+			spin_unlock_bh(lock);
> 			vhost_enable_notify(&vsock->dev, vq);
> 			break;
> 		}
>
>-		pkt = list_first_entry(&vsock->send_pkt_list,
>+		pkt = list_first_entry(send_pkt_list,
> 				       struct virtio_vsock_pkt, list);
> 		list_del_init(&pkt->list);
>-		spin_unlock_bh(&vsock->send_pkt_list_lock);
>+		spin_unlock_bh(lock);
>+
>+		if (pkt->hdr.type == VIRTIO_VSOCK_TYPE_DGRAM)
                     ^
                     le16_to_cpu(pkt->hdr.type)

>+			is_dgram = true;
>
> 		head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
> 					 &out, &in, NULL, NULL);
> 		if (head < 0) {
>-			spin_lock_bh(&vsock->send_pkt_list_lock);
>-			list_add(&pkt->list, &vsock->send_pkt_list);
>-			spin_unlock_bh(&vsock->send_pkt_list_lock);
>+			spin_lock_bh(lock);
>+			list_add(&pkt->list, send_pkt_list);
>+			spin_unlock_bh(lock);
> 			break;
> 		}
>
> 		if (head == vq->num) {
>-			spin_lock_bh(&vsock->send_pkt_list_lock);
>-			list_add(&pkt->list, &vsock->send_pkt_list);
>-			spin_unlock_bh(&vsock->send_pkt_list_lock);
>+			if (is_dgram) {
>+				virtio_transport_free_pkt(pkt);
>+				vq_err(vq, "Dgram virtqueue is full!");
>+				spin_lock_bh(lock);
>+				vsock->dgram_used--;
>+				spin_unlock_bh(lock);
>+				break;
>+			}
>+			spin_lock_bh(lock);
>+			list_add(&pkt->list, send_pkt_list);
>+			spin_unlock_bh(lock);
>
> 			/* We cannot finish yet if more buffers snuck in while
>-			 * re-enabling notify.
>-			 */
>+			* re-enabling notify.
>+			*/
> 			if (unlikely(vhost_enable_notify(&vsock->dev, vq))) {
> 				vhost_disable_notify(&vsock->dev, vq);
> 				continue;
>@@ -153,6 +185,12 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 		if (out) {
> 			virtio_transport_free_pkt(pkt);
> 			vq_err(vq, "Expected 0 output buffers, got %u\n", out);
>+			if (is_dgram) {
>+				spin_lock_bh(lock);
>+				vsock->dgram_used--;
>+				spin_unlock_bh(lock);
>+			}
>+
> 			break;
> 		}
>
>@@ -160,6 +198,18 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 		if (iov_len < sizeof(pkt->hdr)) {
> 			virtio_transport_free_pkt(pkt);
> 			vq_err(vq, "Buffer len [%zu] too small\n", iov_len);
>+			if (is_dgram) {
>+				spin_lock_bh(lock);
>+				vsock->dgram_used--;
>+				spin_unlock_bh(lock);
>+			}
>+			break;
>+		}
>+
>+		if (iov_len < pkt->len - pkt->off &&
>+			vq == &vsock->vqs[VSOCK_VQ_DGRAM_RX]) {
>+			virtio_transport_free_pkt(pkt);
>+			vq_err(vq, "Buffer len [%zu] too small for dgram\n", iov_len);
> 			break;
> 		}
>
>@@ -179,6 +229,11 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 		if (nbytes != sizeof(pkt->hdr)) {
> 			virtio_transport_free_pkt(pkt);
> 			vq_err(vq, "Faulted on copying pkt hdr\n");
>+			if (is_dgram) {
>+				spin_lock_bh(lock);
>+				vsock->dgram_used--;
>+				spin_unlock_bh(lock);
>+			}
> 			break;
> 		}
>
>@@ -204,16 +259,17 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 		/* If we didn't send all the payload we can requeue the packet
> 		 * to send it with the next available buffer.
> 		 */
>-		if (pkt->off < pkt->len) {
>+		if ((pkt->off < pkt->len)
>+			&& (vq == &vsock->vqs[VSOCK_VQ_RX])) {
> 			/* We are queueing the same virtio_vsock_pkt to handle
> 			 * the remaining bytes, and we want to deliver it
> 			 * to monitoring devices in the next iteration.
> 			 */
> 			pkt->tap_delivered = false;
>
>-			spin_lock_bh(&vsock->send_pkt_list_lock);
>-			list_add(&pkt->list, &vsock->send_pkt_list);
>-			spin_unlock_bh(&vsock->send_pkt_list_lock);
>+			spin_lock_bh(lock);
>+			list_add(&pkt->list, send_pkt_list);
>+			spin_unlock_bh(lock);
> 		} else {
> 			if (pkt->reply) {
> 				int val;
>@@ -228,6 +284,11 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 			}
>
> 			virtio_transport_free_pkt(pkt);
>+			if (is_dgram) {
>+				spin_lock_bh(lock);
>+				vsock->dgram_used--;
>+				spin_unlock_bh(lock);
>+			}
> 		}
> 	} while(likely(!vhost_exceeds_weight(vq, ++pkts, total_len)));
> 	if (added)
>@@ -251,11 +312,25 @@ static void vhost_transport_send_pkt_work(struct vhost_work *work)
> 	vhost_transport_do_send_pkt(vsock, vq);
> }
>
>+static void vhost_transport_dgram_send_pkt_work(struct vhost_work *work)
>+{
>+	struct vhost_virtqueue *vq;
>+	struct vhost_vsock *vsock;
>+
>+	vsock = container_of(work, struct vhost_vsock, dgram_send_pkt_work);
>+	vq = &vsock->vqs[VSOCK_VQ_DGRAM_RX];
>+
>+	vhost_transport_do_send_pkt(vsock, vq);
>+}
>+
> static int
> vhost_transport_send_pkt(struct virtio_vsock_pkt *pkt)
> {
> 	struct vhost_vsock *vsock;
> 	int len = pkt->len;
>+	spinlock_t *lock;
>+	struct list_head *send_pkt_list;
>+	struct vhost_work *work;
>
> 	rcu_read_lock();
>
>@@ -267,14 +342,38 @@ vhost_transport_send_pkt(struct virtio_vsock_pkt *pkt)
> 		return -ENODEV;
> 	}
>
>+	if (pkt->hdr.type == VIRTIO_VSOCK_TYPE_STREAM) {
             ^
             le16_to_cpu(pkt->hdr.type)
>+		lock = &vsock->send_pkt_list_lock;
>+		send_pkt_list = &vsock->send_pkt_list;
>+		work = &vsock->send_pkt_work;
>+	} else if (pkt->hdr.type == VIRTIO_VSOCK_TYPE_DGRAM) {
                    ^
                    le16_to_cpu(pkt->hdr.type)
>+		lock = &vsock->dgram_send_pkt_list_lock;
>+		send_pkt_list = &vsock->dgram_send_pkt_list;
>+		work = &vsock->dgram_send_pkt_work;
>+	} else {
>+		rcu_read_unlock();
>+		virtio_transport_free_pkt(pkt);
>+		return -EINVAL;
>+	}
>+
>+
> 	if (pkt->reply)
> 		atomic_inc(&vsock->queued_replies);
>
>-	spin_lock_bh(&vsock->send_pkt_list_lock);
>-	list_add_tail(&pkt->list, &vsock->send_pkt_list);
>-	spin_unlock_bh(&vsock->send_pkt_list_lock);
>+	spin_lock_bh(lock);
>+	if (pkt->hdr.type == VIRTIO_VSOCK_TYPE_DGRAM) {
             ^
             le16_to_cpu(pkt->hdr.type)
>+		if (vsock->dgram_used  == VHOST_VSOCK_DGRM_MAX_PENDING_PKT)
>+			len = -ENOMEM;
>+		else {
>+			vsock->dgram_used++;
>+			list_add_tail(&pkt->list, send_pkt_list);
>+		}
>+	} else
>+		list_add_tail(&pkt->list, send_pkt_list);
>
>-	vhost_work_queue(&vsock->dev, &vsock->send_pkt_work);
>+	spin_unlock_bh(lock);
>+
>+	vhost_work_queue(&vsock->dev, work);
>
> 	rcu_read_unlock();
> 	return len;
>@@ -355,7 +454,8 @@ vhost_vsock_alloc_pkt(struct vhost_virtqueue *vq,
> 		return NULL;
> 	}
>
>-	if (le16_to_cpu(pkt->hdr.type) == VIRTIO_VSOCK_TYPE_STREAM)
>+	if (le16_to_cpu(pkt->hdr.type) == VIRTIO_VSOCK_TYPE_STREAM
>+		|| le16_to_cpu(pkt->hdr.type) == VIRTIO_VSOCK_TYPE_DGRAM)
> 		pkt->len = le32_to_cpu(pkt->hdr.len);
>
> 	/* No payload */
>@@ -442,6 +542,18 @@ static struct virtio_transport vhost_transport = {
> 	.send_pkt = vhost_transport_send_pkt,
> };
>
>+static inline unsigned long busy_clock(void)
>+{
>+	return local_clock() >> 10;
>+}
>+
>+static bool vhost_can_busy_poll(unsigned long endtime)
>+{
>+	return likely(!need_resched() && !time_after(busy_clock(), endtime) &&
>+		      !signal_pending(current));
>+}
>+
>+
> static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> {
> 	struct vhost_virtqueue *vq = container_of(work, struct vhost_virtqueue,
>@@ -452,6 +564,8 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> 	int head, pkts = 0, total_len = 0;
> 	unsigned int out, in;
> 	bool added = false;
>+	unsigned long busyloop_timeout = VHOST_VSOCK_BUSY_POLL_TIMEOUT;
>+	unsigned long endtime;
>
> 	mutex_lock(&vq->mutex);
>
>@@ -461,11 +575,14 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> 	if (!vq_meta_prefetch(vq))
> 		goto out;
>
>+	endtime = busy_clock() + busyloop_timeout;
> 	vhost_disable_notify(&vsock->dev, vq);
>+	preempt_disable();
> 	do {
> 		u32 len;
>
>-		if (!vhost_vsock_more_replies(vsock)) {
>+		if (vq == &vsock->vqs[VSOCK_VQ_TX]
>+			&& !vhost_vsock_more_replies(vsock)) {
> 			/* Stop tx until the device processes already
> 			 * pending replies.  Leave tx virtqueue
> 			 * callbacks disabled.
>@@ -479,6 +596,11 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> 			break;
>
> 		if (head == vq->num) {
>+			if (vhost_can_busy_poll(endtime)) {
>+				cpu_relax();
>+				continue;
>+			}
>+
> 			if (unlikely(vhost_enable_notify(&vsock->dev, vq))) {
> 				vhost_disable_notify(&vsock->dev, vq);
> 				continue;
>@@ -510,6 +632,7 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> 		total_len += len;
> 		added = true;
> 	} while(likely(!vhost_exceeds_weight(vq, ++pkts, total_len)));
>+	preempt_enable();
>
> no_more_replies:
> 	if (added)
>@@ -565,6 +688,7 @@ static int vhost_vsock_start(struct vhost_vsock *vsock)
> 	 * let's kick the send worker to send them.
> 	 */
> 	vhost_work_queue(&vsock->dev, &vsock->send_pkt_work);
>+	vhost_work_queue(&vsock->dev, &vsock->dgram_send_pkt_work);
>
> 	mutex_unlock(&vsock->dev.mutex);
> 	return 0;
>@@ -639,8 +763,14 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
>
> 	vqs[VSOCK_VQ_TX] = &vsock->vqs[VSOCK_VQ_TX];
> 	vqs[VSOCK_VQ_RX] = &vsock->vqs[VSOCK_VQ_RX];
>+	vqs[VSOCK_VQ_DGRAM_TX] = &vsock->vqs[VSOCK_VQ_DGRAM_TX];
>+	vqs[VSOCK_VQ_DGRAM_RX] = &vsock->vqs[VSOCK_VQ_DGRAM_RX];
> 	vsock->vqs[VSOCK_VQ_TX].handle_kick = vhost_vsock_handle_tx_kick;
> 	vsock->vqs[VSOCK_VQ_RX].handle_kick = vhost_vsock_handle_rx_kick;
>+	vsock->vqs[VSOCK_VQ_DGRAM_TX].handle_kick =
>+						vhost_vsock_handle_tx_kick;
>+	vsock->vqs[VSOCK_VQ_DGRAM_RX].handle_kick =
>+						vhost_vsock_handle_rx_kick;
>
> 	vhost_dev_init(&vsock->dev, vqs, ARRAY_SIZE(vsock->vqs),
> 		       UIO_MAXIOV, VHOST_VSOCK_PKT_WEIGHT,
>@@ -650,6 +780,11 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
> 	spin_lock_init(&vsock->send_pkt_list_lock);
> 	INIT_LIST_HEAD(&vsock->send_pkt_list);
> 	vhost_work_init(&vsock->send_pkt_work, vhost_transport_send_pkt_work);
>+	spin_lock_init(&vsock->dgram_send_pkt_list_lock);
>+	INIT_LIST_HEAD(&vsock->dgram_send_pkt_list);
>+	vhost_work_init(&vsock->dgram_send_pkt_work,
>+			vhost_transport_dgram_send_pkt_work);
>+
> 	return 0;
>
> out:
>@@ -665,6 +800,7 @@ static void vhost_vsock_flush(struct vhost_vsock *vsock)
> 		if (vsock->vqs[i].handle_kick)
> 			vhost_poll_flush(&vsock->vqs[i].poll);
> 	vhost_work_flush(&vsock->dev, &vsock->send_pkt_work);
>+	vhost_work_flush(&vsock->dev, &vsock->dgram_send_pkt_work);
> }
>
> static void vhost_vsock_reset_orphans(struct sock *sk)
>@@ -724,6 +860,17 @@ static int vhost_vsock_dev_release(struct inode *inode, struct file *file)
> 	}
> 	spin_unlock_bh(&vsock->send_pkt_list_lock);
>
>+	spin_lock_bh(&vsock->dgram_send_pkt_list_lock);
>+	while (!list_empty(&vsock->dgram_send_pkt_list)) {
>+		struct virtio_vsock_pkt *pkt;
>+
>+		pkt = list_first_entry(&vsock->dgram_send_pkt_list,
>+				struct virtio_vsock_pkt, list);
>+		list_del_init(&pkt->list);
>+		virtio_transport_free_pkt(pkt);
>+	}
>+	spin_unlock_bh(&vsock->dgram_send_pkt_list_lock);
>+
> 	vhost_dev_cleanup(&vsock->dev);
> 	kfree(vsock->dev.vqs);
> 	vhost_vsock_free(vsock);
>@@ -906,7 +1053,7 @@ static int __init vhost_vsock_init(void)
> 	int ret;
>
> 	ret = vsock_core_register(&vhost_transport.transport,
>-				  VSOCK_TRANSPORT_F_H2G);
>+				  VSOCK_TRANSPORT_F_H2G | VSOCK_TRANSPORT_F_DGRAM);
> 	if (ret < 0)
> 		return ret;
> 	return misc_register(&vhost_vsock_misc);
>-- 
>2.11.0
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
