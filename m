Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C953124897
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 14:42:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D462920485;
	Wed, 18 Dec 2019 13:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wSjU66RJY8G9; Wed, 18 Dec 2019 13:42:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 99DB4203EF;
	Wed, 18 Dec 2019 13:42:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D09FC077D;
	Wed, 18 Dec 2019 13:42:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6ED1C077D;
 Wed, 18 Dec 2019 13:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A44E4860FD;
 Wed, 18 Dec 2019 13:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ELM00aWqk3W; Wed, 18 Dec 2019 13:42:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CCD4A85F34;
 Wed, 18 Dec 2019 13:42:14 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p17so1966019wmb.0;
 Wed, 18 Dec 2019 05:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hsSJEdQqIlVTuRxaI5pZ056JoQciAS3rF+M0zjO6p6Y=;
 b=Um7cIxVKrCL+GblkgV5cWPFKTxMRq1sqlSkP97BUTJnao5yxvGJ1mxC17XJpzKbyBu
 ikiHm0Px1UB7chSLij+ETIXF3g2taubWqshSlFmQ0pTYzni5QhviUHOA8jDeht2fLhfR
 R+zQLmjcn+GvltAQv3pZPK35vxxWFUTXrdU6i4OIHBh9WMyCCi176mTn5nuSGa7xcT5M
 vVkmD+w9VTYX1pt/WqNIAft+tEQ1hp+7VHHQGnU6U0uk1xCw48nPJJI+v1wMc1e8+UDa
 nTpbLq34/DFx/HL1vn38IhkVj85px0hpMZkHza8QfXo3oHIRlb2l/lXnxVyi1tHnX/HC
 0YLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hsSJEdQqIlVTuRxaI5pZ056JoQciAS3rF+M0zjO6p6Y=;
 b=FIq4Is8II2MbJm+TABD8F7I435b08mj+gYvtmF0cn8NkZ8OXqThbnPpUxVT/byFAMR
 OvLhWkvcV8oURlHjgYeqSUmLRELQFdWk/MW68B6utTOJ2NgJHcxpBb1DzVP1k6tnXU82
 pm1qsHFGJs09vyz+U3HNS0gmyLJImylpin7vjBvupxzM2FvsMOPQgfbalxmu51cnP9N1
 WjRQYqsJRonLUY8ept2Z6Q5E/1jr5hSIwjOYDlCuwz6MdTeL/Ves8e1J+sV1TkeS/Rwb
 A3bYg9xwzJdCc2WP8PHD1Otz15TY+YFjepzJwNTBTBjOo+4vwnS2t4c/a4lxMM78X+sl
 UMkA==
X-Gm-Message-State: APjAAAVf66+I5Djx/U0MO8OEKZlBBVr+fVk3CKIHHJo5hRJGSxN/mdv9
 t5rVA6uKfm1z+WAD6GxPUNY=
X-Google-Smtp-Source: APXvYqxRFC4I+BCYSiyF2qywZ62vBWbBCIeFguxaUfSMQB/i5OtCkbkLGzOCIMSKTyOiyj0m7omV0w==
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr3247759wmj.37.1576676533311;
 Wed, 18 Dec 2019 05:42:13 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id y6sm2578671wrl.17.2019.12.18.05.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 05:42:12 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v3 1/5] iommu: Implement generic_iommu_put_resv_regions()
Date: Wed, 18 Dec 2019 14:42:01 +0100
Message-Id: <20191218134205.1271740-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191218134205.1271740-1-thierry.reding@gmail.com>
References: <20191218134205.1271740-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

From: Thierry Reding <treding@nvidia.com>

Implement a generic function for removing reserved regions. This can be
used by drivers that don't do anything fancy with these regions other
than allocating memory for them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/iommu.c | 19 +++++++++++++++++++
 include/linux/iommu.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index fdd40756dbc1..101f2d68eb6e 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2229,6 +2229,25 @@ void iommu_put_resv_regions(struct device *dev, struct list_head *list)
 		ops->put_resv_regions(dev, list);
 }
 
+/**
+ * generic_iommu_put_resv_regions - Reserved region driver helper
+ * @dev: device for which to free reserved regions
+ * @list: reserved region list for device
+ *
+ * IOMMU drivers can use this to implement their .put_resv_regions() callback
+ * for simple reservations. Memory allocated for each reserved region will be
+ * freed. If an IOMMU driver allocates additional resources per region, it is
+ * going to have to implement a custom callback.
+ */
+void generic_iommu_put_resv_regions(struct device *dev, struct list_head *list)
+{
+	struct iommu_resv_region *entry, *next;
+
+	list_for_each_entry_safe(entry, next, list, list)
+		kfree(entry);
+}
+EXPORT_SYMBOL(generic_iommu_put_resv_regions);
+
 struct iommu_resv_region *iommu_alloc_resv_region(phys_addr_t start,
 						  size_t length, int prot,
 						  enum iommu_resv_type type)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 1b4fbe703950..2e06b31579c2 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -477,6 +477,8 @@ extern void iommu_set_fault_handler(struct iommu_domain *domain,
 
 extern void iommu_get_resv_regions(struct device *dev, struct list_head *list);
 extern void iommu_put_resv_regions(struct device *dev, struct list_head *list);
+extern void generic_iommu_put_resv_regions(struct device *dev,
+					   struct list_head *list);
 extern int iommu_request_dm_for_dev(struct device *dev);
 extern int iommu_request_dma_domain_for_dev(struct device *dev);
 extern void iommu_set_default_passthrough(bool cmd_line);
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
