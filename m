Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E32068B81D
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 14:09:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 42FA0CC9;
	Tue, 13 Aug 2019 12:09:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CF7B4C75
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 12:09:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8491C12F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 12:09:39 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id c34so31442055otb.7
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 05:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tcd-ie.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=s+V8X5K4yGWcY4E0ABSSl3E0oh4a7NUzQ9s+ppVlE7k=;
	b=F1FtNMhKMGHQ7cq0RQkzTDiYPIymdc8MAuzaZwFYqpZDFf9C6xG60y5PKgmXXsBOns
	ofrI8O4MG7+Si6UWl0lqSIVXdWPoErYMRS7506TtvXQ6ZxlXyPjeLt81k+jpjzWk80u0
	1rNGvhJEQxSCdocjIXoQe1N3WlrCsI2uKcLGSgfPKs0IBLmuGO8if9V2XBbzOAaMnDgK
	uoAQa4pGPpJCieHcwGeRtPE/yvkCkupjiacvF/lJwCFMh6WJWLIB7Hpo4IrjO+0u+fUy
	slXIbemccnmr6mQrSeaA4Kszp3xdZYzneFbNXw/G0FgXegkGE5a/4Or77JIIpEgi+X+C
	aBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s+V8X5K4yGWcY4E0ABSSl3E0oh4a7NUzQ9s+ppVlE7k=;
	b=erifQxlx+ZNPvhKJAYdB7WBe++GRGBVZnCmtJ8I+7XT576Q7xLEyk0rlOokjCzkHkY
	Bd0ymh/ea4bQ5pTGw8tJ+vRxKINsFdSqOdUy8HCGVJ/IN5IhRsIxjtwDi5KhTj7otO6p
	Mf3kM0cw0YwtTWN3GQtpWQdlpwKBQVvX75ZK/zE2aqiwHIlNwbo8ixKfixvOX2fAHc+J
	Q4bqPFoLR1Cmq9FwhixnW4EwozaC0aQnMnsPJnYLEAtywGDaB8hi4zl601yWLc8+7IMc
	dbcZF64tt7On4HqOxh49rkBcpfo1+UY6PDhBYTafYhNYrFFbKY3yx7ACAYm/RSTTks+g
	IGBQ==
X-Gm-Message-State: APjAAAXOOc/p8DXPoZvF4HYyGr8xvkVzjEU7ptm3GEhQE+hsYobrsTXN
	uTvYa87swnYuZ9/2sjg/xZogiCPrkKW5fGBD7a/e0w==
X-Google-Smtp-Source: APXvYqzkgOt/bx3cvRsgdT3UFyeEwpsUCCV/wbP0pXOFgHxSTp6e/jsLC4az4z4HlW2Pya1N9m3gTLoq+ugQ3KLwZtM=
X-Received: by 2002:a02:c84b:: with SMTP id r11mr8256390jao.3.1565698178627;
	Tue, 13 Aug 2019 05:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190613223901.9523-1-murphyt7@tcd.ie>
	<20190624061945.GA4912@infradead.org>
	<20190810071952.GA25550@infradead.org>
In-Reply-To: <20190810071952.GA25550@infradead.org>
From: Tom Murphy <murphyt7@tcd.ie>
Date: Tue, 13 Aug 2019 20:09:26 +0800
Message-ID: <CALQxJuvxBc3MH3_B_fZ3FvURHOM3F3dvvZ6x=GtALUAvyu7Qxw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] iommu/amd: Convert the AMD iommu driver to the
	dma-iommu api
To: Christoph Hellwig <hch@infradead.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
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
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Kukjin Kim <kgene@kernel.org>, David Woodhouse <dwmw2@infradead.org>
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
Content-Type: multipart/mixed; boundary="===============7371737247767286920=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

--===============7371737247767286920==
Content-Type: multipart/alternative; boundary="000000000000c3526e058ffe83e2"

--000000000000c3526e058ffe83e2
Content-Type: text/plain; charset="UTF-8"

Hi Christoph,

I quit my job and am having a great time traveling South East Asia.

I definitely don't want this work to go to waste and I hope to repost it
later this week but I can't guarantee it.

Let me know if you need this urgently.

Thanks,
Tom

On Sat 10 Aug 2019, 3:20 p.m. Christoph Hellwig, <hch@infradead.org> wrote:

> On Sun, Jun 23, 2019 at 11:19:45PM -0700, Christoph Hellwig wrote:
> > Tom,
> >
> > next time please cc Jerg as the AMD IOMMU maintainer.
> >
> > Joerg, any chance you could review this?  Toms patches to convert the
> > AMD and Intel IOMMU drivers to the dma-iommu code are going to make my
> > life in DMA land significantly easier, so I have a vested interest
> > in this series moving forward :)
>
> Tom, can you repost the series?  Seems like there hasn't been any
> news for a month.
>

--000000000000c3526e058ffe83e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Christoph,</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I quit my job and am having a great time traveling South East =
Asia.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I definitely=
 don&#39;t want this work to go to waste and I hope to repost it later this=
 week but I can&#39;t guarantee it.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Let me know if you need this urgently.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Tom</div><div dir=
=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sat 10 Aug 2019, 3:20 p.m. Christoph Hellwig, &lt;<a hr=
ef=3D"mailto:hch@infradead.org">hch@infradead.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On Sun, Jun 23, 2019 at 11:19:45PM -0700, Chr=
istoph Hellwig wrote:<br>
&gt; Tom,<br>
&gt; <br>
&gt; next time please cc Jerg as the AMD IOMMU maintainer.<br>
&gt; <br>
&gt; Joerg, any chance you could review this?=C2=A0 Toms patches to convert=
 the<br>
&gt; AMD and Intel IOMMU drivers to the dma-iommu code are going to make my=
<br>
&gt; life in DMA land significantly easier, so I have a vested interest<br>
&gt; in this series moving forward :)<br>
<br>
Tom, can you repost the series?=C2=A0 Seems like there hasn&#39;t been any<=
br>
news for a month.<br>
</blockquote></div></div></div>

--000000000000c3526e058ffe83e2--

--===============7371737247767286920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7371737247767286920==--
