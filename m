Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E01AF7A00
	for <lists.virtualization@lfdr.de>; Mon, 11 Nov 2019 18:31:08 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6B281E0E;
	Mon, 11 Nov 2019 17:31:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 16D57DC9
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 17:31:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 8A15389E
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 17:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573493459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=/Pu/XRjHN00bp26uJKyF+eeNc+4bMeKaeoX1nXunFjQ=;
	b=B3+zBx3A2z2CLJYpuFDga6a7BkjYtwct6WzeFGE4DPuIk6ZDgh7rcQkFqMtr9SOl7empPi
	GW74xE2ZQsZM+CH7qb2SsvThkQ7S8IF4PmM+XAlRDH/gBdeM3d5Gt39oDeDoy5RrDNf3ao
	bA9YoAkCi3r7XEeWwf5sN6kyXAc0Tr0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-49-qhhB-lolO8aAOwh2GIs2KQ-1; Mon, 11 Nov 2019 12:30:57 -0500
Received: by mail-wr1-f70.google.com with SMTP id p6so10331925wrs.5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 09:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=OGemqcYu9gXrdCs7NgbTRCHoieRkJLCT5RXpmkbgD3I=;
	b=PpP4ZuI2z/YReX2IbmNO61IUQ7lsCtNx+jF0VOjeofMLwQ/oYIwUPwBBU+NbdairAF
	Zg/uVKPoAlNZpooK61trP/Ne4QlZ8KLWKe3SklZ7KYpwvM1ahbiklnnHc1crQ91U525N
	Bp9VkAgqBp4uKeMz1ZYxkvl94luOsWPdJb4Q72aks4jNgqteEqZBdnSP9vdoimixlY8j
	EUKDwxGy/0JCgJUXqULAIjz5bxvzkGWeK2vZmTxqyKmlW+b/Z0RlQGbTTOFanNNs/p1P
	Z7RC0DkkcyUF+RBBgRU714dNxsMcwFzRNcw8qsep0LvQBuHVXNSdfwJ73a1Z6p90NmGG
	aUKQ==
X-Gm-Message-State: APjAAAXaxcId2uAyi+NQEP0TCRNH/Uu/gGColZJkoXB060LEQ664W6WH
	UvQmGaaIiGjWSehUtvt7osGnv56sw+7TiufkPtxqAlYDBALn1mF2RnvqSVn2jpvmD7m79OnIVpd
	5ydY+GpTCyLUupQe2+/2lnystp+jZTs0CjTAX3YCmjw==
X-Received: by 2002:adf:ed4b:: with SMTP id u11mr2059900wro.215.1573493456386; 
	Mon, 11 Nov 2019 09:30:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxtK1/4KWgD9KPJoU+tAGhHUeUEQrzwzlucpPtfP0PmUdGJAdIPC9pkDZltrDfXpW0g+AEtzQ==
X-Received: by 2002:adf:ed4b:: with SMTP id u11mr2059871wro.215.1573493456151; 
	Mon, 11 Nov 2019 09:30:56 -0800 (PST)
Received: from steredhat (a-nu5-32.tin.it. [212.216.181.31])
	by smtp.gmail.com with ESMTPSA id m1sm1701700wrv.37.2019.11.11.09.30.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 09:30:55 -0800 (PST)
Date: Mon, 11 Nov 2019 18:30:53 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jorgen Hansen <jhansen@vmware.com>
Subject: Re: [PATCH net-next 12/14] vsock/vmci: register vmci_transport only
	when VMCI guest/host are active
Message-ID: <20191111173053.erwfzawioxje635o@steredhat>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-13-sgarzare@redhat.com>
	<MWHPR05MB3376266BC6AE9E6E0B75F1A1DA740@MWHPR05MB3376.namprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR05MB3376266BC6AE9E6E0B75F1A1DA740@MWHPR05MB3376.namprd05.prod.outlook.com>
X-MC-Unique: qhhB-lolO8aAOwh2GIs2KQ-1
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

On Mon, Nov 11, 2019 at 04:27:28PM +0000, Jorgen Hansen wrote:
> > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > Sent: Wednesday, October 23, 2019 11:56 AM
> > 
> > To allow other transports to be loaded with vmci_transport,
> > we register the vmci_transport as G2H or H2G only when a VMCI guest
> > or host is active.
> > 
> > To do that, this patch adds a callback registered in the vmci driver
> > that will be called when a new host or guest become active.
> > This callback will register the vmci_transport in the VSOCK core.
> > If the transport is already registered, we ignore the error coming
> > from vsock_core_register().
> 
> So today this is mainly an issue for the VMCI vsock transport, because
> VMCI autoloads with vsock (and with this solution it can continue to
> do that, so none of our old products break due to changed behavior,
> which is great).

I tried to not break anything :-)

>                  Shouldn't vhost behave similar, so that any module
> that registers a h2g transport only does so if it is in active use?
> 

The vhost-vsock module will load when the first hypervisor open
/dev/vhost-vsock, so in theory, when there's at least one active user.

> 
> > --- a/drivers/misc/vmw_vmci/vmci_host.c
> > +++ b/drivers/misc/vmw_vmci/vmci_host.c
> > @@ -108,6 +108,11 @@ bool vmci_host_code_active(void)
> >  	     atomic_read(&vmci_host_active_users) > 0);
> >  }
> > 
> > +int vmci_host_users(void)
> > +{
> > +	return atomic_read(&vmci_host_active_users);
> > +}
> > +
> >  /*
> >   * Called on open of /dev/vmci.
> >   */
> > @@ -338,6 +343,8 @@ static int vmci_host_do_init_context(struct
> > vmci_host_dev *vmci_host_dev,
> >  	vmci_host_dev->ct_type = VMCIOBJ_CONTEXT;
> >  	atomic_inc(&vmci_host_active_users);
> > 
> > +	vmci_call_vsock_callback(true);
> > +
> 
> Since we don't unregister the transport if user count drops back to 0, we could
> just call this the first time, a VM is powered on after the module is loaded.

Yes, make sense. can I use the 'vmci_host_active_users' or is better to
add a new 'vmci_host_vsock_loaded'?

My doubt is that vmci_host_active_users can return to 0, so when it returns
to 1, we call vmci_call_vsock_callback() again.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
