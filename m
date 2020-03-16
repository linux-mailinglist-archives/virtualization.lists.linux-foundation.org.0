Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A5515186F01
	for <lists.virtualization@lfdr.de>; Mon, 16 Mar 2020 16:48:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3295088445;
	Mon, 16 Mar 2020 15:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TdYq88+gSwB2; Mon, 16 Mar 2020 15:48:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EBC1388422;
	Mon, 16 Mar 2020 15:48:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2B55C013E;
	Mon, 16 Mar 2020 15:48:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B1EBC013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EE01887285
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l3EdvYruui4r
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:47:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3EE1E87257
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:47:59 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f11so5072267wrp.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J+yCX5u1YDN6eK0N92vhv3vwdN0qX/QOnRznwSw/NEU=;
 b=wqEM+8T/4h/xHj/JCPK+rRTCXxcVR4eDf7FRmVy6tL77x3zHH/AiX26KSVcpaAUPYM
 H2E3TxgVcsUZps0ZwbKrOGHGA1w+q7Tk9JZyHOG4r0miXlsNK9DAr6ASz77gWGMYoThi
 aqIcdck8zrW9cmOsVNIVfmvriv2jyBKV2gCHKWxDzNBhDSaeuNibLyNo1rN/KPESbvGx
 bYFXAMI7K3kXwTe2xy6IA/A4hJbQRhpt2ZZKRbDn2/H/Lo/rmmzCexG9w/kcno6ZiI77
 ppej5XGet0RlmPFvfqjzVDbUXtrDAc80RMkysk6JhzvWsm3/Qn/rhmBAkBM9JFQCl/h+
 nSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J+yCX5u1YDN6eK0N92vhv3vwdN0qX/QOnRznwSw/NEU=;
 b=Ryfk/IyBiWVLPaReGBheRybXAPEAwJoHzz9Y1+nGhPGH+JTJdmUopFs59NNRH8sJE6
 5Fg+EnV5paqC2Kx8CT3EdkRy24ItQbtQgmguDjWBJfwyr1YV9xRH0ue0n4HJzoxHiK03
 yMUoeDAMMOFh+XvAnVb/CHUglN//qI3YZ6uhotiDUE4hr0ApnFCwBzgZ/KYXviKoPfXc
 5dWQD/XpVFVei9eTrFowVOl8mqBvLDkUBt8Mk6hMe2jMsyuHZSiOXUtFf6xQ5RiLKcve
 IBcUIyiYP9H4wQhdDfOpGfir5Q2MYm5oyjuNIDZV3pSKdmO2893bC2YeIzD4nnQonPwy
 Z/Bg==
X-Gm-Message-State: ANhLgQ1hKyb9f2s568FsFV25bSqwLFnLQ7Hxo8m3W7Ck6KvmgrfSEpcT
 mnxhtpn2FKD3kqROLDbQcjiioA==
X-Google-Smtp-Source: ADFU+vu7BwV9+IRhzha1mvLv+qxjTZOswhDVu8mc2cK8kbLXKQAY/jWE86j0EqeFBPhJwYU3dCMzFg==
X-Received: by 2002:adf:f510:: with SMTP id q16mr6841064wro.43.1584373677809; 
 Mon, 16 Mar 2020 08:47:57 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id l7sm488506wrw.33.2020.03.16.08.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:47:57 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:47:49 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 08/15] iommu: Introduce accessors for iommu private data
Message-ID: <20200316154749.GI304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-9-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-9-joro@8bytes.org>
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

On Tue, Mar 10, 2020 at 10:12:22AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Add dev_iommu_priv_get/set() functions to access per-device iommu
> private data. This makes it easier to move the pointer to a different
> location.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  include/linux/iommu.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index f5edc21a644d..056900e75758 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -627,6 +627,16 @@ static inline void dev_iommu_fwspec_set(struct device *dev,
>  	dev->iommu->fwspec = fwspec;
>  }
>  
> +static inline void *dev_iommu_priv_get(struct device *dev)
> +{
> +	return dev->iommu->fwspec->iommu_priv;
> +}
> +
> +static inline void dev_iommu_priv_set(struct device *dev, void *priv)
> +{
> +	dev->iommu->fwspec->iommu_priv = priv;
> +}
> +
>  int iommu_probe_device(struct device *dev);
>  void iommu_release_device(struct device *dev);
>  
> -- 
> 2.17.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
