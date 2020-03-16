Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B3E186F24
	for <lists.virtualization@lfdr.de>; Mon, 16 Mar 2020 16:50:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4592E87277;
	Mon, 16 Mar 2020 15:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gh_NGGzojTbe; Mon, 16 Mar 2020 15:50:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D0E6C872B9;
	Mon, 16 Mar 2020 15:50:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8EA1C013E;
	Mon, 16 Mar 2020 15:50:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8CB3C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 97BCF87277
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lYp_jtbvKG_4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:50:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C45B2872BC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:50:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y2so6381789wrn.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 08:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ppucAR3jBSlUx3f6FMEJLnESjyE6tqFd9bVOCG9Ch70=;
 b=KWi+mz5Ml7txmdoZr19aVQmfuq4pxYfgRps9r2wW5ZsBdqZUhieYBFFgGOjP2Y6bx4
 Wyhz0sJVzU+ttJVQaciTpiR1C0VRxuyTIVO+dc22nAk47TiATbV0DDmHWZKNHrvm2d4C
 vUaa0hW1YGFbvsd4Uq2C+TXdm+UshPrNCJCR7kDzhdknhAK2c/faq2qcpOcTCILD4e73
 SanxGSnN9MZ59DsdmAjiBTz1XxdiLtNTzfhIHxG2HnSi1v3DnTsQ2LGv/Q8k3NkWXNkz
 QoSGyKn9pcROOSXjXbika5mVnv89BwzwPk4bOrNqAP29KhbsRRP7ajNL8l0XJVmaY1q3
 +MfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ppucAR3jBSlUx3f6FMEJLnESjyE6tqFd9bVOCG9Ch70=;
 b=c4/7LO0Rrip6zI+VDRnnvS3kXhvmIUCHtEIojhc+U25gIV8+oKgWwDcALYtgW3cLG8
 8H14/j+GSUbQXsA/Hhv1ebg7od202Ug+MQqn7OD6TP93V1g2J9MP3XQq1puAsYcK99Mj
 jx6BP/LsDWSTrVZkTsUPIKK05JVFXOGYJQdc9VeXwEAuf2FD+ZPVUALWXsXfzTPCKBgk
 yI8IKIHb+5zThp/DqyQzOcrdBz6vnuqe54QaldwJMc8RtgxjePYu99Tyyc0HCoDtTIWI
 Iijrud44DQq1YWRDx+VoefBzBdBwrMLNbW6EXBvgh717FoI7N4sa1VA9OS7CBM2qZZt8
 Pl3w==
X-Gm-Message-State: ANhLgQ066DQs9iPHoloSrCNWW89AtpgUdQdX8znCIVYpWHsKlW6lnYR+
 Wavt/CN0kiP9QTBQvGUTxI4K1Q==
X-Google-Smtp-Source: ADFU+vvMLgpIudyWQDIKiFCwE2bd5t8QaZ3ZQI2eMwU4VsE9JIaD98F8TicbYAXHc+pSTvK+AYpoyA==
X-Received: by 2002:adf:dfc1:: with SMTP id q1mr43953wrn.62.1584373836280;
 Mon, 16 Mar 2020 08:50:36 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id p16sm147962wmg.22.2020.03.16.08.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:50:35 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:50:28 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 11/15] iommu/renesas: Use accessor functions for iommu
 private data
Message-ID: <20200316155028.GK304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-12-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-12-joro@8bytes.org>
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

On Tue, Mar 10, 2020 at 10:12:25AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  drivers/iommu/ipmmu-vmsa.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index ecb3f9464dd5..310cf09feea3 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -89,9 +89,7 @@ static struct ipmmu_vmsa_domain *to_vmsa_domain(struct iommu_domain *dom)
>  
>  static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
>  {
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -
> -	return fwspec ? fwspec->iommu_priv : NULL;
> +	return dev_iommu_priv_get(dev);

The removal of the fwspec NULL check was worrying me a little. Now any
user of to_ipmmu() directly dereferences dev->iommu->priv where they
previously tested first whether dev->fwspec was set. But I didn't find
anything that could go wrong, and the resulting code looks better.

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

>  }
>  
>  #define TLB_LOOP_TIMEOUT		100	/* 100us */
> @@ -727,14 +725,13 @@ static phys_addr_t ipmmu_iova_to_phys(struct iommu_domain *io_domain,
>  static int ipmmu_init_platform_device(struct device *dev,
>  				      struct of_phandle_args *args)
>  {
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	struct platform_device *ipmmu_pdev;
>  
>  	ipmmu_pdev = of_find_device_by_node(args->np);
>  	if (!ipmmu_pdev)
>  		return -ENODEV;
>  
> -	fwspec->iommu_priv = platform_get_drvdata(ipmmu_pdev);
> +	dev_iommu_priv_set(dev, platform_get_drvdata(ipmmu_pdev));
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
