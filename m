Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4135C7A069B
	for <lists.virtualization@lfdr.de>; Thu, 14 Sep 2023 15:57:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 330F240237;
	Thu, 14 Sep 2023 13:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 330F240237
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QcT36d1n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKsSFFvmIKCO; Thu, 14 Sep 2023 13:57:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EC1A3401FA;
	Thu, 14 Sep 2023 13:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC1A3401FA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 282B7C008C;
	Thu, 14 Sep 2023 13:57:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37EE3C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Sep 2023 13:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0624E40A75
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Sep 2023 13:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0624E40A75
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=QcT36d1n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Qn5tiRH151m
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Sep 2023 13:57:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 896C840452
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Sep 2023 13:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 896C840452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694699867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=flg639du+2k4tM1dEfTVTl2ET/v2s+45oG8YhE/YvXM=;
 b=QcT36d1nIh6wL1Ej10MWD7/AnJwfyMx7Zvx1C8aIZNLr9gj+dHvKWCJpvshl3CvdPhTfWA
 ugQHsGVcPeBGFVNM4Vdu3Paly/+5MnY+MkqLg8i2QKMcmfNkTfr2yBTWP/zNnWU4sq9Z0T
 S25qme8CImv3TBobOE50SnqJCtcyODo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-z4EGLxrtP3ulphsKSWbUdQ-1; Thu, 14 Sep 2023 09:57:43 -0400
X-MC-Unique: z4EGLxrtP3ulphsKSWbUdQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f5df65fa35so7372825e9.3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Sep 2023 06:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694699862; x=1695304662;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=flg639du+2k4tM1dEfTVTl2ET/v2s+45oG8YhE/YvXM=;
 b=C+IpfLvsYXgSp1pbN+FNy3sbfTaCmQZEi7SHWdE7wqXqAmCkoYgY0wAlDQvMJ7mUU4
 N5iNuqyhoay1hhA7lVPiandbX1WTE6rJGgx9REM7JNR+CDzP5C2kh62oH26n1q8gXx5v
 S1NQBDGrtAaqiRwH05OEoHFw6v8Ga++2ghaT7puz/o/h4XAes0xo2BP5qH0Ll9p4zJAc
 E4GtFNkjPf8tKwtV3a0KBlaOp2opsOuO26fr2JjG/LUnr/4eqCORQ+7hsDdkrbMbNhoG
 QDgmtpULVnPy9ECimRX6zZtUhkk8TiViB51MLHDO7FoG03YZ0y3wepo1OKLkyj50D5K/
 qiFw==
X-Gm-Message-State: AOJu0YwQ4eRvx0sEClQPPN1/QX6Jg5qjzLLHQ4gcY1Sk0bU0dGpNuWsQ
 Mi77DaRjz38uUU9w2hzdy6HWIh6Ja2ZdxNGATMsl1R7MpSM8YbvFJCuLgEAemYlwfl52gzBCS+b
 qsf/cAY57WTzjQf4Soq8y6yVTibBI4/jUDNmFTEoUQw==
X-Received: by 2002:a1c:6a18:0:b0:3fe:5053:1a0b with SMTP id
 f24-20020a1c6a18000000b003fe50531a0bmr4997857wmc.11.1694699862620; 
 Thu, 14 Sep 2023 06:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY85WXseZo6GqnVYh6Kpp7IEBdwHYOK+DLqZI3ots3l+MM77fO8sW4+pOzJViEK6e6yTl4bw==
X-Received: by 2002:a1c:6a18:0:b0:3fe:5053:1a0b with SMTP id
 f24-20020a1c6a18000000b003fe50531a0bmr4997835wmc.11.1694699862136; 
 Thu, 14 Sep 2023 06:57:42 -0700 (PDT)
Received: from sgarzare-redhat ([46.222.114.183])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a05600c294c00b003fee777fd84sm2029742wmd.41.2023.09.14.06.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 06:57:41 -0700 (PDT)
Date: Thu, 14 Sep 2023 15:57:35 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: Re: [PATCH net-next v8 4/4] vsock/virtio: MSG_ZEROCOPY flag support
Message-ID: <paronli5omh2byddxcsbew3lrnydq4liifsevp2oomhhy5pxed@q46cdz6qp2in>
References: <20230911202234.1932024-1-avkrasnov@salutedevices.com>
 <20230911202234.1932024-5-avkrasnov@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20230911202234.1932024-5-avkrasnov@salutedevices.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Bobby Eshleman <bobby.eshleman@bytedance.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 oxffffaa@gmail.com, Eric Dumazet <edumazet@google.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, kernel@sberdevices.ru,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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

