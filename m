Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4EA4785F8
	for <lists.virtualization@lfdr.de>; Fri, 17 Dec 2021 09:09:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F3FB40B7F;
	Fri, 17 Dec 2021 08:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9KvNcFv527yS; Fri, 17 Dec 2021 08:08:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 98BAA40B86;
	Fri, 17 Dec 2021 08:08:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 714C8C0039;
	Fri, 17 Dec 2021 08:08:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B158C006E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 08:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BC8383F8D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 08:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvPfGwq1EeW3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 08:08:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::613])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2FCE84B4B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 08:08:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KG/2dmZkZvnu2XKSIVFOGBgHBcK8rUA7BbzCTgtLe/Cda/VNXLhnSMIye0brZYQD7k4UjGOiS4+xcnXlEzXFeZyPw0A/LHLudyV/ZogrxK7ieBUh48MowbkDmGXvrxO4UfC/hTLf3ZoQUod8YHYUxgz2fxNcsck6XTeLU6EBTTjkWwGuuVRLsn0Fm/xto71carjtQmg0VUogUQH1G4pqzuLBWp1veNaT+o2oZLRCC/XM0dLDKYNE7DpVuFtQus1huvXS9K+opNC2m7ORD3ihcvDHF9EqcQeG13+D3f5CEE+FU9J3TMfB/wvbio0QVuvJ1FaeDB5Brsjd+GLAiYXzUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3rTsevlOJ2SY3QEZxp9KkCgmpC9E6kYwZSWQ+XLqPM=;
 b=bAmYvxAB0IOrvSJ5yYvTHmGo+RZ3cH08ptm9DpH+0hbWBJR13dCSLnGMdB/FCSFGgPJrxCbZffC9C0fBKckDYO8b+M3WwMlQ6TauN+bd/F8Ru6n/XHC+gWo8iDh9Ym63dhKMiyw9xViXRwNd1/dl4+F1m0oX/d8qApv3DL0l55TCGzDqr3LLwBSS/f0ooDCgwmTfwahk7qurbfwVSdsvmNbzHeklZmIYwE0JfF4F7tIf39Ii2HNJ+r5+HjrETaxDbzC3PiQF/fJHbNuv+VbiDfEQWpaGOSJY7v2sFiKLDY2Uu+7+kHY7qjsstnCYCPG+fCxRp5cF4MGyCF4K+KqfdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3rTsevlOJ2SY3QEZxp9KkCgmpC9E6kYwZSWQ+XLqPM=;
 b=RvPnBrhwGS52Wbnh/J6Hi9Rx3PD8JJvGJCJ7UN38ESwbxGGGncBFtk4dqIiB1Udn9JE5A5M7aSwfa1rF6Af5AsrOIXHuqJrVwlD/vu665UW88QvU+dQ6m0iegkx/8wBkdjj/2Syihv/LJQKnx0udbaXVhTjdbvuLNQE3o5en+9A+2RNWpUqK/TtbTgAT6qGe3Br3wFRUmE7OQt8HPkZZPZHT6crVIYHqTCWBPfUXi02BI60/lFkkvm4rCTza8kToWkYCiC2Ax6AXqVgX2+Lk2UqsLMjpu+njIxfxKamBgKciwZSNCzWFncYdW5lOKJzgm4A+fvyso5QLoZYCfCETAw==
Received: from DM5PR13CA0039.namprd13.prod.outlook.com (2603:10b6:3:7b::25) by
 MWHPR12MB1261.namprd12.prod.outlook.com (2603:10b6:300:10::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Fri, 17 Dec 2021 08:08:47 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::58) by DM5PR13CA0039.outlook.office365.com
 (2603:10b6:3:7b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.8 via Frontend
 Transport; Fri, 17 Dec 2021 08:08:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4801.14 via Frontend Transport; Fri, 17 Dec 2021 08:08:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Fri, 17 Dec 2021 08:08:45 +0000
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.187.6) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9; 
 Fri, 17 Dec 2021 00:08:43 -0800
