Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A33EC7BF6C0
	for <lists.virtualization@lfdr.de>; Tue, 10 Oct 2023 11:05:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF17F813C5;
	Tue, 10 Oct 2023 09:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF17F813C5
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=dqPzgY4T
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiMA9nGyg8n9; Tue, 10 Oct 2023 09:05:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BEC4181314;
	Tue, 10 Oct 2023 09:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEC4181314
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E73F2C0DD3;
	Tue, 10 Oct 2023 09:05:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46A6AC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 09:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28E5560F1E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 09:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28E5560F1E
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=dqPzgY4T
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cn2CaLKxh4tW
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 09:05:39 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F29E60F11
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 09:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F29E60F11
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39A7xYjd002212; Tue, 10 Oct 2023 09:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2023-03-30;
 bh=qu/sS9ZNID3yHvjNcXeEspAM15qF3bafmisnhPGsjhQ=;
 b=dqPzgY4Tp0iqzSl72qjlk/AFSBvvW9sKi4q8sOEjDRyjsZjErLwOKLuLftvGSbdB6Kh1
 qjT7JpYgZkX2EpkqiPIqRl/SzaLZFf83X41dph0q7GEQoUIomASpqPsehgEZLh9KYlrE
 rd7CLZAym29NmevKTzK9T7UOgteEFjDxX8woiXLsDZW/QJ0KuZuedWZ8SbBG3b1F/GZi
 He7nhIJMAxBR6SpoE5HtTEZq6vn4YYXMshSH5icoa7WpeTgw61vnH9ebHvHTO2mlgHgh
 xAyJ1fyIXMietd7ScqG58m45Y6CSPpapU7/tvlB0iB56oOOD15DgDSzNCjjo6gs5mVBn 2Q== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tjyvumg51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Oct 2023 09:05:36 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 39A6sxrE021395; Tue, 10 Oct 2023 09:05:35 GMT
Received: from ban25x6uut24.us.oracle.com (ban25x6uut24.us.oracle.com
 [10.153.73.24])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3tjwsc5cy2-3; Tue, 10 Oct 2023 09:05:35 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 xuanzhuo@linux.alibaba.com, dtatulea@nvidia.com
Subject: [PATCH 2/4] vhost-vdpa: reset vendor specific mapping to initial
 state in .release
Date: Tue, 10 Oct 2023 02:02:58 -0700
Message-Id: <1696928580-7520-3-git-send-email-si-wei.liu@oracle.com>
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
X-Proofpoint-ORIG-GUID: gxDNOQCin2U6REVSseR0sYShSUBxZDDW
X-Proofpoint-GUID: gxDNOQCin2U6REVSseR0sYShSUBxZDDW
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

Devices with on-chip IOMMU or vendor specific IOTLB implementation
may need to restore iotlb mapping to the initial or default state
using the .reset_map op, as it's desirable for some parent devices
to solely manipulate mappings by its own, independent of virtio device
state. For instance, device reset does not cause mapping go away on
such IOTLB model in need of persistent mapping. Before vhost-vdpa
is going away, give them a chance to reset iotlb back to the initial
state in vhost_vdpa_cleanup().

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 drivers/vhost/vdpa.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 851535f..a3f8160 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -131,6 +131,15 @@ static struct vhost_vdpa_as *vhost_vdpa_find_alloc_as(struct vhost_vdpa *v,
 	return vhost_vdpa_alloc_as(v, asid);
 }
 
+static void vhost_vdpa_reset_map(struct vhost_vdpa *v, u32 asid)
+{
+	struct vdpa_device *vdpa = v->vdpa;
+	const struct vdpa_config_ops *ops = vdpa->config;
+
+	if (ops->reset_map)
+		ops->reset_map(vdpa, asid);
+}
+
 static int vhost_vdpa_remove_as(struct vhost_vdpa *v, u32 asid)
 {
 	struct vhost_vdpa_as *as = asid_to_as(v, asid);
@@ -140,6 +149,13 @@ static int vhost_vdpa_remove_as(struct vhost_vdpa *v, u32 asid)
 
 	hlist_del(&as->hash_link);
 	vhost_vdpa_iotlb_unmap(v, &as->iotlb, 0ULL, 0ULL - 1, asid);
+	/*
+	 * Devices with vendor specific IOMMU may need to restore
+	 * iotlb to the initial or default state which is not done
+	 * through device reset, as the IOTLB mapping manipulation
+	 * could be decoupled from the virtio device life cycle.
+	 */
+	vhost_vdpa_reset_map(v, asid);
 	kfree(as);
 
 	return 0;
-- 
1.8.3.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
