Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A43803E5B58
	for <lists.virtualization@lfdr.de>; Tue, 10 Aug 2021 15:25:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEC0940475;
	Tue, 10 Aug 2021 13:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IRA1dSUvuK5d; Tue, 10 Aug 2021 13:24:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B1EAC40462;
	Tue, 10 Aug 2021 13:24:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8871DC000E;
	Tue, 10 Aug 2021 13:24:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1DB3C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 13:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D30CD81BD9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 13:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MsZvYNWwD4m9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 13:24:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::619])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D76481C81
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 13:24:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmuBJcB/Hqz1CSXiAL9RqNCF+K5Oc1Vreubf/lYbVyiqVqBwKjEz5iyliIa87c1Oft8p2AYdLYTILesMwNLvrRGfrBYIlpi7LrlGd4KcKtGqEgHrrq3KV8miiJ8aThku10az6NiPejouq/oC6rP6dWJ0yW3q3bNz6NQoehVYy7qYcp9Ducr9hBQcEK/HsqLCXpo6sK55YDbtT8Ha3rRzp6CFHFFasL2RCx+uqvfZcemd78CQB6rF8F0ZxDTr2nHtj3auyPw9Ol5f4tkQZuPjOtM7iEWugMk7gQk+ka173a0HE/1PkMht38H+3TkWm76uMM+YOL6USITKY+XlpK1XAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucsQipBWhfn8p1v19fYk1ba8LLdehNnjXA23LrWumeY=;
 b=MYJyJCRVURS9cYSPMXA1nYAmn8isMCwxW1KBbtAdvPJ6bBHki6UtLwiI5KNbZeI1aiNB5/yizldr7jhX+4JiMeUW0sVW7/8WfQCmDiBDrnAE8kP5PNIvaoGUN8AVqT1KVuY8pU63827NHJjJYEuGKBctNzF+FZ9URQOVd61f+4zrOQ156R8m9gwLDq6m9ksPLgLwPIWOaSns/OVxZoA28QqTxHa5sqwXhg1PIfE//iJ3QhA/R3vToa/ygDjukoQh7bMFYF0ioX5PfjJdJ/sd+hOpV3oVFo3CxwGZ87gbGPbVfxrlCL7j+a8FmAymn9eMQAV6mRUK7eYIAHs/yKYJpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucsQipBWhfn8p1v19fYk1ba8LLdehNnjXA23LrWumeY=;
 b=mAMBOghLf0dlYHvZK0Qxwa/pI/009h2JrJusumvfog/0qjxPTierk1xYTUBzfWmiFR9P718HbSeagVHsTfPhkqmTiSaiXBvgbG0Q00Zn7yu2zOO1716qQb0fJ2ZtD73SIHTGrEfN4V2WRnd1s0pHVxt0gkFKf8y2tF5IdRoaB3j8Y+JTmkUFDc1dEs/2ls+/OaUvMxzWn7YSHEEnGQxbHKE3/rQ/ZAGgVs1aB0MzDQ0eJlh56gsIQYilbvWLc5goNkmg7yHHu0WF0fj7aq7hD6I1PMVI+3VPuvEHc4Q2EWbkr8iRQr++hcG8FU0Y6jyonO4FPmbos5n7YMu930BfMA==
