Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC13186EC4
	for <lists.virtualization@lfdr.de>; Mon, 16 Mar 2020 16:40:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9C1D9881A6;
	Mon, 16 Mar 2020 15:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1tIenRpgn7b3; Mon, 16 Mar 2020 15:40:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 17333881BC;
	Mon, 16 Mar 2020 15:40:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E17ECC013E;
	Mon, 16 Mar 2020 15:40:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C765C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6A7E088C8E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7PPBprcgvoX7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:40:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 93A5D88C80
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 15:40:13 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b2so15580659wrj.10
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vJQ7s9x85ia8HxlMYprwaZJGn4L6RP+BR7+jWVKPLTo=;
 b=w84O1QQJwU6wMTGEhyd3tdZmzyokkNQNgtvlgCbk7JrgRg0w2R3EtdUzes5TKo/XyE
 0GN9BzerCd+PBe2gdX+VVWalWV0GvUaZ1Hvpn02xC7Z6cQbZ9zUYoVR8SlrMkeTHa5pO
 ZNV7G4zwVtMQAtwNFVsP7G9rAugODJUvegfg+Joz2/pLSwTVFLeBdLC69Mm9fmsFaT0H
 4lQ985eQTWmn73BDP/WhhWDXVBZBfC45ZHQLQxe35G5uOfpUGYH7dFLUTw7I6qKsVqm6
 VCf79+8VBzgdX46YQ4mkH13lYwMdQrGC6Ai/EhOinV88dF/tVd63mOiTbTus//PTo1AD
 eHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vJQ7s9x85ia8HxlMYprwaZJGn4L6RP+BR7+jWVKPLTo=;
 b=MOjnryVKg5P1pUTYbqwL1QZPeVhMjJnl4xisQ73o9FZTS7gh8I/mZEwUXHPRyV5EM2
 /2LEQ7UGQmpKCUxrANTVdzRMVPJuxbZDAqkx99ZWL52uLBYXwloXsPhWDoUKkHBlfj8t
 z9jBKYMB0p37BzF4SU45lM9v2ucvNnTSlrdJeec14iPehNOZQwH+wZ6QS0e6D4Pe3ypy
 Wcr1uX850XvkM+zlrEMbwREmamYwk8DJoTZ1vheo2qJ2ayVSSwBqDZDsYunrJVvHANVQ
 KWBJCKIAs05yQxaCzM/KNfw6s+1o9Fl5IhZj+8GSDz0E6gFkgcFRGgvUbRelXfo/k+wC
 Veow==
X-Gm-Message-State: ANhLgQ13EH8kl+hWdkbzLKVD6HZICVnMLtGCyrZ79atJNm7msiBKe5hr
 OuFh5xWlo2XT8fg1RjCnu1OIzA==
X-Google-Smtp-Source: ADFU+vu5RlEmmjxd74oFX3RvJEdQFPOMmKqi/N4OkXyJVDSx1NxqeLTrLEHwet7QRQD2B1qytUrz8w==
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr29213545wrs.119.1584373212032; 
 Mon, 16 Mar 2020 08:40:12 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id u17sm393519wrm.43.2020.03.16.08.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:40:11 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:40:03 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 02/15] ACPI/IORT: Remove direct access of dev->iommu_fwspec
Message-ID: <20200316154003.GC304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-3-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-3-joro@8bytes.org>
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

On Tue, Mar 10, 2020 at 10:12:16AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Use the accessor functions instead of directly dereferencing
> dev->iommu_fwspec.
> 
> Tested-by: Hanjun Guo <guohanjun@huawei.com>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/acpi/arm64/iort.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index ed3d2d1a7ae9..7d04424189df 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -1015,6 +1015,7 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
>  		return ops;
>  
>  	if (dev_is_pci(dev)) {
> +		struct iommu_fwspec *fwspec;
>  		struct pci_bus *bus = to_pci_dev(dev)->bus;
>  		struct iort_pci_alias_info info = { .dev = dev };
>  
> @@ -1027,8 +1028,9 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
>  		err = pci_for_each_dma_alias(to_pci_dev(dev),
>  					     iort_pci_iommu_init, &info);
>  
> -		if (!err && iort_pci_rc_supports_ats(node))
> -			dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
> +		fwspec = dev_iommu_fwspec_get(dev);
> +		if (fwspec && iort_pci_rc_supports_ats(node))
> +			fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
>  	} else {
>  		int i = 0;
>  
> -- 
> 2.17.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
