Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E06A1814
	for <lists.virtualization@lfdr.de>; Thu, 29 Aug 2019 13:19:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 84F3F4700;
	Thu, 29 Aug 2019 11:18:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AD6704692;
	Thu, 29 Aug 2019 11:18:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1A437EC;
	Thu, 29 Aug 2019 11:18:03 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id a21so3603763edt.11;
	Thu, 29 Aug 2019 04:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zCsgPCFvt5f0JhV5AAX71J7KrOE6T7Mwp2HnksazGlw=;
	b=o9IDb9wxTMVYl4Pw8eOl4MN8lrxcZAgdJUKaGojaGYK4aXQr34VjDZVfYu/QzbxvqH
	jcCWwyi0BumBzhg17grPUPMX9d7OIgI5av0bWjFUbC977dHLo8th+91iEI5NqBvmCODo
	2I3V9bM1lkU74SfOvgyAH+sAwFQaQIwE71r0I8lfv/K+OUYHnZS9/sjDBKzPpsDxCoCn
	WgY397r5bRinjlufn59iqnqRz6E+fEu4qAdIk6TUiefpKTyqVSbCUYkNOe3WtgxV1IBt
	qYjcwXUI9MXenjs8NrD+DbvJhsyZkQBDBJupkrQjvHkmXTxgcdrcmmtuR0K+kKiHNVj1
	gkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zCsgPCFvt5f0JhV5AAX71J7KrOE6T7Mwp2HnksazGlw=;
	b=m0W74dN8e+dcgx+zgJE2HValJK4OJvyK2eKDck+q/E+5wDjJeeeUCC8fQRJ8KebrE4
	kjGzu6EDvi1lk8wwAv35VtVLI/zP/+W0CHUhG2KO7K+AlZhgDky3Py9W5kq5Z6W5aqhg
	12SSKt2A8badGQfCrAaHpbUDPx/zGbemPe/RkXhCKU4lL96YxiTB4ePEYJRQTTVIL/PY
	XD6RdxlmKgra3W1GfAytUIRGEoInNP9m0Q2/g7M+JVmELxjtwkqns/JDk650i3wSvvIu
	/wT9QWWMaHQrTZn13udbykwFlPm4HN82pMre/gBjKt7tYItsnzbd4lSeI25+wjOjjEdI
	X5hg==
X-Gm-Message-State: APjAAAXhc2HSytNSUet9SzYWqin4Dj62clPi3e38cT3DnQU0ZimQbJeu
	t/VpBU0s40a5hox7rYM9WzE=
X-Google-Smtp-Source: APXvYqwM8CVbq0FXN38b8oxKuaYKC/x8VDD3uqRU7eQrkpe6K2cwtpE+e448Jg8Ofr+6OyhLfBDXpw==
X-Received: by 2002:a17:906:6bc4:: with SMTP id
	t4mr7875881ejs.256.1567077481688; 
	Thu, 29 Aug 2019 04:18:01 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
	by smtp.gmail.com with ESMTPSA id n93sm215670edc.5.2019.08.29.04.18.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 04:18:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 4/5] iommu: intel: Use iommu_put_resv_regions_simple()
Date: Thu, 29 Aug 2019 13:17:51 +0200
Message-Id: <20190829111752.17513-5-thierry.reding@gmail.com>
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

Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/intel-iommu.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 4658cda6f3d2..2fe5da41c786 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -5386,15 +5386,6 @@ static void intel_iommu_get_resv_regions(struct device *device,
 	list_add_tail(&reg->list, head);
 }
 
-static void intel_iommu_put_resv_regions(struct device *dev,
-					 struct list_head *head)
-{
-	struct iommu_resv_region *entry, *next;
-
-	list_for_each_entry_safe(entry, next, head, list)
-		kfree(entry);
-}
-
 int intel_iommu_enable_pasid(struct intel_iommu *iommu, struct device *dev)
 {
 	struct device_domain_info *info;
@@ -5629,7 +5620,7 @@ const struct iommu_ops intel_iommu_ops = {
 	.add_device		= intel_iommu_add_device,
 	.remove_device		= intel_iommu_remove_device,
 	.get_resv_regions	= intel_iommu_get_resv_regions,
-	.put_resv_regions	= intel_iommu_put_resv_regions,
+	.put_resv_regions	= iommu_put_resv_regions_simple,
 	.apply_resv_region	= intel_iommu_apply_resv_region,
 	.device_group		= pci_device_group,
 	.dev_has_feat		= intel_iommu_dev_has_feat,
-- 
2.22.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
