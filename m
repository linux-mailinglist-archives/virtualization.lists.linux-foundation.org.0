Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E8D3E5B60
	for <lists.virtualization@lfdr.de>; Tue, 10 Aug 2021 15:25:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BF05834E8;
	Tue, 10 Aug 2021 13:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dSVwGbi5VI3e; Tue, 10 Aug 2021 13:24:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F27FD81D98;
	Tue, 10 Aug 2021 13:24:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FF12C000E;
	Tue, 10 Aug 2021 13:24:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E004C0010
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 13:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C73C40473
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 13:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qR72OYkVsyUm
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 13:24:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE4474029F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 13:24:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGdBKGpM9Qan56mRkhSZ/HMlQpaQkJocssfv5XAbsBSZLqurcGfCFYnzDb65whS6KC3+OhJuqIXu/FCLuwdBPHfN61FJbdbVSK27ASkJTxJM2aD1L8oCvlYhyd3i9GP65szQ2tHaV4dPqGbXd8T4F3VlBolL33+kVbiOu9Y1yhp5uYcRVKxH6OSaPlFgQ3yK1/njhp72Jv0e/qSNL0ZFJ584UGV1/NrCl0sPx3EiJnWNSHwtPMDr1rKkOWN84LZQ7sTeC67yVzntYihTtAIGrHR8/sbnHfmhac15GpzWpqaBTz5PNGIgyP8VbRkyxpn1UuVWiFYdsPCeBqMtdF4/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drnAII7q7Sg0ir7JPDzE3fON+Ec+o1taOtnrCCLk71w=;
 b=ls1Q+ZmCsN5srcqXmArgKHd4hOkE4RobjYNyiEWJdubAFakyJLeQfU5FmSmK84rU8mPwHmU1H3ocf+1kcaUdbfrr+VuJnuKsovJthoeqCgtIRk+S75vwzi+Myw7eqfUIP70Qa8MD1da3khO5iK2fV9sC35R8EFgo6MmtscLspCk0Or1nLldZW/BPaS+5MBzMamcn+vuymcEswTGGynB8/NHE1iG+qJO1dWwd50gIhYewUPBEXQPSa0bsl/ahHR2v3COWAFX8SdsCaDTFzkCVSflHhLsy9R0hKKVuXjC6cYDyLSFYZ+fQYT9oSri3WgQhfrkyx4A1Itqbe3qJ/Q3dFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drnAII7q7Sg0ir7JPDzE3fON+Ec+o1taOtnrCCLk71w=;
 b=upNTC6FvLVnjjyQYhZNTdhEaAf3t6XJv3GgMRcx0aydpVmCPy4UqckvPHj2/EYrUAYF8zcjWtwxxYKc2S/JlLnowqjdrnKEsQIo830G+NFTupyP6V8NTE85Tew9q3iKMe/1cHg7kRCnA8dSNT8XsmXDV9TFlp2XBrSBEEG1kRbdMr5+9R6HUT2nxyvncLlo4LNCZNlLFxkddHsftA9e67YXh4NRoAKo5kB5UTkhKnxn4RT3eqj7Oi0ftBaVax2+e1i8w8rRW1bCNu7NaYrnn3+4uPIgEdrPoeqzXcVoire/Nwodh9MYdoqxRS1LJ9iG0pFwqrJS1BZlHv6PVMJAv+w==
