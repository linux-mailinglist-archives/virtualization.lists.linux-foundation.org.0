Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A0962700B38
	for <lists.virtualization@lfdr.de>; Fri, 12 May 2023 17:18:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E5B860B42;
	Fri, 12 May 2023 15:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E5B860B42
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rRbOefNZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xE3XgcjG1zqk; Fri, 12 May 2023 15:18:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2156A61371;
	Fri, 12 May 2023 15:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2156A61371
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D248C0089;
	Fri, 12 May 2023 15:18:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B039C002A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 May 2023 15:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBEA460B42
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 May 2023 15:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBEA460B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MtjAx1TQBK4n
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 May 2023 15:18:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA9DD60B25
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::616])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA9DD60B25
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 May 2023 15:18:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGowVkK+U79IOHKlR7uOx+6jixV/W9rtut4QoaUBHT7kRkizfHCFCj3OX7oryAe7nc9hjDbnuVS8igkvhho7VrYf7PT41MTlvKRpqQDRMeEHW8HmuUCqV71rET3F0dQzYPvPvL5/FAMKSBdpHMTpJmGpwGXz78DMQ47LVHYcknXnN/jqkbZ2dtlfChjD/e/4HR79CVnvhDWjqHuncXrEG5CfH0hrR/li6ZCAK9udfgC1Lapt0N1fgkJQoFiNyqsmxnaTCq+nt2OSVtCKAItvq6y7wvGg7BXIRsRHQO+6P1AavHidPSLdqAQdUD38hsHl+Bo0+9jYnSZzoszaRpSB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjS8hJirtxE8DujZ9biIWSKVU6I+7HSSRAiwm61m8Ms=;
 b=DHIIhm2XuUSgs1/VfBL5J01yaZoiIh1oA0rA8vDiZO+Cvn564KF/tKsBsJ5Kx/Y4PQXm8JsLvpaPtZ1Fq87e+QspjVb+zBMog5epTEh8IFH6soyAcvs3P7LO4cD4xfQR9aeEsRf7mozY5MSjLH8HWNvz3PqsD6QQ63THA6lwZjnITCpLDx4S02HRwnycAXWVC9688pBbnH6W1PuDsJ0fs9H+UNLOnyzjwkxr8FXzAfd5rNIh937tlUYf6sDJe92ausoPo1ToL/qAxjt6TdKAHT2pI8ROCmIYbrhbKMWXhWhM1jX0t8S6yvtiZgiao6kzB1H5188AguBYZForeGtdYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjS8hJirtxE8DujZ9biIWSKVU6I+7HSSRAiwm61m8Ms=;
 b=rRbOefNZNs06QcJEwhvK7nJztcZVSMJdvG9UCqUHpv1w85vBrrr+1ALSCb3ChoR/LL2FMSq9mpSqP7XPaBoIMpemj9Zci9WZ2UAFdoBnuo4zakbBGfy6+hHSvRBdIH6FeF2tgAM+kaF0uWfh4sBLq6yUVBgaQQH+/UFHNQV15nYgpC599wcU/aklw+a+lsDBfnglkfBqO+wYMbHpLPZebxicLJ1YosrA3YU/KgE6IvJBbcWHWpzjHp2IS0SSFy31CV0GqDMY0v70NZ8FbkYsOWdAwgRUPqLJrpFZuQmpxtW9MAuuwOXbFzkbg3dAOlde+swSveDcxhKeXhtmfGWyDQ==
