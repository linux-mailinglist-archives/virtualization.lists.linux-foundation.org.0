Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B97B37998AC
	for <lists.virtualization@lfdr.de>; Sat,  9 Sep 2023 15:34:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A118940922;
	Sat,  9 Sep 2023 13:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A118940922
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=MSSNAMKC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqCYJG2E0I4e; Sat,  9 Sep 2023 13:34:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E559940949;
	Sat,  9 Sep 2023 13:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E559940949
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DEE2C008C;
	Sat,  9 Sep 2023 13:34:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45AC5C0032
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Sep 2023 13:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20CBA4064D
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Sep 2023 13:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20CBA4064D
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=MSSNAMKC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zC8U50PcZMbB
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Sep 2023 13:34:35 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C32240407
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Sep 2023 13:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C32240407
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 389DUBwp002075; Sat, 9 Sep 2023 13:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2023-03-30;
 bh=3SoettkK0A5ly5HDPAE54a1qyx6iHgB1BZZ3utGj/7g=;
 b=MSSNAMKCRtbPn7Xw3VICm8eAhLQ9v39J94d/qdSBQN1a7LUEG1NoHLCCYwSPo7zBEzdL
 /KSrYjnkc6ixv4o05OHALusiCvx1JTkqMq9P5roKRj2Pz3T2L2mM4e/nH+ssFnbslqts
 Jpbho6ZWnVMH5ohmVKydjng5PGSTOwvhJ1+eGdssFCJfIxtX0zJ3KyhoFIULaVRNttSw
 dldlllAEmMJZ37s+4VYjcGnGOHDPSvAfR6f37chmojVg6iatIA/Xy61LkGYPGQX+Ewq9
 rhBwmY3Ss5CjRnBje+O/iQI4XNJGXh8wrOC3srYiPVbvHJ4qKwMpdpu+8zqU6dXpyo4h eQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t0sn2g02g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 09 Sep 2023 13:34:29 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 389D22JH023060; Sat, 9 Sep 2023 13:34:17 GMT
Received: from ban25x6uut24.us.oracle.com (ban25x6uut24.us.oracle.com
 [10.153.73.24])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3t0f52vccr-3; Sat, 09 Sep 2023 13:34:17 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: eperezma@redhat.com, jasowang@redhat.com, mst@redhat.com,
 xuanzhuo@linux.alibaba.com, dtatulea@nvidia.com
Subject: [PATCH RFC v2 2/4] vdpa/mlx5: implement .reset_map driver op
Date: Sat,  9 Sep 2023 06:31:57 -0700
Message-Id: <1694266319-32287-3-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1694266319-32287-1-git-send-email-si-wei.liu@oracle.com>
References: <1694266319-32287-1-git-send-email-si-wei.liu@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-09_11,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309090123
X-Proofpoint-GUID: GUjmC5bD1Le8qfJdaZQQKcXNXeu0qz2j
X-Proofpoint-ORIG-GUID: GUjmC5bD1Le8qfJdaZQQKcXNXeu0qz2j
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

Today, mlx5_vdpa gets started by preallocate 1:1 DMA mapping at
device creation time, while this 1:1 mapping will be implicitly
destroyed when the first .set_map call is invoked. Everytime
when the .reset callback is invoked, any mapping left behind will
be dropped then reset back to the initial 1:1 DMA mapping.

In order to reduce excessive memory mapping cost during live
migration, it is desirable to decouple the vhost-vdpa iotlb
abstraction from the virtio device life cycle, i.e. mappings
should be left intact across virtio device reset. Leverage the
.reset_map callback to reset memory mapping, then the device
.reset routine can run free from having to clean up memory
mappings.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>

---
RFC v1 -> v2:
  - fix error path when both CVQ and DVQ fall in same asid
---
 drivers/vdpa/mlx5/core/mlx5_vdpa.h |  1 +
 drivers/vdpa/mlx5/core/mr.c        | 70 +++++++++++++++++++++++---------------
 drivers/vdpa/mlx5/net/mlx5_vnet.c  | 18 +++++++---
 3 files changed, 56 insertions(+), 33 deletions(-)

diff --git a/drivers/vdpa/mlx5/core/mlx5_vdpa.h b/drivers/vdpa/mlx5/core/mlx5_vdpa.h
index b53420e..5c9a25a 100644
--- a/drivers/vdpa/mlx5/core/mlx5_vdpa.h
+++ b/drivers/vdpa/mlx5/core/mlx5_vdpa.h
@@ -123,6 +123,7 @@ int mlx5_vdpa_create_mr(struct mlx5_vdpa_dev *mvdev, struct vhost_iotlb *iotlb,
 			unsigned int asid);
 void mlx5_vdpa_destroy_mr(struct mlx5_vdpa_dev *mvdev);
 void mlx5_vdpa_destroy_mr_asid(struct mlx5_vdpa_dev *mvdev, unsigned int asid);
