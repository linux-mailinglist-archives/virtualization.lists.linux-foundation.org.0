Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EC62F106D2B
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 11:58:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A8B988197;
	Fri, 22 Nov 2019 10:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4lvagH33yrK; Fri, 22 Nov 2019 10:58:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3336086EAC;
	Fri, 22 Nov 2019 10:58:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B35DC18DA;
	Fri, 22 Nov 2019 10:58:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D71A5C18DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CA12E86205
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OpW3J8ZhAPje
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:57:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8DD3485F83
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:57:57 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id r7so6894680ljg.2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 02:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GnM7tdmIuTsFG/gPDSUiRJmc1F37mgdxvtHO3FtFylE=;
 b=Bn+Nr/ytUk5YMVm1sQH/UVWhb/mMA2dE72H0//SsVqGsJ9g8ztbjNMl03n+vqtDgX1
 BVKT3vkBXC/ScqOu1f0iF7XkX6lsqaoR5LUZxq0mZatIZOz7WNO1g8raGl67VngxgyW9
 Zn2kqX9vdxYlDvCmxLBCm2xmeGhSiwiljE+9lmgXsFsgUPRpHuMCsvvuNYY6NigcTHtB
 6RIo/Qb2nm8M3urPlnZCBvaTaniwiuU4Ty9DcH8MlFxUi10bX7AZqP19/YZ8ro/tJBja
 iDFhce9IQReQ91LQ4rr7HwA94Ofb7+RxgCw7sMyVwzrXEjrM0k5Wqz6UJ8AMXLdvEArk
 /QLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GnM7tdmIuTsFG/gPDSUiRJmc1F37mgdxvtHO3FtFylE=;
 b=jr3U6gh53uAHJXP+AeJkkSDf1QE2SNzM1o/l/jErgdo+GX7SEUdAUB3EBn6tuUXN2c
 wkzQC9im1Pe49kQ+B5tqEcrRV7LpYKRD0R7fGGZsS4v6Vqi3dbeT1HPUVrAzcNtUwE0e
 ltnEHpY/SUf169cjzY8c6mdPYQIJG0rzPEhhJhUbzYpKaTssAZ4g1EdHvGVdsLqBuOgv
 xftsdz0gUxS3vvfwkRJZeK5LUdWBOaEtDrpbcjIHi1B/blRNrLm2T16eETej1Yb1JX03
 WcBYaRklGvmIpo65dStQMNso+PZCqjc/08EJJB3jj2L9OEtaEDx+omuRF/zGHWysB8cI
 quxQ==
X-Gm-Message-State: APjAAAWWUu6vHDagc52u9tKpTthhLuEC6c2kRGvwcMFYPqIG8pL1alH2
 Nf3GoOIdGm1OsYSFTTTMGLFje5S6kF0=
X-Google-Smtp-Source: APXvYqwkrBA1P0X6qMijtc1m/IkH374uodkpj4sCzTHsq7FVgmjD/iynOAUZy7h3h+1OHmfVUN05+Q==
X-Received: by 2002:adf:c611:: with SMTP id n17mr17357418wrg.317.1574419852465; 
 Fri, 22 Nov 2019 02:50:52 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-204-106.adslplus.ch.
 [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id o133sm2088197wmb.4.2019.11.22.02.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 02:50:52 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 virtio-dev@lists.oasis-open.org
Subject: [RFC 01/13] ACPI/IORT: Move IORT to the ACPI folder
Date: Fri, 22 Nov 2019 11:49:48 +0100
Message-Id: <20191122105000.800410-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191122105000.800410-1-jean-philippe@linaro.org>
References: <20191122105000.800410-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: lorenzo.pieralisi@arm.com, mst@redhat.com, gregkh@linuxfoundation.org,
 joro@8bytes.org, sudeep.holla@arm.com, rjw@rjwysocki.net,
 eric.auger@redhat.com, sebastien.boeuf@intel.com, jacob.jun.pan@intel.com,
 guohanjun@huawei.com, bhelgaas@google.com, lenb@kernel.org
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

IORT can be used (by QEMU) to describe a virtual topology containing an
architecture-agnostic paravirtualized device.

In order to build IORT for x86 systems, the driver has to be moved outside
of arm64/. Since there is nothing specific to arm64 in the driver, it
simply requires moving Makefile and Kconfig entries.

Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
---
 MAINTAINERS                     | 9 +++++++++
 drivers/acpi/Kconfig            | 3 +++
 drivers/acpi/Makefile           | 1 +
 drivers/acpi/arm64/Kconfig      | 3 ---
 drivers/acpi/arm64/Makefile     | 1 -
 drivers/acpi/{arm64 => }/iort.c | 0
 6 files changed, 13 insertions(+), 4 deletions(-)
 rename drivers/acpi/{arm64 => }/iort.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb19fad370d7..9153d278f67e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -377,6 +377,15 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/i2c-multi-instantiate.c
 
+ACPI IORT DRIVER
+M:	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
+M:	Hanjun Guo <guohanjun@huawei.com>
+M:	Sudeep Holla <sudeep.holla@arm.com>
+L:	linux-acpi@vger.kernel.org
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	drivers/acpi/iort.c
+
 ACPI PMIC DRIVERS
 M:	"Rafael J. Wysocki" <rjw@rjwysocki.net>
 M:	Len Brown <lenb@kernel.org>
diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index ebe1e9e5fd81..548976c8b2b0 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -576,6 +576,9 @@ config TPS68470_PMIC_OPREGION
 	  region, which must be available before any of the devices
 	  using this, are probed.
 
+config ACPI_IORT
+	bool
+
 endif	# ACPI
 
 config X86_PM_TIMER
diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index 5d361e4e3405..9d1792165713 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -123,3 +123,4 @@ video-objs			+= acpi_video.o video_detect.o
 obj-y				+= dptf/
 
 obj-$(CONFIG_ARM64)		+= arm64/
+obj-$(CONFIG_ACPI_IORT) 	+= iort.o
diff --git a/drivers/acpi/arm64/Kconfig b/drivers/acpi/arm64/Kconfig
index 6dba187f4f2e..d0902c85d46e 100644
--- a/drivers/acpi/arm64/Kconfig
+++ b/drivers/acpi/arm64/Kconfig
@@ -3,8 +3,5 @@
 # ACPI Configuration for ARM64
 #
 
-config ACPI_IORT
-	bool
-
 config ACPI_GTDT
 	bool
diff --git a/drivers/acpi/arm64/Makefile b/drivers/acpi/arm64/Makefile
index 6ff50f4ed947..38771a816caf 100644
--- a/drivers/acpi/arm64/Makefile
+++ b/drivers/acpi/arm64/Makefile
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_ACPI_IORT) 	+= iort.o
 obj-$(CONFIG_ACPI_GTDT) 	+= gtdt.o
diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/iort.c
similarity index 100%
rename from drivers/acpi/arm64/iort.c
rename to drivers/acpi/iort.c
-- 
2.24.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
