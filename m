Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C72876F2103
	for <lists.virtualization@lfdr.de>; Sat, 29 Apr 2023 00:44:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50979428BF;
	Fri, 28 Apr 2023 22:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50979428BF
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GVqvV6Pk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8l3qCSdV9od; Fri, 28 Apr 2023 22:44:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AFDFD42891;
	Fri, 28 Apr 2023 22:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFDFD42891
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFC00C0089;
	Fri, 28 Apr 2023 22:44:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2791EC002A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Apr 2023 22:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E131D4031D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Apr 2023 22:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E131D4031D
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=GVqvV6Pk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NwUus8HalH_c
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Apr 2023 22:43:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39246400D7
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39246400D7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Apr 2023 22:43:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G77uFLUs04hEm2oqfjxlDQbI7BvEPfs4PYpnj8rQYKP8J8Homs627moZEynrU6GHrYeLz4a7+EonAcBrGDIHF3KPDLxLCq+XB6DFkEbs9DRrYNnI1DS1wPTFGXELMBcTw/VbAnxWrNrYmMNugXA+dhHMkF5PL70s5yqwoRab6x4O10psma3YpwPqvFkqb0dwZ+soCY2gUlridjNNx/cThWzselI22TWoC3HxHxXayShy5Z29BeQtYxR3sqlCzyFi1VYOOkmke8K1Xd4xcJtWZKI3OnvH/481iFj0mSmvcPGSQepP0N+XdoQZDB5GA2LxYqSHyh2nxHJUmQu9oVwgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoCALTqgj1Ni9DxZfeyCJQtjrltarziYshLWzrKBR1M=;
 b=TzR/0Kwi2u+tuTZFugikyPkdlhOzSfAO63WQMYtJzI/vT6MBgOBOOyg8fJagI/GZfvo0tkCAeYCkKonxumFtWIQ6bo2FAWpiWHGlXDWcumiMvDLkmqvGt3ea0krDmqEsdGjTyn7bofm32u1KXhDWgNw4kuveTAOrJ7M89RElI51mwrNTUaGUzbsTcm4onDkDRSBN4PbRfpAUuPpqXVV9fNGqnjysKNOQ1fO0T7dJSb6SFJB5XojEgV/nL4b2WW1YYSHa9siHep16ZtttqUnjhHON8dby0bS72qxGmb8DFiJ1eXfFENLCGWlbReW1G82XAWK1f/4a2RxmpSQ5LRAJ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoCALTqgj1Ni9DxZfeyCJQtjrltarziYshLWzrKBR1M=;
 b=GVqvV6Pkx3atw8ci7QzlAoJ4k8fzS+ji9+t7hZXBDY8r8D6FLAhF6WBM9rPhg3IZWNYBhAU0f/tkWTF6cGVlfMUyLAuQddx496ui4EKhAwIXUaNKySIVRS7MM/ZjJK/aDIkVn8d/xIgdnKzksufUvu2mSmT55U96y/dg8facTV/6ypT8nmOI8wwY4nJLIB/RnYSyvLqFc87b8mlTMD+XmWXpGbVafucMRRDot/eUmKgfEVKQVnAQUOewHyaKAy+DM/tQG+swGAnhJBkiZCCNafwiy42bMUDMMcTj5udffDZRzhJ7ttb6dIZGBhwQ5Y5IF/drJeVOfRkegPLkYg6r8w==