To: <dsahern@gmail.com>, <stephen@networkplumber.org>, <netdev@vger.kernel.org>
Subject: [iproute2-next v2 4/4] vdpa: Enable user to set mtu of the vdpa device
Date: Fri, 17 Dec 2021 10:08:27 +0200
Message-ID: <20211217080827.266799-5-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211217080827.266799-1-parav@nvidia.com>
References: <20211217080827.266799-1-parav@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4e84153-5ed9-42a7-8606-08d9c1347388
X-MS-TrafficTypeDiagnostic: MWHPR12MB1261:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB126160BFFAC003D694B044CDDC789@MWHPR12MB1261.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZDzilkuHYwkFmcgfgM4hmcEfOtn5XAZhUQbNmZe67kEYiUEhcVGwHqiaEOyYiZwHRGgYNwcU2Dpt9i0MFe49mqckmk5ndrMwowvG111nH2iQM1oM7XdFJ6hn7vn5SmcLfOAiiTTXvC2XYbkzAW3lyskwL2hmWuFg9r6tSZeyboNJntCsOtWMSVAV3ZOuD1z2pqqAFPlnucnxzHIR1pPUTE+hBmtO5WRnfjBo+mKIxlG2nbK3aJunOVNvRlGb+DTliTeeJwqyPSt3R7UB5JrmOAMPhOpFfb+1dwjjQRhNu78r2m/dBtTj2WK3F2r/aPm7DcDETnwM2QNhfqJ/ql9hONoHjSJtKYSNHf5jnoUDPiod5y8Hu/90mRVxVmKbaJ5JaoeKB3+LZ+gUwKstR2SyVxU6pF4CxOFrnvTvmdZ5jboeH8XBdTwToaSpHv8uIGd86vdqDB81w3Cv9Kc7asl8l85wk9fAPB3K0Ewf59BRMYIyVsPnV+fFOyR5eqvp62jIyVAsyQ3JuJmibu1VZJBx75kVTjc/ZkLL7XzjU8qGA4WJRBKfk29RvqsIjAz/h96Np8JcubcqmPTpzMH2ufadMHRXIP/RNIySdllWtP/GAX92+wm1tZEvxwBLCJYg1J37werZDLRW5mFYfy79wIDGTLculvw1hJFDtdegYag3GNpDUny9lH2he/qdJNpLYFS9xOo6nIarITr96Lp19xFSojuozrBW6qGH8NsS8X3sz4FguqCl13SyEwC5APj7iPS2ECWViFcafYX3bA6o3qkA5cv8ymiVKsLgf3ySwkVpsX/ZRSHTWzeJfJ/Rtq/9K0J
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(356005)(186003)(70206006)(82310400004)(81166007)(16526019)(2616005)(70586007)(47076005)(316002)(2906002)(83380400001)(54906003)(508600001)(110136005)(40460700001)(8676002)(426003)(6666004)(34020700004)(4326008)(1076003)(336012)(107886003)(86362001)(26005)(36860700001)(36756003)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 08:08:46.9016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e84153-5ed9-42a7-8606-08d9c1347388
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1261
Cc: mst@redhat.com, virtualization@lists.linux-foundation.org
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

Implement mtu setting for vdpa device.

$ vdpa mgmtdev show
vdpasim_net:
  supported_classes net

Add the device with mac address and mtu:
$ vdpa dev add name bar mgmtdev vdpasim_net mac 00:11:22:33:44:55 mtu 9000

In above command only mac address or only mtu can also be set.

View the config after setting:
$ vdpa dev config show
bar: mac 00:11:22:33:44:55 link up link_announce false mtu 9000

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v1->v2:
 - use get_u16
 - use strcmp() instead of matches()
 - added man page
---
 man/man8/vdpa-dev.8 | 10 ++++++++++
 vdpa/vdpa.c         | 28 ++++++++++++++++++++++++++--
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/man/man8/vdpa-dev.8 b/man/man8/vdpa-dev.8
index 5c5ac469..aa21ae3a 100644
--- a/man/man8/vdpa-dev.8
+++ b/man/man8/vdpa-dev.8
@@ -32,6 +32,7 @@ vdpa-dev \- vdpa device configuration
 .B mgmtdev
 .I MGMTDEV
 .RI "[ mac " MACADDR " ]"
+.RI "[ mtu " MTU " ]"
 
 .ti -8
 .B vdpa dev del
@@ -69,6 +70,10 @@ Name of the management device to use for device addition.
 - specifies the mac address for the new vdpa device.
 This is applicable only for the network type of vdpa device. This is optional.
 
+.BI mtu " MTU"
+- specifies the mtu for the new vdpa device.
+This is applicable only for the network type of vdpa device. This is optional.
+
 .SS vdpa dev del - Delete the vdpa device.
 
 .PP
@@ -109,6 +114,11 @@ vdpa dev add name foo mgmtdev vdpa_sim_net mac 00:11:22:33:44:55
 Add the vdpa device named foo on the management device vdpa_sim_net with mac address of 00:11:22:33:44:55.
 .RE
 .PP
