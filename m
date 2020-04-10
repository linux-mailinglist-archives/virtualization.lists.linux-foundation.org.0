Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFC51A44BA
	for <lists.virtualization@lfdr.de>; Fri, 10 Apr 2020 11:51:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 635D32045A;
	Fri, 10 Apr 2020 09:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KTJ2nG2gmENE; Fri, 10 Apr 2020 09:51:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4073E20488;
	Fri, 10 Apr 2020 09:51:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26AE1C0177;
	Fri, 10 Apr 2020 09:51:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23173C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 09:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0D1CC86D78
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 09:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zC+mWIy4yS6I
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 09:51:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5306986CDC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 09:51:35 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id d18so1384371otc.5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 02:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ne1I5N3/wwuCfWlSTIbXPwHMGfTFfxhjkMy1Sgth4kw=;
 b=tKQIePxD+KhRQLRgtvSEfeE0VmS3wFFghEXBGzE/XEmhMB+99EcMmz9MBDgT3ISwc+
 HwTpkbrElZJaAnrhcVvOq/Brk4OmSL8MuHgZqkedw/+FGlzP4XCWVpGbC+jeFzLtAgbs
 Uakljx/cy+ysHKIv3jxIczv5WUNmdUcS6aV6nZnubJ2A0O1BQlalEWvGIPY2L5vsaziC
 fHVX51XitngXvijZXGFmWsuap5S5Y0RAa2t7B9zbYT8kJ87bEIMuyyIEDnkfwsocYdbd
 QUOO6AE5lflQhMEaaztIFbsXfbDHoR7O9t+c4D6ST9YuOZjgBOQQODVPZoAmlnqruf0z
 yofA==
X-Gm-Message-State: AGi0Pubhd0+KlmKZZhE3kEFk/kyxUQwhs+RIWTyVnFuytdbbx9AEqTuI
 3okzcOGnvcxs5QRj/PTg26HGB7d7E/FTqgTv3II=
X-Google-Smtp-Source: APiQypLelDB1zoePDN1AZwr/IomIMzDCxsIWWOt5sev9LXyBBr/1uuDSUDuLoi1OAti/KVSHWW08qdSrZW5MvcOcb9U=
X-Received: by 2002:a4a:a442:: with SMTP id w2mr3477255ool.90.1586512294559;
 Fri, 10 Apr 2020 02:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200405081355.2870-1-mst@redhat.com>
In-Reply-To: <20200405081355.2870-1-mst@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Apr 2020 11:51:22 +0200
Message-ID: <CAMuHMdXedy2knwgW7-tYB8-d=RaqpvQcoL-MQp3WAED-g1Xpkw@mail.gmail.com>
Subject: Re: [PATCH] vdpa-sim: depend on HAS_DMA
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

Hi Michael,

On Sun, Apr 5, 2020 at 10:17 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> set_dma_ops isn't available on all architectures:
>
>         make ARCH=um
> ...
>
>    drivers/vdpa/vdpa_sim/vdpa_sim.c: In function 'vdpasim_create':
> >> drivers/vdpa/vdpa_sim/vdpa_sim.c:324:2: error: implicit declaration of function 'set_dma_ops'; did you mean 'set_groups'?
> +[-Werror=implicit-function-declaration]
>      set_dma_ops(dev, &vdpasim_dma_ops);
>      ^~~~~~~~~~~
>      set_groups
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

As this fixes the Sun-3 all{mod,yes}-config build, which has NO_DMA=y:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

However, you may want to follow Christoph's suggestion instead.

> --- a/drivers/vdpa/Kconfig
> +++ b/drivers/vdpa/Kconfig
> @@ -14,7 +14,7 @@ if VDPA_MENU
>
>  config VDPA_SIM
>         tristate "vDPA device simulator"
> -       depends on RUNTIME_TESTING_MENU
> +       depends on RUNTIME_TESTING_MENU && HAS_DMA
>         select VDPA
>         select VHOST_RING
>         select VHOST_IOTLB

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
