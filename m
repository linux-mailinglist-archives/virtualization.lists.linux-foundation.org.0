Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D35E15DF11
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 17:07:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A1BB81FCB;
	Fri, 14 Feb 2020 16:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jruGnxE3k-86; Fri, 14 Feb 2020 16:07:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 709AD85E5E;
	Fri, 14 Feb 2020 16:07:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D27EC0177;
	Fri, 14 Feb 2020 16:07:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9BE5C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4617485EF2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pv-Mw8Jzu5fW
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:07:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8DDD986A9B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:06:57 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u6so11547649wrt.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 08:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=skMhNoTugJ6zTST/t+E4o/R9M7w7is4uxoA6SOGqsOo=;
 b=fdOPmNYPBxSQT0jzJbJlZa3aOnpBcmQ+NPrr4Xy/noKSZhKiX9i700NF6ESveRM+Lv
 xTlEA1Dwu5xMjQ894g+vUCiUoiXJGH+9uqSEd9o2xzn1WnXBxozF1VYbMXmoEsWOI7Ry
 VttQ14b8IQqqdioUurOE0pSQgDT+LFulxpzhp8JiELjG1etHKs2URbJKkPzfQT0G9AVW
 l+jYo4OTMH9FxAWzZoIlKcG2Fb8KRGv+u1ESgU+kpLZWNwv13bfAppOjhXZ6quP3XM1U
 Pad34GfIYydgU733zs8YsgE+pFsFictetmwnoEgjad+U0KtYYSRY9thw1TtP3FGx8H5B
 IPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=skMhNoTugJ6zTST/t+E4o/R9M7w7is4uxoA6SOGqsOo=;
 b=cQ7o8JqDjlhSYA1TYY3J2ohDeKTAKizVcV7SCggOFq3eLec6DAxeXVHkVl6l1jebBL
 0WveUOPPxJOo2aarwXZYO0/PEvrfxoiCTktDJKDy3tjIFL0pwN4SoJgfkfst012IZvDf
 0NOOw6mJF0lgEJ5MlEbCokQ0uizqgFHV2xBaVzLCZfORm9LFCQl1V01Oa2KOm60cF1x2
 Axi5lzEY8HjMo69BpuX3LAFCFthjMpcKr1o95H4sptg8I7Qjy2yY4L3FAuR7ciLqZqnT
 afbrm7w71U70IjZ//jhx7F71X3835WzxL/NuPRL0WRbgwQMF5hqCVMC86rXWy+Nq0q/5
 Nkwg==
X-Gm-Message-State: APjAAAUllXei9qwRTBcR3g3YFiUQMfK+Co2WgC75o6QwBEzjrHbvH+Mo
 CMQa8wDvl8+DxpUyCP8852ZNtw==
X-Google-Smtp-Source: APXvYqxyqmg7e8LeAx5P9P0xO6XsDZ38hCrdbxzCLwg/PkzE30ga5qHV2iVyIHRd9cU6DZhhE39m0A==
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr4652778wrp.167.1581696416079; 
 Fri, 14 Feb 2020 08:06:56 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id s139sm8133213wme.35.2020.02.14.08.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 08:06:55 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org
Subject: [PATCH 3/3] iommu/virtio: Enable x86 support
Date: Fri, 14 Feb 2020 17:04:13 +0100
Message-Id: <20200214160413.1475396-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214160413.1475396-1-jean-philippe@linaro.org>
References: <20200214160413.1475396-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: mst@redhat.com, joro@8bytes.org, eric.auger@redhat.com,
 sebastien.boeuf@intel.com, jacob.jun.pan@intel.com, bhelgaas@google.com
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

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 068d4e0e3541..adcbda44d473 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -508,8 +508,9 @@ config HYPERV_IOMMU
 config VIRTIO_IOMMU
 	bool "Virtio IOMMU driver"
 	depends on VIRTIO=y
-	depends on ARM64
+	depends on (ARM64 || X86)
 	select IOMMU_API
+	select IOMMU_DMA
 	select INTERVAL_TREE
 	help
 	  Para-virtualised IOMMU driver with virtio.
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
