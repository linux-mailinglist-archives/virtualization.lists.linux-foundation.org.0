Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 874FD73A61A
	for <lists.virtualization@lfdr.de>; Thu, 22 Jun 2023 18:32:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 838684212B;
	Thu, 22 Jun 2023 16:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 838684212B
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CpqNmJUh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T6a-3Ed6GtEu; Thu, 22 Jun 2023 16:32:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5A9264213D;
	Thu, 22 Jun 2023 16:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A9264213D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B971C0089;
	Thu, 22 Jun 2023 16:32:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90423C0029
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jun 2023 16:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C69D42074
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jun 2023 16:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C69D42074
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mB61zbnAhlK
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jun 2023 16:32:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6A0F4200A
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6A0F4200A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jun 2023 16:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687451521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O7hTNToPES9Lg5dmhQB9ln0T9yqmtu8yK1QwNW4CEqY=;
 b=CpqNmJUh0lguGHAorSoU/jKutWeHRvp+IMaplKgWRRRf9jeXeZJOMeN9MI6hdb4J8RKA0M
 XzB5QAmVmJT7LcBbpJSClbZ5uraIQki8lmUzApRmVTplb4YR6BIjgAL78ztHGG9Cr+YqSo
 GgWTTg3x99pLPq6K9TfoVvf+Kp9UcOM=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-GtbQYiG2Oxq448ln-X8vgQ-1; Thu, 22 Jun 2023 12:31:55 -0400
X-MC-Unique: GtbQYiG2Oxq448ln-X8vgQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4edc7406cbaso5821792e87.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jun 2023 09:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687451501; x=1690043501;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O7hTNToPES9Lg5dmhQB9ln0T9yqmtu8yK1QwNW4CEqY=;
 b=ekzRZxLqQs+wxVrU7w3BZsdBdwAueklgs8FX4ePy83lrV0ezanH4TnHUqUSnDqCaea
 QgiFxhkNsFm8iIbg8PkzG6X1Xyk0tOhhKxR5qAFUTdE0+qGbhlJCvAXQi1rA8YpfflSn
 l6XiJqCX+4JfCHu3eR5WKqhm62gjb4t8qAnEDnO52vqTHJGY8/t3wHQfXzjUebK0rX9b
 h8XtJMqZ4ad5P1X4EOECsdsbkLm+sx7elFp4mA43PuOPmlSWbogDGcfNnvvb19qS9fp8
 bNspDpfybzXBZQgBTM+R5z4j7Bb+HQ2b8dmsI1qay36s8flvY4LKfeXUYCLe7ro4dN4O
 7omg==
X-Gm-Message-State: AC+VfDyn6zQsQ6N4PDVBViW5wPt/v099uFCaSTFQmJ9gnra/ffyOovGE
 ZHQe0IfBUZCyFJunUDwh4yUkxwi6N1IADGrcd54Ww/9RnLytxnlLlB3UOVAuMLCbFCDKSzGJwKs
 mpETv7Ufiwbfwmn6wO8TlzRtFrRlZhpmBGTqHnaVeRA==
X-Received: by 2002:ac2:5b05:0:b0:4f6:2b29:b446 with SMTP id
 v5-20020ac25b05000000b004f62b29b446mr11734624lfn.21.1687451501369; 
 Thu, 22 Jun 2023 09:31:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7wsVNM1VfvqFByMvXNozboygCtlM+M7hCi3MEM0eCE79hMzqtDlI+2ZycdRrMe+nbPc6YQ9w==
X-Received: by 2002:ac2:5b05:0:b0:4f6:2b29:b446 with SMTP id
 v5-20020ac25b05000000b004f62b29b446mr11734591lfn.21.1687451500916; 
 Thu, 22 Jun 2023 09:31:40 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-160.retail.telecomitalia.it.
 [87.11.6.160]) by smtp.gmail.com with ESMTPSA id
 v25-20020aa7d9d9000000b0051a4ab66d92sm4205670eds.11.2023.06.22.09.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 09:31:40 -0700 (PDT)
