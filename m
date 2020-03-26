Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 86503193C06
	for <lists.virtualization@lfdr.de>; Thu, 26 Mar 2020 10:36:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7172087148;
	Thu, 26 Mar 2020 09:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g2dow9C_W1dm; Thu, 26 Mar 2020 09:36:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E6AC8714E;
	Thu, 26 Mar 2020 09:36:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 857DFC0177;
	Thu, 26 Mar 2020 09:36:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48EC3C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2E9A5204AE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3MeyEqTl0MG8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:36:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by silver.osuosl.org (Postfix) with ESMTPS id B54FB2094E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:36:48 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id d1so6174752wmb.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 02:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lajplBTzvlJjjyB5d/rvr6mxgKf8jthOYH/0XMGJYKc=;
 b=tOIe/ldEqwY7T6oVRKLcieqlVoTJFQkrCmcTbJk+TxNDsbi+/4ULDAsTPtyGctvpZt
 k+Mfq15KYEGUaGb1yPlI/2X9Do/QAAoOSoDC/MBpJjyYZCDZspvOSNt+SvI8WtEZC4M0
 dmZ8AmrE1QMSd0xjwzV0YgmGcPhqw5MTmbokWBJe5IeKyRC4BOxF3oWWuC1QgSASzeTe
 cf9+pF8ml8319t/sb7LzZq2qfWB01xvbILuRMyVK5yy3uJMiBQ1CGnrTqWU2jCjmilxt
 AKDXUFW5E49gP1SKVe2+NGdu8wF73AyujQSlbM424IcJuas67XJXrbtpWA1ow3F109Ch
 eU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lajplBTzvlJjjyB5d/rvr6mxgKf8jthOYH/0XMGJYKc=;
 b=aE3SQaoTAhhmAgiHAAH/UmoBd0TuQiGQnxY9RCn2vy08s3aRS7IZcjmaakoaTGf+7/
 eF03hkQW9Rts7XNDJdFJvaY0odko12p1n9VbJRUoxjCMXTDiFtoIOs3GFs6pQjnNmcUc
 o4VhVl3W4ohuI0Dapt8HQMmHa8r/IYyGSu9e8TU4rmDZ/Y6S8Z63EivKPMbSdpB0RmOv
 mguCYNJRxiDS2Ix2kl4ZGFJsfJ7tf76zL+M1b2r96sT6eHSCBveEaO63W3jpvr1y8tSe
 ql+N8dIr8uQWu0EF2qi0ex3O2Y2wvXao77mVe9HHs4tw53Bejmp10OuvarpGsWMPRtyN
 9OFg==
X-Gm-Message-State: ANhLgQ3IH0eZNFBRHH6o+Zu6NXIuibbxN8EVh/GphvyHthVyyYsRV7r7
 7Tpp7ZPRbdw2nH8Xrtomxh5lfg==
X-Google-Smtp-Source: ADFU+vuY5MSZKCaL767WyqQNnptmDlZTfCQ4OZLTDBCvjrh4sKIYXa7lO+bG4W5+EiJ2BtAlIInK5g==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr2182434wmi.139.1585215407015; 
 Thu, 26 Mar 2020 02:36:47 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id u8sm2670165wrn.69.2020.03.26.02.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 02:36:46 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 1/3] iommu/virtio: Fix sparse warning
Date: Thu, 26 Mar 2020 10:35:56 +0100
Message-Id: <20200326093558.2641019-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200326093558.2641019-1-jean-philippe@linaro.org>
References: <20200326093558.2641019-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 kbuild test robot <lkp@intel.com>, mst@redhat.com, joro@8bytes.org,
 virtualization@lists.linux-foundation.org, eric.auger@redhat.com,
 bbhushan2@marvell.com
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

We copied the virtio_iommu_config from the virtio-iommu specification,
which declares the fields using little-endian annotations (for example
le32). Unfortunately this causes sparse to warn about comparison between
little- and cpu-endian, because of the typecheck() in virtio_cread():

drivers/iommu/virtio-iommu.c:1024:9: sparse: sparse: incompatible types in comparison expression (different base types):
drivers/iommu/virtio-iommu.c:1024:9: sparse:    restricted __le64 *
drivers/iommu/virtio-iommu.c:1024:9: sparse:    unsigned long long *
drivers/iommu/virtio-iommu.c:1036:9: sparse: sparse: incompatible types in comparison expression (different base types):
drivers/iommu/virtio-iommu.c:1036:9: sparse:    restricted __le64 *
drivers/iommu/virtio-iommu.c:1036:9: sparse:    unsigned long long *
drivers/iommu/virtio-iommu.c:1040:9: sparse: sparse: incompatible types in comparison expression (different base types):
drivers/iommu/virtio-iommu.c:1040:9: sparse:    restricted __le64 *
drivers/iommu/virtio-iommu.c:1040:9: sparse:    unsigned long long *
drivers/iommu/virtio-iommu.c:1044:9: sparse: sparse: incompatible types in comparison expression (different base types):
drivers/iommu/virtio-iommu.c:1044:9: sparse:    restricted __le32 *
drivers/iommu/virtio-iommu.c:1044:9: sparse:    unsigned int *
drivers/iommu/virtio-iommu.c:1048:9: sparse: sparse: incompatible types in comparison expression (different base types):
drivers/iommu/virtio-iommu.c:1048:9: sparse:    restricted __le32 *
drivers/iommu/virtio-iommu.c:1048:9: sparse:    unsigned int *
drivers/iommu/virtio-iommu.c:1052:9: sparse: sparse: incompatible types in comparison expression (different base types):
drivers/iommu/virtio-iommu.c:1052:9: sparse:    restricted __le32 *
drivers/iommu/virtio-iommu.c:1052:9: sparse:    unsigned int *

Although virtio_cread() does convert virtio-endian (in our case
little-endian) to cpu-endian, the typecheck() needs the two arguments to
have the same endianness. Do as UAPI headers of other virtio devices do,
and remove the endian annotation from the device config.

Even though we change the UAPI this shouldn't cause any regression since
QEMU, the existing implementation of virtio-iommu that uses this header,
already removes the annotations when importing headers.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/uapi/linux/virtio_iommu.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/virtio_iommu.h b/include/uapi/linux/virtio_iommu.h
index 237e36a280cb..48e3c29223b5 100644
--- a/include/uapi/linux/virtio_iommu.h
+++ b/include/uapi/linux/virtio_iommu.h
@@ -18,24 +18,24 @@
 #define VIRTIO_IOMMU_F_MMIO			5
 
 struct virtio_iommu_range_64 {
-	__le64					start;
-	__le64					end;
+	__u64					start;
+	__u64					end;
 };
 
 struct virtio_iommu_range_32 {
-	__le32					start;
-	__le32					end;
+	__u32					start;
+	__u32					end;
 };
 
 struct virtio_iommu_config {
 	/* Supported page sizes */
-	__le64					page_size_mask;
+	__u64					page_size_mask;
 	/* Supported IOVA range */
 	struct virtio_iommu_range_64		input_range;
 	/* Max domain ID size */
 	struct virtio_iommu_range_32		domain_range;
 	/* Probe buffer size */
-	__le32					probe_size;
+	__u32					probe_size;
 };
 
 /* Request types */
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
