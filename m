Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 746315F4E89
	for <lists.virtualization@lfdr.de>; Wed,  5 Oct 2022 05:28:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE86241717;
	Wed,  5 Oct 2022 03:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE86241717
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=T4W+aTNT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUfB70WRK7q1; Wed,  5 Oct 2022 03:28:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4EC0041725;
	Wed,  5 Oct 2022 03:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EC0041725
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BD2BC007E;
	Wed,  5 Oct 2022 03:28:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2230EC002D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Oct 2022 03:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F10AF827A1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Oct 2022 03:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F10AF827A1
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=T4W+aTNT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dnq8JSjmOv0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Oct 2022 03:28:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ACD381D73
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2041.outbound.protection.outlook.com [40.107.95.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1ACD381D73
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Oct 2022 03:27:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtEEV/2g+OZEmvyf7CGY/gv3L3o5L+uhcb/9tQAtsqpqQyfB7l7YzognVjN0VyIpKebhXgQCCatYggAqE08wgPYbNKzOhoXpAYE4AmOJTiNxW43P3GJ/CTa73a4mZxbbu9jKoRWP6BC86ZcSUow3Iwm/9CbHxisdj3m5HFjxqEi+GOMOagop3poZTiVVJ42cXaM3QVhwB6knJrNKfh2v6ANr4gK00ScGKLW+JTXiUmxtjqOn0T9RER5BiWDh60FerF7aeg7jYp0XUUcwv79TgMgskseD+xnGHQXVO1au01w1QyvApxfX+fuamHs16lFdFFr5Df9V2HqcdCi+AdqLrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHz7Dp/+F4b/Hkk0H5bmoMnwFHpir4BLHeQHPx4VfbM=;
 b=gAHtV/IZjz+T2VM3sgbRe/EJT3puh1pbVa6KmLT7IDcWaMThYonjPJxbE3Ya74TzKXgi6Ro2RkANe/7FYk/sUep5ZK03hkO8dXCLDZIBrE53sU9Dbxj+vzZKB7PKqY/xXr8aN5Mqxp2wWGPaxRHjJVa1+RspW7o/0tys9JjeWu0ETLChGyrkmTde6AcdGnYfZkFaZSMP4KdD9lWD2zXSoNs358q49P9y41yxlwJCKg/RHsV+0hSVjB7Y4X4rZMNzF3Pj2939Ng00iN0n8x805ayjzH+HvzjMvMoy7En2GtKKHU2E68/Upfjo30sDCr4P6wWedKrLxLRhyHvGI9N6HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHz7Dp/+F4b/Hkk0H5bmoMnwFHpir4BLHeQHPx4VfbM=;
 b=T4W+aTNTibT//scjWp8lEYnBLxbLb2CZGiOoSTy3i0NRNz4Gtt23L+lPmf2oFcOp/8Z4NUZatkQA7YRgfPqIlAkU6eV2HW6A/uAzYeXHoKTsU9wZEPec3Zk4C11M1BVXhm3u5qwHiZlGZxMfVeTqSkKjEaLuwtmF6TFbUX5C3TwmMLnYoFzEBphFd7chdUGWrp/UFIOBw+gwMYd5A/kHuWEqYNXgqVHON71kjItGtJ2ZaqwZ4ywGYwBiYrWpcaLxkT3HWbJmNIq3sq0OiEpNJEj8IOoBrt6pABfTL1IEp0mOqa9IVgF6Jar2zeyouqXO9QPES7T6WQoMMMUA2z4p8w==
Received: from DM6PR02CA0122.namprd02.prod.outlook.com (2603:10b6:5:1b4::24)
 by MN0PR12MB5932.namprd12.prod.outlook.com (2603:10b6:208:37f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Wed, 5 Oct
 2022 03:27:56 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::74) by DM6PR02CA0122.outlook.office365.com
 (2603:10b6:5:1b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Wed, 5 Oct 2022 03:27:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 03:27:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 4 Oct 2022
 20:27:54 -0700
Received: from dev.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 4 Oct 2022
 20:27:51 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-nvme@lists.infradead.org>,
 <linux-s390@vger.kernel.org>, <linux-scsi@vger.kernel.org>
Subject: [RFC PATCH 21/21] nvme-pci: use lib tagset init helper
Date: Tue, 4 Oct 2022 20:22:57 -0700
Message-ID: <20221005032257.80681-22-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005032257.80681-1-kch@nvidia.com>
References: <20221005032257.80681-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT037:EE_|MN0PR12MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d8c758-a3e9-403e-afa8-08daa6819884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1IwHhpF45Lv+E1FLJ2N0fDaKfgLEQRdw8iFZ8hB8o7fuwj86Gy6LTWnzK2rgIfRETVDsjcyrIP7qIRwNkqVSmI95hhQXxtY/2rvy6h7L1bzE70WQHO8MM+u8ExXS1MhRsOJkByqQW3UMMgCNQQTdoOTHcXFm/5+5P32/gc2x31LrXp8ynt/8FTWvNY85kW6Y5hlO7KbQNFU2ENIgHwJCoZHNmB+1n5GPp2+EwzA8/gEuxe2iVYOb38DYtOfD5mSDHSIzLvyT2bXfPTkFzQ2b3NyOjXGTMcNWn9OJr0ULmi9ju3EC1C9CGy/VxMNTE36rb7lB6YcUGKy4Ojy6zG+VMXJmB0e180tFd1m6dz4A5cp1SF3zLL0vrYNXqvjnavov7z3jQkZaRduizhX/rQs1dfKC0NinLLqjfF5cjDJ5bkg5CiBhng+63nUI/fv+mY79PC8JuoX33qHFWe9sAD8q4RSiJjRZRbFcymRkP7EAxqut4o3IxhYLaSwFrvjaNujO5dXOGAmdFRFrZ7mvlKLsyLlgo/9PRuqw72oPQ/ZEiLWu/uR27IMoz6R2VDgDsBdVJdkK53Snix1APCJ6RSMi3tcy9dj5kfal4r2yy8OFQWtcfaKePJpX4BVxaEAFX3F9XuOPLwQzqVG7Ncz6MMJfKSEFD60I626R1LD7Si3/e4vBovQMKX0L+rmNa4Vrn6VdVO+tzwaEA3dGnnweAcT3C9jU1m9Kf0SeJuh3mUJiaCFoeY5w3K63B3gcx2eoKmWrUzVjkujhdsNLDTT2z5zblJ1wN/pBaErrjT6i45CGl12dMSuQGA0OfTPB0ug/0yIrBjInFteR3zV9PJlQDvhIJ4x5hyOYKojXzivb82o6FK4=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(2616005)(82740400003)(7636003)(70206006)(7696005)(40460700003)(4326008)(8676002)(26005)(40480700001)(70586007)(356005)(921005)(36756003)(83380400001)(478600001)(1076003)(316002)(110136005)(16526019)(336012)(47076005)(426003)(36860700001)(186003)(54906003)(82310400005)(8936002)(7416002)(7406005)(5660300002)(7366002)(2906002)(41300700001)(21314003)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 03:27:56.4764 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d8c758-a3e9-403e-afa8-08daa6819884
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5932
Cc: vincent.fu@samsung.com, vincent.whitchurch@axis.com, stefanha@redhat.com,
 mst@redhat.com, hoeppner@linux.ibm.com,
 virtualization@lists.linux-foundation.org, bhelgaas@google.com,
 haris.iqbal@ionos.com, miquel.raynal@bootlin.com, agordeev@linux.ibm.com,
 jinpu.wang@ionos.com, hch@lst.de, alyssa@rosenzweig.io, vigneshr@ti.com,
 sagi@grimberg.me, richard@nod.at, damien.lemoal@opensource.wdc.com,
 vaibhavgupta40@gmail.com, joel@jms.id.au, shinichiro.kawasaki@wdc.com,
 idryomov@gmail.com, jejb@linux.ibm.com, asahi@lists.linux.dev, ohad@wizery.com,
 gor@linux.ibm.com, sven@svenpeter.dev, hca@linux.ibm.com,
 john.garry@huawei.com, josef@toxicpanda.com, efremov@linux.com,
 ming.lei@redhat.com, christophe.jaillet@wanadoo.fr, sth@linux.ibm.com,
 baolin.wang@linux.alibaba.com, kbusch@kernel.org, ceph-devel@vger.kernel.org,
 nbd@other.debian.org, bvanassche@acm.org, axboe@kernel.dk,
 martin.petersen@oracle.com, wsa+renesas@sang-engineering.com,
 johannes.thumshirn@wdc.com, andersson@kernel.org, marcan@marcan.st,
 dongsheng.yang@easystack.cn, christoph.boehmwalder@linbit.com,
 mcgrof@kernel.org, svens@linux.ibm.com, pbonzini@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Use the block layer helper to initialize the common fields of tag_set
such as blk_mq_ops, number of h/w queues, queue depth, command size,
numa_node, timeout, BLK_MQ_F_XXX flags, driver data. This initialization
is spread all over the block drivers. This avoids the code repetation of
the inialization code of the tag set in current block drivers and any
future ones.

Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
---
 drivers/nvme/host/pci.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 7bbffd2a9beb..52af4b2bb668 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1757,15 +1757,9 @@ static int nvme_pci_alloc_admin_tag_set(struct nvme_dev *dev)
 {
 	struct blk_mq_tag_set *set = &dev->admin_tagset;
 
-	set->ops = &nvme_mq_admin_ops;
-	set->nr_hw_queues = 1;
-
-	set->queue_depth = NVME_AQ_MQ_TAG_DEPTH;
-	set->timeout = NVME_ADMIN_TIMEOUT;
-	set->numa_node = dev->ctrl.numa_node;
-	set->cmd_size = sizeof(struct nvme_iod);
-	set->flags = BLK_MQ_F_NO_SCHED;
-	set->driver_data = dev;
+	blk_mq_init_tag_set(set, &nvme_mq_admin_ops, 1, NVME_AQ_MQ_TAG_DEPTH,
+			sizeof(struct nvme_iod), dev->ctrl.numa_node,
+			NVME_ADMIN_TIMEOUT, BLK_MQ_F_NO_SCHED, dev);
 
 	if (blk_mq_alloc_tag_set(set))
 		return -ENOMEM;
@@ -2528,20 +2522,15 @@ static void nvme_pci_alloc_tag_set(struct nvme_dev *dev)
 	struct blk_mq_tag_set * set = &dev->tagset;
 	int ret;
 
-	set->ops = &nvme_mq_ops;
-	set->nr_hw_queues = dev->online_queues - 1;
 	set->nr_maps = 1;
 	if (dev->io_queues[HCTX_TYPE_READ])
 		set->nr_maps = 2;
 	if (dev->io_queues[HCTX_TYPE_POLL])
 		set->nr_maps = 3;
-	set->timeout = NVME_IO_TIMEOUT;
-	set->numa_node = dev->ctrl.numa_node;
-	set->queue_depth = min_t(unsigned, dev->q_depth, BLK_MQ_MAX_DEPTH) - 1;
-	set->cmd_size = sizeof(struct nvme_iod);
-	set->flags = BLK_MQ_F_SHOULD_MERGE;
-	set->driver_data = dev;
-
+	blk_mq_init_tag_set(set, &nvme_mq_ops, dev->online_queues - 1,
+			min_t(unsigned, dev->q_depth, BLK_MQ_MAX_DEPTH) - 1,
+			sizeof(struct nvme_iod), dev->ctrl.numa_node,
+			NVME_IO_TIMEOUT, BLK_MQ_F_SHOULD_MERGE, dev);
 	/*
 	 * Some Apple controllers requires tags to be unique
 	 * across admin and IO queue, so reserve the first 32
-- 
2.29.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
