Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2EC7CED47
	for <lists.virtualization@lfdr.de>; Thu, 19 Oct 2023 03:13:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 944FD6F7B4;
	Thu, 19 Oct 2023 01:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 944FD6F7B4
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=k/BctANu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tSBV4Z3UoPmh; Thu, 19 Oct 2023 01:13:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D18CE6F7C4;
	Thu, 19 Oct 2023 01:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D18CE6F7C4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0C6FC0032;
	Thu, 19 Oct 2023 01:13:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A263FC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 01:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCD374226B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 01:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD374226B
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=k/BctANu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UEEFubRHFyiV
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 01:13:02 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20EC442263
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 01:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20EC442263
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39IIp6GW018161; Thu, 19 Oct 2023 01:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2023-03-30;
 bh=yqGkLUNZfGgGhNcNWbKwVR1zZTQ3CSwQRCGc1fCis9U=;
 b=k/BctANu2LWe8QIrsW808QpPS/5fAaWTY9cgPOYJnwKMA+Zn2fGb1VE9LRcGM8KTHBoG
 Qc/pcbi41iN3th0PY0sHMMFRA/r6EG3FrJbJ4suphem9FUHpiYXOX7b5CDqsemSz8PcV
 PWq7bjbNV2wr9wWDEKlzNCmUfDc8VVc/nS9BRMDqB/5C4KLzB047vN2C+qIr2WPQ/1fQ
 pQGGIouQu3zX/YMwPAmFNtDsiHpIVFbpizPhVgMlB+BLor9RfLtvPumT/L1pcCHA6Ucd
 JpWjce27vlMv9sZh7ZNm+Uc167KQ7brzahNtWWHhwg0aVUP3dqA0cZKRf4NCzhl8gnbs bg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tqkhu95n2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Oct 2023 01:13:01 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 39J0UpS4015251; Thu, 19 Oct 2023 01:13:00 GMT
Received: from ban25x6uut24.us.oracle.com (ban25x6uut24.us.oracle.com
 [10.153.73.24])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3trg1h8w2d-6; Thu, 19 Oct 2023 01:12:59 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, dtatulea@nvidia.com
Subject: [PATCH v3 5/5] vdpa_sim: implement .reset_map support
Date: Wed, 18 Oct 2023 18:10:18 -0700
Message-Id: <1697677818-11371-6-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1697677818-11371-1-git-send-email-si-wei.liu@oracle.com>
References: <1697677818-11371-1-git-send-email-si-wei.liu@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_01,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310190007
X-Proofpoint-GUID: NRw35eenR4tsRlNH_2X-m5JRqgZD1vFm
X-Proofpoint-ORIG-GUID: NRw35eenR4tsRlNH_2X-m5JRqgZD1vFm
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

In order to reduce excessive memory mapping cost in live migration and
VM reboot, it is desirable to decouple the vhost-vdpa IOTLB abstraction
from the virtio device life cycle, i.e. mappings can be kept intact
across virtio device reset. Leverage the .reset_map callback, which is
meant to destroy the iotlb on the given ASID and recreate the 1:1
passthrough/identity mapping. To be consistent, the mapping on device
creation is initiailized to passthrough/identity with PA 1:1 mapped
as IOVA. With this the device .reset op doesn't have to maintain and
clean up memory mappings by itself.

Add a module paramemter, iotlb_persist, to cater for older userspace
which may wish to see mapping to be cleared during reset.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Tested-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 58 ++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 76d41058add9..74506636375f 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -40,6 +40,10 @@ static bool use_va = true;
 module_param(use_va, bool, 0444);
 MODULE_PARM_DESC(use_va, "Enable/disable the device's ability to use VA");
 
+static bool iotlb_persist = true;
+module_param(iotlb_persist, bool, 0444);
+MODULE_PARM_DESC(iotlb_persist, "Enable/disable persistent iotlb across reset: 1 to keep maps, 0 to clear");
+
 #define VDPASIM_QUEUE_ALIGN PAGE_SIZE
 #define VDPASIM_QUEUE_MAX 256
 #define VDPASIM_VENDOR_ID 0
@@ -151,11 +155,13 @@ static void vdpasim_do_reset(struct vdpasim *vdpasim)
 				 &vdpasim->iommu_lock);
 	}
 
-	for (i = 0; i < vdpasim->dev_attr.nas; i++) {
-		vhost_iotlb_reset(&vdpasim->iommu[i]);
-		vhost_iotlb_add_range(&vdpasim->iommu[i], 0, ULONG_MAX,
-				      0, VHOST_MAP_RW);
-		vdpasim->iommu_pt[i] = true;
+	if (unlikely(!iotlb_persist)) {
+		for (i = 0; i < vdpasim->dev_attr.nas; i++) {
+			vhost_iotlb_reset(&vdpasim->iommu[i]);
+			vhost_iotlb_add_range(&vdpasim->iommu[i], 0, ULONG_MAX,
+					      0, VHOST_MAP_RW);
+			vdpasim->iommu_pt[i] = true;
+		}
 	}
 
 	vdpasim->running = true;
@@ -166,8 +172,8 @@ static void vdpasim_do_reset(struct vdpasim *vdpasim)
 	++vdpasim->generation;
 }
 
