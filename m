Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FE1106C44
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 11:51:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F35FD261D0;
	Fri, 22 Nov 2019 10:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KrgXCXNZpsfQ; Fri, 22 Nov 2019 10:51:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 110A425D78;
	Fri, 22 Nov 2019 10:51:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E78A4C18DA;
	Fri, 22 Nov 2019 10:51:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C701CC1DDB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BFEB288B41
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i93YRhJOtBlD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 315F288B7C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:07 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 8so7081563wmo.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 02:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6qGp2c7p8L2l1s7Du/UosUTRGtm9jAQFCi+oOptldg=;
 b=SOMWRl5MASeOm4GNtX9OArMbaILwLPRIzg8o5jQFJjlDJs7o7+6TRqRDRJJlcZKv1S
 C2wRUga0S929l8ZmubuZMrj4IpG5Fa2Nqe1Nopf/OfaG7JXzleQDTj1N8JFM+wM4dxkw
 a0IPZK9nsydiR7+ZaHFq8+zB4Kl+q/5r1Xtc5efWJGgpcICIwIevEVheIsqYwHeQbybW
 cC1h0KeLL/1CSa0gL5NCQZiIo97Dk5CcMapCj8Pt35ahMGhjHVVuLINva1JbNz3+Gk7f
 HvHGhikrvzqw3GWpjHonq28nTbE1JPkhrHfsEMIPgU0/NbAlKrRBh/66q3xFCw04rAqj
 UPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6qGp2c7p8L2l1s7Du/UosUTRGtm9jAQFCi+oOptldg=;
 b=rGRjyGCq8r3JFJzqElF/HKcPOwn6mz82MmERr87JtW0QBHgaY/8YFQkpeH32Eowjm1
 9ynQh1z9Xs9TAHKosifUPxqMObGffoQst/V3Wab1lTadoKXKD94TJrQgvm07OMuwQBsx
 jAXJhcvBs8OuaLGTbbZ5oSl+bOQgHjskQdg+ChJF0H70L2l0k7kta77GifpKn6aKRZk2
 fUbqROBln0UsCH3KfqcjjDbxJb9MmL3T0oJNXxf7U+WbYHVmGbZh83S049of7w4fTXeY
 gzMLwHVlcAIq+xhQ3ZibakCCEOiFIwp7h0zbLx/EXsXMA65rYTXiAJJ3Mu/yQDBnPInR
 8H0Q==
X-Gm-Message-State: APjAAAX3vtqduHUCrIxc3q4DSDepBaEvVB4HTt5YyxrgW7JR8KE+BWaN
 Z48dDGZjIPcrfAR+GoL+uaZvEA==
X-Google-Smtp-Source: APXvYqyUulc/cLM8hB09K3/hFqAi2tZ8CaZnvvhDeSgluvoZSIPS68UGsollQ+F3ni0gC6lT6Ek3Mw==
X-Received: by 2002:a1c:2d49:: with SMTP id t70mr15677618wmt.131.1574419865443; 
 Fri, 22 Nov 2019 02:51:05 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-204-106.adslplus.ch.
 [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id o133sm2088197wmb.4.2019.11.22.02.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 02:51:05 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 virtio-dev@lists.oasis-open.org
Subject: [RFC 11/13] ACPI: Add VIOT table
Date: Fri, 22 Nov 2019 11:49:58 +0100
Message-Id: <20191122105000.800410-12-jean-philippe@linaro.org>
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

Add support for a new ACPI table that embeds other tables describing a
platform's IOMMU topology. Currently the only supported base table is
IORT. The VIOT contains an IORT with additional node types, that
describe a virtio-iommu.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/acpi/Kconfig      |  4 ++++
 drivers/acpi/Makefile     |  1 +
 drivers/acpi/bus.c        |  2 ++
 drivers/acpi/tables.c     |  2 +-
 drivers/acpi/viot.c       | 44 +++++++++++++++++++++++++++++++++++++++
 drivers/iommu/Kconfig     |  1 +
 include/linux/acpi_viot.h | 20 ++++++++++++++++++
 7 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 drivers/acpi/viot.c
 create mode 100644 include/linux/acpi_viot.h

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index 548976c8b2b0..513a5e4d3526 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -579,6 +579,10 @@ config TPS68470_PMIC_OPREGION
 config ACPI_IORT
 	bool
 
+config ACPI_VIOT
+	bool
+	select ACPI_IORT
+
 endif	# ACPI
 
 config X86_PM_TIMER
diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index 9d1792165713..6abdc6cc32c7 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -124,3 +124,4 @@ obj-y				+= dptf/
 
 obj-$(CONFIG_ARM64)		+= arm64/
 obj-$(CONFIG_ACPI_IORT) 	+= iort.o
+obj-$(CONFIG_ACPI_VIOT)		+= viot.o
diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 48bc96d45bab..6f364e0c9240 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -25,6 +25,7 @@
 #include <linux/dmi.h>
 #endif
 #include <linux/acpi_iort.h>
+#include <linux/acpi_viot.h>
 #include <linux/pci.h>
 #include <acpi/apei.h>
 #include <linux/suspend.h>
@@ -1246,6 +1247,7 @@ static int __init acpi_init(void)
 
 	pci_mmcfg_late_init();
 	acpi_iort_init();
+	acpi_viot_init();
 	acpi_scan_init();
 	acpi_ec_init();
 	acpi_debugfs_init();
diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index 180ac4329763..9662ea5e1064 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -501,7 +501,7 @@ static const char * const table_sigs[] = {
 	ACPI_SIG_WDDT, ACPI_SIG_WDRT, ACPI_SIG_DSDT, ACPI_SIG_FADT,
 	ACPI_SIG_PSDT, ACPI_SIG_RSDT, ACPI_SIG_XSDT, ACPI_SIG_SSDT,
 	ACPI_SIG_IORT, ACPI_SIG_NFIT, ACPI_SIG_HMAT, ACPI_SIG_PPTT,
-	NULL };
+	ACPI_SIG_VIOT, NULL };
 
 #define ACPI_HEADER_SIZE sizeof(struct acpi_table_header)
 
