Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B6BD2A18
	for <lists.virtualization@lfdr.de>; Thu, 10 Oct 2019 14:55:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7BB12CBF;
	Thu, 10 Oct 2019 12:55:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E3208C8E
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 12:55:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6D21E8AB
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 12:55:26 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BAD417E422
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 12:55:25 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id z205so2583007wmb.7
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 05:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Nq/uA9hbiLadGUMtvDysqPg6doejpIGdIlN33a9wYx0=;
	b=nGoEQaa2/Z5aOkfN2U2Za9BdNZiviJcD2WbwVRTO7n92HegL3/IImXT4Tcu/OFuAoh
	WTz3uUjMENIJ3oNjv5D/MfOT9e+REC5t80DqHxLvjy//Q5uDZEPFjVbJbMumsEsuGAjz
	16JacGf4H4nZWII60fQ8xYB6JJcXNvuMuPy0eAmbexdfbCD8YFultlbgkO5NsHXVzlLE
	A0PgH3ByAsvpFI3f4cGGqO4iuEAJ0vIOQmJgxYjUD+k8635/YFPqEXttFe361sIoEEuv
	FdNydpvPUvIEOVQ0ZeIwnhw5XHBxRHEMav71rj7BNBtg9w2N7FHnEiS3foit9Y3+WGj9
	739A==
X-Gm-Message-State: APjAAAU1F0SLcRScHVnLanYp55XAgogJTdRTs5WBQMBUoDeX3RIhD5l+
	lfYqGyrKVIfcru1NzYWoVqVGD+EDcXTMUg1VQiySUUEgrtv90GOBQJ/p+94HL2u0asUbBi7ujkK
	UiZFHifSGY6X86Ey1Q8/hAUC/peLKCiiXaMfePjWYPQ==
X-Received: by 2002:a05:600c:2291:: with SMTP id
	17mr7030801wmf.171.1570712124315; 
	Thu, 10 Oct 2019 05:55:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHOfBhX3Ib0GwJrD9aqpSGkSJYDsUzMmEl6DpZun/qWkG6+vpHW5DvYVap0QI8aDPovc/J9Q==
X-Received: by 2002:a05:600c:2291:: with SMTP id
	17mr7030775wmf.171.1570712124033; 
	Thu, 10 Oct 2019 05:55:24 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174]) by smtp.gmail.com with ESMTPSA id
	u68sm8140030wmu.12.2019.10.10.05.55.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 05:55:23 -0700 (PDT)
Date: Thu, 10 Oct 2019 14:55:21 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [RFC PATCH 10/13] vsock: add multi-transports support
Message-ID: <20191010125521.mf7elqjpwhwjhwpo@steredhat>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-11-sgarzare@redhat.com>
	<20191009131123.GK5747@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009131123.GK5747@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

On Wed, Oct 09, 2019 at 02:11:23PM +0100, Stefan Hajnoczi wrote:
> On Fri, Sep 27, 2019 at 01:27:00PM +0200, Stefano Garzarella wrote:
> > RFC:
> > - I'd like to move MODULE_ALIAS_NETPROTO(PF_VSOCK) to af_vsock.c.
> >   @Jorgen could this break the VMware products?
> 
> What will cause the vmw_vsock_vmci_transport.ko module to be loaded
> after you remove MODULE_ALIAS_NETPROTO(PF_VSOCK)?  Perhaps
> drivers/misc/vmw_vmci/vmci_guest.c:vmci_guest_probe_device() could do
> something when the guest driver loads.

Good idea, maybe we can call some function provided by vmci_transport
to register it as a guest (I'll remove the type from the transport
and I add it as a parameter of vsock_core_register())

>                                         There would need to be something
> equivalent for the host side too.

Maybe in the vmci_host_do_init_context().

> 
> This will solve another issue too.  Today the VMCI transport can be
> loaded if an application creates an AF_VSOCK socket during early boot
> before the virtio transport has been probed.  This happens because the
> VMCI transport uses MODULE_ALIAS_NETPROTO(PF_VSOCK) *and* it does not
> probe whether this system is actually a VMware guest.
> 
> If we instead load the core af_vsock.ko module and transports are only
> loaded based on hardware feature probing (e.g. the presence of VMware
> guest mode, a virtio PCI adapter, etc) then transports will be
> well-behaved.

Yes, I completely agree with you. I'll try to follow your suggestion,

> 
> > - DGRAM sockets are handled as before, I don't know if make sense work
> >   on it now, or when another transport will support DGRAM. The big
> >   issues here is that we cannot link 1-1 a socket to transport as
> >   for stream sockets since DGRAM is not connection-oriented.
> 
> Let's ignore DGRAM for now since only VMCI supports it and we therefore
> do not require multi-transpor) support.

Okay :)

> 
> > diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> > index 86f8f463e01a..2a081d19e20d 100644
> > --- a/include/net/af_vsock.h
> > +++ b/include/net/af_vsock.h
> > @@ -94,7 +94,13 @@ struct vsock_transport_send_notify_data {
> >  	u64 data2; /* Transport-defined. */
> >  };
> >  
> > +#define VSOCK_TRANSPORT_F_H2G		0x00000001
> > +#define VSOCK_TRANSPORT_F_G2H		0x00000002
> > +#define VSOCK_TRANSPORT_F_DGRAM		0x00000004
> 
> Documentation comments, please.

I'll fix!

> 
> > +void vsock_core_unregister(const struct vsock_transport *t)
> > +{
> > +	mutex_lock(&vsock_register_mutex);
> > +
> > +	/* RFC-TODO: maybe we should check if there are open sockets
> > +	 * assigned to that transport and avoid the unregistration
> > +	 */
> 
> If unregister() is only called from module_exit() functions then holding
> a reference to the transport module would be enough to prevent this
> case.  The transport could only be removed once all sockets have been
> destroyed (and dropped their transport module reference).

Yes. I did this in
"[RFC PATCH 12/13] vsock: prevent transport modules unloading".

Maybe I can merge it in this patch...

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
