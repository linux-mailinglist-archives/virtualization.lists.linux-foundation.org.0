Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 467DA7B22E0
	for <lists.virtualization@lfdr.de>; Thu, 28 Sep 2023 18:50:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDA038316F;
	Thu, 28 Sep 2023 16:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDA038316F
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kp1LG4gm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q7ta-viudFXb; Thu, 28 Sep 2023 16:50:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9BC2A818C0;
	Thu, 28 Sep 2023 16:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BC2A818C0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77665C008D;
	Thu, 28 Sep 2023 16:50:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22A7DC008C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Sep 2023 16:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1A6C41BB5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Sep 2023 16:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1A6C41BB5
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=kp1LG4gm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pGggzL3KUIph
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Sep 2023 16:50:05 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::619])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF2F8414C9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Sep 2023 16:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF2F8414C9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgREUROKxv54f26aqI223bwY5/Y/YrFNa8OL2AbXu4dUSRHEySgTz1WN2yjYjePxyjnvZdeS2naogDxgsPrgb51P8gRWpDkVgdt585e33HzqNsL2r+1I1BAPzrHF1pIKwQELldMAVPefKuSRUTgbVVYZVAyINggJLwNd+rMq0Qy9EQm8L6/Lex3Q6/z3NzZxzOc1SH1oDGkF6/01q8HByKIyzhhFSkWxrxg6SX7qfrVhLCzMBdJDXyq7ORJrz73TFeyOa8q0ovv2ollyfEos3j6moann1G/+fNwbfQlntYJU5qwTMDYUfQh4Y7lux0lFFUlz7EAyjiD2uNqxkqGzBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vD/9ODOQ8spLLT2XMllWp5GS6vJBa2gpMx9/5yXJbBI=;
 b=IQVDCc7HZn2Zz1z91LMv8DZPV0O8ta9v4CkHpMPvQoi9BSwICCyz4j9kZLjhxk3VgcWDWYxsMbmC6mlMtIAAKLM4xnFOf+Leo0GarBaCWN4dEezucjH3vy1U4N8Lv2Z8zeyfks3UcQmvPnzwL03/IzGmygkjvlA9e2R3NsEfooVvygbC9r1mj/Ln5AYID2YZPuIO+SkVtpGBNB9mc5TQmsTo3Qho/cqHU0XxIO8XUL53H4IbEIY5D7O8uJ8eqJFTVizENIuafs67kyLvhbtTWFlJLoT9oQUiqjJ50WpcYkY2QyyQsgHpkhvoYTUNpmTKr2JeNya8iTV+4IgzgTW2Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vD/9ODOQ8spLLT2XMllWp5GS6vJBa2gpMx9/5yXJbBI=;
 b=kp1LG4gmwsoCUzrmFugGPyqMds7q7JSOf0/jW9Gz/Sba5FMSzkWMObKqGO0LGDea90gCtG7NWeM5QbyExZp/9qR3jDIdCIUzG4x9I2dNuZtqTscLIA7nOSTC+W8xN99ryejbNT4qZG061ycn08NFUNT4NxECVjBwA8sh3xQ8XUdZNo+x3ydnUxg7bajLlH9MmBGlNKYsTvnocyX+GMUWqcDVUQulE17MPIukaiypDyQhb+XF8vDvfK287Lp5HDo9macBZtZgMk1BXcPUtpizg9AHOQoQtcZxGKrwYL8MIK9TlIsqhaGSvaABZu2K0qnEwIabIuHfFcEX0af+vKAmOA==