Received: from MW4PR03CA0015.namprd03.prod.outlook.com (2603:10b6:303:8f::20)
 by DM6PR12MB5519.namprd12.prod.outlook.com (2603:10b6:5:1b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.20; Tue, 10 Aug
 2021 13:24:39 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::fe) by MW4PR03CA0015.outlook.office365.com
 (2603:10b6:303:8f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Tue, 10 Aug 2021 13:24:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 13:24:39 +0000
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 10 Aug 2021 13:24:38 +0000
To: <davem@davemloft.net>, <kuba@kernel.org>, <netdev@vger.kernel.org>
Subject: [PATCH RESEND net-next 01/10] devlink: Add new "enable_eth" generic
 device param
Date: Tue, 10 Aug 2021 16:24:15 +0300
Message-ID: <20210810132424.9129-2-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210810132424.9129-1-parav@nvidia.com>
References: <20210810132424.9129-1-parav@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a87e4373-e6ab-47d7-86cd-08d95c0234ad
X-MS-TrafficTypeDiagnostic: DM6PR12MB5519:
X-Microsoft-Antispam-PRVS: <DM6PR12MB5519A4B2300781441FA74EF3DCF79@DM6PR12MB5519.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IgUd3pjI2hgPU5gXt6hAPwqkBXWEABAnptIo+fu6s4vM3hgnNLvhJw+acY2qiTjSL4LKUlBw2mWrJEgwHFAlVgrHDzxKn+QYZK3YwLATc9jp/pdpQ/UTf3nR+cm68PLU7xIqJx9d+Q6Ya85Z9m4NQ3ByKHwKbKM9FoPSkVsRTcBf6212RjVgICr+MD0sUMonG4AqdndQPY2bytNcXwfqs70qizTA7JeNjaY1tIMvnZpTtHPtMcONbiEQUD8Z+sTQGSA4peS1x3UryVlqakTzBID4YoJVapswudQSVI/Of1Oxb0S7dO74FwaseuiBYVFU7mgIjNYcrzaBhKdAqYVOepyvPtwYcK69O5eCnYv5k6zwNDE3sgG73o/iOnn55ZRKObkxJ6QtmKXrAJj7ZDF0AIF7k5vk9B/Aj1Bv27PvYk15bumLUQm/JC10th8StIt3aL+Mp8NNddp2mb0lsx+ilk6Bl3rg+HXimIUVXf+U2iIL+2LHDFktqVKrvccV/GIyjJcAUe5YOuV5mrognhqYcbHDosBo6zOJkQBPvjrsP4Kh9wQuLdh5YRdYeJPNtRdx6Orz1rmnyUR+qwVvQPXoJjvPLZ1xsf3bE1scC9npBDDwersAffuAVxAwYq4mXrbm8zlULqz7LryHmIl2bP7OU6iuiaE5AesrkEkUFTqe78hPE1ETyT8NoNH6702ujM/+CW7J7Y/ZLY6f/n4aV4jGjZQ4W2tUv/h/REljna9XAT4=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966006)(36840700001)(2616005)(1076003)(86362001)(36906005)(478600001)(8676002)(356005)(82740400003)(6666004)(8936002)(316002)(7636003)(110136005)(70206006)(5660300002)(70586007)(36860700001)(16526019)(2906002)(54906003)(26005)(336012)(83380400001)(82310400003)(47076005)(107886003)(36756003)(4326008)(426003)(186003)(41533002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 13:24:39.2053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a87e4373-e6ab-47d7-86cd-08d95c0234ad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5519
Cc: linux-rdma@vger.kernel.org, Leon
 Romanovsky <leonro@nvidia.com>, Jiri Pirko <jiri@nvidia.com>,
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
From: Parav Pandit via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Parav Pandit <parav@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Add new device generic parameter to enable/disable creation of
Ethernet auxiliary device and associated device functionality
in the devlink instance.

User who prefers to disable such functionality can disable it using below
example.

$ devlink dev param set pci/0000:06:00.0 \
              name enable_eth value false cmode driverinit
$ devlink dev reload pci/0000:06:00.0

At this point devlink instance do not create auxiliary device for the
Ethernet functionality.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Jiri Pirko <jiri@nvidia.com>
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
---
 Documentation/networking/devlink/devlink-params.rst | 4 ++++
 include/net/devlink.h                               | 4 ++++
 net/core/devlink.c                                  | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/Documentation/networking/devlink/devlink-params.rst b/Documentation/networking/devlink/devlink-params.rst
index 54c9f107c4b0..219c1272f2d6 100644
--- a/Documentation/networking/devlink/devlink-params.rst
+++ b/Documentation/networking/devlink/devlink-params.rst
@@ -97,6 +97,10 @@ own name.
    * - ``enable_roce``
      - Boolean
      - Enable handling of RoCE traffic in the device.
+   * - ``enable_eth``
+     - Boolean
+     - When enabled, the device driver will instantiate Ethernet specific
+       auxiliary device of the devlink device.
    * - ``internal_err_reset``
      - Boolean
      - When enabled, the device driver will reset the device on internal
diff --git a/include/net/devlink.h b/include/net/devlink.h
index 0236c77f2fd0..1e3e183bb2c2 100644
--- a/include/net/devlink.h
+++ b/include/net/devlink.h
@@ -519,6 +519,7 @@ enum devlink_param_generic_id {
 	DEVLINK_PARAM_GENERIC_ID_RESET_DEV_ON_DRV_PROBE,
 	DEVLINK_PARAM_GENERIC_ID_ENABLE_ROCE,
 	DEVLINK_PARAM_GENERIC_ID_ENABLE_REMOTE_DEV_RESET,
+	DEVLINK_PARAM_GENERIC_ID_ENABLE_ETH,
 
 	/* add new param generic ids above here*/
 	__DEVLINK_PARAM_GENERIC_ID_MAX,
@@ -559,6 +560,9 @@ enum devlink_param_generic_id {
 #define DEVLINK_PARAM_GENERIC_ENABLE_REMOTE_DEV_RESET_NAME "enable_remote_dev_reset"
 #define DEVLINK_PARAM_GENERIC_ENABLE_REMOTE_DEV_RESET_TYPE DEVLINK_PARAM_TYPE_BOOL
 
+#define DEVLINK_PARAM_GENERIC_ENABLE_ETH_NAME "enable_eth"
+#define DEVLINK_PARAM_GENERIC_ENABLE_ETH_TYPE DEVLINK_PARAM_TYPE_BOOL
+
 #define DEVLINK_PARAM_GENERIC(_id, _cmodes, _get, _set, _validate)	\
 {									\
 	.id = DEVLINK_PARAM_GENERIC_ID_##_id,				\
diff --git a/net/core/devlink.c b/net/core/devlink.c
index b02d54ab59ac..9a59f45c8bf9 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -4277,6 +4277,11 @@ static const struct devlink_param devlink_param_generic[] = {
 		.name = DEVLINK_PARAM_GENERIC_ENABLE_REMOTE_DEV_RESET_NAME,
 		.type = DEVLINK_PARAM_GENERIC_ENABLE_REMOTE_DEV_RESET_TYPE,
 	},
+	{
+		.id = DEVLINK_PARAM_GENERIC_ID_ENABLE_ETH,
+		.name = DEVLINK_PARAM_GENERIC_ENABLE_ETH_NAME,
+		.type = DEVLINK_PARAM_GENERIC_ENABLE_ETH_TYPE,
+	},
 };
 
 static int devlink_param_generic_verify(const struct devlink_param *param)
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
