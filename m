Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FF3757E1C
	for <lists.virtualization@lfdr.de>; Tue, 18 Jul 2023 15:49:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 382B940442;
	Tue, 18 Jul 2023 13:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 382B940442
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bNtz4/rE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lW4hJIHOo_Dz; Tue, 18 Jul 2023 13:49:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 50C9A41604;
	Tue, 18 Jul 2023 13:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50C9A41604
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87E7CC0DD4;
	Tue, 18 Jul 2023 13:49:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1543EC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jul 2023 13:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E47148136F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jul 2023 13:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E47148136F
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=bNtz4/rE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VfByEfoF6Axc
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jul 2023 13:48:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0326281365
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0326281365
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jul 2023 13:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689688137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LLaxw2NzrWW+r009Dr4j7Rdw/NRY2OqVU5CYMXXm6+8=;
 b=bNtz4/rE0HhTa5x4M1BpEmWkTfBRu9alR9G3ia7OoAOVcgcSrjry5Nqm9gx2ne+M/mqi7F
 AN1HRcGTs1oiceYQSDxVwcppDxYVKxm9GtlffwhDprHKERXTaO9tZFbPyiin6qRTgz3Qwb
 oo9wYHiZ30JzbbgnXFKYZ1MiKJhYCA0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-zhLnChgXNxG8ULu74Bo1bw-1; Tue, 18 Jul 2023 09:48:55 -0400
X-MC-Unique: zhLnChgXNxG8ULu74Bo1bw-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-765a632f342so663712185a.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jul 2023 06:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689688135; x=1690292935;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LLaxw2NzrWW+r009Dr4j7Rdw/NRY2OqVU5CYMXXm6+8=;
 b=BpglcOjm0mMSJvxhIA4Xsb+uoSv8u3+s4iGcIGU9peoe2C/RSXQlFnDiduntQpDZyt
 yhs/FJe/csw/UFHgvAlrSAhBv5PTHZm7PEostb43ILdU5rnXoxREW21DffcV4CKE7RcL
 Vt6y8lx2lBUbgQvTHkq1feGjGrsJIQdL9Hkxh5F4y5k9kQ1ta0s9EA0UbfphAqpi1o/P
 2wAs+9JvhuzaOY3jwq8PN1TIA2hFIgdgLxV8agzf9ro+yZWtNlhWYBaTLgpG/DGwdnkz
 zh4h8accZxDJl+NXR6Z4UPO+vUDQJceHvVr6UTi0ttu6FqLObefCmOUUAVDTTH7HcHCu
 VoUg==
X-Gm-Message-State: ABy/qLbN9oR3buajSxyJ4Bxi+bbo67a1MzXRJE3dw3HikxnxNQbJlL9R
 wAis5ghTt6PVkdlN3kMVDjMe8KW6a50ZG0ZF9U/eBvs39EIBjV0ZPXaLqqhFzd2KAOtIOlFJ/Qr
 AV+rhTsT+SLwIGB+gC5LgzSJy9zZaCi4N7o73lFYcPA==
X-Received: by 2002:a05:620a:6785:b0:767:35bc:540a with SMTP id
 rr5-20020a05620a678500b0076735bc540amr2159585qkn.17.1689688135505; 
 Tue, 18 Jul 2023 06:48:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG4MukNT5hzLYq1GhLxnnXJi0mdSCeXfoowDToROhwgmWHtxW1zaVxLyYJoJSQVYJMBJ6xHvQ==
X-Received: by 2002:a05:620a:6785:b0:767:35bc:540a with SMTP id
 rr5-20020a05620a678500b0076735bc540amr2159561qkn.17.1689688135249; 
 Tue, 18 Jul 2023 06:48:55 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-94.retail.telecomitalia.it.
 [79.46.200.94]) by smtp.gmail.com with ESMTPSA id
 pe8-20020a05620a850800b00767502e8601sm606015qkn.35.2023.07.18.06.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 06:48:54 -0700 (PDT)
