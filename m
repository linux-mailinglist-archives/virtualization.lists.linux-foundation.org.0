Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D3432350417
	for <lists.virtualization@lfdr.de>; Wed, 31 Mar 2021 18:05:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15952404E1;
	Wed, 31 Mar 2021 16:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nzGLsQTW9EAB; Wed, 31 Mar 2021 16:05:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 923F140252;
	Wed, 31 Mar 2021 16:05:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95F9EC0017;
	Wed, 31 Mar 2021 16:05:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43F42C000A;
 Wed, 31 Mar 2021 16:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BEF740E9B;
 Wed, 31 Mar 2021 16:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4kzJwxt1FK1d; Wed, 31 Mar 2021 16:05:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5381A40E98;
 Wed, 31 Mar 2021 16:05:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B767D6E;
 Wed, 31 Mar 2021 09:05:16 -0700 (PDT)
Received: from [10.57.24.208] (unknown [10.57.24.208])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 321003F792;
 Wed, 31 Mar 2021 09:05:14 -0700 (PDT)
Subject: Re: [PATCH 16/18] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
To: Will Deacon <will@kernel.org>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-17-hch@lst.de>
 <20210330131149.GP5908@willie-the-truck>
 <a6952aa7-4d7e-54f0-339e-e15f88596dcc@arm.com>
 <20210330135801.GA6187@willie-the-truck>
 <578d6aa5-4239-f5d7-2e9f-686b18e52bba@arm.com>
 <20210331114947.GA7626@willie-the-truck>
 <ef895942-e115-7878-ab86-37e8a1614df5@arm.com>
 <20210331153256.GA7815@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <81dd27fe-28ee-c800-fe5d-aaa64cb93513@arm.com>
Date: Wed, 31 Mar 2021 17:05:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331153256.GA7815@willie-the-truck>
Content-Language: en-GB
Cc: kvm@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
 netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 freedreno@lists.freedesktop.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
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

