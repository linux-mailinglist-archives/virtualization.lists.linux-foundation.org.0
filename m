Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C612D186F38
	for <lists.virtualization@lfdr.de>; Mon, 16 Mar 2020 16:51:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6EE2F88448;
	Mon, 16 Mar 2020 15:51:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZhJRhgvfg0q7; Mon, 16 Mar 2020 15:51:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9DD1D88447;
	Mon, 16 Mar 2020 15:51:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78B1FC013E;
	Mon, 16 Mar 2020 15:51:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14F42C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0311788DA6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:51:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lwt7kv+2KaWO
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:51:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0B8F788D97
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:51:26 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 25so18245740wmk.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KkyluvbCo1smPziuTMI1rpctD2ZygqnkeyljtuoXeEw=;
 b=Ql9YUBVPAc49FI42xu2eB/uVJuxhsY9YoQnZ0XtFjXM6HeXXOBU835hweTKfAEM9zr
 ot/OVovpdvovqb2hWye7+Dj/qnKTGEkRPtuI0NO5twoZx0/MwgjkoH50sjShfw/4xGDj
 q1qnW1Z1JfMLv111SRHS2M4QOxcIoR8jkUpSGfneogiiGz5Pr0uTllS+/TIx635iELsG
 u6YJoIDM7d3hVfVFSBh5x6kT2cHR+EaZwyTgm6kbxv7LY9h4Q+f0ytoQ41X42SgS4HLo
 Rq7GsvA0EhReqsXX/ReWo+oazsMqbZTNhtJUGHfm5pRqt+vWwkp5C2wusM4Pinn9EBm/
 MsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KkyluvbCo1smPziuTMI1rpctD2ZygqnkeyljtuoXeEw=;
 b=O5zQf91x2XtEU7kk5s62KcIamnAM0btynM4EULJprmD7+010fP6eEv8aWN9b2VnnCx
 9IlW63hBIYWxhVtncUI5pPrQ996JXlZAIgL5NTfv/f6vdcuVMQ8SIMRJIA23oui81oFI
 oIC1H+DzjsiTBq1XAef1kxUxCDJSk86bgcMwSHTrnu8ITrgzyaQQKmzUCoWO9r9/lwlk
 WuktbXhmZtn9y3i1XUtzM8ouxtsjL4J7Fy6BNfzPUoRe2Z0b0asCB1h0F1kshmzTejRN
 LwneOEkLzlHvvgOaddOuYk4plzYQxUSORzoJPNgY5s0UxQwHiYngtQAdZ2bX6Zxa8Llp
 yNPA==
X-Gm-Message-State: ANhLgQ2yLHFdC3hQU96ALLs7N/MvQNlpW73DAJU/RBGYbtbRCEssTfvA
 QyiFuH2Iq+cDZOAcsi6uSmqPFw==
X-Google-Smtp-Source: ADFU+vsOzPwdH8tCDCurHNefcxT+FZBJmWj2HiUatr8Ym5ck83x1h29ClX9491yXix2EVw/gHBFPRA==
X-Received: by 2002:a1c:ab04:: with SMTP id u4mr28315891wme.88.1584373884542; 
 Mon, 16 Mar 2020 08:51:24 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id s22sm143823wmc.16.2020.03.16.08.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:51:23 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:51:16 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 12/15] iommu/mediatek: Use accessor functions for iommu
 private data
Message-ID: <20200316155116.GL304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-13-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-13-joro@8bytes.org>
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

