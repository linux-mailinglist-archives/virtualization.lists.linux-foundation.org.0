Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 678B6726957
	for <lists.virtualization@lfdr.de>; Wed,  7 Jun 2023 21:01:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C542040CBF;
	Wed,  7 Jun 2023 19:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C542040CBF
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=avauFENl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHb3gZLI7jTd; Wed,  7 Jun 2023 19:01:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2BB1A40C99;
	Wed,  7 Jun 2023 19:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BB1A40C99
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67250C008C;
	Wed,  7 Jun 2023 19:01:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BE58C0029
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Jun 2023 19:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D2D4830E6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Jun 2023 19:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D2D4830E6
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=avauFENl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iSNytI4m4vce
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Jun 2023 19:01:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1DA5830C0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::611])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1DA5830C0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Jun 2023 19:01:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqIenxq82g8fBZFpsHj/FMZi+iWBSApgywys28u4wPewmRHwoyIUpGcJvM5P6ry5aq7qXdVxG3Qn7cAfW4Zo1iUflyuO/6OhIGDa9aJZz/OcUkxKC2Jao4/gHY1PGTEEQwKt0WaUW/t8mw9tEaBDWtlBwPvRh/JJnkTRZsCOVZLpBzS9eg6unOlVEa3EXQhstqJFZRVQF8ydcq7O5xQIIc1wehZPtWhcb4Fe7fHwRopz2bx6Js6ET5Slggknnrmm5Odn1SMtkoTBsc+/LjkaOwBoUCl5tzYpszB/VOxekW4r5/KUdwKV+AiQ3fqoQuVg6NcuxC5dggcPAK8TpjhcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNMkajHDdoo/e9Of0BBFcNIjrv1o+/qrMe4NwZMIGq8=;
 b=hPKNYoJwZ7sTWL4Jbpyn9uNa5DgPj1L0OJLync/kzyK+OizJXzF6pui1MHypnoPf4BxqkyVWAxsK78jd83uR0ByuKk95EkLeSZBV7mJmQaMti8NnVOYs7P7IQS/o1Ae3Gx3ofvy5Uf0TL6ll4A6wr3b6pgy7JKJgqutW3bKjRP8tmerjyikFWncMf2W/kFG8iN2hF/mHO+M8JDUwTCkNf2o7FZWDwFPNiTsbwAfYENCuCd/KpJSxDTCrdDz3OZT0514kpJ6kNr19RVvbbIyi08wsFGZT9pRAVZ8yP5BzNvCTOraGazkMMJH30DEMpsnb+wA9tqDBN3eu48E3GdXDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNMkajHDdoo/e9Of0BBFcNIjrv1o+/qrMe4NwZMIGq8=;
 b=avauFENl8JSW+J0T6BoGxIoc05NB19FsA7R/SGyJNSQcvcDFBi/+7PbCimpx9HKKc/Kv7gtkt0EkgtViRQTb+mbbBnip0e8ya5QKSNjX8xlXak45aYmgI6+8QEwM4ow+WI+yjPOy4394TSiya4HjSLtC2npUsTndnDzEZIunO+A5Fskw6zfb3bitmaZBR2De4Ohg3yN7MNbMVeJ02OiJWTtTww4CZuw5MIJVNTvAYPtTEj5UFhK3FIEZmR/qoPlPXwYSBis4KHnsJE6jg7Ee1mwPxoMfn4R7OBUmc+vsSiGFQ46MGLKZtu6FptCKcsan/5ob4YftJELAf52YgEl9lA==
