Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F67AB290
	for <lists.virtualization@lfdr.de>; Fri, 22 Sep 2023 15:13:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CF8B8138D;
	Fri, 22 Sep 2023 13:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CF8B8138D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aV0s50ka3qK3; Fri, 22 Sep 2023 13:13:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D7CEE82CF1;
	Fri, 22 Sep 2023 13:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7CEE82CF1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3E32C008C;
	Fri, 22 Sep 2023 13:13:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B5ACC0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Sep 2023 13:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57AE94169B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Sep 2023 13:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57AE94169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dCpcQ8rSHM_Q
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Sep 2023 13:13:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3F1D40973
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Sep 2023 13:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3F1D40973
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BF12DA7;
 Fri, 22 Sep 2023 06:14:01 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDA5F3F5A1;
 Fri, 22 Sep 2023 06:13:22 -0700 (PDT)
Message-ID: <900b644e-6e21-1038-2252-3dc86cbf0a32@arm.com>
Date: Fri, 22 Sep 2023 14:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/2] iommu/virtio: Make use of ops->iotlb_sync_map
Content-Language: en-GB
To: Jason Gunthorpe <jgg@ziepe.ca>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20230918-viommu-sync-map-v2-0-f33767f6cf7a@linux.ibm.com>
 <20230918-viommu-sync-map-v2-1-f33767f6cf7a@linux.ibm.com>
 <ae7e513b-eb86-97e2-bed0-3cca91b8c959@arm.com>
 <20230919081519.GA3860249@myrica> <20230919144649.GT13795@ziepe.ca>
 <20230922075719.GB1361815@myrica> <20230922124130.GD13795@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230922124130.GD13795@ziepe.ca>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux.dev, Will Deacon <will@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 22/09/2023 1:41 pm, Jason Gunthorpe wrote:
> On Fri, Sep 22, 2023 at 08:57:19AM +0100, Jean-Philippe Brucker wrote:
>>>> They're not strictly equivalent: this check works around a temporary issue
>>>> with the IOMMU core, which calls map/unmap before the domain is
>>>> finalized.
>>>
>>> Where? The above points to iommu_create_device_direct_mappings() but
>>> it doesn't because the pgsize_bitmap == 0:
>>
>> __iommu_domain_alloc() sets pgsize_bitmap in this case:
>>
>>          /*
>>           * If not already set, assume all sizes by default; the driver
>>           * may override this later
>>           */
>>          if (!domain->pgsize_bitmap)
>>                  domain->pgsize_bitmap = bus->iommu_ops->pgsize_bitmap;
> 
> Dirver's shouldn't do that.
> 
> The core code was fixed to try again with mapping reserved regions to
> support these kinds of drivers.

This is still the "normal" code path, really; I think it's only AMD that 
started initialising the domain bitmap "early" and warranted making it 
conditional. However we *do* ultimately want all the drivers to do the 
same, so we can get rid of ops->pgsize_bitmap, because it's already 
pretty redundant and meaningless in the face of per-domain pagetable 
formats.

Thanks,
Robin.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
