Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D99763F01
	for <lists.virtualization@lfdr.de>; Wed, 26 Jul 2023 20:51:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 998A682178;
	Wed, 26 Jul 2023 18:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 998A682178
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PoTRX9XM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4tL2C4WzwLgV; Wed, 26 Jul 2023 18:51:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6D706831DA;
	Wed, 26 Jul 2023 18:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D706831DA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6494C0DD4;
	Wed, 26 Jul 2023 18:51:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07ED0C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jul 2023 18:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9DF882178
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jul 2023 18:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9DF882178
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zDKmjo8ivPnI
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jul 2023 18:51:41 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFAEE81FDF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jul 2023 18:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFAEE81FDF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIO0kJnDnAF7+LGbwu41kIhDaiyuphTZw6m5YEIS8RQzwJpSqgZIuscQVMYFZu2VRg0f25ALXeB86QCsbCDSN5ilA7+Sfa6R5JNajaYKGz9AXjD+qrxkE/hxT4QGKA2/jy7l6Pd9MfW5zFYbtCrZ7/XjTW3REM7UL0FiU3Kcoe3YkRvj2RLrlgOu9orctDfmt09ponPlVw6amQ+DC0kQL5Ie6xbfvKXX7uNzcxBp0dVi5SbH8S4EWkmo8HDkwWGDHL/1iv+0DxbZaCukNCXUCJpnV/bMUYDScYrYjhabHvq6jz9HciAwqbSeeCdRthBUNig1M5d4XnyIbDcdCtKugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgYw3qrtHDfr4X9sCe6Uf7nDdCh0k+9B6CnmHdcieZM=;
 b=WzpYXbX0tmkOLbvuBDmGyGWOinJO8FA5WC3tnAjQLyjcQA/lQbviojThoBWalyyAjcFJSPA5cjVIz0dksg8w7z+GWliYDjb38NJ+PhwXmPszMvimWK8cUlUxQ6lAP6Fee9rVhyRW8/jEvCgotzXNJoU0Zc/a90fVQ2cItndV//ETQdx5LkEZlvh0EMP5gWGP92EBXmtOdzpI9nl+U7HQBUehBMid3l4uo0JX05IxakiuKB9zj7DaBfZEiU1hMRRu1M1SZnDZnpgYu9I4hUR+T8uAOVQVPwHKkYgrJtT1VXVKUtSeoD/6em6aNWDHij4sJnROsCAfGjqE/KZxXnEQSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgYw3qrtHDfr4X9sCe6Uf7nDdCh0k+9B6CnmHdcieZM=;
 b=PoTRX9XMPl4nBfyUZLwciGu6X65T5ngNT7UWBUHUbVhmwoMm807dU6W/LPmaSnR/1ELnC/q4L1LV7QTOE+ab5Gd6uBQF+bn/HwzJB/U1M5iwiVfPPe5WUbtXN66tUfQHpZJFg3CS6wC3S8m1fUqYTer7++aR4eiBKglF3H91mbUWtuepf2WjxAqrNWwNJWCHAkDe7BqobdKdJfJTCAvHFfBzHD9379g6Y8sM0qcNustNntumq47AEdzpwXzGp//W8VgOFQ4jkZubsYjkUqvNwGmSAJ08qz9Wy/2/ePaUcOOC7WIYwZUuYT8nOZlA8nk3G0HFAedja9+R/YsozB7/KQ==
