Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1677702AD
	for <lists.virtualization@lfdr.de>; Fri,  4 Aug 2023 16:12:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11E4841862;
	Fri,  4 Aug 2023 14:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11E4841862
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nd8tkAj0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zm_WXrCXtXSi; Fri,  4 Aug 2023 14:12:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 09FA1417C6;
	Fri,  4 Aug 2023 14:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09FA1417C6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 155C7C008D;
	Fri,  4 Aug 2023 14:12:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2F6FC0032
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Aug 2023 14:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9E284098F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Aug 2023 14:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9E284098F
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nd8tkAj0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0eTmEi7ii1Z9
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Aug 2023 14:12:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22FE040169
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Aug 2023 14:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22FE040169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691158332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WHq89owExHXEN5wTdfBSZOL2rI8mRCffwd4P4dht0mw=;
 b=Nd8tkAj0brW+zucU/TWealhxqNAEUTrAAT21Vu54QqGQQz7RMpRdRAMlrAEIsKjGSGoLzy
 ZvxDuraLJx5QT2zHrgX18AEXlvpOBXa61BfYgnbq50SHZVprZ/d66ivdkiOje4TaRMFAUb
 0pyTt/sxo7EtTZ07dtwyPskwS3KmSUE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-l_uv-0jUP8uO3ZzKiXChxQ-1; Fri, 04 Aug 2023 10:12:09 -0400
X-MC-Unique: l_uv-0jUP8uO3ZzKiXChxQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3f9e616e25dso25806421cf.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 04 Aug 2023 07:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691158329; x=1691763129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WHq89owExHXEN5wTdfBSZOL2rI8mRCffwd4P4dht0mw=;
 b=N/X162rvX1no2lB/xugZdl36vfwdWKOA5MGVZ5ED23FUrfDupXxLiVoXCjQdCqJHku
 hh6yYATTmCdXdmdDFQaRxL2Lv2nD/cNS/AxWLSZjazGE4Dny0Hftgi2FtvRFxAjAigq6
 i2zfMvcm/x/fX8J5ylcWjXLFSsmpibXkIcI8ruZ78PRgbZJL1I317yr9YmqquAU8P0YT
 icThI4BebCLnz6RPTD15YlIjxcQVQ/G/rcr23Bzb3Dg/odz37jDkk9V5NyRVwB2YMeHn
 Kf3bDmoEPkP5VfeyIVu1tZoQVhFwnCBZciAz8565918v5Y42JXWRc4JUGfIqPZkyQp4W
 HeSA==
X-Gm-Message-State: AOJu0YyUolOA6WeYhpcjNzcfgvfDGV4elVisZrclUjWq7kR5qsIEgp0h
 ACL6dorqvIfuxlZn/21ruRibInhUdaAiCeEZYTwChgKfkpNBGvmEsg73PJBecsIcAYN0hJlQRTi
 KCx4i1jEjUBN9dgWPhNTRCIkAKjxowJb1XThNDdLuyQ==
X-Received: by 2002:ac8:5809:0:b0:403:aa49:606e with SMTP id
 g9-20020ac85809000000b00403aa49606emr2886525qtg.30.1691158328589; 
 Fri, 04 Aug 2023 07:12:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiObUHLzwFE5ecHC87/Nt0Wf7plaZ14c7vzUDNQ77mo5js0jb8BbtyPzZ2XMntkY1Im9cqEg==
X-Received: by 2002:ac8:5809:0:b0:403:aa49:606e with SMTP id
 g9-20020ac85809000000b00403aa49606emr2886476qtg.30.1691158328175; 
 Fri, 04 Aug 2023 07:12:08 -0700 (PDT)
Received: from sgarzare-redhat (host-82-57-51-214.retail.telecomitalia.it.
 [82.57.51.214]) by smtp.gmail.com with ESMTPSA id
 e8-20020ac81308000000b003ef189ffa82sm664028qtj.90.2023.08.04.07.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 07:12:07 -0700 (PDT)
Date: Fri, 4 Aug 2023 16:11:58 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: Re: [PATCH RFC net-next v5 03/14] af_vsock: support multi-transport
 datagrams
Message-ID: <tqynchyi6ceb3d7lbd4cwt6f6hu6ma3nq6dkqfknnmwstgx62w@z2dp5ybgmx4s>
References: <20230413-b4-vsock-dgram-v5-0-581bd37fdb26@bytedance.com>
 <20230413-b4-vsock-dgram-v5-3-581bd37fdb26@bytedance.com>
 <43fad7ab-2ca9-608e-566f-80e607d2d6b8@gmail.com>
 <ZMrXrBHuaEcpxGwA@bullseye> <ZMr6giur//A1hrND@bullseye>
 <7ioiy325g6bkplp6sqk676sk62wlsxaqy6luwjnnztxsgd3srt@5nh73ct53kr3>
 <ZMv40KJo/9Pd2Lik@bullseye>
