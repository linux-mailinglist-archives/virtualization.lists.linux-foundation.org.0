Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 533804785F3
	for <lists.virtualization@lfdr.de>; Fri, 17 Dec 2021 09:08:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D859861090;
	Fri, 17 Dec 2021 08:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_jIuiD6VXDx; Fri, 17 Dec 2021 08:08:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7488D61086;
	Fri, 17 Dec 2021 08:08:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2CCAC0039;
	Fri, 17 Dec 2021 08:08:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EE39C0012
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 08:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FD0284B4C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 08:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wK3nztfpiaVV
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 08:08:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7593483F91
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 08:08:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7r6CK6Qas1OBncQOSrHDZ+zLiPt9jAE1SEcL4fQP7TjRlrQY5QWkzqQiRLNf/p1VGDQTrzBGeUxYnpMq1r9HNtNuvCrm9mXrzWYOpjiWGGotBLxAZ7yGZsjhsSWCKTCokJeltvdiRmJmzS3clV17TSdseMIck78jZKcm7qCWF5AWBn3qE3Xvhs/a4ygqTMP96GOhKIXF65EVsMctk0eHHNhk9Io3c3o+/JZ/CXJ2qO7/BQHxVZf1F/em0TMN+c9RlO/BOn50IFLzX7VM/OMl29csFHFVvob7gQkBihbiuD7VNm1FTYtHR7NDyYoNg/29Os2OUJNyWURxnhvNeDCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGOMBWJK3EMpTNUPjAAnMI6k1z1sZeTnMTweaxsShzM=;
 b=FLjEgAMUCjhPSLF8XMDFlwhl6LNP9bF0C/k/8FMA9ohDvthMzFnYvLvfX+smFXlEaVc3aI9a5DnpW/Vw0z+LSn8I9ZAos2CqOMH2Q1qonM0JN/BCWLBxDxdoVb7zFdRf8jb2N2MgfxyoNnMrEjaRpSRss7EnSG6QxUgYY5/+Fo71y8ZvWaWIPCj5KTjjl7/aElzW7KmSMP4dxE0EQlbYqP/eFjUCT74AsS95Js3GiSQZaDet1z7GPOGR1SyEsJYQAGdxCrE/ZS5Jxh/dmqWwARB2Xa82AGnv+6CptoxiJbAoZRvCU1f8/XkF+jZ6rKs7th4RvqOqRfyH5eaH6o+W8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGOMBWJK3EMpTNUPjAAnMI6k1z1sZeTnMTweaxsShzM=;
 b=Vv8R+lqt/9Tqt5HXCx3ajWz15d1ztZVd8TWxqpsiTdGKVRcyePbL+4TZPiuCN/Fh8AODVXvmGG40JlaOofONLt2sXLlDBEOvMI6NBKvvhTT/cT8hzxB7GIkYCIwcFS+PDueNl7zmIzjrO3q01Fm04/cbzKlzt6myAjcYfpBIGg1fTSkvJwisG8jTgfi5inAQE81PYF9zkE88Sc4bZaEyP+gK2/5S+aomWbvS7s82eKwfeLS1Ff1vnCgkrGJ19Gu+1Hn/nOgPu8LX+qmh8PhMl9aGNhHEsVH3js/YIFz06EHupuSztV4UnsVqT98VyvOEMN+0KJKfiLxV4sd838otZw==
Received: from BN6PR22CA0044.namprd22.prod.outlook.com (2603:10b6:404:37::30)
 by MW2PR12MB2444.namprd12.prod.outlook.com (2603:10b6:907:11::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Fri, 17 Dec
 2021 08:08:42 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:37:cafe::bf) by BN6PR22CA0044.outlook.office365.com
 (2603:10b6:404:37::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Fri, 17 Dec 2021 08:08:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4801.14 via Frontend Transport; Fri, 17 Dec 2021 08:08:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Fri, 17 Dec 2021 08:08:40 +0000
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.187.6) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9; 
 Fri, 17 Dec 2021 00:08:39 -0800
