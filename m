Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFE3186EFC
	for <lists.virtualization@lfdr.de>; Mon, 16 Mar 2020 16:47:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 068D2888DC;
	Mon, 16 Mar 2020 15:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRtzJ7FKWwCx; Mon, 16 Mar 2020 15:47:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 90C78888B6;
	Mon, 16 Mar 2020 15:47:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B37FC013E;
	Mon, 16 Mar 2020 15:47:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56575C1D7C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 423A120472
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eR2gJwhWB50u
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:47:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by silver.osuosl.org (Postfix) with ESMTPS id B99C22155F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:47:31 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a132so18219007wme.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 08:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3QMtJyHMdj2d3NlJHtXdRPjzJsxucKLnz+qn2QRFOx0=;
 b=oh5r2acFcKirM1Z60N97UiPELuL4YbxB+3thPoKh00c2cXA7zBnMrcg9MocIgrcoCL
 U05LP/VCBy/GD0AL9aNluQa4QCsCZCtQYprWO7EIyPc9RAWGZvVCsle+UbSRXH9Gkm/0
 KZJWytpT98u58L3kNWY/rNnStqJF3aq2+Ox1CNzi2Q+F03eOgvegXRb9TavYC+TyVBSt
 M/gQ9g1WL/OSC5hfVtxCTgHT3DFmQq6BKeS3Jv0oNCkzSq7i3fPAW/GtZOnFeBw5AIHa
 v49KMqeOlQX7Wl2sfbU7w4LmNqG13XIFmu88aXgH/xPUBruIR9N3LVcA+UxWR9+MtlzO
 N1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3QMtJyHMdj2d3NlJHtXdRPjzJsxucKLnz+qn2QRFOx0=;
 b=IYAxOqlcvAmOoiYkDRvqEycqNAqUw9y/3CR2jquXRxPZGYdCY/g92qZKJwZTvc292e
 wzyBkj27LCcow3h2HLY6tHA+335TF6eLqkpAlLyWYolPfv1C6o74tQF5FYVs1xEWKFzH
 xVciVdQQOw7nsMnX7UT1p6cujPiZTdhlZKNwsJ1FRlxEzyu09YLXrovGsXMJldlHg9lK
 g8qRkDx0N+qYyygrfUc1SQ6d4W7DmXZt4kFdBmJ6kVPS/oEClzNjTjNRwuOvtEIDU6gH
 PaCl+9MJ2YciuRov0mtXelYNJX/lywE3+hVTMedE2bZyqDAHFJgEuh5vOvGVP+N7u/e/
 V+6g==
X-Gm-Message-State: ANhLgQ0mQ0GNWavaeZ9TiaEyRQnXqQAY3GXcrvx3jwspiWrT4F9GsG9R
 yVe0t6ojjiEL6vCkM4p31/mKSTcoJFk=
X-Google-Smtp-Source: ADFU+vubP0XZlLxNsPBJjbPqoRh9Fj10FSwYOvdazGAIlTLv21y5ghlreopBsVqOhrzi4VW31nde8w==
X-Received: by 2002:a7b:cd97:: with SMTP id y23mr28196696wmj.161.1584373650045; 
 Mon, 16 Mar 2020 08:47:30 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id z4sm460593wrr.6.2020.03.16.08.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:47:29 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:47:22 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 07/15] iommu/arm-smmu: Fix uninitilized variable warning
Message-ID: <20200316154722.GH304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-8-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-8-joro@8bytes.org>
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

On Tue, Mar 10, 2020 at 10:12:21AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Some unrelated changes in the iommu code caused a new warning to
> appear in the arm-smmu driver:
> 
>   CC      drivers/iommu/arm-smmu.o
> drivers/iommu/arm-smmu.c: In function 'arm_smmu_add_device':
> drivers/iommu/arm-smmu.c:1441:2: warning: 'smmu' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   arm_smmu_rpm_put(smmu);
>   ^~~~~~~~~~~~~~~~~~~~~~
> 
> The warning is a false positive, but initialize the variable to NULL
> to get rid of it.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/iommu/arm-smmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 16c4b87af42b..980aae73b45b 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1383,7 +1383,7 @@ struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
>  
>  static int arm_smmu_add_device(struct device *dev)
>  {
> -	struct arm_smmu_device *smmu;
> +	struct arm_smmu_device *smmu = NULL;
>  	struct arm_smmu_master_cfg *cfg;
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	int i, ret;
> -- 
> 2.17.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
