Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BB28F173E89
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 18:29:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6CE5B22686;
	Fri, 28 Feb 2020 17:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZR-GvPxupGhW; Fri, 28 Feb 2020 17:29:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4D61822661;
	Fri, 28 Feb 2020 17:29:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31542C0177;
	Fri, 28 Feb 2020 17:29:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D995C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8956688222
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQ0QjJpc1EgK
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:29:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 016A288265
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:29:10 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id e10so2422572wrr.10
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 09:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jos+UmzK8Hc9Z4PLlKLT5wM1USAOZpd5S+CdEr/za4M=;
 b=yZGrvgqQ3a9ydAmqTudY9IPdx/DjncbPCa+rQvZU9WCCULTVwu2UGa5TOBot6AcdAG
 Kea81JX8LljjFV+j8BdSJpCyXxETCHdToyup/qvOs2Kn/fZyBQP4EcHVQVMY//0PDYs8
 SwcXTnK7YZ6v3S+y6nKkPQibqpCdCoHJqW4g0nJu/BIO9DBIa3lGcvtNA2prifHT/Oxw
 mIbbtRN7Vlm0MUeryNgWY+DQRCOUVg7Y7AL5rM3IrhRJM50B+aLgnA02feYoB5UL1UQX
 OV1jj+4Aepoo957kJ/DUrhNRR3P3hpqS7hEv+rVY3PJ+0f87zExAbBJD5I+PfPnq0iQz
 2xAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jos+UmzK8Hc9Z4PLlKLT5wM1USAOZpd5S+CdEr/za4M=;
 b=SGF18Z05EKaYrj8KSXQD8UHkm+P0rtNnBUsgFEDTDBzttcxWRlfqtsU6RewDSF+NC4
 3mS/JmXqN/F1mHdJqWfTTEPLg/r4HlPqp/oPESOI4aWO/mi5dTGlpZExOeEMqtn+x7K+
 5dbv9SIuQQoAuuB+FxIm8xZxiNoMkS3fO9ibk2twmnEmPGQB0x7wQKMExjZ7GiJmhtFn
 Fduk6Gamgu3VcbFR6R2yFaJ2fS9UpHWRF42d+T6pfM0Br+c7tBZMcS8at8AH7AfXdwV6
 4j9DyCc2N3lRh0lA/hYlMGImM/6nQlklYC2dfNUesvOOlve1emiZmz2SQAGiwkPMR6++
 3rdw==
X-Gm-Message-State: APjAAAXtG16MvFv9a1N1likH/Lduj0R5KzGeJmqWV0Fj8ePZdPS33JKU
 DPzCm+P2MoVdP6Lyr3n1KvNP4Q==
X-Google-Smtp-Source: APXvYqzT3P7sA/CZ/b1UMh6+05HJ/72/05Zr7K58Lo6dOwmy5w3WAhfYStmzvZK+P8kUpQEHVNKUng==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr5683415wrj.196.1582910948537; 
 Fri, 28 Feb 2020 09:29:08 -0800 (PST)
Received: from localhost.localdomain
 ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id m125sm3004795wmf.8.2020.02.28.09.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 09:29:08 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org
Subject: [PATCH v2 3/3] iommu/virtio: Enable x86 support
Date: Fri, 28 Feb 2020 18:25:38 +0100
Message-Id: <20200228172537.377327-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200228172537.377327-1-jean-philippe@linaro.org>
References: <20200228172537.377327-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, mst@redhat.com,
 joro@8bytes.org, eric.auger@redhat.com, sebastien.boeuf@intel.com,
 jacob.jun.pan@intel.com, bhelgaas@google.com, robin.murphy@arm.com
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

With the built-in topology description in place, x86 platforms can now
use the virtio-iommu.

Architectures that use the generic iommu_dma_ops should normally select
CONFIG_IOMMU_DMA themselves (from arch/*/Kconfig). Since not all x86
drivers have been converted yet, it's currently up to the IOMMU Kconfig
to select it.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index f8cb45d84bb0..87efc48c244e 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -508,8 +508,9 @@ config HYPERV_IOMMU
 config VIRTIO_IOMMU
 	tristate "Virtio IOMMU driver"
 	depends on VIRTIO
-	depends on ARM64
+	depends on (ARM64 || X86)
 	select IOMMU_API
+	select IOMMU_DMA if X86
 	select INTERVAL_TREE
 	help
 	  Para-virtualised IOMMU driver with virtio.
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