Received: from BN8PR04CA0020.namprd04.prod.outlook.com (2603:10b6:408:70::33)
 by LV3PR12MB9094.namprd12.prod.outlook.com (2603:10b6:408:19e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 18:51:38 +0000
Received: from BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::12) by BN8PR04CA0020.outlook.office365.com
 (2603:10b6:408:70::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31 via Frontend
 Transport; Wed, 26 Jul 2023 18:51:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT094.mail.protection.outlook.com (10.13.176.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29 via Frontend Transport; Wed, 26 Jul 2023 18:51:38 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 26 Jul 2023
 11:51:24 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Wed, 26 Jul
 2023 11:51:23 -0700
Received: from c-237-113-220-225.mtl.labs.mlnx (10.127.8.12) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.986.37 via
 Frontend Transport; Wed, 26 Jul 2023 11:51:21 -0700
To: "Michael S . Tsirkin" <mst@redhat.com>, Lin Ma <linma@zju.edu.cn>, "Jason
 Wang" <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "Parav
 Pandit" <parav@nvidia.com>
Subject: [PATCH 1/2] vdpa: Complement vdpa_nl_policy for nlattr length check
Date: Wed, 26 Jul 2023 21:49:43 +0300
Message-ID: <20230726185104.12479-2-dtatulea@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726185104.12479-1-dtatulea@nvidia.com>
References: <20230726185104.12479-1-dtatulea@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT094:EE_|LV3PR12MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: 867b7717-4857-4e58-e522-08db8e0957ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dzBivChLV5M0y3nQzRC46OpmgWZwI31RymQKYL5x4+WfOWGoay1mai4WbNbKjo+OzQTiosQr6qF256R7UoZwU1zpY10YbHW/jypj9k0fU6uiEpnXNnDiBDXcadbK5CBJfxqRjpV90TjM8MN2jwsQcqeltvKK2uYTN/UvRV3RJ7pHJwjLFkx34F6Xa1PcJTe7q0MevMd0UUuBl2yS8iFGuoeFHOArBUfRBU1frr0M5JzwlTVDhnPg7eKx0d1XhIQBsmNYfaSZAcBy0MIZFnNcU6cUoaWYoys9M42vEDq3lZE46AzvxphpsYiUbFtc9HskyddeKdIz7VEmXQgzYq7Dez+cVv1NuBGaCPBed6aA+wYdHPKivdSc16eis4dvUg0M25OKBW9hpXga2UaMZWJC6iptUfdoAa+rSnJOx4W27LfxF6zscN55js1btDFVY87TMN8UaXl4qHolMYBC60iUwGAmuQPeX6Yvw9eTFHy08TZED3LYYrPW7BVP2Hvx3Iz/y9u3/Rf3+9gCzFQWVyLICjdjVkVX8ecHrft91ciDB5yMtfLVR+I9El/8mz/ePbGxzrdLOEdnKC9PwOxo+ZueyBBacmPqFm8RwFXbB+r7EIdVLhmtdMSGwaKo0NuBHUEQqLJ6aq4dkDYBbNKCBxLkAuoj1A/z6l05XSkp+2XpVJXe6e2MqXg+6YzXGLbgcOxqoqJWTmBmCj2z2fkqzYwlSdRnrAoImWrFy2fFL4DzFb8Glqv+OHkIozR7bb8WLvWM
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(82310400008)(451199021)(40470700004)(36840700001)(46966006)(2906002)(40460700003)(36756003)(82740400003)(107886003)(336012)(1076003)(186003)(86362001)(26005)(83380400001)(47076005)(2616005)(426003)(36860700001)(7636003)(356005)(6666004)(478600001)(110136005)(40480700001)(54906003)(70206006)(70586007)(8936002)(41300700001)(8676002)(4326008)(316002)(6636002)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 18:51:38.1862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 867b7717-4857-4e58-e522-08db8e0957ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9094
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Author: Lin Ma <linma@zju.edu.cn>
The vdpa_nl_policy structure is used to validate the nlattr when parsing
the incoming nlmsg. It will ensure the attribute being described produces
a valid nlattr pointer in info->attrs before entering into each handler
in vdpa_nl_ops.

That is to say, the missing part in vdpa_nl_policy may lead to illegal
nlattr after parsing, which could lead to OOB read just like CVE-2023-3773.

This patch adds three missing nla_policy to avoid such bugs.

Fixes: 90fea5a800c3 ("vdpa: device feature provisioning")
Fixes: 13b00b135665 ("vdpa: Add support for querying vendor statistics")
Fixes: ad69dd0bf26b ("vdpa: Introduce query of device config layout")
Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 drivers/vdpa/vdpa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 965e32529eb8..f2f654fd84e5 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -1247,8 +1247,11 @@ static const struct nla_policy vdpa_nl_policy[VDPA_ATTR_MAX + 1] = {
 	[VDPA_ATTR_MGMTDEV_DEV_NAME] = { .type = NLA_STRING },
 	[VDPA_ATTR_DEV_NAME] = { .type = NLA_STRING },
 	[VDPA_ATTR_DEV_NET_CFG_MACADDR] = NLA_POLICY_ETH_ADDR,
+	[VDPA_ATTR_DEV_NET_CFG_MAX_VQP] = { .type = NLA_U16 },
 	/* virtio spec 1.1 section 5.1.4.1 for valid MTU range */
 	[VDPA_ATTR_DEV_NET_CFG_MTU] = NLA_POLICY_MIN(NLA_U16, 68),
+	[VDPA_ATTR_DEV_QUEUE_INDEX] = { .type = NLA_U32 },
+	[VDPA_ATTR_DEV_FEATURES] = { .type = NLA_U64 },
 };
 
 static const struct genl_ops vdpa_nl_ops[] = {
-- 
2.41.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