diff --git a/drivers/acpi/viot.c b/drivers/acpi/viot.c
new file mode 100644
index 000000000000..ab9a6e43ad9b
--- /dev/null
+++ b/drivers/acpi/viot.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Linaro
+ *
+ * Virtual IOMMU table
+ */
+#define pr_fmt(fmt)	"ACPI: VIOT: " fmt
+
+#include <linux/acpi.h>
+#include <linux/acpi_iort.h>
+#include <linux/acpi_viot.h>
+
+int __init acpi_viot_init(void)
+{
+	struct acpi_table_viot *viot;
+	struct acpi_table_header *acpi_header;
+	acpi_status status;
+
+	status = acpi_get_table(ACPI_SIG_VIOT, 0, &acpi_header);
+	if (ACPI_FAILURE(status)) {
+		if (status != AE_NOT_FOUND) {
+			const char *msg = acpi_format_exception(status);
+
+			pr_err("Failed to get table, %s\n", msg);
+			return -EINVAL;
+		}
+
+		return 0;
+	}
+
+	if (acpi_header->length < sizeof(*viot)) {
+		pr_err("VIOT table overflow, bad table!\n");
+		return -EINVAL;
+	}
+
+	viot = (struct acpi_table_viot *)acpi_header;
+	if (ACPI_COMPARE_NAMESEG(viot->base_table.signature, ACPI_SIG_IORT)) {
+		acpi_iort_register_table(&viot->base_table, IORT_SOURCE_VIOT);
+		return 0;
+	}
+
+	pr_err("Unknown base table header\n");
+	return -EINVAL;
+}
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index e3842eabcfdd..e6eb4f238d1a 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -480,6 +480,7 @@ config VIRTIO_IOMMU
 	depends on ARM64
 	select IOMMU_API
 	select INTERVAL_TREE
+	select ACPI_VIOT if ACPI
 	help
 	  Para-virtualised IOMMU driver with virtio.
 
diff --git a/include/linux/acpi_viot.h b/include/linux/acpi_viot.h
new file mode 100644
index 000000000000..6c282d5eb793
--- /dev/null
+++ b/include/linux/acpi_viot.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2019 Linaro
+ */
+
+#ifndef __ACPI_VIOT_H__
+#define __ACPI_VIOT_H__
+
+#ifdef CONFIG_ACPI_VIOT
+
+int acpi_viot_init(void);
+
+#else /* !CONFIG_ACPI_VIOT */
+
+static inline int acpi_viot_init(void)
+{}
+
+#endif /* !CONFIG_ACPI_VIOT */
+
+#endif /* __ACPI_VIOT_H__ */
-- 
2.24.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
