Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9EAF8CE8
	for <lists.virtualization@lfdr.de>; Tue, 12 Nov 2019 11:36:46 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 84B19EE1;
	Tue, 12 Nov 2019 10:36:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 42A04E8B
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 10:36:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 33D70DF
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573554997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=MtYx8D4UhXjFR2Vo9h0VL/OjZVQ/Uw5DM6wZNoc6GTw=;
	b=WwBnWqTb4IHtJTyqhE06pKBj3x1SPW4jRvdN+sT3UwyKBOzU6XhW7cY/CugKT8Q8Yzg8NP
	KBVZ8OTeoIPDo3llpA99HZ9Msuf0aG19+GBQ53LPT5ZM+Kf5wqbCfgkj/SSJsbPfOxMbiN
	VNBraRuKOuCCF7Sd7OyWpBVYjPyOzWY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-368-YJ20JKefPU2QRJlYwWW5Dw-1; Tue, 12 Nov 2019 05:36:36 -0500
Received: by mail-wr1-f72.google.com with SMTP id f8so11661077wrq.6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 02:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=cEKqFrG3VK0+fq0jdhQPgpS1QzH7bLmBVcLITLAfR9o=;
	b=JuKlnDP7sWKxWqIC0cLS127MIJZ+MYPE8S1cK6T4tEIGtiDo0g+HWbLTwUgH4Nir1/
	eyhncwjsLn97BieZwn2/XdGPJ4cX0riVSOmVMuv/oTUzmTnIH/yt+kqLJjUoQ5wNy8CW
	IWG+dvBQ5krOj4b35oZu9fHLHqG54bw7uSDPThSPG+vch7yJCZGcqBwLPN8CNIsCnmn2
	RjyK2CT5hh/lFLNp2uFww5zbc1yjogT1gfoVYYf6LxIKnksoaBcC59e93gwpkSnAUQ7A
	WrAZWocxklHQ/imncnKjsj4dJ5anv2gEwkkt6trrv8CHS9t7Y4jIS6kUd3eTPp7XvzLs
	jm1w==
X-Gm-Message-State: APjAAAU96i9bC+s4j5GwxjJjriMXEoSjW39jIu+3REIaGx3NIuR4TZPC
	5JL3bzgWPW5o9/LdiNoZC93jP38lS5m1z2aPL6bUEgfYcLvPryeDIARoH+Mg+dRLSq4qUvaANIz
	iltzi/1dvAh0Zbp7poN4i+0+nT0GnhoHVStj3e2Vvsg==
X-Received: by 2002:adf:e80d:: with SMTP id o13mr14169780wrm.73.1573554994794; 
	Tue, 12 Nov 2019 02:36:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqwj+bVTLysGUuaKq+Jm14o5nlQAH3NsewrbyWdkqvL+nAsSlaQ00Tbsx/oCesJe8hKmRCYdZg==
X-Received: by 2002:adf:e80d:: with SMTP id o13mr14169752wrm.73.1573554994493; 
	Tue, 12 Nov 2019 02:36:34 -0800 (PST)
Received: from steredhat (a-nu5-32.tin.it. [212.216.181.31])
	by smtp.gmail.com with ESMTPSA id j2sm3864847wrt.61.2019.11.12.02.36.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 02:36:33 -0800 (PST)
Date: Tue, 12 Nov 2019 11:36:30 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jorgen Hansen <jhansen@vmware.com>
Subject: Re: [PATCH net-next 11/14] vsock: add multi-transports support
Message-ID: <20191112103630.vd3kbk7xnplv6rey@steredhat>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-12-sgarzare@redhat.com>
	<MWHPR05MB33761FE4DA27130C72FC5048DA740@MWHPR05MB3376.namprd05.prod.outlook.com>
	<20191111171740.xwo7isdmtt7ywibo@steredhat>
	<MWHPR05MB33764F82AFA882B921A11E56DA770@MWHPR05MB3376.namprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR05MB33764F82AFA882B921A11E56DA770@MWHPR05MB3376.namprd05.prod.outlook.com>
