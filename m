Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C578C74A28B
	for <lists.virtualization@lfdr.de>; Thu,  6 Jul 2023 18:53:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FF45415A1;
	Thu,  6 Jul 2023 16:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FF45415A1
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CaIQObDU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iuLIfAyzwVmV; Thu,  6 Jul 2023 16:53:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id ECF1F40A98;
	Thu,  6 Jul 2023 16:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECF1F40A98
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2AF56C008D;
	Thu,  6 Jul 2023 16:53:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C328C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Jul 2023 16:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE2AF82295
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Jul 2023 16:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE2AF82295
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=CaIQObDU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNgaWulpxZyx
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Jul 2023 16:53:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B64EC8223D
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B64EC8223D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Jul 2023 16:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688662398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zczbYWS4oHtmR9rzWqC/B9GV8z0Li3WOpRyYCoDigoc=;
 b=CaIQObDUMwk+X20a1nHafKeUPDqCr7G1R17Ns1Om+ET2BbwvIT+sJNzyphX3C/R6JMJz3e
 hq6D2UEutIHdhmc+Xh4Rttg5bnP1K5goqKIbMu0GJFsGwLcK5ezejAH1L7S/uirRn+dT8O
 6g0fhVsdleQQLcR+F9Cch3IRANt/+nY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-AmkfgclDOfWWrE0v2EpJOw-1; Thu, 06 Jul 2023 12:53:17 -0400
X-MC-Unique: AmkfgclDOfWWrE0v2EpJOw-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-992e6840901so113155966b.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Jul 2023 09:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688662396; x=1691254396;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zczbYWS4oHtmR9rzWqC/B9GV8z0Li3WOpRyYCoDigoc=;
 b=iXlIUb7cgTvfPiEFPZcQ7K31aL05ypBpYQElDThQ3ebkEf/4sy2+0p9BfjNjjitxgx
 o/ZUX7T6G/8/W6fZ/zGzkU3CrgE5WuK62ck2rvwyQVE/2pGgSyMsWRYnCW9xCr/9KPw2
 0VB6GBWYguK9YRIgzz7QoOe41TsEKSyf7OPVM/+iWSkQehb0wLYjeU0hplYWPdSZmifL
 vTBMr39LCmH0e130TybY9thCBIXW9EhShmapEbSiP3lZRZadjhTaf30/LUugZu3Io33Y
 UHfAGpoq2NvFm8IfG/Cf/3yb3/VdfGgA0YNx6qNec7mT4cv/vNDZYmKkIIbDcGoqkPal
 tjSg==
X-Gm-Message-State: ABy/qLYBw9Qp1DIccGK23O+lJKlnn2Eexu/GqD9iy8JG6RIsmgM3uk5V
 ogaFAhHkhkwagqqtUT8BzNjnw+jx2R95EpzR8odDxMxosE55T4ijo+Qk0wsDy4wpT5iJY2rUnbC
 0R0dxVBmjFSOXVemiahgxCaCWDknFqq/Af2lM0WeI+w==
X-Received: by 2002:a17:907:8a20:b0:98e:3935:60f4 with SMTP id
 sc32-20020a1709078a2000b0098e393560f4mr6043194ejc.1.1688662396123; 
 Thu, 06 Jul 2023 09:53:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFYPcYYujKaztpc8tluyTWnfLpeEPYm/QkQpZjmP3gr1rjXTPeCGy1b7QMU7ALXofLkZ9Kz3Q==
X-Received: by 2002:a17:907:8a20:b0:98e:3935:60f4 with SMTP id
 sc32-20020a1709078a2000b0098e393560f4mr6043162ejc.1.1688662395815; 
 Thu, 06 Jul 2023 09:53:15 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-163.retail.telecomitalia.it.
 [79.46.200.163]) by smtp.gmail.com with ESMTPSA id
 i18-20020a170906851200b0098669cc16b2sm1018382ejx.83.2023.07.06.09.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 09:53:15 -0700 (PDT)
