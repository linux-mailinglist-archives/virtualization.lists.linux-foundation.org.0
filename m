Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 96842182580
	for <lists.virtualization@lfdr.de>; Thu, 12 Mar 2020 00:02:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 27858857CB;
	Wed, 11 Mar 2020 23:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgdpBhMW4uvc; Wed, 11 Mar 2020 23:02:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A0D2B857A3;
	Wed, 11 Mar 2020 23:02:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84006C0177;
	Wed, 11 Mar 2020 23:02:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D7E8C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 23:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4BEF5857A3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 23:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZxH054RslrI
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 23:02:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5A57E8577C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 23:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583967760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3mEzkj6XRFR4kWdQY1UH1Sim7j3oSUMmKUovhUqapmI=;
 b=VTU4olTSc8nF7xSAOiGKvhZCx7PYIwbWSxRehaaR/hiTjBibW2DSouZR74jARnNqZJidS5
 2TlIs+iMZyfvH24DKleULzUoeLopgR5Jau07H40w56dd24JYP0zCAGIevHQVjKe3Mwov43
 ForxQbOLXqPISq9SLQ4YDpV/h7nGISU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-72TY8_nYN2aGpBovFw4G2w-1; Wed, 11 Mar 2020 19:02:38 -0400
X-MC-Unique: 72TY8_nYN2aGpBovFw4G2w-1
Received: by mail-qv1-f71.google.com with SMTP id g12so2351542qvp.20
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 16:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3mEzkj6XRFR4kWdQY1UH1Sim7j3oSUMmKUovhUqapmI=;
 b=fmS+ZpHH+Ti8gAAxCLEnEcaH/OeQND3bGiProOr0Xcc740nl7z4u3xABgmlNFn89x5
 M52IbucEIXg8sEOuPfk5BMaVPrPQlnUGpmtkWOW696nUv5iusjWEsBKeD4g0qncaMguu
 rcWcvia64Nq/X4t+TLP0GYT4az6NAgCZIYsFl8JwVSQIZFfA93L6NFkgmFZRSx9/4wju
 GEOBmc8H2LLFThXo67cZQ+dk3DDzEuddvGWu+wWJ8gMjwev7kr6Q6BZIj6t9Ik4Ev39S
 KSl79Hp+mSvnxlbmsNck2uTIF8ODNcsDVUt1246GXPifEibqXBAao8tatQ7wKWvVeXEQ
 obEQ==
X-Gm-Message-State: ANhLgQ1saQgHAXWGTPk/h32MKtmwhYxok1vAz8ZhTBjna+TgssJQ9YJO
 1hcaognrPgd6abT59ohrmj8NA13yUFNaJ/mxOerV7r/k7v6jv4RGPy88gn8z1sqDoumy0UxXo1E
 Y6VjrrG7TM+ehM/Qm56KpVmxolg9BcRoqh2MIhWEOPw==
X-Received: by 2002:ac8:351c:: with SMTP id y28mr4762164qtb.379.1583967758130; 
 Wed, 11 Mar 2020 16:02:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt9gGn5giwkO4bGzbtjpN0RPLYVpYCPuXoRC/ZgpxaKmEVLwnuRv5b9G/2X1vioXdDnLOG7MQ==
X-Received: by 2002:ac8:351c:: with SMTP id y28mr4762149qtb.379.1583967757888; 
 Wed, 11 Mar 2020 16:02:37 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id b8sm19471664qte.52.2020.03.11.16.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 16:02:37 -0700 (PDT)
Date: Wed, 11 Mar 2020 19:02:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ram Muthiah <rammuthiah@google.com>
Subject: Re: [PATCH RESEND] virtio: virtio_pci_legacy: Remove default y from
 Kconfig
Message-ID: <20200311190026-mutt-send-email-mst@kernel.org>
References: <20200228232736.182780-1-rammuthiah@google.com>
 <20200301023025-mutt-send-email-mst@kernel.org>
 <CA+CXyWu9AfPbb_BVb9bh9Q_82XfavTGy+M11+6GEGCjeCetThw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+CXyWu9AfPbb_BVb9bh9Q_82XfavTGy+M11+6GEGCjeCetThw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Wed, Mar 11, 2020 at 03:44:14PM -0700, Ram Muthiah wrote:
> On Sat, Feb 29, 2020 at 11:32 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Feb 28, 2020 at 03:27:36PM -0800, Ram Muthiah wrote:
> > > The legacy pci driver should no longer be default enabled. QEMU has
> > > implemented support for Virtio 1 for virtio-pci since June 2015
> > > on SHA dfb8e184db75.
> > >
> > > Signed-off-by: Ram Muthiah <rammuthiah@google.com>
> >
> > I see little reason to do this: y is safer and will boot on more
> > hypervisors, so people that aren't sure should enable it.
> >
> 
> In that case, would it be reasonable to fold VIRTIO_PCI_LEGACY
> into VIRTIO_PCI?
> 
> The result would boot more hypervisors as well and remove the
> CONFIG in the process.

This might break configurations relying on the flying car joke to be
there.


> > > ---
> > >  drivers/virtio/Kconfig | 6 ------
> > >  1 file changed, 6 deletions(-)
> > >
> > > diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> > > index 078615cf2afc..eacd0b90d32b 100644
> > > --- a/drivers/virtio/Kconfig
> > > +++ b/drivers/virtio/Kconfig
> > > @@ -26,7 +26,6 @@ config VIRTIO_PCI
> > >
> > >  config VIRTIO_PCI_LEGACY
> > >       bool "Support for legacy virtio draft 0.9.X and older devices"
> > > -     default y
> > >       depends on VIRTIO_PCI
> > >       ---help---
> > >            Virtio PCI Card 0.9.X Draft (circa 2014) and older device support.
> > > @@ -36,11 +35,6 @@ config VIRTIO_PCI_LEGACY
> > >         If disabled, you get a slightly smaller, non-transitional driver,
> > >         with no legacy compatibility.
> > >
> > > -          So look out into your driveway.  Do you have a flying car?  If
> > > -          so, you can happily disable this option and virtio will not
> > > -          break.  Otherwise, leave it set.  Unless you're testing what
> > > -          life will be like in The Future.
> > > -
> > >         If unsure, say Y.
> > >
> > >  config VIRTIO_PMEM
> > > --
> > > 2.25.0.265.gbab2e86ba0-goog
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
