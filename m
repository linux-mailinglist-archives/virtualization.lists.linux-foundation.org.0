Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 573D7160E34
	for <lists.virtualization@lfdr.de>; Mon, 17 Feb 2020 10:12:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0D6E020030;
	Mon, 17 Feb 2020 09:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XoeKUurjhd7Z; Mon, 17 Feb 2020 09:12:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8B6951FE41;
	Mon, 17 Feb 2020 09:12:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DD7DC013E;
	Mon, 17 Feb 2020 09:12:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A0EDC013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 09:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 520FB20111
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 09:12:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OCs+CUjmCA5J
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 09:12:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 43DE220030
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 09:12:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w12so18681049wrt.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 01:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3xReXtDN4LyAJUffUOB2fEzxHj5w+bYneLaFyHrhb/I=;
 b=GI1HEZGX5Puf2LLrSwwBVyM71kCTbxTvC+JtBQ8Axtt2gtfpwmC28LBW78V5qH7fKP
 0xpuXMLzitdJtwKfCYZwhRb0OtE746KFP03x5+2sH58M+pBmfxlPqYyk1VaIdvyQ/rR4
 kbroefLW49Y8QNEw3NqlKuwdFljmv+N1NGnc7Ayhpv8IKMuHXPI+NXgaWMylU2QuVWX+
 lxyRkocrR+9DAN3hR5jjIm+248w3FcgUr3iBOSakgPGi6mBgKNkF5EZrUG4SQtiKaNuT
 j1OopcgprxWCGEXPMEo6JHTwWo9Tq0Q+nlzlRCr/nQZ98qGCo1ma5YhsXqZptzdJewW0
 G4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3xReXtDN4LyAJUffUOB2fEzxHj5w+bYneLaFyHrhb/I=;
 b=Wnd+OXpPwP6s3MkXhdC+HWnotZUvccNHCW0nMmPov+rbqD9CUCZgUvRTXMRt3q35mE
 98kNvjCUpoB8/PaUpEx9UtZOS+ObJoeeRR5MWRbt0uPU7Qnsg9g17vKs+z0sFz3kZqLE
 SsGYM+4gHSncIkBPqSwgB/+qz8k57id8ighNUxpg7CEJyJI7/vhD0qD45eU7YfveNake
 9c68X2lD24Gut8Awx7zWtlb63iybcy9ZxgtQqYkGX0iB9o3GUwqIIIm7rDi2hSrex2qQ
 ZKTNiRIvEh3205RQ7opPKo16K1/PS/XisRR3eIQpDqzNIdFQ10xAhjS5zxNApvTarQSA
 X9eg==
X-Gm-Message-State: APjAAAUaCIqYnJAuGmxC749VqN6rwnBV97Lb63JwfK7dRbocXyrpOfG0
 gHanEq/CZIVQW/n4pt7Yurc40w==
X-Google-Smtp-Source: APXvYqy0+uCZz56gg9KY1CEZhOwTKCImzEBdQ7HaHkQZVJwABbD3oUbmhF4dXY4WjZGNxC5GhUv0GQ==
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr22612667wrw.60.1581930750507; 
 Mon, 17 Feb 2020 01:12:30 -0800 (PST)
Received: from myrica ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id t10sm19040467wmi.40.2020.02.17.01.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 01:12:29 -0800 (PST)
Date: Mon, 17 Feb 2020 10:12:22 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/3] PCI: Add DMA configuration for virtual platforms
Message-ID: <20200217091222.GB1650092@myrica>
References: <20200214160413.1475396-1-jean-philippe@linaro.org>
 <20200214160413.1475396-3-jean-philippe@linaro.org>
 <393cce27-dbed-f075-2a67-9882bed801e7@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <393cce27-dbed-f075-2a67-9882bed801e7@arm.com>
Cc: mst@redhat.com, linux-pci@vger.kernel.org,
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

On Fri, Feb 14, 2020 at 05:03:16PM +0000, Robin Murphy wrote:
> On 14/02/2020 4:04 pm, Jean-Philippe Brucker wrote:
> > Hardware platforms usually describe the IOMMU topology using either
> > device-tree pointers or vendor-specific ACPI tables.  For virtual
> > platforms that don't provide a device-tree, the virtio-iommu device
> > contains a description of the endpoints it manages.  That information
> > allows us to probe endpoints after the IOMMU is probed (possibly as late
> > as userspace modprobe), provided it is discovered early enough.
> > 
> > Add a hook to pci_dma_configure(), which returns -EPROBE_DEFER if the
> > endpoint is managed by a vIOMMU that will be loaded later, or 0 in any
> > other case to avoid disturbing the normal DMA configuration methods.
> > When CONFIG_VIRTIO_IOMMU_TOPOLOGY isn't selected, the call to
> > virt_dma_configure() is compiled out.
> > 
> > As long as the information is consistent, platforms can provide both a
> > device-tree and a built-in topology, and the IOMMU infrastructure is
> > able to deal with multiple DMA configuration methods.
> 
> Urgh, it's already been established[1] that having IOMMU setup tied to DMA
> configuration at driver probe time is not just conceptually wrong but
> actually broken, so the concept here worries me a bit. In a world where
> of_iommu_configure() and friends are being called much earlier around
> iommu_probe_device() time, how badly will this fall apart?

If present the DT configuration should take precedence over this built-in
method, so the earlier it is called the better. virt_dma_configure()
currently gives up if the device already has iommu_ops (well, still calls
setup_dma_ops() which is safe enough, but I think I'll change that to have
virt_iommu_setup() return NULL if iommu_ops are present).

I don't have the full picture of the changes you intend for
{of,acpi}_iommu_configure(), do you think checking the validity of
dev->iommu_fwspec will remain sufficient to have both methods coexist?

Thanks,
Jean
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