+int mlx5_vdpa_reset_mr(struct mlx5_vdpa_dev *mvdev, unsigned int asid);
 
 #define mlx5_vdpa_warn(__dev, format, ...)                                                         \
 	dev_warn((__dev)->mdev->device, "%s:%d:(pid %d) warning: " format, __func__, __LINE__,     \
diff --git a/drivers/vdpa/mlx5/core/mr.c b/drivers/vdpa/mlx5/core/mr.c
index 5a1971fc..ec2c7b4e1 100644
--- a/drivers/vdpa/mlx5/core/mr.c
+++ b/drivers/vdpa/mlx5/core/mr.c
@@ -489,21 +489,15 @@ static void destroy_user_mr(struct mlx5_vdpa_dev *mvdev, struct mlx5_vdpa_mr *mr
 	}
 }
 
-static void _mlx5_vdpa_destroy_cvq_mr(struct mlx5_vdpa_dev *mvdev, unsigned int asid)
+static void _mlx5_vdpa_destroy_cvq_mr(struct mlx5_vdpa_dev *mvdev)
 {
-	if (mvdev->group2asid[MLX5_VDPA_CVQ_GROUP] != asid)
-		return;
-
 	prune_iotlb(mvdev);
 }
 
-static void _mlx5_vdpa_destroy_dvq_mr(struct mlx5_vdpa_dev *mvdev, unsigned int asid)
+static void _mlx5_vdpa_destroy_dvq_mr(struct mlx5_vdpa_dev *mvdev)
 {
 	struct mlx5_vdpa_mr *mr = &mvdev->mr;
 
-	if (mvdev->group2asid[MLX5_VDPA_DATAVQ_GROUP] != asid)
-		return;
-
 	if (!mr->initialized)
 		return;
 
@@ -521,8 +515,10 @@ void mlx5_vdpa_destroy_mr_asid(struct mlx5_vdpa_dev *mvdev, unsigned int asid)
 
 	mutex_lock(&mr->mkey_mtx);
 
-	_mlx5_vdpa_destroy_dvq_mr(mvdev, asid);
-	_mlx5_vdpa_destroy_cvq_mr(mvdev, asid);
+	if (mvdev->group2asid[MLX5_VDPA_DATAVQ_GROUP] == asid)
+		_mlx5_vdpa_destroy_dvq_mr(mvdev);
+	if (mvdev->group2asid[MLX5_VDPA_CVQ_GROUP] == asid)
+		_mlx5_vdpa_destroy_cvq_mr(mvdev);
 
 	mutex_unlock(&mr->mkey_mtx);
 }
