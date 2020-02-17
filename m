Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DED1D160DEB
	for <lists.virtualization@lfdr.de>; Mon, 17 Feb 2020 10:01:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 84EB184363;
	Mon, 17 Feb 2020 09:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5KexfJ1a32-n; Mon, 17 Feb 2020 09:01:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8474485BBA;
	Mon, 17 Feb 2020 09:01:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 644B7C013E;
	Mon, 17 Feb 2020 09:01:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84202C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 09:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7376484820
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 09:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iF0LLhtyAWuw
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 09:01:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1D330848A9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 09:01:18 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a6so17489334wme.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 01:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Brb83lZtOeRlFQ/bRFw4GYUb2M+D+Mxxk7UBESF/VJw=;
 b=vNWO019J+EkB584lxB0GckEDBBfH9ga5QOX2gtMZmlcfhbgC0Vv5GmIo5ilaSatuO2
 kMSqQIkDKb/9GkARhFt5fjiTnpLzJitIxxwFAF4X4QDAiVHDqAmOIX3hqh5JfBhdQftH
 dnw56ku8wO3Dq/q3esdhDBSrDZuYgp648W4LVQ5+WDqyOnMyk8swSfl7vUs8V0QhnEF7
 1cB1XatwZx/9GCZIPOx8a1Fl74Y6n+cP0GoUEsisqUKYTz/T+zCJCwLW+enQ7kW8LcPP
 FyO+FZAwPZDSUhjufHRqzLvKZzQ11+6Ea2LykfxSLnGlM4AmKJgvyYq1fDVKd4SI7DOx
 rojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Brb83lZtOeRlFQ/bRFw4GYUb2M+D+Mxxk7UBESF/VJw=;
 b=TUQEndJIKJ6UpheQmi6hRVqBC0IQVZ022uDcXAU0XYu2kiFm02X/4ZzxLP7zOTrnkq
 mrUgr44oJ5kjL8qneLPEnFhbCRVp0eaHysFfXzgoLVrWNRvvfhrbaGlQW5YdHJ1uO3yc
 P+XQYR857b6ImemEfcBh8dZHdfxfo+ArtwRrZFdV/M3+RU1SEMLSo7f5mA9REhyoAlmT
 mgsEJTq0Bgm5xUtyHyTkL5geJkOfA2N8nxCH1hs6ST04bDvWz3KtsbfDby7k9mjj1fhj
 rcOs0ok0OIsGWDZH9zyZ8FkxaenBpTMY7jqg2iWSuEG1nFLOIow/8XTZV6hPfIqZPb2n
 mNBw==
X-Gm-Message-State: APjAAAWYdD3QMpyoJ6A/4ESuEkpOCa17WJvVZINKVjV4Nk8oZk6nm2xt
 4/Oe77u8yzrykgj52UcOFXAfPA==
X-Google-Smtp-Source: APXvYqzkpI772n/UQE5ai98F9d50e69d9O8VM028XZHeVkrEWip8LT7SDvd/+yCMdba14AIMpFdK4Q==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr21058614wma.121.1581930076262; 
 Mon, 17 Feb 2020 01:01:16 -0800 (PST)
Received: from myrica ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id a26sm19566259wmm.18.2020.02.17.01.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 01:01:15 -0800 (PST)
Date: Mon, 17 Feb 2020 10:01:07 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 3/3] iommu/virtio: Enable x86 support
Message-ID: <20200217090107.GA1650092@myrica>
References: <20200214160413.1475396-1-jean-philippe@linaro.org>
 <20200214160413.1475396-4-jean-philippe@linaro.org>
 <311a1885-c619-3c8d-29dd-14fbfbf74898@arm.com>
 <20200216045006-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216045006-mutt-send-email-mst@kernel.org>
Cc: linux-pci@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 jacob.jun.pan@intel.com, bhelgaas@google.com,
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

On Sun, Feb 16, 2020 at 04:50:33AM -0500, Michael S. Tsirkin wrote:
> On Fri, Feb 14, 2020 at 04:57:11PM +0000, Robin Murphy wrote:
> > On 14/02/2020 4:04 pm, Jean-Philippe Brucker wrote:
> > > With the built-in topology description in place, x86 platforms can now
> > > use the virtio-iommu.
> > > 
> > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > ---
> > >   drivers/iommu/Kconfig | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > > index 068d4e0e3541..adcbda44d473 100644
> > > --- a/drivers/iommu/Kconfig
> > > +++ b/drivers/iommu/Kconfig
> > > @@ -508,8 +508,9 @@ config HYPERV_IOMMU
> > >   config VIRTIO_IOMMU
> > >   	bool "Virtio IOMMU driver"
> > >   	depends on VIRTIO=y
> > > -	depends on ARM64
> > > +	depends on (ARM64 || X86)
> > >   	select IOMMU_API
> > > +	select IOMMU_DMA
> > 
> > Can that have an "if X86" for clarity? AIUI it's not necessary for
> > virtio-iommu itself (and really shouldn't be), but is merely to satisfy the
> > x86 arch code's expectation that IOMMU drivers bring their own DMA ops,
> > right?
> > 
> > Robin.
> 
> In fact does not this work on any platform now?

There is ongoing work to use the generic IOMMU_DMA ops on X86. AMD IOMMU
has been converted recently [1] but VT-d still implements its own DMA ops
(conversion patches are on the list [2]). On Arm the arch Kconfig selects
IOMMU_DMA, and I assume we'll have the same on X86 once Tom's work is
complete. Until then I can add a "if X86" here for clarity.

Thanks,
Jean

[1] https://lore.kernel.org/linux-iommu/20190613223901.9523-1-murphyt7@tcd.ie/
[2] https://lore.kernel.org/linux-iommu/20191221150402.13868-1-murphyt7@tcd.ie/
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
