Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E1833DD3C
	for <lists.virtualization@lfdr.de>; Tue, 16 Mar 2021 20:19:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D25C54EC35;
	Tue, 16 Mar 2021 19:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bICRJ3qMqLSZ; Tue, 16 Mar 2021 19:19:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67D184EC50;
	Tue, 16 Mar 2021 19:19:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FC6FC000A;
	Tue, 16 Mar 2021 19:19:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DFB3C000A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 19:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B01843192
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 19:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3699f_hhXWMO
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 19:18:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 717B242FFA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 19:18:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id p19so160609wmq.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 12:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t5nF/sXmMcwkw/ixJn1wgxDWeReE+TQab+n6/wXS1U0=;
 b=oaMK9nYnTAZy6ym3HYBmsqWuTVnMYutZ/U+My/vKZTXWBNQa3kUp/CciNiv42oBJY0
 sz/3nwTqT77ad0BK6/aNftjxGpd+x5BnQ08enNqXaOj6sYNydPxIwAdUYSmBMMdHknaJ
 3lTnRODxiPkto6n3IX3caXRjSWSazO2ZyYuFTmm2Z8jGfNqMpX2X4pzRd4+2GzuiV3at
 le5h53LvdTcx4ZjtnQNcJlulO36rZ/2LAjIsCcNWdtBEiPFwHj30zOJ9APBb0G7Xy2g9
 V3t8uyrFrYicbRxD3jwfVfuIs4jbNaFzW7lHPH02gBcOy9b2DQZMVtEbZKfz0FBvkYvI
 3hlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t5nF/sXmMcwkw/ixJn1wgxDWeReE+TQab+n6/wXS1U0=;
 b=b2HfPBu7x997rpGXco4Poj/ZcBXRltsThJSfK/WLtDnQ7BKz1rQJ8YtIhTlJ7+iytQ
 V7elRuLL0MjhFB4IbwrhvKAztnepx8/Hn0msybmMuNE4V3YBRW1QDjZ6L0lwCuls9zeP
 T++CMIJ3COzDXtWzBO+O75yl72oMqVAr3TuoM+PTvtqj5shJu7Rxmp/CUh+jKI8yJ/Yf
 c60vWPjjtWPfC+09tDNkSL54hTBjpQPvdiEqZ4t1/GpR+GAbIG6QheHyvdeQ4PxN+2kc
 IHpr4UoPAy4M34Jfvx027WZYJly7+WOCRe5ZQ0m2b25wfY925Cjn/l6nHbNczGxdtNJ2
 DTFg==
X-Gm-Message-State: AOAM530tlVSK9/f+Gix97qWgEnefxYzhdiclRKaE/092BLxfgFhTX7IW
 ctdhhEgZNQFOEMFL2FtbMOODoBR5hDidgg==
X-Google-Smtp-Source: ABdhPJwrnc/yoYhLqyVbf/ctwV9VfvVZmgZLZUJT5ACgoolGvh6o3uWH6IcGtVOst4Ix4VaYd5EPVQ==
X-Received: by 2002:a05:600c:198c:: with SMTP id
 t12mr308127wmq.183.1615922335734; 
 Tue, 16 Mar 2021 12:18:55 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id p12sm22690438wrx.28.2021.03.16.12.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 12:18:55 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: rjw@rjwysocki.net,
	lenb@kernel.org,
	joro@8bytes.org,
	mst@redhat.com
Subject: [PATCH 3/3] iommu/virtio: Enable x86 support
Date: Tue, 16 Mar 2021 20:16:54 +0100
Message-Id: <20210316191652.3401335-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210316191652.3401335-1-jean-philippe@linaro.org>
References: <20210316191652.3401335-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: jean-philippe@linaro.org, lorenzo.pieralisi@arm.com, eric.auger@redhat.com,
 robin.murphy@arm.com, virtualization@lists.linux-foundation.org,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, will@kernel.org
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

With the VIOT support in place, x86 platforms can now use the
virtio-iommu.

The arm64 Kconfig selects IOMMU_DMA, while x86 IOMMU drivers select it
themselves.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 2819b5c8ec30..ccca83ef2f06 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -400,8 +400,9 @@ config HYPERV_IOMMU
 config VIRTIO_IOMMU
 	tristate "Virtio IOMMU driver"
 	depends on VIRTIO
-	depends on ARM64
+	depends on (ARM64 || X86)
 	select IOMMU_API
+	select IOMMU_DMA if X86
 	select INTERVAL_TREE
 	select ACPI_VIOT if ACPI
 	help
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