Received: from DS7PR03CA0273.namprd03.prod.outlook.com (2603:10b6:5:3ad::8) by
 CH2PR12MB4166.namprd12.prod.outlook.com (2603:10b6:610:78::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Wed, 7 Jun 2023 19:01:28 +0000
Received: from DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::9) by DS7PR03CA0273.outlook.office365.com
 (2603:10b6:5:3ad::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 19:01:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT114.mail.protection.outlook.com (10.13.172.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.24 via Frontend Transport; Wed, 7 Jun 2023 19:01:27 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 7 Jun 2023
 12:01:14 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Wed, 7 Jun 2023
 12:01:14 -0700
Received: from localhost.localdomain (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Wed, 7 Jun 2023 12:01:12 -0700
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: [PATCH] vdpa/mlx5: Support interrupt bypassing
Date: Wed, 7 Jun 2023 22:00:06 +0300
Message-ID: <20230607190007.290505-1-dtatulea@nvidia.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT114:EE_|CH2PR12MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: c1217d48-6e73-43f8-04a4-08db67899906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MNmN4XtGU0VUXnSwJ3kg5v9m6VWizBICsNSB8u+lBPwFxdIvFu2GpieamtAM5BVyHSWRkXf25iILYgGFErav4W/7zrkSDgZ2GBN9/NLCq/iAPOPtBIRySTQTGM0ScXT0CKKVNB/bKXEebolNt7M+J3zs+SnPkvrMea4NrYVzIW05NeFXPQ8A4FkhT+YWLQ80H3f6T1xN+ccVaASoymud00H7gmu5vK5rZgUisx/p89kLwUPZIFeil8cSkpnm27YpJz0Aswa30JI/vnkVjPB8sBIORnMKGGa9UBuC9tf8qVumNkFDQ5mxmJkVyjCCfQI+J9jE68qFAuhLu84D593q2HpR0SQKInJGDshG1xcp0sYpBSH5hV4HDIbI1iXb4L4kqJ7T//Ro0NJm/+JbZKEBZsMiXBJbUWX4A5bBZSSF01jsdaYWIy/kBWG8A5GbXF4a/k3bmbv8LBgi9/Hw0mgdloF9XOTeKJYiX4pibiE0YwMf4jZJgECrhQyo82mBgJLk9FqbQ1R2Z40Mq8FmVbseNymdlfrO79/DW3I6J8itqQuoiSAoRjc6sMfwUYb2/oKBOHuz765vQhoCYHuK4NcV4R3SGouc48I0shk01TbvuMn4hXg3/kMQyNU5+/A8LAxt2X+yOWh+XjLJh6+u4bVfZfYKlNmJgumaoabE5G0VufjbfPn2xaCGUxDZH00ByocmQuXW/SN5Df6slhD6yANUSr95ZlYh7Rl6oGTgoK6Cj8kzk+RZsSp0G+DnXLdr+gCw
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(86362001)(7636003)(82740400003)(83380400001)(54906003)(110136005)(47076005)(336012)(426003)(70206006)(70586007)(4326008)(6666004)(356005)(82310400005)(478600001)(2906002)(36756003)(186003)(36860700001)(40460700003)(2616005)(5660300002)(8936002)(41300700001)(8676002)(40480700001)(316002)(66899021)(26005)(1076003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 19:01:27.7139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1217d48-6e73-43f8-04a4-08db67899906
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4166
Cc: Eli Cohen <elic@nvidia.com>, saeedm@nvidia.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

From: Eli Cohen <elic@nvidia.com>

Add support for generation of interrupts from the device directly to the
VM to the VCPU thus avoiding the overhead on the host CPU.

When supported, the driver will attempt to allocate vectors for each
data virtqueue. If a vector for a virtqueue cannot be provided it will
use the QP mode where notifications go through the driver.

In addition, we add a shutdown callback to make sure allocated
interrupts are released in case of shutdown to allow clean shutdown.

Signed-off-by: Eli Cohen <elic@nvidia.com>
Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>
---
 drivers/vdpa/mlx5/net/mlx5_vnet.c | 165 ++++++++++++++++++++++++++++--
 drivers/vdpa/mlx5/net/mlx5_vnet.h |  15 +++
 2 files changed, 171 insertions(+), 9 deletions(-)

diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index 279ac6a558d2..9138ef2fb2c8 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -83,6 +83,7 @@ struct mlx5_vq_restore_info {
 	u64 driver_addr;
 	u16 avail_index;
 	u16 used_index;
+	struct msi_map map;
 	bool ready;
 	bool restore;
 };
@@ -118,6 +119,7 @@ struct mlx5_vdpa_virtqueue {
 	u16 avail_idx;
 	u16 used_idx;
 	int fw_state;
+	struct msi_map map;
 
 	/* keep last in the struct */
 	struct mlx5_vq_restore_info ri;
@@ -808,6 +810,13 @@ static bool counters_supported(const struct mlx5_vdpa_dev *mvdev)
 	       BIT_ULL(MLX5_OBJ_TYPE_VIRTIO_Q_COUNTERS);
 }
 
+static bool msix_mode_supported(struct mlx5_vdpa_dev *mvdev)
+{
+	return MLX5_CAP_DEV_VDPA_EMULATION(mvdev->mdev, event_mode) &
+		(1 << MLX5_VIRTIO_Q_EVENT_MODE_MSIX_MODE) &&
+		pci_msix_can_alloc_dyn(mvdev->mdev->pdev);
+}
+
 static int create_virtqueue(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *mvq)
 {
 	int inlen = MLX5_ST_SZ_BYTES(create_virtio_net_q_in);
@@ -849,9 +858,15 @@ static int create_virtqueue(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtque
 	if (vq_is_tx(mvq->index))
 		MLX5_SET(virtio_net_q_object, obj_context, tisn_or_qpn, ndev->res.tisn);
 
-	MLX5_SET(virtio_q, vq_ctx, event_mode, MLX5_VIRTIO_Q_EVENT_MODE_QP_MODE);
+	if (mvq->map.virq) {
+		MLX5_SET(virtio_q, vq_ctx, event_mode, MLX5_VIRTIO_Q_EVENT_MODE_MSIX_MODE);
+		MLX5_SET(virtio_q, vq_ctx, event_qpn_or_msix, mvq->map.index);
+	} else {
+		MLX5_SET(virtio_q, vq_ctx, event_mode, MLX5_VIRTIO_Q_EVENT_MODE_QP_MODE);
+		MLX5_SET(virtio_q, vq_ctx, event_qpn_or_msix, mvq->fwqp.mqp.qpn);
+	}
+
 	MLX5_SET(virtio_q, vq_ctx, queue_index, mvq->index);
-	MLX5_SET(virtio_q, vq_ctx, event_qpn_or_msix, mvq->fwqp.mqp.qpn);
 	MLX5_SET(virtio_q, vq_ctx, queue_size, mvq->num_ent);
 	MLX5_SET(virtio_q, vq_ctx, virtio_version_1_0,
 		 !!(ndev->mvdev.actual_features & BIT_ULL(VIRTIO_F_VERSION_1)));
@@ -1194,6 +1209,56 @@ static void counter_set_dealloc(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_vir
 		mlx5_vdpa_warn(&ndev->mvdev, "dealloc counter set 0x%x\n", mvq->counter_set_id);
 }
 
+static irqreturn_t mlx5_vdpa_int_handler(int irq, void *priv)
+{
+	struct vdpa_callback *cb = priv;
+
+	if (cb->callback)
+		return cb->callback(cb->private);
+
+	return IRQ_HANDLED;
+}
+
+static void alloc_vector(struct mlx5_vdpa_net *ndev,
+			 struct mlx5_vdpa_virtqueue *mvq)
+{
+	struct mlx5_vdpa_irq_pool *irqp = &ndev->irqp;
+	struct mlx5_vdpa_irq_pool_entry *ent;
+	int err;
+	int i;
+
+	for (i = 0; i < irqp->num_ent; i++) {
+		ent = &irqp->entries[i];
+		if (!ent->used) {
+			snprintf(ent->name, MLX5_VDPA_IRQ_NAME_LEN, "%s-vq-%d",
+				 dev_name(&ndev->mvdev.vdev.dev), mvq->index);
+			ent->dev_id = &ndev->event_cbs[mvq->index];
+			err = request_irq(ent->map.virq, mlx5_vdpa_int_handler, 0,
+					  ent->name, ent->dev_id);
+			if (err)
+				return;
+
+			ent->used = true;
+			mvq->map = ent->map;
+			return;
+		}
+	}
+}
+
+static void dealloc_vector(struct mlx5_vdpa_net *ndev,
+			   struct mlx5_vdpa_virtqueue *mvq)
+{
+	struct mlx5_vdpa_irq_pool *irqp = &ndev->irqp;
+	int i;
+
+	for (i = 0; i < irqp->num_ent; i++)
+		if (mvq->map.virq == irqp->entries[i].map.virq) {
+			free_irq(mvq->map.virq, irqp->entries[i].dev_id);
+			irqp->entries[i].used = false;
+			return;
+		}
+}
+
 static int setup_vq(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *mvq)
 {
 	u16 idx = mvq->index;
@@ -1223,27 +1288,31 @@ static int setup_vq(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *mvq)
 
 	err = counter_set_alloc(ndev, mvq);
 	if (err)
-		goto err_counter;
+		goto err_connect;
 
+	alloc_vector(ndev, mvq);
 	err = create_virtqueue(ndev, mvq);
 	if (err)
-		goto err_connect;
+		goto err_vq;
 
 	if (mvq->ready) {
 		err = modify_virtqueue(ndev, mvq, MLX5_VIRTIO_NET_Q_OBJECT_STATE_RDY);
 		if (err) {
 			mlx5_vdpa_warn(&ndev->mvdev, "failed to modify to ready vq idx %d(%d)\n",
 				       idx, err);
-			goto err_connect;
+			goto err_modify;
 		}
 	}
 
 	mvq->initialized = true;
 	return 0;
 
-err_connect:
+err_modify:
+	destroy_virtqueue(ndev, mvq);
+err_vq:
+	dealloc_vector(ndev, mvq);
 	counter_set_dealloc(ndev, mvq);
-err_counter:
+err_connect:
 	qp_destroy(ndev, &mvq->vqqp);
 err_vqqp:
 	qp_destroy(ndev, &mvq->fwqp);
@@ -1288,6 +1357,7 @@ static void teardown_vq(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *
 
 	suspend_vq(ndev, mvq);
 	destroy_virtqueue(ndev, mvq);
+	dealloc_vector(ndev, mvq);
 	counter_set_dealloc(ndev, mvq);
 	qp_destroy(ndev, &mvq->vqqp);
 	qp_destroy(ndev, &mvq->fwqp);
@@ -2505,6 +2575,7 @@ static int save_channel_info(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqu
 	ri->desc_addr = mvq->desc_addr;
 	ri->device_addr = mvq->device_addr;
 	ri->driver_addr = mvq->driver_addr;
+	ri->map = mvq->map;
 	ri->restore = true;
 	return 0;
 }
@@ -2549,6 +2620,7 @@ static void restore_channels_info(struct mlx5_vdpa_net *ndev)
 		mvq->desc_addr = ri->desc_addr;
 		mvq->device_addr = ri->device_addr;
 		mvq->driver_addr = ri->driver_addr;
+		mvq->map = ri->map;
 	}
 }
 
@@ -2833,6 +2905,25 @@ static struct device *mlx5_get_vq_dma_dev(struct vdpa_device *vdev, u16 idx)
 	return mvdev->vdev.dma_dev;
 }
 
+static void free_irqs(struct mlx5_vdpa_net *ndev)
+{
+	struct mlx5_vdpa_irq_pool_entry *ent;
+	int i;
+
+	if (!msix_mode_supported(&ndev->mvdev))
+		return;
+
+	if (!ndev->irqp.entries)
+		return;
+
+	for (i = ndev->irqp.num_ent - 1; i >= 0; i--) {
+		ent = ndev->irqp.entries + i;
+		if (ent->map.virq)
+			pci_msix_free_irq(ndev->mvdev.mdev->pdev, ent->map);
+	}
+	kfree(ndev->irqp.entries);
+}
+
 static void mlx5_vdpa_free(struct vdpa_device *vdev)
 {
 	struct mlx5_vdpa_dev *mvdev = to_mvdev(vdev);
@@ -2848,6 +2939,7 @@ static void mlx5_vdpa_free(struct vdpa_device *vdev)
 		mlx5_mpfs_del_mac(pfmdev, ndev->config.mac);
 	}
 	mlx5_vdpa_free_resources(&ndev->mvdev);
+	free_irqs(ndev);
 	kfree(ndev->event_cbs);
 	kfree(ndev->vqs);
 }
@@ -2876,9 +2968,23 @@ static struct vdpa_notification_area mlx5_get_vq_notification(struct vdpa_device
 	return ret;
 }
 
-static int mlx5_get_vq_irq(struct vdpa_device *vdv, u16 idx)
+static int mlx5_get_vq_irq(struct vdpa_device *vdev, u16 idx)
 {
-	return -EOPNOTSUPP;
+	struct mlx5_vdpa_dev *mvdev = to_mvdev(vdev);
+	struct mlx5_vdpa_net *ndev = to_mlx5_vdpa_ndev(mvdev);
+	struct mlx5_vdpa_virtqueue *mvq;
+
+	if (!is_index_valid(mvdev, idx))
+		return -EINVAL;
+
+	if (is_ctrl_vq_idx(mvdev, idx))
+		return -EOPNOTSUPP;
+
+	mvq = &ndev->vqs[idx];
+	if (!mvq->map.virq)
+		return -EOPNOTSUPP;
+
+	return mvq->map.virq;
 }
 
 static u64 mlx5_vdpa_get_driver_features(struct vdpa_device *vdev)
@@ -3155,6 +3261,34 @@ static int config_func_mtu(struct mlx5_core_dev *mdev, u16 mtu)
 	return err;
 }
 
+static void allocate_irqs(struct mlx5_vdpa_net *ndev)
+{
+	struct mlx5_vdpa_irq_pool_entry *ent;
+	int i;
+
+	if (!msix_mode_supported(&ndev->mvdev))
+		return;
+
+	if (!ndev->mvdev.mdev->pdev)
+		return;
+
+	ndev->irqp.entries = kcalloc(ndev->mvdev.max_vqs, sizeof(*ndev->irqp.entries), GFP_KERNEL);
+	if (!ndev->irqp.entries)
+		return;
+
+
+	for (i = 0; i < ndev->mvdev.max_vqs; i++) {
+		ent = ndev->irqp.entries + i;
+		snprintf(ent->name, MLX5_VDPA_IRQ_NAME_LEN, "%s-vq-%d",
+			 dev_name(&ndev->mvdev.vdev.dev), i);
+		ent->map = pci_msix_alloc_irq_at(ndev->mvdev.mdev->pdev, MSI_ANY_INDEX, NULL);
+		if (!ent->map.virq)
+			return;
+
+		ndev->irqp.num_ent++;
+	}
+}
+
 static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
 			     const struct vdpa_dev_set_config *add_config)
 {
@@ -3233,6 +3367,7 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
 	}
 
 	init_mvqs(ndev);
+	allocate_irqs(ndev);
 	init_rwsem(&ndev->reslock);
 	config = &ndev->config;
 
@@ -3413,6 +3548,17 @@ static void mlx5v_remove(struct auxiliary_device *adev)
 	kfree(mgtdev);
 }
 
+static void mlx5v_shutdown(struct auxiliary_device *auxdev)
+{
+	struct mlx5_vdpa_mgmtdev *mgtdev;
+	struct mlx5_vdpa_net *ndev;
+
+	mgtdev = auxiliary_get_drvdata(auxdev);
+	ndev = mgtdev->ndev;
+
+	free_irqs(ndev);
+}
+
 static const struct auxiliary_device_id mlx5v_id_table[] = {
 	{ .name = MLX5_ADEV_NAME ".vnet", },
 	{},
@@ -3424,6 +3570,7 @@ static struct auxiliary_driver mlx5v_driver = {
 	.name = "vnet",
 	.probe = mlx5v_probe,
 	.remove = mlx5v_remove,
+	.shutdown = mlx5v_shutdown,
 	.id_table = mlx5v_id_table,
 };
 
diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.h b/drivers/vdpa/mlx5/net/mlx5_vnet.h
index c90a89e1de4d..36c44d9fdd16 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.h
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.h
@@ -26,6 +26,20 @@ static inline u16 key2vid(u64 key)
 	return (u16)(key >> 48) & 0xfff;
 }
 
+#define MLX5_VDPA_IRQ_NAME_LEN 32
+
+struct mlx5_vdpa_irq_pool_entry {
+	struct msi_map map;
+	bool used;
+	char name[MLX5_VDPA_IRQ_NAME_LEN];
+	void *dev_id;
+};
+
+struct mlx5_vdpa_irq_pool {
+	int num_ent;
+	struct mlx5_vdpa_irq_pool_entry *entries;
+};
+
 struct mlx5_vdpa_net {
 	struct mlx5_vdpa_dev mvdev;
 	struct mlx5_vdpa_net_resources res;
@@ -49,6 +63,7 @@ struct mlx5_vdpa_net {
 	struct vdpa_callback config_cb;
 	struct mlx5_vdpa_wq_ent cvq_ent;
 	struct hlist_head macvlan_hash[MLX5V_MACVLAN_SIZE];
+	struct mlx5_vdpa_irq_pool irqp;
 	struct dentry *debugfs;
 };
 
-- 
2.40.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
