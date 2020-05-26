Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BBB1A7FAE
	for <lists.virtualization@lfdr.de>; Tue, 14 Apr 2020 16:26:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 962BD86B49;
	Tue, 14 Apr 2020 14:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4QjMUmnGk0+v; Tue, 14 Apr 2020 14:26:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CB131862C7;
	Tue, 14 Apr 2020 14:26:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7AB0C0172;
	Tue, 14 Apr 2020 14:26:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25913C0172;
 Tue, 14 Apr 2020 14:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1243187952;
 Tue, 14 Apr 2020 14:26:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 56zNRuizqjkZ; Tue, 14 Apr 2020 14:26:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1C98285EE7;
 Tue, 14 Apr 2020 14:26:40 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DDC06206D5;
 Tue, 14 Apr 2020 14:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586874399;
 bh=Lg63bhefJlO92twb2XXVp+1t8BwepRn5XnGnurXtetQ=;
 h=From:To:Cc:Subject:Date:From;
 b=uxpH/vrmPABKmIKPEaXtjZRXOWqmXB7aJg1kyMsfQwLf3BH71MoyWyHJ6WWObYhRZ
 co//xuRia8Oomk9lg9TB2YoqWRLvV8PBGuY6TH6OACuukY5Nj8Z9DpaD/YeRi0iP6y
 gX+kh1B4WnpB+e8Rb6vhPqgGBfLcRl5kfotrslEA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH] iommu: spapr_tce: Disable compile testing to fix build on
 book3s_32 config
Date: Tue, 14 Apr 2020 16:26:30 +0200
Message-Id: <20200414142630.21153-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 virtualization@lists.linux-foundation.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Although SPAPR_TCE_IOMMU itself can be compile tested on certain PowerPC
configurations, its presence makes arch/powerpc/kvm/Makefile to select
modules which do not build in such configuration.

The arch/powerpc/kvm/ modules use kvm_arch.spapr_tce_tables which exists
only with CONFIG_PPC_BOOK3S_64.  However these modules are selected when
COMPILE_TEST and SPAPR_TCE_IOMMU are chosen leading to build failures:

    In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:0,
                     from arch/powerpc/kvm/book3s_64_vio_hv.c:22:
    arch/powerpc/include/asm/book3s/64/pgtable.h:17:0: error: "_PAGE_EXEC" redefined [-Werror]
     #define _PAGE_EXEC  0x00001 /* execute permission */

    In file included from arch/powerpc/include/asm/book3s/32/pgtable.h:8:0,
                     from arch/powerpc/include/asm/book3s/pgtable.h:8,
                     from arch/powerpc/include/asm/pgtable.h:18,
                     from include/linux/mm.h:95,
                     from arch/powerpc/include/asm/io.h:29,
                     from include/linux/io.h:13,
                     from include/linux/irq.h:20,
                     from arch/powerpc/include/asm/hardirq.h:6,
                     from include/linux/hardirq.h:9,
                     from include/linux/kvm_host.h:7,
                     from arch/powerpc/kvm/book3s_64_vio_hv.c:12:
    arch/powerpc/include/asm/book3s/32/hash.h:29:0: note: this is the location of the previous definition
     #define _PAGE_EXEC 0x200 /* software: exec allowed */

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: e93a1695d7fb ("iommu: Enable compile testing for some of drivers")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 58b4a4dbfc78..3532b1ead19d 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -362,7 +362,7 @@ config IPMMU_VMSA
 
 config SPAPR_TCE_IOMMU
 	bool "sPAPR TCE IOMMU Support"
-	depends on PPC_POWERNV || PPC_PSERIES || (PPC && COMPILE_TEST)
+	depends on PPC_POWERNV || PPC_PSERIES
 	select IOMMU_API
 	help
 	  Enables bits of IOMMU API required by VFIO. The iommu_ops
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
