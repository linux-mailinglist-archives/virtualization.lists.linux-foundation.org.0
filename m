Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E16B21BE07
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 21:47:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2F44489A06;
	Fri, 10 Jul 2020 19:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VDF9a2aMlx14; Fri, 10 Jul 2020 19:47:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0C3A889A04;
	Fri, 10 Jul 2020 19:47:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1B09C016F;
	Fri, 10 Jul 2020 19:47:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75BCDC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 19:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B12DE894E7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 19:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h+3F+S0gthjB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 19:46:50 +0000 (UTC)
X-Greylist: delayed 00:22:04 by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 81BFA89485
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 19:46:50 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id r22so6409442qke.13
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 12:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A/XxOf2MPny3gUO9mnh1IW4HAphuhFeUQbRFZXAvCpM=;
 b=G8ptAYtqk+SEo+CGoUOHZRF+vl7lJLdIBT0S/pHrduzEbWxvqh1IfPE2/4VhppHPde
 YRXFOyzoKkrWceSDyBehaHWrFlUcgXHG6dZJw/Ckmn9tJWTq/vXETO0JL2rxorvAqYgr
 sfYAe5TLkNk/6oh5kEcCbqnW3iSm0YxUhQvE7I1A5yKSuwuC4rUGD6Q7HEO+tu1wAlSl
 tD0rGE8wl+/tQgRZmMsrGa6EwlUhvHi7G/Qlh1O3Vt+4ehxXhBo8td3OJyHLYU9R9Rnm
 rBv1SJmQ77C6sJHC+gp5sx/9NhXLg9ziLq8flwiewQDJ8rwiHelTeKULpgwtJnZC8Zqx
 8ynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A/XxOf2MPny3gUO9mnh1IW4HAphuhFeUQbRFZXAvCpM=;
 b=FM4dtc4XjgNHYsweVIvrMdD0ZJPApd2PM338N/pFAJeiqoKznvf61L8L6UHioHTjKy
 7TAussQG0sVQ3L1sa6DKCbrybRO/NGLbzxpazpsqmuZUxC+gA/YdEhYatZS+/gH0POxF
 Z30xX+YDC1Ze3ZvbtKoOkpw0nWxwT9wo6wEdSKTNW5jitCmBUtRf/u5hsatk2M2I/2Ay
 PLEvuwqiC8ByCkb1XJ+U9UNBAXX8BwCeD8/KNlD/tR7t8A/VZKG5T4r2RVv84ZWQ1FZq
 CT7umlkl7+VHKKsgpPQUqsYPvSuazQyFN06NejMsBDLa3WVznuGOtAY88v8HZpjvROmw
 pBhg==
X-Gm-Message-State: AOAM531Fz9UlTokuraBlsMnbuGBqybM34cvGIQ6OMGTuyKuOIWMTvJjU
 E5vN9woE8Z/xukVg4Pq19X6mGfiNVDZA8aIXPoMOwSYd3rO2ZA==
X-Google-Smtp-Source: ABdhPJxMIWGB7DkTs3ZmaVNfNrJhTVDywQypoX4jJyE5KKI9jPnWPX+st4yY6PAU87KCAHCqBg6cegX8IfVhneQ5zK4=
X-Received: by 2002:a05:6638:2172:: with SMTP id
 p18mr81169397jak.63.1594408706326; 
 Fri, 10 Jul 2020 12:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190908165642.22253-1-murphyt7@tcd.ie>
 <20190908165642.22253-5-murphyt7@tcd.ie>
 <20200710155933.GA20886@lst.de>
In-Reply-To: <20200710155933.GA20886@lst.de>
From: Tom Murphy <murphyt7@tcd.ie>
Date: Fri, 10 Jul 2020 12:18:15 -0700
Message-ID: <CALQxJuumgH9xR-J1Nj3LQsLW6k+4ie_0Ho3N9UJiN4R0JBGYoQ@mail.gmail.com>
Subject: Re: [PATCH V6 4/5] iommu/dma-iommu: Use the dev->coherent_dma_mask
To: Christoph Hellwig <hch@lst.de>
Cc: Heiko Stuebner <heiko@sntech.de>, virtualization@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
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

>Btw, what is the current state of converting intel-iommu to the dma-iommu

These changes expose a bug in the i915 intel driver which hasn't been
fixed yet. I don't think anyone is actively working on it but I plan
on merging as many patches as I can so it's easier to do the
intel-iommu -> dma-iommu conversion once the bug is fixed.

You can read more about it here:
https://patchwork.kernel.org/cover/11306999/

On Fri, 10 Jul 2020 at 08:59, Christoph Hellwig <hch@lst.de> wrote:
>
> Btw, what is the current state of converting intel-iommu to the dma-iommu
> code?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
