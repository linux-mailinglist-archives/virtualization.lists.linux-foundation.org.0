Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 971A26FCA9B
	for <lists.virtualization@lfdr.de>; Tue,  9 May 2023 17:58:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE6FE81FA8;
	Tue,  9 May 2023 15:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE6FE81FA8
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SgTAZ1oY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYIvQoASkGtn; Tue,  9 May 2023 15:58:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2DA3181FC2;
	Tue,  9 May 2023 15:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DA3181FC2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6226DC008B;
	Tue,  9 May 2023 15:58:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3D15C002A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 May 2023 15:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69B92408DF
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 May 2023 15:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69B92408DF
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=SgTAZ1oY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 92R3nwkxxUU0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 May 2023 15:58:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E11D140353
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::615])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E11D140353
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 May 2023 15:58:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHwryBwYZd/MywEIwWq9NBe30sWvLfnNUIS1ZLZBHfJVCR0wgqJHHx1g7lEFQMYJfkDSpKllvmgFRTTQg5fmtalNh9sT82U3/w9p4MVXBRozK1vlOQaxIp0DeAwwUuIOmsasT98wpN4J/bAyJtQB6/GzuSTi2QEQ/UjKXSB08yIeq54lb9U7aIVSjX+/vB1i/x6XsPlcrnzmWrDiFnyYGbqn4avJzvXdxpkgXLrKEk2aJYEQAV2hqCGLBIA9Ebsgc5oG1NjsEDoezVpfsycofT+Mbe3fA8F9EwWJURo4ismbgHWe3AI3ARcMW6SZTlYL9W/31xjBponYOGPibrbvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKmvqrq24U5m4AkKGotRbs1yz2SbCwRcnnSyizjchdI=;
 b=EBmcyPKV0Gz4Og1n3txN5F/F71r1Aqa/HrpYs3XxJd31xVxI4K09FZkIUxhiwj+x9YWX8k4410K4sQ7LYjNANV7StBZ3JL0/4/7gP3SLPiMXXYKlYkUTjH0RTaVCRxfaWkNgZqlXw6IN/HoH9LexLo5B2o5UVZQeqYPjpuOQfImD8V6xMxJDxTQGn6W+Ve/VblhpRPm9j7L571EdwXbUI6IvqaZbTjO/aE+6I/7RCd9GVdrs3uJ6fo+0MWEetfbz2GlPMLYfq1VXMHnHY+K4VrARrNXV2gL0aoLsvK4/Ki0Z9MyiegsiMUzoGA/FVu0n9TPQ0lf+a3IrTrtwBtVH2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKmvqrq24U5m4AkKGotRbs1yz2SbCwRcnnSyizjchdI=;
 b=SgTAZ1oY9/yCFaC6mm5y1XzEuLtpm/v1GMn7qMjCz/ijIDD4nrs1iS1VepTg+coHh4PghkeyJSiK354kHAfb3RKmi0XBh8njJrXSMU64zKrMMNzMHB4UChg5MirUFVKnQKwFWx5Ll3iJVsubxDcWMfQ7EZl1EsHPLbcW7xdy6UNnyG89liuAw7YiVS3D2Fbg7MTIaJKnWFc0OhGcgEVep7FES2PviUW8kg7usRe141/2sDDaYuiLfECXhl/tkplgWI0MvHI1qFpwlrmyTTjJnXXLVm2vldUXuFXISFAtc2zLIi9B3oymwYsPQoeOrgZ2ftqS6rroT3qP+Y2slBdrtQ==
Received: from SJ0PR03CA0082.namprd03.prod.outlook.com (2603:10b6:a03:331::27)
 by SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 15:58:30 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:331:cafe::94) by SJ0PR03CA0082.outlook.office365.com
 (2603:10b6:a03:331::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18 via Frontend
 Transport; Tue, 9 May 2023 15:58:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.33 via Frontend Transport; Tue, 9 May 2023 15:58:28 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 9 May 2023
 08:58:24 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 9 May 2023 08:58:23 -0700
Received: from vdi.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Tue, 9 May 2023 08:58:22 -0700
To: <virtualization@lists.linux-foundation.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
Subject: [PATCH net v5] virtio_net: Fix error unwinding of XDP initialization
Date: Tue, 9 May 2023 11:58:20 -0400
Message-ID: <20230509155820.9060-1-feliu@nvidia.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT044:EE_|SN7PR12MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d0df8b-f5a9-420a-facc-08db50a63b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FeNrk8I6WopxhJ7q+m1DL7dlw8YiPQO5vCXTf5/HkWLfdc3TViZBW7KtJaWzIMeS86ecksbt+E1EHrgW11C/e15l8+4xo8JepXLPajWgVneovF81+cO6wGkzF6l29WjhC0zCI9E0+zrjHMd1rYU6AslBn10H/dmAX8EB5NIP6KaMcIQM0EXeXqdmOL469v2YpAGV623gyK4wPIF1evbgRJg/CFbl3vXveOhhMUyVKM6nG3h1F6ZSaALEccodP7QxR378ejfiM4F0+eegqO0KhUVt6MnXCpNwA8PgPovzbYVKdLzXGu/np50KYdQK+Vs6du7hTEctcuvb9M2Mbl71CuwcJx0v4uqyBmNlzerX5ewjlI5ZdzxlPGnIcPB5V+iHHRZDZTzEjbGn3SGs4FRMDpUajXAeE+n6Q/2hnEiUgCeeMoV83esX4EkOo6+SUp+gnZH5VIf636V5ekZPJ5kwLLdZzpiEYAM+puZFbQIwUCv5XkP+S9IF2vqIJ1i1YTqvbJHW9q6TgJ7prTGEChUk3Jp9HKBA+fkU4XYd8TdoC0JvVN/D3lGnm0mNt36oO4j/CJJZUUSlRatDEjB9KyVJDM4EnjMeWgYHcqYB4VLDUVhF1d0INkh8MHhwKO9iDiXvD7TttnEHZ8HFMM6gqjTLscjoC1WhqEuPvdUSnKZ4aDgwl44+u8K1Nws0srvw18GCrVAVbahxnr2WdhDsoUux5A==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(36860700001)(36756003)(40460700003)(426003)(2906002)(316002)(5660300002)(40480700001)(8936002)(86362001)(8676002)(70206006)(356005)(70586007)(41300700001)(7636003)(82740400003)(336012)(47076005)(83380400001)(107886003)(1076003)(26005)(186003)(478600001)(7696005)(110136005)(2616005)(4326008)(54906003)(82310400005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 15:58:28.8814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d0df8b-f5a9-420a-facc-08db50a63b23
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7835
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
 drivers/net/virtio_net.c | 58 ++++++++++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 17 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 8d8038538fc4..664def938111 100644
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
@@ -1881,22 +1913,17 @@ static int virtnet_open(struct net_device *dev)
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
+	for (i--; i >= 0; i--)
+		virtnet_disable_queue_pair(vi, i);
+	return err;
 }
 
 static int virtnet_poll_tx(struct napi_struct *napi, int budget)
@@ -2305,11 +2332,8 @@ static int virtnet_close(struct net_device *dev)
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
