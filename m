Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB47BF6C3
	for <lists.virtualization@lfdr.de>; Tue, 10 Oct 2023 11:05:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CF6140A9A;
	Tue, 10 Oct 2023 09:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CF6140A9A
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=XQV0JY97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v694hhm0rByH; Tue, 10 Oct 2023 09:05:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id ADCC040A08;
	Tue, 10 Oct 2023 09:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADCC040A08
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 697D6C0DDB;
	Tue, 10 Oct 2023 09:05:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0485FC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 09:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D30ED408A8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 09:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D30ED408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfGwiC3X9iR6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 09:05:39 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C80C40131
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 09:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C80C40131
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39A7xm4n017321; Tue, 10 Oct 2023 09:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2023-03-30;
 bh=OR1Mg65jkrHjEjNGA3NuJOUmbwtflXaMlM5D2J5Mle8=;
 b=XQV0JY97HpvsePs8RzztkmT4Rntm8557ItgXjVdFiahdkGvMiaAueu7oH0CdgzBjqzfy
 XkYGZVUUZ5STP1ERL8xA7L/vUKAeB9llQ64o+AFdpP5wl02QfEx55Mo0m2NW0GAaupo6
 V9QVLG/XupAz6ESMzyr0BDDjRqw4y9jnx4mpndZXQJjqFGHJ8y4NpqlZa7jfvEliJunS
 i7LQlKz39eSHcDtLEGC/G8rE8gyGiJaDDAqBrk7rgSBCEJIEbmz/V+5JOCZAtA+3cDG7
 4B1SfvxEnf1ZySgR8aPmt5TAhIglEuHC9fgvbwP+ePzt/YF8GiUd1O0mFTB+nXv+1nTq 7w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tjx8cck9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Oct 2023 09:05:36 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 39A6sxrD021395; Tue, 10 Oct 2023 09:05:34 GMT
Received: from ban25x6uut24.us.oracle.com (ban25x6uut24.us.oracle.com
 [10.153.73.24])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3tjwsc5cy2-2; Tue, 10 Oct 2023 09:05:34 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 xuanzhuo@linux.alibaba.com, dtatulea@nvidia.com
Subject: [PATCH 1/4] vdpa: introduce .reset_map operation callback
Date: Tue, 10 Oct 2023 02:02:57 -0700
Message-Id: <1696928580-7520-2-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1696928580-7520-1-git-send-email-si-wei.liu@oracle.com>
References: <1696928580-7520-1-git-send-email-si-wei.liu@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_04,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310100067
X-Proofpoint-ORIG-GUID: 2nX3W0JHB2ZaF5l04tF0rfaY7HthgzBa
X-Proofpoint-GUID: 2nX3W0JHB2ZaF5l04tF0rfaY7HthgzBa
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

Device specific IOMMU parent driver who wishes to see mapping to be
decoupled from virtio or vdpa device life cycle (device reset) can use
it to restore memory mapping in the device IOMMU to the initial or
default state. The reset of mapping is done per address space basis.

The reason why a separate .reset_map op is introduced is because this
allows a simple on-chip IOMMU model without exposing too much device
implementation details to the upper vdpa layer. The .dma_map/unmap or
.set_map driver API is meant to be used to manipulate the IOTLB mappings,
and has been abstracted in a way similar to how a real IOMMU device maps
or unmaps pages for certain memory ranges. However, apart from this there
also exists other mapping needs, in which case 1:1 passthrough mapping
has to be used by other users (read virtio-vdpa). To ease parent/vendor
driver implementation and to avoid abusing DMA ops in an unexpacted way,
these on-chip IOMMU devices can start with 1:1 passthrough mapping mode
initially at the he time of creation. Then the .reset_map op can be used
to switch iotlb back to this initial state without having to expose a
complex two-dimensional IOMMU device model.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 include/linux/vdpa.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index d376309..26ae6ae 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -327,6 +327,15 @@ struct vdpa_map_file {
  *				@iova: iova to be unmapped
  *				@size: size of the area
  *				Returns integer: success (0) or error (< 0)
+ * @reset_map:			Reset device memory mapping to the default
+ *				state (optional)
+ *				Needed for devices that are using device
+ *				specific DMA translation and prefer mapping
+ *				to be decoupled from the virtio life cycle,
+ *				i.e. device .reset op does not reset mapping
+ *				@vdev: vdpa device
+ *				@asid: address space identifier
+ *				Returns integer: success (0) or error (< 0)
  * @get_vq_dma_dev:		Get the dma device for a specific
  *				virtqueue (optional)
  *				@vdev: vdpa device
@@ -405,6 +414,7 @@ struct vdpa_config_ops {
 		       u64 iova, u64 size, u64 pa, u32 perm, void *opaque);
 	int (*dma_unmap)(struct vdpa_device *vdev, unsigned int asid,
 			 u64 iova, u64 size);
+	int (*reset_map)(struct vdpa_device *vdev, unsigned int asid);
 	int (*set_group_asid)(struct vdpa_device *vdev, unsigned int group,
 			      unsigned int asid);
 	struct device *(*get_vq_dma_dev)(struct vdpa_device *vdev, u16 idx);
-- 
1.8.3.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
