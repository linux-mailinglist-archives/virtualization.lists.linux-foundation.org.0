Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB63186F18
	for <lists.virtualization@lfdr.de>; Mon, 16 Mar 2020 16:50:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 538E088259;
	Mon, 16 Mar 2020 15:50:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 50OBqFo+iMYD; Mon, 16 Mar 2020 15:50:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3151588447;
	Mon, 16 Mar 2020 15:50:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A061C013E;
	Mon, 16 Mar 2020 15:50:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AFCBC013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 794AD20472
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tVuTRDi0Oj-4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:49:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 6297F203D3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:49:58 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g62so18661182wme.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 08:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cOIEYtWNEzlYYthtD0spEjkukXqfmxlfoFYyEio2yD4=;
 b=bLP9tzXHgsnZOO+gQY30NTwMxHujM+PxDf2Pr2BsRs9UN3PNl67882FriKQhyCzQBr
 TQvoYRDzZIEuZjT7HWvj9ryRh0wafj4b7mSPg86iUfXDu3MNCvfAIbQ4I6SS/cLilfBh
 zMVdnQIcxINkndSo9MyT7JC/g4ws4131+16aS9y6jaXhUaO7tb8k1sGg+cmElZUSjHvf
 nKD3AWMMSBYWgumDkjJNP77sHEVHIJpLXozOmkpGlN6fzZlvjPS6WDKFGpj2t6vQjwFm
 6iyRvLJuu8HH4z1PQSOJsYFBsODpIu2hXolpCRed+/OXwkJGe0xQdQ4Mvpx9JFxwkUU9
 wcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cOIEYtWNEzlYYthtD0spEjkukXqfmxlfoFYyEio2yD4=;
 b=mA7UE2al0WTK3b9uWDlIAnFiya15hAg9gu8comYuJTh2bPGrtqV1nPPzqXo5WMYjgN
 Ke/50AM+6INa+QHRJPS+9hb0ozuyo/W481Hu+0h5gfZo7holgz+eD0MHbeg5xJrojWkP
 ZnEoFxYHUHbB4NUIV13Sa3j3Oo3aHnZ6E3ZqpyVVK5yAY5zBZsMiZy43+5pWyO4Gnw3P
 RnqacRKgkG5cnVDyjC4PmuGM1fhqaYBYUQ5U4kR59R9u1iRX/lXHe7mkpsn21qfkSfy5
 syYFxxDC4/flXlDt8+Odh5aHc1xIrT4U4edFxAIEBYUhaftd8F8Ket/u4JQcttekVi+m
 liIg==
X-Gm-Message-State: ANhLgQ085VlB8nrwLKAKk94ACYbCZmuYiyFkmfe1r9YwfRXDr++eirH7
 WX+TwZWb4O+h7k4+DDf8IPY9LQ==
X-Google-Smtp-Source: ADFU+vv4N7xQNm1wFNrIZmN2Kg+Ua4DIBj8t6C6sgaFA18dYvUkMu368tWpVIaA4w1ORNN6r5eo5hg==
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr28123545wmc.67.1584373796917; 
 Mon, 16 Mar 2020 08:49:56 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id 9sm127395wmx.32.2020.03.16.08.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:49:56 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:49:48 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 09/15] iommu/arm-smmu-v3: Use accessor functions for
 iommu private data
Message-ID: <20200316154948.GJ304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-10-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-10-joro@8bytes.org>
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

On Tue, Mar 10, 2020 at 10:12:23AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions in the code.
> 
> Tested-by: Hanjun Guo <guohanjun@huawei.com>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/iommu/arm-smmu-v3.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index aa3ac2a03807..2b68498dfb66 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -2659,7 +2659,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  	if (!fwspec)
>  		return -ENOENT;
>  
> -	master = fwspec->iommu_priv;
> +	master = dev_iommu_priv_get(dev);
>  	smmu = master->smmu;
>  
>  	arm_smmu_detach_dev(master);
> @@ -2795,7 +2795,7 @@ static int arm_smmu_add_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &arm_smmu_ops)
>  		return -ENODEV;
>  
> -	if (WARN_ON_ONCE(fwspec->iommu_priv))
> +	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
>  		return -EBUSY;
>  
>  	smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
> @@ -2810,7 +2810,7 @@ static int arm_smmu_add_device(struct device *dev)
>  	master->smmu = smmu;
>  	master->sids = fwspec->ids;
>  	master->num_sids = fwspec->num_ids;
> -	fwspec->iommu_priv = master;
> +	dev_iommu_priv_set(dev, master);
>  
>  	/* Check the SIDs are in range of the SMMU and our stream table */
>  	for (i = 0; i < master->num_sids; i++) {
> @@ -2852,7 +2852,7 @@ static int arm_smmu_add_device(struct device *dev)
>  	iommu_device_unlink(&smmu->iommu, dev);
>  err_free_master:
>  	kfree(master);
> -	fwspec->iommu_priv = NULL;
> +	dev_iommu_priv_set(dev, NULL);
>  	return ret;
>  }
>  
> @@ -2865,7 +2865,7 @@ static void arm_smmu_remove_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &arm_smmu_ops)
>  		return;
>  
> -	master = fwspec->iommu_priv;
> +	master = dev_iommu_priv_get(dev);
>  	smmu = master->smmu;
>  	arm_smmu_detach_dev(master);
>  	iommu_group_remove_device(dev);
> -- 
> 2.17.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
