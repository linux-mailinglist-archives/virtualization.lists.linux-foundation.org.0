Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFF17CC4F6
	for <lists.virtualization@lfdr.de>; Tue, 17 Oct 2023 15:43:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0683E41DC7;
	Tue, 17 Oct 2023 13:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0683E41DC7
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SIPSxRWr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WRhVOEuXNuKM; Tue, 17 Oct 2023 13:43:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 913AF41DD3;
	Tue, 17 Oct 2023 13:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 913AF41DD3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DF72C0DD3;
	Tue, 17 Oct 2023 13:43:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CA5CC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Oct 2023 13:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D6D241DFA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Oct 2023 13:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D6D241DFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oy9fTZxYSVLJ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Oct 2023 13:43:08 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::621])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 232E141DCA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Oct 2023 13:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 232E141DCA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpFmKXzdX4HWd7icPj0fHz3cncm33lneQ80+Pa2qZjaQtdpf4kY1RUdiY36BZ20OLZyO0bdQ3Tw2NnPaq5LCcarXXUhMt+DtFvd1PLJZMNO/3TZsg4ev85hfbJXKJs6XbIlUca6mKZA3bANVz9r32GTO6p2dx5xmlnYX7+rFnUFBmGJq2K5138CymgMXVKTLtkFwwkT4USl4A/E6GrSpjljjydlq7fuVT/grc1E8YKy03ALo1tFHfwhlRdWwBWpfzuzcORd1HknPP5stiNydr2mKgEF4UwQOgcye8F4F6R/RMJD/JxunGzAqtZZ4kAozMyDUYS/yu4Nv91anu7NQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEvrPSQf+U4XaJyHIss93E4xxxdA4cdf3/34u+GHgiU=;
 b=ZwJASs6GP0AFVB8iQPPs+H6CCX5AdXau5CnuAbV5g/Y+7pRvT768A+fIz7heOytsk3I0xGRVv9L6FVdoe7WfRflqXjYqjoan2xT3g/kpjN1JEycfotzjPzfZycuDdx2ppi4BqIei9EBwrdy5Y1/3Mw14mB7avLQsPSCCOl+ttn03/DBSyDVj7n8QhOPe8IIQ5fNkFpM6aev/WTeKJrPmKee2Nd4iohsAYvlmE4JyoGmXQharwHEW6+4ytDWI93DSlAL/yVO50kn2wZfeejoVKRPGXp6gylMnsW5Cfc4LSivhOMMaUC36oS8nYfviLnnPjvMij0UKX2JK8YkAf9rTYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEvrPSQf+U4XaJyHIss93E4xxxdA4cdf3/34u+GHgiU=;
 b=SIPSxRWryDKApiW8IG58KSSzsY9zsT5xoubBcUhIr0WJ2Dt1qMqblh93bNTiKGQrc90REPtCBdLYgOpsPPRWeXWlF9RNRgTgXROlEJMWUFwwb9n07Git3v6f8+at20yu6S2iQXkDAhtxgD0MVt9OGiGLVDXMJkmUjpRY71lV4UFBPUPRuxixXntS+BBWf8c8meGcspxynWygQtvvqEStEB6v/PG8Mn7ET/Ck186WfqJfYyrdCHl3N/1bm2hdF7QGgFUKnzlThiNz3auLQSh/O+AuKBm3JUJ0+2L6Sp7YsBqOh+HH2RhtI05O+RpySQnnL+Mneu5F39fokmE4xUN9MA==
