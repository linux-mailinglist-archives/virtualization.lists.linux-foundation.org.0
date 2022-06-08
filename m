Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C7144542F6E
	for <lists.virtualization@lfdr.de>; Wed,  8 Jun 2022 13:48:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEE5040544;
	Wed,  8 Jun 2022 11:48:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ievd0OAee_fR; Wed,  8 Jun 2022 11:48:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4DB8C404BF;
	Wed,  8 Jun 2022 11:48:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7FA6C0081;
	Wed,  8 Jun 2022 11:48:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FDF9C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jun 2022 11:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA5A540360
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jun 2022 11:48:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-FkekMrFR_Q
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jun 2022 11:48:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F04840002
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jun 2022 11:48:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C0F6143D;
 Wed,  8 Jun 2022 04:48:32 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DB5053F73B;
 Wed,  8 Jun 2022 04:48:30 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH] vdpa: Use device_iommu_capable()
Date: Wed,  8 Jun 2022 12:48:26 +0100
Message-Id: <548e316fa282ce513fabb991a4c4d92258062eb5.1654688822.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.36.1.dirty
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Use the new interface to check the capability for our device
specifically.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/vhost/vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 935a1d0ddb97..4cfebcc24a03 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -1074,7 +1074,7 @@ static int vhost_vdpa_alloc_domain(struct vhost_vdpa *v)
 	if (!bus)
 		return -EFAULT;
 
-	if (!iommu_capable(bus, IOMMU_CAP_CACHE_COHERENCY))
+	if (!device_iommu_capable(dma_dev, IOMMU_CAP_CACHE_COHERENCY))
 		return -ENOTSUPP;
 
 	v->domain = iommu_domain_alloc(bus);
-- 
2.36.1.dirty

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
