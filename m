Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB2479D19D
	for <lists.virtualization@lfdr.de>; Tue, 12 Sep 2023 15:02:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC7FB8216A;
	Tue, 12 Sep 2023 13:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC7FB8216A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Dy7ElXEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfpUdvzwzP4E; Tue, 12 Sep 2023 13:02:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 32E8782158;
	Tue, 12 Sep 2023 13:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32E8782158
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02FDAC0DD7;
	Tue, 12 Sep 2023 13:02:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F3E4C0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Sep 2023 13:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CBE361194
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Sep 2023 13:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CBE361194
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=Dy7ElXEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3VZbMRMKb1ok
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Sep 2023 13:02:31 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::604])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19E58611DC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Sep 2023 13:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19E58611DC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTrf3Ut3Lm0GCBRdNrDLC9WZhfnX18JtfLYuKgXyo/Z2+nmYOy10L68fuEzx5YDqXnqGmxFChI2JIomcxPWFKXnV+KLUDKsddtTw9IeARacxQc8DY/TtyZI13655TWAR+piHZ9AQilntfzYS9ktJO5KVjjnw+vpuKhqk2iRNThrCOyXGipu2w4Rle1ZlIupHW0U0RjIQR48BtnzXeqCzTR4xml06sRwPwgIb39eyxrN5QfLRX9Jf06KOR7WBPcsrAnPv+HweIdA6jq+82X21OzpJFkEsasXL6B/zSGjPX9FYneFsBrmEgJHVqIqnmpZa2puIsUU64ajEWQGSsBPGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ApYXayR3INDzXVSk48cqn+dnUTPh1DTOtDvSZn0b3M=;
 b=Pk2jAkiscR+ciqLHAaToqsTew+FPIJyiONkiPaFoR+P6NYc8/dIg5D9ZkxWTX0hdFagw69RS3uSS5hCMJi9Ae0kUlbKerpLrwrLMUqXV92LYOpgKMWpJ2KdDKNqArTtIq9TM+DIJDDb0s+w/c+cv5b/m+Beq5vU5Ty8nvmK+uU2mFzO1AIAGcE9jol51xy8GhaUcH6hF3nUF/aJy/mR6JkcOKlTHWnpTU2nYdgGnnUG9HU3S4/H+KOuzprH8jFszHpOBFrNsaRzrkmG9CO2+9q+l69yg0LKQ4NFr+OdWKtlxIS6s94R8nHbM1vGBMoTwxFnvI+xj2Sa1gt97pivIIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ApYXayR3INDzXVSk48cqn+dnUTPh1DTOtDvSZn0b3M=;
 b=Dy7ElXECN86CQCBPV/eX92G1++ohVlxgJk7gI2+kvVWE8+6wo8IDe+Zqsbam7LXi9BJxXxAqmZyhHoMbuVrHMaCIpsmNXCgt4uGn7mGdGMucoXedLJ/Y8pQlINC4IVns89x73s2LHH3QogL3FrOaCsx7FnFpY3SM5x5lUc4yk9k3Re/cd0t3FMtUK1PCwIoqGeP3fCPdOPnM7QzFZBDRdN5GLhxczxjyEQzpBYE+ED8XT2A0tqS+FlcpRA3ueOILvwFB8p1o+XRP3bjQfVOOARJEGSLKdGY8uduBPU4pte4SlKb2F0OrJ/6i6oVsQAdQAUEVXwLnQ+EFl8zjkxZ6EA==
Received: from MW4PR04CA0312.namprd04.prod.outlook.com (2603:10b6:303:82::17)
 by DM6PR12MB4863.namprd12.prod.outlook.com (2603:10b6:5:1b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 13:02:22 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:82:cafe::9a) by MW4PR04CA0312.outlook.office365.com
 (2603:10b6:303:82::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.36 via Frontend
 Transport; Tue, 12 Sep 2023 13:02:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.17 via Frontend Transport; Tue, 12 Sep 2023 13:02:22 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 12 Sep 2023
 06:02:03 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 12 Sep
 2023 06:02:03 -0700
Received: from c-237-113-220-225.mtl.labs.mlnx (10.127.8.12) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.986.37 via
 Frontend Transport; Tue, 12 Sep 2023 06:02:00 -0700
To: Jason Wang <jasowang@redhat.com>, =?UTF-8?q?Eugenio=20P=C3=A9rez?=
 <eperezma@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 05/16] vdpa/mlx5: Decouple cvq iotlb handling from hw mapping
 code