Received: from BN9PR03CA0740.namprd03.prod.outlook.com (2603:10b6:408:110::25)
 by MW4PR12MB7439.namprd12.prod.outlook.com (2603:10b6:303:22b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 13:43:04 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::61) by BN9PR03CA0740.outlook.office365.com
 (2603:10b6:408:110::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Tue, 17 Oct 2023 13:43:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Tue, 17 Oct 2023 13:43:02 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 17 Oct
 2023 06:42:46 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 17 Oct
 2023 06:42:45 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport;
 Tue, 17 Oct 2023 06:42:42 -0700
To: <alex.williamson@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <jgg@nvidia.com>
Subject: [PATCH V1 vfio 1/9] virtio-pci: Fix common config map for modern
 device
Date: Tue, 17 Oct 2023 16:42:09 +0300
Message-ID: <20231017134217.82497-2-yishaih@nvidia.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231017134217.82497-1-yishaih@nvidia.com>
References: <20231017134217.82497-1-yishaih@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|MW4PR12MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: a203440c-1c07-49e5-2ab9-08dbcf16fbe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0n1XQwx98rOS3r3rk25rnrwfmAiOuqgNt1LqiOqyishpClZAeQkZohhUKqYfs0iw4WPN/JhXB+CcgE2ONJcNAaBfngd4aCb050VOvCEm9WLW8YvKL8gn1UaKxKJwZivtBC8BGsinRbu5+3CrAYDIhnZcnm9+A6XV48FYeczjU6xezgviMHZHhzho17eFpc3tB1Dsu3m7OKbi+K6apwKRf+UhSj9XSDcj6FggXSEWEe0l+9g6C3uc556xmnrtyvxKQvIBvewx924dy1xrQ6zFbvNL1LX8CJUGffEtk9mg99Wmp4zGxyBWguFuphfIiV9Le1ltNFDSjI9btWX4myaOj8cCoO06ysQFY/rwFLnUuqaUE6BoK/pGR38BOEq6/L1LwwP013T+TlCbWlWHltsRk29YdNCdJEGDxvMaGtPISttqL5wL2xPmWN9jfXHrNE6PR4AT/u2GQQ3Q5bAIRi/yHvFMzK1FGWsWbgUomPqlVAbpLb8L4udi66r6tbr/K2d3tguzHXlgJWw1D7nBv9izBfjRr66uD+iSj3dnIK/7WJF5wAk1iV4/OGWRDHg0JAl7ZGK9nhoDgPrmlRmWGIocChyQbzxgUMsVcCSjkghD7ghc+B7WJoHy2iZm6sVk1K/ugJtF+c9HFd0X92Gc42kUCEVP9eAEWITK1tZYovfC5EZYDwrPH0YNDYFmbBq2ZkdA2X1+ojLWgQws4XR6bRMIJOSJUFe6BS1VphzaG+RQ9eH9wKVFdS4s78emrLDj7e4jSdOd31rjAROqNkJ17LzM9Acj9vXvuJBxKmOVzlnIKZE=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(82310400011)(40470700004)(46966006)(36840700001)(336012)(26005)(2906002)(5660300002)(41300700001)(8936002)(8676002)(4326008)(66899024)(40460700003)(70586007)(6636002)(316002)(70206006)(110136005)(478600001)(966005)(6666004)(7696005)(426003)(36756003)(83380400001)(40480700001)(1076003)(54906003)(86362001)(107886003)(2616005)(36860700001)(356005)(82740400003)(47076005)(7636003)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 13:43:02.3653 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a203440c-1c07-49e5-2ab9-08dbcf16fbe0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7439
Cc: kvm@vger.kernel.org, maorg@nvidia.com,
 virtualization@lists.linux-foundation.org, jiri@nvidia.com, leonro@nvidia.com
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
From: Yishai Hadas via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Yishai Hadas <yishaih@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Feng Liu <feliu@nvidia.com>

Currently vp_modern_probe() missed out to map config space structure
starting from notify_data offset. Due to this when such structure
elements are accessed it can result in an error.

Fix it by considering the minimum size of what device has offered and
what driver will access.

Fixes: ea024594b1dc ("virtio_pci: struct virtio_pci_common_cfg add queue_notify_data")
Fixes: 0cdd450e7051 ("virtio_pci: struct virtio_pci_common_cfg add queue_reset")
Signed-off-by: Feng Liu <feliu@nvidia.com>
Reported-by: Michael S . Tsirkin <mst@redhat.com>
Closes: https://lkml.kernel.org/kvm/20230927172553-mutt-send-email-mst@kernel.org/
Reviewed-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
---
 drivers/virtio/virtio_pci_modern_dev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/virtio/virtio_pci_modern_dev.c b/drivers/virtio/virtio_pci_modern_dev.c
index aad7d9296e77..7fa70d7c8146 100644
--- a/drivers/virtio/virtio_pci_modern_dev.c
+++ b/drivers/virtio/virtio_pci_modern_dev.c
@@ -290,9 +290,9 @@ int vp_modern_probe(struct virtio_pci_modern_device *mdev)
 
 	err = -EINVAL;
 	mdev->common = vp_modern_map_capability(mdev, common,
-				      sizeof(struct virtio_pci_common_cfg), 4,
-				      0, sizeof(struct virtio_pci_common_cfg),
-				      NULL, NULL);
+				sizeof(struct virtio_pci_common_cfg), 4,
+				0, sizeof(struct virtio_pci_modern_common_cfg),
+				NULL, NULL);
 	if (!mdev->common)
 		goto err_map_common;
 	mdev->isr = vp_modern_map_capability(mdev, isr, sizeof(u8), 1,
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
