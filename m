Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDCA8E9EC
	for <lists.virtualization@lfdr.de>; Thu, 15 Aug 2019 13:14:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 702BAEE0;
	Thu, 15 Aug 2019 11:14:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0B98DD4A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 11:13:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 531FD8A0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 11:13:57 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id b1so5042468otp.6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 04:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tcd-ie.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IuWtIDr90zkI+XfebKnko5l+I/4xHf39ovWKoeqGaCw=;
	b=nNQ/UtAXFhxaaxM9xQ9O8IFhMDMFvXunujEOMrSPWYCvTGD+YxkdrSxxRuus/GVUBp
	GQoOAQizlE7KESwvt/hZDxMbEejumbr3zlWb4gT62uRTJXHWvWtJR7eaSmt+P/Feob0G
	3FUQTPCC4U1ru+VC9jVwEnwjC7mL9mTGXdSrv0YV/tjgkZ9zqojYrqsx+I/zHyMAQt8f
	8tY1ausOgFce7Ab8S1UDh3376evaQbzs8AquCZCJWaLZvUFdMNaMr4YLxIusv5ITVmeU
	i1/FqeHC8FIMWswYm99EVT/8f/U+y5anena34TtOtJsjHhUYQi17LOqEs6UTPxD4ON1T
	NLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IuWtIDr90zkI+XfebKnko5l+I/4xHf39ovWKoeqGaCw=;
	b=GtzNvhXHKfyAijpGvl5vm+5bROo0c+Pujdgqbyc+370Aff0w9JZ2FLK9UMXTHeR4xY
	9ymxJyeoka8M+QVaLOxSd7blmus9Gz0cA11I83grLihzxyRpvRRos7z7FcuMcQI1TeEo
	U3S8A5lqPgMC3meZm6BoVsIGoKBPvkusfTyjbrqerRslW/ww8RkyFPo6GEo6K8dSu8U3
	WDbs/Uccl8MagofrxnuCHb9nPPK5MjIFmD6kUQrZEamszkJPFtZGK7IqdqL5H4+hoCu1
	t/qz1bl9NwDYdK1svTAYd/XvsTJOXtE56sYBbGGaqZecq76qIVPUmf2FwsTR/U/omkNI
	pBvg==
X-Gm-Message-State: APjAAAVFS/9Jw+ELstRAYiudYgxcGMgxpk85qApzbfbs0+Boy1yLpHPk
	rtWXlDg9Gjs3aQk+Htk0Iwo8qGG6wE2GojrXfZMFQw==
X-Google-Smtp-Source: APXvYqyLPDKvvPTRbvGbWfWW/U8q2MBMOdJm/HCo2dFUBkYNWHxXuaIDP3Rx+nIt9imUtzeQRmZpWsoqqA6dgyl5YCA=
X-Received: by 2002:a5e:9314:: with SMTP id k20mr5014873iom.235.1565867636592; 
	Thu, 15 Aug 2019 04:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190613223901.9523-1-murphyt7@tcd.ie>
	<20190624061945.GA4912@infradead.org>
	<20190810071952.GA25550@infradead.org>
	<CALQxJuvxBc3MH3_B_fZ3FvURHOM3F3dvvZ6x=GtALUAvyu7Qxw@mail.gmail.com>
	<20190813130711.GA30468@infradead.org>
In-Reply-To: <20190813130711.GA30468@infradead.org>
From: Tom Murphy <murphyt7@tcd.ie>
Date: Thu, 15 Aug 2019 12:13:45 +0100
Message-ID: <CALQxJusdvvnL-7WuCy9qobB6heG2oj7XS4Bs3Z1dMyLXSeZOzg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] iommu/amd: Convert the AMD iommu driver to the
	dma-iommu api
To: Christoph Hellwig <hch@infradead.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, Will Deacon <will.deacon@arm.com>,
	virtualization@lists.linux-foundation.org,
	David Brown <david.brown@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
	Andy Gross <agross@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org, Kukjin Kim <kgene@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Done, I just sent it there. I don't have any AMD hardware to test on
while I'm traveling. However the rebase was very straightforward and
the code was tested a month ago on the old linux-next.

I only have the AMD conversion done. I will work on rebasing the intel
one when I get a chance.

On Tue, 13 Aug 2019 at 14:07, Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Aug 13, 2019 at 08:09:26PM +0800, Tom Murphy wrote:
> > Hi Christoph,
> >
> > I quit my job and am having a great time traveling South East Asia.
>
> Enjoy!  I just returned from my vacation.
>
> > I definitely don't want this work to go to waste and I hope to repost it
> > later this week but I can't guarantee it.
> >
> > Let me know if you need this urgently.
>
> It isn't in any strict sense urgent.  I just have various DMA API plans
> that I'd rather just implement in dma-direct and dma-iommu rather than
> also in two additional commonly used iommu drivers.  So on the one had
> the sooner the better, on the other hand no real urgency.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
