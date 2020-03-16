Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FC6186ED7
	for <lists.virtualization@lfdr.de>; Mon, 16 Mar 2020 16:43:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CB7BB88D94;
	Mon, 16 Mar 2020 15:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oyxBLbCLeUli; Mon, 16 Mar 2020 15:43:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 372B788D67;
	Mon, 16 Mar 2020 15:43:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24BA5C013E;
	Mon, 16 Mar 2020 15:43:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BAC6BC013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A57E088D67
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZWis2SdVQ79Q
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:43:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E60AC88D24
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:43:08 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t2so11772800wrx.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DdvuxQV8MUJ3DF0txatG/PoeJXobhfl8uAplHUnRQXw=;
 b=gEq8/ZMBwfLkBD9tGRHGjZfTd20HP1xHo/lJCYGOxGAYI7JgVG9jMowKPQSyqmQoJH
 Q9ZbaY7SOKJp8K4eyLHZOG5BXM7bIz0LDg0iLZ0C7XwnSZgO4Q7ql/grJgyu+f0XKKiZ
 8hj2Hl5fh1i6wP+q7uq/YnEi3K13FYNSMiMBiMDb9rTjtVKuKwTX2bq22JmdTliOTXP2
 K+5zCU0/1lWFBSvTXbDx9fEkSA/zS7i5vKY3n2XrAijwrJW7uI1+D+Ab8wO+LOpxCjFg
 cLiZ+CoMaM/7tmWRw/RxFAOt/xBIBCD8p1Ekq22vHH0ospnbZ5362hTq6dFil73T5VxH
 cAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DdvuxQV8MUJ3DF0txatG/PoeJXobhfl8uAplHUnRQXw=;
 b=nUDHSAcNcpIA8H9aSGw48p+b+ZafYownhktF5y3ct9yzMb8Y5IJG5u0TRlSsVWF1Eg
 duztn99N2rhg9D5VTxvlPE5SWIXXSfVcxgtwW2tdwUANNY/RPqDEOlX6TAY9GlJkUyKA
 L/FvLxe+6ZLz9MfdauJGLPsFG8XXWavEn2ZY24gNa0gWtDFhZc69OsqpBZ81YGrxVnCk
 nVck3YVsqL8VS22cIZcICXb/FbFMcdLI6kTtL7AnSLRyd/CXslwkBRxtf1+xaTOzHTdr
 3MSD/qhYBkHkjTRjOZT5YDgIgK/KtL8sbFAjiUCnhOv7bWai13QdE+gV6wt9dqEzVXTi
 vmUQ==
X-Gm-Message-State: ANhLgQ2R2Ye2mUSE/QPuvukaXme0jsSSILgmFhbGu39dX+Grj/4/3yaE
 cA27H+iyUtW3y2tFGwcz+pcQrA==
X-Google-Smtp-Source: ADFU+vukGMBSU+PIquYB6P7V4T5BWKneai54XgateQmlyq1EDcQ3i3rP1F+AK6w2nNtuc0TA4HUjIw==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr35844297wrr.125.1584373387505; 
 Mon, 16 Mar 2020 08:43:07 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id h13sm433117wrv.39.2020.03.16.08.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:43:07 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:42:59 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 04/15] iommu/tegra-gart: Remove direct access of
 dev->iommu_fwspec
Message-ID: <20200316154259.GE304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-5-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-5-joro@8bytes.org>
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

On Tue, Mar 10, 2020 at 10:12:18AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Use the accessor functions instead of directly dereferencing
> dev->iommu_fwspec.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/iommu/tegra-gart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
> index 3fb7ba72507d..db6559e8336f 100644
> --- a/drivers/iommu/tegra-gart.c
> +++ b/drivers/iommu/tegra-gart.c
> @@ -247,7 +247,7 @@ static int gart_iommu_add_device(struct device *dev)
>  {
>  	struct iommu_group *group;
>  
> -	if (!dev->iommu_fwspec)
> +	if (!dev_iommu_fwspec_get(dev))
>  		return -ENODEV;
>  
>  	group = iommu_group_get_for_dev(dev);
> -- 
> 2.17.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
