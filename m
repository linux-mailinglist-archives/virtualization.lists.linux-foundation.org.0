Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 471B11782F6
	for <lists.virtualization@lfdr.de>; Tue,  3 Mar 2020 20:16:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D0D5585DF9;
	Tue,  3 Mar 2020 19:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xN7gANGqHOJk; Tue,  3 Mar 2020 19:16:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E5D1385DF7;
	Tue,  3 Mar 2020 19:16:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEC22C013E;
	Tue,  3 Mar 2020 19:16:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 747AEC013E;
 Tue,  3 Mar 2020 19:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5E30185D6F;
 Tue,  3 Mar 2020 19:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JXpT04JPJvre; Tue,  3 Mar 2020 19:16:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F185784E77;
 Tue,  3 Mar 2020 19:16:31 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 141212073B;
 Tue,  3 Mar 2020 19:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583262991;
 bh=rRMdJDhihpbw492Akq7IhrH8YLKWl8VjOzCCbOZqZac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DsP98JqYh3FZtjF1CgaIUF1AvB9sYez3Kr5jeTN/D4eI6y+Y2osl0oCTFHFAcXdE3
 E2uj9eZLuK/81D2DscuklPOQ5jC12DWI+V9I2qOViOeoGxqyFsUDmSREGzym4rN9s8
 CieEbNz093Xkw5rG5vlq33olUAgybJvqxCT02uRI=
Date: Tue, 3 Mar 2020 19:16:25 +0000
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 00/14] iommu: Move iommu_fwspec out of 'struct device'
Message-ID: <20200303191624.GC27329@willie-the-truck>
References: <20200228150820.15340-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228150820.15340-1-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Rob Clark <robdclark@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-arm-msm@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
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

Hi Joerg,

On Fri, Feb 28, 2020 at 04:08:06PM +0100, Joerg Roedel wrote:
> here is a patch-set to rename iommu_param to dev_iommu and
> establish it as a struct for generic per-device iommu-data.
> Also move the iommu_fwspec pointer from struct device into
> dev_iommu to have less iommu-related pointers in struct
> device.
> 
> The bigger part of this patch-set moves the iommu_priv
> pointer from struct iommu_fwspec to dev_iommu, making is
> usable for iommu-drivers which do not use fwspecs.
> 
> The changes for that were mostly straightforward, except for
> the arm-smmu (_not_ arm-smmu-v3) and the qcom iommu driver.
> Unfortunatly I don't have the hardware for those, so any
> testing of these drivers is greatly appreciated.

I haven't had a chance to review this properly yet, but I did take it
for a spin on my Seattle board with MMU-400 (arm-smmu) and it seems to
work the same as before, so:

Tested-by: Will Deacon <will@kernel.org> # arm-smmu

I'll try to review the patches soon.

Cheers,

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
