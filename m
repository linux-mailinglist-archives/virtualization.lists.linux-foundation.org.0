Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C53E58E9AB
	for <lists.virtualization@lfdr.de>; Thu, 15 Aug 2019 13:10:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8ECA3D4A;
	Thu, 15 Aug 2019 11:10:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BC293D48
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 11:10:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D39568A0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 11:10:13 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 196so1180636pfz.8
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 04:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tcd-ie.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pnCulqyNhSM91IKVD9IZn1zR67Z7c5BvAhoQmog/5ec=;
	b=Q/yj0wdq+WilKs254iWd4ctGJJZQhMbIdIQejnyJ2yIZ2I3/VGazT/h5zdi6LD7eY8
	FwgETf3lOfMHLLcqgq8CX6eWsXdSOnzVllHOw4eeaE0NXqiFmk8nmB4m4ILkf0DWUhGl
	JMQh6MEqYX1Y/aId7O5b7KB1SCsX5COS7TIXwL/OLfWSbuLKcOFMiSy2pNH9NkkEkNBr
	vOPWQr2P1jdI57kcED+j4RTWUTiYLR6O+vQhsK1J9F6eA8G9tukV7lXi54eGF07uXuiI
	Xknh1VVTk7+o3JYaC+ItCXjA2eeC6ftIDB3zEkigJNAaCQqM79VsPpgrbJeTAytQ3YC4
	1SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pnCulqyNhSM91IKVD9IZn1zR67Z7c5BvAhoQmog/5ec=;
	b=CkPY1ZjtoTE/SvldzMPH4y6CM8qDO1F94YjLMlIPJ15C6nYpphiI43yEJOQmjRSTwi
	7B2KX+Ccy8UuJc9B3HlJRTC7vYUNEwlhbP54t18Emz8p8x5l8zwS1nJAyOeol2G4AOge
	xasakxrD8r2Jkqwevlk82UXqYmNNN8sJXD2Mt9/0BwM1/OPdH2F8cgEqk6+egZ4fwwAy
	CH1xYh9z74c8hVQqT/YFZ51LNyaARTAlngtaKubJhhNCuj4s5hwTF66zEyr+x9cnxp/I
	uiNWpHr3wQqBL57aB1ux7opkFsyGuDH3JYPlM4oEAXGkxmKA+5XqNG/CJAC85gJ5UCiN
	8uVg==
X-Gm-Message-State: APjAAAVoT+cnaA96z0ZnQazKXDJ3KMo3Fl+8wEKb3/uxmk/L8jSEaqVI
	UTdlMyVToTqiIZLdy6R6meQ+Wg==
X-Google-Smtp-Source: APXvYqxZ8fgFC+B1aOZDDqSuQf6BabOCz/a02ujOJQDOq0sxZQrHZCdzZZ4gWxdnMFReUWQ6Q4YS3Q==
X-Received: by 2002:a65:6458:: with SMTP id s24mr3060394pgv.158.1565867413007; 
	Thu, 15 Aug 2019 04:10:13 -0700 (PDT)
Received: from localhost.localdomain
	([2404:e801:200e:19c4:6c3f:b548:3a9c:7867])
	by smtp.googlemail.com with ESMTPSA id
	z13sm1042678pjn.32.2019.08.15.04.10.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 15 Aug 2019 04:10:12 -0700 (PDT)
From: Tom Murphy <murphyt7@tcd.ie>
To: iommu@lists.linux-foundation.org
Subject: [PATCH V5 0/5] iommu/amd: Convert the AMD iommu driver to the
	dma-iommu api
Date: Thu, 15 Aug 2019 12:09:38 +0100
Message-Id: <20190815110944.3579-1-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, virtualization@lists.linux-foundation.org,
	linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
	Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-samsung-soc@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
	Rob Clark <robdclark@gmail.com>, Kukjin Kim <kgene@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Convert the AMD iommu driver to the dma-iommu api. Remove the iova
handling and reserve region code from the AMD iommu driver.

Change-log:
V5:
-Rebase on top of linux-next
V4:
-Rebase on top of linux-next
-Split the removing of the unnecessary locking in the amd iommu driver into a seperate patch
-refactor the "iommu/dma-iommu: Handle deferred devices" patch and address comments
v3:
-rename dma_limit to dma_mask
-exit handle_deferred_device early if (!is_kdump_kernel())
-remove pointless calls to handle_deferred_device
v2:
-Rebase on top of this series:
 http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-iommu-ops.3
-Add a gfp_t parameter to the iommu_ops::map function.
-Made use of the reserve region code inside the dma-iommu api

Tom Murphy (5):
  iommu/amd: Remove unnecessary locking from AMD iommu driver
  iommu: Add gfp parameter to iommu_ops::map
  iommu/dma-iommu: Handle deferred devices
  iommu/dma-iommu: Use the dev->coherent_dma_mask
  iommu/amd: Convert AMD iommu driver to the dma-iommu api

 drivers/iommu/Kconfig           |   1 +
 drivers/iommu/amd_iommu.c       | 690 ++++----------------------------
 drivers/iommu/amd_iommu_types.h |   1 -
 drivers/iommu/arm-smmu-v3.c     |   2 +-
 drivers/iommu/arm-smmu.c        |   2 +-
 drivers/iommu/dma-iommu.c       |  43 +-
 drivers/iommu/exynos-iommu.c    |   2 +-
 drivers/iommu/intel-iommu.c     |   2 +-
 drivers/iommu/iommu.c           |  43 +-
 drivers/iommu/ipmmu-vmsa.c      |   2 +-
 drivers/iommu/msm_iommu.c       |   2 +-
 drivers/iommu/mtk_iommu.c       |   2 +-
 drivers/iommu/mtk_iommu_v1.c    |   2 +-
 drivers/iommu/omap-iommu.c      |   2 +-
 drivers/iommu/qcom_iommu.c      |   2 +-
 drivers/iommu/rockchip-iommu.c  |   2 +-
 drivers/iommu/s390-iommu.c      |   2 +-
 drivers/iommu/tegra-gart.c      |   2 +-
 drivers/iommu/tegra-smmu.c      |   2 +-
 drivers/iommu/virtio-iommu.c    |   2 +-
 include/linux/iommu.h           |  21 +-
 21 files changed, 178 insertions(+), 651 deletions(-)

-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
