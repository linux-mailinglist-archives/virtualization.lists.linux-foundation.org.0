Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9A87998B9
	for <lists.virtualization@lfdr.de>; Sat,  9 Sep 2023 15:46:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFEC882005;
	Sat,  9 Sep 2023 13:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFEC882005
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=OU9ZBESf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2KJaKndIKFB; Sat,  9 Sep 2023 13:46:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D831382043;
	Sat,  9 Sep 2023 13:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D831382043
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2193C0032;
	Sat,  9 Sep 2023 13:46:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AEF4C0032
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Sep 2023 13:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2890F60FE9
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Sep 2023 13:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2890F60FE9
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=OU9ZBESf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CTCXgQU0TUX3
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Sep 2023 13:46:28 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7355260E77
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Sep 2023 13:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7355260E77
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 389DU4H7002052; Sat, 9 Sep 2023 13:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2023-03-30;
 bh=0VPuXDl5dbLFsT2nPyZqoPLQIWxfTyE1HRkfyRSSUWU=;
 b=OU9ZBESfhpyh11rz7tqrZ3ue9366zJzOqNQk0Eo4dk8Brw1fah31n3vnkb2z6s6K32Y6
 eyLKRS1RlHAdFEu1iP9AN3Ev63YNDGkewWyHE5YBsQ9WnRd5Lurf6zWLykl/PS3ZYG03
 peQzDDPkAu8Wr/7dj+Todb5B3cgaZ5YhIu3wjWPSM4cOAYn5+h1WMG3Lveb5rxJzO+LF
 t3l0+YgkCEPu8KYcM2evpgl6SXYnSCPwPkJeIVA+GjfsGytTAWhg/hbfYra4v/G4Pbtj
 g+aP/b1BmYYC3yGBrHX33MIN4D2w/U50uZlhFVFBT5Yu+LjsMSof3GSMu3hw9B5YqLS5 lQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t0sn2g0qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 09 Sep 2023 13:46:25 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 389A1UVC007574; Sat, 9 Sep 2023 13:46:25 GMT
Received: from ban25x6uut24.us.oracle.com (ban25x6uut24.us.oracle.com
 [10.153.73.24])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3t0f52mh12-5; Sat, 09 Sep 2023 13:46:25 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: eperezma@redhat.com, jasowang@redhat.com, mst@redhat.com,
 xuanzhuo@linux.alibaba.com, dtatulea@nvidia.com
Subject: [PATCH RFC v3 4/4] vhost-vdpa: introduce IOTLB_PERSIST backend
 feature bit
Date: Sat,  9 Sep 2023 06:43:59 -0700
Message-Id: <1694267039-718-5-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1694267039-718-1-git-send-email-si-wei.liu@oracle.com>
References: <1694267039-718-1-git-send-email-si-wei.liu@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-09_12,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309090124
X-Proofpoint-GUID: sKx2HzpdFS840XcpgdAcAAKdyo4ixgE5
X-Proofpoint-ORIG-GUID: sKx2HzpdFS840XcpgdAcAAKdyo4ixgE5
Cc: virtualization@lists.linux-foundation.org
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

Userspace needs this feature flag to distinguish if vhost-vdpa
iotlb in the kernel supports persistent IOTLB mapping across
device reset. There are two cases that backend may claim
this feature bit on:

- parent device that has to work with platform IOMMU
- parent device with on-chip IOMMU that has the expected
  .reset_map support in driver

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
RFC v2 -> v3:
  - fix missing return due to merge error

---
 drivers/vhost/vdpa.c             | 16 +++++++++++++++-
 include/uapi/linux/vhost_types.h |  2 ++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 71fbd559..b404504 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -414,6 +414,14 @@ static bool vhost_vdpa_has_desc_group(const struct vhost_vdpa *v)
 	return ops->get_vq_desc_group;
 }
 
+static bool vhost_vdpa_has_persistent_map(const struct vhost_vdpa *v)
+{
+	struct vdpa_device *vdpa = v->vdpa;
+	const struct vdpa_config_ops *ops = vdpa->config;
+
+	return (!ops->set_map && !ops->dma_map) || ops->reset_map;
+}
+
 static long vhost_vdpa_get_features(struct vhost_vdpa *v, u64 __user *featurep)
 {
 	struct vdpa_device *vdpa = v->vdpa;
@@ -716,7 +724,8 @@ static long vhost_vdpa_unlocked_ioctl(struct file *filep,
 		if (features & ~(VHOST_VDPA_BACKEND_FEATURES |
 				 BIT_ULL(VHOST_BACKEND_F_DESC_ASID) |
 				 BIT_ULL(VHOST_BACKEND_F_SUSPEND) |
-				 BIT_ULL(VHOST_BACKEND_F_RESUME)))
+				 BIT_ULL(VHOST_BACKEND_F_RESUME) |
+				 BIT_ULL(VHOST_BACKEND_F_IOTLB_PERSIST)))
 			return -EOPNOTSUPP;
 		if ((features & BIT_ULL(VHOST_BACKEND_F_SUSPEND)) &&
 		     !vhost_vdpa_can_suspend(v))
@@ -730,6 +739,9 @@ static long vhost_vdpa_unlocked_ioctl(struct file *filep,
 		if ((features & BIT_ULL(VHOST_BACKEND_F_DESC_ASID)) &&
 		     !vhost_vdpa_has_desc_group(v))
 			return -EOPNOTSUPP;
+		if ((features & BIT_ULL(VHOST_BACKEND_F_IOTLB_PERSIST)) &&
+		     !vhost_vdpa_has_persistent_map(v))
+			return -EOPNOTSUPP;
 		vhost_set_backend_features(&v->vdev, features);
 		return 0;
 	}
@@ -785,6 +797,8 @@ static long vhost_vdpa_unlocked_ioctl(struct file *filep,
 			features |= BIT_ULL(VHOST_BACKEND_F_RESUME);
 		if (vhost_vdpa_has_desc_group(v))
 			features |= BIT_ULL(VHOST_BACKEND_F_DESC_ASID);
+		if (vhost_vdpa_has_persistent_map(v))
+			features |= BIT_ULL(VHOST_BACKEND_F_IOTLB_PERSIST);
 		if (copy_to_user(featurep, &features, sizeof(features)))
 			r = -EFAULT;
 		break;
diff --git a/include/uapi/linux/vhost_types.h b/include/uapi/linux/vhost_types.h
index 6acc604..0fdb6f0 100644
--- a/include/uapi/linux/vhost_types.h
+++ b/include/uapi/linux/vhost_types.h
@@ -186,5 +186,7 @@ struct vhost_vdpa_iova_range {
  * buffers may reside. Requires VHOST_BACKEND_F_IOTLB_ASID.
  */
 #define VHOST_BACKEND_F_DESC_ASID    0x6
+/* IOTLB don't flush memory mapping across device reset */
+#define VHOST_BACKEND_F_IOTLB_PERSIST  0x7
 
 #endif
-- 
1.8.3.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