Date: Thu, 6 Jul 2023 18:53:12 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Subject: Re: [RFC PATCH v5 05/17] vsock/virtio: MSG_ZEROCOPY flag support
Message-ID: <hzom3x3ym3i2gjhl2ldcfbxjz3sjd7wdf6mof662tc6enky3rd@nc24jgkgbu5r>
References: <20230701063947.3422088-1-AVKrasnov@sberdevices.ru>
 <20230701063947.3422088-6-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
In-Reply-To: <20230701063947.3422088-6-AVKrasnov@sberdevices.ru>
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

On Sat, Jul 01, 2023 at 09:39:35AM +0300, Arseniy Krasnov wrote:
>This adds handling of MSG_ZEROCOPY flag on transmission path: if this
>flag is set and zerocopy transmission is possible, then non-linear skb
>will be created and filled with the pages of user's buffer. Pages of
>user's buffer are locked in memory by 'get_user_pages()'. Second thing
>that this patch does is replace type of skb owning: instead of calling
>'skb_set_owner_sk_safe()' it calls 'skb_set_owner_w()'. Reason of this
>change is that '__zerocopy_sg_from_iter()' increments 'sk_wmem_alloc'
>of socket, so to decrease this field correctly proper skb destructor is
>needed: 'sock_wfree()'. This destructor is set by 'skb_set_owner_w()'.
>
>Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
>---
> Changelog:
> v4 -> v5:
>  * Remove unused 'vsk' arg from 'virtio_transport_fill_linear_skb()'.
>  * Remove old comment 'Returns a new packet on success...'.
>  * Commit message update by adding details why this patch uses
>    'skb_set_owner_w()' instead of previous 'skb_set_owner_sk_safe()'.
>  * 'hdr' variable declaration and assignment in a single line.
>  * Rename 'max_skb_cap' to 'max_skb_len'.
>  * Use 'info->msg->msg_flags' to check MSG_ZEROCOPY flag  instead of
>    field 'flags' of struct 'virtio_vsock_pkt_info'. This was a bug.
>
> net/vmw_vsock/virtio_transport_common.c | 262 ++++++++++++++++++------
> 1 file changed, 200 insertions(+), 62 deletions(-)
>
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index dfc48b56d0a2..2269530ea737 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -37,27 +37,99 @@ virtio_transport_get_ops(struct vsock_sock *vsk)
> 	return container_of(t, struct virtio_transport, transport);
> }
>
>-/* Returns a new packet on success, otherwise returns NULL.
>- *
>- * If NULL is returned, errp is set to a negative errno.
>- */
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
>+static bool virtio_transport_can_zcopy(struct virtio_vsock_pkt_info *info,
>+				       size_t max_to_send)
>+{
>+	struct iov_iter *iov_iter;
>+
>+	if (!info->msg)
>+		return false;
>+
>+	iov_iter = &info->msg->msg_iter;
>+
>+	/* Data is simple buffer. */
>+	if (iter_is_ubuf(iov_iter))
>+		return true;
>+
>+	if (!iter_is_iovec(iov_iter))
>+		return false;
>+
>+	if (iov_iter->iov_offset)
>+		return false;
>+
>+	/* We can't send whole iov. */
>+	if (iov_iter->count > max_to_send)
>+		return false;
>+
>+	return true;
>+}
>+
>+static int virtio_transport_init_zcopy_skb(struct vsock_sock *vsk,
>+					   struct sk_buff *skb,
>+					   struct msghdr *msg,
>+					   bool zerocopy)
>+{
>+	struct ubuf_info *uarg;
>+
>+	if (msg->msg_ubuf) {
>+		uarg = msg->msg_ubuf;
>+		net_zcopy_get(uarg);
>+	} else {
>+		struct iov_iter *iter = &msg->msg_iter;
>+		struct ubuf_info_msgzc *uarg_zc;
>+		int len;
>+
>+		/* Only ITER_IOVEC or ITER_UBUF are allowed and
>+		 * checked before.
>+		 */
>+		if (iter_is_iovec(iter))
>+			len = iov_length(iter->__iov, iter->nr_segs);
>+		else
>+			len = iter->count;
>+
>+		uarg = msg_zerocopy_realloc(sk_vsock(vsk),
>+					    len,
>+					    NULL);
>+

We can remove this extra blank line.

>+		if (!uarg)
>+			return -1;
>+
>+		uarg_zc = uarg_to_msgzc(uarg);
>+		uarg_zc->zerocopy = zerocopy ? 1 : 0;
>+	}
>+
>+	skb_zcopy_init(skb, uarg);
>+
>+	return 0;
>+}
>+
>+static int virtio_transport_fill_linear_skb(struct sk_buff *skb,
>+					    struct virtio_vsock_pkt_info *info,
>+					    size_t len)
>+{
> 	void *payload;
> 	int err;
>
>-	skb = virtio_vsock_alloc_skb(skb_len, GFP_KERNEL);
>-	if (!skb)
>-		return NULL;
>+	payload = skb_put(skb, len);
>+	err = memcpy_from_msg(payload, info->msg, len);
>+	if (err)
>+		return -1;
>+
>+	if (msg_data_left(info->msg))
>+		return 0;
>+
>+	return 0;
>+}
>+
>+static void virtio_transport_init_hdr(struct sk_buff *skb,
>+				      struct virtio_vsock_pkt_info *info,
>+				      u32 src_cid,
>+				      u32 src_port,
>+				      u32 dst_cid,
>+				      u32 dst_port,
>+				      size_t len)
>+{
>+	struct virtio_vsock_hdr *hdr;
>
> 	hdr = virtio_vsock_hdr(skb);
> 	hdr->type	= cpu_to_le16(info->type);
>@@ -68,42 +140,6 @@ virtio_transport_alloc_skb(struct virtio_vsock_pkt_info *info,
> 	hdr->dst_port	= cpu_to_le32(dst_port);
> 	hdr->flags	= cpu_to_le32(info->flags);
> 	hdr->len	= cpu_to_le32(len);
>-
>-	if (info->msg && len > 0) {
>-		payload = skb_put(skb, len);
>-		err = memcpy_from_msg(payload, info->msg, len);
>-		if (err)
>-			goto out;
>-
>-		if (msg_data_left(info->msg) == 0 &&
>-		    info->type == VIRTIO_VSOCK_TYPE_SEQPACKET) {
>-			hdr->flags |= cpu_to_le32(VIRTIO_VSOCK_SEQ_EOM);
>-
>-			if (info->msg->msg_flags & MSG_EOR)
>-				hdr->flags |= cpu_to_le32(VIRTIO_VSOCK_SEQ_EOR);
>-		}
>-	}
>-
>-	if (info->reply)
>-		virtio_vsock_skb_set_reply(skb);
>-
>-	trace_virtio_transport_alloc_pkt(src_cid, src_port,
>-					 dst_cid, dst_port,
>-					 len,
>-					 info->type,
>-					 info->op,
>-					 info->flags);
>-
>-	if (info->vsk && !skb_set_owner_sk_safe(skb, sk_vsock(info->vsk))) {
>-		WARN_ONCE(1, "failed to allocate skb on vsock socket with sk_refcnt == 0\n");
>-		goto out;
>-	}
>-
>-	return skb;
>-
>-out:
>-	kfree_skb(skb);
>-	return NULL;
> }
>
> static void virtio_transport_copy_nonlinear_skb(const struct sk_buff *skb,
>@@ -214,6 +250,79 @@ static u16 virtio_transport_get_type(struct sock *sk)
> 		return VIRTIO_VSOCK_TYPE_SEQPACKET;
> }
>
>+static struct sk_buff *virtio_transport_alloc_skb(struct vsock_sock *vsk,
>+						  struct virtio_vsock_pkt_info *info,
>+						  size_t payload_len,
>+						  bool zcopy,
>+						  u32 dst_cid,
>+						  u32 dst_port,
>+						  u32 src_cid,
>+						  u32 src_port)
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
>+	virtio_transport_init_hdr(skb, info, src_cid, src_port,
>+				  dst_cid, dst_port,
>+				  payload_len);
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
>+		if (zcopy) {
>+			err = __zerocopy_sg_from_iter(info->msg, NULL, skb,
>+						      &info->msg->msg_iter,
>+						      payload_len);
>+		} else {
>+			err = virtio_transport_fill_linear_skb(skb, info, payload_len);

What about renaming that function in virtio_transport_fill_skb()
and hide this block there?

>+		}
>+
>+		if (err)
>+			goto out;
>+
>+		VIRTIO_VSOCK_SKB_CB(skb)->frag_off = 0;

Why we need this initialization?
Should all the `cb` fields already initialized to 0?

>+
>+		if (info->type == VIRTIO_VSOCK_TYPE_SEQPACKET) {
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
>@@ -226,6 +335,8 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
> 	const struct virtio_transport *t_ops;
> 	struct virtio_vsock_sock *vvs;
> 	u32 pkt_len = info->pkt_len;
>+	bool can_zcopy = false;
>+	u32 max_skb_len;
> 	u32 rest_len;
> 	int ret;
>
>@@ -254,22 +365,49 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
> 	if (pkt_len == 0 && info->op == VIRTIO_VSOCK_OP_RW)
> 		return pkt_len;
>
>+	/* If zerocopy is not enabled by 'setsockopt()', we behave as
>+	 * there is no MSG_ZEROCOPY flag set.
>+	 */
>+	if (info->msg && !sock_flag(sk_vsock(vsk), SOCK_ZEROCOPY))
>+		info->msg->msg_flags &= ~MSG_ZEROCOPY;
>+
>+	if (info->msg && info->msg->msg_flags & MSG_ZEROCOPY)
>+		can_zcopy = virtio_transport_can_zcopy(info, pkt_len);
>+
>+	if (can_zcopy)
>+		max_skb_len = min_t(u32, VIRTIO_VSOCK_MAX_PKT_BUF_SIZE,
>+				    (MAX_SKB_FRAGS * PAGE_SIZE));
>+	else
>+		max_skb_len = VIRTIO_VSOCK_MAX_PKT_BUF_SIZE;
>+

IIUC, all these checks only make sense if `info->msg` is true, right?

If it is the case, I would refactor in this way (not tested):

	u32 max_skb_len = VIRTIO_VSOCK_MAX_PKT_BUF_SIZE;
	bool can_zcopy = false;

	if (info->msg) {
		if (!sock_flag(sk_vsock(vsk), SOCK_ZEROCOPY))
			info->msg->msg_flags &= ~MSG_ZEROCOPY;

		if (info->msg->msg_flags & MSG_ZEROCOPY)
			can_zcopy = virtio_transport_can_zcopy(info, pkt_len);

		if (can_zcopy)
			max_skb_len = min_t(u32, VIRTIO_VSOCK_MAX_PKT_BUF_SIZE,
					    MAX_SKB_FRAGS * PAGE_SIZE);
	}



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
>-						 src_cid, src_port,
>-						 dst_cid, dst_port);
>+		skb = virtio_transport_alloc_skb(vsk, info, skb_len, can_zcopy,
>+						 dst_cid, dst_port,
>+						 src_cid, src_port);
> 		if (!skb) {
> 			ret = -ENOMEM;
> 			break;
> 		}
>
>+		/* This is last skb to send this portion of data. */
>+		if (skb_len == rest_len && info->msg &&
>+		    info->msg->msg_flags & MSG_ZEROCOPY &&

I would move `info->msg->msg_flags & MSG_ZEROCOPY` on top to make it
more readable and understand that this is only for zero-copy.
(of course checking before `info->msg`)

>+		    info->op == VIRTIO_VSOCK_OP_RW) {
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
>@@ -939,11 +1077,11 @@ static int virtio_transport_reset_no_sock(const struct virtio_transport *t,
> 	if (!t)
> 		return -ENOTCONN;
>
>-	reply = virtio_transport_alloc_skb(&info, 0,
>-					   le64_to_cpu(hdr->dst_cid),
>-					   le32_to_cpu(hdr->dst_port),
>+	reply = virtio_transport_alloc_skb(NULL, &info, 0, false,
> 					   le64_to_cpu(hdr->src_cid),
>-					   le32_to_cpu(hdr->src_port));
>+					   le32_to_cpu(hdr->src_port),
>+					   le64_to_cpu(hdr->dst_cid),
>+					   le32_to_cpu(hdr->dst_port));
> 	if (!reply)
> 		return -ENOMEM;
>
>-- 
>2.25.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
