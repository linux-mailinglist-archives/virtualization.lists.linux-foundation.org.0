Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B07E73A39E
	for <lists.virtualization@lfdr.de>; Thu, 22 Jun 2023 16:52:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D46614C2;
	Thu, 22 Jun 2023 14:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19D46614C2
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CEx+W4LQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y4asSVcRgzDC; Thu, 22 Jun 2023 14:51:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4C4A76145C;
	Thu, 22 Jun 2023 14:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C4A76145C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99301C0089;
	Thu, 22 Jun 2023 14:51:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E227BC0029
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jun 2023 14:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9CC96145C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jun 2023 14:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9CC96145C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RxVZRHnF3i50
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jun 2023 14:51:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BCBF60F5F
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BCBF60F5F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jun 2023 14:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687445511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NlE+1+UEFn7TOyTdewg2G3cVK/4mKbKWDd4BMF27ZwU=;
 b=CEx+W4LQZWRKAjZiq57w5Su1mPlJXbJR0kKVt90kr5oylFAxtNrDwzpaTBKBf+UpCvXs0D
 2+Sqc3H31IoZVGBseMrP5klyJkUJGBFJyvdEKgfDOK9CP3uoVEh55bAx44h1lnxP53xTVM
 W9GqFPA5cfutSpbtcXnq0RJzlFcRke4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-iNWXMWreNee681CFVK7IFQ-1; Thu, 22 Jun 2023 10:51:47 -0400
X-MC-Unique: iNWXMWreNee681CFVK7IFQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-311275d1af2so2539019f8f.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Jun 2023 07:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687445506; x=1690037506;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NlE+1+UEFn7TOyTdewg2G3cVK/4mKbKWDd4BMF27ZwU=;
 b=L5sutBFB6Yz9IBxQUDvbr7P80oUoMbIRZRt8uZ+ZtZ+Y0D/bQjzzLRROg70jl060eD
 WbJYMf4R4c0VcRvejyotM0AkTiiArEPwGruXU8jyFian3pzm0X6DHf52MtPMMA/oPzfb
 bLxiHe/H1VUzQLyIBTB8AWO/cUcBGpAGfK6lp+tvq9dmmIeIFMPXviw3JfTZ4TmBABTB
 Ly2QhBqlN2RDQKJhqbEexuj2NpmykBI+5M2I9sWq24TimyZ70pHRNpriU+ahfD2aOUDI
 jPvad6/FEPAV4OQTv8qxFmdfjpHtT3aNSvakVn7/6L3Uaw9utjTUF45h05uhIwq8TXIc
 jvsA==
X-Gm-Message-State: AC+VfDyNZUf8+I+RiuSXl1RqbgM0I9/gsqU3tEdFBAILfReJIt1VvopU
 H8VrfmJAnChCg32bV9t30jAvu1D50ket1JKzgl4VlaXnbT0yzj+zRqJj/5G+mwpx2U+Q0c9RCOh
 Pn8Iu1LDPmllZps013+vRt1uNgz0qEn05990P3UtCwA==
X-Received: by 2002:a5d:4e8f:0:b0:30f:bf2e:4b99 with SMTP id
 e15-20020a5d4e8f000000b0030fbf2e4b99mr13131726wru.49.1687445506071; 
 Thu, 22 Jun 2023 07:51:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4DG0yCleMR8sdTfCkyZBISXomAuXi1L64Bt2M/q4TFHOYAhm1bGqBbBeKv7djaGjjxOKyQwQ==
X-Received: by 2002:a5d:4e8f:0:b0:30f:bf2e:4b99 with SMTP id
 e15-20020a5d4e8f000000b0030fbf2e4b99mr13131705wru.49.1687445505668; 
 Thu, 22 Jun 2023 07:51:45 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-160.retail.telecomitalia.it.
 [87.11.6.160]) by smtp.gmail.com with ESMTPSA id
 n11-20020a5d4c4b000000b003113ccbf388sm7334941wrt.13.2023.06.22.07.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 07:51:44 -0700 (PDT)
