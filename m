Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB9D43B8AC
	for <lists.virtualization@lfdr.de>; Tue, 26 Oct 2021 19:55:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3302A608C9;
	Tue, 26 Oct 2021 17:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J15QrMDI_k_6; Tue, 26 Oct 2021 17:55:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DA768608CE;
	Tue, 26 Oct 2021 17:55:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C74DC0021;
	Tue, 26 Oct 2021 17:55:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8ECDDC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 17:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DE88608C9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 17:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v95xui1dOSfE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 17:55:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::616])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C3BA60774
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 17:55:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEDPm4pLzqNQktASZ5mpQeWhP7hP3Ob+VkbQGiBlq9l2+LKaBljmy9b3e1+Ep8EeN2BLAgN4poHrdMRl5aogNujL1rqg4bjH9wVhDtzhBQePxZ0VmaEWzfoigAtXSqdkVZYIPc7wp3YLn5TN4zjWAl3/JoZrgUvRg7pBgIqJMQqcy1NpAhYpdjAtS+atb6saXcbC8tjn7oqFoEvVepfSzdGu4V2JqBujAEajE2MxJn0jAsPvcgYxFMabzB/EeioLGgjMzW2TDAc13HI6uSP3PA1lW2oKjM8/mEsFz7tdKjSFAOnSi/tFixm3motYm5yRRJ64ctXOswX00NggT8T4vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS+IhVgFnSZwXG2tUO2V3GPjDjn8tGrB+84AXruNpeA=;
 b=ZH0FaMxKixmdiyB36L0pQ01cCn75oJ/TBN4mkML+jcXLnQxJChcjGQm3WywLgrkcpDdflR8Lb0nVPEj9q+HND7MR7yKH2bqppvdDSZ2LVOKznWSL0pNsxmpP2Qpk8dVMRDba+QckmJCQK5LJHLbM0aftSpRWawsX26rPjPvFAiRFnZ9dKSQtdSpiiWsqSqTRtcbCeZ/UcztQ77Pg+kmrNpCwN3GrHK4Kq5oXeLN8E+OShZUP6+PqpKz/sxXdiX5xc1KcxrDiic6JE/Vzae7WNKFx/mmiMij4QebweaCaEjXvV36Em89nCZNacYl2qZXvTV4txiArTh1ZBLcaoaTqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS+IhVgFnSZwXG2tUO2V3GPjDjn8tGrB+84AXruNpeA=;
 b=OqbF+VJiSRt2CWn0h1aJurDrjYUKUtPTbht5wkSRXFeR5/1cjSaXYC17ytNEzapDlJP2MRyKkDtKNHDPhq1bHpLrIU+UtUDIAYyIkH1t8iqrhRb4sB+c74bNsIdYKhzLlPAowZt5e4BvLl9cXfa26dmjgq+NWNqXhGsUqf9DPdEjMUX1P/B5h7I/Zm+yJVtFEBEqtS+HA9yDV8baYJirXORtNkA2hWqffgFNsYsVUR0by0ANk5Xom5hF/PRgRfJRK+2bGPrT9aS1oLcYGP2dnCc4eT8pn8Oz41HMr5xZDma3BsNDq3s8oFfALDnK4W02NatUkySuVPgXUYERSELkXw==
