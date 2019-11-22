Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D8106C3C
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 11:51:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E655E87387;
	Fri, 22 Nov 2019 10:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id anBTYUBKJ4_5; Fri, 22 Nov 2019 10:51:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6E9938738C;
	Fri, 22 Nov 2019 10:51:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A272C18DA;
	Fri, 22 Nov 2019 10:51:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9503CC18DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3591687385
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EaeiU1mknz6y
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7AA0D8737F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:50:55 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n188so5118795wme.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 02:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/inLver145cFol/5bUSjQQctnMruvUV98+tylzxeqnk=;
 b=KvntgGm303h0Ssxf9aIFIK2XkoQiqLGKm8oBQdtFp8m6CkhuS563d23h38idVHFBTS
 kkHWOjKBIeiLqtFnIN5JqRxHj/IPpP1+8FLf2khs7+nbgJ0OpH9sMYPdLblXJN/5mPtZ
 Wb+8873vkfkzhOEno3SZc1Y9APZr1NOsSzkKP1ZCQ6Z0rpQLTlKOI9WgdHg2e1LDo7F0
 tBgAB48y5L6SMpiI5ioJ2KIyTBgMturfH5KATIT+F+PcJxgVRRlhZPFK7De+LuxTeNtE
 M4IA2puSbiUMBj2P+pdk0515MczvrK3k66Sn0WsjBltTEdPU0l74IdtDnv4aQdCAd0EZ
 nmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/inLver145cFol/5bUSjQQctnMruvUV98+tylzxeqnk=;
 b=Pgb6y2c2bClTul7WfkYHUAypEpfF+EqpEpNWcNeVeIgXqJ//JoPRkdJMnBcMSM2V11
 Lh4xN5d9Y06TBamCKjwcbJQtJ8yTsiT61KJjUj/sL0i3gMKkbwp+FWGjFzCRzt65Eokp
 c/nujlTUNHxFkwHLTL6DuS6FfanWRUFmuzYRt7o76paje/ztD05vNHZ16FiBHy6Tu4fa
 EqiK8mnwapkC3l/VnUvBh29RUFO1PAAvg4cvzGUCYmYZ9xkSMTYW9PZSiqnDbGU83vu+
 MjVThSyY/Stu+3Uh8Tt2LG1MO+QVWh4lw6pUMgpyc08M6iPR2JK+z38ig3LJAvHKjY3R
 FxOQ==
X-Gm-Message-State: APjAAAUbYuXDpC2rXor18ZsoaTAoFiOQBYrjeeHSz6BAeFwHtfRw/GOu
 Uz1rBlwL7+BoLOGkbNhcpVhelg==
X-Google-Smtp-Source: APXvYqybl+9ikgvCfSNL7CGfiLoR9Bk+QtDdRzYQU3EDUxB/3MAL7UXcY6vI8QXG4ikVn9LuAUlWLA==
X-Received: by 2002:a05:600c:3cd:: with SMTP id
 z13mr15785876wmd.105.1574419853787; 
 Fri, 22 Nov 2019 02:50:53 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-204-106.adslplus.ch.
 [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id o133sm2088197wmb.4.2019.11.22.02.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 02:50:53 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 virtio-dev@lists.oasis-open.org
Subject: [RFC 02/13] ACPI: Add VIOT definitions
Date: Fri, 22 Nov 2019 11:49:49 +0100
Message-Id: <20191122105000.800410-3-jean-philippe@linaro.org>
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

This is temporary, until the VIOT table is published and these
definitions added to ACPICA.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/acpi/actbl2.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index e45ced27f4c3..99c1d747e9d8 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -25,6 +25,7 @@
  * the wrong signature.
  */
 #define ACPI_SIG_IORT           "IORT"	/* IO Remapping Table */
+#define ACPI_SIG_VIOT           "VIOT"	/* Virtual I/O Table */
 #define ACPI_SIG_IVRS           "IVRS"	/* I/O Virtualization Reporting Structure */
 #define ACPI_SIG_LPIT           "LPIT"	/* Low Power Idle Table */
 #define ACPI_SIG_MADT           "APIC"	/* Multiple APIC Description Table */
@@ -412,6 +413,36 @@ struct acpi_ivrs_memory {
 	u64 memory_length;
 };
 
+/*******************************************************************************
+ *
+ * VIOT - Virtual I/O Table
+ *        Version 1
+ *
+ ******************************************************************************/
+
+struct acpi_table_viot {
+	struct acpi_table_header header;
+	u8 reserved[12];
+	struct acpi_table_header base_table;
+};
+
+#define ACPI_VIOT_IORT_NODE_VIRTIO_PCI_IOMMU    0x80
+#define ACPI_VIOT_IORT_NODE_VIRTIO_MMIO_IOMMU   0x81
+
+struct acpi_viot_iort_virtio_pci_iommu {
+	u32 devid;
+};
+
+struct acpi_viot_iort_virtio_mmio_iommu {
+	u64 base_address;
+	u64 span;
+	u64 flags;
+	u64 interrupt;
+};
+
+/* FIXME: rename this monstrosity. */
+#define ACPI_VIOT_IORT_VIRTIO_MMIO_IOMMU_CACHE_COHERENT (1<<0)
+
 /*******************************************************************************
  *
  * LPIT - Low Power Idle Table
-- 
2.24.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
