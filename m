Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BB819F632
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 14:57:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 144198625F;
	Mon,  6 Apr 2020 12:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1P2UqCwaEUQ; Mon,  6 Apr 2020 12:57:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7B82C8625D;
	Mon,  6 Apr 2020 12:57:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5AB40C1D89;
	Mon,  6 Apr 2020 12:57:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0214EC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E00B687568
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rRTIbJSlrW-y
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:57:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D04F18742F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586177823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zA3oXFlf+tA0XqNfZvZ8NSCiPUHKJG3g0r1brnP9MhE=;
 b=d/ZghukpLXCm251ZuwmTBAnvMFwEnxyih7Ipdoo/a7ea6bjLUk6CPbTBlN3OVM3jI67qwu
 QLNnh9Pa+bdLOlH3DByvLGwPnBGVJV2TuQCrqUOfhaMXSNr5vzx4o4rldjoLJKC3w3EL+e
 qW2hVMdA3B4SJIhF/GxAbGg5Pql2+Lk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-6d_XAFq4OVe16zVq1pMhig-1; Mon, 06 Apr 2020 08:57:01 -0400
X-MC-Unique: 6d_XAFq4OVe16zVq1pMhig-1
Received: by mail-wr1-f70.google.com with SMTP id d1so8295311wru.15
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 05:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zA3oXFlf+tA0XqNfZvZ8NSCiPUHKJG3g0r1brnP9MhE=;
 b=IH+SOIA3Av6oiMfFg+Jhsn0BZK/ZtOct+aIFXDITuhh0m727WVianQYEFoJaC6Tkcg
 5lreybhp98hcK9WWK+WmAje+k5uWB9+ZoPzsHSgqDFMjIy8TtrJ46XVyXrhUwr9sEQQp
 D4JPnOEyUQviT2MJ/nme27gvJ8cgEv5n1Gnm7t0D2rskB/ztxy651Fl+OtEVDiCIlfZf
 TAFo9qzxFogtLInsxYqpaWW4HSSZq0vNL3feFQt+zRlfJ29SvFUVWeQdtC0NHVh9MF6+
 59gm2ro1e/NIX1/ZQGf8JPBpoN6Ybi6Ua5h0RwDQYz9fw69uQ0RWue3Z4mXJff6ONmhC
 jweQ==
X-Gm-Message-State: AGi0PuZkBQROTg7w7yQqfT5ms6WK0nri+yOXi1fMFZz7e70oM0rLGAR0
 DqmkVSsX39NxL774aHXrlsttmQmJ3g5o7t9CZnH/bl2Nm8ALYmHr8t3wiXc+/A1slTN+LIQYFeF
 x+q6nMUMIw70W98tzxgDhHx+u6AQg2HDhXJ6ZDthvsA==
X-Received: by 2002:a7b:c359:: with SMTP id l25mr22974365wmj.149.1586177820031; 
 Mon, 06 Apr 2020 05:57:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypLkRAUfyI4Cg7RaR/a2JYi9c2Rr5Wp8n4wDNVakzk3f4Q2RbJ2sjxo/Naa7H/tihWUIO6KVSg==
X-Received: by 2002:a7b:c359:: with SMTP id l25mr22974349wmj.149.1586177819765; 
 Mon, 06 Apr 2020 05:56:59 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id i1sm1637648wmb.33.2020.04.06.05.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 05:56:59 -0700 (PDT)
Date: Mon, 6 Apr 2020 08:56:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 2/2] vhost: disable for OABI
Message-ID: <20200406085453-mutt-send-email-mst@kernel.org>
References: <20200406121233.109889-1-mst@redhat.com>
 <20200406121233.109889-3-mst@redhat.com>
 <CAMj1kXFNeuZU66swwf_Cx7PrQJV34C0VJ7Rte5aga2Jx4S-yHw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMj1kXFNeuZU66swwf_Cx7PrQJV34C0VJ7Rte5aga2Jx4S-yHw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 kbuild test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sudeep Dutt <sudeep.dutt@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 "daniel.santos@pobox.com" <daniel.santos@pobox.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, kvm@vger.kernel.org,
 netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On Mon, Apr 06, 2020 at 02:45:13PM +0200, Ard Biesheuvel wrote:
> On Mon, 6 Apr 2020 at 14:12, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > vhost is currently broken on the default ARM config.
> >
> 
> Where did you get this idea? The report from the robot was using a
> randconfig build, and in general, AEABI is required to run anything on
> any modern ARM system .

Oh - I forgot it's randconfig. This part is wrong, sorry.
I decided to just force 2-byte alignment
instead (seems more robust) but I'll take this into account
if we do decide to add this dependency.


