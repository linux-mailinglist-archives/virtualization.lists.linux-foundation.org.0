Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B64CA106976
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 11:02:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 469178735C;
	Fri, 22 Nov 2019 10:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BaBoG4ekZR5W; Fri, 22 Nov 2019 10:02:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B473887347;
	Fri, 22 Nov 2019 10:02:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 896BBC18DA;
	Fri, 22 Nov 2019 10:02:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 036E3C18DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8BF6D204A5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8FUQtEhjo+-0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:02:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 9572820478
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574416939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q5brik//Uj78Imdw+Nasd8kB1YSOqMDawTRFR2gNwAc=;
 b=DwHqwxzAuL0MnWbwn48166TwX/kBQMxZgC7g8M1vxjeAV8RJH7PZxdiwylTPVivRor7L9b
 heer8ZAJndwU9hP8JNOorjcNpuJ3DT3qypVpBFFVIpAw5ZnYINCcGNtgT7xKPSAMzpOSHL
 5DotW6BUmdDh655o71DIihHO1wL4g3g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-d75jVgXtN4m8Iq-wmuYRlw-1; Fri, 22 Nov 2019 05:02:17 -0500
Received: by mail-wm1-f70.google.com with SMTP id q186so2870319wma.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 02:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TxlQ/8hM2ybpNrpWCxq4vBt3O3dzk/gjN30vFVF3w9c=;
 b=Eq2jcO5pLNecgwxZ9zRrBt/3y4ebhba6AcrskDB6/4+ElXibqEniPNHGykGk+ginT1
 ay3j2deriy1dYV+MymEnmM+bhzaV3nh8g1plDERmARXcEWzlwnkVXsdqPXvgCq2MZyAx
 S3bNkH/eYr3V+WjwrY7eYJZvsZtkXAvzr5AO0RF8CZPRl5om/n2etv8r8jYd3nrSGYMa
 H2dPAkHqXxDR/TLre8/qH+Ou6VCGpKQHas/8h7mx82dSRUX7m6ChAycwRZCpaQm3oP7p
 xDb8/wwyFs8/flUuTGUIjJVOhtFznbCAsJlSSZ3OyO0JXjSSX60VhbSd51LBhOaD92/6
 Y+Yg==
X-Gm-Message-State: APjAAAWki36a8G3zu1hO0tNFgwsmlTjl3sXKL4TXs9ngO4ZJISMKZkLl
 IVV04j0qJvOjSTbmOrMUzbWs2ThzFT8Rxe73pbXdQLZWwHkmlOj3PLEZzuh/cKYjZ6OAecbCSmf
 mSsMzTBfCJbQAPuRE2hRnIjKE6xaNJW0+658+mbI42Q==
X-Received: by 2002:a1c:3d8a:: with SMTP id k132mr904872wma.144.1574416936567; 
 Fri, 22 Nov 2019 02:02:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqwnfT8kemugquSzuCzADN8nk7bWDwXV59utNsTdM9vDxjzVAVfFfI24LbFsDpJ3AH0GMJIOQA==
X-Received: by 2002:a1c:3d8a:: with SMTP id k132mr904842wma.144.1574416936299; 
 Fri, 22 Nov 2019 02:02:16 -0800 (PST)
Received: from steredhat.homenet.telecomitalia.it (a-nu5-32.tin.it.
 [212.216.181.31])
 by smtp.gmail.com with ESMTPSA id v19sm2111293wrg.38.2019.11.22.02.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 02:02:15 -0800 (PST)
Date: Fri, 22 Nov 2019 11:02:12 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH net-next 4/6] vsock: add vsock_loopback transport
Message-ID: <20191122100212.u3mvt6qkay7zexz7@steredhat.homenet.telecomitalia.it>
References: <20191119110121.14480-1-sgarzare@redhat.com>
 <20191119110121.14480-5-sgarzare@redhat.com>
 <20191121093458.GB439743@stefanha-x1.localdomain>
 <20191121095948.bc7lc3ptsh6jxizw@steredhat>
 <20191121152517.zfedz6hg6ftcb2ks@steredhat>
 <20191122092546.GA464656@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191122092546.GA464656@stefanha-x1.localdomain>
X-MC-Unique: d75jVgXtN4m8Iq-wmuYRlw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: kvm@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jorgen Hansen <jhansen@vmware.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Nov 22, 2019 at 09:25:46AM +0000, Stefan Hajnoczi wrote:
> On Thu, Nov 21, 2019 at 04:25:17PM +0100, Stefano Garzarella wrote:
> > On Thu, Nov 21, 2019 at 10:59:48AM +0100, Stefano Garzarella wrote:
> > > On Thu, Nov 21, 2019 at 09:34:58AM +0000, Stefan Hajnoczi wrote:
> > > > On Tue, Nov 19, 2019 at 12:01:19PM +0100, Stefano Garzarella wrote:
> > > > > +static struct workqueue_struct *vsock_loopback_workqueue;
> > > > > +static struct vsock_loopback *the_vsock_loopback;
> > > > 
> > > > the_vsock_loopback could be a static global variable (not a pointer) and
> > > > vsock_loopback_workqueue could also be included in the struct.
> > > > 
> > > > The RCU pointer is really a way to synchronize vsock_loopback_send_pkt()
> > > > and vsock_loopback_cancel_pkt() with module exit.  There is no other
> > > > reason for using a pointer.
> > > > 
> > > > It's cleaner to implement the synchronization once in af_vsock.c (or
> > > > virtio_transport_common.c) instead of making each transport do it.
> > > > Maybe try_module_get() and related APIs provide the necessary semantics
> > > > so that core vsock code can hold the transport module while it's being
> > > > used to send/cancel a packet.
> > > 
> > > Right, the module cannot be unloaded until open sockets, so here the
> > > synchronization is not needed.
> > > 
> > > The synchronization come from virtio-vsock device that can be
> > > hot-unplugged while sockets are still open, but that can't happen here.
> > > 
> > > I will remove the pointers and RCU in the v2.
> > > 
> > > Can I keep your R-b or do you prefer to watch v2 first?
> 
> I'd like to review v2.
> 

Sure!

> > > > > +MODULE_ALIAS_NETPROTO(PF_VSOCK);
> > > > 
> > > > Why does this module define the alias for PF_VSOCK?  Doesn't another
> > > > module already define this alias?
> > > 
> > > It is a way to load this module when PF_VSOCK is starting to be used.
> > > MODULE_ALIAS_NETPROTO(PF_VSOCK) is already defined in vmci_transport
> > > and hyperv_transport. IIUC it is used for the same reason.
> > > 
> > > In virtio_transport we don't need it because it will be loaded when
> > > the PCI device is discovered.
> > > 
> > > Do you think there's a better way?
> > > Should I include the vsock_loopback transport directly in af_vsock
> > > without creating a new module?
> > > 
> > 
> > That last thing I said may not be possible:
> > I remembered that I tried, but DEPMOD found a cyclic dependency because
> > vsock_transport use virtio_transport_common that use vsock, so if I
> > include vsock_transport in the vsock module, DEPMOD is not happy.
> > 
> > Do you think it's okay in this case to keep MODULE_ALIAS_NETPROTO(PF_VSOCK)
> > or is there a better way?
> 
> The reason I asked is because the semantics of duplicate module aliases
> aren't clear to me.  Do all modules with the same alias get loaded?
> Or just the first?  Or ...?

It wasn't clear to me either, but when I tried, I saw that all modules
with the same alias got loaded.

Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