Received: from MW4P223CA0027.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::32)
 by IA1PR12MB7685.namprd12.prod.outlook.com (2603:10b6:208:423::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Thu, 28 Sep
 2023 16:50:01 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:80:cafe::ea) by MW4P223CA0027.outlook.office365.com
 (2603:10b6:303:80::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24 via Frontend
 Transport; Thu, 28 Sep 2023 16:50:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.9 via Frontend Transport; Thu, 28 Sep 2023 16:50:01 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 28 Sep
 2023 09:49:49 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 28 Sep 2023 09:49:49 -0700
Received: from c-237-113-220-225.mtl.labs.mlnx (10.127.8.12) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.986.41
 via Frontend Transport; Thu, 28 Sep 2023 09:49:47 -0700
To: <eperezma@redhat.com>, <gal@nvidia.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>
Subject: [PATCH vhost 08/16] vdpa/mlx5: Collapse "dvq" mr add/delete functions
Date: Thu, 28 Sep 2023 19:45:19 +0300
Message-ID: <20230928164550.980832-10-dtatulea@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928164550.980832-2-dtatulea@nvidia.com>
References: <20230928164550.980832-2-dtatulea@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|IA1PR12MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: f2cac3b4-4ea4-4208-250b-08dbc042f4ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a6WjB0N6Im6iWAEj2BeqkumZvEi3rqsmxCtknIwSktltuKSRJouJMtihX2INI25wSMRRVM4rrEhX7MNLgBo3A6qUaDAwV8lp5EZMUoKADeqDn8S/vZDIhYbZaPG2ufG9fMas6eGbRzAFfGrDX0zFh02lzu7om4C2voiU8mntdPGHpsUfFJQtL1oe9tz9Si0RElKLdZpD+ZMZDnfW6s1g6InC7ScYT+hVvMq0TR36eO7EnF/PZnUhu4bh2+8FhTr8J4nZ5ylG++zd71iEq9pEAaJ9C8j3zQ1cju02kJRj922AUHWtJB7XWn54muB+5IG/SY5TdmRri2a+3IXasOzg/burEiUmFzR2f91f4T6GGtfj1dwaZTyaBggo34D0Iuj1Y2cNtToJCzbjQpO7Bh2cO2mk/485H7MIcUxGBojuAkdPDl3c11DEHIbdCbfzYbJlFyOtnZvaoY4dkJgVlAny2txNz9TwGN0zZdz4A6/GtHLwOBOx9xtBNmpIWor7QInVZOpHD9pGsm+rX8VeEL2OyLxDio99YBdMKFnt2TyNyjFfQ5COdJ1oeX4FuaGp9uEBbD2If799fCI+rCPyg+kSyqH7u0wODOrp0c5dowQFhmK373WhWEscZzZoX2dMUjCUXEzaRmX3bxQuNy+vinXlOt812Qux7Fu42RZjn19Vyv5S/ZHFYsR/pTz26JTCJ/1/S9x7pbQkEXDifawNoN/jBDur7jQ0wGH3gzQaPmlGnsDq47wU5R3If54mb8cdtkcd
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(64100799003)(186009)(82310400011)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(36756003)(40460700003)(86362001)(40480700001)(8936002)(26005)(70206006)(2616005)(426003)(54906003)(5660300002)(70586007)(8676002)(336012)(4326008)(41300700001)(316002)(110136005)(1076003)(36860700001)(2906002)(83380400001)(6666004)(478600001)(47076005)(82740400003)(7636003)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 16:50:01.1677 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2cac3b4-4ea4-4208-250b-08dbc042f4ed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7685
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
From: Dragos Tatulea via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Now that the cvq code is out of mlx5_vdpa_create/destroy_mr, the "dvq"
functions can be folded into their callers.

Having "dvq" in the naming will no longer be accurate in the downstream
patches.

Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 drivers/vdpa/mlx5/core/mr.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/vdpa/mlx5/core/mr.c b/drivers/vdpa/mlx5/core/mr.c
index 587300e7c18e..fde00497f4ad 100644
--- a/drivers/vdpa/mlx5/core/mr.c
+++ b/drivers/vdpa/mlx5/core/mr.c
@@ -489,7 +489,7 @@ static void destroy_user_mr(struct mlx5_vdpa_dev *mvdev, struct mlx5_vdpa_mr *mr
 	}
 }
 
-static void _mlx5_vdpa_destroy_dvq_mr(struct mlx5_vdpa_dev *mvdev, unsigned int asid)
+static void _mlx5_vdpa_destroy_mr(struct mlx5_vdpa_dev *mvdev, unsigned int asid)
 {
 	struct mlx5_vdpa_mr *mr = &mvdev->mr;
 
@@ -513,7 +513,7 @@ void mlx5_vdpa_destroy_mr_asid(struct mlx5_vdpa_dev *mvdev, unsigned int asid)
 
 	mutex_lock(&mr->mkey_mtx);
 
-	_mlx5_vdpa_destroy_dvq_mr(mvdev, asid);
+	_mlx5_vdpa_destroy_mr(mvdev, asid);
 
 	mutex_unlock(&mr->mkey_mtx);
 }
@@ -524,9 +524,9 @@ void mlx5_vdpa_destroy_mr(struct mlx5_vdpa_dev *mvdev)
 	prune_iotlb(mvdev);
 }
 
-static int _mlx5_vdpa_create_dvq_mr(struct mlx5_vdpa_dev *mvdev,
-				    struct vhost_iotlb *iotlb,
-				    unsigned int asid)
+static int _mlx5_vdpa_create_mr(struct mlx5_vdpa_dev *mvdev,
+				struct vhost_iotlb *iotlb,
+				unsigned int asid)
 {
 	struct mlx5_vdpa_mr *mr = &mvdev->mr;
 	int err;
@@ -550,12 +550,6 @@ static int _mlx5_vdpa_create_dvq_mr(struct mlx5_vdpa_dev *mvdev,
 	return 0;
 }
 
-static int _mlx5_vdpa_create_mr(struct mlx5_vdpa_dev *mvdev,
-				struct vhost_iotlb *iotlb, unsigned int asid)
-{
-	return _mlx5_vdpa_create_dvq_mr(mvdev, iotlb, asid);
-}
-
 int mlx5_vdpa_create_mr(struct mlx5_vdpa_dev *mvdev, struct vhost_iotlb *iotlb,
 			unsigned int asid)
 {
-- 
2.41.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