> 
> > The reason is that that uses apcs-gnu which is the ancient OABI that is been
> > deprecated for a long time.
> >
> > Given that virtio support on such ancient systems is not needed in the
> > first place, let's just add something along the lines of
> >
> >         depends on !ARM || AEABI
> >
> > to the virtio Kconfig declaration, and add a comment that it has to do
> > with struct member alignment.
> >
> > Note: we can't make VHOST and VHOST_RING themselves have
> > a dependency since these are selected. Add a new symbol for that.
> >
> > Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> > Siggested-by: Richard Earnshaw <Richard.Earnshaw@arm.com>
> 
> typo ^^^


Thanks!

> 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  drivers/misc/mic/Kconfig |  2 +-
> >  drivers/net/caif/Kconfig |  2 +-
> >  drivers/vdpa/Kconfig     |  2 +-
> >  drivers/vhost/Kconfig    | 17 +++++++++++++----
> >  4 files changed, 16 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/misc/mic/Kconfig b/drivers/misc/mic/Kconfig
> > index 8f201d019f5a..3bfe72c59864 100644
> > --- a/drivers/misc/mic/Kconfig
> > +++ b/drivers/misc/mic/Kconfig
> > @@ -116,7 +116,7 @@ config MIC_COSM
> >
> >  config VOP
> >         tristate "VOP Driver"
> > -       depends on VOP_BUS
> > +       depends on VOP_BUS && VHOST_DPN
> >         select VHOST_RING
> >         select VIRTIO
> >         help
> > diff --git a/drivers/net/caif/Kconfig b/drivers/net/caif/Kconfig
> > index 9db0570c5beb..661c25eb1c46 100644
> > --- a/drivers/net/caif/Kconfig
> > +++ b/drivers/net/caif/Kconfig
> > @@ -50,7 +50,7 @@ config CAIF_HSI
> >
> >  config CAIF_VIRTIO
> >         tristate "CAIF virtio transport driver"
> > -       depends on CAIF && HAS_DMA
> > +       depends on CAIF && HAS_DMA && VHOST_DPN
> >         select VHOST_RING
> >         select VIRTIO
> >         select GENERIC_ALLOCATOR
> > diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
> > index d0cb0e583a5d..aee28def466b 100644
> > --- a/drivers/vdpa/Kconfig
> > +++ b/drivers/vdpa/Kconfig
> > @@ -14,7 +14,7 @@ if VDPA_MENU
> >
> >  config VDPA_SIM
> >         tristate "vDPA device simulator"
> > -       depends on RUNTIME_TESTING_MENU && HAS_DMA
> > +       depends on RUNTIME_TESTING_MENU && HAS_DMA && VHOST_DPN
> >         select VDPA
> >         select VHOST_RING
> >         select VHOST_IOTLB
> > diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> > index cb6b17323eb2..b3486e218f62 100644
> > --- a/drivers/vhost/Kconfig
> > +++ b/drivers/vhost/Kconfig
> > @@ -12,6 +12,15 @@ config VHOST_RING
> >           This option is selected by any driver which needs to access
> >           the host side of a virtio ring.
> >
> > +config VHOST_DPN
> > +       bool "VHOST dependencies"
> > +       depends on !ARM || AEABI
> > +       default y
> > +       help
> > +         Anything selecting VHOST or VHOST_RING must depend on VHOST_DPN.
> > +         This excludes the deprecated ARM ABI since that forces a 4 byte
> > +         alignment on all structs - incompatible with virtio spec requirements.
> > +
> >  config VHOST
> >         tristate
> >         select VHOST_IOTLB
> > @@ -27,7 +36,7 @@ if VHOST_MENU
> >
> >  config VHOST_NET
> >         tristate "Host kernel accelerator for virtio net"
> > -       depends on NET && EVENTFD && (TUN || !TUN) && (TAP || !TAP)
> > +       depends on NET && EVENTFD && (TUN || !TUN) && (TAP || !TAP) && VHOST_DPN
> >         select VHOST
> >         ---help---
> >           This kernel module can be loaded in host kernel to accelerate
> > @@ -39,7 +48,7 @@ config VHOST_NET
> >
> >  config VHOST_SCSI
> >         tristate "VHOST_SCSI TCM fabric driver"
> > -       depends on TARGET_CORE && EVENTFD
> > +       depends on TARGET_CORE && EVENTFD && VHOST_DPN
> >         select VHOST
> >         default n
> >         ---help---
> > @@ -48,7 +57,7 @@ config VHOST_SCSI
> >
> >  config VHOST_VSOCK
> >         tristate "vhost virtio-vsock driver"
> > -       depends on VSOCKETS && EVENTFD
> > +       depends on VSOCKETS && EVENTFD && VHOST_DPN
> >         select VHOST
> >         select VIRTIO_VSOCKETS_COMMON
> >         default n
> > @@ -62,7 +71,7 @@ config VHOST_VSOCK
> >
> >  config VHOST_VDPA
> >         tristate "Vhost driver for vDPA-based backend"
> > -       depends on EVENTFD
> > +       depends on EVENTFD && VHOST_DPN
> >         select VHOST
> >         select VDPA
> >         help
> > --
> > MST
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
