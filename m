Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FB81871AA
	for <lists.virtualization@lfdr.de>; Mon, 16 Mar 2020 18:55:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 33FE088BB5;
	Mon, 16 Mar 2020 17:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RNwuE-rc33QG; Mon, 16 Mar 2020 17:55:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68D9388609;
	Mon, 16 Mar 2020 17:55:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EAC0C1D88;
	Mon, 16 Mar 2020 17:55:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 978A3C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 17:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8F255884AB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 17:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D+HWUe2liE2e
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 17:55:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B814A884A8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 17:55:25 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f3so15415391wrw.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 10:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KZCpP6b3rcDrFb5nL77Llc1TqP6zJQRoyalcv/Uk/U4=;
 b=Y/R6qyTPo9TH/wBiHH7KTVuPGU3xiYNdjGryws2oZjJT4EdE1Ukovm/qw0EUnU24gU
 S55BE2BmG4HOCtOwEOXGyy7AXs7ku0tleXQgOw9PFvVcXjBuY7X76ik6J67WXOAkluwY
 N8AUX6GldQgLMC2mjOJDUYeeFD61OI8upFJvU0u4LMkkLTWuKAqoRyeRXtYobTQC3CM1
 DhcjEhjnIN+SU8WqnWGyVuamv6HlAzsykRt5ewg6nLfQTUffQQtYpl8UmUJbnXxtaH9t
 SxVsykhhy/G0nCc53h3pcXuufWOU2IhPvnEjecW1aIFH4e1Rdj9IpsbjZMLyQjBC3MnB
 v6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KZCpP6b3rcDrFb5nL77Llc1TqP6zJQRoyalcv/Uk/U4=;
 b=LH83ObJ9ocCe8wK/oUc8ESeoRMCj8NwhQ5klNzA1bncqUVyM8gnorItLo6JtcjT9ww
 /8mMSFqMLD6T7ARomO7l21+ntuQYGcykxOI5N8ZP3/M0tDaaMc+Y7/c9xB292Vfj7Uow
 RL6gaYIqLkdhuxRiLTOXdCluwMwPMQIbwBtZX/DDqi29Rgf5aa+gB1oJ80oRJHBmvlNT
 l2QTNXtUpWri4bcdpqFBN3gyITC8LN6ccctSdHEIXYO8RDJzPrmYjGJtF+MIuVT2T/i+
 GPkcvyTSiG08fRqJcDoVIPQRCKcpa1HZ2gd1myD103JmM2ysw5HCIpLb+aQO5lpBL2j7
 4bRA==
X-Gm-Message-State: ANhLgQ3J2dNpZA0QsXY67dMdc7BB1pTtOMdFVawYwb1DyxXjLsSvcNcM
 +qTqJtc//DZUTXAztSyYwVaewg==
X-Google-Smtp-Source: ADFU+vuHWkRqgMn4prXCXTnSNDBAjWBUzoa8syi0tqbAh8eRnR4X3rD/HVE1PtCHryXLNIoYPL6aMQ==
X-Received: by 2002:adf:f14a:: with SMTP id y10mr485041wro.325.1584381324158; 
 Mon, 16 Mar 2020 10:55:24 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id n10sm964333wro.14.2020.03.16.10.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 10:55:23 -0700 (PDT)
Date: Mon, 16 Mar 2020 18:55:15 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 10/15] iommu/arm-smmu: Use accessor functions for iommu
 private data
Message-ID: <20200316175515.GP304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-11-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-11-joro@8bytes.org>
Cc: Rob Clark <robdclark@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Hanjun Guo <guohanjun@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
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

On Tue, Mar 10, 2020 at 10:12:24AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions and simplify the code
> where possible with this change.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
[...]
> @@ -1467,7 +1470,7 @@ static void arm_smmu_remove_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &arm_smmu_ops)
>  		return;
>  
> -	cfg  = fwspec->iommu_priv;
> +	cfg  = dev_iommu_priv_get(dev);
>  	smmu = cfg->smmu;
>  
>  	ret = arm_smmu_rpm_get(smmu);
> @@ -1475,23 +1478,22 @@ static void arm_smmu_remove_device(struct device *dev)
>  		return;
>  
>  	iommu_device_unlink(&smmu->iommu, dev);
> -	arm_smmu_master_free_smes(fwspec);
> +	arm_smmu_master_free_smes(dev);
>  
>  	arm_smmu_rpm_put(smmu);
>  
>  	iommu_group_remove_device(dev);
> -	kfree(fwspec->iommu_priv);
>  	iommu_fwspec_free(dev);
> +	kfree(cfg);

nit: cfg is allocated after fwspec so it might be cleaner to free cfg
before fwspec.

But more importantly, should we clear the private data here and in the
other drivers, by calling dev_iommu_priv_set(dev, NULL) from
remove_device()?  We are leaving stale pointers in dev->iommu and I think
some of the drivers could end up reusing them.

Thanks,
Jean

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
