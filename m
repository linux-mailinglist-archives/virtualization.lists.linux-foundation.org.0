Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2C417ADDE
	for <lists.virtualization@lfdr.de>; Thu,  5 Mar 2020 19:08:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F0BAF82709;
	Thu,  5 Mar 2020 18:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zH5aUkWWVbgx; Thu,  5 Mar 2020 18:08:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C28F782574;
	Thu,  5 Mar 2020 18:08:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0DD3C013E;
	Thu,  5 Mar 2020 18:08:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79C5CC013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 18:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 60B1E86BEC
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 18:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lySSubRfXRNm
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 18:08:08 +0000 (UTC)
X-Greylist: delayed 00:56:56 by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D685382F92
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 18:08:07 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id dc19so7902539edb.10
 for <virtualization@lists.linux-foundation.org>;
 Thu, 05 Mar 2020 10:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W2UjAEkYLoxg6JgLNx0dN+e49hTl06XZg+T5mliqMNU=;
 b=QdJpsICtDG2FI/4Z9M6lKYAcG0BpjpbXK8rLQyA4OEixlsxjDiGx3To1lir1sBp1M9
 UwuoRwaVCnVgUPq4inbZJ3TxCkxCrFEJn1E6DTKoLoG9iHe+E01qy4ui4vtj9Q36JSXp
 ZqI3vZjzXINJNR2WZQYS26NJieBM4iEKc5bwAVwHReucih3l3k93tS1OUlLleRX0o1y1
 KtuaE/jXH3s5Pdf2YA/jnZsd2GI9LGTK5wvLZgDIrxGSZbyinFeR134NKThtgyXxUoJU
 f3VfKoFSVmnBne9A3FTkdC4acYw5/x1ZZwLrZ04c0wXHMYb/1RofGGRyRmlBqM+aIrD4
 1aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W2UjAEkYLoxg6JgLNx0dN+e49hTl06XZg+T5mliqMNU=;
 b=JYvESBD6a7ueTQBm2x3eu5LzFwhBuaIoXD5rQ6K8rcrjmpxCS+UZ2XN10yvNEAeXBb
 OiVhPzZW63JOA66Y9YTMMEFd6CJY+uF+dOeJanu8D5Wd2Qj5plX7d8L4jtFIT8tbm/8u
 1AbJzsLhjgltW1tVGkLt89BLLgjNXx2Ye3PVmZPH62AGTNWN0BJ1leNfgt32pkOgmzeS
 mpphkw9WdS8czWzxENPBW4hjcj2VDcxEBJ06zNThZJM4c8C75WW3hBpB7mVbnaosAmD+
 KB8pjLwY1QrJIBPjeAWVbuqACKwChLL6FNCJhKcwGR9SJ4FDJDjvWaIStvDLn2n/tS4m
 0/6Q==
X-Gm-Message-State: ANhLgQ3gZo7PxJxVF722Mzd/9oLol2u/GEzue1h+e2vdF2Jy8EoDhjJz
 M9MgCvMM/jKqiH9qiW0jN0XHwTm6qLBaizDG1/eMTN4HWfc=
X-Google-Smtp-Source: ADFU+vtj5gp1/LY+e6ph9lZLVyP4h9/sF6S8jMp7MXl11AHO2LcgdwYrHVm+Ah8nGom52hUhqSxPo5r0KmpWtLmClCc=
X-Received: by 2002:a05:6512:692:: with SMTP id
 t18mr6077856lfe.212.1583427801701; 
 Thu, 05 Mar 2020 09:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-19-tzimmermann@suse.de>
In-Reply-To: <20200305155950.2705-19-tzimmermann@suse.de>
From: Eric Anholt <eric@anholt.net>
Date: Thu, 5 Mar 2020 09:03:10 -0800
Message-ID: <CADaigPXaBRx+DG8TP-BPFycqwzmf-2NMQX6cXQP69MTVE6CzAw@mail.gmail.com>
Subject: Re: [PATCH 18/22] drm/vc4: Use simple encoder
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: hamohammed.sa@gmail.com, alexandre.belloni@bootlin.com, heiko@sntech.de,
 David Airlie <airlied@linux.ie>, stefan@agner.ch, linux@armlinux.org.uk,
 paul@crapouillou.net, linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 krzk@kernel.org, sam@ravnborg.org, sebastian.reichel@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, hjc@rock-chips.com,
 festevam@gmail.com, abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com,
 patrik.r.jakobsson@gmail.com, jonathanh@nvidia.com, xinliang.liu@linaro.org,
 ludovic.desroches@microchip.com, kgene@kernel.org, linux-imx@nxp.com,
 ck.hu@mediatek.com, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org, p.zabel@pengutronix.de,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 john.stultz@linaro.org, jsarha@ti.com, matthias.bgg@gmail.com, wens@csie.org,
 kernel@pengutronix.de, jernej.skrabec@siol.net, rodrigosiqueiramelo@gmail.com,
 tomi.valkeinen@ti.com, bbrezillon@kernel.org, jingoohan1@gmail.com,
 DRI Development <dri-devel@lists.freedesktop.org>, sw0312.kim@samsung.com,
 nicolas.ferre@microchip.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, Daniel Vetter <daniel@ffwll.ch>,
 zourongrong@gmail.com, linux-mediatek@lists.infradead.org, shawnguo@kernel.org,
 laurent.pinchart@ideasonboard.com
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

On Thu, Mar 5, 2020 at 8:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The vc4 driver uses empty implementations for its encoders. Replace
> the code with the generic simple encoder.

Acked-by: Eric Anholt <eric@anholt.net>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
