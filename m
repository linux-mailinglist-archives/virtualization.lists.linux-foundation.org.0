Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2480A68CA4E
	for <lists.virtualization@lfdr.de>; Tue,  7 Feb 2023 00:12:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A39E040590;
	Mon,  6 Feb 2023 23:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A39E040590
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=Vo72+tj9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cpycoZgC42Jr; Mon,  6 Feb 2023 23:12:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B9C754059B;
	Mon,  6 Feb 2023 23:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9C754059B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4E02C0078;
	Mon,  6 Feb 2023 23:12:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 367A7C007B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Feb 2023 23:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 112974150E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Feb 2023 23:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 112974150E
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=Vo72+tj9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zl_l1Ii7o5Zd
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Feb 2023 23:12:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 383C14157B
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 383C14157B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Feb 2023 23:12:27 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 316KE5p1028043; Mon, 6 Feb 2023 23:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=Qu7xVQBjH3QyINlgGCfvRYdJpf2OQd6ZDfiujBCmENo=;
 b=Vo72+tj9qTKIsQzCl06l7/pvPMZ8ENcIEgXrnFkXJfMxAxu8a/qG6Y7+PcqhcJF/slZx
 12PKvWVhuVY67YvwHC98xaoPy5MvOwyCrpoPWNIaQy3PW0xc4NSjZH3RYR8oGVtaKudb
 96iqmWK1LwJIUxHydECHmYFhaBEhC7+plitl1WdHUcjZDow6PCtTYfefIInjwgLKjYy/
 Qsnv8a3JlSWLWXNUjVCgkg6Gfqs0J5bRYIqGcu05HjVvUOb3NzDzWXwdnjQ00c+fi0sC
 X932WN+Caj6tT+N+OpxSwvfoJ16K7WFLY9nYtztO69a9SO15fOu3hfNaK4GpmMyKipBD 5A== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhdy1480k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Feb 2023 23:12:26 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 316LpWgr021033; Mon, 6 Feb 2023 23:12:25 GMT
Received: from ban25x6uut24.us.oracle.com (ban25x6uut24.us.oracle.com
 [10.153.73.24])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3nhdt4sj6f-3; Mon, 06 Feb 2023 23:12:25 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: mst@redhat.com, jasowang@redhat.com, parav@nvidia.com, elic@nvidia.com
Subject: [PATCH RESENT v4 2/6] vdpa: conditionally read STATUS in config space
Date: Mon,  6 Feb 2023 15:12:00 -0800
Message-Id: <1675725124-7375-3-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675725124-7375-1-git-send-email-si-wei.liu@oracle.com>
References: <1675725124-7375-1-git-send-email-si-wei.liu@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060202
X-Proofpoint-GUID: CWXNbnUoI1Kyj90cUxoll5WntXaSGl8Y
X-Proofpoint-ORIG-GUID: CWXNbnUoI1Kyj90cUxoll5WntXaSGl8Y
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

The spec says:
    status only exists if VIRTIO_NET_F_STATUS is set

Similar to MAC and MTU, vdpa_dev_net_config_fill() should read
STATUS conditionally depending on the feature bits.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Eli Cohen <elic@nvidia.com>
---
 drivers/vdpa/vdpa.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 3a82ca78..21c8aa3 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -843,18 +843,25 @@ static int vdpa_dev_net_mac_config_fill(struct sk_buff *msg, u64 features,
 			sizeof(config->mac), config->mac);
 }
 
+static int vdpa_dev_net_status_config_fill(struct sk_buff *msg, u64 features,
+					   const struct virtio_net_config *config)
+{
+	u16 val_u16;
+
+	if ((features & BIT_ULL(VIRTIO_NET_F_STATUS)) == 0)
+		return 0;
+
+	val_u16 = __virtio16_to_cpu(true, config->status);
+	return nla_put_u16(msg, VDPA_ATTR_DEV_NET_STATUS, val_u16);
+}
+
 static int vdpa_dev_net_config_fill(struct vdpa_device *vdev, struct sk_buff *msg)
 {
 	struct virtio_net_config config = {};
 	u64 features_device;
-	u16 val_u16;
 
 	vdev->config->get_config(vdev, 0, &config, sizeof(config));
 
-	val_u16 = __virtio16_to_cpu(true, config.status);
-	if (nla_put_u16(msg, VDPA_ATTR_DEV_NET_STATUS, val_u16))
-		return -EMSGSIZE;
-
 	features_device = vdev->config->get_device_features(vdev);
 
 	if (nla_put_u64_64bit(msg, VDPA_ATTR_DEV_FEATURES, features_device,
@@ -867,6 +874,9 @@ static int vdpa_dev_net_config_fill(struct vdpa_device *vdev, struct sk_buff *ms
 	if (vdpa_dev_net_mac_config_fill(msg, features_device, &config))
 		return -EMSGSIZE;
 
+	if (vdpa_dev_net_status_config_fill(msg, features_device, &config))
+		return -EMSGSIZE;
+
 	return vdpa_dev_net_mq_config_fill(msg, features_device, &config);
 }
 
-- 
1.8.3.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
