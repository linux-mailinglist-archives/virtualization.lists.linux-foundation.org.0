Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 13731F8D11
	for <lists.virtualization@lfdr.de>; Tue, 12 Nov 2019 11:42:17 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 46A4F1083;
	Tue, 12 Nov 2019 10:42:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AAB881047
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 10:42:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 209ACDF
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 10:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573555327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=t5MdSNFaJUFMw+ktkmGSBraFfMN3xLO5MNDHuMIJ4YE=;
	b=HaduibEqAzTAbDcLKxpVJhQGJtOo5L1eOQHLk90G1bscwcqPWVVgM92vA/26fbQ1gGUd0J
	9nmH8DccMykdZKMj9XD5UqSs/z/5ApfIyZBBIhixDgPBoYnD9qKPx6dMXtJ5h/+jjqaX9M
	CUMzULJExTLCFdwI40mZQFJPWhWVif8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-70-6eIVQeHyNtKNnSsGo4TeaQ-1; Tue, 12 Nov 2019 05:42:06 -0500
Received: by mail-wm1-f69.google.com with SMTP id k184so1000839wmk.1
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 02:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=vUK3k3PYV7+WIhfZTJTf9V3GDfUQYxuDQUeG6IzQ6Bc=;
	b=a7JfyGm1U2FR2u4b25ZSxBt/hfw8xK4gQuYpd9p8LQDB+QTYNOHOUsz1sWVrLkAdIp
	bMViRjjKAENyaQK51xJrqD7CVZRtaOYtevzoM7KMTN7SJxqE2Q7l1dFeD9msaAirXVXx
	Y3AAWNPMRM33FchRHXbNY8fMLSMiRRjtxNSRlhwhOdc7o81AQjXf7xh2xcMZ/yCfez4T
	mZE6o98H8Uzes1xkzO9elD6pKLdqY5AR70Xa8jfFhGDugWz/EkPHPEDeGxiob/wvM4B2
	FBpHx1KswoPC1fYiK3QNrUbdTrMz4jgKzg6eEiL7irNEg5bobrI8fpWhcx7BrWMakbLe
	9qsQ==
X-Gm-Message-State: APjAAAU8PZMh+Z6xQFK+VvJI2dITAAw6O83ftJCHpg0GFk8a7ClbhIsZ
	EIUReSLYDwW+/NUG7Ytaj+5SSQd4b7I+U+Aw9d+BPwVM5lQ4UV/10/Jav4zqhtagJ7sQtzxH1le
	qjoTC3+LQnlnnrslj1cRr1Ic25g5IQdkXUykOjNpwRw==
X-Received: by 2002:adf:9e05:: with SMTP id u5mr19523236wre.239.1573555324990; 
	Tue, 12 Nov 2019 02:42:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqwq/QTsf6eKeo9n5WelsN7V/SyybR7/jPKjiKjoknrXU4ymGTeF6cAW0Vus7tswMT5UtujQRw==
X-Received: by 2002:adf:9e05:: with SMTP id u5mr19523199wre.239.1573555324672; 
	Tue, 12 Nov 2019 02:42:04 -0800 (PST)
Received: from steredhat (a-nu5-32.tin.it. [212.216.181.31])
	by smtp.gmail.com with ESMTPSA id
	j11sm18787131wrq.26.2019.11.12.02.42.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 02:42:04 -0800 (PST)
Date: Tue, 12 Nov 2019 11:42:01 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jorgen Hansen <jhansen@vmware.com>
Subject: Re: [PATCH net-next 12/14] vsock/vmci: register vmci_transport only
	when VMCI guest/host are active
Message-ID: <20191112104201.abt7h37df24h3n7p@steredhat>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-13-sgarzare@redhat.com>
	<MWHPR05MB3376266BC6AE9E6E0B75F1A1DA740@MWHPR05MB3376.namprd05.prod.outlook.com>
	<20191111173053.erwfzawioxje635o@steredhat>
	<MWHPR05MB33769FD52B833FC1C82F0A80DA770@MWHPR05MB3376.namprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR05MB33769FD52B833FC1C82F0A80DA770@MWHPR05MB3376.namprd05.prod.outlook.com>
X-MC-Unique: 6eIVQeHyNtKNnSsGo4TeaQ-1
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

On Tue, Nov 12, 2019 at 10:03:54AM +0000, Jorgen Hansen wrote:
> > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > Sent: Monday, November 11, 2019 6:31 PM
> > On Mon, Nov 11, 2019 at 04:27:28PM +0000, Jorgen Hansen wrote:
> > > > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > > > Sent: Wednesday, October 23, 2019 11:56 AM
> > > >
> > > > To allow other transports to be loaded with vmci_transport,
> > > > we register the vmci_transport as G2H or H2G only when a VMCI guest
> > > > or host is active.
> > > >
> > > > To do that, this patch adds a callback registered in the vmci driver
> > > > that will be called when a new host or guest become active.
> > > > This callback will register the vmci_transport in the VSOCK core.
> > > > If the transport is already registered, we ignore the error coming
> > > > from vsock_core_register().
> > >
> > > So today this is mainly an issue for the VMCI vsock transport, because
> > > VMCI autoloads with vsock (and with this solution it can continue to
> > > do that, so none of our old products break due to changed behavior,
> > > which is great).
> > 
> > I tried to not break anything :-)
> > 
> > >                  Shouldn't vhost behave similar, so that any module
> > > that registers a h2g transport only does so if it is in active use?
> > >
> > 
> > The vhost-vsock module will load when the first hypervisor open
> > /dev/vhost-vsock, so in theory, when there's at least one active user.
> 
> Ok, sounds good then. 
> 
> > 
> > >
> > > > --- a/drivers/misc/vmw_vmci/vmci_host.c
> > > > +++ b/drivers/misc/vmw_vmci/vmci_host.c
> > > > @@ -108,6 +108,11 @@ bool vmci_host_code_active(void)
> > > >  	     atomic_read(&vmci_host_active_users) > 0);
> > > >  }
> > > >
> > > > +int vmci_host_users(void)
> > > > +{
> > > > +	return atomic_read(&vmci_host_active_users);
> > > > +}
> > > > +
> > > >  /*
> > > >   * Called on open of /dev/vmci.
> > > >   */
> > > > @@ -338,6 +343,8 @@ static int vmci_host_do_init_context(struct
> > > > vmci_host_dev *vmci_host_dev,
> > > >  	vmci_host_dev->ct_type = VMCIOBJ_CONTEXT;
> > > >  	atomic_inc(&vmci_host_active_users);
> > > >
> > > > +	vmci_call_vsock_callback(true);
> > > > +
> > >
> > > Since we don't unregister the transport if user count drops back to 0, we
> > could
> > > just call this the first time, a VM is powered on after the module is loaded.
> > 
> > Yes, make sense. can I use the 'vmci_host_active_users' or is better to
> > add a new 'vmci_host_vsock_loaded'?
> > 
> > My doubt is that vmci_host_active_users can return to 0, so when it returns
> > to 1, we call vmci_call_vsock_callback() again.
> 
> vmci_host_active_users can drop to 0 and then increase again, so having a flag
> indicating whether the callback has been invoked would ensure that it is only
> called once.

I agree, I will use a dedicated flag, maybe in the
vmci_call_vsock_callback(), since it can be called or during the
vmci_host_do_init_context() or when the callback is registered.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