Date: Thu, 22 Jun 2023 16:51:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseniy Krasnov <oxffffaa@gmail.com>
Subject: Re: [PATCH RFC net-next v4 1/8] vsock/dgram: generalize recvmsg and
 drop transport->dgram_dequeue
Message-ID: <63ko2n5fwjdefot6rzcxdftfh6pilg6vmqn66v4ue5dgf4oz53@tntmdijw4ghr>
References: <20230413-b4-vsock-dgram-v4-0-0cebbb2ae899@bytedance.com>
 <20230413-b4-vsock-dgram-v4-1-0cebbb2ae899@bytedance.com>
 <3eb6216b-a3d2-e1ef-270c-8a0032a4a8a5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3eb6216b-a3d2-e1ef-270c-8a0032a4a8a5@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-hyperv@vger.kernel.org, Bobby Eshleman <bobby.eshleman@bytedance.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Simon Horman <simon.horman@corigine.com>,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Bryan Tan <bryantan@vmware.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Stefan Hajnoczi <stefanha@redhat.com>,
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

On Sun, Jun 11, 2023 at 11:43:15PM +0300, Arseniy Krasnov wrote:
>Hello Bobby! Thanks for this patchset! Small comment below:
>
>On 10.06.2023 03:58, Bobby Eshleman wrote:
>> This commit drops the transport->dgram_dequeue callback and makes
>> vsock_dgram_recvmsg() generic. It also adds additional transport
>> callbacks for use by the generic vsock_dgram_recvmsg(), such as for
>> parsing skbs for CID/port which vary in format per transport.
>>
>> Signed-off-by: Bobby Eshleman <bobby.eshleman@bytedance.com>
>> ---
>>  drivers/vhost/vsock.c                   |  4 +-
>>  include/linux/virtio_vsock.h            |  3 ++
>>  include/net/af_vsock.h                  | 13 ++++++-
>>  net/vmw_vsock/af_vsock.c                | 51 ++++++++++++++++++++++++-
>>  net/vmw_vsock/hyperv_transport.c        | 17 +++++++--
>>  net/vmw_vsock/virtio_transport.c        |  4 +-
>>  net/vmw_vsock/virtio_transport_common.c | 18 +++++++++
>>  net/vmw_vsock/vmci_transport.c          | 68 +++++++++++++--------------------
>>  net/vmw_vsock/vsock_loopback.c          |  4 +-
>>  9 files changed, 132 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
>> index 6578db78f0ae..c8201c070b4b 100644
>> --- a/drivers/vhost/vsock.c
>> +++ b/drivers/vhost/vsock.c
>> @@ -410,9 +410,11 @@ static struct virtio_transport vhost_transport = {
>>  		.cancel_pkt               = vhost_transport_cancel_pkt,
>>
>>  		.dgram_enqueue            = virtio_transport_dgram_enqueue,
>> -		.dgram_dequeue            = virtio_transport_dgram_dequeue,
>>  		.dgram_bind               = virtio_transport_dgram_bind,
>>  		.dgram_allow              = virtio_transport_dgram_allow,
>> +		.dgram_get_cid		  = virtio_transport_dgram_get_cid,
>> +		.dgram_get_port		  = virtio_transport_dgram_get_port,
>> +		.dgram_get_length	  = virtio_transport_dgram_get_length,
>>
>>  		.stream_enqueue           = virtio_transport_stream_enqueue,
>>  		.stream_dequeue           = virtio_transport_stream_dequeue,
>> diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>> index c58453699ee9..23521a318cf0 100644
>> --- a/include/linux/virtio_vsock.h
>> +++ b/include/linux/virtio_vsock.h
>> @@ -219,6 +219,9 @@ bool virtio_transport_stream_allow(u32 cid, u32 port);
>>  int virtio_transport_dgram_bind(struct vsock_sock *vsk,
>>  				struct sockaddr_vm *addr);
>>  bool virtio_transport_dgram_allow(u32 cid, u32 port);
>> +int virtio_transport_dgram_get_cid(struct sk_buff *skb, unsigned int *cid);
>> +int virtio_transport_dgram_get_port(struct sk_buff *skb, unsigned int *port);
>> +int virtio_transport_dgram_get_length(struct sk_buff *skb, size_t *len);
>>
>>  int virtio_transport_connect(struct vsock_sock *vsk);
>>
>> diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
>> index 0e7504a42925..7bedb9ee7e3e 100644
>> --- a/include/net/af_vsock.h
>> +++ b/include/net/af_vsock.h
>> @@ -120,11 +120,20 @@ struct vsock_transport {
>>
>>  	/* DGRAM. */
>>  	int (*dgram_bind)(struct vsock_sock *, struct sockaddr_vm *);
>> -	int (*dgram_dequeue)(struct vsock_sock *vsk, struct msghdr *msg,
>> -			     size_t len, int flags);
>>  	int (*dgram_enqueue)(struct vsock_sock *, struct sockaddr_vm *,
>>  			     struct msghdr *, size_t len);
>>  	bool (*dgram_allow)(u32 cid, u32 port);
>> +	int (*dgram_get_cid)(struct sk_buff *skb, unsigned int *cid);
>> +	int (*dgram_get_port)(struct sk_buff *skb, unsigned int *port);
>> +	int (*dgram_get_length)(struct sk_buff *skb, size_t *length);
>> +
>> +	/* The number of bytes into the buffer at which the payload starts, as
>> +	 * first seen by the receiving socket layer. For example, if the
>> +	 * transport presets the skb pointers using skb_pull(sizeof(header))
>> +	 * than this would be zero, otherwise it would be the size of the
>> +	 * header.
>> +	 */
>> +	const size_t dgram_payload_offset;
>>
>>  	/* STREAM. */
>>  	/* TODO: stream_bind() */
>> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>> index efb8a0937a13..ffb4dd8b6ea7 100644
>> --- a/net/vmw_vsock/af_vsock.c
>> +++ b/net/vmw_vsock/af_vsock.c
>> @@ -1271,11 +1271,15 @@ static int vsock_dgram_connect(struct socket *sock,
>>  int vsock_dgram_recvmsg(struct socket *sock, struct msghdr *msg,
>>  			size_t len, int flags)
>>  {
>> +	const struct vsock_transport *transport;
>>  #ifdef CONFIG_BPF_SYSCALL
>>  	const struct proto *prot;
>>  #endif
>>  	struct vsock_sock *vsk;
>> +	struct sk_buff *skb;
>> +	size_t payload_len;
>>  	struct sock *sk;
>> +	int err;
>>
>>  	sk = sock->sk;
>>  	vsk = vsock_sk(sk);
>> @@ -1286,7 +1290,52 @@ int vsock_dgram_recvmsg(struct socket *sock, struct msghdr *msg,
>>  		return prot->recvmsg(sk, msg, len, flags, NULL);
>>  #endif
>>
>> -	return vsk->transport->dgram_dequeue(vsk, msg, len, flags);
>> +	if (flags & MSG_OOB || flags & MSG_ERRQUEUE)
>> +		return -EOPNOTSUPP;
>> +
>> +	transport = vsk->transport;
>> +
>> +	/* Retrieve the head sk_buff from the socket's receive queue. */
>> +	err = 0;
>> +	skb = skb_recv_datagram(sk_vsock(vsk), flags, &err);
>> +	if (!skb)
>> +		return err;
>> +
>> +	err = transport->dgram_get_length(skb, &payload_len);

What about ssize_t return value here?

Or maybe a single callback that return both length and offset?

.dgram_get_payload_info(skb, &payload_len, &payload_off)

>> +	if (err)
>> +		goto out;
>> +
>> +	if (payload_len > len) {
>> +		payload_len = len;
>> +		msg->msg_flags |= MSG_TRUNC;
>> +	}
>> +
>> +	/* Place the datagram payload in the user's iovec. */
>> +	err = skb_copy_datagram_msg(skb, transport->dgram_payload_offset, msg, payload_len);
>> +	if (err)
>> +		goto out;
>> +
>> +	if (msg->msg_name) {
>> +		/* Provide the address of the sender. */
>> +		DECLARE_SOCKADDR(struct sockaddr_vm *, vm_addr, msg->msg_name);
>> +		unsigned int cid, port;
>> +
>> +		err = transport->dgram_get_cid(skb, &cid);
>> +		if (err)
>> +			goto out;
>> +
>> +		err = transport->dgram_get_port(skb, &port);
>> +		if (err)
>> +			goto out;
>
>Maybe we can merge 'dgram_get_cid' and 'dgram_get_port' to a single callback? Because I see that this is
>the only place where both are used (correct me if i'm wrong) and logically both operates with addresses:
>CID and port. E.g. something like that: dgram_get_cid_n_port().

What about .dgram_addr_init(struct sk_buff *skb, struct sockaddr_vm *addr)
and the transport can set cid and port?

>
>Moreover, I'm not sure, but is it good "tradeoff" here: remove transport specific callback for dgram receive
>where we already have 'msghdr' with both data buffer and buffer for 'sockaddr_vm' and instead of it add new
>several fields (callbacks) to transports like dgram_get_cid(), dgram_get_port()? I agree, that in each transport
>specific callback we will have same copying logic by calling 'skb_copy_datagram_msg()' and filling address
>by using 'vsock_addr_init()', but in this case we don't need to update transports too much. For example HyperV
>still unchanged as it does not support SOCK_DGRAM. For VMCI You just need to add 'vsock_addr_init()' logic
>to it's dgram dequeue callback.
>
>What do You think?

Honestly, I'd rather avoid duplicate code than reduce changes in
transports that don't support dgram.

One thing I do agree on though is minimizing the number of callbacks
to call to reduce the number of indirection (more performance?).

Thanks,
Stefano

>
>Thanks, Arseniy
>
>> +
>> +		vsock_addr_init(vm_addr, cid, port);
>> +		msg->msg_namelen = sizeof(*vm_addr);
>> +	}
>> +	err = payload_len;
>> +
>> +out:
>> +	skb_free_datagram(&vsk->sk, skb);
>> +	return err;
>>  }
>>  EXPORT_SYMBOL_GPL(vsock_dgram_recvmsg);
>>
>> diff --git a/net/vmw_vsock/hyperv_transport.c b/net/vmw_vsock/hyperv_transport.c
>> index 7cb1a9d2cdb4..ff6e87e25fa0 100644
>> --- a/net/vmw_vsock/hyperv_transport.c
>> +++ b/net/vmw_vsock/hyperv_transport.c
>> @@ -556,8 +556,17 @@ static int hvs_dgram_bind(struct vsock_sock *vsk, struct sockaddr_vm *addr)
>>  	return -EOPNOTSUPP;
>>  }
>>
>> -static int hvs_dgram_dequeue(struct vsock_sock *vsk, struct msghdr *msg,
>> -			     size_t len, int flags)
>> +static int hvs_dgram_get_cid(struct sk_buff *skb, unsigned int *cid)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static int hvs_dgram_get_port(struct sk_buff *skb, unsigned int *port)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static int hvs_dgram_get_length(struct sk_buff *skb, size_t *len)
>>  {
>>  	return -EOPNOTSUPP;
>>  }
>> @@ -833,7 +842,9 @@ static struct vsock_transport hvs_transport = {
>>  	.shutdown                 = hvs_shutdown,
>>
>>  	.dgram_bind               = hvs_dgram_bind,
>> -	.dgram_dequeue            = hvs_dgram_dequeue,
>> +	.dgram_get_cid		  = hvs_dgram_get_cid,
>> +	.dgram_get_port		  = hvs_dgram_get_port,
>> +	.dgram_get_length	  = hvs_dgram_get_length,
>>  	.dgram_enqueue            = hvs_dgram_enqueue,
>>  	.dgram_allow              = hvs_dgram_allow,
>>
>> diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>> index e95df847176b..5763cdf13804 100644
>> --- a/net/vmw_vsock/virtio_transport.c
>> +++ b/net/vmw_vsock/virtio_transport.c
>> @@ -429,9 +429,11 @@ static struct virtio_transport virtio_transport = {
>>  		.cancel_pkt               = virtio_transport_cancel_pkt,
>>
>>  		.dgram_bind               = virtio_transport_dgram_bind,
>> -		.dgram_dequeue            = virtio_transport_dgram_dequeue,
>>  		.dgram_enqueue            = virtio_transport_dgram_enqueue,
>>  		.dgram_allow              = virtio_transport_dgram_allow,
>> +		.dgram_get_cid		  = virtio_transport_dgram_get_cid,
>> +		.dgram_get_port		  = virtio_transport_dgram_get_port,
>> +		.dgram_get_length	  = virtio_transport_dgram_get_length,
>>
>>  		.stream_dequeue           = virtio_transport_stream_dequeue,
>>  		.stream_enqueue           = virtio_transport_stream_enqueue,
>> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>> index b769fc258931..e6903c719964 100644
>> --- a/net/vmw_vsock/virtio_transport_common.c
>> +++ b/net/vmw_vsock/virtio_transport_common.c
>> @@ -797,6 +797,24 @@ int virtio_transport_dgram_bind(struct vsock_sock *vsk,
>>  }
>>  EXPORT_SYMBOL_GPL(virtio_transport_dgram_bind);
>>
>> +int virtio_transport_dgram_get_cid(struct sk_buff *skb, unsigned int *cid)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +EXPORT_SYMBOL_GPL(virtio_transport_dgram_get_cid);
>> +
>> +int virtio_transport_dgram_get_port(struct sk_buff *skb, unsigned int *port)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +EXPORT_SYMBOL_GPL(virtio_transport_dgram_get_port);
>> +
>> +int virtio_transport_dgram_get_length(struct sk_buff *skb, size_t *len)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +EXPORT_SYMBOL_GPL(virtio_transport_dgram_get_length);
>> +
>>  bool virtio_transport_dgram_allow(u32 cid, u32 port)
>>  {
>>  	return false;
>> diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
>> index b370070194fa..bbc63826bf48 100644
>> --- a/net/vmw_vsock/vmci_transport.c
>> +++ b/net/vmw_vsock/vmci_transport.c
>> @@ -1731,57 +1731,40 @@ static int vmci_transport_dgram_enqueue(
>>  	return err - sizeof(*dg);
>>  }
>>
>> -static int vmci_transport_dgram_dequeue(struct vsock_sock *vsk,
>> -					struct msghdr *msg, size_t len,
>> -					int flags)
>> +static int vmci_transport_dgram_get_cid(struct sk_buff *skb, unsigned int *cid)
>>  {
>> -	int err;
>>  	struct vmci_datagram *dg;
>> -	size_t payload_len;
>> -	struct sk_buff *skb;
>>
>> -	if (flags & MSG_OOB || flags & MSG_ERRQUEUE)
>> -		return -EOPNOTSUPP;
>> +	dg = (struct vmci_datagram *)skb->data;
>> +	if (!dg)
>> +		return -EINVAL;
>>
>> -	/* Retrieve the head sk_buff from the socket's receive queue. */
>> -	err = 0;
>> -	skb = skb_recv_datagram(&vsk->sk, flags, &err);
>> -	if (!skb)
>> -		return err;
>> +	*cid = dg->src.context;
>> +	return 0;
>> +}
>> +
>> +static int vmci_transport_dgram_get_port(struct sk_buff *skb, unsigned int *port)
>> +{
>> +	struct vmci_datagram *dg;
>>
>>  	dg = (struct vmci_datagram *)skb->data;
>>  	if (!dg)
>> -		/* err is 0, meaning we read zero bytes. */
>> -		goto out;
>> -
>> -	payload_len = dg->payload_size;
>> -	/* Ensure the sk_buff matches the payload size claimed in the packet. */
>> -	if (payload_len != skb->len - sizeof(*dg)) {
>> -		err = -EINVAL;
>> -		goto out;
>> -	}
>> +		return -EINVAL;
>>
>> -	if (payload_len > len) {
>> -		payload_len = len;
>> -		msg->msg_flags |= MSG_TRUNC;
>> -	}
>> +	*port = dg->src.resource;
>> +	return 0;
>> +}
>>
>> -	/* Place the datagram payload in the user's iovec. */
>> -	err = skb_copy_datagram_msg(skb, sizeof(*dg), msg, payload_len);
>> -	if (err)
>> -		goto out;
>> +static int vmci_transport_dgram_get_length(struct sk_buff *skb, size_t *len)
>> +{
>> +	struct vmci_datagram *dg;
>>
>> -	if (msg->msg_name) {
>> -		/* Provide the address of the sender. */
>> -		DECLARE_SOCKADDR(struct sockaddr_vm *, vm_addr, msg->msg_name);
>> -		vsock_addr_init(vm_addr, dg->src.context, dg->src.resource);
>> -		msg->msg_namelen = sizeof(*vm_addr);
>> -	}
>> -	err = payload_len;
>> +	dg = (struct vmci_datagram *)skb->data;
>> +	if (!dg)
>> +		return -EINVAL;
>>
>> -out:
>> -	skb_free_datagram(&vsk->sk, skb);
>> -	return err;
>> +	*len = dg->payload_size;
>> +	return 0;
>>  }
>>
>>  static bool vmci_transport_dgram_allow(u32 cid, u32 port)
>> @@ -2040,9 +2023,12 @@ static struct vsock_transport vmci_transport = {
>>  	.release = vmci_transport_release,
>>  	.connect = vmci_transport_connect,
>>  	.dgram_bind = vmci_transport_dgram_bind,
>> -	.dgram_dequeue = vmci_transport_dgram_dequeue,
>>  	.dgram_enqueue = vmci_transport_dgram_enqueue,
>>  	.dgram_allow = vmci_transport_dgram_allow,
>> +	.dgram_get_cid = vmci_transport_dgram_get_cid,
>> +	.dgram_get_port = vmci_transport_dgram_get_port,
>> +	.dgram_get_length = vmci_transport_dgram_get_length,
>> +	.dgram_payload_offset = sizeof(struct vmci_datagram),
>>  	.stream_dequeue = vmci_transport_stream_dequeue,
>>  	.stream_enqueue = vmci_transport_stream_enqueue,
>>  	.stream_has_data = vmci_transport_stream_has_data,
>> diff --git a/net/vmw_vsock/vsock_loopback.c b/net/vmw_vsock/vsock_loopback.c
>> index 5c6360df1f31..2f3cabc79ee5 100644
>> --- a/net/vmw_vsock/vsock_loopback.c
>> +++ b/net/vmw_vsock/vsock_loopback.c
>> @@ -62,9 +62,11 @@ static struct virtio_transport loopback_transport = {
>>  		.cancel_pkt               = vsock_loopback_cancel_pkt,
>>
>>  		.dgram_bind               = virtio_transport_dgram_bind,
>> -		.dgram_dequeue            = virtio_transport_dgram_dequeue,
>>  		.dgram_enqueue            = virtio_transport_dgram_enqueue,
>>  		.dgram_allow              = virtio_transport_dgram_allow,
>> +		.dgram_get_cid		  = virtio_transport_dgram_get_cid,
>> +		.dgram_get_port		  = virtio_transport_dgram_get_port,
>> +		.dgram_get_length	  = virtio_transport_dgram_get_length,
>>
>>  		.stream_dequeue           = virtio_transport_stream_dequeue,
>>  		.stream_enqueue           = virtio_transport_stream_enqueue,
>>
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