On Tue, Mar 10, 2020 at 10:12:26AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/iommu/mtk_iommu.c    | 13 ++++++-------
>  drivers/iommu/mtk_iommu_v1.c | 14 +++++++-------
>  2 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 95945f467c03..5f4d6df59cf6 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -358,8 +358,8 @@ static void mtk_iommu_domain_free(struct iommu_domain *domain)
>  static int mtk_iommu_attach_device(struct iommu_domain *domain,
>  				   struct device *dev)
>  {
> +	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
>  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> -	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
>  
>  	if (!data)
>  		return -ENODEV;
> @@ -378,7 +378,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
>  static void mtk_iommu_detach_device(struct iommu_domain *domain,
>  				    struct device *dev)
>  {
> -	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
> +	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
>  
>  	if (!data)
>  		return;
> @@ -450,7 +450,7 @@ static int mtk_iommu_add_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
>  		return -ENODEV; /* Not a iommu client device */
>  
> -	data = fwspec->iommu_priv;
> +	data = dev_iommu_priv_get(dev);
>  	iommu_device_link(&data->iommu, dev);
>  
>  	group = iommu_group_get_for_dev(dev);
> @@ -469,7 +469,7 @@ static void mtk_iommu_remove_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
>  		return;
>  
> -	data = fwspec->iommu_priv;
> +	data = dev_iommu_priv_get(dev);
>  	iommu_device_unlink(&data->iommu, dev);
>  
>  	iommu_group_remove_device(dev);
> @@ -496,7 +496,6 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
>  
>  static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>  {
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	struct platform_device *m4updev;
>  
>  	if (args->args_count != 1) {
> @@ -505,13 +504,13 @@ static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>  		return -EINVAL;
>  	}
>  
> -	if (!fwspec->iommu_priv) {
> +	if (!dev_iommu_priv_get(dev)) {
>  		/* Get the m4u device */
>  		m4updev = of_find_device_by_node(args->np);
>  		if (WARN_ON(!m4updev))
>  			return -EINVAL;
>  
> -		fwspec->iommu_priv = platform_get_drvdata(m4updev);
> +		dev_iommu_priv_set(dev, platform_get_drvdata(m4updev));
>  	}
>  
>  	return iommu_fwspec_add_ids(dev, args->args, 1);
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index e93b94ecac45..9930ac7413cc 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -263,8 +263,8 @@ static void mtk_iommu_domain_free(struct iommu_domain *domain)
>  static int mtk_iommu_attach_device(struct iommu_domain *domain,
>  				   struct device *dev)
>  {
> +	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
>  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> -	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
>  	int ret;
>  
>  	if (!data)
> @@ -286,7 +286,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
>  static void mtk_iommu_detach_device(struct iommu_domain *domain,
>  				    struct device *dev)
>  {
> -	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
> +	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
>  
>  	if (!data)
>  		return;
> @@ -387,20 +387,20 @@ static int mtk_iommu_create_mapping(struct device *dev,
>  		return -EINVAL;
>  	}
>  
> -	if (!fwspec->iommu_priv) {
> +	if (!dev_iommu_priv_get(dev)) {
>  		/* Get the m4u device */
>  		m4updev = of_find_device_by_node(args->np);
>  		if (WARN_ON(!m4updev))
>  			return -EINVAL;
>  
> -		fwspec->iommu_priv = platform_get_drvdata(m4updev);
> +		dev_iommu_priv_set(dev, platform_get_drvdata(m4updev));
>  	}
>  
>  	ret = iommu_fwspec_add_ids(dev, args->args, 1);
>  	if (ret)
>  		return ret;
>  
> -	data = fwspec->iommu_priv;
> +	data = dev_iommu_priv_get(dev);
>  	m4udev = data->dev;
>  	mtk_mapping = m4udev->archdata.iommu;
>  	if (!mtk_mapping) {
> @@ -459,7 +459,7 @@ static int mtk_iommu_add_device(struct device *dev)
>  	if (err)
>  		return err;
>  
> -	data = fwspec->iommu_priv;
> +	data = dev_iommu_priv_get(dev)
>  	mtk_mapping = data->dev->archdata.iommu;
>  	err = arm_iommu_attach_device(dev, mtk_mapping);
>  	if (err) {
> @@ -478,7 +478,7 @@ static void mtk_iommu_remove_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
>  		return;
>  
> -	data = fwspec->iommu_priv;
> +	data = dev_iommu_priv_get(dev)
>  	iommu_device_unlink(&data->iommu, dev);
>  
>  	iommu_group_remove_device(dev);
> -- 
> 2.17.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
