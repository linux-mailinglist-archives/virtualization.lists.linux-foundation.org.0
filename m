Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 145224396C0
	for <lists.virtualization@lfdr.de>; Mon, 25 Oct 2021 14:53:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA4EF60871;
	Mon, 25 Oct 2021 12:53:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IdAFQPiGnpiE; Mon, 25 Oct 2021 12:53:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 487B160870;
	Mon, 25 Oct 2021 12:53:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E470C000E;
	Mon, 25 Oct 2021 12:53:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E704C0039
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Oct 2021 12:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 593D96080D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Oct 2021 12:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W7wgm_MraShX
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Oct 2021 12:53:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::60e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18FBD60868
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Oct 2021 12:53:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpcpYH8KTmpompaYzlbFjaaXnYVhntzKpx2aQW0g7VCrVQTjN5zJRYdtQfaIc8urPr1kC4JsyhMd3gevGe+AHctGPwn7P5beG2GiG+n1iUV1F2IZDI75n0RuyUucVprn+tyOmdbS0mR33/CcU9ZvYh63C3oUsP4AN2Oc/zYXBmJGLXBFUUr/BnZekI0siSx7TkayeGOZW+v87mHDgnzRbJU9GdKNXBu7DfLVergwTvTwCkmDBXBX4LaFRwXjkQkaFUuE/e5XRzhHL4uu3Dyoe/1BnfrEd9OzVmo5xqGr+aPJjBkx1jTiENSfDWmDkIEAcHnxU5k/H4WHNoOqu8XMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=618ic2ZrLQlOgZf9wmcOxNZyNNfdHM61Tdf25tr4mRc=;
 b=bqTTGJbh0JkEkj84iIiK/t3UFT8otdw57AN02ZRIep+1rewLcKqJdYEBWFscKfqees8B6odype6KR5NoeinDL8LEodu8cqpvvyrDXjTaI9lqKgzYR0RYQOHGTZdEQVEMfCQyEq14N8AdFRq5xRNHYRg/hF64FOSqGifuuuYkjYCRBeesjP10nDchkG8GYTQwc2QescnWf6DI+KDKuXrpqffcABYTY+8HRZumuiYhgVzEmSVbIZpd1uzSnDhPq7XcDnwUs1NgmdkGiE4h+7ZFNxYMB2DB9BNsIa+ez+EOBwE9AKtwbWiXD5Lm+TptMeJ0bNExwS3Ev4TDMqffGHBKQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=618ic2ZrLQlOgZf9wmcOxNZyNNfdHM61Tdf25tr4mRc=;
 b=QeGtYY9qLRqGWaRMbRj/scC5uQJ/mJu0RWLO/NrI79oUHWyStxsRO14pIpKm2q3FkiI34+tV83LpVStdYA0rZDIGiN6DmDiyMg99SHPHdXqaMDEFPSAekBCGvy+ztn0WQaj3P9W7rD5r4y4SOCTo7SnFRpv7mXBmAILIy7tlDjsoIUZjvNJ5Ou2A6eRfpKemw4YouVm95mTo8/LY/97S5RKVc89MyYovRhVMPrhX4i3zyJCIIblntv/SzmmqcKOoCyobrLEdfBemaQwlx6jRaZVVNj62njkTzgTxLKQ+jghTv0ZwuMBL/NY6uTo+rJ+q9wW96UXb+fyQ/txNZLl8Ug==