Received: from MWHPR14CA0034.namprd14.prod.outlook.com (2603:10b6:300:12b::20)
 by DM6PR12MB4633.namprd12.prod.outlook.com (2603:10b6:5:16f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 17:55:45 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:12b:cafe::9c) by MWHPR14CA0034.outlook.office365.com
 (2603:10b6:300:12b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Tue, 26 Oct 2021 17:55:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 17:55:45 +0000
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Tue, 26 Oct 2021 17:55:41 +0000
To: <virtualization@lists.linux-foundation.org>
Subject: [PATCH linux-next v7 1/8] vdpa: Introduce and use vdpa device get,
 set config helpers
Date: Tue, 26 Oct 2021 20:55:12 +0300
Message-ID: <20211026175519.87795-2-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211026175519.87795-1-parav@nvidia.com>
References: <20211026175519.87795-1-parav@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fd977c0-1370-4b7e-76cd-08d998a9d5cd
X-MS-TrafficTypeDiagnostic: DM6PR12MB4633:
X-Microsoft-Antispam-PRVS: <DM6PR12MB463316D78ABAC6A0F1A2520FDC849@DM6PR12MB4633.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KeLBOGavL5LeM8KMzNiXIfApZ20KbA1yA/fDDztXW9+qHIg4sVX8+f7C8yHbM8XTzFsS1INRguouXllVQuUeQ5JzkzNLud8WUJhFrYon90H5+xShko4o37CnmHsn1L2hoN5dwJMZ8WEvNXw5DRb/DqAhrclExzuLk8IlZB9dE7a5QbEaj1ZacB1QSuZ9QXvthe2QffWLqnKaq2TnINc1YZdXXzI8CNepQ4Lyj3XXPWJvPMwfgPTGRLlgMfOXkZ4VleiRTFazRqpS8Hi7cKNEXOJksRlCIU+5/StKV9Hs1IMxNrppk4hnuyhBDn5vpJ8US4n3wGxAB+PZreXPESQ+uGHQl5hTxMUj/0jkuDgAJOxQxKkff3wXBRRwx7cHJktyzRoTgmODb3ANcPORU3COprlQwpJ0SKwlBHbcJ5vdR1uGihVFRMZCcAHTu7kTPl1mopXZw9QFJqH/hy48kNuqQJAX9sIvOjxB88huCPn+Aa1OBGtqQXv5YtiqDCTmsmhgkHki5U2OijzmRwZ1L1iGBfChXBLL4P4wgxr8FVENm1iIM5eOdO4VTkZmiY+BOECEBv+A/eUqt9Q3MAG3IYLU414f5kR+K3lzYaGxlPgSfr+f0Yu0cr86Qa5n0xQAiGvkfj0c3AyI4faXKaRQFlG23/AhsqwhTB7UAFJeqG1QVSg84zR7efkDCRsWXfyzmWn5rp59TC+/VQg2ZsnWYcxkrQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(54906003)(8676002)(336012)(508600001)(316002)(8936002)(7636003)(2906002)(1076003)(16526019)(36756003)(6916009)(2616005)(6666004)(186003)(70586007)(36860700001)(70206006)(82310400003)(4326008)(86362001)(356005)(5660300002)(47076005)(83380400001)(26005)(426003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 17:55:45.2463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd977c0-1370-4b7e-76cd-08d998a9d5cd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4633
Cc: elic@nvidia.com, mst@redhat.com
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
From: Parav Pandit via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Parav Pandit <parav@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Subsequent patches enable get and set configuration either
via management device or via vdpa device' config ops.

This requires synchronization between multiple callers to get and set
config callbacks. Features setting also influence the layout of the
configuration fields endianness.

To avoid exposing synchronization primitives to callers, introduce
helper for setting the configuration and use it.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Eli Cohen <elic@nvidia.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
---
changelog:
v4->v5:
 - use vdpa_set_config() API in virtio_vdpa driver
---
 drivers/vdpa/vdpa.c          | 36 ++++++++++++++++++++++++++++++++++++
 drivers/vhost/vdpa.c         |  3 +--
 drivers/virtio/virtio_vdpa.c |  3 +--
 include/linux/vdpa.h         | 19 ++++---------------
 4 files changed, 42 insertions(+), 19 deletions(-)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 4aeb1458b924..d42697699366 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -297,6 +297,42 @@ void vdpa_mgmtdev_unregister(struct vdpa_mgmt_dev *mdev)
 }
 EXPORT_SYMBOL_GPL(vdpa_mgmtdev_unregister);
 
+/**
+ * vdpa_get_config - Get one or more device configuration fields.
+ * @vdev: vdpa device to operate on
+ * @offset: starting byte offset of the field
+ * @buf: buffer pointer to read to
+ * @len: length of the configuration fields in bytes
+ */
+void vdpa_get_config(struct vdpa_device *vdev, unsigned int offset,
+		     void *buf, unsigned int len)
+{
+	const struct vdpa_config_ops *ops = vdev->config;
+
+	/*
+	 * Config accesses aren't supposed to trigger before features are set.
+	 * If it does happen we assume a legacy guest.
+	 */
+	if (!vdev->features_valid)
+		vdpa_set_features(vdev, 0);
+	ops->get_config(vdev, offset, buf, len);
+}
+EXPORT_SYMBOL_GPL(vdpa_get_config);
+
+/**
+ * vdpa_set_config - Set one or more device configuration fields.
+ * @vdev: vdpa device to operate on
+ * @offset: starting byte offset of the field
+ * @buf: buffer pointer to read from
+ * @length: length of the configuration fields in bytes
+ */
+void vdpa_set_config(struct vdpa_device *vdev, unsigned int offset,
+		     const void *buf, unsigned int length)
+{
+	vdev->config->set_config(vdev, offset, buf, length);
+}
+EXPORT_SYMBOL_GPL(vdpa_set_config);
+
 static bool mgmtdev_handle_match(const struct vdpa_mgmt_dev *mdev,
 				 const char *busname, const char *devname)
 {
diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 39039e046117..01c59ce7e250 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -237,7 +237,6 @@ static long vhost_vdpa_set_config(struct vhost_vdpa *v,
 				  struct vhost_vdpa_config __user *c)
 {
 	struct vdpa_device *vdpa = v->vdpa;
-	const struct vdpa_config_ops *ops = vdpa->config;
 	struct vhost_vdpa_config config;
 	unsigned long size = offsetof(struct vhost_vdpa_config, buf);
 	u8 *buf;
@@ -251,7 +250,7 @@ static long vhost_vdpa_set_config(struct vhost_vdpa *v,
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);
 
-	ops->set_config(vdpa, config.off, buf, config.len);
+	vdpa_set_config(vdpa, config.off, buf, config.len);
 
 	kvfree(buf);
 	return 0;
diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
index e42ace29daa1..4bb148d4b4e8 100644
--- a/drivers/virtio/virtio_vdpa.c
+++ b/drivers/virtio/virtio_vdpa.c
@@ -65,9 +65,8 @@ static void virtio_vdpa_set(struct virtio_device *vdev, unsigned offset,
 			    const void *buf, unsigned len)
 {
 	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
-	const struct vdpa_config_ops *ops = vdpa->config;
 
-	ops->set_config(vdpa, offset, buf, len);
+	vdpa_set_config(vdpa, offset, buf, len);
 }
 
 static u32 virtio_vdpa_generation(struct virtio_device *vdev)
diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index 30864848950b..267236aab34c 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -386,21 +386,10 @@ static inline int vdpa_set_features(struct vdpa_device *vdev, u64 features)
 	return ops->set_features(vdev, features);
 }
 
-static inline void vdpa_get_config(struct vdpa_device *vdev,
-				   unsigned int offset, void *buf,
-				   unsigned int len)
-{
-	const struct vdpa_config_ops *ops = vdev->config;
-
-	/*
-	 * Config accesses aren't supposed to trigger before features are set.
-	 * If it does happen we assume a legacy guest.
-	 */
-	if (!vdev->features_valid)
-		vdpa_set_features(vdev, 0);
-	ops->get_config(vdev, offset, buf, len);
-}
-
+void vdpa_get_config(struct vdpa_device *vdev, unsigned int offset,
+		     void *buf, unsigned int len);
+void vdpa_set_config(struct vdpa_device *dev, unsigned int offset,
+		     const void *buf, unsigned int length);
 /**
  * struct vdpa_mgmtdev_ops - vdpa device ops
  * @dev_add: Add a vdpa device using alloc and register
-- 
2.25.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
