Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9939868CA3D
	for <lists.virtualization@lfdr.de>; Tue,  7 Feb 2023 00:08:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBED1405C0;
	Mon,  6 Feb 2023 23:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBED1405C0
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=kwvLN6Ad
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RQRXLOtR3Hoe; Mon,  6 Feb 2023 23:08:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2142C40594;
	Mon,  6 Feb 2023 23:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2142C40594
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEB0BC0032;
	Mon,  6 Feb 2023 23:08:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C97AC002B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Feb 2023 23:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBA7060C24
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Feb 2023 23:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBA7060C24
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=kwvLN6Ad
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQgzX_TixQt7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Feb 2023 23:08:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20D3F60C20
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20D3F60C20
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Feb 2023 23:08:24 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 316KE5lo028054; Mon, 6 Feb 2023 23:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=9jOxWRKfGQrPvyThoIL2nkqwCTwWn4JHfQboUAfZaXU=;
 b=kwvLN6AdDO7d2ai9CTY6TUr9kyQGVXFTqXJcLOFOcB/F5xI6rt9B65p5axH6rNKA4uLk
 CK+He5Yu+RlViOcGtbjRRX2qv+ZXN6swQiBjwJB4bK3txC4RzLoHvu58YS29nz98ERAa
 LPaXbudwqkHW/j9jkPic5SkclkfyWnymMT+fzNTtX4UjOxrInVLAGGxh77mAu3RVtJdy
 i0kp8eAStoZusK4ltMvucJfvF7BdhoAT7lXhm3fMXrB+xOzpDvVS/sQZPADmKHSCogOW
 BZPrVcZIDWibF3jlfEvb1k5Pqr1mseP/XKZhxae3WIh1tWPEHOwHaf1xsWsjF2sAIEyA aQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhdy147ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Feb 2023 23:08:23 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 316LbeUO040865; Mon, 6 Feb 2023 23:08:22 GMT
Received: from ban25x6uut24.us.oracle.com (ban25x6uut24.us.oracle.com
 [10.153.73.24])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3nhdtb99m7-7; Mon, 06 Feb 2023 23:08:22 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: mst@redhat.com, jasowang@redhat.com, parav@nvidia.com, elic@nvidia.com
Subject: [PATCH v3 6/6] vdpa/mlx5: support device features provisioning
Date: Mon,  6 Feb 2023 15:08:00 -0800
Message-Id: <1675724880-7216-7-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675724880-7216-1-git-send-email-si-wei.liu@oracle.com>
References: <1675724880-7216-1-git-send-email-si-wei.liu@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302060202
X-Proofpoint-GUID: xp7rfTzRFBMAZ-6xtY0i0dPFeQKFAFET
X-Proofpoint-ORIG-GUID: xp7rfTzRFBMAZ-6xtY0i0dPFeQKFAFET
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

This patch implements features provisioning for mlx5_vdpa.

1) Validate the provisioned features are a subset of the parent
    features.
2) Clearing features that are not wanted by userspace.

For example:

    # vdpa mgmtdev show
    pci/0000:41:04.2:
      supported_classes net
      max_supported_vqs 65
      dev_features CSUM GUEST_CSUM MTU MAC HOST_TSO4 HOST_TSO6 STATUS CTRL_VQ CTRL_VLAN MQ CTRL_MAC_ADDR VERSION_1 ACCESS_PLATFORM

1) Provision vDPA device with all features derived from the parent

    # vdpa dev add name vdpa1 mgmtdev pci/0000:41:04.2
    # vdpa dev config show
    vdpa1: mac e4:11:c6:d3:45:f0 link up link_announce false max_vq_pairs 1 mtu 1500
      negotiated_features CSUM GUEST_CSUM MTU HOST_TSO4 HOST_TSO6 STATUS CTRL_VQ CTRL_VLAN MQ CTRL_MAC_ADDR VERSION_1 ACCESS_PLATFORM

2) Provision vDPA device with a subset of parent features

    # vdpa dev add name vdpa1 mgmtdev pci/0000:41:04.2 device_features 0x300020000
    # vdpa dev config show
    vdpa1:
      negotiated_features CTRL_VQ VERSION_1 ACCESS_PLATFORM

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Reviewed-by: Eli Cohen <elic@nvidia.com>
---
 drivers/vdpa/mlx5/net/mlx5_vnet.c | 53 +++++++++++++++++++++++++++++++++------
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index 867ac18..b40dd1a 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -2183,6 +2183,7 @@ static u64 get_supported_features(struct mlx5_core_dev *mdev)
 	mlx_vdpa_features |= BIT_ULL(VIRTIO_NET_F_STATUS);
 	mlx_vdpa_features |= BIT_ULL(VIRTIO_NET_F_MTU);
 	mlx_vdpa_features |= BIT_ULL(VIRTIO_NET_F_CTRL_VLAN);
+	mlx_vdpa_features |= BIT_ULL(VIRTIO_NET_F_MAC);
 
 	return mlx_vdpa_features;
 }
@@ -3062,6 +3063,7 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
 	struct mlx5_vdpa_dev *mvdev;
 	struct mlx5_vdpa_net *ndev;
 	struct mlx5_core_dev *mdev;
+	u64 device_features;
 	u32 max_vqs;
 	u16 mtu;
 	int err;
@@ -3070,6 +3072,24 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
 		return -ENOSPC;
 
 	mdev = mgtdev->madev->mdev;
