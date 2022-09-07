Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 697245B0970
	for <lists.virtualization@lfdr.de>; Wed,  7 Sep 2022 18:00:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C71E60E00;
	Wed,  7 Sep 2022 16:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C71E60E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDj7gv8OX9Ll; Wed,  7 Sep 2022 16:00:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6604D60DFF;
	Wed,  7 Sep 2022 16:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6604D60DFF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 964C2C007C;
	Wed,  7 Sep 2022 16:00:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (unknown
 [IPv6:2605:bc80:3010:0:a800:ff:fe97:d076])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8ED98C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Sep 2022 16:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6940682B24
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Sep 2022 16:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6940682B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4tMVFSQ_yhL
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Sep 2022 16:00:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 274F682AEF
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 274F682AEF
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Sep 2022 16:00:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BA77106F;
 Wed,  7 Sep 2022 09:00:11 -0700 (PDT)
Received: from [10.57.15.197] (unknown [10.57.15.197])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC7603F71A;
 Wed,  7 Sep 2022 09:00:03 -0700 (PDT)
Message-ID: <51e9861b-38c0-0f22-385f-d4b57106d57b@arm.com>
Date: Wed, 7 Sep 2022 16:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] iommu/virtio: Fix compile error with viommu_capable()
Content-Language: en-GB
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux.dev
References: <20220907151154.21911-1-joro@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220907151154.21911-1-joro@8bytes.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On 2022-09-07 16:11, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> A recent fix introduced viommu_capable() but other changes
> from Robin change the function signature of the call-back it
> is used for.
> 
> When both changes are merged a compile error will happen
> because the function pointer types mismatch. Fix that by
> updating the viommu_capable() signature after the merge.

I thought I'd called out somewhere that this was going to be a conflict, 
but apparently not, sorry about that.

Acked-by: Robin Murphy <robin.murphy@arm.com>

Lemme spin a patch for the outstanding LKP warning on the bus series 
before that gets annoying too...

> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>   drivers/iommu/virtio-iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index da463db9f12a..1b12825e2df1 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -1005,7 +1005,7 @@ static int viommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>   	return iommu_fwspec_add_ids(dev, args->args, 1);
>   }
>   
> -static bool viommu_capable(enum iommu_cap cap)
> +static bool viommu_capable(struct device *dev, enum iommu_cap cap)
>   {
>   	switch (cap) {
>   	case IOMMU_CAP_CACHE_COHERENCY:
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