Received: from MW4PR03CA0002.namprd03.prod.outlook.com (2603:10b6:303:8f::7)
 by MN2PR12MB3981.namprd12.prod.outlook.com (2603:10b6:208:165::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Tue, 10 Aug
 2021 13:24:43 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::92) by MW4PR03CA0002.outlook.office365.com
 (2603:10b6:303:8f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Tue, 10 Aug 2021 13:24:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 13:24:43 +0000
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 10 Aug 2021 13:24:41 +0000
To: <davem@davemloft.net>, <kuba@kernel.org>, <netdev@vger.kernel.org>
Subject: [PATCH RESEND net-next 05/10] devlink: Add API to register and
 unregister single parameter
Date: Tue, 10 Aug 2021 16:24:19 +0300
Message-ID: <20210810132424.9129-6-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210810132424.9129-1-parav@nvidia.com>
References: <20210810132424.9129-1-parav@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39bac361-b702-4899-f051-08d95c02372e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3981:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3981DA339ADC7485C094EF3EDCF79@MN2PR12MB3981.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pe4y1kgMeP2m9Bvkmct0dwnHpnk53eP6Yz4/YhOCZhwHzXJ0TuihCo4GZPfBYy79Oibua+2haoUg2rNeSy1K471+TKLQUVEYXZ5vHm6sDBD77j6E08bO9I4Rw7DkpOqdw+Oa/JmvLU3Q5MW5tEeu58SjbYG/1zw8sfguefCKX/x/3ool3oxANhAL65urK83IklIyi0L15l/I+6obdgII5WHHDzm3nn1jjXsbDNogjWkvkGNA/RODkiFi+KipGFUF1fHFFVbs82lh6/AVY0X/U7TwKWjjEEOCFUWVWns7pUy/p2kST9Kl0HLewRfCRyWfV7Boq/jKsqSjfpbOnyj4KRvFDbsDhCX1cjP5nEkeQ4Q6fJEkkvD41zdbyUAL0ALjg459r8F1cU4MtZgfrYy5RG3CxxZx0BPjG4t1sWLGN3Ru3u/eev74UhllIpxl/a1UNDX+1D7HbkOr7IeTBT5eyZ4cAc4bVKcG5OpMaVF7Ikw2gNxPSYa0WVM6IvxgliNofq0LQbZhU7eNJaX9mRT0t9hc9N7WOax67CqSRLce8EAGhjVU9F/9Z561ZQJSBPLsLxK2GiUymYxksO42titDX9lBlQK/jPAfrtc9L3aW+oMftx9nC3yYx5+SU5H739TKN853ZPEqSMY3V7kSjPV4fSku5mYmhvW17EqQ2eknt6+BvhHCCREQ4ZvU0/E/uYYx
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(36840700001)(46966006)(107886003)(86362001)(82740400003)(2616005)(4326008)(6666004)(5660300002)(478600001)(426003)(1076003)(336012)(16526019)(7636003)(26005)(186003)(8936002)(356005)(82310400003)(47076005)(36860700001)(83380400001)(8676002)(2906002)(36906005)(70206006)(316002)(54906003)(36756003)(70586007)(110136005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 13:24:43.4159 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39bac361-b702-4899-f051-08d95c02372e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3981
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

Currently device configuration parameters can be registered as an array.
Due to this a constant array must be registered. A single driver
supporting multiple devices each with different device capabilities end
up registering all parameters even if it doesn't support it.

One possible workaround a driver can do is, it registers multiple single
entry arrays to overcome such limitation.

Better is to provide a API that enables driver to register/unregister a
single parameter. This also further helps in two ways.
(1) to reduce the memory of devlink_param_entry by avoiding in registering
parameters which are not supported by the device.
(2) avoid generating multiple parameter add, delete, publish, unpublish,
init value notifications for such unsupported parameters

Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Jiri Pirko <jiri@nvidia.com>
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/net/devlink.h |  4 ++++
 net/core/devlink.c    | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/net/devlink.h b/include/net/devlink.h
index 0a0becbcdc49..f6459ee77114 100644
--- a/include/net/devlink.h
+++ b/include/net/devlink.h
@@ -1645,6 +1645,10 @@ int devlink_params_register(struct devlink *devlink,
 void devlink_params_unregister(struct devlink *devlink,
 			       const struct devlink_param *params,
 			       size_t params_count);
+int devlink_param_register(struct devlink *devlink,
+			   const struct devlink_param *param);
+void devlink_param_unregister(struct devlink *devlink,
+			      const struct devlink_param *param);
 void devlink_params_publish(struct devlink *devlink);
 void devlink_params_unpublish(struct devlink *devlink);
 int devlink_port_params_register(struct devlink_port *devlink_port,
diff --git a/net/core/devlink.c b/net/core/devlink.c
index 050dd7271a45..629291175af3 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -9903,6 +9903,43 @@ void devlink_params_unregister(struct devlink *devlink,
 }
 EXPORT_SYMBOL_GPL(devlink_params_unregister);
 
+/**
+ * devlink_param_register - register one configuration parameter
+ *
+ * @devlink: devlink
+ * @param: one configuration parameter
+ *
+ * Register the configuration parameter supported by the driver.
+ * Return: returns 0 on successful registration or error code otherwise.
+ */
+int devlink_param_register(struct devlink *devlink,
+			   const struct devlink_param *param)
+{
+	int err;
+
+	mutex_lock(&devlink->lock);
+	err = __devlink_param_register_one(devlink, 0, &devlink->param_list,
+					   param, DEVLINK_CMD_PARAM_NEW);
+	mutex_unlock(&devlink->lock);
+	return err;
+}
+EXPORT_SYMBOL_GPL(devlink_param_register);
+
+/**
+ * devlink_param_unregister - unregister one configuration parameter
+ * @devlink: devlink
+ * @param: configuration parameter to unregister
+ */
+void devlink_param_unregister(struct devlink *devlink,
+			      const struct devlink_param *param)
+{
+	mutex_lock(&devlink->lock);
+	devlink_param_unregister_one(devlink, 0, &devlink->param_list, param,
+				     DEVLINK_CMD_PARAM_DEL);
+	mutex_unlock(&devlink->lock);
+}
+EXPORT_SYMBOL_GPL(devlink_param_unregister);
+
 /**
  *	devlink_params_publish - publish configuration parameters
  *
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
