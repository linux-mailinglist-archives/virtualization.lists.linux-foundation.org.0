Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C967B1B2E41
	for <lists.virtualization@lfdr.de>; Tue, 21 Apr 2020 19:24:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 689E48697D;
	Tue, 21 Apr 2020 17:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lFBdPElJFfI5; Tue, 21 Apr 2020 17:24:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A57E87120;
	Tue, 21 Apr 2020 17:24:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C703C0175;
	Tue, 21 Apr 2020 17:24:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F8DEC0175
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 17:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 898BC87E07
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 17:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PMyMW4w7GHOp
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 17:24:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1603687D33
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 17:24:32 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id t9so1630095pjw.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 10:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L2/tuyyrk+FrC+TVWKAO9Jkv7cmo4/vzdDOJ54GNqZ0=;
 b=IWpewJSykrsnWxN4K46c7BXyiKGU5U5+mh07wYceXa0O/DjBweXi+37HQV6tvxior8
 HDFIvxDRQZvnytbETu4ORlFbuLNAvRUZK06E6ocYW7wZu3MO0ot/BhZfVywbZG5Q50QL
 uhYIs5AGh2Ws5lc7HIcAFax5orO6IPLEuQ4MUp3tO8d9xZqSM/jnmzB2XmrdyBBMlzBA
 Nc+q2c2kebrbl7Q0mknsP2gTP5mwFdo5px3V0KHY+UtIh9rPfDAMM4hb/JVZj9ZdEujZ
 35nYpMtceYIjgLbKPL5kiaQ0fbIdc4SA15dZZhg0NguR4NdcLqUIeGKiT7WOdc3yeyJx
 14NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L2/tuyyrk+FrC+TVWKAO9Jkv7cmo4/vzdDOJ54GNqZ0=;
 b=gohh62xD42Z6qxdGk7VAhKHlNoay8054KsDPLxVvX4Di3udEiZb8w/1SavgHnkhrfd
 EX+wWBu/bEeSau5oIYcyc6pMM4NWtOmTvJBONT7g9Zg7hUCE7mioI7bKRDwgQHhCXS0R
 /+8rg4QEEItRLumRywWRcNpOff9LTQXZQ3QMPw7fpQQaBjAAe1DETDYbAtKGqa3bL2P1
 KaT+2BH+2t2Cy6iWs+FDE+YgCJsXokqU/xGbXa7b3KtYxHcOAt/O50KdllyY2H1OeDNw
 /l+AEWZxVImigOLoe81eFFBFLTg5TkwiBuRQRivfKIHv2ojesACYIoO61VfjW2DLr/zj
 vCDQ==
X-Gm-Message-State: AGi0PuZbXieHhw3TsKug2BM8bBi9oQHm+wdML3Kw9HYZlSeTCs7bKhpT
 Y8IVbY3sIrFOVpZd2Mc81bPoKgSZxzT9R94SqTs=
X-Google-Smtp-Source: APiQypLrw+ulWURfZADaQwTNudM24Gky3/1zWkBus2GpUzJiXP5056wZocjopPa5wu8+IgkOOwrer2mXCfEh+NM3RgA=
X-Received: by 2002:a17:90a:2401:: with SMTP id h1mr7010141pje.1.1587489871604; 
 Tue, 21 Apr 2020 10:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200421164543.16605-1-zhengdejin5@gmail.com>
In-Reply-To: <20200421164543.16605-1-zhengdejin5@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Apr 2020 20:24:24 +0300
Message-ID: <CAHp75Ve4JwkM+=WHHF73jwNwRS39E-xPDrcn77zCUTpVkj8buA@mail.gmail.com>
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

On Tue, Apr 21, 2020 at 7:45 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
>
> It forgot to call bochs_hw_fini() to release related resources when
> bochs_pci_probe() fail. eg: io virtual address get by ioremap().

Good start, although I think the best is to switch this driver to use
pcim_*() functions and drop tons of legacy code.

> Fixes: 81da8c3b8d3df6 ("drm/bochs: add drm_driver.release callback.")
> CC: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
>  drivers/gpu/drm/bochs/bochs_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> index addb0568c1af..210a60135c8a 100644
> --- a/drivers/gpu/drm/bochs/bochs_drv.c
> +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> @@ -138,6 +138,7 @@ static int bochs_pci_probe(struct pci_dev *pdev,
>         return ret;
>
>  err_unload:
> +       bochs_hw_fini(dev);
>         bochs_unload(dev);
>  err_free_dev:
>         drm_dev_put(dev);
> --
> 2.25.0
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