To: <dsahern@gmail.com>, <stephen@networkplumber.org>, <netdev@vger.kernel.org>
Subject: [iproute2-next v2 0/4] vdpa tool to query and set config layout
Date: Fri, 17 Dec 2021 10:08:23 +0200
Message-ID: <20211217080827.266799-1-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 951b03f7-b46d-417e-452f-08d9c1347069
X-MS-TrafficTypeDiagnostic: MW2PR12MB2444:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2444D2BE9E68C8B692D70529DC789@MW2PR12MB2444.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UU14ZIbFYnkccFpnwxk5BzEmMaoVwMErkUilMKfNn4SNhD4Nmha8TSwCDLldYbr5Owq7YAiX5u6QzdUReuczpGI24tTXneJ3VYkxOlQFMbvrGkqAJhE4z9us3m3csIF/jRqRwrSuDK+b9lnwBRPIsMx1uBA4k+RmZGsJArm1a3sfDkkIlSxUqAZnssvlQITAVKz29YG6JNjjlfGwj+SrJCI1t8C0ZbgG8Ttdp3ShksbOF5LLUpjACF2Tp3AP2S6vTtxe6MUuvNgYL8B8jN//gwkHWnog3Mdxql4Vel31o3U9osBr7F1gaLDAQDl7iTh6U5yWVqapDU1ebBcKDTCpsbKImpOgsiRaP+DLIFf8mHj54ZtpqvIkhJtopZPzTJe1BU7DliN3K33sm18qxvGRI+OglPOISLBIhQ7Z2fZEfVtf/Vprr+1b57zMlldV2wgCwN2cV3xxNCP4QD95fKG/gyL5Ks7COYdrE1BqQsU17GvC/aWLH7J2upKlvSgVXGOujLIoSS7YRO5m7oDf4ftsh16LbIKE0ngDbdcCuLYUDpjlbQldCbOjfESi/JiAQ6XGs+99MDq6qkEtKoqNWP6TnjhI4VnrBVqi9sPl644G9zVgWx3RrWcB4uhtSDyHqBZIJbC0Na/MUUMmcdf2oOsTwJSv7ROI4fxCgRS2NQC3JI0YzeDzAkW9pgARoRDO1kvi41MuaMjw1AH6FfAHYNfP+iOi9BziyiVY2ExjtSeDXv2qT81EtB8S6AGp65NcU61FW8PeKDLWd+A1aXYBAbvKUotHKi5Mx7JT10TttJ2vhLrntvQ5umxe/qE6LjSEaqT6
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(47076005)(40460700001)(81166007)(4326008)(2616005)(186003)(26005)(1076003)(8936002)(70586007)(2906002)(36756003)(34020700004)(82310400004)(5660300002)(70206006)(8676002)(6666004)(336012)(107886003)(508600001)(86362001)(316002)(36860700001)(16526019)(110136005)(356005)(83380400001)(54906003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 08:08:41.6324 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 951b03f7-b46d-417e-452f-08d9c1347069
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2444
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

This series implements querying and setting of the mac address and mtu
device config fields of the vdpa device of type net.

An example of query and set as below.

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
            "mtu": 1500,
        }
    }
}

patch summary:
patch-1 updates the kernel headers
patch-2 implements the query command
patch-3 implements setting the mac address of vdpa dev config space
patch-4 implements setting the mtu of vdpa dev config space

changelog:
v1->v2:
 - addressed comments from David
 - added man page
 - using get_u16
 - using strcmp() instead of matches() for arguments

Parav Pandit (4):
  vdpa: Update kernel headers
  vdpa: Enable user to query vdpa device config layout
  vdpa: Enable user to set mac address of vdpa device
  vdpa: Enable user to set mtu of the vdpa device

 include/uapi/linux/virtio_net.h |  81 ++++++++++++++
 man/man8/vdpa-dev.8             |  42 ++++++++
 vdpa/include/uapi/linux/vdpa.h  |   7 ++
 vdpa/vdpa.c                     | 184 ++++++++++++++++++++++++++++++--
 4 files changed, 305 insertions(+), 9 deletions(-)
 create mode 100644 include/uapi/linux/virtio_net.h

-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
