Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 630171FCB26
	for <lists.virtualization@lfdr.de>; Wed, 17 Jun 2020 12:44:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 18DC9879C9;
	Wed, 17 Jun 2020 10:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w6V1FnN4_4m8; Wed, 17 Jun 2020 10:44:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8846F879FE;
	Wed, 17 Jun 2020 10:44:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C64FC016E;
	Wed, 17 Jun 2020 10:44:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48551C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 10:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 27C1E8841E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 10:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7xiYOT3jiMb9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 10:44:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4F35A883FD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 10:44:12 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05HAWLN0072005; Wed, 17 Jun 2020 06:44:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31q6j0j2kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jun 2020 06:44:06 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05HAWXWI072752;
 Wed, 17 Jun 2020 06:44:06 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31q6j0j2jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jun 2020 06:44:05 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05HAa12w018465;
 Wed, 17 Jun 2020 10:44:03 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 31q6ckrbs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jun 2020 10:44:03 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05HAi0sn65733038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jun 2020 10:44:00 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42B2E5205A;
 Wed, 17 Jun 2020 10:44:00 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.186.32])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6618852054;
 Wed, 17 Jun 2020 10:43:59 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] s390: virtio: let arch accept devices without IOMMU
 feature
Date: Wed, 17 Jun 2020 12:43:57 +0200
Message-Id: <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1592390637-17441-1-git-send-email-pmorel@linux.ibm.com>
References: <1592390637-17441-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-17_03:2020-06-17,
 2020-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 cotscore=-2147483648
 mlxlogscore=952 lowpriorityscore=0 mlxscore=0 suspectscore=1 clxscore=1015
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006170079
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, mst@redhat.com, heiko.carstens@de.ibm.com,
 cohuck@redhat.com, linuxram@us.ibm.com,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, thomas.lendacky@amd.com, david@gibson.dropbear.id.au
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

An architecture protecting the guest memory against unauthorized host
access may want to enforce VIRTIO I/O device protection through the
use of VIRTIO_F_IOMMU_PLATFORM.

Let's give a chance to the architecture to accept or not devices
without VIRTIO_F_IOMMU_PLATFORM.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
---
 arch/s390/mm/init.c     |  6 ++++++
 drivers/virtio/virtio.c | 22 ++++++++++++++++++++++
 include/linux/virtio.h  |  2 ++
 3 files changed, 30 insertions(+)

diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index 6dc7c3b60ef6..215070c03226 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -45,6 +45,7 @@
 #include <asm/kasan.h>
 #include <asm/dma-mapping.h>
 #include <asm/uv.h>
+#include <linux/virtio.h>
 
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(.bss..swapper_pg_dir);
 
@@ -161,6 +162,11 @@ bool force_dma_unencrypted(struct device *dev)
 	return is_prot_virt_guest();
 }
 
+int arch_needs_virtio_iommu_platform(struct virtio_device *dev)
+{
+	return is_prot_virt_guest();
+}
+
 /* protected virtualization */
 static void pv_init(void)
 {
diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index a977e32a88f2..aa8e01104f86 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -167,6 +167,21 @@ void virtio_add_status(struct virtio_device *dev, unsigned int status)
 }
 EXPORT_SYMBOL_GPL(virtio_add_status);
 
+/*
+ * arch_needs_virtio_iommu_platform - provide arch specific hook when finalizing
+ *				      features for VIRTIO device dev
+ * @dev: the VIRTIO device being added
+ *
+ * Permits the platform to provide architecture specific functionality when
+ * devices features are finalized. This is the default implementation.
+ * Architecture implementations can override this.
+ */
+
+int __weak arch_needs_virtio_iommu_platform(struct virtio_device *dev)
+{
+	return 0;
+}
+
 int virtio_finalize_features(struct virtio_device *dev)
 {
 	int ret = dev->config->finalize_features(dev);
@@ -179,6 +194,13 @@ int virtio_finalize_features(struct virtio_device *dev)
 	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1))
 		return 0;
 
+	if (arch_needs_virtio_iommu_platform(dev) &&
+		!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
+		dev_warn(&dev->dev,
+			 "virtio: device must provide VIRTIO_F_IOMMU_PLATFORM\n");
+		return -ENODEV;
+	}
+
 	virtio_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
 	status = dev->config->get_status(dev);
 	if (!(status & VIRTIO_CONFIG_S_FEATURES_OK)) {
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index a493eac08393..e8526ae3463e 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -195,4 +195,6 @@ void unregister_virtio_driver(struct virtio_driver *drv);
 #define module_virtio_driver(__virtio_driver) \
 	module_driver(__virtio_driver, register_virtio_driver, \
 			unregister_virtio_driver)
+
+int arch_needs_virtio_iommu_platform(struct virtio_device *dev);
 #endif /* _LINUX_VIRTIO_H */
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