Received: from BL0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:208:2d::39)
 by CO6PR12MB5491.namprd12.prod.outlook.com (2603:10b6:303:13b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 15:18:39 +0000
Received: from BL02EPF000100D0.namprd05.prod.outlook.com
 (2603:10b6:208:2d:cafe::5c) by BL0PR03CA0026.outlook.office365.com
 (2603:10b6:208:2d::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24 via Frontend
 Transport; Fri, 12 May 2023 15:18:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF000100D0.mail.protection.outlook.com (10.167.241.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.11 via Frontend Transport; Fri, 12 May 2023 15:18:37 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 12 May 2023
 08:18:19 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Fri, 12 May
 2023 08:18:18 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Fri, 12 May
 2023 08:18:15 -0700
To: <virtualization@lists.linux-foundation.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
Subject: [PATCH net v6] virtio_net: Fix error unwinding of XDP initialization
Date: Fri, 12 May 2023 11:18:12 -0400
Message-ID: <20230512151812.1806-1-feliu@nvidia.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000100D0:EE_|CO6PR12MB5491:EE_
X-MS-Office365-Filtering-Correlation-Id: bcac59ac-fc41-49b7-baa2-08db52fc2927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s6Z0yxdX19ClBccAWFgtQAFobpvrTF6kmn0SWkxMIN2OLfxtl8xprAhtMuPBBl0Cx3sr1cRNO2TU5eT/uWFxPFFCUkWuhq5lrGjjrpouFA+v9ihRTeabAwp5iC4D5kr28Iy3Uv76z+1Od3K9zQzFJR1JAYt+QkRxOZz5qvoK2DC7rgA1MWGNWcOjXHXs64j33OaEQxO4JuDUyJRCSNH96zvUgBil9I4q9jdezwohqEGEM9GZcrGLbBX0ts/WWvJEo2ofoL75wECdw+JbzDXETOIknOHC/q4uaicfYoLfxSa/9a29bEYSPO0Q/t4xF9xYno2i4VMVGMz6S9GNzpYcBeK++9l3f1bUsjx1c/Jx1Rv3L87rBUdY9q9n0GJVYWhWkMbdh6Z6glq1ZQDruuWMFYYhPeOfEuOJcw4E+bnxqZJmgFhp7OWTyuxgTVTb2Er7eDAuNVIcX9KbEi9L7+CAPxqcv9PZE90+fgYLCNmEYBlAcnWANt/vzXZAxlv2BCrptyHMFB380eq/10sa8dX4R6IiBXkCJIh2t/Mro0YmtRQMzvGaxiKYvbje4tzVhJf8Ob4uP3sqbgW2DpZGv315HpI/m2/YhcSCBlpkJUsv12lS23fYvyUxJghgAo5bx2aVE9m+FIEMhd+Bz4Sms2R4dYAmTuVAA3OENEee3bUrUNvZzrts6YtMR51Keo7MnhJdjnuxMKcP4vD3Cw8dzJR9SL2hqOgs0Z9dRsT+StdwV3kZu2bjybQKnZyEpsOq5FXq
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(83380400001)(2616005)(336012)(426003)(186003)(2906002)(47076005)(36756003)(86362001)(82310400005)(7636003)(82740400003)(356005)(36860700001)(40480700001)(316002)(70206006)(70586007)(4326008)(54906003)(7696005)(6666004)(41300700001)(5660300002)(8676002)(8936002)(26005)(1076003)(110136005)(107886003)(478600001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 15:18:37.6887 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcac59ac-fc41-49b7-baa2-08db52fc2927
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000100D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5491
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Simon Horman <simon.horman@corigine.com>, William Tu <witu@nvidia.com>,
 Jiri Pirko <jiri@nvidia.com>, Bodong Wang <bodong@nvidia.com>
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
From: Feng Liu via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Feng Liu <feliu@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

When initializing XDP in virtnet_open(), some rq xdp initialization
may hit an error causing net device open failed. However, previous
rqs have already initialized XDP and enabled NAPI, which is not the
expected behavior. Need to roll back the previous rq initialization
to avoid leaks in error unwinding of init code.

Also extract helper functions of disable and enable queue pairs.
Use newly introduced disable helper function in error unwinding and
virtnet_close. Use enable helper function in virtnet_open.

Fixes: 754b8a21a96d ("virtio_net: setup xdp_rxq_info")
Signed-off-by: Feng Liu <feliu@nvidia.com>
Reviewed-by: Jiri Pirko <jiri@nvidia.com>
Reviewed-by: William Tu <witu@nvidia.com>
---
v5 -> v6
feedbacks from Xuan Zhuo
- add disable_delayed_refill and cancel_delayed_work_sync

v4 -> v5
feedbacks from Michael S. Tsirkin
- rename helper as virtnet_disable_queue_pair
- rename helper as virtnet_enable_queue_pair

v3 -> v4
feedbacks from Jiri Pirko
- Add symmetric helper function virtnet_enable_qp to enable queues.
- Error handle:  cleanup current queue pair in virtnet_enable_qp,
  and complete the reset queue pairs cleanup in virtnet_open.
- Fix coding style.
feedbacks from Parav Pandit
- Remove redundant debug message and white space.

v2 -> v3
feedbacks from Michael S. Tsirkin
- Remove redundant comment.

v1 -> v2
feedbacks from Michael S. Tsirkin
- squash two patches together.

---
 drivers/net/virtio_net.c | 61 +++++++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 17 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index a12ae26db0e2..56ca1d270304 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1868,6 +1868,38 @@ static int virtnet_poll(struct napi_struct *napi, int budget)
 	return received;
 }
 
+static void virtnet_disable_queue_pair(struct virtnet_info *vi, int qp_index)
+{
+	virtnet_napi_tx_disable(&vi->sq[qp_index].napi);
+	napi_disable(&vi->rq[qp_index].napi);
+	xdp_rxq_info_unreg(&vi->rq[qp_index].xdp_rxq);
+}
+
+static int virtnet_enable_queue_pair(struct virtnet_info *vi, int qp_index)
+{
+	struct net_device *dev = vi->dev;
+	int err;
+
+	err = xdp_rxq_info_reg(&vi->rq[qp_index].xdp_rxq, dev, qp_index,
+			       vi->rq[qp_index].napi.napi_id);
+	if (err < 0)
+		return err;
+
+	err = xdp_rxq_info_reg_mem_model(&vi->rq[qp_index].xdp_rxq,
+					 MEM_TYPE_PAGE_SHARED, NULL);
+	if (err < 0)
+		goto err_xdp_reg_mem_model;
+
+	virtnet_napi_enable(vi->rq[qp_index].vq, &vi->rq[qp_index].napi);
+	virtnet_napi_tx_enable(vi, vi->sq[qp_index].vq, &vi->sq[qp_index].napi);
+
+	return 0;
+
+err_xdp_reg_mem_model:
+	xdp_rxq_info_unreg(&vi->rq[qp_index].xdp_rxq);
+	return err;
+}
+
 static int virtnet_open(struct net_device *dev)
 {
 	struct virtnet_info *vi = netdev_priv(dev);
@@ -1881,22 +1913,20 @@ static int virtnet_open(struct net_device *dev)
 			if (!try_fill_recv(vi, &vi->rq[i], GFP_KERNEL))
 				schedule_delayed_work(&vi->refill, 0);
 
-		err = xdp_rxq_info_reg(&vi->rq[i].xdp_rxq, dev, i, vi->rq[i].napi.napi_id);
+		err = virtnet_enable_queue_pair(vi, i);
 		if (err < 0)
-			return err;
-
-		err = xdp_rxq_info_reg_mem_model(&vi->rq[i].xdp_rxq,
-						 MEM_TYPE_PAGE_SHARED, NULL);
-		if (err < 0) {
-			xdp_rxq_info_unreg(&vi->rq[i].xdp_rxq);
-			return err;
-		}
-
-		virtnet_napi_enable(vi->rq[i].vq, &vi->rq[i].napi);
-		virtnet_napi_tx_enable(vi, vi->sq[i].vq, &vi->sq[i].napi);
+			goto err_enable_qp;
 	}
 
 	return 0;
+
+err_enable_qp:
+	disable_delayed_refill(vi);
+	cancel_delayed_work_sync(&vi->refill);
+
+	for (i--; i >= 0; i--)
+		virtnet_disable_queue_pair(vi, i);
+	return err;
 }
 
 static int virtnet_poll_tx(struct napi_struct *napi, int budget)
@@ -2305,11 +2335,8 @@ static int virtnet_close(struct net_device *dev)
 	/* Make sure refill_work doesn't re-enable napi! */
 	cancel_delayed_work_sync(&vi->refill);
 
-	for (i = 0; i < vi->max_queue_pairs; i++) {
-		virtnet_napi_tx_disable(&vi->sq[i].napi);
-		napi_disable(&vi->rq[i].napi);
-		xdp_rxq_info_unreg(&vi->rq[i].xdp_rxq);
-	}
+	for (i = 0; i < vi->max_queue_pairs; i++)
+		virtnet_disable_queue_pair(vi, i);
 
 	return 0;
 }
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
