Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F802161296
	for <lists.virtualization@lfdr.de>; Mon, 17 Feb 2020 14:02:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B0EB861A4;
	Mon, 17 Feb 2020 13:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2an5L7CMerVB; Mon, 17 Feb 2020 13:02:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED4EE861A0;
	Mon, 17 Feb 2020 13:02:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7B8EC1D89;
	Mon, 17 Feb 2020 13:02:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8BFBC013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 13:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CF65620111
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 13:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dplBfklJG7W
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 13:02:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 25B732002C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581944522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TP4MnY7tGPhZNJTAZItTt9kiyklHpFFJJPLHhX1/LOE=;
 b=hX31T17MTaJbEWb7LfEG3wNXS/qY3INES+eWfUbrIRQ2522tYUziFXtMiPlKfJPuoJpe2v
 9cbKSrkFZ7oaVe45uPkp80Uy/zr/Lm03P+ui/4XLjHMaDEQ0ErLRUd9NRqKhjytYNhjllP
 Yi4Sbl3mmojyYctcFDbErK6JNQYOVcE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-Lld68k4IMJG93RdOEi-QJg-1; Mon, 17 Feb 2020 08:01:56 -0500
Received: by mail-qt1-f199.google.com with SMTP id m8so10892882qta.20
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 05:01:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TP4MnY7tGPhZNJTAZItTt9kiyklHpFFJJPLHhX1/LOE=;
 b=MTMnpMI02OX3+UtmPWbQuVowmYQM33RqHj6T61AaF+MCIE4DPcoU7jOb55oKQcoUct
 Uh7KuYy1uPEKzjqC+fTH3wTErHiTSLmne4i50j3UXgNZgGKbbHyRF0+yVI+3nIKnNqPn
 evMkwLe7UerdWvm72VHfVV/BYO7pNSd1AsLmg0bv5KqV0X3dmJIX5mDnwNCmUtu2IxAz
 evOqA/uLAC3mePnUkeosvPXjNKwPj2nJAH1txZdgO7r12rsgElhFWP2/xNLzCWaOx8fN
 IsL9fG0oGfz8MfmMVZGP9zrUYJFz3j60AYSYbvWR1k4yg5ZV/PZkcGklBImr8M9L8aDJ
 F3cA==
X-Gm-Message-State: APjAAAVgBmuHCyHEcU2bt8m7vOtuezuB3wOUztLJ8aGfhFCMS6+U6xUm
 PX38VvMcQOftU+izYT46p5wjdoRhdjeLwnOFWf8jMG6XVkeaIWDWOURid1iLnaHnrdRhQpLLPrq
 E4LEwv/cjBdx5tjvuRD3BttqTnkBLSVKsDDY+7p0Z0A==
X-Received: by 2002:a37:9d7:: with SMTP id 206mr11068869qkj.416.1581944516137; 
 Mon, 17 Feb 2020 05:01:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqyQ8C5G4SdbUsD8P4MFfVMK/CjTlG/8dSUmGSJJgcnBeSViAiOdw0hxzTa6igiB5lQZky9sqA==
X-Received: by 2002:a37:9d7:: with SMTP id 206mr11068844qkj.416.1581944515885; 
 Mon, 17 Feb 2020 05:01:55 -0800 (PST)
Received: from redhat.com (bzq-79-176-28-95.red.bezeqint.net. [79.176.28.95])
 by smtp.gmail.com with ESMTPSA id
 n4sm133284qti.55.2020.02.17.05.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 05:01:55 -0800 (PST)
Date: Mon, 17 Feb 2020 08:01:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 3/3] iommu/virtio: Enable x86 support
Message-ID: <20200217080129-mutt-send-email-mst@kernel.org>
References: <20200214160413.1475396-1-jean-philippe@linaro.org>
 <20200214160413.1475396-4-jean-philippe@linaro.org>
 <311a1885-c619-3c8d-29dd-14fbfbf74898@arm.com>
 <20200216045006-mutt-send-email-mst@kernel.org>
 <20200217090107.GA1650092@myrica>
MIME-Version: 1.0
In-Reply-To: <20200217090107.GA1650092@myrica>
X-MC-Unique: Lld68k4IMJG93RdOEi-QJg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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

On Mon, Feb 17, 2020 at 10:01:07AM +0100, Jean-Philippe Brucker wrote:
> On Sun, Feb 16, 2020 at 04:50:33AM -0500, Michael S. Tsirkin wrote:
> > On Fri, Feb 14, 2020 at 04:57:11PM +0000, Robin Murphy wrote:
> > > On 14/02/2020 4:04 pm, Jean-Philippe Brucker wrote:
> > > > With the built-in topology description in place, x86 platforms can now
> > > > use the virtio-iommu.
> > > > 
> > > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > > ---
> > > >   drivers/iommu/Kconfig | 3 ++-
> > > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > > > index 068d4e0e3541..adcbda44d473 100644
> > > > --- a/drivers/iommu/Kconfig
> > > > +++ b/drivers/iommu/Kconfig
> > > > @@ -508,8 +508,9 @@ config HYPERV_IOMMU
> > > >   config VIRTIO_IOMMU
> > > >   	bool "Virtio IOMMU driver"
> > > >   	depends on VIRTIO=y
> > > > -	depends on ARM64
> > > > +	depends on (ARM64 || X86)
> > > >   	select IOMMU_API
> > > > +	select IOMMU_DMA
> > > 
> > > Can that have an "if X86" for clarity? AIUI it's not necessary for
> > > virtio-iommu itself (and really shouldn't be), but is merely to satisfy the
> > > x86 arch code's expectation that IOMMU drivers bring their own DMA ops,
> > > right?
> > > 
> > > Robin.
> > 
> > In fact does not this work on any platform now?
> 
> There is ongoing work to use the generic IOMMU_DMA ops on X86. AMD IOMMU
> has been converted recently [1] but VT-d still implements its own DMA ops
> (conversion patches are on the list [2]). On Arm the arch Kconfig selects
> IOMMU_DMA, and I assume we'll have the same on X86 once Tom's work is
> complete. Until then I can add a "if X86" here for clarity.
> 
> Thanks,
> Jean
> 
> [1] https://lore.kernel.org/linux-iommu/20190613223901.9523-1-murphyt7@tcd.ie/
> [2] https://lore.kernel.org/linux-iommu/20191221150402.13868-1-murphyt7@tcd.ie/

What about others? E.g. PPC?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