+vdpa dev add name foo mgmtdev vdpa_sim_net mac 00:11:22:33:44:55 mtu 9000
+.RS 4
+Add the vdpa device named foo on the management device vdpa_sim_net with mac address of 00:11:22:33:44:55 and mtu of 9000 bytes.
+.RE
+.PP
 vdpa dev del foo
 .RS 4
 Delete the vdpa device named foo which was previously created.
diff --git a/vdpa/vdpa.c b/vdpa/vdpa.c
index 63d464d1..f048e470 100644
--- a/vdpa/vdpa.c
+++ b/vdpa/vdpa.c
@@ -22,6 +22,7 @@
 #define VDPA_OPT_VDEV_NAME		BIT(2)
 #define VDPA_OPT_VDEV_HANDLE		BIT(3)
 #define VDPA_OPT_VDEV_MAC		BIT(4)
+#define VDPA_OPT_VDEV_MTU		BIT(5)
 
 struct vdpa_opts {
 	uint64_t present; /* flags of present items */
@@ -30,6 +31,7 @@ struct vdpa_opts {
 	const char *vdev_name;
 	unsigned int device_id;
 	char mac[ETH_ALEN];
+	uint16_t mtu;
 };
 
 struct vdpa {
@@ -154,6 +156,17 @@ static int vdpa_argv_mac(struct vdpa *vdpa, int argc, char **argv, char *mac)
 	return 0;
 }
 
+static int vdpa_argv_u16(struct vdpa *vdpa, int argc, char **argv,
+			 uint16_t *result)
+{
+	if (argc <= 0 || *argv == NULL) {
+		fprintf(stderr, "number expected\n");
+		return -EINVAL;
+	}
+
+	return get_u16(result, *argv, 10);
+}
+
 struct vdpa_args_metadata {
 	uint64_t o_flag;
 	const char *err_msg;
@@ -204,6 +217,8 @@ static void vdpa_opts_put(struct nlmsghdr *nlh, struct vdpa *vdpa)
 	if (opts->present & VDPA_OPT_VDEV_MAC)
 		mnl_attr_put(nlh, VDPA_ATTR_DEV_NET_CFG_MACADDR,
 			     sizeof(opts->mac), opts->mac);
+	if (opts->present & VDPA_OPT_VDEV_MTU)
+		mnl_attr_put_u16(nlh, VDPA_ATTR_DEV_NET_CFG_MTU, opts->mtu);
 }
 
 static int vdpa_argv_parse(struct vdpa *vdpa, int argc, char **argv,
@@ -263,6 +278,15 @@ static int vdpa_argv_parse(struct vdpa *vdpa, int argc, char **argv,
 
 			NEXT_ARG_FWD();
 			o_found |= VDPA_OPT_VDEV_MAC;
+		} else if ((strcmp(*argv, "mtu") == 0) &&
+			   (o_all & VDPA_OPT_VDEV_MTU)) {
+			NEXT_ARG_FWD();
+			err = vdpa_argv_u16(vdpa, argc, argv, &opts->mtu);
+			if (err)
+				return err;
+
+			NEXT_ARG_FWD();
+			o_found |= VDPA_OPT_VDEV_MTU;
 		} else {
 			fprintf(stderr, "Unknown option \"%s\"\n", *argv);
 			return -EINVAL;
@@ -443,7 +467,7 @@ static int cmd_mgmtdev(struct vdpa *vdpa, int argc, char **argv)
 static void cmd_dev_help(void)
 {
 	fprintf(stderr, "Usage: vdpa dev show [ DEV ]\n");
-	fprintf(stderr, "       vdpa dev add name NAME mgmtdev MANAGEMENTDEV [ mac MACADDR ]\n");
+	fprintf(stderr, "       vdpa dev add name NAME mgmtdev MANAGEMENTDEV [ mac MACADDR ] [ mtu MTU ]\n");
 	fprintf(stderr, "       vdpa dev del DEV\n");
 	fprintf(stderr, "Usage: vdpa dev config COMMAND [ OPTIONS ]\n");
 }
@@ -533,7 +557,7 @@ static int cmd_dev_add(struct vdpa *vdpa, int argc, char **argv)
 					  NLM_F_REQUEST | NLM_F_ACK);
 	err = vdpa_argv_parse_put(nlh, vdpa, argc, argv,
 				  VDPA_OPT_VDEV_MGMTDEV_HANDLE | VDPA_OPT_VDEV_NAME,
-				  VDPA_OPT_VDEV_MAC);
+				  VDPA_OPT_VDEV_MAC | VDPA_OPT_VDEV_MTU);
 	if (err)
 		return err;
 
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