On Mon, Sep 11, 2023 at 11:22:34PM +0300, Arseniy Krasnov wrote:
>This adds handling of MSG_ZEROCOPY flag on transmission path:
>
>1) If this flag is set and zerocopy transmission is possible (enabled
>   in socket options and transport allows zerocopy), then non-linear
>   skb will be created and filled with the pages of user's buffer.
>   Pages of user's buffer are locked in memory by 'get_user_pages()'.
>2) Replaces way of skb owning: instead of 'skb_set_owner_sk_safe()' it
>   calls 'skb_set_owner_w()'. Reason of this change is that
>   '__zerocopy_sg_from_iter()' increments 'sk_wmem_alloc' of socket, so
>   to decrease this field correctly, proper skb destructor is needed:
>   'sock_wfree()'. This destructor is set by 'skb_set_owner_w()'.
>3) Adds new callback to 'struct virtio_transport': 'can_msgzerocopy'.
>   If this callback is set, then transport needs extra check to be able
>   to send provided number of buffers in zerocopy mode. Currently, the
>   only transport that needs this callback set is virtio, because this
>   transport adds new buffers to the virtio queue and we need to check,
>   that number of these buffers is less than size of the queue (it is
>   required by virtio spec). vhost and loopback transports don't need
>   this check.
>
>Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
>---
> Changelog:
> v5(big patchset) -> v1:
>  * Refactorings of 'if' conditions.
>  * Remove extra blank line.
>  * Remove 'frag_off' field unneeded init.
>  * Add function 'virtio_transport_fill_skb()' which fills both linear
>    and non-linear skb with provided data.
> v1 -> v2:
>  * Use original order of last four arguments in 'virtio_transport_alloc_skb()'.
> v2 -> v3:
>  * Add new transport callback: 'msgzerocopy_check_iov'. It checks that
>    provided 'iov_iter' with data could be sent in a zerocopy mode.
>    If this callback is not set in transport - transport allows to send
>    any 'iov_iter' in zerocopy mode. Otherwise - if callback returns 'true'
>    then zerocopy is allowed. Reason of this callback is that in case of
>    G2H transmission we insert whole skb to the tx virtio queue and such
>    skb must fit to the size of the virtio queue to be sent in a single
>    iteration (may be tx logic in 'virtio_transport.c' could be reworked
>    as in vhost to support partial send of current skb). This callback
>    will be enabled only for G2H path. For details pls see comment
>    'Check that tx queue...' below.
> v3 -> v4:
>  * 'msgzerocopy_check_iov' moved from 'struct vsock_transport' to
>    'struct virtio_transport' as it is virtio specific callback and
>    never needed in other transports.
> v4 -> v5:
>  * 'msgzerocopy_check_iov' renamed to 'can_msgzerocopy' and now it
>    uses number of buffers to send as input argument. I think there is
>    no need to pass iov to this callback (at least today, it is used only
>    by guest side of virtio transport), because the only thing that this
>    callback does is comparison of number of buffers to be inserted to
>    the tx queue and size of this queue.
>  * Remove any checks for type of current 'iov_iter' with payload (is it
>    'iovec' or 'ubuf'). These checks left from the earlier versions where I
>    didn't use already implemented kernel API which handles every type of
>    'iov_iter'.
> v5 -> v6:
>  * Refactor 'virtio_transport_fill_skb()'.
>  * Add 'WARN_ON_ONCE()' and comment on invalid combination of destination
>    socket and payload in 'virtio_transport_alloc_skb()'.
> v7 -> v8:
>  * Move '+1' addition from 'can_msgzerocopy' callback body to the caller.
>    This addition means packet header.
>  * In 'virtio_transport_can_zcopy()' rename 'max_to_send' argument to
>    'pkt_len'.
>  * Update commit message by adding details about new 'can_msgzerocopy'
>    callback.
>  * In 'virtio_transport_init_hdr()' move 'len' argument directly after
>    'info'.
>  * Add comment about processing last skb in tx loop.
>  * Update comment for 'can_msgzerocopy' callback for more details.
>
> include/linux/virtio_vsock.h            |   9 +
> net/vmw_vsock/virtio_transport.c        |  32 +++
> net/vmw_vsock/virtio_transport_common.c | 256 ++++++++++++++++++------
> 3 files changed, 239 insertions(+), 58 deletions(-)
>
>diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>index a91fbdf233e4..ebb3ce63d64d 100644
>--- a/include/linux/virtio_vsock.h
>+++ b/include/linux/virtio_vsock.h
>@@ -160,6 +160,15 @@ struct virtio_transport {
>
> 	/* Takes ownership of the packet */
> 	int (*send_pkt)(struct sk_buff *skb);
>+
>+	/* Used in MSG_ZEROCOPY mode. Checks, that provided data
>+	 * (number of buffers) could be transmitted with zerocopy
>+	 * mode. If this callback is not implemented for the current
>+	 * transport - this means that this transport doesn't need
>+	 * extra checks and can perform zerocopy transmission by
>+	 * default.
>+	 */
>+	bool (*can_msgzerocopy)(int bufs_num);
> };
>
> ssize_t
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index 73d730156349..09ba3128e759 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -455,6 +455,37 @@ static void virtio_vsock_rx_done(struct virtqueue *vq)
> 	queue_work(virtio_vsock_workqueue, &vsock->rx_work);
> }
>
>+static bool virtio_transport_can_msgzerocopy(int bufs_num)
>+{
>+	struct virtio_vsock *vsock;
>+	bool res = false;
>+
>+	rcu_read_lock();
>+
>+	vsock = rcu_dereference(the_virtio_vsock);
>+	if (vsock) {
>+		struct virtqueue *vq = vsock->vqs[VSOCK_VQ_TX];
>+
>+		/* Check that tx queue is large enough to keep whole
>+		 * data to send. This is needed, because when there is
>+		 * not enough free space in the queue, current skb to
>+		 * send will be reinserted to the head of tx list of
>+		 * the socket to retry transmission later, so if skb
>+		 * is bigger than whole queue, it will be reinserted
>+		 * again and again, thus blocking other skbs to be sent.
>+		 * Each page of the user provided buffer will be added
>+		 * as a single buffer to the tx virtqueue, so compare
>+		 * number of pages against maximum capacity of the queue.
>+		 */
>+		if (bufs_num <= vq->num_max)
>+			res = true;
>+	}
>+
>+	rcu_read_unlock();
>+
>+	return res;
>+}
>+
> static bool virtio_transport_seqpacket_allow(u32 remote_cid);
>
> static struct virtio_transport virtio_transport = {
>@@ -504,6 +535,7 @@ static struct virtio_transport virtio_transport = {
> 	},
>
> 	.send_pkt = virtio_transport_send_pkt,
>+	.can_msgzerocopy = virtio_transport_can_msgzerocopy,
> };
>
> static bool virtio_transport_seqpacket_allow(u32 remote_cid)
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index 3a48e48a99ac..e358f118b07e 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -37,73 +37,110 @@ virtio_transport_get_ops(struct vsock_sock *vsk)
> 	return container_of(t, struct virtio_transport, transport);
> }
>
>-/* Returns a new packet on success, otherwise returns NULL.
>- *
>- * If NULL is returned, errp is set to a negative errno.
>- */

