Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CB4176F56
	for <lists.virtualization@lfdr.de>; Tue,  3 Mar 2020 07:24:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BA9772034A;
	Tue,  3 Mar 2020 06:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ewXhSBsSyEDy; Tue,  3 Mar 2020 06:24:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 83C3120131;
	Tue,  3 Mar 2020 06:24:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A7E1C013E;
	Tue,  3 Mar 2020 06:24:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02F94C013E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 06:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E52A386ECC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 06:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 155j7rlZG8Zf
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 06:24:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 080E886EA3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 06:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583216682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0uDbQSrL5bY0m8ESxsGOghE60Coq5rSinBwFrYLBRO8=;
 b=iOUOcnNnF5yTfIxsyIRmmfiQJPxZ4dLrjalUIFvsDpC7tnvSwpIALMhuyWQg1nliE3qdG4
 /i1oTH1eYckKDgtEnVwrXpWucbbuynmXbfwDYsbKOAopv8X2hRfil30PI9rHQOR6PrfiSI
 sgPCarPV5j1x5ZLrCffKiHIXLhpbqfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-2eioPBa8MCibtDp9ku-Nuw-1; Tue, 03 Mar 2020 01:24:40 -0500
X-MC-Unique: 2eioPBa8MCibtDp9ku-Nuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 514041005510;
 Tue,  3 Mar 2020 06:24:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 632E360C05;
 Tue,  3 Mar 2020 06:24:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A4BCC17535; Tue,  3 Mar 2020 07:24:37 +0100 (CET)
Date: Tue, 3 Mar 2020 07:24:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH] drm/bochs: Remove vga write
Message-ID: <20200303062437.tjoje5huts6oldrv@sirius.home.kraxel.org>
References: <20200227210454.18217-1-alistair.francis@wdc.com>
 <20200228095748.uu4sqkz6y477eabc@sirius.home.kraxel.org>
 <CAKmqyKOTjyRL9vxZrZW8Q+yBM0n-Nw-o-Cn3dUDDfAAa7Nswrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKmqyKOTjyRL9vxZrZW8Q+yBM0n-Nw-o-Cn3dUDDfAAa7Nswrg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: airlied@linux.ie, Khem Raj <raj.khem@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Alistair Francis <alistair.francis@wdc.com>, daniel@ffwll.ch
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

On Mon, Mar 02, 2020 at 02:14:02PM -0800, Alistair Francis wrote:
> On Fri, Feb 28, 2020 at 1:57 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Thu, Feb 27, 2020 at 01:04:54PM -0800, Alistair Francis wrote:
> > > The QEMU model for the Bochs display has no VGA memory section at offset
> > > 0x400 [1]. By writing to this register Linux can create a write to
> > > unassigned memory which depending on machine and architecture can result
> > > in a store fault.
> > >
> > > I don't see any reference to this address at OSDev [2] or in the Bochs
> > > source code.
> > >
> > > Removing this write still allows graphics to work inside QEMU with
> > > the bochs-display.
> >
> > It's not that simple.  The driver also handles the qemu stdvga (-device
> > VGA, -device secondary-vga) which *does* need the vga port write.
> > There is no way for the guest to figure whenever the device is
> > secondary-vga or bochs-display.
> >
> > So how about fixing things on the host side?  Does qemu patch below
> > help?
> 
> That patch looks like it will fix the problem, but it doesn't seem
> like the correct fix. I would rather avoid adding a large chunk of
> dummy I/O to handle the two devices.

It's just a single handler for the parent mmio region, so we have a
defined default action instead of undefined behavior.

Patch just posted to qemu-devel, lets see what others think ...

> > Maybe another possible approach is to enable/disable vga access per
> > arch.  On x86 this doesn't cause any problems.  I guess you are on
> > risc-v?
> 
> I would prefer this option. I do see this on RISC-V, but I suspect the
> issue will appear on other architectures (although how they handle I/O
> failures in QEMU is a different story).
> 
> Can I just do the VGA write if x86?

I know ppc needs it too.  Not sure about other architectures.  I'd
suggest to do it the other way around: blacklist known-problematic
archs.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
