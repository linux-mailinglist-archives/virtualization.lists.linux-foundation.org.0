Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C6469161332
	for <lists.virtualization@lfdr.de>; Mon, 17 Feb 2020 14:22:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B908D86224;
	Mon, 17 Feb 2020 13:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxzzHv+LMEAD; Mon, 17 Feb 2020 13:22:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A63238628E;
	Mon, 17 Feb 2020 13:22:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84F40C013E;
	Mon, 17 Feb 2020 13:22:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE491C013E;
 Mon, 17 Feb 2020 13:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E318A86230;
 Mon, 17 Feb 2020 13:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6RHfLLXvRV9s; Mon, 17 Feb 2020 13:22:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0C8DA86224;
 Mon, 17 Feb 2020 13:22:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EBB130E;
 Mon, 17 Feb 2020 05:22:47 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B83EC3F703;
 Mon, 17 Feb 2020 05:22:45 -0800 (PST)
Subject: Re: [PATCH 3/3] iommu/virtio: Enable x86 support
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20200214160413.1475396-1-jean-philippe@linaro.org>
 <20200214160413.1475396-4-jean-philippe@linaro.org>
 <311a1885-c619-3c8d-29dd-14fbfbf74898@arm.com>
 <20200216045006-mutt-send-email-mst@kernel.org>
 <20200217090107.GA1650092@myrica>
 <20200217080129-mutt-send-email-mst@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <915044ae-6972-e0eb-43e8-d071af848fe3@arm.com>
Date: Mon, 17 Feb 2020 13:22:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200217080129-mutt-send-email-mst@kernel.org>
Content-Language: en-GB
Cc: linux-pci@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 jacob.jun.pan@intel.com, bhelgaas@google.com
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

On 17/02/2020 1:01 pm, Michael S. Tsirkin wrote:
> On Mon, Feb 17, 2020 at 10:01:07AM +0100, Jean-Philippe Brucker wrote:
>> On Sun, Feb 16, 2020 at 04:50:33AM -0500, Michael S. Tsirkin wrote:
>>> On Fri, Feb 14, 2020 at 04:57:11PM +0000, Robin Murphy wrote:
>>>> On 14/02/2020 4:04 pm, Jean-Philippe Brucker wrote:
>>>>> With the built-in topology description in place, x86 platforms can now
>>>>> use the virtio-iommu.
>>>>>
>>>>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>>> ---
>>>>>    drivers/iommu/Kconfig | 3 ++-
>>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
>>>>> index 068d4e0e3541..adcbda44d473 100644
>>>>> --- a/drivers/iommu/Kconfig
>>>>> +++ b/drivers/iommu/Kconfig
>>>>> @@ -508,8 +508,9 @@ config HYPERV_IOMMU
>>>>>    config VIRTIO_IOMMU
>>>>>    	bool "Virtio IOMMU driver"
>>>>>    	depends on VIRTIO=y
>>>>> -	depends on ARM64
>>>>> +	depends on (ARM64 || X86)
>>>>>    	select IOMMU_API
>>>>> +	select IOMMU_DMA
>>>>
>>>> Can that have an "if X86" for clarity? AIUI it's not necessary for
>>>> virtio-iommu itself (and really shouldn't be), but is merely to satisfy the
>>>> x86 arch code's expectation that IOMMU drivers bring their own DMA ops,
>>>> right?
>>>>
>>>> Robin.
>>>
>>> In fact does not this work on any platform now?
>>
>> There is ongoing work to use the generic IOMMU_DMA ops on X86. AMD IOMMU
>> has been converted recently [1] but VT-d still implements its own DMA ops
>> (conversion patches are on the list [2]). On Arm the arch Kconfig selects
>> IOMMU_DMA, and I assume we'll have the same on X86 once Tom's work is
>> complete. Until then I can add a "if X86" here for clarity.
>>
>> Thanks,
>> Jean
>>
>> [1] https://lore.kernel.org/linux-iommu/20190613223901.9523-1-murphyt7@tcd.ie/
>> [2] https://lore.kernel.org/linux-iommu/20191221150402.13868-1-murphyt7@tcd.ie/
> 
> What about others? E.g. PPC?

That was the point I was getting at - while iommu-dma should build just 
fine for the likes of PPC, s390, 32-bit Arm, etc., they have no 
architecture code to correctly wire up iommu_dma_ops to devices. Thus 
there's currently no point pulling it in and pretending it's anything 
more than a waste of space for architectures other than arm64 and x86. 
It's merely a historical artefact of the x86 DMA API implementation that 
when the IOMMU drivers were split out to form drivers/iommu they took 
some of their relevant arch code with them.

Robin.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
