Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E1D106CD3
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 11:56:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F275E261AF;
	Fri, 22 Nov 2019 10:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cwpGRBhmvt6l; Fri, 22 Nov 2019 10:56:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B991726150;
	Fri, 22 Nov 2019 10:56:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96E2CC18DA;
	Fri, 22 Nov 2019 10:56:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC567C18DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 99A9B8737E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:56:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v85Ku2Moo4_F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:56:05 +0000 (UTC)
X-Greylist: delayed 00:05:11 by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CFB6F8737C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:56:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a15so8044381wrf.9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 02:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MfTtXiG/W/rObmsyirkEQ0i6+kv30tKWKHAFlzXsK50=;
 b=KGaaTyS3Lc/ef+t1SZuZlTE1UsU+JnOw0CHre56ANUeiS1fG2WU5O/YFQcBx5DFQ+g
 C3eEzhT3EtsVVDaPXc0JJnwFtgO1xkFqrrE6GycrJ2S4YEKOcx4s42s4o+D2QSUmsenY
 giJa7ayJtTWwW60SOcSL7s5TyIuTMeag5BlKYTNd2Vpv5b3Ku4VoOfgVTWmpiuNgZfga
 0U9jEO3Ob60MHJopefjx77FsOCYeO+1ZpoKfR2ZI8XHgbGZFlpcgyTQN/mBvo0haJZcQ
 4WN5cxwZz8VzF5n+E1gDTt+EyPoR0GPG3uAOf5O3TZXJzM8psHGvEWv0Dabay2iZKY72
 vmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MfTtXiG/W/rObmsyirkEQ0i6+kv30tKWKHAFlzXsK50=;
 b=JrQIGqQUBAVUpgNwqXPTQ4xSahrxmJUTe15IiaIcUMPOoEQ2tqeghbJUIFwiCRVj7q
 k6rOL/o3ePHLHph2peIPczk8q+xERTLPJ0gU94DyGkCWkSJhB9vtLG5wUExDCZ6xtyw6
 1Lhv8FaCYc0vPo5c9KOXwiHpB723r9gk7ENYhFvMhXyonOLK9A7t4gBaDPHEqclQvOUt
 UT+2Tku9dxSfPLJTxGrjk6xRnOQO+fSIgFDRJ2DAYyhg3JWEvsfz5aZFxsb+hEsaRbwl
 wLRvsKJP3hDM7+1EeBgsa8jN7BUQ5ZU77CfZHzEVJBGIoQfgdftfXSgNkPlxmUTt4vzi
 Zpdw==
X-Gm-Message-State: APjAAAVrkQoy37S3ilI3EDo/HcfLbKwraFz1Skcjs1ML2JxCFyF7HpXL
 REdDUyxzrdBjzGPKjXoseYrCYw==
X-Google-Smtp-Source: APXvYqzYWFFlrhHka1Vw/6sChVYtvTiOJin0SbfQOyNoZG5nnElEymYjGNuUm72JutIfgIh/3EoY2g==
X-Received: by 2002:adf:e885:: with SMTP id d5mr17167901wrm.117.1574419856320; 
 Fri, 22 Nov 2019 02:50:56 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-204-106.adslplus.ch.
 [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id o133sm2088197wmb.4.2019.11.22.02.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 02:50:55 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 virtio-dev@lists.oasis-open.org
Subject: [RFC 04/13] ACPI/IORT: Add node categories
Date: Fri, 22 Nov 2019 11:49:51 +0100
Message-Id: <20191122105000.800410-5-jean-philippe@linaro.org>
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

The current node filtering won't work when introducing node types
greater than 63 (such as the virtio-iommu nodes). Add
node_type_matches() to filter nodes by category.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/acpi/iort.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/iort.c b/drivers/acpi/iort.c
index 9c6c91e06f8f..1d43fbc0001f 100644
--- a/drivers/acpi/iort.c
+++ b/drivers/acpi/iort.c
@@ -18,10 +18,10 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#define IORT_TYPE_MASK(type)	(1 << (type))
-#define IORT_MSI_TYPE		(1 << ACPI_IORT_NODE_ITS_GROUP)
-#define IORT_IOMMU_TYPE		((1 << ACPI_IORT_NODE_SMMU) |	\
-				(1 << ACPI_IORT_NODE_SMMU_V3))
+enum iort_node_category {
+	IORT_MSI_TYPE,
+	IORT_IOMMU_TYPE,
+};
 
 struct iort_its_msi_chip {
 	struct list_head	list;
@@ -38,6 +38,20 @@ struct iort_fwnode {
 static LIST_HEAD(iort_fwnode_list);
 static DEFINE_SPINLOCK(iort_fwnode_lock);
 
+static bool iort_type_matches(u8 type, enum iort_node_category category)
+{
+	switch (category) {
+	case IORT_IOMMU_TYPE:
+		return type == ACPI_IORT_NODE_SMMU ||
+		       type == ACPI_IORT_NODE_SMMU_V3;
+	case IORT_MSI_TYPE:
+		return type == ACPI_IORT_NODE_ITS_GROUP;
+	default:
+		WARN_ON(1);
+		return false;
+	}
+}
+
 /**
  * iort_set_fwnode() - Create iort_fwnode and use it to register
  *		       iommu data in the iort_fwnode_list
@@ -397,7 +411,7 @@ static int iort_get_id_mapping_index(struct acpi_iort_node *node)
 
 static struct acpi_iort_node *iort_node_map_id(struct acpi_iort_node *node,
 					       u32 id_in, u32 *id_out,
-					       u8 type_mask)
+					       enum iort_node_category category)
 {
 	u32 id = id_in;
 
@@ -406,7 +420,7 @@ static struct acpi_iort_node *iort_node_map_id(struct acpi_iort_node *node,
 		struct acpi_iort_id_mapping *map;
 		int i, index;
 
-		if (IORT_TYPE_MASK(node->type) & type_mask) {
+		if (iort_type_matches(node->type, category)) {
 			if (id_out)
 				*id_out = id;
 			return node;
@@ -458,8 +472,8 @@ static struct acpi_iort_node *iort_node_map_id(struct acpi_iort_node *node,
 }
 
 static struct acpi_iort_node *iort_node_map_platform_id(
-		struct acpi_iort_node *node, u32 *id_out, u8 type_mask,
-		int index)
+		struct acpi_iort_node *node, u32 *id_out,
+		enum iort_node_category category, int index)
 {
 	struct acpi_iort_node *parent;
 	u32 id;
@@ -475,8 +489,8 @@ static struct acpi_iort_node *iort_node_map_platform_id(
 	 * as NC (named component) -> SMMU -> ITS. If the type is matched,
 	 * return the initial dev id and its parent pointer directly.
 	 */
-	if (!(IORT_TYPE_MASK(parent->type) & type_mask))
-		parent = iort_node_map_id(parent, id, id_out, type_mask);
+	if (!iort_type_matches(parent->type, category))
+		parent = iort_node_map_id(parent, id, id_out, category);
 	else
 		if (id_out)
 			*id_out = id;
-- 
2.24.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
