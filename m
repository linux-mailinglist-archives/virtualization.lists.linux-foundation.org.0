Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6A9435FE4
	for <lists.virtualization@lfdr.de>; Thu, 21 Oct 2021 13:04:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5349660EF3;
	Thu, 21 Oct 2021 11:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHGDrI82s_sL; Thu, 21 Oct 2021 11:04:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3113E60EBA;
	Thu, 21 Oct 2021 11:04:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5D5CC0036;
	Thu, 21 Oct 2021 11:04:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E2E9C0011
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 11:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D28F60EBA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 11:04:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DCljx8KAVer1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 11:04:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8899B60590
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 11:04:05 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id j190so374pgd.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 04:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=H7h39YJezI/AQjzQk8oI118TtArXLNThRmFxElKjFnE=;
 b=a1bkgZF6gr5217ghqtHlYdTpO7to3nZoAvYwPCZuwVYoiUubPl5CG1nn7ch82IiKos
 6JDR63byWaAWlVIQVX/Rx32kpPOzVakEbptqB4yAu74/XIgPe+E4ohPgPFblzd8ORglG
 UtyoB9CEQXNCJE9YRmrL4PdEnRUpTtRWYy3i+ciQCWH8cG119qPSL5yhLC+wYTHfuIto
 NzDaindrOC+BVi9vBeigGkW8HTQthkbqFf0Lxsug+5BqnUkhgAtqE8aWRvditDKH4nxs
 58LMMLQcApWbRH4MwoMmNREi/nuqQGxF/rrspY+ft9ooeniXN9pzfXE2TxMi1seO2cIi
 AXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H7h39YJezI/AQjzQk8oI118TtArXLNThRmFxElKjFnE=;
 b=6nbqjDUBCLOGDJVwtuFkBTTy6QrD3P997sGnzLQbtPlpLGiKGb1WvnKL3OpArv1dgP
 2Ji7TmfaenVuJEvAUtUiLpk62kFz9k+QrFpqQoKpEeij6JQGq1TRWLURENLwo/BSF7DC
 HBbaVDqxa8mfEzO/NsoVIxE9PKElkspqAF1dpE4hLxhOnB9ryB+oArv+i9wYscDo/iNW
 7dwJrCIIngbLcLea3xA34UN30UgsnNMJmgNny9uCVlXLfwBoDZV8qNB1rJqVWFpvkJc+
 eAfH98pfdYADb+9rNgX0Jc58mqdu3DJPmVrskMWAe4Ru8KiH/p6GuWqbjG/ADtP89rPF
 Dvrw==
X-Gm-Message-State: AOAM531WoEqt8mEZGjXE+B2OQJ5Pp8gayeIKeJIk/ADP/1EkigSp6QAV
 M10aMkCV/OoXebuvjA/G4+Gm2w==
X-Google-Smtp-Source: ABdhPJyzXLbpHNyIhF4TwQtIBYQThWtMF9D4rpWdamXt6mDCp2GlP8GxsqU2v5c5DSAS2gqtU1MbVQ==
X-Received: by 2002:a05:6a00:138a:b0:44c:b200:38d7 with SMTP id
 t10-20020a056a00138a00b0044cb20038d7mr4858301pfg.5.1634814244820; 
 Thu, 21 Oct 2021 04:04:04 -0700 (PDT)
Received: from localhost ([106.201.113.61])
 by smtp.gmail.com with ESMTPSA id s13sm6537994pfk.175.2021.10.21.04.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 04:04:04 -0700 (PDT)
Date: Thu, 21 Oct 2021 16:34:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH V6] gpio: virtio: Add IRQ support
Message-ID: <20211021110402.rpm4v3g4rhznjteh@vireshk-i7>
References: <8ca87330fd348fc5199ad08904ec90cc6a91a1bf.1634723848.git.viresh.kumar@linaro.org>
 <CAHp75Vctj-v8W+LgdVpYgRVL3fLdcFnOFRFg74LeCc=xLD+w4w@mail.gmail.com>
 <20211021043443.snhqpac5ofmxfb7k@vireshk-i7>
 <CAHp75VdKn7Sze9HxN0gBgbuQS2K6oB+SQsufw576Rkfg4-osOw@mail.gmail.com>
 <20211021095229.lqeb7dtxv4ix2vc5@vireshk-i7>
 <CAMuHMdWDRGmxt55vvRTnyu5SwXCDtkcOLmKA87cd4SSa8S+Z=Q@mail.gmail.com>
 <20211021104950.nhvify5lo7y5fdfh@vireshk-i7>
 <CAMuHMdUutrjVRv7QOjQ3dKqWxAD6fQu4QqXvOjCREj3guGi6xA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUutrjVRv7QOjQ3dKqWxAD6fQu4QqXvOjCREj3guGi6xA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Cc: Arnd Bergmann <arnd@kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Bill Mills <bill.mills@linaro.org>
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

On 21-10-21, 13:02, Geert Uytterhoeven wrote:
> Exactly.  And on CRIS (no longer supported by Linux), there won't
> be any padding.
> 
> So I recommend to always add explicit padding, to make sure all
> members are aligned naturally on all systems.

Right.

-- 
viresh
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
