Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E45704FFC
	for <lists.virtualization@lfdr.de>; Tue, 16 May 2023 15:55:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA80883F3F;
	Tue, 16 May 2023 13:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA80883F3F
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HFHubtDY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6GorB7-A5x4; Tue, 16 May 2023 13:55:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3297582252;
	Tue, 16 May 2023 13:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3297582252
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51561C008A;
	Tue, 16 May 2023 13:55:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E28DCC002A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 May 2023 13:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DEDE60A82
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 May 2023 13:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DEDE60A82
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=HFHubtDY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnKqqNSVHzJE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 May 2023 13:55:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC01461615
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::602])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC01461615
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 May 2023 13:55:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNPQMbRvjp3sqHLZT9o6w3Ubwa4CjqkWZBbejX60kjYEntDDTK2l34c60lOoDHy0ZMvPYcqMGpzEXZAL+9EWZYq7uim736V9kCowq5HFv/rhk0pigrmOKgDxpHU8g7n4DguBHf1S5M2nsmw9B326s0ZOBZwlwfbAho66ZOI4JUGQT9wtBJXjdvJ7F90Zh89y7Xvo6/7yCKaTd6EhYmohsu/i2ZVsUYNClcbfCZbixVuERxfhIuIJdCqcz/3SCuhFSUvS2r7ary+rkrEo3qDYIwi4e6d+aR266RauG5Gh2bsugGlqRbNmWF6J457VPJMXXcJRRGTjuCvd2tPz79bk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5JW2Mhi40zgUhuTvwACpEkGADKW8YatpqyhR23tZwQ=;
 b=btBpwDWcpvKiq0FGTT4KeFZFmWW+aXasZZt7Tf3JiUvKb88V++nRuXeX7GWwp5ltJ8xesOATBI9pHLSjah2KaxI7xKZFgWVjY8hqMturoZ2EQyVMrMnV1v8D6xet25NEb1WBC+ZUMNAZjqYPFp5mZT3ubfff0azz+ESUre+5LrpufIRsgVH0PjPeqvRzm/snTQalztoPrrkmpgOfX0SCZeQ+srF8rw0vJZreWYDmnXbqaCmAJUP7BUD1aV7IwvbfY8/7nayx1arFkopM6SzPZWd0VeRaFVMzBzhdx/vEXvQ73oCrTphL83Oa/e/LZ8BkyO3wspDpkSHyeK3tBZXcGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5JW2Mhi40zgUhuTvwACpEkGADKW8YatpqyhR23tZwQ=;
 b=HFHubtDYEFMc8HPdPspxzRg0/ULhckHhRAB9R8NNOlI8/q3AfHGpiZLmGXi7yiSnLelKHUm4CLiqebRi9KnrRhLmoHnTR6SlmAvMAmRZTPzCHVBV7ixGN/4AN2B/jtb51XShoF//KTb9GyIB/mbjIIRdJZQijVgWIPZd4s+1wa2YqZZ6KJT/iootin5CHZN9MVKubECWgaQOWcq9VMiwiOsFfWqsn7k2grCq3/txIrf3p1Uv2j+P/7Ix3VfNHWutkIO2B5x/QASZ0SCrdOi7I1tCWjkvx81VNInJv8Q5j7D3pNFooWlVPKQ5svrrDn1mYuIZEHLCZYGTdciHS2Y0/w==
