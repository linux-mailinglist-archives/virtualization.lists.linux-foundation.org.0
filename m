Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A00243AAF2
	for <lists.virtualization@lfdr.de>; Tue, 26 Oct 2021 06:03:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C60F4049D;
	Tue, 26 Oct 2021 04:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id smc-ZiohYWYm; Tue, 26 Oct 2021 04:03:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7AFBE404B7;
	Tue, 26 Oct 2021 04:03:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2512DC000E;
	Tue, 26 Oct 2021 04:03:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24F38C0012
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 04:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 060C7401DC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 04:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGJpqSOh64Ib
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 04:03:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9018A401CD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 04:03:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gujRAjj8KTiN2n/W0j9Y+gE+0PlTq0eXPU5+kARYzt3tep9EHO6YkLxOsIus4TZHkxyR/SdrtSWmLAv6ULAnQyNfH9dpAJKKVVEpxE9QV3ALrgM2SMUUUWmuCn63uMV2kuk+hCCF5ZuZcWrw8q2X3LlJgJXwxepiRDOvKu4y0z3SZrzfN0dJ+OT/jqlK1g7FGY55FyQ4f6MKmfQDG3S9GrzE3atSwG38vMqsbPQmgXhAqiSy3hIsjZLMdrp+yKJLmYjhD6WgHwrQaaVjDMS+qoNFUGwBC7XsFyIgvuDhTQcD4IjxTqU7e46MVCRO1qqS2FxpwuJ4ScweV+lda+s9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaABOAC43BMNghJ4ZVQtvq3qJu6gdY4J2VwUdqZxUVg=;
 b=UtgmE83THNtTitQZL9QIfroiROlTPKl+0fWJTohmlrw9dKVCkYT8IuMSk6gSWKQodwu1tqbFiP6lPjt0O5JI7GCPhwZH+60skSQIgHLu/01O30muPM79ghLrLHIn9tnU5mVqNV/S9KglKuXpw+OTw5a5/KFFAiZM4S3sIzi8vdZGa9v4PwEX/424VGBg1Ugj62kpvgNhDSQaEpeSe/fHIS/YouwuUgGJej1LSG4ZZ4fxR36tQT+bdo74hvTFqsC17El0k08sd3toje2Dd+wn6cS0M0i77hfgmE3UG0N4jMTiuhZk/oHXv0m394BjvCaxSxsfobkwSmVY4Io69kM1CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaABOAC43BMNghJ4ZVQtvq3qJu6gdY4J2VwUdqZxUVg=;
 b=KtUz0npwCbLDM+t9VqR3iUaRaPSGjLoCCXgJmeSU2qGld8WZCGcT0GoRSOdTRrkWmnRn6gWLOMNAqF+r9LAEqNuic5a7vKVU3TvRL3JWJHRBp2YRE5/TsmN8QmFSCt+xKEwSwncbWc3Qf/wChMSm/WwXhLPLhO3Vv7zsa0di7lVN/E+S0lTt/sTpQqztEcWjqiOEvFDtuS9DyUpBDQ4k/an2BCz9YrpJZEqEFcIs3pTwDffsFPRsbCNqQ/l5A6vdFCbg5uHJkuiq8Ogj6V2/Jj+a73KGZehTP9wO4xfAhPECwqF+7HmksByaS9kspeCT+DQMrqkqVI0YNXV4u8q10g==
Received: from MWHPR2201CA0056.namprd22.prod.outlook.com
 (2603:10b6:301:16::30) by BL1PR12MB5362.namprd12.prod.outlook.com
 (2603:10b6:208:31d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 04:03:03 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:16:cafe::c3) by MWHPR2201CA0056.outlook.office365.com
 (2603:10b6:301:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Tue, 26 Oct 2021 04:03:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 04:03:02 +0000
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Tue, 26 Oct 2021 04:02:59 +0000
To: <virtualization@lists.linux-foundation.org>
Subject: [PATCH linux-next v6 4/8] vdpa: Enable user to set mac and mtu of
 vdpa device
Date: Tue, 26 Oct 2021 07:02:39 +0300
Message-ID: <20211026040243.79005-5-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211026040243.79005-1-parav@nvidia.com>
References: <20211026040243.79005-1-parav@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f24e842e-31f2-4f1f-4ae7-08d9983581b8
X-MS-TrafficTypeDiagnostic: BL1PR12MB5362:
X-Microsoft-Antispam-PRVS: <BL1PR12MB536212A18BD8A597C1E9757ADC849@BL1PR12MB5362.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eWufptgHbn0VmaMR3m3J8tOPfRQDS5TCrqT0ETB7BfZdKg3gcoFRCotZfGyWR5pLW/kksFJXalBMFWSeMSPL3bSdQ/++4BJHQ4XbRodI8Glv8TM4E9GC4pmR6EuWgKQv72qT0pVpU3oyjdNSrPoWPUlCClQYTwwUpXLnjkDOHc1Y+tgtpo5Y3QU5IsGxe1dDTyj9R4+UQoC9gYWtlm4VxfIGU5ikbA2SDPXFmRPOLf9fZXA97yS34XftOxCssHP1Bh+oM/CpEWjmm0LTl3J5aZ34KOuT3ztUs2FEaSvTpTa262X8m2tzN/H3WkjU38Y18spigaV5qUY3O9kLGy21N7HGeOK1aJ7oTHw9uYIfNI+/byceUXKWN6zxJcOSOrIRfu7nwCQXEWmfxcmpFvK5TMqC8csp/qe0dOvrRb1OIylJ3Wx1KUqX7gfKsvMi+dmMf9VjOW80g3k6X7851Tb0Ah6dUUvkFs2iuPAKvYYecS89HoOoJdS/i7F2mcg6IBnPkWrAJHbmjOMFiLRNPBM63volCdPjiUl63bEox4JsD+lBLg8e8REzqd4gFJ50KAThIB9Y0CJbmsudMKyesMpVgTgdfoR/1OiwEwcPBOB/Twfh+Pzwwjm+/VQZFdE1bqFYDWuKrme5An6N4QbFWuIW9U+v5vSytbq7QYutYoTSZ7iY2LHoy5egZNFvNzaM246pT2eCNmM5FKnrB59hex7JPQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(7636003)(47076005)(426003)(26005)(316002)(8676002)(186003)(508600001)(5660300002)(107886003)(36860700001)(6916009)(2616005)(82310400003)(86362001)(2906002)(356005)(1076003)(8936002)(70586007)(70206006)(336012)(4326008)(36756003)(6666004)(83380400001)(54906003)(16526019);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 04:03:02.5493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f24e842e-31f2-4f1f-4ae7-08d9983581b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5362
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
Acked-by: Jason Wang <jasowang@redhat.com>

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
