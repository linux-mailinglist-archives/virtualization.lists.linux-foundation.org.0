Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A7F193C04
	for <lists.virtualization@lfdr.de>; Thu, 26 Mar 2020 10:36:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 56F9788495;
	Thu, 26 Mar 2020 09:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9I5uWMqr65a; Thu, 26 Mar 2020 09:36:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2712E884A1;
	Thu, 26 Mar 2020 09:36:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1063AC1D85;
	Thu, 26 Mar 2020 09:36:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41129C1831
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1CFD68712A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHKzyAEhVPf0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:36:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C36E486CAC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:36:49 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j17so6769446wru.13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 02:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j471hzdxUAR7EU6PCnbMP3ieYDtBrBQiNzMOXYZJCHM=;
 b=hahwN8lBsOe0HldVvgYxNZyiM1sk0fbN+/opi0glHvk6UhNTj5xexzfNSZ9UquiFmp
 tJjeLxv+EoCg4ngONz4sSLRGDe+iDylpaGh/MTs/RHbZL/qCMKaGgng0SngG4iFUVh1v
 Vgp0EZzrmWFRsqzkqa26TTJWLh3J437xnpEqywG+wOB/VZ/2wbB9jLkpXkZiZSqeIovk
 JPols3O1PmTGpp5cdN1DN+TMeBaYv/XMbADdCjvVkky70crkSa5UF/NCT//Q5dwuLYXA
 r3eVVPbwVAr1AtInHCdqxnbGHcgSmx6G0G5ucTLtbskDa/gmZ1nyGYtfX9HhbGtFBnU/
 dhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j471hzdxUAR7EU6PCnbMP3ieYDtBrBQiNzMOXYZJCHM=;
 b=cTjBsyOSK/lt/tZdc/xotRrOGLrga2ZuqAyJFvcJz3pK2Vtpb3FXQivA9HI++Y9k5x
 Q9cMF8isQjh/LpfB7L8YgZ2QBk2USr+S5grP0WdqEoZvaruc4cO/wjikoS6w94C4KkN8
 P46aIQQX6LgrSZBXKSf7BhmJUgCd+GofIjQDJfYipaDYTmZLoyPfhcSN/J7n9sfA9poJ
 oAC40tq/IKkNFXPxYePdjCKDSfiq23OD2q22HuiyGfcZr48ClKobK8Cub/JEM7W7avOJ
 xi8lwTVz+AlG0KbzaIaG9k/f5/5TDbJ10evFbJ3VECs+nI/9N5LRyK7VqXcxeZ/LNItN
 WSFg==
X-Gm-Message-State: ANhLgQ1jvyehAztThy/23RZYxoZQY4TOf5Mwu1gUITyfgKk8jfFuuaO6
 zz+ztV1GP7eQCzH651WMDf/f7g==
X-Google-Smtp-Source: ADFU+vsM5lxFML11UASi2+uT04jXEQnY07dpdp4rWBE43fHIdyDlKVDxcTsYUYPllzibVzqM6L348A==
X-Received: by 2002:adf:f401:: with SMTP id g1mr1783646wro.140.1585215407914; 
 Thu, 26 Mar 2020 02:36:47 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id u8sm2670165wrn.69.2020.03.26.02.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 02:36:47 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 2/3] iommu/virtio: Fix freeing of incomplete domains
Date: Thu, 26 Mar 2020 10:35:57 +0100
Message-Id: <20200326093558.2641019-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200326093558.2641019-1-jean-philippe@linaro.org>
References: <20200326093558.2641019-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, mst@redhat.com,
 joro@8bytes.org, virtualization@lists.linux-foundation.org,
 eric.auger@redhat.com, bbhushan2@marvell.com
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

Calling viommu_domain_free() on a domain that hasn't been finalised (not
attached to any device, for example) can currently cause an Oops,
because we attempt to call ida_free() on ID 0, which may either be
unallocated or used by another domain.

Only initialise the vdomain->viommu pointer, which denotes a finalised
domain, at the end of a successful viommu_domain_finalise().

Fixes: edcd69ab9a32 ("iommu: Add virtio-iommu driver")
Reported-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/virtio-iommu.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index cce329d71fba..5eed75cd121f 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -613,18 +613,20 @@ static int viommu_domain_finalise(struct viommu_dev *viommu,
 	int ret;
 	struct viommu_domain *vdomain = to_viommu_domain(domain);
 
-	vdomain->viommu		= viommu;
-	vdomain->map_flags	= viommu->map_flags;
+	ret = ida_alloc_range(&viommu->domain_ids, viommu->first_domain,
+			      viommu->last_domain, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	vdomain->id		= (unsigned int)ret;
 
 	domain->pgsize_bitmap	= viommu->pgsize_bitmap;
 	domain->geometry	= viommu->geometry;
 
-	ret = ida_alloc_range(&viommu->domain_ids, viommu->first_domain,
-			      viommu->last_domain, GFP_KERNEL);
-	if (ret >= 0)
-		vdomain->id = (unsigned int)ret;
+	vdomain->map_flags	= viommu->map_flags;
+	vdomain->viommu		= viommu;
 
-	return ret > 0 ? 0 : ret;
+	return 0;
 }
 
 static void viommu_domain_free(struct iommu_domain *domain)
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