+	device_features = mgtdev->mgtdev.supported_features;
+	if (add_config->mask & BIT_ULL(VDPA_ATTR_DEV_FEATURES)) {
+		if (add_config->device_features & ~device_features) {
+			dev_warn(mdev->device,
+				 "The provisioned features 0x%llx are not supported by this device with features 0x%llx\n",
+				 add_config->device_features, device_features);
+			return -EINVAL;
+		}
+		device_features &= add_config->device_features;
+	}
+	if (!(device_features & BIT_ULL(VIRTIO_F_VERSION_1) &&
+	      device_features & BIT_ULL(VIRTIO_F_ACCESS_PLATFORM))) {
+		dev_warn(mdev->device,
+			 "Must provision minimum features 0x%llx for this device",
+			 BIT_ULL(VIRTIO_F_VERSION_1) | BIT_ULL(VIRTIO_F_ACCESS_PLATFORM));
+		return -EOPNOTSUPP;
+	}
+
 	if (!(MLX5_CAP_DEV_VDPA_EMULATION(mdev, virtio_queue_type) &
 	    MLX5_VIRTIO_EMULATION_CAP_VIRTIO_QUEUE_TYPE_SPLIT)) {
 		dev_warn(mdev->device, "missing support for split virtqueues\n");
@@ -3098,7 +3118,6 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
 	if (IS_ERR(ndev))
 		return PTR_ERR(ndev);
 
-	ndev->mvdev.mlx_features = mgtdev->mgtdev.supported_features;
 	ndev->mvdev.max_vqs = max_vqs;
 	mvdev = &ndev->mvdev;
 	mvdev->mdev = mdev;
@@ -3120,7 +3139,7 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
 			goto err_alloc;
 	}
 
-	if (ndev->mvdev.mlx_features & BIT_ULL(VIRTIO_NET_F_MTU)) {
+	if (device_features & BIT_ULL(VIRTIO_NET_F_MTU)) {
 		err = query_mtu(mdev, &mtu);
 		if (err)
 			goto err_alloc;
@@ -3128,7 +3147,7 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
 		ndev->config.mtu = cpu_to_mlx5vdpa16(mvdev, mtu);
 	}
 
-	if (ndev->mvdev.mlx_features & BIT_ULL(VIRTIO_NET_F_STATUS)) {
+	if (device_features & BIT_ULL(VIRTIO_NET_F_STATUS)) {
 		if (get_link_state(mvdev))
 			ndev->config.status |= cpu_to_mlx5vdpa16(mvdev, VIRTIO_NET_S_LINK_UP);
 		else
@@ -3137,7 +3156,9 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
 
 	if (add_config->mask & (1 << VDPA_ATTR_DEV_NET_CFG_MACADDR)) {
 		memcpy(ndev->config.mac, add_config->net.mac, ETH_ALEN);
-	} else {
+	/* No bother setting mac address in config if not going to provision _F_MAC */
+	} else if ((add_config->mask & BIT_ULL(VDPA_ATTR_DEV_FEATURES)) == 0 ||
+		   device_features & BIT_ULL(VIRTIO_NET_F_MAC)) {
 		err = mlx5_query_nic_vport_mac_address(mdev, 0, 0, config->mac);
 		if (err)
 			goto err_alloc;
@@ -3148,11 +3169,26 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
 		err = mlx5_mpfs_add_mac(pfmdev, config->mac);
 		if (err)
 			goto err_alloc;
-
-		ndev->mvdev.mlx_features |= BIT_ULL(VIRTIO_NET_F_MAC);
+	} else if ((add_config->mask & BIT_ULL(VDPA_ATTR_DEV_FEATURES)) == 0) {
+		/*
+		 * We used to clear _F_MAC feature bit if seeing
+		 * zero mac address when device features are not
+		 * specifically provisioned. Keep the behaviour
+		 * so old scripts do not break.
+		 */
+		device_features &= ~BIT_ULL(VIRTIO_NET_F_MAC);
+	} else if (device_features & BIT_ULL(VIRTIO_NET_F_MAC)) {
+		/* Don't provision zero mac address for _F_MAC */
+		mlx5_vdpa_warn(&ndev->mvdev,
+			       "No mac address provisioned?\n");
+		err = -EINVAL;
+		goto err_alloc;
 	}
 
-	config->max_virtqueue_pairs = cpu_to_mlx5vdpa16(mvdev, max_vqs / 2);
+	if (device_features & BIT_ULL(VIRTIO_NET_F_MQ))
+		config->max_virtqueue_pairs = cpu_to_mlx5vdpa16(mvdev, max_vqs / 2);
+
+	ndev->mvdev.mlx_features = device_features;
 	mvdev->vdev.dma_dev = &mdev->pdev->dev;
 	err = mlx5_vdpa_alloc_resources(&ndev->mvdev);
 	if (err)
@@ -3249,7 +3285,8 @@ static int mlx5v_probe(struct auxiliary_device *adev,
 	mgtdev->mgtdev.id_table = id_table;
 	mgtdev->mgtdev.config_attr_mask = BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MACADDR) |
 					  BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MAX_VQP) |
-					  BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MTU);
+					  BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MTU) |
+					  BIT_ULL(VDPA_ATTR_DEV_FEATURES);
 	mgtdev->mgtdev.max_supported_vqs =
 		MLX5_CAP_DEV_VDPA_EMULATION(mdev, max_num_virtio_queues) + 1;
 	mgtdev->mgtdev.supported_features = get_supported_features(mdev);
-- 
1.8.3.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