Received: from MWHPR1701CA0008.namprd17.prod.outlook.com
 (2603:10b6:301:14::18) by BL0PR12MB2548.namprd12.prod.outlook.com
 (2603:10b6:207:41::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 12:53:35 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:14:cafe::e8) by MWHPR1701CA0008.outlook.office365.com
 (2603:10b6:301:14::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Mon, 25 Oct 2021 12:53:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 12:53:34 +0000
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Mon, 25 Oct 2021 12:53:32 +0000
To: <virtualization@lists.linux-foundation.org>
Subject: [PATCH linux-next v5 4/8] vdpa: Enable user to set mac and mtu of
 vdpa device
Date: Mon, 25 Oct 2021 15:53:12 +0300
Message-ID: <20211025125316.67664-5-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211025125316.67664-1-parav@nvidia.com>
References: <20211025125316.67664-1-parav@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9389477-4ac3-43d1-4a9b-08d997b674c2
X-MS-TrafficTypeDiagnostic: BL0PR12MB2548:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2548945A5A2C34D89F9C37FDDC839@BL0PR12MB2548.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5/NHif/gkW7vz4RxnpUcm0939II766AbbV1pbyxwyKaAwA0fvFsRbFc6nZ+cJVyjkIk6MuqX9K+JdbBoLCqPTnHUk2Dad25hX9B0ghDWJpxlL2H3M4IleApsR5WHmZgM5cqWpjZ9Wt/bHhtTY94RW1qRIr8PYd38Qulj3/D5N2Hi3bqJLOrrCY1Hwbvx7hX4Fa2l0gYgZGB9mkIOY8qScBwh5GPfyveOWsdVHTvhxXSqRdSHJxUkaJhcDBGZ4kFbnyNyIVR4qvcFiG5mPxleVlNhw3I5/w9wV4BiuUZ7+ltDfY4ztbDd1ivJ8JpcnNwPJ7ivZJLA6lHqlxM1nT4UXBkFEpfsPG/2swi8ZVequ8GoCQE35k1DMexFNsIVduS7yO8K84dBheq1ueGFlxU4j1R6WCjF0/2F/Rs/vFFUd4qoiXt0VnhsyPJ+tX4yIwmTtDLGZnfSxeNIp1ywuWcOr4GZeMJl6HdIv05k8iX6sKNeEbv18kmRwdRfhdFkx7b9IEYpb7WMa9VUhr+S9cnjjrBPWeZkRL1mRIAee/xDV68ApEsqptR2bOZiLWH/R20jeq4o4nkPyP42zuP0xLMmyS313OaK3M4GSJsfN9ZOCmJadVDYJSLd0oVeKg/KUM4TaOCqQFX/bLBUCQzsRVfeDK/2vzR/Pl5Aw7cKK6xh/+2DjGINYnRiYWEAzSNRrnOzoIVu4cN842orWxUIpP8F+Q==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(8936002)(8676002)(508600001)(36756003)(4326008)(86362001)(16526019)(2906002)(5660300002)(70206006)(70586007)(6666004)(107886003)(186003)(83380400001)(1076003)(36860700001)(2616005)(316002)(47076005)(54906003)(7636003)(26005)(336012)(6916009)(82310400003)(356005)(426003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 12:53:34.6948 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9389477-4ac3-43d1-4a9b-08d997b674c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2548
Cc: elic@nvidia.com, mst@redhat.com
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

$ vdpa dev add name bar mgmtdev vdpasim_net mac 00:11:22:33:44:55 mtu 9000

$ vdpa dev config show
bar: mac 00:11:22:33:44:55 link up link_announce false mtu 9000

$ vdpa dev config show -jp
{
    "config": {
        "bar": {
            "mac": "00:11:22:33:44:55",
            "link ": "up",
            "link_announce ": false,
            "mtu": 9000,
        }
    }
}

Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Eli Cohen <elic@nvidia.com>
---
changelog:
v4->v5:
 - added comment for checking device capabilities
v3->v4:
 - provide config attributes during device addition time
---
 drivers/vdpa/ifcvf/ifcvf_main.c      |  3 ++-
 drivers/vdpa/mlx5/net/mlx5_vnet.c    |  3 ++-
 drivers/vdpa/vdpa.c                  | 38 ++++++++++++++++++++++++++--
 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c |  3 ++-
 drivers/vdpa/vdpa_sim/vdpa_sim_net.c |  3 ++-
 drivers/vdpa/vdpa_user/vduse_dev.c   |  3 ++-
 include/linux/vdpa.h                 | 17 ++++++++++++-
 7 files changed, 62 insertions(+), 8 deletions(-)

diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
index dcd648e1f7e7..6dc75ca70b37 100644
--- a/drivers/vdpa/ifcvf/ifcvf_main.c
+++ b/drivers/vdpa/ifcvf/ifcvf_main.c
@@ -499,7 +499,8 @@ static u32 get_dev_type(struct pci_dev *pdev)
 	return dev_type;
 }
 
-static int ifcvf_vdpa_dev_add(struct vdpa_mgmt_dev *mdev, const char *name)
+static int ifcvf_vdpa_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
+			      const struct vdpa_dev_set_config *config)
 {
 	struct ifcvf_vdpa_mgmt_dev *ifcvf_mgmt_dev;
 	struct ifcvf_adapter *adapter;
diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index b5bd1a553256..6bbdc0ece707 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -2482,7 +2482,8 @@ static int event_handler(struct notifier_block *nb, unsigned long event, void *p
 	return ret;
 }
 
-static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name)
+static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
+			     const struct vdpa_dev_set_config *add_config)
 {
 	struct mlx5_vdpa_mgmtdev *mgtdev = container_of(v_mdev, struct mlx5_vdpa_mgmtdev, mgtdev);
 	struct virtio_net_config *config;
diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 973c56fb60b9..a1168a7fa8b8 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -14,7 +14,6 @@
 #include <uapi/linux/vdpa.h>
 #include <net/genetlink.h>
 #include <linux/mod_devicetable.h>
-#include <linux/virtio_net.h>
 #include <linux/virtio_ids.h>
 
 static LIST_HEAD(mdev_head);
@@ -480,9 +479,15 @@ vdpa_nl_cmd_mgmtdev_get_dumpit(struct sk_buff *msg, struct netlink_callback *cb)
 	return msg->len;
 }
 
