Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FBC68CA55
	for <lists.virtualization@lfdr.de>; Tue,  7 Feb 2023 00:12:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 647EA4171F;
	Mon,  6 Feb 2023 23:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 647EA4171F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=ZTGXVzJO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hsd5MdAWF9EG; Mon,  6 Feb 2023 23:12:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E2AE541740;
	Mon,  6 Feb 2023 23:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2AE541740
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 819C5C0083;
	Mon,  6 Feb 2023 23:12:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 234B0C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Feb 2023 23:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 099134150E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Feb 2023 23:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 099134150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5X4mVQUscJ7G
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Feb 2023 23:12:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEBC84157B
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEBC84157B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Feb 2023 23:12:29 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 316KDrhf003911; Mon, 6 Feb 2023 23:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=d3JugFvzxOjps33xev2euAm7g4qNmWk7oY4Vz08lzVM=;
 b=ZTGXVzJO4bSE/0v+jxfEf9XTuSzyyotNX2Yr1sT8ZUDVbokDhqLrYXLrLP+OYRPVXQ3Q
 O/CJGi2I2Q6qU8plhsB2VPWkS3lrRBZVZRKzS1RAHVSVgcVadQZmAl++AGTP0Gzhxtdf
 0pl444B7XsndMHsWr/nZWKSP0ruzEUkZuhnQ22nb+MBsTdmxRVJaKf7vNP29KPRkxf+U
 IcxiE5EoiIkiwA7ZSsuEf1fG7tKaZjv8VnjhCED5yeqAuHI9iUgHu1GC1X6ToRs6DjW3
 +NFGkS4Ri+ITH9CiGs5Ll0Ex0qsHhD+fEEXD0W8v3zTEmXKZDHZtwDdICP+5GOQwhPZh 0A== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nheytv8br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Feb 2023 23:12:28 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 316LpWgt021033; Mon, 6 Feb 2023 23:12:27 GMT
Received: from ban25x6uut24.us.oracle.com (ban25x6uut24.us.oracle.com
 [10.153.73.24])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3nhdt4sj6f-5; Mon, 06 Feb 2023 23:12:27 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: mst@redhat.com, jasowang@redhat.com, parav@nvidia.com, elic@nvidia.com
Subject: [PATCH RESENT v4 4/6] vdpa: validate device feature provisioning
 against supported class
Date: Mon,  6 Feb 2023 15:12:02 -0800
Message-Id: <1675725124-7375-5-git-send-email-si-wei.liu@oracle.com>
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
X-Proofpoint-GUID: KZV65-0zqrh8RBL-x8u4yUftGOYLTUxQ
X-Proofpoint-ORIG-GUID: KZV65-0zqrh8RBL-x8u4yUftGOYLTUxQ
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

Today when device features are explicitly provisioned, the features
user supplied may contain device class specific features that are
not supported by the parent management device. On the other hand,
when parent management device supports more than one class, the
device features to provision may be ambiguous if none of the class
specific attributes is provided at the same time. Validate these
cases and prompt appropriate user errors accordingly.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 drivers/vdpa/vdpa.c | 59 +++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 9 deletions(-)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 1eba978..8da5120 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -460,12 +460,28 @@ static int vdpa_nl_mgmtdev_handle_fill(struct sk_buff *msg, const struct vdpa_mg
 	return 0;
 }
 
+static u64 vdpa_mgmtdev_get_classes(const struct vdpa_mgmt_dev *mdev,
+				    unsigned int *nclasses)
+{
+	u64 supported_classes = 0;
+	unsigned int n = 0;
+
+	for (int i = 0; mdev->id_table[i].device; i++) {
+		if (mdev->id_table[i].device > 63)
+			continue;
+		supported_classes |= BIT_ULL(mdev->id_table[i].device);
+		n++;
+	}
+	if (nclasses)
+		*nclasses = n;
+
+	return supported_classes;
+}
+
 static int vdpa_mgmtdev_fill(const struct vdpa_mgmt_dev *mdev, struct sk_buff *msg,
 			     u32 portid, u32 seq, int flags)
 {
-	u64 supported_classes = 0;
 	void *hdr;
-	int i = 0;
 	int err;
 
 	hdr = genlmsg_put(msg, portid, seq, &vdpa_nl_family, flags, VDPA_CMD_MGMTDEV_NEW);
@@ -475,14 +491,9 @@ static int vdpa_mgmtdev_fill(const struct vdpa_mgmt_dev *mdev, struct sk_buff *m
 	if (err)
 		goto msg_err;
 
-	while (mdev->id_table[i].device) {
-		if (mdev->id_table[i].device <= 63)
-			supported_classes |= BIT_ULL(mdev->id_table[i].device);
-		i++;
-	}
-
 	if (nla_put_u64_64bit(msg, VDPA_ATTR_MGMTDEV_SUPPORTED_CLASSES,
-			      supported_classes, VDPA_ATTR_UNSPEC)) {
+			      vdpa_mgmtdev_get_classes(mdev, NULL),
+			      VDPA_ATTR_UNSPEC)) {
 		err = -EMSGSIZE;
 		goto msg_err;
 	}
@@ -566,13 +577,25 @@ static int vdpa_nl_cmd_mgmtdev_get_doit(struct sk_buff *skb, struct genl_info *i
 				 BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MTU)     | \
 				 BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MAX_VQP))
 
+/*
+ * Bitmask for all per-device features: feature bits VIRTIO_TRANSPORT_F_START
+ * through VIRTIO_TRANSPORT_F_END are unset, i.e. 0xfffffc000fffffff for
+ * all 64bit features. If the features are extended beyond 64 bits, or new
+ * "holes" are reserved for other type of features than per-device, this
+ * macro would have to be updated.
+ */
+#define VIRTIO_DEVICE_F_MASK (~0ULL << (VIRTIO_TRANSPORT_F_END + 1) | \
+			      ((1ULL << VIRTIO_TRANSPORT_F_START) - 1))
+
 static int vdpa_nl_cmd_dev_add_set_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct vdpa_dev_set_config config = {};
 	struct nlattr **nl_attrs = info->attrs;
 	struct vdpa_mgmt_dev *mdev;
+	unsigned int ncls = 0;
 	const u8 *macaddr;
 	const char *name;
+	u64 classes;
 	int err = 0;
 
 	if (!info->attrs[VDPA_ATTR_DEV_NAME])
@@ -649,6 +672,24 @@ static int vdpa_nl_cmd_dev_add_set_doit(struct sk_buff *skb, struct genl_info *i
 		goto err;
 	}
 
+	classes = vdpa_mgmtdev_get_classes(mdev, &ncls);
+	if (config.mask & VDPA_DEV_NET_ATTRS_MASK &&
+	    !(classes & BIT_ULL(VIRTIO_ID_NET))) {
+		NL_SET_ERR_MSG_MOD(info->extack,
+				   "Network class attributes provided on unsupported management device");
+		err = -EINVAL;
+		goto err;
+	}
+	if (!(config.mask & VDPA_DEV_NET_ATTRS_MASK) &&
+	    config.mask & BIT_ULL(VDPA_ATTR_DEV_FEATURES) &&
+	    classes & BIT_ULL(VIRTIO_ID_NET) && ncls > 1 &&
+	    config.device_features & VIRTIO_DEVICE_F_MASK) {
+		NL_SET_ERR_MSG_MOD(info->extack,
+				   "Management device supports multi-class while device features specified are ambiguous");
+		err = -EINVAL;
+		goto err;
+	}
+
 	err = mdev->ops->dev_add(mdev, name, &config);
 err:
 	up_write(&vdpa_dev_lock);
-- 
1.8.3.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
