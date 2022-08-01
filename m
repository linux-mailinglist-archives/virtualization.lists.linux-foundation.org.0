Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A646B586F06
	for <lists.virtualization@lfdr.de>; Mon,  1 Aug 2022 18:51:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B812409EB;
	Mon,  1 Aug 2022 16:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B812409EB
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CtqRoory
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ajBeZ5QmkcnI; Mon,  1 Aug 2022 16:51:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B45DD409ED;
	Mon,  1 Aug 2022 16:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B45DD409ED
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9188C0071;
	Mon,  1 Aug 2022 16:51:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E98B2C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Aug 2022 16:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE26E60B96
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Aug 2022 16:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE26E60B96
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=CtqRoory
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVOzsyad04Oa
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Aug 2022 16:51:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E666605B2
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E666605B2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Aug 2022 16:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659372697; x=1690908697;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+4xX1yVvA2wu0xZxhzDmYNktoQ+T+Qf9rMWkxS3Rkfs=;
 b=CtqRooryGK+jDa8XnUt6eCu8X+UeVq11kF3tCArG+WFzzPfafYL3y70S
 7yXk8KHyKQV4v6CV9Ng4HE6a9XHSlOUILCw4ugq4C45HO1UH5JS8wQErw
 +/Z5pJeS0SXJCbetK6fK7f32x8RvCt6NxtPrCnzzrS8Wqg2lPo+S3H7Up
 tztNIwDSte7dV7Z9tlJdDrTVkASrr43UAI5dsQuU9cislbk9vRzH3OhJ7
 xXoQEnZ7U3gnm8SxD710YEb450Fo3TTy2C4ERJ0bbsEPbu08VOLQqOvnF
 Yp9cbWgOKjreXHn+rDfI4gmqIKZBemJ0owQ83UKT87xbRaHmS3TxKxcEq A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="272237617"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="272237617"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 09:51:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="577852276"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 01 Aug 2022 09:51:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 77907F7; Mon,  1 Aug 2022 19:51:44 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Joerg Roedel <jroedel@suse.de>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 virtualization@lists.linux-foundation.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] iommu/virtio: Do not dereference fwnode in struct
 device
Date: Mon,  1 Aug 2022 19:51:42 +0300
Message-Id: <20220801165142.20898-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Will Deacon <will@kernel.org>
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

In order to make the underneath API easier to change in the future,
prevent users from dereferencing fwnode from struct device.
Instead, use the specific device_match_fwnode() API for that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/iommu/virtio-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 08eeafc9529f..9fe723f55213 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -925,7 +925,7 @@ static struct virtio_driver virtio_iommu_drv;
 
 static int viommu_match_node(struct device *dev, const void *data)
 {
-	return dev->parent->fwnode == data;
+	return device_match_fwnode(dev->parent, data);
 }
 
 static struct viommu_dev *viommu_get_by_fwnode(struct fwnode_handle *fwnode)
-- 
2.35.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
