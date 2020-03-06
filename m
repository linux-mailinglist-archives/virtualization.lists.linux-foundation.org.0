Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BE517B9E1
	for <lists.virtualization@lfdr.de>; Fri,  6 Mar 2020 11:10:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DB247226A2;
	Fri,  6 Mar 2020 10:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y59jlGt+nHxY; Fri,  6 Mar 2020 10:10:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 13B7221509;
	Fri,  6 Mar 2020 10:10:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9D4CC1D8E;
	Fri,  6 Mar 2020 10:10:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7642EC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Mar 2020 10:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6CB8D20774
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Mar 2020 10:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yufMfk3kgHlY
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Mar 2020 10:10:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by silver.osuosl.org (Postfix) with ESMTPS id DF20F20033
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Mar 2020 10:10:03 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m3so1731506wmi.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 06 Mar 2020 02:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=og3sMPJN+Nb579KWuJJ61AJ7TUDj6TNf09RkDt7hsI8=;
 b=W3e46LJj5LqwGN7bmYVtalGehYEZNj3nHr/KAjP31KhaaXN+m0uWmMkf3acHKomptm
 89d0LyK/fwtGemR8XoQyJ0Ys/LcWeWGdlwW4CeVEEcaicTe2FKFajLwdJ5fOYlueg0Sl
 TK9CYNYdO7MxSrz07jDyQcWVpS506xMCbX+/TC3r/e8J6B1ZMT5UKVvra0iQbFiIzTGv
 115moqqHKTtOhYVG2HvcfiNX1TYPoAk1uZbA5LrtS1I/ItmZcZ3+3JYMcA9v6viTj0Yz
 eEAPwp4x5R0wWQQAwxCEk2yzvnV5bNaOC/JH7GsT7wADh0zmXAuNdX6IGcE4tUIHjkXg
 jtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=og3sMPJN+Nb579KWuJJ61AJ7TUDj6TNf09RkDt7hsI8=;
 b=cDPh4O6Nnyab6i6gA9/mPwZ5oTjs3VhDORNeotgtbIivVlhTdKw/kxVbrmXd16imVE
 UAQLJN35KbPghU1/oUMxL5jnSFMPirivcClOwsKxpFYRpyXm0GpS9k4/cWgt7PuOCaiQ
 J8s3orHByvqCaVcX4CO/UwBBjuk6H1auVosjBEMuiiYlctFMHsLvitcRltNnG821pQcS
 YcAcpKWCZG/tm+Zm+USTQW9UCVbyK/fR7ktuHXa1oBsq/SwbXqvo7Pcnia/bBm1IVXiC
 vXAFtqTbMX7xQMWg0/B9v+hq9c7HYriJLBjStiqUpFES+KlcVuDH2E8nEt8JoVn4ow5k
 jbkg==
X-Gm-Message-State: ANhLgQ0hsquKK+IkoXQ38E+H28mKDPS6m3eknUWDjq2Dje/VxVQuMxOn
 E3ETeInp1m0oQAwqeD93f3AFdg==
X-Google-Smtp-Source: ADFU+vuYWMHCslvUNwXUcaXSJwmBGmrU+STTteHzbOUtCKoxHdMrNV0++OcL5lLFlieALAAa/Z3NFg==
X-Received: by 2002:a1c:48c1:: with SMTP id v184mr3204485wma.5.1583489402366; 
 Fri, 06 Mar 2020 02:10:02 -0800 (PST)
Received: from myrica ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id f6sm12992707wmc.9.2020.03.06.02.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 02:10:01 -0800 (PST)
Date: Fri, 6 Mar 2020 11:09:55 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Hanjun Guo <guohanjun@huawei.com>
Subject: Re: [PATCH 00/14] iommu: Move iommu_fwspec out of 'struct device'
Message-ID: <20200306100955.GB50020@myrica>
References: <20200228150820.15340-1-joro@8bytes.org>
 <ea839f32-194a-29ea-57fc-22caea40b981@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea839f32-194a-29ea-57fc-22caea40b981@huawei.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Linuxarm <linuxarm@huawei.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
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

On Fri, Mar 06, 2020 at 04:39:37PM +0800, Hanjun Guo wrote:
> Hi Joerg,
> 
> On 2020/2/28 23:08, Joerg Roedel wrote:
> > Hi,
> > 
> > here is a patch-set to rename iommu_param to dev_iommu and
> > establish it as a struct for generic per-device iommu-data.
> > Also move the iommu_fwspec pointer from struct device into
> > dev_iommu to have less iommu-related pointers in struct
> > device.
> > 
> > The bigger part of this patch-set moves the iommu_priv
> > pointer from struct iommu_fwspec to dev_iommu, making is
> > usable for iommu-drivers which do not use fwspecs.
> > 
> > The changes for that were mostly straightforward, except for
> > the arm-smmu (_not_ arm-smmu-v3) and the qcom iommu driver.
> > Unfortunatly I don't have the hardware for those, so any
> > testing of these drivers is greatly appreciated.
> 
> I tested this patch set on Kunpeng 920 ARM64 server which
> using smmu-v3 with ACPI booting, but triggered a NULL
> pointer dereference and panic at boot:

I think that's because patch 01/14 move the fwspec access too early. In 

                err = pci_for_each_dma_alias(to_pci_dev(dev),
                                             iort_pci_iommu_init, &info);

                if (!err && iort_pci_rc_supports_ats(node))
                        dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;

the iommu_fwspec is only valid if iort_pci_iommu_init() initialized it
successfully, if err == 0. The following might fix it:

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 0e981d7f3c7d..7d04424189df 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -1015,7 +1015,7 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
 		return ops;

 	if (dev_is_pci(dev)) {
-		struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+		struct iommu_fwspec *fwspec;
 		struct pci_bus *bus = to_pci_dev(dev)->bus;
 		struct iort_pci_alias_info info = { .dev = dev };

@@ -1028,7 +1028,8 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
 		err = pci_for_each_dma_alias(to_pci_dev(dev),
 					     iort_pci_iommu_init, &info);

-		if (!err && iort_pci_rc_supports_ats(node))
+		fwspec = dev_iommu_fwspec_get(dev);
+		if (fwspec && iort_pci_rc_supports_ats(node))
 			fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
 	} else {
 		int i = 0;


Note that this use of iommu_fwspec will be removed by the ATS cleanup
series [1], but this change should work as a temporary fix.

Thanks,
Jean

[1] https://lore.kernel.org/linux-iommu/20200213165049.508908-10-jean-philippe@linaro.org/
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