Why we are removing this comment?

>-static struct sk_buff *
>-virtio_transport_alloc_skb(struct virtio_vsock_pkt_info *info,
>-			   size_t len,
>-			   u32 src_cid,
>-			   u32 src_port,
>-			   u32 dst_cid,
>-			   u32 dst_port)
>-{
>-	const size_t skb_len = VIRTIO_VSOCK_SKB_HEADROOM + len;
>-	struct virtio_vsock_hdr *hdr;
>-	struct sk_buff *skb;
>-	void *payload;
>-	int err;
>+static bool virtio_transport_can_zcopy(struct virtio_vsock_pkt_info 
>*info,
>+				       size_t pkt_len)
>+{
>+	const struct virtio_transport *t_ops;
>+	struct iov_iter *iov_iter;
>
>-	skb = virtio_vsock_alloc_skb(skb_len, GFP_KERNEL);
>-	if (!skb)
>-		return NULL;
>+	if (!info->msg)
>+		return false;
>
>-	hdr = virtio_vsock_hdr(skb);
>-	hdr->type	= cpu_to_le16(info->type);
>-	hdr->op		= cpu_to_le16(info->op);
>-	hdr->src_cid	= cpu_to_le64(src_cid);
>-	hdr->dst_cid	= cpu_to_le64(dst_cid);
>-	hdr->src_port	= cpu_to_le32(src_port);
>-	hdr->dst_port	= cpu_to_le32(dst_port);
>-	hdr->flags	= cpu_to_le32(info->flags);
>-	hdr->len	= cpu_to_le32(len);
>+	iov_iter = &info->msg->msg_iter;
>
>-	if (info->msg && len > 0) {
>-		payload = skb)put(skb, len);
>-		err = memcpy_from_msg(payload, info->msg, len);
>-		if (err)
>-			goto out;
>+	if (iov_iter->iov_offset)
>+		return false;
>
>-		if (msg_data_left(info->msg) == 0 &&
>-		    info->type == VIRTIO_VSOCK_TYPE_SEQPACKET) {
>-			hdr->flags |= cpu_to_le32(VIRTIO_VSOCK_SEQ_EOM);
>+	/* We can't send whole iov. */
>+	if (iov_iter->count > pkt_len)
>+		return false;
>
>-			if (info->msg->msg_flags & MSG_EOR)
>-				hdr->flags |= cpu_to_le32(VIRTIO_VSOCK_SEQ_EOR);
>-		}
>+	/* Check that transport can send data in zerocopy mode. */
>+	t_ops = virtio_transport_get_ops(info->vsk);

While reviewing I was wondering why here we don't check if `t_ops` is
NULL.

Then I realized that the only caller of this function
(virtio_transport_send_pkt_info()) already get the vsk ops calling
virtio_transport_get_ops() and also checks if it can be null.

So what about passing the ops as function parameter to avoid to call
virtio_transport_get_ops() again?

>+
>+	if (t_ops->can_msgzerocopy) {
>+		int pages_in_iov = iov_iter_npages(iov_iter, MAX_SKB_FRAGS);
>+		int pages_to_send = min(pages_in_iov, MAX_SKB_FRAGS);
>+
>+		/* +1 is for packet header. */
>+		return t_ops->can_msgzerocopy(pages_to_send + 1);
> 	}
>
>-	if (info->reply)
>-		virtio_vsock_skb_set_reply(skb);
>+	return true;
>+}
>
>-	trace_virtio_transport_alloc_pkt(src_cid, src_port,
>-					 dst_cid, dst_port,
>-					 len,
>-					 info->type,
>-					 info->op,
>-					 info->flags);
>+static int virtio_transport_init_zcopy_skb(struct vsock_sock *vsk,
>+					   struct sk_buff *skb,
>+					   struct msghdr *msg,
>+					   bool zerocopy)
>+{
>+	struct ubuf_info *uarg;
>
>-	if (info->vsk && !skb_set_owner_sk_safe(skb, sk_vsock(info->vsk))) {
>-		WARN_ONCE(1, "failed to allocate skb on vsock socket with sk_refcnt == 0\n");
>-		goto out;
>+	if (msg->msg_ubuf) {
>+		uarg = msg->msg_ubuf;
>+		net_zcopy_get(uarg);
>+	} else {
>+		struct iov_iter *iter = &msg->msg_iter;
>+		struct ubuf_info_msgzc *uarg_zc;
>+
>+		uarg = msg_zerocopy_realloc(sk_vsock(vsk),
>+					    iter->count,
>+					    NULL);
>+		if (!uarg)
>+			return -1;
>+
>+		uarg_zc = uarg_to_msgzc(uarg);
>+		uarg_zc->zerocopy = zerocopy ? 1 : 0;
> 	}
>
>-	return skb;
>+	skb_zcopy_init(skb, uarg);
>
>-out:
>-	kfree_skb(skb);
>-	return NULL;
>+	return 0;
>+}
>+
>+static int virtio_transport_fill_skb(struct sk_buff *skb,
>+				     struct virtio_vsock_pkt_info *info,
>+				     size_t len,
>+				     bool zcopy)
>+{
>+	void *payload;
>+	int err;
>+
>+	if (zcopy)
>+		return __zerocopy_sg_from_iter(info->msg, NULL, skb,
>+					       &info->msg->msg_iter,
>+					       len);
>+
>+	payload = skb_put(skb, len);
>+	err = memcpy_from_msg(payload, info->msg, len);
>+	if (err)
>+		return -1;
>+
>+	if (msg_data_left(info->msg))
>+		return 0;

We are returning 0 in any case, what is the purpose of this check?

>+
>+	return 0;
>+}
>+
>+static void virtio_transport_init_hdr(struct sk_buff *skb,
>+				      struct virtio_vsock_pkt_info *info,
>+				      size_t payload_len,
>+				      u32 src_cid,
>+				      u32 src_port,
>+				      u32 dst_cid,
>+				      u32 dst_port)
>+{
>+	struct virtio_vsock_hdr *hdr;
>+
>+	hdr = virtio_vsock_hdr(skb);
>+	hdr->type	= cpu_to_le16(info->type);
>+	hdr->op		= cpu_to_le16(info->op);
>+	hdr->src_cid	= cpu_to_le64(src_cid);
>+	hdr->dst_cid	= cpu_to_le64(dst_cid);
>+	hdr->src_port	= cpu_to_le32(src_port);
>+	hdr->dst_port	= cpu_to_le32(dst_port);
>+	hdr->flags	= cpu_to_le32(info->flags);
>+	hdr->len	= cpu_to_le32(payload_len);
> }
>
> static void virtio_transport_copy_nonlinear_skb(const struct sk_buff *skb,
>@@ -214,6 +251,77 @@ static u16 virtio_transport_get_type(struct sock *sk)
> 		return VIRTIO_VSOCK_TYPE_SEQPACKET;
> }
>
>+static struct sk_buff *virtio_transport_alloc_skb(struct vsock_sock *vsk,

Before this patch we used `info->vsk` in virtio_transport_alloc_skb().
Is it now really necessary to add vsk as a parameter? If so, why?

>+						  struct virtio_vsock_pkt_info *info,
>+						  size_t payload_len,
>+						  bool zcopy,
>+						  u32 src_cid,
>+						  u32 src_port,
>+						  u32 dst_cid,
>+						  u32 dst_port)
>+{
>+	struct sk_buff *skb;
>+	size_t skb_len;
>+
>+	skb_len = VIRTIO_VSOCK_SKB_HEADROOM;
>+
>+	if (!zcopy)
>+		skb_len += payload_len;
>+
>+	skb = virtio_vsock_alloc_skb(skb_len, GFP_KERNEL);
>+	if (!skb)
>+		return NULL;
>+
>+	virtio_transport_init_hdr(skb, info, payload_len, src_cid, src_port,
>+				  dst_cid, dst_port);
>+
>+	/* If 'vsk' != NULL then payload is always present, so we
>+	 * will never call '__zerocopy_sg_from_iter()' below without
>+	 * setting skb owner in 'skb_set_owner_w()'. The only case
>+	 * when 'vsk' == NULL is VIRTIO_VSOCK_OP_RST control message
>+	 * without payload.
>+	 */
>+	WARN_ON_ONCE(!(vsk && (info->msg && payload_len)) && zcopy);
>+
>+	/* Set owner here, because '__zerocopy_sg_from_iter()' uses
>+	 * owner of skb without check to update 'sk_wmem_alloc'.
>+	 */
>+	if (vsk)
>+		skb_set_owner_w(skb, sk_vsock(vsk));
>+
>+	if (info->msg && payload_len > 0) {
>+		int err;
>+
>+		err = virtio_transport_fill_skb(skb, info, payload_len, zcopy);
>+		if (err)
>+			goto out;
>+
>+		if (info->type == VIRTIO_VSOCK_TYPE_SEQPACKET) {

Before this patch, we did these steps only if
`msg_data_left(info->msg) == 0`, why now we do it in any case?

>+			struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
>+
>+			hdr->flags |= cpu_to_le32(VIRTIO_VSOCK_SEQ_EOM);
>+
>+			if (info->msg->msg_flags & MSG_EOR)
>+				hdr->flags |= cpu_to_le32(VIRTIO_VSOCK_SEQ_EOR);
>+		}
>+	}
>+
>+	if (info->reply)
>+		virtio_vsock_skb_set_reply(skb);
>+
>+	trace_virtio_transport_alloc_pkt(src_cid, src_port,
>+					 dst_cid, dst_port,
>+					 payload_len,
>+					 info->type,
>+					 info->op,
>+					 info->flags);

Maybe now we should trace also `zcopy`.

>+
>+	return skb;
>+out:
>+	kfree_skb(skb);
>+	return NULL;
>+}
>+
> /* This function can only be used on connecting/connected sockets,
>  * since a socket assigned to a transport is required.
>  *
>@@ -222,10 +330,12 @@ static u16 virtio_transport_get_type(struct sock *sk)
> static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
> 					  struct virtio_vsock_pkt_info *info)
> {
>+	u32 max_skb_len = VIRTIO_VSOCK_MAX_PKT_BUF_SIZE;
> 	u32 src_cid, src_port, dst_cid, dst_port;
> 	const struct virtio_transport *t_ops;
> 	struct virtio_vsock_sock *vvs;
> 	u32 pkt_len = info->pkt_len;
>+	bool can_zcopy = false;
> 	u32 rest_len;
> 	int ret;
>
>@@ -254,15 +364,30 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
> 	if (pkt_len == 0 && info->op == VIRTIO_VSOCK_OP_RW)
> 		return pkt_len;
>
>+	if (info->msg) {
>+		/* If zerocopy is not enabled by 'setsockopt()', we behave as
>+		 * there is no MSG_ZEROCOPY flag set.
>+		 */
>+		if (!sock_flag(sk_vsock(vsk), SOCK_ZEROCOPY))
>+			info->msg->msg_flags &= ~MSG_ZEROCOPY;
>+
>+		if (info->msg->msg_flags & MSG_ZEROCOPY)
>+			can_zcopy = virtio_transport_can_zcopy(info, pkt_len);
>+
>+		if (can_zcopy)
>+			max_skb_len = min_t(u32, VIRTIO_VSOCK_MAX_PKT_BUF_SIZE,
>+					    (MAX_SKB_FRAGS * PAGE_SIZE));
>+	}
>+
> 	rest_len = pkt_len;
>
> 	do {
> 		struct sk_buff *skb;
> 		size_t skb_len;
>
>-		skb_len = min_t(u32, VIRTIO_VSOCK_MAX_PKT_BUF_SIZE, rest_len);
>+		skb_len = min(max_skb_len, rest_len);
>
>-		skb = virtio_transport_alloc_skb(info, skb_len,
>+		skb = virtio_transport_alloc_skb(vsk, info, skb_len, can_zcopy,
> 						 src_cid, src_port,
> 						 dst_cid, dst_port);
> 		if (!skb) {
>@@ -270,6 +395,21 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
> 			break;
> 		}
>
>+		/* We process buffer part by part, allocating skb on
>+		 * each iteration. If this is last skb for this buffer
>+		 * and MSG_ZEROCOPY mode is in use - we must allocate
>+		 * completion for the current syscall.
>+		 */
>+		if (info->msg && info->msg->msg_flags & MSG_ZEROCOPY &&
>+		    skb_len == rest_len && info->op == VIRTIO_VSOCK_OP_RW) {
>+			if (virtio_transport_init_zcopy_skb(vsk, skb,
>+							    info->msg,
>+							    can_zcopy)) {
>+				ret = -ENOMEM;
>+				break;
>+			}
>+		}
>+
> 		virtio_transport_inc_tx_pkt(vvs, skb);
>
> 		ret = t_ops->send_pkt(skb);
>@@ -985,7 +1125,7 @@ static int virtio_transport_reset_no_sock(const struct virtio_transport *t,
> 	if (!t)
> 		return -ENOTCONN;
>
>-	reply = virtio_transport_alloc_skb(&info, 0,
>+	reply = virtio_transport_alloc_skb(NULL, &info, 0, false,
> 					   le64_to_cpu(hdr->dst_cid),
> 					   le32_to_cpu(hdr->dst_port),
> 					   le64_to_cpu(hdr->src_cid),
>-- 
>2.25.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
