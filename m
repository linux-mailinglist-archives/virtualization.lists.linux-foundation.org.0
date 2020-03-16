Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6344A186F58
	for <lists.virtualization@lfdr.de>; Mon, 16 Mar 2020 16:52:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E700187285;
	Mon, 16 Mar 2020 15:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aD5bkPoZ8Tdh; Mon, 16 Mar 2020 15:52:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 716DD872BC;
	Mon, 16 Mar 2020 15:52:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 528F6C013E;
	Mon, 16 Mar 2020 15:52:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3BC9C1D7C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B04188845F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id on77EEpAGZJi
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:52:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C30B58844B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:52:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s1so143479wrv.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CQWUEVlXfznSczAKyGpDi3T2t4zubClSxzSzuBgyOmY=;
 b=yl6bstE+aSegQ4PSIZwfpkI4xv5zEpFCHJTeJOmkwQSJ+I34mLp8AxYTWZ9rJT3sc2
 lfVn74R8N/A5/RlriKIwFzgnhIdRpYphZB/RGS2V7TiOu9jBnvyS/vVHkhpcG/UCkclI
 /Xe8pirR3stVSJMCZatixqgD5qeqsOrizxVPTp5NmPJGHiiNFTlr2SrOO2kgOC4/0W9m
 TaePqXQ0F0j8GjfwG6eC/pF625lANh0WVdHPpEVzOMwvBPZshj8wKu9LXxVj1/SPB9LL
 CEn13SHypRSkWd4ThtiGgPM4UZhcVfHP1IHQBtjQSqNt8bUgTV5XgO5/lnNRElqlP+4y
 Bdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CQWUEVlXfznSczAKyGpDi3T2t4zubClSxzSzuBgyOmY=;
 b=T7XgGcRkoV83JhBdB2BWN8hPuGSPvOp0TBgp8lYkJZNNZ9e7BdhpHq3am20zSJGm/b
 EFdjnGZWPU8sXtG80UlelOVHkR3/+UXVMkjlxBF1RY1DFZzCfRNGVrd7pm/c5nHjL9js
 ynuryrKtgqzKXgZv/KFS/kpj/SUJmGtlej01cRd1rUWJ6ho15F9XG1G5hqjnPvIKT0MB
 zwqPfaZmtjWrBjbsUDL3cL/tyUun+rnfRVIDEwtVCF0BnYu+bTvFwWt7qUps5gYnP8kV
 Z3i/2vGiERNVj02RRfTPRjD9BEr2G/141ZlxA3fmG2l78xx2FjowkAlNCH3XUJZrNfuD
 4rfg==
X-Gm-Message-State: ANhLgQ0F1hkSD+i0FajomDbKt/IpEvCL/KOICTXcN5Ink3qV76oMNt9f
 wxOFeu/+yc2X01yPtMptYN7zuA==
X-Google-Smtp-Source: ADFU+vttr8+4jXiTPQnlMs6N4KDj9oq3qIoO+BGp44KMN8sfSjRCTINbImPpFYK6LbM8TzaWqB/nSA==
X-Received: by 2002:adf:f289:: with SMTP id k9mr37838wro.220.1584373951194;
 Mon, 16 Mar 2020 08:52:31 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id t1sm509263wrq.36.2020.03.16.08.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:52:30 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:52:23 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 13/15] iommu/qcom: Use accessor functions for iommu
 private data
Message-ID: <20200316155223.GM304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-14-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-14-joro@8bytes.org>
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

On Tue, Mar 10, 2020 at 10:12:27AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  drivers/iommu/qcom_iommu.c | 61 ++++++++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 4328da0b0a9f..80147f82d427 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -74,16 +74,19 @@ static struct qcom_iommu_domain *to_qcom_iommu_domain(struct iommu_domain *dom)
>  
>  static const struct iommu_ops qcom_iommu_ops;
>  
> -static struct qcom_iommu_dev * to_iommu(struct iommu_fwspec *fwspec)
> +static struct qcom_iommu_dev * to_iommu(struct device *dev)
>  {
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +
>  	if (!fwspec || fwspec->ops != &qcom_iommu_ops)
>  		return NULL;

Following other drivers, I think this test could move to add_device() (and
remove_device()?), but this is probably good enough for now.

> -	return fwspec->iommu_priv;
> +
> +	return dev_iommu_priv_get(dev);
>  }
[...]
>  static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>  {
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	struct qcom_iommu_dev *qcom_iommu;
>  	struct platform_device *iommu_pdev;
>  	unsigned asid = args->args[0];
> @@ -583,14 +594,14 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>  	    WARN_ON(asid > qcom_iommu->num_ctxs))
>  		return -EINVAL;
>  
> -	if (!fwspec->iommu_priv) {
> -		fwspec->iommu_priv = qcom_iommu;
> +	if (dev_iommu_priv_get(dev)) {

Should be:

	if (!dev_iommu_priv_set(dev))

Thanks,
Jean

> +		dev_iommu_priv_set(dev, qcom_iommu);
>  	} else {
>  		/* make sure devices iommus dt node isn't referring to
>  		 * multiple different iommu devices.  Multiple context
>  		 * banks are ok, but multiple devices are not:
>  		 */
> -		if (WARN_ON(qcom_iommu != fwspec->iommu_priv))
> +		if (WARN_ON(qcom_iommu != dev_iommu_priv_get(dev)))
>  			return -EINVAL;
>  	}
>  
> -- 
> 2.17.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
