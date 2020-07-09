Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B0A219B08
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 10:39:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 29C9C25281;
	Thu,  9 Jul 2020 08:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id INnxJ+wp++hx; Thu,  9 Jul 2020 08:39:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 056D02046C;
	Thu,  9 Jul 2020 08:39:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D39F4C016F;
	Thu,  9 Jul 2020 08:39:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFD29C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 08:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BE06F204AC
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 08:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6TpaCBcqgslu
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 08:39:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by silver.osuosl.org (Postfix) with ESMTPS id 057F62046C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 08:39:33 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0698UkZC070735; Thu, 9 Jul 2020 04:39:28 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 325ktsja83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 04:39:28 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0698dS3e109724;
 Thu, 9 Jul 2020 04:39:28 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 325ktsja77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 04:39:28 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0698bJnC025907;
 Thu, 9 Jul 2020 08:39:26 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 325k0crm3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 08:39:26 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0698dNgX50921566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 08:39:23 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F5494204F;
 Thu,  9 Jul 2020 08:39:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93D3342049;
 Thu,  9 Jul 2020 08:39:22 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.34.67])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 08:39:22 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] s390: virtio: PV needs VIRTIO I/O device protection
Date: Thu,  9 Jul 2020 10:39:19 +0200
Message-Id: <1594283959-13742-3-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594283959-13742-1-git-send-email-pmorel@linux.ibm.com>
References: <1594283959-13742-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_04:2020-07-08,
 2020-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 phishscore=0 suspectscore=1
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090064
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

If protected virtualization is active on s390, the virtio queues are
not accessible to the host, unless VIRTIO_F_IOMMU_PLATFORM has been
negotiated. Use the new arch_validate_virtio_features() interface to
fail probe if that's not the case, preventing a host error on access
attempt

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 arch/s390/mm/init.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index 6dc7c3b60ef6..b8e6f90117da 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -45,6 +45,7 @@
 #include <asm/kasan.h>
 #include <asm/dma-mapping.h>
 #include <asm/uv.h>
+#include <linux/virtio_config.h>
 
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(.bss..swapper_pg_dir);
 
@@ -161,6 +162,32 @@ bool force_dma_unencrypted(struct device *dev)
 	return is_prot_virt_guest();
 }
 
+/*
+ * arch_validate_virtio_features
+ * @dev: the VIRTIO device being added
+ *
+ * Return an error if required features are missing on a guest running
+ * with protected virtualization.
+ */
+int arch_validate_virtio_features(struct virtio_device *dev)
+{
+	if (!is_prot_virt_guest())
+		return 0;
+
+	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1)) {
+		dev_warn(&dev->dev, "device must provide VIRTIO_F_VERSION_1\n");
+		return -ENODEV;
+	}
+
+	if (!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
+		dev_warn(&dev->dev,
+			 "device must provide VIRTIO_F_IOMMU_PLATFORM\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 /* protected virtualization */
 static void pv_init(void)
 {
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