Date: Tue, 12 Sep 2023 16:01:15 +0300
Message-ID: <20230912130132.561193-6-dtatulea@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912130132.561193-1-dtatulea@nvidia.com>
References: <20230912130132.561193-1-dtatulea@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|DM6PR12MB4863:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ea6259-4357-432b-6106-08dbb39080d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tPahj+bNomyuyNCXlQTvLODAh00KlT7qKCMgYXCNa7flTLIsLIUEfq5MrWd/IYZ/DtKih00C+lnjKWDHaeWzF7k6uMngbQ4BfNaDV0ymZowV6EgtB+hvmofyD3FTwOVXnjKM+JhTD7eBMsY0Z9Q9GyU9ZliThKkhFJ47EkNKCokuRHKmg88wQ8fUM7Tz/jlZle0Pu4BbNq991M4asGEHkGhIT3kpGHv+heTSrcVRtyO30CMXEyOaVkgG1nCq1EFM8CwzE+tSH9yfEcK8133VKnvJVHklRG7mno/kc3EO8AZ15d5Tlpb2HdJAU15Pj6vBojoZOFhjzlO3NjEo9ZK8Byj+zNq5t6tifBriOcot2PsGrUUKOL+bmXO8a29qdC+eEr987PwLzpRHsDCX+77Vt+aBPZZ31GoaAFWcBp+5hoAOQ5x8c7cuvjk7jkzcTz1O/mnX0mwUw9mnJjXpIDkJSE2fJYmvHVMl7GK1GWEJuSQXICs4+mi9xIYnFmNzpS2YE+RAZwsCmhXdBlARW/loJzBqr4+TW9Mw0UUI4F/8d+3834cgq4e9QbYyXEwlyw18QxcTriODdpi4BNA20KX3ty1zta8GnBCiN3Wz9Bf/cFIPMvuFkCp6uLMdJHhre/cI5IW15MywHHXNKnDfc/8ySMLtwKuymxioe2BnpkmBkseraAhKnZwon6z/UQRufKyWqWCM+/X+HrzUGMf8m/0yAe2BYX2TONGAGeq9hbXhQlA=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(82310400011)(186009)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(4326008)(40480700001)(8676002)(8936002)(36756003)(26005)(40460700003)(6666004)(7636003)(356005)(86362001)(5660300002)(82740400003)(2906002)(36860700001)(47076005)(336012)(426003)(70586007)(83380400001)(70206006)(110136005)(41300700001)(2616005)(1076003)(478600001)(54906003)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 13:02:22.0143 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ea6259-4357-432b-6106-08dbb39080d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4863
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, kvm@vger.kernel.org
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
From: Dragos Tatulea via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

The handling of the cvq iotlb is currently coupled with the creation
and destruction of the hardware mkeys (mr).

This patch moves cvq iotlb handling into its own function and shifts it
to a scope that is not related to mr handling. As cvq handling is just a
prune_iotlb + dup_iotlb cycle, put it all in the same "update" function.
Finally, the destruction path is handled by directly pruning the iotlb.

After this move is done the ASID mr code can be collapsed into a single
function.

Signed-off-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 drivers/vdpa/mlx5/core/mlx5_vdpa.h |  3 ++
 drivers/vdpa/mlx5/core/mr.c        | 57 +++++++++++-------------------
 drivers/vdpa/mlx5/net/mlx5_vnet.c  |  7 ++--
 3 files changed, 28 insertions(+), 39 deletions(-)

diff --git a/drivers/vdpa/mlx5/core/mlx5_vdpa.h b/drivers/vdpa/mlx5/core/mlx5_vdpa.h
index 3748f027cfe9..554899a80241 100644
--- a/drivers/vdpa/mlx5/core/mlx5_vdpa.h
+++ b/drivers/vdpa/mlx5/core/mlx5_vdpa.h
@@ -120,6 +120,9 @@ int mlx5_vdpa_create_mr(struct mlx5_vdpa_dev *mvdev, struct vhost_iotlb *iotlb,
 			unsigned int asid);
 void mlx5_vdpa_destroy_mr(struct mlx5_vdpa_dev *mvdev);
 void mlx5_vdpa_destroy_mr_asid(struct mlx5_vdpa_dev *mvdev, unsigned int asid);
+int mlx5_vdpa_update_cvq_iotlb(struct mlx5_vdpa_dev *mvdev,
+				struct vhost_iotlb *iotlb,
+				unsigned int asid);
 int mlx5_vdpa_create_dma_mr(struct mlx5_vdpa_dev *mvdev);
 
 #define mlx5_vdpa_warn(__dev, format, ...)                                                         \
diff --git a/drivers/vdpa/mlx5/core/mr.c b/drivers/vdpa/mlx5/core/mr.c
index 7bd0883b8b25..fcb6ae32e9ed 100644
--- a/drivers/vdpa/mlx5/core/mr.c
+++ b/drivers/vdpa/mlx5/core/mr.c
@@ -489,14 +489,6 @@ static void destroy_user_mr(struct mlx5_vdpa_dev *mvdev, struct mlx5_vdpa_mr *mr
 	}
 }
 
