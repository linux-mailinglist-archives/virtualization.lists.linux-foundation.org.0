Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EE319116F82
	for <lists.virtualization@lfdr.de>; Mon,  9 Dec 2019 15:50:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 80B31882A4;
	Mon,  9 Dec 2019 14:50:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZCbM80xrPK3; Mon,  9 Dec 2019 14:50:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E4F7F88189;
	Mon,  9 Dec 2019 14:50:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9669AC1DC9;
	Mon,  9 Dec 2019 14:50:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 519FAC0881;
 Mon,  9 Dec 2019 14:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3E42B87DDE;
 Mon,  9 Dec 2019 14:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6uvMXihm46Xw; Mon,  9 Dec 2019 14:50:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6890587F81;
 Mon,  9 Dec 2019 14:50:14 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so16583036wru.4;
 Mon, 09 Dec 2019 06:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kbWhKztcZroEY9HZuAqBCwxCkxfV0uGPkkrZZcpYU3k=;
 b=WohFdDSSvA/Lq0puBHpDkCHxitGoNFR5CPbiG8Gh21dQjYBEkHxEkHz5pt/EggFEGl
 MSvwQoA3HUt5LeOuCAVKw8u5l406d5KYqeeFyIeFPzsckZ7tZdkPITK7DSVqTN1HmmUa
 4jlRRbP20cLG2MJQUkku/EcxdimGb9pe30RNy/jg0N4fqT4rcp/oaGhGBcw66COjVv4U
 n50RxnFr9la4TIBdU9QlX9rBxSD5HoaS24xeu/PXIeqCxzva7HkNTNabB1YAzLW4TQbo
 JVFhCRcEHP3Lt66CiAAt32vwjUldm1KWQS2w2y2cDLyiBjRCa1/c7hKvPAxw2E9zGn5z
 zU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kbWhKztcZroEY9HZuAqBCwxCkxfV0uGPkkrZZcpYU3k=;
 b=BWVKeI4vapuCrrGMuUETISYTSo+GvNgBa0+0F2PxOQ5LS3LTs4zVY9DmH87AO7P6nd
 mJ9HX5m7CY9zXICb/cqWzg4KdK7jLk7ZyjsvWpECnamvJAtkwpl2FyzaGW/8eC30Eims
 9oUDbhJJ9gLOk/h4+0ldTU71bhp71QUTeKEk9TWvjelXRd8fYgYpLbYzV0fLNQnVjrq2
 V5UYHi0xJFnyDxllst6WidNqz61kGxshTnABWiL18rxXNasniqfoh6MoSn2uj0ygaxs4
 pwxEO6txT5VKFBT7bAOwGsSpPR3RyLI9M1wRNoS6yLSuzajSQWff7741NOh516yH1MW9
 LkMA==
X-Gm-Message-State: APjAAAWFfiSAp7/N0pkRYpkFYgzRUkZXC0gK5R79UJztPoGFRjKBHKyM
 WmNowvcBER4/WUE9trS/JXM=
X-Google-Smtp-Source: APXvYqzhZIggnLvtoyIgmYrF5RPdWaQ6t5xLlPHAXblTPP1Yw9lYQBIUb9qRPlNBGVW4ZHPpf+YYAg==
X-Received: by 2002:a5d:50d2:: with SMTP id f18mr2616447wrt.366.1575903012744; 
 Mon, 09 Dec 2019 06:50:12 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id u205sm10174718wmu.35.2019.12.09.06.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 06:50:11 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v2 1/5] iommu: Implement iommu_put_resv_regions_simple()
Date: Mon,  9 Dec 2019 15:50:03 +0100
Message-Id: <20191209145007.2433144-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209145007.2433144-1-thierry.reding@gmail.com>
References: <20191209145007.2433144-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
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
index db7bfd4f2d20..a46d3bcafa06 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2229,6 +2229,25 @@ void iommu_put_resv_regions(struct device *dev, struct list_head *list)
 		ops->put_resv_regions(dev, list);
 }
 
+/**
+ * iommu_put_resv_regions_simple - Reserved region driver helper
+ * @dev: device for which to free reserved regions
+ * @list: reserved region list for device
+ *
+ * IOMMU drivers can use this to implement their .put_resv_regions() callback
+ * for simple reservations. Memory allocated for each reserved region will be
+ * freed. If an IOMMU driver allocates additional resources per region, it is
+ * going to have to implement a custom callback.
+ */
+void iommu_put_resv_regions_simple(struct device *dev, struct list_head *list)
+{
+	struct iommu_resv_region *entry, *next;
+
+	list_for_each_entry_safe(entry, next, list, list)
+		kfree(entry);
+}
+EXPORT_SYMBOL(iommu_put_resv_regions_simple);
+
 struct iommu_resv_region *iommu_alloc_resv_region(phys_addr_t start,
 						  size_t length, int prot,
 						  enum iommu_resv_type type)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 1b4fbe703950..a249aa55596b 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -477,6 +477,8 @@ extern void iommu_set_fault_handler(struct iommu_domain *domain,
 
 extern void iommu_get_resv_regions(struct device *dev, struct list_head *list);
 extern void iommu_put_resv_regions(struct device *dev, struct list_head *list);
+extern void iommu_put_resv_regions_simple(struct device *dev,
+					  struct list_head *list);
 extern int iommu_request_dm_for_dev(struct device *dev);
 extern int iommu_request_dma_domain_for_dev(struct device *dev);
 extern void iommu_set_default_passthrough(bool cmd_line);
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
