Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB0D186EBB
	for <lists.virtualization@lfdr.de>; Mon, 16 Mar 2020 16:39:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EF49B86FB7;
	Mon, 16 Mar 2020 15:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lPdslaBvPz0v; Mon, 16 Mar 2020 15:39:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B630886F8D;
	Mon, 16 Mar 2020 15:39:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9705BC013E;
	Mon, 16 Mar 2020 15:39:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF836C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B574587F60
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:39:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FcTcU7UB8tf6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:39:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9B03687F86
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:39:26 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b2so15577405wrj.10
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q0yzkSCm1Xcsm6hOYYsbTqS4amhDbi797Ag8RmkjurU=;
 b=VjUfHswCT1UKNAujAPhK8VCtliVrWtYIYyppBsAtlnbFCrxaad4Uc2A5soRvyi8Lz/
 SqPfxSFRDIQCzDyvLFNz52fC+JJkBauYJCclNDsvmtzidrUQROIsVQV6zcwzj00LmPWd
 He65rfdf7A/Oc+IFkmPIIFP2thDMmrP7w+MUVZbhd7yiRPnRF5U7lNWsW24hYJVoJYeR
 8wHBvHBpk9d8ZmoBo1s6yLkrnEqIRgPQmKuMyjkvlD33ynh0mEfoeYi9XfpNu36ky7nN
 jntyaqHoGFn/okVfozaKqLoYwnG4+U3ZIqhxZ9ETSHCiCMC6Iw7WS6sjUwRs0+vfP+X7
 +bQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q0yzkSCm1Xcsm6hOYYsbTqS4amhDbi797Ag8RmkjurU=;
 b=p9XG5SgsJUTwW1BneL5xEUKmgZYJ6ZiftIyB73yvG7r4VJ7Zd007M0ZHW5ManUtNHM
 Mw5xJ6HtyuFI1SZtUjBhQM1DuBNgMk9TpYFwPZb1YwA7/GVhlP0VVp3JLg8Z78uE6q3e
 IgoGr8AvYj/0hvGp6tuPpLp/8Xs0Mdl1i1h2GBjYNsaK09rRQr5tWB/zP5YcIcwBulpW
 ZxyFH+xtHC24oH+Y2GzerV23lf802ksXZpdsnP2UJglIE0tDWiVUwJ6kBMV9x8rRelOk
 nmO9tMFMix9KA/qe/5eyi4mCoWz83fW32FtNkErjVoKDTM60GoiNLIGLkwhB03aYNRJY
 LJyg==
X-Gm-Message-State: ANhLgQ1Xfd2+TYU2T88dt4T9c3B1JZ6n7DHrZ9NuB2VnHRtLlqeOJRh5
 jLEg2JafDlj6DJIJ7wGnQVKrWA==
X-Google-Smtp-Source: ADFU+vs0mvRenL1g+U69U0qbNtFq1SVNLFNkkOGefFPc2C+th0hGKZ/JyHhYDuRn/eeS5wXEeUsB/Q==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr26159791wrk.101.1584373164974; 
 Mon, 16 Mar 2020 08:39:24 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id 19sm143446wma.3.2020.03.16.08.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:39:24 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:39:16 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 01/15] iommu: Define dev_iommu_fwspec_get() for
 !CONFIG_IOMMU_API
Message-ID: <20200316153916.GB304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-2-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-2-joro@8bytes.org>
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

On Tue, Mar 10, 2020 at 10:12:15AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> There are users outside of the IOMMU code that need to call that
> function. Define it for !CONFIG_IOMMU_API too so that compilation does
> not break.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

As a result drivers/gpu/host1x/hw/channel_hw.c and
drivers/gpu/drm/tegra/vic.c can lose their #ifdef CONFIG_IOMMU_API

> ---
>  include/linux/iommu.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index d1b5f4d98569..3c4ca041d7a2 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -1073,6 +1073,10 @@ static inline int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
>  	return -ENODEV;
>  }
>  
> +static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
> +{
> +	return NULL;
> +}
>  #endif /* CONFIG_IOMMU_API */
>  
>  #ifdef CONFIG_IOMMU_DEBUGFS
> -- 
> 2.17.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