-static void _mlx5_vdpa_destroy_cvq_mr(struct mlx5_vdpa_dev *mvdev, unsigned int asid)
-{
-	if (mvdev->group2asid[MLX5_VDPA_CVQ_GROUP] != asid)
-		return;
-
-	prune_iotlb(mvdev);
-}
-
 static void _mlx5_vdpa_destroy_dvq_mr(struct mlx5_vdpa_dev *mvdev, unsigned int asid)
 {
 	struct mlx5_vdpa_mr *mr = &mvdev->mr;
@@ -522,25 +514,14 @@ void mlx5_vdpa_destroy_mr_asid(struct mlx5_vdpa_dev *mvdev, unsigned int asid)
 	mutex_lock(&mr->mkey_mtx);
 
 	_mlx5_vdpa_destroy_dvq_mr(mvdev, asid);
-	_mlx5_vdpa_destroy_cvq_mr(mvdev, asid);
 
 	mutex_unlock(&mr->mkey_mtx);
 }
 
 void mlx5_vdpa_destroy_mr(struct mlx5_vdpa_dev *mvdev)
 {
-	mlx5_vdpa_destroy_mr_asid(mvdev, mvdev->group2asid[MLX5_VDPA_CVQ_GROUP]);
 	mlx5_vdpa_destroy_mr_asid(mvdev, mvdev->group2asid[MLX5_VDPA_DATAVQ_GROUP]);
-}
-
-static int _mlx5_vdpa_create_cvq_mr(struct mlx5_vdpa_dev *mvdev,
-				    struct vhost_iotlb *iotlb,
-				    unsigned int asid)
-{
-	if (mvdev->group2asid[MLX5_VDPA_CVQ_GROUP] != asid)
-		return 0;
-
-	return dup_iotlb(mvdev, iotlb);
+	prune_iotlb(mvdev);
 }
 
 static int _mlx5_vdpa_create_dvq_mr(struct mlx5_vdpa_dev *mvdev,
@@ -572,22 +553,7 @@ static int _mlx5_vdpa_create_dvq_mr(struct mlx5_vdpa_dev *mvdev,
 static int _mlx5_vdpa_create_mr(struct mlx5_vdpa_dev *mvdev,
 				struct vhost_iotlb *iotlb, unsigned int asid)
 {
-	int err;
-
-	err = _mlx5_vdpa_create_dvq_mr(mvdev, iotlb, asid);
-	if (err)
-		return err;
-
-	err = _mlx5_vdpa_create_cvq_mr(mvdev, iotlb, asid);
-	if (err)
-		goto out_err;
-
-	return 0;
-
-out_err:
-	_mlx5_vdpa_destroy_dvq_mr(mvdev, asid);
-
-	return err;
+	return _mlx5_vdpa_create_dvq_mr(mvdev, iotlb, asid);
 }
 
 int mlx5_vdpa_create_mr(struct mlx5_vdpa_dev *mvdev, struct vhost_iotlb *iotlb,
@@ -620,7 +586,24 @@ int mlx5_vdpa_handle_set_map(struct mlx5_vdpa_dev *mvdev, struct vhost_iotlb *io
 	return err;
 }
 
+int mlx5_vdpa_update_cvq_iotlb(struct mlx5_vdpa_dev *mvdev,
+				struct vhost_iotlb *iotlb,
+				unsigned int asid)
+{
+	if (mvdev->group2asid[MLX5_VDPA_CVQ_GROUP] != asid)
+		return 0;
+
+	prune_iotlb(mvdev);
+	return dup_iotlb(mvdev, iotlb);
+}
+
 int mlx5_vdpa_create_dma_mr(struct mlx5_vdpa_dev *mvdev)
 {
-	return mlx5_vdpa_create_mr(mvdev, NULL, 0);
+	int err;
+
+	err = mlx5_vdpa_create_mr(mvdev, NULL, 0);
+	if (err)
+		return err;
+
+	return mlx5_vdpa_update_cvq_iotlb(mvdev, NULL, 0);
 }
diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index d34c19b4e139..061d8f7a661a 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -2884,10 +2884,13 @@ static int set_map_data(struct mlx5_vdpa_dev *mvdev, struct vhost_iotlb *iotlb,
 		return err;
 	}
 
-	if (change_map)
+	if (change_map) {
 		err = mlx5_vdpa_change_map(mvdev, iotlb, asid);
+		if (err)
+			return err;
+	}
 
-	return err;
+	return mlx5_vdpa_update_cvq_iotlb(mvdev, iotlb, asid);
 }
 
 static int mlx5_vdpa_set_map(struct vdpa_device *vdev, unsigned int asid,
-- 
2.41.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