@@ -534,25 +530,17 @@ void mlx5_vdpa_destroy_mr(struct mlx5_vdpa_dev *mvdev)
 }
 
 static int _mlx5_vdpa_create_cvq_mr(struct mlx5_vdpa_dev *mvdev,
-				    struct vhost_iotlb *iotlb,
-				    unsigned int asid)
+				    struct vhost_iotlb *iotlb)
 {
-	if (mvdev->group2asid[MLX5_VDPA_CVQ_GROUP] != asid)
-		return 0;
-
 	return dup_iotlb(mvdev, iotlb);
 }
 
 static int _mlx5_vdpa_create_dvq_mr(struct mlx5_vdpa_dev *mvdev,
-				    struct vhost_iotlb *iotlb,
-				    unsigned int asid)
+				    struct vhost_iotlb *iotlb)
 {
 	struct mlx5_vdpa_mr *mr = &mvdev->mr;
 	int err;
 
-	if (mvdev->group2asid[MLX5_VDPA_DATAVQ_GROUP] != asid)
-		return 0;
-
 	if (mr->initialized)
 		return 0;
 
@@ -574,18 +562,22 @@ static int _mlx5_vdpa_create_mr(struct mlx5_vdpa_dev *mvdev,
 {
 	int err;
 
-	err = _mlx5_vdpa_create_dvq_mr(mvdev, iotlb, asid);
-	if (err)
-		return err;
-
-	err = _mlx5_vdpa_create_cvq_mr(mvdev, iotlb, asid);
-	if (err)
-		goto out_err;
+	if (mvdev->group2asid[MLX5_VDPA_DATAVQ_GROUP] == asid) {
+		err = _mlx5_vdpa_create_dvq_mr(mvdev, iotlb);
+		if (err)
+			return err;
+	}
+	if (mvdev->group2asid[MLX5_VDPA_CVQ_GROUP] == asid) {
+		err = _mlx5_vdpa_create_cvq_mr(mvdev, iotlb);
+		if (err)
+			goto out_err;
+	}
 
 	return 0;
 
 out_err:
-	_mlx5_vdpa_destroy_dvq_mr(mvdev, asid);
+	if (mvdev->group2asid[MLX5_VDPA_DATAVQ_GROUP] == asid)
+		_mlx5_vdpa_destroy_dvq_mr(mvdev);
 
 	return err;
 }
@@ -601,6 +593,28 @@ int mlx5_vdpa_create_mr(struct mlx5_vdpa_dev *mvdev, struct vhost_iotlb *iotlb,
 	return err;
 }
 
+int mlx5_vdpa_reset_mr(struct mlx5_vdpa_dev *mvdev, unsigned int asid)
+{
+	struct mlx5_vdpa_mr *mr = &mvdev->mr;
+	int err = 0;
+
+	if (asid != 0)
+		return 0;
+
+	mutex_lock(&mr->mkey_mtx);
+	if (!mr->user_mr)
+		goto out;
+	_mlx5_vdpa_destroy_dvq_mr(mvdev);
+	if (MLX5_CAP_GEN(mvdev->mdev, umem_uid_0)) {
+		err = _mlx5_vdpa_create_dvq_mr(mvdev, NULL);
+		if (err)
+			mlx5_vdpa_warn(mvdev, "create DMA MR failed\n");
+	}
+out:
+	mutex_unlock(&mr->mkey_mtx);
+	return err;
+}
+
 int mlx5_vdpa_handle_set_map(struct mlx5_vdpa_dev *mvdev, struct vhost_iotlb *iotlb,
 			     bool *change_map, unsigned int asid)
 {
diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index 37be945..3cb5db6 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -2824,7 +2824,6 @@ static int mlx5_vdpa_reset(struct vdpa_device *vdev)
 	unregister_link_notifier(ndev);
 	teardown_driver(ndev);
 	clear_vqs_ready(ndev);
-	mlx5_vdpa_destroy_mr(&ndev->mvdev);
 	ndev->mvdev.status = 0;
 	ndev->mvdev.suspended = false;
 	ndev->cur_num_vqs = 0;
@@ -2835,10 +2834,6 @@ static int mlx5_vdpa_reset(struct vdpa_device *vdev)
 	init_group_to_asid_map(mvdev);
 	++mvdev->generation;
 
-	if (MLX5_CAP_GEN(mvdev->mdev, umem_uid_0)) {
-		if (mlx5_vdpa_create_mr(mvdev, NULL, 0))
-			mlx5_vdpa_warn(mvdev, "create MR failed\n");
-	}
 	up_write(&ndev->reslock);
 
 	return 0;
@@ -2903,6 +2898,18 @@ static int mlx5_vdpa_set_map(struct vdpa_device *vdev, unsigned int asid,
 	return err;
 }
 
+static int mlx5_vdpa_reset_map(struct vdpa_device *vdev, unsigned int asid)
+{
+	struct mlx5_vdpa_dev *mvdev = to_mvdev(vdev);
+	struct mlx5_vdpa_net *ndev = to_mlx5_vdpa_ndev(mvdev);
+	int err;
+
+	down_write(&ndev->reslock);
+	err = mlx5_vdpa_reset_mr(mvdev, asid);
+	up_write(&ndev->reslock);
+	return err;
+}
+
 static struct device *mlx5_get_vq_dma_dev(struct vdpa_device *vdev, u16 idx)
 {
 	struct mlx5_vdpa_dev *mvdev = to_mvdev(vdev);
@@ -3162,6 +3169,7 @@ static int mlx5_set_group_asid(struct vdpa_device *vdev, u32 group,
 	.set_config = mlx5_vdpa_set_config,
 	.get_generation = mlx5_vdpa_get_generation,
 	.set_map = mlx5_vdpa_set_map,
+	.reset_map = mlx5_vdpa_reset_map,
 	.set_group_asid = mlx5_set_group_asid,
 	.get_vq_dma_dev = mlx5_get_vq_dma_dev,
 	.free = mlx5_vdpa_free,
-- 
1.8.3.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