On 2021-03-31 16:32, Will Deacon wrote:
> On Wed, Mar 31, 2021 at 02:09:37PM +0100, Robin Murphy wrote:
>> On 2021-03-31 12:49, Will Deacon wrote:
>>> On Tue, Mar 30, 2021 at 05:28:19PM +0100, Robin Murphy wrote:
>>>> On 2021-03-30 14:58, Will Deacon wrote:
>>>>> On Tue, Mar 30, 2021 at 02:19:38PM +0100, Robin Murphy wrote:
>>>>>> On 2021-03-30 14:11, Will Deacon wrote:
>>>>>>> On Tue, Mar 16, 2021 at 04:38:22PM +0100, Christoph Hellwig wrote:
>>>>>>>> From: Robin Murphy <robin.murphy@arm.com>
>>>>>>>>
>>>>>>>> Instead make the global iommu_dma_strict paramete in iommu.c canonical by
>>>>>>>> exporting helpers to get and set it and use those directly in the drivers.
>>>>>>>>
>>>>>>>> This make sure that the iommu.strict parameter also works for the AMD and
>>>>>>>> Intel IOMMU drivers on x86.  As those default to lazy flushing a new
>>>>>>>> IOMMU_CMD_LINE_STRICT is used to turn the value into a tristate to
>>>>>>>> represent the default if not overriden by an explicit parameter.
>>>>>>>>
>>>>>>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>.
>>>>>>>> [ported on top of the other iommu_attr changes and added a few small
>>>>>>>>      missing bits]
>>>>>>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>>>>>>> ---
>>>>>>>>      drivers/iommu/amd/iommu.c                   | 23 +-------
>>>>>>>>      drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 50 +---------------
>>>>>>>>      drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 -
>>>>>>>>      drivers/iommu/arm/arm-smmu/arm-smmu.c       | 27 +--------
>>>>>>>>      drivers/iommu/dma-iommu.c                   |  9 +--
>>>>>>>>      drivers/iommu/intel/iommu.c                 | 64 ++++-----------------
>>>>>>>>      drivers/iommu/iommu.c                       | 27 ++++++---
>>>>>>>>      include/linux/iommu.h                       |  4 +-
>>>>>>>>      8 files changed, 40 insertions(+), 165 deletions(-)
>>>>>>>
>>>>>>> I really like this cleanup, but I can't help wonder if it's going in the
>>>>>>> wrong direction. With SoCs often having multiple IOMMU instances and a
>>>>>>> distinction between "trusted" and "untrusted" devices, then having the
>>>>>>> flush-queue enabled on a per-IOMMU or per-domain basis doesn't sound
>>>>>>> unreasonable to me, but this change makes it a global property.
>>>>>>
>>>>>> The intent here was just to streamline the existing behaviour of stuffing a
>>>>>> global property into a domain attribute then pulling it out again in the
>>>>>> illusion that it was in any way per-domain. We're still checking
>>>>>> dev_is_untrusted() before making an actual decision, and it's not like we
>>>>>> can't add more factors at that point if we want to.
>>>>>
>>>>> Like I say, the cleanup is great. I'm just wondering whether there's a
>>>>> better way to express the complicated logic to decide whether or not to use
>>>>> the flush queue than what we end up with:
>>>>>
>>>>> 	if (!cookie->fq_domain && (!dev || !dev_is_untrusted(dev)) &&
>>>>> 	    domain->ops->flush_iotlb_all && !iommu_get_dma_strict())
>>>>>
>>>>> which is mixing up globals, device properties and domain properties. The
>>>>> result is that the driver code ends up just using the global to determine
>>>>> whether or not to pass IO_PGTABLE_QUIRK_NON_STRICT to the page-table code,
>>>>> which is a departure from the current way of doing things.
>>>>
>>>> But previously, SMMU only ever saw the global policy piped through the
>>>> domain attribute by iommu_group_alloc_default_domain(), so there's no
>>>> functional change there.
>>>
>>> For DMA domains sure, but I don't think that's the case for unmanaged
>>> domains such as those used by VFIO.
>>
>> Eh? This is only relevant to DMA domains anyway. Flush queues are part of
>> the IOVA allocator that VFIO doesn't even use. It's always been the case
>> that unmanaged domains only use strict invalidation.
> 
> Maybe I'm going mad. With this patch, the SMMU driver unconditionally sets
> IO_PGTABLE_QUIRK_NON_STRICT for page-tables if iommu_get_dma_strict() is
> true, no? In which case, that will get set for page-tables corresponding
> to unmanaged domains as well as DMA domains when it is enabled. That didn't
> happen before because you couldn't set the attribute for unmanaged domains.
> 
> What am I missing?

Oh cock... sorry, all this time I've been saying what I *expect* it to 
do, while overlooking the fact that the IO_PGTABLE_QUIRK_NON_STRICT 
hunks were the bits I forgot to write and Christoph had to fix up. 
Indeed, those should be checking the domain type too to preserve the 
existing behaviour. Apologies for the confusion.

Robin.

>>>> Obviously some of the above checks could be factored out into some kind of
>>>> iommu_use_flush_queue() helper that IOMMU drivers can also call if they need
>>>> to keep in sync. Or maybe we just allow iommu-dma to set
>>>> IO_PGTABLE_QUIRK_NON_STRICT directly via iommu_set_pgtable_quirks() if we're
>>>> treating that as a generic thing now.
>>>
>>> I think a helper that takes a domain would be a good starting point.
>>
>> You mean device, right? The one condition we currently have is at the device
>> level, and there's really nothing inherent to the domain itself that matters
>> (since the type is implicitly IOMMU_DOMAIN_DMA to even care about this).
> 
> Device would probably work too; you'd pass the first device to attach to the
> domain when querying this from the SMMU driver, I suppose.
> 
> Will
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