MIME-Version: 1.0
In-Reply-To: <ZMv40KJo/9Pd2Lik@bullseye>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-hyperv@vger.kernel.org, Bobby Eshleman <bobby.eshleman@bytedance.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Simon Horman <simon.horman@corigine.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Bryan Tan <bryantan@vmware.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Arseniy Krasnov <oxffffaa@gmail.com>,
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

On Thu, Aug 03, 2023 at 06:58:24PM +0000, Bobby Eshleman wrote:
>On Thu, Aug 03, 2023 at 02:42:26PM +0200, Stefano Garzarella wrote:
>> On Thu, Aug 03, 2023 at 12:53:22AM +0000, Bobby Eshleman wrote:
>> > On Wed, Aug 02, 2023 at 10:24:44PM +0000, Bobby Eshleman wrote:
>> > > On Sun, Jul 23, 2023 at 12:53:15AM +0300, Arseniy Krasnov wrote:
>> > > >
>> > > >
>> > > > On 19.07.2023 03:50, Bobby Eshleman wrote:
>> > > > > This patch adds support for multi-transport datagrams.
>> > > > >
>> > > > > This includes:
>> > > > > - Per-packet lookup of transports when using sendto(sockaddr_vm)
>> > > > > - Selecting H2G or G2H transport using VMADDR_FLAG_TO_HOST and CID in
>> > > > >   sockaddr_vm
>> > > > > - rename VSOCK_TRANSPORT_F_DGRAM to VSOCK_TRANSPORT_F_DGRAM_FALLBACK
>> > > > > - connect() now assigns the transport for (similar to connectible
>> > > > >   sockets)
>> > > > >
>> > > > > To preserve backwards compatibility with VMCI, some important changes
>> > > > > are made. The "transport_dgram" / VSOCK_TRANSPORT_F_DGRAM is changed to
>> > > > > be used for dgrams only if there is not yet a g2h or h2g transport that
>> > > > > has been registered that can transmit the packet. If there is a g2h/h2g
>> > > > > transport for that remote address, then that transport will be used and
>> > > > > not "transport_dgram". This essentially makes "transport_dgram" a
>> > > > > fallback transport for when h2g/g2h has not yet gone online, and so it
>> > > > > is renamed "transport_dgram_fallback". VMCI implements this transport.
>> > > > >
>> > > > > The logic around "transport_dgram" needs to be retained to prevent
>> > > > > breaking VMCI:
>> > > > >
>> > > > > 1) VMCI datagrams existed prior to h2g/g2h and so operate under a
>> > > > >    different paradigm. When the vmci transport comes online, it registers
>> > > > >    itself with the DGRAM feature, but not H2G/G2H. Only later when the
>> > > > >    transport has more information about its environment does it register
>> > > > >    H2G or G2H.  In the case that a datagram socket is created after
>> > > > >    VSOCK_TRANSPORT_F_DGRAM registration but before G2H/H2G registration,
>> > > > >    the "transport_dgram" transport is the only registered transport and so
>> > > > >    needs to be used.
>> > > > >
>> > > > > 2) VMCI seems to require a special message be sent by the transport when a
>> > > > >    datagram socket calls bind(). Under the h2g/g2h model, the transport
>> > > > >    is selected using the remote_addr which is set by connect(). At
>> > > > >    bind time there is no remote_addr because often no connect() has been
>> > > > >    called yet: the transport is null. Therefore, with a null transport
>> > > > >    there doesn't seem to be any good way for a datagram socket to tell the
>> > > > >    VMCI transport that it has just had bind() called upon it.
>> > > > >
>> > > > > With the new fallback logic, after H2G/G2H comes online the socket layer
>> > > > > will access the VMCI transport via transport_{h2g,g2h}. Prior to H2G/G2H
>> > > > > coming online, the socket layer will access the VMCI transport via
>> > > > > "transport_dgram_fallback".
>> > > > >
>> > > > > Only transports with a special datagram fallback use-case such as VMCI
>> > > > > need to register VSOCK_TRANSPORT_F_DGRAM_FALLBACK.
>> > > > >
>> > > > > Signed-off-by: Bobby Eshleman <bobby.eshleman@bytedance.com>
>> > > > > ---
>> > > > >  drivers/vhost/vsock.c                   |  1 -
>> > > > >  include/linux/virtio_vsock.h            |  2 --
>> > > > >  include/net/af_vsock.h                  | 10 +++---
>> > > > >  net/vmw_vsock/af_vsock.c                | 64 ++++++++++++++++++++++++++-------
>> > > > >  net/vmw_vsock/hyperv_transport.c        |  6 ----
>> > > > >  net/vmw_vsock/virtio_transport.c        |  1 -
>> > > > >  net/vmw_vsock/virtio_transport_common.c |  7 ----
>> > > > >  net/vmw_vsock/vmci_transport.c          |  2 +-
>> > > > >  net/vmw_vsock/vsock_loopback.c          |  1 -
>> > > > >  9 files changed, 58 insertions(+), 36 deletions(-)
>> > > > >
>> > > > > diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
>> > > > > index ae8891598a48..d5d6a3c3f273 100644
>> > > > > --- a/drivers/vhost/vsock.c
>> > > > > +++ b/drivers/vhost/vsock.c
>> > > > > @@ -410,7 +410,6 @@ static struct virtio_transport vhost_transport = {
>> > > > >  		.cancel_pkt               = vhost_transport_cancel_pkt,
>> > > > >
>> > > > >  		.dgram_enqueue            = virtio_transport_dgram_enqueue,
>> > > > > -		.dgram_bind               = virtio_transport_dgram_bind,
>> > > > >  		.dgram_allow              = virtio_transport_dgram_allow,
>> > > > >
>> > > > >  		.stream_enqueue           = virtio_transport_stream_enqueue,
>> > > > > diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>> > > > > index 18cbe8d37fca..7632552bee58 100644
>> > > > > --- a/include/linux/virtio_vsock.h
>> > > > > +++ b/include/linux/virtio_vsock.h
>> > > > > @@ -211,8 +211,6 @@ void virtio_transport_notify_buffer_size(struct vsock_sock *vsk, u64 *val);
>> > > > >  u64 virtio_transport_stream_rcvhiwat(struct vsock_sock *vsk);
>> > > > >  bool virtio_transport_stream_is_active(struct vsock_sock *vsk);
>> > > > >  bool virtio_transport_stream_allow(u32 cid, u32 port);
>> > > > > -int virtio_transport_dgram_bind(struct vsock_sock *vsk,
>> > > > > -				struct sockaddr_vm *addr);
>> > > > >  bool virtio_transport_dgram_allow(u32 cid, u32 port);
>> > > > >
>> > > > >  int virtio_transport_connect(struct vsock_sock *vsk);
>> > > > > diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
>> > > > > index 305d57502e89..f6a0ca9d7c3e 100644
>> > > > > --- a/include/net/af_vsock.h
>> > > > > +++ b/include/net/af_vsock.h
>> > > > > @@ -96,13 +96,13 @@ struct vsock_transport_send_notify_data {
>> > > > >
>> > > > >  /* Transport features flags */
>> > > > >  /* Transport provides host->guest communication */
>> > > > > -#define VSOCK_TRANSPORT_F_H2G		0x00000001
>> > > > > +#define VSOCK_TRANSPORT_F_H2G			0x00000001
>> > > > >  /* Transport provides guest->host communication */
>> > > > > -#define VSOCK_TRANSPORT_F_G2H		0x00000002
>> > > > > -/* Transport provides DGRAM communication */
>> > > > > -#define VSOCK_TRANSPORT_F_DGRAM		0x00000004
>> > > > > +#define VSOCK_TRANSPORT_F_G2H			0x00000002
>> > > > > +/* Transport provides fallback for DGRAM communication */
>> > > > > +#define VSOCK_TRANSPORT_F_DGRAM_FALLBACK	0x00000004
>> > > > >  /* Transport provides local (loopback) communication */
>> > > > > -#define VSOCK_TRANSPORT_F_LOCAL		0x00000008
>> > > > > +#define VSOCK_TRANSPORT_F_LOCAL			0x00000008
>> > > > >
>> > > > >  struct vsock_transport {
>> > > > >  	struct module *module;
>> > > > > diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>> > > > > index ae5ac5531d96..26c97b33d55a 100644
>> > > > > --- a/net/vmw_vsock/af_vsock.c
>> > > > > +++ b/net/vmw_vsock/af_vsock.c
>> > > > > @@ -139,8 +139,8 @@ struct proto vsock_proto = {
>> > > > >  static const struct vsock_transport *transport_h2g;
>> > > > >  /* Transport used for guest->host communication */
>> > > > >  static const struct vsock_transport *transport_g2h;
>> > > > > -/* Transport used for DGRAM communication */
>> > > > > -static const struct vsock_transport *transport_dgram;
>> > > > > +/* Transport used as a fallback for DGRAM communication */
>> > > > > +static const struct vsock_transport *transport_dgram_fallback;
>> > > > >  /* Transport used for local communication */
>> > > > >  static const struct vsock_transport *transport_local;
>> > > > >  static DEFINE_MUTEX(vsock_register_mutex);
>> > > > > @@ -439,6 +439,18 @@ vsock_connectible_lookup_transport(unsigned int cid, __u8 flags)
>> > > > >  	return transport;
>> > > > >  }
>> > > > >
>> > > > > +static const struct vsock_transport *
>> > > > > +vsock_dgram_lookup_transport(unsigned int cid, __u8 flags)
>> > > > > +{
>> > > > > +	const struct vsock_transport *transport;
>> > > > > +
>> > > > > +	transport = vsock_connectible_lookup_transport(cid, flags);
>> > > > > +	if (transport)
>> > > > > +		return transport;
>> > > > > +
>> > > > > +	return transport_dgram_fallback;
>> > > > > +}
>> > > > > +
>> > > > >  /* Assign a transport to a socket and call the .init transport callback.
>> > > > >   *
>> > > > >   * Note: for connection oriented socket this must be called when vsk->remote_addr
>> > > > > @@ -475,7 +487,8 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
>> > > > >
>> > > > >  	switch (sk->sk_type) {
>> > > > >  	case SOCK_DGRAM:
>> > > > > -		new_transport = transport_dgram;
>> > > > > +		new_transport = vsock_dgram_lookup_transport(remote_cid,
>> > > > > +							     remote_flags);
>> > > >
>> > > > I'm a little bit confused about this:
>> > > > 1) Let's create SOCK_DGRAM socket using vsock_create()
>> > > > 2) for SOCK_DGRAM it calls 'vsock_assign_transport()' and we go here, remote_cid == -1
>> > > > 3) I guess 'vsock_dgram_lookup_transport()' calls logic from 0002 and returns h2g for such remote cid, which is not
>> > > >    correct I think...
>> > > >
>> > > > Please correct me if i'm wrong
>> > > >
>> > > > Thanks, Arseniy
>> > > >
>> > >
>> > > As I understand, for the VMCI case, if transport_h2g != NULL, then
>> > > transport_h2g == transport_dgram_fallback. In either case,
>> > > vsk->transport == transport_dgram_fallback.
>> > >
>> > > For the virtio/vhost case, temporarily vsk->transport == transport_h2g,
>> > > but it is unused because vsk->transport->dgram_bind == NULL.
>> > >
>> > > Until SS_CONNECTED is set by connect() and vsk->transport is set
>> > > correctly, the send path is barred from using the bad transport.
>> > >
>> > > I guess the recvmsg() path is a little more sketchy, and probably only
>> > > works in my test cases because h2g/g2h in the vhost/virtio case have
>> > > identical dgram_addr_init() implementations.
>> > >
>> > > I think a cleaner solution is maybe checking in vsock_create() if
>> > > dgram_bind is implemented. If it is not, then vsk->transport should be
>> > > reset to NULL and a comment added explaining why VMCI requires this.
>> > >
>> > > Then the other calls can begin explicitly checking for vsk->transport ==
>> > > NULL.
>> >
>> > Actually, on further reflection here, in order for the vsk->transport to
>> > be called in time for ->dgram_addr_init(), it is going to be necessary
>> > to call vsock_assign_transport() in vsock_dgram_bind() anyway.
>> >
>> > I think this means that the vsock_assign_transport() call can be removed
>> > from vsock_create() call entirely, and yet VMCI can still dispatch
>> > messages upon bind() calls as needed.
>> >
>> > This would then simplify the whole arrangement, if there aren't other
>> > unseen issues.
>>
>> This sounds like a good approach.
>>
>> My only question is whether vsock_dgram_bind() is always called for each
>> dgram socket.
>>
>
>No, not yet.
>
>Currently, receivers may use vsock_dgram_recvmsg() prior to any bind,
>but this should probably change.
>
>For UDP, if we initialize a socket and call recvmsg() with no prior
>bind, then the socket will be auto-bound to 0.0.0.0. I guess vsock
>should probably also auto-bind in this case.

I see.

>
>For other cases, bind may not be called prior to calls to vsock_poll() /
>vsock_getname() (even if it doesn't make sense to do so), but I think it
>is okay as long as vsk->transport is not used.

Makes sense.

>
>vsock_dgram_sendmsg() always auto-binds if needed.

Okay, but the transport for sending messages, doesn't depend on the
local address, right?

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
