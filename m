Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 87990161393
	for <lists.virtualization@lfdr.de>; Mon, 17 Feb 2020 14:32:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CA68785683;
	Mon, 17 Feb 2020 13:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iI3_KPJ0RtsA; Mon, 17 Feb 2020 13:32:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 639C485754;
	Mon, 17 Feb 2020 13:32:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4708DC013E;
	Mon, 17 Feb 2020 13:32:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10BD0C089F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 13:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0621384499
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 13:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2CW84gkmeusM
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 13:31:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2873184497
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 13:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581946316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lUvyoUjfSX5f6/1RRB0VYzW8DlAUW685MiMJyCEtR08=;
 b=WDwDaiqGyXg/vh84hqo1DwuMq4X2gMv62jxpYrMhQ8P2Qz3p00GPBQiotyQMQTxkwlec/q
 QdyDeMy6YlpJubEc4i65sbpKQUWuX6Js5/HCFp8Pxza6wYWabjEyL5/Fn8G56VEd5TUyrY
 UOQv996phDjKg78DxMX7LEM51AJsYBQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-ke50pvi-NiiFpxnLvsNbkw-1; Mon, 17 Feb 2020 08:31:55 -0500
Received: by mail-qt1-f198.google.com with SMTP id l25so10964336qtu.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 05:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lUvyoUjfSX5f6/1RRB0VYzW8DlAUW685MiMJyCEtR08=;
 b=X0Wo8JQKpK9tBh0bZwpQ9WdRviK0M5RntnXEcdHXFur1tBTqsdEhcdE13OINZGxUYF
 lOzGB49s92kIYIOgobnuIzpyA2WCNT1aHbpPh1waARv4HdUCQ4vrx9LYmbpmN9VmLpka
 UyJ3xwenzACLySpFGt62qxAQkcXIKNv3fWiu/p5XfCLyATm5AxFVBfdIk73JfXR1A741
 7fBaOlPxyWDfY/x97qo46ghAWKqwjph4g8whMVp4NceRz+4ocsiXFu8S8l+5zXS+Y9Cs
 pr1A6bJ+rEIu1b4x5dKsM7EI/ZIGLfOfgdx6ShJg37z1Zb5J4YB/BOGwnh0P2l93rkrg
 LGvg==
X-Gm-Message-State: APjAAAVKulM2QFzPRT0xwPSEH66qbLjMXf+oGBVj/QBRer5Qcuiy6ZpA
 5k5T7K8aqmNaF6BRY8hyrufvF0detdtw0RV/asV6MFvLcvRQzFBLG7HBVixzbC/iYGVn00gumt9
 /Xw2hdS+/m3Mu92bSHknHct78DdLKh6wTgxCUTo+WOw==
X-Received: by 2002:ad4:42aa:: with SMTP id e10mr12528990qvr.92.1581946314839; 
 Mon, 17 Feb 2020 05:31:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqzFFpTGQ2FvYsH22BKJUIToZTIyrsUmR2uTpY59CIvpA4dXhekQ3/kJ/uLcJkmo5vzAaPoAiQ==
X-Received: by 2002:ad4:42aa:: with SMTP id e10mr12528952qvr.92.1581946314375; 
 Mon, 17 Feb 2020 05:31:54 -0800 (PST)
Received: from redhat.com (bzq-79-176-28-95.red.bezeqint.net. [79.176.28.95])
 by smtp.gmail.com with ESMTPSA id
 c8sm216623qkk.37.2020.02.17.05.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 05:31:53 -0800 (PST)
Date: Mon, 17 Feb 2020 08:31:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 3/3] iommu/virtio: Enable x86 support
Message-ID: <20200217083112-mutt-send-email-mst@kernel.org>
References: <20200214160413.1475396-1-jean-philippe@linaro.org>
 <20200214160413.1475396-4-jean-philippe@linaro.org>
 <311a1885-c619-3c8d-29dd-14fbfbf74898@arm.com>
 <20200216045006-mutt-send-email-mst@kernel.org>
 <20200217090107.GA1650092@myrica>
 <20200217080129-mutt-send-email-mst@kernel.org>
 <915044ae-6972-e0eb-43e8-d071af848fe3@arm.com>
