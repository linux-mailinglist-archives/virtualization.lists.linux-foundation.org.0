Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3780CA180B
	for <lists.virtualization@lfdr.de>; Thu, 29 Aug 2019 13:19:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A94414705;
	Thu, 29 Aug 2019 11:18:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F0FFC4692;
	Thu, 29 Aug 2019 11:18:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 572353D0;
	Thu, 29 Aug 2019 11:18:01 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id h8so3640554edv.7;
	Thu, 29 Aug 2019 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LdftSop4FAsgnu90xfPUb4VrwQYO3xWAqeCbQKmpXAw=;
	b=bR79jPl4rvUQxfm/WZpDq1DyXQdI5dFimvOylxLHdkb6p1bhrXYKf9MmrYBl0/NDfV
	3V0KXZcPjjyMW0Belo7iCxQHNnIV4kIOv09BCxcK2bbYCuy695AwiO5eh4dkivJzOPKc
	AQX69shgH8Hhh9F4L157CtTqKJnmGJ20ptg1GLQUxcxxi9NIOE3VFHT/Z2pg0PENmrCs
	L2RdKj9PwDhdL3ESrxoGYFkv6tO/e0YcUDV5wGhUCm74kKP2i+6S2/9RinrAlhMWlMYf
	9324oZ4PMlQsWRAeyKt88/GdGQpGRSFGCLerBTv+jtU6zc6/5toHP64wwZubb1VwbtS6
	0pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LdftSop4FAsgnu90xfPUb4VrwQYO3xWAqeCbQKmpXAw=;
	b=rLXwNBAHzGOigsCchejIWCQ8fvhtxB//BOi3LUIAWsGXzG09+y2pzxkRz5O8LESdVl
	V4FCqH0huHztBcvmZNj8kQUr54ACKJAOiJq9OUEqnxZObRKGqf0iEkpUGZLgEzEyPdHk
	TENYY9NOCPGxJ2Au5kGPpkPhbwF7D32dxdR0F3w2Y5QHfZNN55UCWtRkNDsZF01E+pMi
	FwHZP6oMRrD00js24x3OvCUEeCiiHKMwE+RVdt+jCKOA0BS9PomF0mIQl6qlvo/NR3mv
	t9HRCwhGdMwE8Vw6zWvGEFY6zqDUEKa52wziDNxnacH5oM9+RcR5fQMY/XbScZ9aVZbQ
	mhog==
X-Gm-Message-State: APjAAAUjW0zHTTm0m2sOLgfjHt/qoU/vgqshmqHE0V9AsP510vr6Ku+M
	bLE0ehLOTxoPJsOutgD4Aug=
X-Google-Smtp-Source: APXvYqx6xumvHaa0FS6ceR4LYkovD8dan+j5kQuVNZo88mSfLqaVgTKRmRZEKXv0Df7oSZRTvjLY2Q==
X-Received: by 2002:aa7:df03:: with SMTP id c3mr9130739edy.112.1567077479905; 
	Thu, 29 Aug 2019 04:17:59 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
	by smtp.gmail.com with ESMTPSA id w3sm390212edq.12.2019.08.29.04.17.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 04:17:59 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 3/5] iommu: amd: Use iommu_put_resv_regions_simple()
Date: Thu, 29 Aug 2019 13:17:50 +0200
Message-Id: <20190829111752.17513-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829111752.17513-1-thierry.reding@gmail.com>
References: <20190829111752.17513-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
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

From: Thierry Reding <treding@nvidia.com>

Use the new standard function instead of open-coding it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/amd_iommu.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 04a9f8443344..7d8896d5fab9 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -3160,15 +3160,6 @@ static void amd_iommu_get_resv_regions(struct device *dev,
 	list_add_tail(&region->list, head);
 }
 
-static void amd_iommu_put_resv_regions(struct device *dev,
-				     struct list_head *head)
-{
-	struct iommu_resv_region *entry, *next;
-
-	list_for_each_entry_safe(entry, next, head, list)
-		kfree(entry);
-}
-
 static void amd_iommu_apply_resv_region(struct device *dev,
 				      struct iommu_domain *domain,
 				      struct iommu_resv_region *region)
@@ -3216,7 +3207,7 @@ const struct iommu_ops amd_iommu_ops = {
 	.remove_device = amd_iommu_remove_device,
 	.device_group = amd_iommu_device_group,
 	.get_resv_regions = amd_iommu_get_resv_regions,
-	.put_resv_regions = amd_iommu_put_resv_regions,
+	.put_resv_regions = iommu_put_resv_regions_simple,
 	.apply_resv_region = amd_iommu_apply_resv_region,
 	.is_attach_deferred = amd_iommu_is_attach_deferred,
 	.pgsize_bitmap	= AMD_IOMMU_PGSIZES,
-- 
2.22.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
