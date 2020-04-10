Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 871541A4335
	for <lists.virtualization@lfdr.de>; Fri, 10 Apr 2020 09:53:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D7F4620378;
	Fri, 10 Apr 2020 07:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dVe-O4O04jv9; Fri, 10 Apr 2020 07:53:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2C00A1FE32;
	Fri, 10 Apr 2020 07:53:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06A6FC0177;
	Fri, 10 Apr 2020 07:53:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BB95C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 07:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 712E82036C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 07:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KxpjreYKUARA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 07:53:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 7C7CF2035E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 07:53:32 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id d63so809198oig.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 00:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=43YaSfqpJyOfIAuLu675v/pUr1xudLlbaRp3cnQ1E1M=;
 b=O9WWsF2GbiNo3aNAjQ/vPcq6J9r3KgNLtgQ2Sx2dxZTG+qyn5IW23FAEO2rb9sZjuP
 xTdeKmXw4wrgl1KJdIb5aMcp3Z3/vivxlu2XqqeqLnF9J9oQjV+Sxbpcz/i5L0OGGB+P
 vkzvkJHbuWDqAFg1DmdTqVyAPo0wtv6mXcyWvywGxqtPMAcAG4cmS1iEGQEyjhih2HHc
 KFgcw6Kwf17nkHktu+GPwnnF8omkGde4/UZlP722AKFKFeiE/P8rjtKgOrnjTMoP8eB3
 LSnn8sxcn4x5UDWVikbw7dTddWx3yk3+EavJRrNP4fWhrpZ2adRn3F56AKX+FaFat7HF
 QwQg==
X-Gm-Message-State: AGi0PubNIQuAVAau0lCk5U1ShyuLILB6FmVLnDwxAtyIbyGmOauE+zT9
 gdsZ7UBT3epj/lBVyaEuBWwIiwRgQ5wwX1lEbf4=
X-Google-Smtp-Source: APiQypI2iSZw3iV38K/psYnZhCLD4hmjmk2Nofeoj39fmkSe6PSIuMUG2TZNfre2x8Vj/xAGpFQnwPhLWPk1wzfDD8k=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr2373320oig.153.1586505211719; 
 Fri, 10 Apr 2020 00:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <git-mailbomb-linux-master-20c384f1ea1a0bc7320bc445c72dd02d2970d594@kernel.org>
In-Reply-To: <git-mailbomb-linux-master-20c384f1ea1a0bc7320bc445c72dd02d2970d594@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Apr 2020 09:53:20 +0200
Message-ID: <CAMuHMdUkff8XUrbHa90nGxa8Kj3HO9b2CRO57s3YZrSFPM51pg@mail.gmail.com>
Subject: Re: vhost: refine vhost and vringh kconfig
To: Jason Wang <jasowang@redhat.com>
Cc: virtualization@lists.linux-foundation.org, KVM list <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

Hi Jason,

On Thu, Apr 9, 2020 at 6:04 AM Linux Kernel Mailing List
<linux-kernel@vger.kernel.org> wrote:
> Commit:     20c384f1ea1a0bc7320bc445c72dd02d2970d594
> Parent:     5a6b4cc5b7a1892a8d7f63d6cbac6e0ae2a9d031
> Refname:    refs/heads/master
> Web:        https://git.kernel.org/torvalds/c/20c384f1ea1a0bc7320bc445c72dd02d2970d594
> Author:     Jason Wang <jasowang@redhat.com>
> AuthorDate: Thu Mar 26 22:01:17 2020 +0800
> Committer:  Michael S. Tsirkin <mst@redhat.com>
> CommitDate: Wed Apr 1 12:06:26 2020 -0400
>
>     vhost: refine vhost and vringh kconfig
>
>     Currently, CONFIG_VHOST depends on CONFIG_VIRTUALIZATION. But vhost is
>     not necessarily for VM since it's a generic userspace and kernel
>     communication protocol. Such dependency may prevent archs without
>     virtualization support from using vhost.
>
>     To solve this, a dedicated vhost menu is created under drivers so
>     CONIFG_VHOST can be decoupled out of CONFIG_VIRTUALIZATION.
>
>     While at it, also squash Kconfig.vringh into vhost Kconfig file. This
>     avoids the trick of conditional inclusion from VOP or CAIF. Then it
>     will be easier to introduce new vringh users and common dependency for
>     both vringh and vhost.
>
>     Signed-off-by: Jason Wang <jasowang@redhat.com>
>     Link: https://lore.kernel.org/r/20200326140125.19794-2-jasowang@redhat.com
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  arch/arm/kvm/Kconfig         |  2 --
>  arch/arm64/kvm/Kconfig       |  2 --
>  arch/mips/kvm/Kconfig        |  2 --
>  arch/powerpc/kvm/Kconfig     |  2 --
>  arch/s390/kvm/Kconfig        |  4 ----
>  arch/x86/kvm/Kconfig         |  4 ----
>  drivers/Kconfig              |  2 ++
>  drivers/misc/mic/Kconfig     |  4 ----
>  drivers/net/caif/Kconfig     |  4 ----
>  drivers/vhost/Kconfig        | 28 +++++++++++++++++++++-------
>  drivers/vhost/Kconfig.vringh |  6 ------
>  11 files changed, 23 insertions(+), 37 deletions(-)

> --- a/drivers/vhost/Kconfig
> +++ b/drivers/vhost/Kconfig
> @@ -1,4 +1,23 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +config VHOST_RING
> +       tristate
> +       help
> +         This option is selected by any driver which needs to access
> +         the host side of a virtio ring.
> +
> +config VHOST
> +       tristate
> +       select VHOST_IOTLB
> +       help
> +         This option is selected by any driver which needs to access
> +         the core of vhost.
> +
> +menuconfig VHOST_MENU
> +       bool "VHOST drivers"
> +       default y

Please do not use default y. Your subsystem is not special.

> +

I think this deserves a help text, so users know if they want to enable this
option or not.

Thanks!

> +if VHOST_MENU
> +
>  config VHOST_NET
>         tristate "Host kernel accelerator for virtio net"
>         depends on NET && EVENTFD && (TUN || !TUN) && (TAP || !TAP)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