X-MC-Unique: YJ20JKefPU2QRJlYwWW5Dw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>, Arnd Bergmann <arnd@arndb.de>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Tue, Nov 12, 2019 at 09:59:12AM +0000, Jorgen Hansen wrote:
> > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > Sent: Monday, November 11, 2019 6:18 PM
> > To: Jorgen Hansen <jhansen@vmware.com>
> > Subject: Re: [PATCH net-next 11/14] vsock: add multi-transports support
> > 
> > On Mon, Nov 11, 2019 at 01:53:39PM +0000, Jorgen Hansen wrote:
> > > > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > > > Sent: Wednesday, October 23, 2019 11:56 AM
> > >
> > > Thanks a lot for working on this!
> > >
> > 
> > Thanks to you for the reviews!
> > 
> > > > With the multi-transports support, we can use vsock with nested VMs
> > (using
> > > > also different hypervisors) loading both guest->host and
> > > > host->guest transports at the same time.
> > > >
> > > > Major changes:
> > > > - vsock core module can be loaded regardless of the transports
> > > > - vsock_core_init() and vsock_core_exit() are renamed to
> > > >   vsock_core_register() and vsock_core_unregister()
> > > > - vsock_core_register() has a feature parameter (H2G, G2H, DGRAM)
> > > >   to identify which directions the transport can handle and if it's
> > > >   support DGRAM (only vmci)
> > > > - each stream socket is assigned to a transport when the remote CID
> > > >   is set (during the connect() or when we receive a connection request
> > > >   on a listener socket).
> > >
> > > How about allowing the transport to be set during bind as well? That
> > > would allow an application to ensure that it is using a specific transport,
> > > i.e., if it binds to the host CID, it will use H2G, and if it binds to something
> > > else it will use G2H? You can still use VMADDR_CID_ANY if you want to
> > > initially listen to both transports.
> > 
> > Do you mean for socket that will call the connect()?
> 
> I was just thinking that in general we know the transport at that point, so we
> could ensure that the socket would only see traffic from the relevant transport,
> but as you mention below -  the updated bind lookup, and the added checks
> when selecting transport should also take care of this, so that is fine.
>  
> > For listener socket the "[PATCH net-next 14/14] vsock: fix bind() behaviour
> > taking care of CID" provides this behaviour.
> > Since the listener sockets don't use any transport specific callback
> > (they don't send any data to the remote peer), but they are used as
> > placeholder,
> > we don't need to assign them to a transport.
> > 
> > >
> > >
> > > >   The remote CID is used to decide which transport to use:
> > > >   - remote CID > VMADDR_CID_HOST will use host->guest transport
> > > >   - remote CID <= VMADDR_CID_HOST will use guest->host transport
> > > > - listener sockets are not bound to any transports since no transport
> > > >   operations are done on it. In this way we can create a listener
> > > >   socket, also if the transports are not loaded or with VMADDR_CID_ANY
> > > >   to listen on all transports.
> > > > - DGRAM sockets are handled as before, since only the vmci_transport
> > > >   provides this feature.
> > > >
> > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > ---
> > > > RFC -> v1:
> > > > - documented VSOCK_TRANSPORT_F_* flags
> > > > - fixed vsock_assign_transport() when the socket is already assigned
> > > >   (e.g connection failed)
> > > > - moved features outside of struct vsock_transport, and used as
> > > >   parameter of vsock_core_register()
> > > > ---
> > > >  drivers/vhost/vsock.c                   |   5 +-
> > > >  include/net/af_vsock.h                  |  17 +-
> > > >  net/vmw_vsock/af_vsock.c                | 237 ++++++++++++++++++------
> > > >  net/vmw_vsock/hyperv_transport.c        |  26 ++-
> > > >  net/vmw_vsock/virtio_transport.c        |   7 +-
> > > >  net/vmw_vsock/virtio_transport_common.c |  28 ++-
> > > >  net/vmw_vsock/vmci_transport.c          |  31 +++-
> > > >  7 files changed, 270 insertions(+), 81 deletions(-)
> > > >
> > >
> > >
> > > > diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> > index
> > > > d89381166028..dddd85d9a147 100644
> > > > --- a/net/vmw_vsock/af_vsock.c
> > > > +++ b/net/vmw_vsock/af_vsock.c
> > > > @@ -130,7 +130,12 @@ static struct proto vsock_proto = {  #define
> > > > VSOCK_DEFAULT_BUFFER_MAX_SIZE (1024 * 256)  #define
> > > > VSOCK_DEFAULT_BUFFER_MIN_SIZE 128
> > > >
> > > > -static const struct vsock_transport *transport_single;
> > > > +/* Transport used for host->guest communication */ static const struct
> > > > +vsock_transport *transport_h2g;
> > > > +/* Transport used for guest->host communication */ static const struct
> > > > +vsock_transport *transport_g2h;
> > > > +/* Transport used for DGRAM communication */ static const struct
> > > > +vsock_transport *transport_dgram;
> > > >  static DEFINE_MUTEX(vsock_register_mutex);
> > > >
> > > >  /**** UTILS ****/
> > > > @@ -182,7 +187,7 @@ static int vsock_auto_bind(struct vsock_sock *vsk)
> > > >  	return __vsock_bind(sk, &local_addr);
> > > >  }
> > > >
> > > > -static int __init vsock_init_tables(void)
> > > > +static void vsock_init_tables(void)
> > > >  {
> > > >  	int i;
> > > >
> > > > @@ -191,7 +196,6 @@ static int __init vsock_init_tables(void)
> > > >
> > > >  	for (i = 0; i < ARRAY_SIZE(vsock_connected_table); i++)
> > > >  		INIT_LIST_HEAD(&vsock_connected_table[i]);
> > > > -	return 0;
> > > >  }
> > > >
> > > >  static void __vsock_insert_bound(struct list_head *list, @@ -376,6
> > +380,62
> > > > @@ void vsock_enqueue_accept(struct sock *listener, struct sock
> > > > *connected)  }  EXPORT_SYMBOL_GPL(vsock_enqueue_accept);
> > > >
> > > > +/* Assign a transport to a socket and call the .init transport callback.
> > > > + *
> > > > + * Note: for stream socket this must be called when vsk->remote_addr
> > is
> > > > +set
> > > > + * (e.g. during the connect() or when a connection request on a
> > > > +listener
> > > > + * socket is received).
> > > > + * The vsk->remote_addr is used to decide which transport to use:
> > > > + *  - remote CID > VMADDR_CID_HOST will use host->guest transport
> > > > + *  - remote CID <= VMADDR_CID_HOST will use guest->host transport
> > */
> > > > +int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock
> > > > +*psk) {
> > > > +	const struct vsock_transport *new_transport;
> > > > +	struct sock *sk = sk_vsock(vsk);
> > > > +
> > > > +	switch (sk->sk_type) {
> > > > +	case SOCK_DGRAM:
> > > > +		new_transport = transport_dgram;
> > > > +		break;
> > > > +	case SOCK_STREAM:
> > > > +		if (vsk->remote_addr.svm_cid > VMADDR_CID_HOST)
> > > > +			new_transport = transport_h2g;
> > > > +		else
> > > > +			new_transport = transport_g2h;
> > > > +		break;
> > >
> > > You already mentioned that you are working on a fix for loopback
> > > here for the guest, but presumably a host could also do loopback.
> > 
> > IIUC we don't support loopback in the host, because in this case the
> > application will use the CID_HOST as address, but if we are in a nested
> > VM environment we are in trouble.
> 
> If both src and dst CID are CID_HOST, we should be fairly sure that this
> Is host loopback, no? If src is anything else, we would do G2H.
> 

The problem is that we don't know the src until we assign a transport
looking at the dst. (or if the user bound the socket to CID_HOST before
the connect(), but it is not very common)

So if we are in a L1 and the user uses the local guest CID, it works, but if
it uses the HOST_CID, the packet will go to the L0.

If we are in L0, it could be simple, because we can simply check if G2H
is not loaded, so any packet to CID_HOST, is host loopback.

I think that if the user uses the IOCTL_VM_SOCKETS_GET_LOCAL_CID, to set
the dest CID for the loopback, it works in both cases because we return the
HOST_CID in L0, and always the guest CID in L1, also if a H2G is loaded to
handle the L2.

Maybe we should document this in the man page.

But I have a question: Does vmci support the host loopback?
I've tried, and it seems not.

Also vhost-vsock doesn't support it, but virtio-vsock does.

> > 
> > Since several people asked about this feature at the KVM Forum, I would like
> > to add a new VMADDR_CID_LOCAL (i.e. using the reserved 1) and implement
> > loopback in the core.
> > 
> > What do you think?
> 
> What kind of use cases are mentioned in the KVM forum for loopback? One concern
> is that we have to maintain yet another interprocess communication mechanism,
> even though other choices exist already  (and those are likely to be more efficient
> given the development time and specific focus that went into those). To me, the
> local connections are mainly useful as a way to sanity test the protocol and transports.
> However, if loopback is compelling, it would make sense have it in the core, since it
> shouldn't need a specific transport. 

The common use cases is for developer point of view, and to test the
protocol and transports as you said.

People that are introducing VSOCK support in their projects, would like to
test them on their own PC without starting a VM.

The idea is to move the code to handle loopback from the virtio-vsock,
in the core, but in another series :-)

> 
> > 
> > > If we select transport during bind to a specific CID, this comment
> > 
> > Also in this case, are you talking about the peer that will call
> > connect()?
> 
> The same thought as mentioned in the beginning - but as mentioned
> above, I agree that your updated bind and transport selection should
> handle this as well.

Got it.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
