Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A233C181C81
	for <lists.virtualization@lfdr.de>; Wed, 11 Mar 2020 16:41:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 457FC86AFD;
	Wed, 11 Mar 2020 15:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJrU2_LZ1q_j; Wed, 11 Mar 2020 15:41:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AEABB85F6E;
	Wed, 11 Mar 2020 15:41:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89D96C0177;
	Wed, 11 Mar 2020 15:41:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99540C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 15:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 79AE987FE3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 15:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9t-b5wEeeBj
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 15:40:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1ABB387FF7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 15:40:59 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f7so2662483wml.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lajplBTzvlJjjyB5d/rvr6mxgKf8jthOYH/0XMGJYKc=;
 b=iFRsn/tWLGJxUoYS0QTEb0Coa/gBFt+DxOg+dad/gPzyHb6nvl+cK1Qu48y8CHzQb0
 HwK3VJz+//C2cw7u//eTON6spin3eQwyCpVGYLyc7NIvO+Y7/RqKIIpoDVFmuEtXIj7m
 hqGtykXkXnOFOAZNEFD3Z61SbZt9BIOlYdBx7Qc1Nqr9RS5f7vWV0Tqrgj0eWka0qZZH
 C4Z5Za55/P8TASnqN4btDns9uKVp5IPiJdLOdZWoCtUZ9W6XbjtO5X74efiRXCqthj/F
 oAhJ7J+iq47OT3M5swXYo0BMt06Yp1vP0C/GtA5pFPtdQ7jQCUyXi8lBg64eB7uwe7Bz
 Ds1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lajplBTzvlJjjyB5d/rvr6mxgKf8jthOYH/0XMGJYKc=;
 b=K4e9+c3ru3ZHscop4WA7EFsAkAMX5sTwTf67cr0pk79edeyEH/vBzbdQFQvvkJLLPc
 MVFgTSKBqwfZZde4S7Y/wYjeH8jx3CHfwyfOU2OSJyhS0wTLs3MVkPipr61V5dqDV+iH
 fFj9i6jx2WYKUJ6t9/5qav2rPQybh09DIJjhglralJrxLPnA6uRmxId0C2QVsl7GpZDd
 fXdRccoOnt11c6ahEeeciQltV9T/RmFcCkeQDA90jdWakU9g+8Y/xa5Jq5qd8uW2Dmii
 Mykbhvq/venKUDJQMuYwdYs2xc+y8ifDy5pN/ne9LZ0zsd6jtEC7Y4+emb0MyiPvXQu7
 QTaA==
X-Gm-Message-State: ANhLgQ3wdP3/QIEJpjBwBA0JUXvQe/eB79hBjSWKkCT4tE/S5yCHeqU0
 cx5kp9NASD33KDomqMUemmGBZvo5Nzg=
X-Google-Smtp-Source: ADFU+vt8V004a4WrfpUPdeVaXXMFH81UZn6Z1lH3jZVS+w4cP5grymOV9nN2hKpQpKst+bhbnoMQcQ==
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr4383653wmc.39.1583941257161; 
 Wed, 11 Mar 2020 08:40:57 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id k126sm8789098wme.4.2020.03.11.08.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 08:40:56 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH] iommu/virtio: Fix sparse warning
Date: Wed, 11 Mar 2020 16:39:36 +0100
Message-Id: <20200311153936.386178-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 kbuild test robot <lkp@intel.com>, mst@redhat.com, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org
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