-static const struct vdpa_config_ops vdpasim_config_ops;
-static const struct vdpa_config_ops vdpasim_batch_config_ops;
+static struct vdpa_config_ops vdpasim_config_ops;
+static struct vdpa_config_ops vdpasim_batch_config_ops;
 
 static void vdpasim_work_fn(struct kthread_work *work)
 {
@@ -191,7 +197,7 @@ static void vdpasim_work_fn(struct kthread_work *work)
 struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr,
 			       const struct vdpa_dev_set_config *config)
 {
-	const struct vdpa_config_ops *ops;
+	struct vdpa_config_ops *ops;
 	struct vdpa_device *vdpa;
 	struct vdpasim *vdpasim;
 	struct device *dev;
@@ -213,6 +219,9 @@ struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr,
 	else
 		ops = &vdpasim_config_ops;
 
+	if (unlikely(!iotlb_persist))
+		ops->reset_map = NULL;
+
 	vdpa = __vdpa_alloc_device(NULL, ops,
 				   dev_attr->ngroups, dev_attr->nas,
 				   dev_attr->alloc_size,
@@ -259,8 +268,14 @@ struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr,
 	if (!vdpasim->iommu_pt)
 		goto err_iommu;
 
-	for (i = 0; i < vdpasim->dev_attr.nas; i++)
+	for (i = 0; i < vdpasim->dev_attr.nas; i++) {
 		vhost_iotlb_init(&vdpasim->iommu[i], max_iotlb_entries, 0);
+		if (likely(iotlb_persist)) {
+			vhost_iotlb_add_range(&vdpasim->iommu[i], 0, ULONG_MAX, 0,
+					      VHOST_MAP_RW);
+			vdpasim->iommu_pt[i] = true;
+		}
+	}
 
 	for (i = 0; i < dev_attr->nvqs; i++)
 		vringh_set_iotlb(&vdpasim->vqs[i].vring, &vdpasim->iommu[0],
@@ -637,6 +652,25 @@ static int vdpasim_set_map(struct vdpa_device *vdpa, unsigned int asid,
 	return ret;
 }
 
+static int vdpasim_reset_map(struct vdpa_device *vdpa, unsigned int asid)
+{
+	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
+
+	if (asid >= vdpasim->dev_attr.nas)
+		return -EINVAL;
+
+	spin_lock(&vdpasim->iommu_lock);
+	if (vdpasim->iommu_pt[asid])
+		goto out;
+	vhost_iotlb_reset(&vdpasim->iommu[asid]);
+	vhost_iotlb_add_range(&vdpasim->iommu[asid], 0, ULONG_MAX,
+			      0, VHOST_MAP_RW);
+	vdpasim->iommu_pt[asid] = true;
+out:
+	spin_unlock(&vdpasim->iommu_lock);
+	return 0;
+}
+
 static int vdpasim_bind_mm(struct vdpa_device *vdpa, struct mm_struct *mm)
 {
 	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
@@ -726,7 +760,7 @@ static void vdpasim_free(struct vdpa_device *vdpa)
 	kfree(vdpasim->config);
 }
 
-static const struct vdpa_config_ops vdpasim_config_ops = {
+static struct vdpa_config_ops vdpasim_config_ops = {
 	.set_vq_address         = vdpasim_set_vq_address,
 	.set_vq_num             = vdpasim_set_vq_num,
 	.kick_vq                = vdpasim_kick_vq,
@@ -759,12 +793,13 @@ static const struct vdpa_config_ops vdpasim_config_ops = {
 	.set_group_asid         = vdpasim_set_group_asid,
 	.dma_map                = vdpasim_dma_map,
 	.dma_unmap              = vdpasim_dma_unmap,
+	.reset_map              = vdpasim_reset_map,
 	.bind_mm		= vdpasim_bind_mm,
 	.unbind_mm		= vdpasim_unbind_mm,
 	.free                   = vdpasim_free,
 };
 
-static const struct vdpa_config_ops vdpasim_batch_config_ops = {
+static struct vdpa_config_ops vdpasim_batch_config_ops = {
 	.set_vq_address         = vdpasim_set_vq_address,
 	.set_vq_num             = vdpasim_set_vq_num,
 	.kick_vq                = vdpasim_kick_vq,
@@ -796,6 +831,7 @@ static const struct vdpa_config_ops vdpasim_batch_config_ops = {
 	.get_iova_range         = vdpasim_get_iova_range,
 	.set_group_asid         = vdpasim_set_group_asid,
 	.set_map                = vdpasim_set_map,
+	.reset_map              = vdpasim_reset_map,
 	.bind_mm		= vdpasim_bind_mm,
 	.unbind_mm		= vdpasim_unbind_mm,
 	.free                   = vdpasim_free,
-- 
2.39.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