Date: Thu, 22 Jun 2023 18:31:37 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobby.eshleman@bytedance.com>
Subject: Re: [PATCH RFC net-next v4 6/8] virtio/vsock: support dgrams
Message-ID: <zrho753sfvo6wiovm5fkkfwuu3thurxu22j2ei2sx2r674d6gy@t45ugqstjibm>
References: <20230413-b4-vsock-dgram-v4-0-0cebbb2ae899@bytedance.com>
 <20230413-b4-vsock-dgram-v4-6-0cebbb2ae899@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20230413-b4-vsock-dgram-v4-6-0cebbb2ae899@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-hyperv@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Simon Horman <simon.horman@corigine.com>,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Bryan Tan <bryantan@vmware.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Krasnov Arseniy <oxffffaa@gmail.com>,
 Vishnu Dasa <vdasa@vmware.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
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

On Sat, Jun 10, 2023 at 12:58:33AM +0000, Bobby Eshleman wrote:
>This commit adds support for datagrams over virtio/vsock.
>
>Message boundaries are preserved on a per-skb and per-vq entry basis.
>Messages are copied in whole from the user to an SKB, which in turn is
>added to the scatterlist for the virtqueue in whole for the device.
>Messages do not straddle skbs and they do not straddle packets.
>Messages may be truncated by the receiving user if their buffer is
>shorter than the message.
>
>Other properties of vsock datagrams:
>- Datagrams self-throttle at the per-socket sk_sndbuf threshold.
>- The same virtqueue is used as is used for streams and seqpacket flows
>- Credits are not used for datagrams
>- Packets are dropped silently by the device, which means the virtqueue
>  will still get kicked even during high packet loss, so long as the
>  socket does not exceed sk_sndbuf.
>
>Future work might include finding a way to reduce the virtqueue kick
>rate for datagram flows with high packet loss.
>
>Signed-off-by: Bobby Eshleman <bobby.eshleman@bytedance.com>
>---
> drivers/vhost/vsock.c                   |  27 ++++-
> include/linux/virtio_vsock.h            |   5 +-
> include/net/af_vsock.h                  |   1 +
> include/uapi/linux/virtio_vsock.h       |   1 +
> net/vmw_vsock/af_vsock.c                |  58 +++++++--
> net/vmw_vsock/virtio_transport.c        |  23 +++-
> net/vmw_vsock/virtio_transport_common.c | 207 ++++++++++++++++++++++++--------
> net/vmw_vsock/vsock_loopback.c          |   8 +-
> 8 files changed, 264 insertions(+), 66 deletions(-)
>
>diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
>index 8f0082da5e70..159c1a22c1a8 100644
>--- a/drivers/vhost/vsock.c
>+++ b/drivers/vhost/vsock.c
>@@ -32,7 +32,8 @@
> enum {
> 	VHOST_VSOCK_FEATURES = VHOST_FEATURES |
> 			       (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
>-			       (1ULL << VIRTIO_VSOCK_F_SEQPACKET)
>+			       (1ULL << VIRTIO_VSOCK_F_SEQPACKET) |
>+			       (1ULL << VIRTIO_VSOCK_F_DGRAM)
> };
>
> enum {
>@@ -56,6 +57,7 @@ struct vhost_vsock {
> 	atomic_t queued_replies;
>
> 	u32 guest_cid;
>+	bool dgram_allow;
> 	bool seqpacket_allow;
> };
>
>@@ -394,6 +396,7 @@ static bool vhost_vsock_more_replies(struct vhost_vsock *vsock)
> 	return val < vq->num;
> }
>
>+static bool vhost_transport_dgram_allow(u32 cid, u32 port);
> static bool vhost_transport_seqpacket_allow(u32 remote_cid);
>
> static struct virtio_transport vhost_transport = {
>@@ -410,10 +413,11 @@ static struct virtio_transport vhost_transport = {
> 		.cancel_pkt               = vhost_transport_cancel_pkt,
>
> 		.dgram_enqueue            = virtio_transport_dgram_enqueue,
>-		.dgram_allow              = virtio_transport_dgram_allow,
>+		.dgram_allow              = vhost_transport_dgram_allow,
> 		.dgram_get_cid		  = virtio_transport_dgram_get_cid,
> 		.dgram_get_port		  = virtio_transport_dgram_get_port,
> 		.dgram_get_length	  = virtio_transport_dgram_get_length,
>+		.dgram_payload_offset	  = 0,
>
> 		.stream_enqueue           = virtio_transport_stream_enqueue,
> 		.stream_dequeue           = virtio_transport_stream_dequeue,
>@@ -446,6 +450,22 @@ static struct virtio_transport vhost_transport = {
> 	.send_pkt = vhost_transport_send_pkt,
> };
>
>+static bool vhost_transport_dgram_allow(u32 cid, u32 port)
>+{
>+	struct vhost_vsock *vsock;
>+	bool dgram_allow = false;
>+
>+	rcu_read_lock();
>+	vsock = vhost_vsock_get(cid);
>+
>+	if (vsock)
>+		dgram_allow = vsock->dgram_allow;
>+
>+	rcu_read_unlock();
>+
>+	return dgram_allow;
>+}
>+
> static bool vhost_transport_seqpacket_allow(u32 remote_cid)
> {
> 	struct vhost_vsock *vsock;
>@@ -802,6 +822,9 @@ static int vhost_vsock_set_features(struct vhost_vsock *vsock, u64 features)
> 	if (features & (1ULL << VIRTIO_VSOCK_F_SEQPACKET))
> 		vsock->seqpacket_allow = true;
>
>+	if (features & (1ULL << VIRTIO_VSOCK_F_DGRAM))
>+		vsock->dgram_allow = true;
>+
> 	for (i = 0; i < ARRAY_SIZE(vsock->vqs); i++) {
> 		vq = &vsock->vqs[i];
> 		mutex_lock(&vq->mutex);
>diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>index 73afa09f4585..237ca87a2ecd 100644
>--- a/include/linux/virtio_vsock.h
>+++ b/include/linux/virtio_vsock.h
>@@ -216,7 +216,6 @@ void virtio_transport_notify_buffer_size(struct vsock_sock *vsk, u64 *val);
> u64 virtio_transport_stream_rcvhiwat(struct vsock_sock *vsk);
> bool virtio_transport_stream_is_active(struct vsock_sock *vsk);
> bool virtio_transport_stream_allow(u32 cid, u32 port);
>-bool virtio_transport_dgram_allow(u32 cid, u32 port);
> int virtio_transport_dgram_get_cid(struct sk_buff *skb, unsigned int *cid);
> int virtio_transport_dgram_get_port(struct sk_buff *skb, unsigned int *port);
> int virtio_transport_dgram_get_length(struct sk_buff *skb, size_t *len);
>@@ -247,4 +246,8 @@ void virtio_transport_put_credit(struct virtio_vsock_sock *vvs, u32 credit);
> void virtio_transport_deliver_tap_pkt(struct sk_buff *skb);
> int virtio_transport_purge_skbs(void *vsk, struct sk_buff_head *list);
> int virtio_transport_read_skb(struct vsock_sock *vsk, skb_read_actor_t read_actor);
>+void virtio_transport_init_dgram_bind_tables(void);
>+int virtio_transport_dgram_get_cid(struct sk_buff *skb, unsigned int *cid);
>+int virtio_transport_dgram_get_port(struct sk_buff *skb, unsigned int *port);
>+int virtio_transport_dgram_get_length(struct sk_buff *skb, size_t *len);
> #endif /* _LINUX_VIRTIO_VSOCK_H */
>diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
>index 7bedb9ee7e3e..c115e655b4f5 100644
>--- a/include/net/af_vsock.h
>+++ b/include/net/af_vsock.h
>@@ -225,6 +225,7 @@ void vsock_for_each_connected_socket(struct vsock_transport *transport,
> 				     void (*fn)(struct sock *sk));
> int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk);
> bool vsock_find_cid(unsigned int cid);
>+struct sock *vsock_find_bound_dgram_socket(struct sockaddr_vm *addr);
>
> /**** TAP ****/
>
>diff --git a/include/uapi/linux/virtio_vsock.h b/include/uapi/linux/virtio_vsock.h
>index 9c25f267bbc0..27b4b2b8bf13 100644
>--- a/include/uapi/linux/virtio_vsock.h
>+++ b/include/uapi/linux/virtio_vsock.h
>@@ -70,6 +70,7 @@ struct virtio_vsock_hdr {
> enum virtio_vsock_type {
> 	VIRTIO_VSOCK_TYPE_STREAM = 1,
> 	VIRTIO_VSOCK_TYPE_SEQPACKET = 2,
>+	VIRTIO_VSOCK_TYPE_DGRAM = 3,
> };
>
> enum virtio_vsock_op {
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 7a3ca4270446..b0b18e7f4299 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c

I would split this patch in 2, one with the changes in af_vsock.c,
of for the virtio changes.

>@@ -114,6 +114,7 @@
> static int __vsock_bind(struct sock *sk, struct sockaddr_vm *addr);
> static void vsock_sk_destruct(struct sock *sk);
> static int vsock_queue_rcv_skb(struct sock *sk, struct sk_buff *skb);
>+static bool sock_type_connectible(u16 type);
>
> /* Protocol family. */
> struct proto vsock_proto = {
>@@ -180,6 +181,8 @@ struct list_head vsock_connected_table[VSOCK_HASH_SIZE];
> EXPORT_SYMBOL_GPL(vsock_connected_table);
> DEFINE_SPINLOCK(vsock_table_lock);
> EXPORT_SYMBOL_GPL(vsock_table_lock);
>+static struct list_head vsock_dgram_bind_table[VSOCK_HASH_SIZE];
>+static DEFINE_SPINLOCK(vsock_dgram_table_lock);
>
> /* Autobind this socket to the local address if necessary. */
> static int vsock_auto_bind(struct vsock_sock *vsk)
>@@ -202,6 +205,9 @@ static void vsock_init_tables(void)
>
> 	for (i = 0; i < ARRAY_SIZE(vsock_connected_table); i++)
> 		INIT_LIST_HEAD(&vsock_connected_table[i]);
>+
>+	for (i = 0; i < ARRAY_SIZE(vsock_dgram_bind_table); i++)
>+		INIT_LIST_HEAD(&vsock_dgram_bind_table[i]);
> }
>
> static void __vsock_insert_bound(struct list_head *list,
>@@ -230,8 +236,8 @@ static void __vsock_remove_connected(struct vsock_sock *vsk)
> 	sock_put(&vsk->sk);
> }
>
>-struct sock *vsock_find_bound_socket_common(struct sockaddr_vm *addr,
>-					    struct list_head *bind_table)
>+static struct sock *vsock_find_bound_socket_common(struct sockaddr_vm *addr,
>+						   struct list_head *bind_table)
> {
> 	struct vsock_sock *vsk;
>
>@@ -248,6 +254,23 @@ struct sock *vsock_find_bound_socket_common(struct sockaddr_vm *addr,
> 	return NULL;
> }
>
>+struct sock *
>+vsock_find_bound_dgram_socket(struct sockaddr_vm *addr)
>+{
>+	struct sock *sk;
>+
>+	spin_lock_bh(&vsock_dgram_table_lock);
>+	sk = vsock_find_bound_socket_common(addr,
>+					    &vsock_dgram_bind_table[VSOCK_HASH(addr)]);
>+	if (sk)
>+		sock_hold(sk);
>+
>+	spin_unlock_bh(&vsock_dgram_table_lock);
>+
>+	return sk;
>+}
>+EXPORT_SYMBOL_GPL(vsock_find_bound_dgram_socket);
>+
> static struct sock *__vsock_find_bound_socket(struct sockaddr_vm *addr)
> {
> 	return vsock_find_bound_socket_common(addr, vsock_bound_sockets(addr));
>@@ -287,6 +310,14 @@ void vsock_insert_connected(struct vsock_sock *vsk)
> }
> EXPORT_SYMBOL_GPL(vsock_insert_connected);
>
>+static void vsock_remove_dgram_bound(struct vsock_sock *vsk)
>+{
>+	spin_lock_bh(&vsock_dgram_table_lock);
>+	if (__vsock_in_bound_table(vsk))
>+		__vsock_remove_bound(vsk);
>+	spin_unlock_bh(&vsock_dgram_table_lock);
>+}
>+
> void vsock_remove_bound(struct vsock_sock *vsk)
> {
> 	spin_lock_bh(&vsock_table_lock);
>@@ -338,7 +369,10 @@ EXPORT_SYMBOL_GPL(vsock_find_connected_socket);
>
> void vsock_remove_sock(struct vsock_sock *vsk)
> {
>-	vsock_remove_bound(vsk);
>+	if (sock_type_connectible(sk_vsock(vsk)->sk_type))
>+		vsock_remove_bound(vsk);
>+	else
>+		vsock_remove_dgram_bound(vsk);
> 	vsock_remove_connected(vsk);
> }
> EXPORT_SYMBOL_GPL(vsock_remove_sock);
>@@ -720,11 +754,19 @@ static int __vsock_bind_connectible(struct vsock_sock *vsk,
> 	return vsock_bind_common(vsk, addr, vsock_bind_table, VSOCK_HASH_SIZE + 1);
> }
>
>-static int __vsock_bind_dgram(struct vsock_sock *vsk,
>-			      struct sockaddr_vm *addr)
>+static int vsock_bind_dgram(struct vsock_sock *vsk,
>+			    struct sockaddr_vm *addr)
> {
>-	if (!vsk->transport || !vsk->transport->dgram_bind)
>-		return -EINVAL;
>+	if (!vsk->transport || !vsk->transport->dgram_bind) {
>+		int retval;
>+
>+		spin_lock_bh(&vsock_dgram_table_lock);
>+		retval = vsock_bind_common(vsk, addr, vsock_dgram_bind_table,
>+					   VSOCK_HASH_SIZE);
>+		spin_unlock_bh(&vsock_dgram_table_lock);
>+
>+		return retval;
>+	}
>
> 	return vsk->transport->dgram_bind(vsk, addr);
> }
>@@ -755,7 +797,7 @@ static int __vsock_bind(struct sock *sk, struct sockaddr_vm *addr)
> 		break;
>
> 	case SOCK_DGRAM:
>-		retval = __vsock_bind_dgram(vsk, addr);
>+		retval = vsock_bind_dgram(vsk, addr);
> 		break;
>
> 	default:
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index 1b7843a7779a..7160a3104218 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -63,6 +63,7 @@ struct virtio_vsock {
>
> 	u32 guest_cid;
> 	bool seqpacket_allow;
>+	bool dgram_allow;
> };
>
> static u32 virtio_transport_get_local_cid(void)
>@@ -413,6 +414,7 @@ static void virtio_vsock_rx_done(struct virtqueue *vq)
> 	queue_work(virtio_vsock_workqueue, &vsock->rx_work);
> }
>
>+static bool virtio_transport_dgram_allow(u32 cid, u32 port);
> static bool virtio_transport_seqpacket_allow(u32 remote_cid);
>
> static struct virtio_transport virtio_transport = {
>@@ -465,6 +467,21 @@ static struct virtio_transport virtio_transport = {
> 	.send_pkt = virtio_transport_send_pkt,
> };
>
>+static bool virtio_transport_dgram_allow(u32 cid, u32 port)
>+{
>+	struct virtio_vsock *vsock;
>+	bool dgram_allow;
>+
>+	dgram_allow = false;
>+	rcu_read_lock();
>+	vsock = rcu_dereference(the_virtio_vsock);
>+	if (vsock)
>+		dgram_allow = vsock->dgram_allow;
>+	rcu_read_unlock();
>+
>+	return dgram_allow;
>+}
>+
> static bool virtio_transport_seqpacket_allow(u32 remote_cid)
> {
> 	struct virtio_vsock *vsock;
>@@ -658,6 +675,9 @@ static int virtio_vsock_probe(struct virtio_device *vdev)
> 	if (virtio_has_feature(vdev, VIRTIO_VSOCK_F_SEQPACKET))
> 		vsock->seqpacket_allow = true;
>
>+	if (virtio_has_feature(vdev, VIRTIO_VSOCK_F_DGRAM))
>+		vsock->dgram_allow = true;
>+
> 	vdev->priv = vsock;
>
> 	ret = virtio_vsock_vqs_init(vsock);
>@@ -750,7 +770,8 @@ static struct virtio_device_id id_table[] = {
> };
>
> static unsigned int features[] = {
>-	VIRTIO_VSOCK_F_SEQPACKET
>+	VIRTIO_VSOCK_F_SEQPACKET,
>+	VIRTIO_VSOCK_F_DGRAM
> };
>
> static struct virtio_driver virtio_vsock_driver = {
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index d5a3c8efe84b..bc9d459723f5 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -37,6 +37,35 @@ virtio_transport_get_ops(struct vsock_sock *vsk)
> 	return container_of(t, struct virtio_transport, transport);
> }
>
>+/* Requires info->msg and info->vsk */
>+static struct sk_buff *
>+virtio_transport_sock_alloc_send_skb(struct virtio_vsock_pkt_info *info, unsigned int size,
>+				     gfp_t mask, int *err)
>+{
>+	struct sk_buff *skb;
>+	struct sock *sk;
>+	int noblock;
>+
>+	if (size < VIRTIO_VSOCK_SKB_HEADROOM) {
>+		*err = -EINVAL;
>+		return NULL;
>+	}
>+
>+	if (info->msg)
>+		noblock = info->msg->msg_flags & MSG_DONTWAIT;
>+	else
>+		noblock = 1;
>+
>+	sk = sk_vsock(info->vsk);
>+	sk->sk_allocation = mask;
>+	skb = sock_alloc_send_skb(sk, size, noblock, err);
>+	if (!skb)
>+		return NULL;
>+
>+	skb_reserve(skb, VIRTIO_VSOCK_SKB_HEADROOM);
>+	return skb;
>+}
>+
> /* Returns a new packet on success, otherwise returns NULL.
>  *
>  * If NULL is returned, errp is set to a negative errno.
      ^
So this comment was wrong before this change?

>@@ -47,7 +76,8 @@ virtio_transport_alloc_skb(struct virtio_vsock_pkt_info *info,
> 			   u32 src_cid,
> 			   u32 src_port,
> 			   u32 dst_cid,
>-			   u32 dst_port)
>+			   u32 dst_port,
>+			   int *errp)
> {
> 	const size_t skb_len = VIRTIO_VSOCK_SKB_HEADROOM + len;
> 	struct virtio_vsock_hdr *hdr;
>@@ -55,9 +85,21 @@ virtio_transport_alloc_skb(struct virtio_vsock_pkt_info *info,
> 	void *payload;
> 	int err;
>
>-	skb = virtio_vsock_alloc_skb(skb_len, GFP_KERNEL);
>-	if (!skb)
>+	/* dgrams do not use credits, self-throttle according to sk_sndbuf
>+	 * using sock_alloc_send_skb. This helps avoid triggering the OOM.
>+	 */

I'm thinking if we should do somenthing similar also for other types...

>+	if (info->vsk && info->type == VIRTIO_VSOCK_TYPE_DGRAM) {
>+		skb = virtio_transport_sock_alloc_send_skb(info, 
>skb_len, GFP_KERNEL, &err);

Why not using errp here?

>+	} else {
>+		skb = virtio_vsock_alloc_skb(skb_len, GFP_KERNEL);

Maybe we can pass errp also to virtio_vsock_alloc_skb.


The rest LGTM.

Anyway, the implementation seems to work well, so I think now we should
discuss the virtio-spec changes, that with this approach should be
not big, right?

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
