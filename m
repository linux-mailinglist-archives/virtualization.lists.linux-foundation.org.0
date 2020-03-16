Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7973E186ECF
	for <lists.virtualization@lfdr.de>; Mon, 16 Mar 2020 16:42:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA29787F60;
	Mon, 16 Mar 2020 15:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhF5yn4aiMpO; Mon, 16 Mar 2020 15:42:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C85E2881F3;
	Mon, 16 Mar 2020 15:42:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7E27C013E;
	Mon, 16 Mar 2020 15:42:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99BF7C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 90E1087141
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tLWXxMhSI-jY
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:42:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CBA698713E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:42:18 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s1so100538wrv.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 08:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EuH2JuinWmp99M5kgpRBVbGMWPMpSteTL2l8ALHXOxA=;
 b=SuBjR7SXVaKqCALkd1H8UtvNwExNZJ6zJgrMM6mOmR/V8duV2z/Ny/rgwl/ICWYmHv
 RWBK+M3PyiJlb3+IMItQHsDQF5jSLhvuAHwNcv6LMVHk4wOfYJKCJcuzotqrz3dAGYH1
 ZoMfxYPhj1aGisNVytbbz16FGd19F/GLWWKqmyz5QVUWCH852OZkHrnPPIWPrqC4neyS
 a7v3wobNSSlJVCWjnzCdEU/vJKwAqNo9QlJDdZZzhe6JJt9HI/Adz/aIlbUVRlVc5+r/
 Wh3K+T1U8mRgzEN73lsQyDrC/jgt58bTBPttxWkvcuF/uHNDyFjl6FzCmQvD6Dy4PO5f
 8Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EuH2JuinWmp99M5kgpRBVbGMWPMpSteTL2l8ALHXOxA=;
 b=uQSNz3v8aIYQqDHm+1dq4qFJ6KBtcPuf/sKOS4sUDnhWjklgG+LKizyTNB9kiTZrqx
 +2ct8Mzm6rCWEMcdsW12rL/sKlxPMwJekUSgw/q+I0z/I004AICd2jRvQwyqf8Evx38g
 +7+gkYjyshPyZlApx7k7RH5zIYdRfADiqNjte92NHm6GgVPHiZTMMCJrFw/rY+VnMoY5
 5UhrbZ5kOIYTTjminch/RxfsWaz+75eOWG+aF70PaY9GnFfYf0L5wMxuvZcY41Z48D1q
 y16l4x/WGgYzGCTalM0La2dnuJPcAOhOr/95OZE4IM8SxFzBKBYEoexE0kRrh58uR6Xr
 rYQQ==
X-Gm-Message-State: ANhLgQ25V/IcoQ77YAn9t9XBQGoNNwJVKlRrTjjXXiU/9WAah6WEoMiU
 qrjBAEkJmIlmIleZ89peYv2Dmg==
X-Google-Smtp-Source: ADFU+vtvdsyytNA9HXn2kU8Gc/Wj/vUyTOW35SEjh5aHAlAPKupONXAmkHYxA+n8rH6jwZStjuAuGg==
X-Received: by 2002:adf:9e8b:: with SMTP id a11mr9088wrf.32.1584373337353;
 Mon, 16 Mar 2020 08:42:17 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id y80sm85174wmc.45.2020.03.16.08.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:42:16 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:42:09 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 03/15] drm/msm/mdp5: Remove direct access of
 dev->iommu_fwspec
Message-ID: <20200316154209.GD304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-4-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-4-joro@8bytes.org>
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

On Tue, Mar 10, 2020 at 10:12:17AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Use the accessor functions instead of directly dereferencing
> dev->iommu_fwspec.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index e43ecd4be10a..1252e1d76340 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -725,7 +725,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>  
>  	if (config->platform.iommu) {
>  		iommu_dev = &pdev->dev;
> -		if (!iommu_dev->iommu_fwspec)
> +		if (!dev_iommu_fwspec_get(iommu_dev))
>  			iommu_dev = iommu_dev->parent;
>  
>  		aspace = msm_gem_address_space_create(iommu_dev,
> -- 
> 2.17.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