Received: from MW4PR04CA0362.namprd04.prod.outlook.com (2603:10b6:303:81::7)
 by PH0PR12MB7012.namprd12.prod.outlook.com (2603:10b6:510:21c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Fri, 28 Apr
 2023 22:43:55 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::39) by MW4PR04CA0362.outlook.office365.com
 (2603:10b6:303:81::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 22:43:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.24 via Frontend Transport; Fri, 28 Apr 2023 22:43:55 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 28 Apr 2023
 15:43:54 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Fri, 28 Apr 2023 15:43:54 -0700
Received: from vdi.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Fri, 28 Apr 2023 15:43:53 -0700
To: <virtualization@lists.linux-foundation.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
Subject: [PATCH net v1 2/2] virtio_net: Close queue pairs using helper function
Date: Fri, 28 Apr 2023 18:43:46 -0400
Message-ID: <20230428224346.68211-1-feliu@nvidia.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT055:EE_|PH0PR12MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 779dd040-173e-4a29-fdbb-08db483a0c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hhgbru8bZAjs4CTLunG26FXMPTFWzxorX3ZH49r7xOSM6NQPyR0xjpgFMkgPVGVEIbt30bxtoq+6TnF1ufQe8aEH0t7GVh4fU5xWCRz1JeqD8b9keniqLNFRusUf3UjmOixIMu9etmnQJMLF5+ztmLJ7wb09ajRdep8vmyNS1iGWqOF0K6qoXZvRFyuDNHcppvurmrimRPA6cEc+cXC6MHpaBcDfumrkUEm0qIGxznCo8JxurD5NzfT/W8mp2ayY6WEEMszFgDMkIo0pOeaGS5BzoeoguLBHxumHtcQDiNR2pmsSXwVF4awoBdXlfeTbwPCFel3+FGWongN5z2UzhqEyrbBWLAFEW+ColltqEkQuULy0OuplNfdpy8gqJUGrDGr99ju3C4tFZ+OXlsMebVu6ViKN63GiMUTfmO4ljhcQy/oDFj7CO2Dc3/dyemM9qVGYHbxxI6+i1XgcYH/6Om8O3OWozGuskbymGIo08dfsJzqQQ/aH1w+fzYRE1fQGys68+U3x+hFqzi9CTTF1B5b8IWyhAWQXu8BK4I8VL5bx0EJ0BSqHh6MOS3w7CkDWNC5W3g+Gus7ISoqs6VtDUzP+iQOVJrNChrNT2SivxNRf6OHtF3yQmojGN+CoEtOXfuhO4BZRKj8jnAi2YGCv2JZFDIHr686O0twNmjCrbX3i6H0Gce5YVvnlFXlMeC96D4eCBzwLs6ZA8f0iXK50k0tr9Idx+bEx3p9lWaNHcmg=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199021)(36840700001)(40470700004)(46966006)(426003)(336012)(40480700001)(47076005)(36860700001)(83380400001)(2616005)(186003)(40460700003)(1076003)(26005)(70586007)(86362001)(2906002)(316002)(70206006)(4744005)(7636003)(4326008)(82740400003)(107886003)(356005)(41300700001)(478600001)(110136005)(54906003)(82310400005)(36756003)(8936002)(5660300002)(6666004)(7696005)(8676002)(46800400005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 22:43:55.2615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 779dd040-173e-4a29-fdbb-08db483a0c3a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7012
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, William Tu <witu@nvidia.com>
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

Use newly introduced helper function that exactly does the same of
closing the queue pairs.

Signed-off-by: Feng Liu <feliu@nvidia.com>
Reviewed-by: William Tu <witu@nvidia.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
---
 drivers/net/virtio_net.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index fc6ee833a09f..5cd78e154d14 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -2319,11 +2319,8 @@ static int virtnet_close(struct net_device *dev)
 	/* Make sure refill_work doesn't re-enable napi! */
 	cancel_delayed_work_sync(&vi->refill);
 
-	for (i = 0; i < vi->max_queue_pairs; i++) {
-		virtnet_napi_tx_disable(&vi->sq[i].napi);
-		napi_disable(&vi->rq[i].napi);
-		xdp_rxq_info_unreg(&vi->rq[i].xdp_rxq);
-	}
+	for (i = 0; i < vi->max_queue_pairs; i++)
+		virtnet_disable_qp(vi, i);
 
 	return 0;
 }
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