MIME-Version: 1.0
In-Reply-To: <915044ae-6972-e0eb-43e8-d071af848fe3@arm.com>
X-MC-Unique: ke50pvi-NiiFpxnLvsNbkw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-pci@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, jacob.jun.pan@intel.com, bhelgaas@google.com
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

On Mon, Feb 17, 2020 at 01:22:44PM +0000, Robin Murphy wrote:
> On 17/02/2020 1:01 pm, Michael S. Tsirkin wrote:
> > On Mon, Feb 17, 2020 at 10:01:07AM +0100, Jean-Philippe Brucker wrote:
> > > On Sun, Feb 16, 2020 at 04:50:33AM -0500, Michael S. Tsirkin wrote:
> > > > On Fri, Feb 14, 2020 at 04:57:11PM +0000, Robin Murphy wrote:
> > > > > On 14/02/2020 4:04 pm, Jean-Philippe Brucker wrote:
> > > > > > With the built-in topology description in place, x86 platforms can now
> > > > > > use the virtio-iommu.
> > > > > > 
> > > > > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > > > > ---
> > > > > >    drivers/iommu/Kconfig | 3 ++-
> > > > > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > > > > > index 068d4e0e3541..adcbda44d473 100644
> > > > > > --- a/drivers/iommu/Kconfig
> > > > > > +++ b/drivers/iommu/Kconfig
> > > > > > @@ -508,8 +508,9 @@ config HYPERV_IOMMU
> > > > > >    config VIRTIO_IOMMU
> > > > > >    	bool "Virtio IOMMU driver"
> > > > > >    	depends on VIRTIO=y
> > > > > > -	depends on ARM64
> > > > > > +	depends on (ARM64 || X86)
> > > > > >    	select IOMMU_API
> > > > > > +	select IOMMU_DMA
> > > > > 
> > > > > Can that have an "if X86" for clarity? AIUI it's not necessary for
> > > > > virtio-iommu itself (and really shouldn't be), but is merely to satisfy the
> > > > > x86 arch code's expectation that IOMMU drivers bring their own DMA ops,
> > > > > right?
> > > > > 
> > > > > Robin.
> > > > 
> > > > In fact does not this work on any platform now?
> > > 
> > > There is ongoing work to use the generic IOMMU_DMA ops on X86. AMD IOMMU
> > > has been converted recently [1] but VT-d still implements its own DMA ops
> > > (conversion patches are on the list [2]). On Arm the arch Kconfig selects
> > > IOMMU_DMA, and I assume we'll have the same on X86 once Tom's work is
> > > complete. Until then I can add a "if X86" here for clarity.
> > > 
> > > Thanks,
> > > Jean
> > > 
> > > [1] https://lore.kernel.org/linux-iommu/20190613223901.9523-1-murphyt7@tcd.ie/
> > > [2] https://lore.kernel.org/linux-iommu/20191221150402.13868-1-murphyt7@tcd.ie/
> > 
> > What about others? E.g. PPC?
> 
> That was the point I was getting at - while iommu-dma should build just fine
> for the likes of PPC, s390, 32-bit Arm, etc., they have no architecture code
> to correctly wire up iommu_dma_ops to devices. Thus there's currently no
> point pulling it in and pretending it's anything more than a waste of space
> for architectures other than arm64 and x86. It's merely a historical
> artefact of the x86 DMA API implementation that when the IOMMU drivers were
> split out to form drivers/iommu they took some of their relevant arch code
> with them.
> 
> Robin.


Rather than white-listing architectures, how about making the
architectures in question set some kind of symbol, and depend on it?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