+#define VDPA_DEV_NET_ATTRS_MASK ((1 << VDPA_ATTR_DEV_NET_CFG_MACADDR) | \
+				 (1 << VDPA_ATTR_DEV_NET_CFG_MTU))
+
 static int vdpa_nl_cmd_dev_add_set_doit(struct sk_buff *skb, struct genl_info *info)
 {
+	struct vdpa_dev_set_config config = {};
+	struct nlattr **nl_attrs = info->attrs;
 	struct vdpa_mgmt_dev *mdev;
+	const u8 *macaddr;
 	const char *name;
 	int err = 0;
 
@@ -491,6 +496,26 @@ static int vdpa_nl_cmd_dev_add_set_doit(struct sk_buff *skb, struct genl_info *i
 
 	name = nla_data(info->attrs[VDPA_ATTR_DEV_NAME]);
 
+	if (nl_attrs[VDPA_ATTR_DEV_NET_CFG_MACADDR]) {
+		macaddr = nla_data(nl_attrs[VDPA_ATTR_DEV_NET_CFG_MACADDR]);
+		memcpy(config.net.mac, macaddr, sizeof(config.net.mac));
+		config.mask |= (1 << VDPA_ATTR_DEV_NET_CFG_MACADDR);
+	}
+	if (nl_attrs[VDPA_ATTR_DEV_NET_CFG_MTU]) {
+		config.net.mtu =
+			nla_get_u16(nl_attrs[VDPA_ATTR_DEV_NET_CFG_MTU]);
+		config.mask |= (1 << VDPA_ATTR_DEV_NET_CFG_MTU);
+	}
+
+	/* Skip checking capability if user didn't prefer to configure any
+	 * device networking attributes. It is likely that user might have used
+	 * a device specific method to configure such attributes or using device
+	 * default attributes.
+	 */
+	if ((config.mask & VDPA_DEV_NET_ATTRS_MASK) &&
+	    !netlink_capable(skb, CAP_NET_ADMIN))
+		return -EPERM;
+
 	mutex_lock(&vdpa_dev_mutex);
 	mdev = vdpa_mgmtdev_get_from_attr(info->attrs);
 	if (IS_ERR(mdev)) {
@@ -498,8 +523,14 @@ static int vdpa_nl_cmd_dev_add_set_doit(struct sk_buff *skb, struct genl_info *i
 		err = PTR_ERR(mdev);
 		goto err;
 	}
+	if ((config.mask & mdev->config_attr_mask) != config.mask) {
+		NL_SET_ERR_MSG_MOD(info->extack,
+				   "All provided attributes are not supported");
+		err = -EOPNOTSUPP;
+		goto err;
+	}
 
-	err = mdev->ops->dev_add(mdev, name);
+	err = mdev->ops->dev_add(mdev, name, &config);
 err:
 	mutex_unlock(&vdpa_dev_mutex);
 	return err;
@@ -835,6 +866,9 @@ static const struct nla_policy vdpa_nl_policy[VDPA_ATTR_MAX + 1] = {
 	[VDPA_ATTR_MGMTDEV_BUS_NAME] = { .type = NLA_NUL_STRING },
 	[VDPA_ATTR_MGMTDEV_DEV_NAME] = { .type = NLA_STRING },
 	[VDPA_ATTR_DEV_NAME] = { .type = NLA_STRING },
+	[VDPA_ATTR_DEV_NET_CFG_MACADDR] = NLA_POLICY_ETH_ADDR,
+	/* virtio spec 1.1 section 5.1.4.1 for valid MTU range */
+	[VDPA_ATTR_DEV_NET_CFG_MTU] = NLA_POLICY_MIN(NLA_U16, 68),
 };
 
 static const struct genl_ops vdpa_nl_ops[] = {
diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
index a790903f243e..42d401d43911 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
@@ -248,7 +248,8 @@ static struct device vdpasim_blk_mgmtdev = {
 	.release = vdpasim_blk_mgmtdev_release,
 };
 
-static int vdpasim_blk_dev_add(struct vdpa_mgmt_dev *mdev, const char *name)
+static int vdpasim_blk_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
+			       const struct vdpa_dev_set_config *config)
 {
 	struct vdpasim_dev_attr dev_attr = {};
 	struct vdpasim *simdev;
diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
index a1ab6163f7d1..d681e423e64f 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
@@ -126,7 +126,8 @@ static struct device vdpasim_net_mgmtdev = {
 	.release = vdpasim_net_mgmtdev_release,
 };
 
-static int vdpasim_net_dev_add(struct vdpa_mgmt_dev *mdev, const char *name)
+static int vdpasim_net_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
+			       const struct vdpa_dev_set_config *config)
 {
 	struct vdpasim_dev_attr dev_attr = {};
 	struct vdpasim *simdev;
diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index 841667a896dd..c9204c62f339 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -1503,7 +1503,8 @@ static int vduse_dev_init_vdpa(struct vduse_dev *dev, const char *name)
 	return 0;
 }
 
-static int vdpa_dev_add(struct vdpa_mgmt_dev *mdev, const char *name)
+static int vdpa_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
+			const struct vdpa_dev_set_config *config)
 {
 	struct vduse_dev *dev;
 	int ret;
diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index fafb7202482c..bf9ddf743e2f 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -6,6 +6,8 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/vhost_iotlb.h>
+#include <linux/virtio_net.h>
+#include <linux/if_ether.h>
 
 /**
  * struct vdpa_calllback - vDPA callback definition.
@@ -93,6 +95,14 @@ struct vdpa_iova_range {
 	u64 last;
 };
 
+struct vdpa_dev_set_config {
+	struct {
+		u8 mac[ETH_ALEN];
+		u16 mtu;
+	} net;
+	u64 mask;
+};
+
 /**
  * Corresponding file area for device memory mapping
  * @file: vma->vm_file for the mapping
@@ -397,6 +407,7 @@ void vdpa_set_config(struct vdpa_device *dev, unsigned int offset,
  * @dev_add: Add a vdpa device using alloc and register
  *	     @mdev: parent device to use for device addition
  *	     @name: name of the new vdpa device
+ *	     @config: config attributes to apply to the device under creation
  *	     Driver need to add a new device using _vdpa_register_device()
  *	     after fully initializing the vdpa device. Driver must return 0
  *	     on success or appropriate error code.
@@ -407,7 +418,8 @@ void vdpa_set_config(struct vdpa_device *dev, unsigned int offset,
  *	     _vdpa_unregister_device().
  */
 struct vdpa_mgmtdev_ops {
-	int (*dev_add)(struct vdpa_mgmt_dev *mdev, const char *name);
+	int (*dev_add)(struct vdpa_mgmt_dev *mdev, const char *name,
+		       const struct vdpa_dev_set_config *config);
 	void (*dev_del)(struct vdpa_mgmt_dev *mdev, struct vdpa_device *dev);
 };
 
@@ -416,12 +428,15 @@ struct vdpa_mgmtdev_ops {
  * @device: Management parent device
  * @ops: operations supported by management device
  * @id_table: Pointer to device id table of supported ids
+ * @config_attr_mask: bit mask of attributes of type enum vdpa_attr that
+ *		      management devie support during dev_add callback
  * @list: list entry
  */
 struct vdpa_mgmt_dev {
 	struct device *device;
 	const struct vdpa_mgmtdev_ops *ops;
 	const struct virtio_device_id *id_table;
+	u64 config_attr_mask;
 	struct list_head list;
 };
 
-- 
2.25.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
