Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3990C17878D
	for <lists.virtualization@lfdr.de>; Wed,  4 Mar 2020 02:26:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9F583876A0;
	Wed,  4 Mar 2020 01:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QKSwbyYzRwIJ; Wed,  4 Mar 2020 01:26:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 98B0487541;
	Wed,  4 Mar 2020 01:26:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76193C013E;
	Wed,  4 Mar 2020 01:26:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 377BAC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 01:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E2F3985F37
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 01:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jNqJ3oGUP5f3
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 01:26:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 48BE185EA5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 01:26:16 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id c18so107334vsq.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Mar 2020 17:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O9pD7eTKayKhsYYKw3enP3Cpnqb80umNsGJzDDGsAM4=;
 b=hDossmiPT5ZsYw2/No/UnWGjFk7tvNCv2mxERrWzKJ2udcQ1LHSUgCZqbpDPpatSe9
 CsS5IBrOxI5WqEGk50OMnXk1qi7Cx2xaGwn8Y4MCD7gDL88s5hhhs0bmJEcU8zvNhcp0
 N26ZpQs0UrOayJeWh70iaWxvSBb0pAwI9eYzx4CmScF4n2uJqX0vbIzcCyLA2eQ/JPH7
 f3F0f/pr3vlw+oZU9kDCRH5y3Xe9HE6a5Cce2mMuDa5Wj0KbxrLs3aLSgXR2ju2HpGJa
 +duer7EVx2x02EhR1KTZpXzldgOj/IJzlYFsZ/83uEtuv68D4/4xX99ZyNwvmDf+U9zb
 Q76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O9pD7eTKayKhsYYKw3enP3Cpnqb80umNsGJzDDGsAM4=;
 b=O/f3M0w4iWRfJtBmXhoiqrqNmVdtTgbu+ZyLErDNkHoy8/SWL6gB5MWrB/mmW1ZKtE
 W9VCKJbN+iBz9mInpt1dropf+j//rEZBhaesRrh6e8M8oNeW/BTu/7QvkwvBhYRah5+u
 xz5z8hW3c/EKKsQT3JaCIDIquMksBSp7D0wF66gNJ0PL9WtpXaAPlFaDvNeEYxq4h9EJ
 as5GihSRZs/O4BtszpJqW/og31X1EJPhLQxg9e/WRg6Fg3xRLGR0FYlR8GohI+UITrde
 F2YxBZd3qJ5a/NPti/050cdeD9fMNHkcR9PxhlJrAY7RytBzmWc9vLqlYftkOm/PB2ui
 i/8w==
X-Gm-Message-State: ANhLgQ3q/9n3d+bUMJlxV6zDu0fc0F8sbbHmcE07LziLdjCI28CgOEhx
 vKIt7dBWngBOaF/+3idAXq3sZfuCLTnI5UxkbAw=
X-Google-Smtp-Source: ADFU+vvZ3G3hJoK+Tptnc6CvVgnHyEoMJ1j7yGPugaq8jQK47/UHTWvcE0MhTcvOFbyI14sWscWpUpwzm4wI4D7mpZQ=
X-Received: by 2002:a67:f1ca:: with SMTP id v10mr471335vsm.180.1583285175252; 
 Tue, 03 Mar 2020 17:26:15 -0800 (PST)
MIME-Version: 1.0
References: <20200227210454.18217-1-alistair.francis@wdc.com>
 <20200228095748.uu4sqkz6y477eabc@sirius.home.kraxel.org>
 <CAKmqyKOTjyRL9vxZrZW8Q+yBM0n-Nw-o-Cn3dUDDfAAa7Nswrg@mail.gmail.com>
 <20200303062437.tjoje5huts6oldrv@sirius.home.kraxel.org>
In-Reply-To: <20200303062437.tjoje5huts6oldrv@sirius.home.kraxel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 3 Mar 2020 17:18:34 -0800
Message-ID: <CAKmqyKPEtbDr1kmnyz6FtfU567xxgmxn+F=zH_h8k_m1EN9b5A@mail.gmail.com>
Subject: Re: [PATCH] drm/bochs: Remove vga write
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@linux.ie, Khem Raj <raj.khem@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Alistair Francis <alistair.francis@wdc.com>, Daniel Vetter <daniel@ffwll.ch>
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

On Mon, Mar 2, 2020 at 10:24 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, Mar 02, 2020 at 02:14:02PM -0800, Alistair Francis wrote:
> > On Fri, Feb 28, 2020 at 1:57 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > On Thu, Feb 27, 2020 at 01:04:54PM -0800, Alistair Francis wrote:
> > > > The QEMU model for the Bochs display has no VGA memory section at offset
> > > > 0x400 [1]. By writing to this register Linux can create a write to
> > > > unassigned memory which depending on machine and architecture can result
> > > > in a store fault.
> > > >
> > > > I don't see any reference to this address at OSDev [2] or in the Bochs
> > > > source code.
> > > >
> > > > Removing this write still allows graphics to work inside QEMU with
> > > > the bochs-display.
> > >
> > > It's not that simple.  The driver also handles the qemu stdvga (-device
> > > VGA, -device secondary-vga) which *does* need the vga port write.
> > > There is no way for the guest to figure whenever the device is
> > > secondary-vga or bochs-display.
> > >
> > > So how about fixing things on the host side?  Does qemu patch below
> > > help?
> >
> > That patch looks like it will fix the problem, but it doesn't seem
> > like the correct fix. I would rather avoid adding a large chunk of
> > dummy I/O to handle the two devices.
>
> It's just a single handler for the parent mmio region, so we have a
> defined default action instead of undefined behavior.
>
> Patch just posted to qemu-devel, lets see what others think ...

Thanks, let's wait and see what happens.

>
> > > Maybe another possible approach is to enable/disable vga access per
> > > arch.  On x86 this doesn't cause any problems.  I guess you are on
> > > risc-v?
> >
> > I would prefer this option. I do see this on RISC-V, but I suspect the
> > issue will appear on other architectures (although how they handle I/O
> > failures in QEMU is a different story).
> >
> > Can I just do the VGA write if x86?
>
> I know ppc needs it too.  Not sure about other architectures.  I'd
> suggest to do it the other way around: blacklist known-problematic
> archs.

Argh, that is a little uglier. Let's circle back after receiving
feedback on the QEMU patch.

Alistair

>
> cheers,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
