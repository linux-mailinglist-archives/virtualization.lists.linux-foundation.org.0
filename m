Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 654193E5B62
	for <lists.virtualization@lfdr.de>; Tue, 10 Aug 2021 15:25:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42FC5402A2;
	Tue, 10 Aug 2021 13:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id slUzLUycOmR8; Tue, 10 Aug 2021 13:24:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BE59A4047D;
	Tue, 10 Aug 2021 13:24:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3823C0025;
	Tue, 10 Aug 2021 13:24:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD058C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 13:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D103402B5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 13:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWtOcLU3hsdJ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 13:24:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2055.outbound.protection.outlook.com [40.107.96.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A1C9404F5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 13:24:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRdW3tnj5CIucf+2uB3umC4izSiwUKLDWwa5CmyRtEIn7IR3kJ32cwLjUrgkYl31fAbGKOdG19FCyrM1Gsj9jN9HzeCPTVt+M5lQtx/xXBGFc8EhEWIOKwzWWkWRjI0goR6/LX5RQwvte81SYTEtGTxPaDd4F5eguzaQFyuMd2oI2mNZ5SPr1bgw8aHniTKDJd9ixDHChMqluk+W0tRJnd0u/LSObmHfGaxMNtHHqBzkMNuJ20SdrRUs6IoJkB0W0x76vh5AJpDg40j7xQZmmjKzo7Tvm/0Ayob7vCXIQnz5acO7F2I8tfHVvPBaoEoeL7K4R30DF1lazfWQ7TX9dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOWPJ9JIrwjGsqY/KrjRI8m9WzSl5Cf6VcnQWxLM6SE=;
 b=HyD5XkSIZv4r/15yRWp3NSAWy2rGI1VPQQGJWg2a85CMu97rD+A+SBJYE2b5lukNVg3PAJsoigKFQs3n06LdlfV9HUQTuSzGittn157Mo4Ep2KgzhkeEpFEEBQQ17WUx8Vu4ZY+QYB+JyeKNV0DIeJtMEVklYPIMiHsehbC0bnH7RHfr3mjbljM6mngCkSFqzJaQr9JlrZpd+pazrOYb740m1vVeuLZrAIzuv74spj/6LHhCXh2e2vpU9ofRYtQ0vHVSar0rJi2xTKwriZ6aUYo2RdB/rsevN9h4KMX5knoLTmTs1ftGADm+BMjOqnh27hgPVATq9x1vllVE+hHVKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOWPJ9JIrwjGsqY/KrjRI8m9WzSl5Cf6VcnQWxLM6SE=;
 b=uVmRk6CcS4biRjL16kjmkdLg7qorNTkhkst+W9RALdnnrh6/VTZTDnylQQcpMM9/xUWpXyH7I+KNzj5JRBrbL+TsE37K9TSyB1rojzX+b6XEOr/iPpRDuLbCKUDt/1L6n9PHd1iU0zdXKtJlSraHvcV3g5/NE4Anf8okYLaZBtXX28GgTGIOqs4Q/5I0SItvxg+9Lu5RVA1pPEjsvkQOfiRRy+2SJfcsnELQNLIJe8h7RAPi1joAQWPyFm0HxzgUm9DHRvTGYqG98jrvW78drSo9Yt9hSfKji/vZVcMReSpdT0DNN4dVg+Y6qc0qxP1zYVzYH/4Ruf+//oqfVSvLQA==
Received: from MW4PR03CA0027.namprd03.prod.outlook.com (2603:10b6:303:8f::32)
 by MWHPR12MB1822.namprd12.prod.outlook.com (2603:10b6:300:114::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Tue, 10 Aug
 2021 13:24:45 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::36) by MW4PR03CA0027.outlook.office365.com
 (2603:10b6:303:8f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Tue, 10 Aug 2021 13:24:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 13:24:44 +0000
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 10 Aug 2021 13:24:42 +0000
To: <davem@davemloft.net>, <kuba@kernel.org>, <netdev@vger.kernel.org>
Subject: [PATCH RESEND net-next 06/10] devlink: Add APIs to publish,
 unpublish individual parameter
Date: Tue, 10 Aug 2021 16:24:20 +0300
Message-ID: <20210810132424.9129-7-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210810132424.9129-1-parav@nvidia.com>
References: <20210810132424.9129-1-parav@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3b5435e-8c95-478f-e341-08d95c02381f
X-MS-TrafficTypeDiagnostic: MWHPR12MB1822:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1822EDE507A791653202E4DCDCF79@MWHPR12MB1822.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ssO7EdOLF+DdFAORveHPAXg4d9JSe6e0MKih+MdV7BcUGwyEY1MQc8sMnjOY5KZTGEsfwqVmpkE69fGOYmFNSI/V1DtHzjLYbKAOiloSy/yfscNrvpNflhXGApAMB3WSsprPoJN/cJUXJuZAK4pQNUD3Dtr7nkx5Y2FUKjbnFCUuU02lpovayuIHRgT15JkGCsWlQIdhFqF/D6+oiuIcoCj6koKXnjzBQx6XduF+SYEUVNK6J5LBMEFkE+qxeSsgXqFvSwYfKTPhgAouMMjBCvcfD6JpE3H3SNSBtOWREhkc6j7Fj3aN+eZ7GjlLnIk4EZzvNY/6r2upobLGmDdzJfWFeiQs6GLTuky/M0sO96FZ3RduKxnSVzv2zp2PZWrk7KYBZo6gsr54aOKJEno4DdqjloB4f2wZi5yLFIzGQxxuivbyzBSuhy329qb4WtD7ykuzHQ8mEo69iZkBmFc/jsqfdqgEbnwjxVpZxvUIg7okEWsKnHeYgF5RMjeQ06e4AvyC2wbVrtP+xAOeoUIMD9K1a3fwXQJMf2pjDS87gDzaMwEJW3OB0+/6Bmd9ekDGxdbe9a6V7+xOBSkyRSkmUr+vbuEPIZ1tMx93XsPvWUyTnjuOHO20O/mrUQYrC8yAxkCyWtgmqqaXKE3wKC9Db8YuUFrQlZkCFA/+L+hD0SyRyWjyxNx+6UWx+fV6ibPfTVvjG/e8VKB5+Zkfl4LRw==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(36840700001)(46966006)(110136005)(70206006)(356005)(36906005)(36756003)(316002)(54906003)(47076005)(16526019)(186003)(1076003)(70586007)(2616005)(8676002)(107886003)(7636003)(36860700001)(8936002)(82310400003)(86362001)(82740400003)(2906002)(478600001)(4326008)(6666004)(26005)(426003)(336012)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 13:24:44.9800 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b5435e-8c95-478f-e341-08d95c02381f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1822
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

Enable drivers to publish/unpublish individual parameter.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Jiri Pirko <jiri@nvidia.com>
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/net/devlink.h |  4 ++++
 net/core/devlink.c    | 48 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/include/net/devlink.h b/include/net/devlink.h
index f6459ee77114..1151497c0ec5 100644
--- a/include/net/devlink.h
+++ b/include/net/devlink.h
@@ -1651,6 +1651,10 @@ void devlink_param_unregister(struct devlink *devlink,
 			      const struct devlink_param *param);
 void devlink_params_publish(struct devlink *devlink);
 void devlink_params_unpublish(struct devlink *devlink);
+void devlink_param_publish(struct devlink *devlink,
+			   const struct devlink_param *param);
+void devlink_param_unpublish(struct devlink *devlink,
+			     const struct devlink_param *param);
 int devlink_port_params_register(struct devlink_port *devlink_port,
 				 const struct devlink_param *params,
 				 size_t params_count);
diff --git a/net/core/devlink.c b/net/core/devlink.c
index 629291175af3..ee9787314cff 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -9982,6 +9982,54 @@ void devlink_params_unpublish(struct devlink *devlink)
 }
 EXPORT_SYMBOL_GPL(devlink_params_unpublish);
 
+/**
+ * devlink_param_publish - publish one configuration parameter
+ *
+ * @devlink: devlink
+ * @param: one configuration parameter
+ *
+ * Publish previously registered configuration parameter.
+ */
+void devlink_param_publish(struct devlink *devlink,
+			   const struct devlink_param *param)
+{
+	struct devlink_param_item *param_item;
+
+	list_for_each_entry(param_item, &devlink->param_list, list) {
+		if (param_item->param != param || param_item->published)
+			continue;
+		param_item->published = true;
+		devlink_param_notify(devlink, 0, param_item,
+				     DEVLINK_CMD_PARAM_NEW);
+		break;
+	}
+}
+EXPORT_SYMBOL_GPL(devlink_param_publish);
+
+/**
+ * devlink_param_unpublish - unpublish one configuration parameter
+ *
+ * @devlink: devlink
+ * @param: one configuration parameter
+ *
+ * Unpublish previously registered configuration parameter.
+ */
+void devlink_param_unpublish(struct devlink *devlink,
+			     const struct devlink_param *param)
+{
+	struct devlink_param_item *param_item;
+
+	list_for_each_entry(param_item, &devlink->param_list, list) {
+		if (param_item->param != param || !param_item->published)
+			continue;
+		param_item->published = false;
+		devlink_param_notify(devlink, 0, param_item,
+				     DEVLINK_CMD_PARAM_DEL);
+		break;
+	}
+}
+EXPORT_SYMBOL_GPL(devlink_param_unpublish);
+
 /**
  *	devlink_port_params_register - register port configuration parameters
  *
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