Date: Tue, 18 Jul 2023 15:48:50 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Subject: Re: [PATCH net-next v1 1/4] vsock/virtio/vhost: read data from
 non-linear skb
Message-ID: <mhpoxo3jsoqp6tnmm2maa47tqlm3bd5sveo4n7aqnnvbh7ryjh@ur54eno5povg>
References: <20230717210051.856388-1-AVKrasnov@sberdevices.ru>
 <20230717210051.856388-2-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
In-Reply-To: <20230717210051.856388-2-AVKrasnov@sberdevices.ru>
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

On Tue, Jul 18, 2023 at 12:00:48AM +0300, Arseniy Krasnov wrote:
>This is preparation patch for MSG_ZEROCOPY support. It adds handling of
>non-linear skbs by replacing direct calls of 'memcpy_to_msg()' with
>'skb_copy_datagram_iter()'. Main advantage of the second one is that it
>can handle paged part of the skb by using 'kmap()' on each page, but if
>there are no pages in the skb, it behaves like simple copying to iov
>iterator. This patch also adds new field to the control block of skb -
>this value shows current offset in the skb to read next portion of data
>(it doesn't matter linear it or not). Idea behind this field is that
>'skb_copy_datagram_iter()' handles both types of skb internally - it
>just needs an offset from which to copy data from the given skb. This
>offset is incremented on each read from skb. This approach allows to
>avoid special handling of non-linear skbs:
>1) We can't call 'skb_pull()' on it, because it updates 'data' pointer.
>2) We need to update 'data_len' also on each read from this skb.
>
>Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
>---
> Changelog:
> v5(big patchset) -> v1:
>  * Merge 'virtio_transport_common.c' and 'vhost/vsock.c' patches into
>    this single patch.
>  * Commit message update: grammar fix and remark that this patch is
>    MSG_ZEROCOPY preparation.
>  * Use 'min_t()' instead of comparison using '<>' operators.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
> drivers/vhost/vsock.c                   | 14 ++++++++-----
> include/linux/virtio_vsock.h            |  1 +
> net/vmw_vsock/virtio_transport_common.c | 27 ++++++++++++++++---------
> 3 files changed, 28 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
>index 817d377a3f36..8c917be32b5d 100644
>--- a/drivers/vhost/vsock.c
>+++ b/drivers/vhost/vsock.c
>@@ -114,6 +114,7 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 		struct sk_buff *skb;
> 		unsigned out, in;
> 		size_t nbytes;
>+		u32 frag_off;
> 		int head;
>
> 		skb = virtio_vsock_skb_dequeue(&vsock->send_pkt_queue);
>@@ -156,7 +157,8 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 		}
>
> 		iov_iter_init(&iov_iter, ITER_DEST, &vq->iov[out], in, iov_len);
>-		payload_len = skb->len;
>+		frag_off = VIRTIO_VSOCK_SKB_CB(skb)->frag_off;
>+		payload_len = skb->len - frag_off;
> 		hdr = virtio_vsock_hdr(skb);
>
> 		/* If the packet is greater than the space available in the
>@@ -197,8 +199,10 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 			break;
> 		}
>
>-		nbytes = copy_to_iter(skb->data, payload_len, &iov_iter);
>-		if (nbytes != payload_len) {
>+		if (skb_copy_datagram_iter(skb,
>+					   frag_off,
>+					   &iov_iter,
>+					   payload_len)) {
> 			kfree_skb(skb);
> 			vq_err(vq, "Faulted on copying pkt buf\n");
> 			break;
>@@ -212,13 +216,13 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 		vhost_add_used(vq, head, sizeof(*hdr) + payload_len);
> 		added = true;
>
>-		skb_pull(skb, payload_len);
>+		VIRTIO_VSOCK_SKB_CB(skb)->frag_off += payload_len;
> 		total_len += payload_len;
>
> 		/* If we didn't send all the payload we can requeue the packet
> 		 * to send it with the next available buffer.
> 		 */
>-		if (skb->len > 0) {
>+		if (VIRTIO_VSOCK_SKB_CB(skb)->frag_off < skb->len) {
> 			hdr->flags |= cpu_to_le32(flags_to_restore);
>
> 			/* We are queueing the same skb to handle
>diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>index c58453699ee9..17dbb7176e37 100644
>--- a/include/linux/virtio_vsock.h
>+++ b/include/linux/virtio_vsock.h
>@@ -12,6 +12,7 @@
> struct virtio_vsock_skb_cb {
> 	bool reply;
> 	bool tap_delivered;
>+	u32 frag_off;
> };
>
> #define VIRTIO_VSOCK_SKB_CB(skb) ((struct virtio_vsock_skb_cb *)((skb)->cb))
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index b769fc258931..1a376f808ae6 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -355,7 +355,7 @@ virtio_transport_stream_do_peek(struct vsock_sock *vsk,
> 	spin_lock_bh(&vvs->rx_lock);
>
> 	skb_queue_walk_safe(&vvs->rx_queue, skb,  tmp) {
>-		off = 0;
>+		off = VIRTIO_VSOCK_SKB_CB(skb)->frag_off;
>
> 		if (total == len)
> 			break;
>@@ -370,7 +370,10 @@ virtio_transport_stream_do_peek(struct vsock_sock *vsk,
> 			 */
> 			spin_unlock_bh(&vvs->rx_lock);
>
>-			err = memcpy_to_msg(msg, skb->data + off, bytes);
>+			err = skb_copy_datagram_iter(skb, off,
>+						     &msg->msg_iter,
>+						     bytes);
>+
> 			if (err)
> 				goto out;
>
>@@ -413,25 +416,28 @@ virtio_transport_stream_do_dequeue(struct vsock_sock *vsk,
> 	while (total < len && !skb_queue_empty(&vvs->rx_queue)) {
> 		skb = skb_peek(&vvs->rx_queue);
>
>-		bytes = len - total;
>-		if (bytes > skb->len)
>-			bytes = skb->len;
>+		bytes = min_t(size_t, len - total,
>+			      skb->len - VIRTIO_VSOCK_SKB_CB(skb)->frag_off);
>
> 		/* sk_lock is held by caller so no one else can dequeue.
> 		 * Unlock rx_lock since memcpy_to_msg() may sleep.
> 		 */
> 		spin_unlock_bh(&vvs->rx_lock);
>
>-		err = memcpy_to_msg(msg, skb->data, bytes);
>+		err = skb_copy_datagram_iter(skb,
>+					     VIRTIO_VSOCK_SKB_CB(skb)->frag_off,
>+					     &msg->msg_iter, bytes);
>+
> 		if (err)
> 			goto out;
>
> 		spin_lock_bh(&vvs->rx_lock);
>
> 		total += bytes;
>-		skb_pull(skb, bytes);
>
>-		if (skb->len == 0) {
>+		VIRTIO_VSOCK_SKB_CB(skb)->frag_off += bytes;
>+
>+		if (skb->len == VIRTIO_VSOCK_SKB_CB(skb)->frag_off) {
> 			u32 pkt_len = le32_to_cpu(virtio_vsock_hdr(skb)->len);
>
> 			virtio_transport_dec_rx_pkt(vvs, pkt_len);
>@@ -503,7 +509,10 @@ static int virtio_transport_seqpacket_do_dequeue(struct vsock_sock *vsk,
> 				 */
> 				spin_unlock_bh(&vvs->rx_lock);
>
>-				err = memcpy_to_msg(msg, skb->data, bytes_to_copy);
>+				err = skb_copy_datagram_iter(skb, 0,
>+							     &msg->msg_iter,
>+							     bytes_to_copy);
>+
> 				if (err) {
> 					/* Copy of message failed. Rest of
> 					 * fragments will be freed without copy.
>-- 
>2.25.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