Received: from MW4PR04CA0172.namprd04.prod.outlook.com (2603:10b6:303:85::27)
 by BL0PR12MB4931.namprd12.prod.outlook.com (2603:10b6:208:17e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 13:55:09 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::e8) by MW4PR04CA0172.outlook.office365.com
 (2603:10b6:303:85::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 13:55:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.16 via Frontend Transport; Tue, 16 May 2023 13:55:07 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 16 May 2023
 06:54:56 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 16 May
 2023 06:54:55 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport;
 Tue, 16 May 2023 06:54:54 -0700
To: <virtualization@lists.linux-foundation.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] virtio_pci: Optimize virtio_pci_device structure size
Date: Tue, 16 May 2023 09:54:46 -0400
Message-ID: <20230516135446.16266-1-feliu@nvidia.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT044:EE_|BL0PR12MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f96c80f-6b1a-44da-b5c9-08db561528aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gBK/EMsCUHssBdjFpdXK8li7uRTlvyhoD+I2eggtgz8aYmxL6LPe2zK9CaWl8blN6rBQYRVpJI0aMTZ5TMmx9gneP2E/0+AosOdpB7SYAU1WRuo5pZfKFKVEN2AjycCzGgmrZgRG4HN/Qq/8I8P7pW4DfPdhJG6kSp65O8HLkMt89zy2X85PUHL4tJsssObR0UceG85ZAys3kjR+Vc72MkRMUZ3qjTblBRliy+1/rWpZxV2z+YG7TKUidhfrknTkems1CG4BEMPFJgZ4j+ZLOFjz9dRLeqkNJ7TkeJrelqpwshL1bgLDqzmdwMxjysSxD31NeaqxgRStnt3YTln4YKkgUSuBiOAvsAF0vHHPpIQoy1f31zOlVoqlWce+e8jt6MoblmH7AqxfXWVh9q1ie4589UJkRCXATJpXvZ2A7NMVQUdK9MfLTN+cFlnS7utQ2l8BjOfT/egzCFHu9fVtgtXTgqe9gjKYmO/HXij+SUdXUFUaNM9IsEX6qOCWork/dE0IAQEH7LT4SJrw5UP4UXxvOyfLJtHVKEUxvwI9Wo8+pQ6GDG6b9iTHSzilDnn67pxXHIchDyofXPCF1APFjKG5lXjZMo/nq4GCvGsMVlss5XZBuPBrG06ET4jKUBfhtujGOQynQ5be5hkH1AtxVFjPEoZjB4wRags5mjo1c33SEQOJDvZ6CYBgazOWEp1hWaR46VMZZPjPra8xHRb3qcIh54KzxTfUxFKU4V4AkyKUIaIZH/9RRniYEh74iW+2j5VcqINJujkjVvQbpMurGg==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199021)(40470700004)(36840700001)(46966006)(36756003)(86362001)(7696005)(110136005)(54906003)(316002)(4326008)(70206006)(70586007)(478600001)(40480700001)(82310400005)(5660300002)(8936002)(2906002)(8676002)(6666004)(41300700001)(7636003)(82740400003)(356005)(36860700001)(336012)(186003)(2616005)(426003)(1076003)(26005)(107886003)(83380400001)(47076005)(66899021)(40460700003)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 13:55:07.8072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f96c80f-6b1a-44da-b5c9-08db561528aa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4931
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jiri Pirko <jiri@nvidia.com>,
 Bodong Wang <bodong@nvidia.com>
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

Improve the size of the virtio_pci_device structure, which is commonly
used to represent a virtio PCI device. A given virtio PCI device can
either of legacy type or modern type, with the
struct virtio_pci_legacy_device occupying 32 bytes and the
struct virtio_pci_modern_device occupying 88 bytes. Make them a union,
thereby save 32 bytes of memory as shown by the pahole tool. This
improvement is particularly beneficial when dealing with numerous
devices, as it helps conserve memory resources.

Before the modification, pahole tool reported the following:
struct virtio_pci_device {
[...]
        struct virtio_pci_legacy_device ldev;            /*   824    32 */
        /* --- cacheline 13 boundary (832 bytes) was 24 bytes ago --- */
        struct virtio_pci_modern_device mdev;            /*   856    88 */

        /* XXX last struct has 4 bytes of padding */
[...]
        /* size: 1056, cachelines: 17, members: 19 */
[...]
};

After the modification, pahole tool reported the following:
struct virtio_pci_device {
[...]
        union {
                struct virtio_pci_legacy_device ldev;    /*   824    32 */
                struct virtio_pci_modern_device mdev;    /*   824    88 */
        };                                               /*   824    88 */
[...]
	/* size: 1024, cachelines: 16, members: 18 */
[...]
};

Signed-off-by: Feng Liu <feliu@nvidia.com>
Reviewed-by: Jiri Pirko <jiri@nvidia.com>
---
 drivers/virtio/virtio_pci_common.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
index 23112d84218f..4b773bd7c58c 100644
--- a/drivers/virtio/virtio_pci_common.h
+++ b/drivers/virtio/virtio_pci_common.h
@@ -45,9 +45,10 @@ struct virtio_pci_vq_info {
 struct virtio_pci_device {
 	struct virtio_device vdev;
 	struct pci_dev *pci_dev;
-	struct virtio_pci_legacy_device ldev;
-	struct virtio_pci_modern_device mdev;
-
+	union {
+		struct virtio_pci_legacy_device ldev;
+		struct virtio_pci_modern_device mdev;
+	};
 	bool is_legacy;
 
 	/* Where to read and clear interrupt */
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
