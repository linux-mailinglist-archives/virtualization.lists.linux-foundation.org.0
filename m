Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E831B4780
	for <lists.virtualization@lfdr.de>; Wed, 22 Apr 2020 16:41:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5F8E7880E0;
	Wed, 22 Apr 2020 14:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dS46Ks27Tt8S; Wed, 22 Apr 2020 14:41:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7471B883F5;
	Wed, 22 Apr 2020 14:41:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5736BC1DC9;
	Wed, 22 Apr 2020 14:41:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 735BEC0175
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Apr 2020 14:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 61D2688328
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Apr 2020 14:40:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLTU7GiZjVVW
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Apr 2020 14:40:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B7E70880E0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Apr 2020 14:40:58 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id g6so1175680pgs.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Apr 2020 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QD4gvoO62U8g5ke55m5+fi2BWTvN1Nc+EFebE6YyQOw=;
 b=kBRXr4j4qq3NXWS/pXf/1+3fcHvwMlFDdQUdNXX8Wu7dcmXSWvGvQIGl1GSeXcszn9
 TWs5J+JwWja8Evmpng7eCALs5Y8vur5RbDbdVdchoUgUl+MLfPl+POJlopFg6bfp7YwI
 T/2dJTikefM8Is4MK8e4SbGDLkDqdDMEp+Y0xDXJjL3f5/jV2m5uzvEwGs0g5feG3TPp
 718JbvYPONmKPMcWHAhJtbZ4L5j7qLNnoLdJCu2yrR8SEb7b3wZqIDFRSojAydH0D4b/
 KPeCh+QvkEvXxu5Cj+p5EBZhEZKtuvbQGNYw6SISkzcBo7M86NBCM2/gLAVY+uwQqmDI
 lT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QD4gvoO62U8g5ke55m5+fi2BWTvN1Nc+EFebE6YyQOw=;
 b=APmugQ6QXfzv+JMQSi47suYkNg26PQIg3xd9ixJyreB1W/KCAiKiUBWib5TmYBhLuB
 cjm1yPxJ4ddfTmtw8KThJysRiCh6uYsWcgd1EBmaQaQK812x2VD/oslZeW/Wzj0umFxk
 +7ZSeK1t8Mfn3UsSueWqSGApn4SNXa+JosNpCTwPwerp8yywQ1+6tgZSHEwyGoYrd4qQ
 XwgG+qq4Yb6zGqM9GL6BUT2NPbPsRJDG/rLX2YA/GD4ICRrarVt1XFj58J+bz0OgGngK
 Dfq7h6LdnizPncEVMfpYQ2rp7qv76Y81gT1CnPyWyoQfbBLxjNLoxG4v8iLNcTr6uMsF
 Oogw==
X-Gm-Message-State: AGi0PuY7pgyyW1gRbk4aigehscVUmfvTucUil0mnmMncBwjgNZ8BgTLP
 2H2qLaGD4S+AQ9JiWi1w7iremvRhvDYPladwtvs=
X-Google-Smtp-Source: APiQypLalIxaytZo4bcWW/4fbstSP2AlbGVR5eg6nB09MxoKZVT8wAEJIrtspvA3WhXKsbt/27U45IisFwsyi4PqiHE=
X-Received: by 2002:a63:5511:: with SMTP id j17mr25966905pgb.4.1587566458280; 
 Wed, 22 Apr 2020 07:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200421164543.16605-1-zhengdejin5@gmail.com>
 <CAHp75Ve4JwkM+=WHHF73jwNwRS39E-xPDrcn77zCUTpVkj8buA@mail.gmail.com>
 <20200422135215.GA25950@nuc8i5>
In-Reply-To: <20200422135215.GA25950@nuc8i5>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Apr 2020 17:40:51 +0300
Message-ID: <CAHp75Vf2j-QraBxKofgyhtAxpHXnik3DP9kefPhA_d3BuSjfvw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bochs: fix an issue of ioremap() leak
To: Dejin Zheng <zhengdejin5@gmail.com>
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>
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

On Wed, Apr 22, 2020 at 4:52 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
>
> On Tue, Apr 21, 2020 at 08:24:24PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 21, 2020 at 7:45 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
> > >
> > > It forgot to call bochs_hw_fini() to release related resources when
> > > bochs_pci_probe() fail. eg: io virtual address get by ioremap().
> >
> > Good start, although I think the best is to switch this driver to use
> > pcim_*() functions and drop tons of legacy code.
> >
> Andy, thanks for your encouragement, I think we might be able to fix this
> issue first, after that, drop tons of legacy code by pcim_*() functions.
> Do you think it is ok?

It's really up to maintainer. I'm not the one here.

> > > Fixes: 81da8c3b8d3df6 ("drm/bochs: add drm_driver.release callback.")
> > > CC: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > > ---
> > >  drivers/gpu/drm/bochs/bochs_drv.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> > > index addb0568c1af..210a60135c8a 100644
> > > --- a/drivers/gpu/drm/bochs/bochs_drv.c
> > > +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> > > @@ -138,6 +138,7 @@ static int bochs_pci_probe(struct pci_dev *pdev,
> > >         return ret;
> > >
> > >  err_unload:
> > > +       bochs_hw_fini(dev);
> > >         bochs_unload(dev);
> > >  err_free_dev:
> > >         drm_dev_put(dev);
> > > --
> > > 2.25.0
> > >
> >
> >
> > --
> > With Best Regards,
> > Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
