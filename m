Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CD15AF278
	for <lists.virtualization@lfdr.de>; Tue,  6 Sep 2022 19:28:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3A4A81339;
	Tue,  6 Sep 2022 17:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3A4A81339
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=gyR+Rymb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MGuKPsvFffOI; Tue,  6 Sep 2022 17:28:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5D68D82B93;
	Tue,  6 Sep 2022 17:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D68D82B93
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE50BC002D;
	Tue,  6 Sep 2022 17:28:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EAE86C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B916440256
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B916440256
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256
 header.s=selector2 header.b=gyR+Rymb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFPFZu_ukwUh
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:28:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03B3940516
Received: from na01-obe.outbound.protection.outlook.com
 (mail-westcentralusazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03B3940516
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:28:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CusdoEl6BQHJtLQdTmaNZebowxYh3jQBgupVuaLRoM7vvOM2bhUH4QwPFVqyywUv06knBPPsscPpznhD8QuUK+Hnic+N3j9ZGAQr5oixNbyUuwRavF3vKpcsaLX+XpwSa4KMlAUAxR9CHmNRkWcFmNqQCR8QnYu47KN4QCIBYguVFGXtIgd7wRyUUTZ7tzmW0469nBlKXzDyXnmasuxYN7v16U2NliGm+r4HR4pTpHn1x0MDb1LxcsmyRznvHFvr94XWFM2t9Rz4clEeCqaf960bnazZkHFMJ3iumP+HV1QipT1rikO68n220tSQjjYN4h3CVGkUQDxFhC4dA6ZfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1c2jpic1ZsehO77/dNJ6DM6lUU4PciUDZDcjrhYwb0=;
 b=Id3ivb5awhrtAsgyZrLLZ8Emz9svd+PcDOVk9M/OdhytE7n0q+EES3EBj82jkQLDPRHT/keWGRrbrEwnTCYw5gWzw2OWuk7r6kOmXO+WHSkvaSsiE0tVBJabUs4pxgqI9XGPJBDfaqYeIrMhmzkSnDA4cjgupPg64gs4HMuO2Xo4ZO6siIsBdgERWZuoXSKiATZkiP9V8dPb65kfuysPFZOLvf+TdtTf/NBxyyb+36Z/Q9T+5tA60X9aEjBPiVLEFl0kiHIj6f+ESQnj+HVN4lDb9qQpJqLSiMp+NiCphBqt7AnchB2kaulkVvq8zEVcK+XQ+OrWQnMOCYOBPmnVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1c2jpic1ZsehO77/dNJ6DM6lUU4PciUDZDcjrhYwb0=;
 b=gyR+RymbbaF24gQhyXwb86TvQlGQYvOUyzeEBULvC+KGsJ7gOzvuyoX5oUnXkvx2g9TdSODPUY69624Ob47NOIfguFiWgDAV63umM0xAvhqUTVAk3Z2COoY7tw0UkDpQSOu8xisj75Jzu++AwYxhDqdOh4Bx9Q071sw3+G6D1hQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from BYAPR05MB3960.namprd05.prod.outlook.com (2603:10b6:a02:88::12)
 by BN7PR05MB4276.namprd05.prod.outlook.com (2603:10b6:406:f1::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.5; Tue, 6 Sep
 2022 17:28:34 +0000
Received: from BYAPR05MB3960.namprd05.prod.outlook.com
 ([fe80::a8ee:57cf:b2f1:b818]) by BYAPR05MB3960.namprd05.prod.outlook.com
 ([fe80::a8ee:57cf:b2f1:b818%5]) with mapi id 15.20.5612.011; Tue, 6 Sep 2022
 17:28:34 +0000
To: vbhakta@vmware.com, namit@vmware.com, bryantan@vmware.com,
 zackr@vmware.com, linux-graphics-maintainer@vmware.com, doshir@vmware.com,
 sgarzare@redhat.com, gregkh@linuxfoundation.org, davem@davemloft.net
Subject: [PATCH 3/3] MAINTAINERS: Add a new entry for VMWARE VSOCK VMCI
 TRANSPORT DRIVER
Date: Tue,  6 Sep 2022 10:27:22 -0700
Message-Id: <20220906172722.19862-4-vdasa@vmware.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220906172722.19862-1-vdasa@vmware.com>
References: <20220906172722.19862-1-vdasa@vmware.com>
X-ClientProxiedBy: BYAPR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:a03:114::19) To BYAPR05MB3960.namprd05.prod.outlook.com
 (2603:10b6:a02:88::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR05MB3960:EE_|BN7PR05MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a19e96-1ce1-43f4-20aa-08da902d3951
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j4zWbF9CLz15R4uYwk0HJqL/OG2FL15NX1LjNzJIPaIFbyadSdPyPRFIU9N9C97NT8iEEe1rBEDB2NpqvXm45LucaOzsjBTFr323kee1O7C4FBZLeshulHu2Q+sC17chmlQ0Hix2RzI9yE/WWS4vXaEhzeG1d/vPRB3e8alPZ6B72Fv10XjkGxjRf12ZOS7SLjwx/RU8GG/Iyq6TgVwSV0IfK0yJpchPi3vFQZSyC2JX+iCsKvM28PSNkI2WBNfd7YTtgOQVfacarTrqQSJPfns6khdsUUy3DSNBt2eMqIG+LIGdGrqUSKv+lveprjKJcUcGlxMGi97yj9zjuFIDOMv51Ectju5bsb+rAY7FAuTIEpzzmzHsXHajFP366K0uM1AZ4Rk+hDyZE3MrcQxVV0ZemNQYSAL2UbeH4I2KS9UnkUfsBiigAJI6f/1KDMt/jqoaApb+yTtLldGu0hgCHZz+NwX8yPcAsu6PXefDtZFYn4K6peiMVw+3YiRAt9Z56jXEOVKNDcNcEXPPOSvpkL7BeXKFV9zNkKACBqZaSuwhJD4cQiC/juyR4lNsmXgsSfQ10frkdoOLCVJr77eMR5u+R518FSmbs5mADlHOFwl7kDiAHYQkEz/fT0eARZJrphx2ylsZ4PhxX8glUX7rO21LGR1JRQjxnAucMV1lsVi3OVtKjQ4l+yjtuVqEvfSKKo1a5F3mQR3mr3vWOOJi7wjsP5Huv1L1j5KYjfZKgFGWEFQ+6/0VJKfsR7227GR0wHDQ9rG5/baX6VkL493Tq8OvBogACcFMubhY7EEFE8OQrpUeGJ4HRylClY1UJhLq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB3960.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(38350700002)(38100700002)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(2906002)(4744005)(7416002)(5660300002)(8936002)(186003)(1076003)(2616005)(9686003)(6512007)(41300700001)(6486002)(478600001)(6506007)(86362001)(26005)(52116002)(6666004)(36756003)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L+7jPtTMvWLeigsS8NlwdDk1nVIrRcQbrlTGPdbTsKeNjzMgMVNmPbCcTh9o?=
 =?us-ascii?Q?Oy0Ct35gFkgVbKN8ZdCtVHs9QG28yNasxP8h7CL4kfRF2d/DWnyVf5YqWQyG?=
 =?us-ascii?Q?VjQQIj5sGufFjOa1ZbaW1wuWkFKMs5afTnnygRxVMk7wbiD38acRcTzUQvUN?=
 =?us-ascii?Q?BAJ+KhvhPK+uYb9yofnnrglDdPapelqyR8rUdwO7YuIIyxh9hSpu3yBUwqQm?=
 =?us-ascii?Q?S66rBM4D0ou1hmbn+XV0aXNo0UsMndt2PzTTsm595o60w+fUiJXhRjd9glTB?=
 =?us-ascii?Q?fAFEGwNHM9Wyq1+EJ2pDKbf81lcNb4vxp9O5kmaw62C98uiGk6AUjo817wKb?=
 =?us-ascii?Q?8GleuwFKcV2IzxBwg5D8tYaGxv3zw6TMnTAN6NU5J4nDHlQKXafFmG1Kx1Ac?=
 =?us-ascii?Q?ZneJwssY5K9JKkbQdlqr7XpWFl+joS4eN9ihvMvn6VGzaUfildEAURelAKk/?=
 =?us-ascii?Q?rMry4mFpuyGtXnMuRElpoEeu8oyqNbwD0xan9IdAKKadSNCqHFTkaP4TH9IG?=
 =?us-ascii?Q?7KofLmXtyS6NzaliFQ/CTWQ84fJo+0RByXDKxIZygArCyzWNNSMrp5b+AO0I?=
 =?us-ascii?Q?qmDX/72+TUnjShOpiOow6Gl/PCgEMk6X8dUrNqStDNaCG7DLqJHRA/42y6Ob?=
 =?us-ascii?Q?REiLDDaEGTVVo14K4P3p0zs6dplYRmTRYCZkfC0H7wgtYTFK2lb4+kDhia+T?=
 =?us-ascii?Q?1ZZNk/ODFfc5qseiZKVNKkHyGcK34G0W5l2IapD/BhRcelF3v6Gj8Pm/KK+8?=
 =?us-ascii?Q?ld3SzlsVqlNal/TP0yIvk3fdyE21lFet0+PANs1LQJnyFYVXSgF9cehjzLS4?=
 =?us-ascii?Q?BLo2d79ba8ovP9NLeufxCUH8e5Fw5DHG+Qhhm9eVqSct5BDl5vHjJzyd33RP?=
 =?us-ascii?Q?ormA7fTUsJUEwDvh+mg5V/X7iger0m1n3f+R4MAEFkUQeU1rQw82lBjhcYvf?=
 =?us-ascii?Q?jTX9oFbZujlFQqhyQSkuBpc/nsE689VCv2L+1HpehYzuGkOS7dUhMaTvjae3?=
 =?us-ascii?Q?CQQHmvki20Bxvl+InVZWAoW14/2Zggva/vnCkICUpICfTugg8eOVZwZBMp3s?=
 =?us-ascii?Q?6XKPqyw2lvRURZ8FeeG82JXlz8co4Myod0BohNqolYwvH2/+/brd6obiuCMF?=
 =?us-ascii?Q?qxSUZbwc+nGdMEQ5aAR0WSgM/28vcTrjRFgA/MEaNYtT6QU4s5fk1ielO+YQ?=
 =?us-ascii?Q?qVdaiBpWOVUeCtQX27cA++TanIOZ2+HRLIXNMRaAMjvmw4VEERHYlSmJwsL1?=
 =?us-ascii?Q?Rutrwp1nzd0C4cEus+g3a4inY8DyVhsVm2eWhq3eLftKc2/WiHzI3mLw8zKA?=
 =?us-ascii?Q?7h40EH1ZiEGipv3F8J9cYLYeE9Y+5Eu5JlwARoV+h3DuXlH77Sj5Z/qHWjRG?=
 =?us-ascii?Q?lvfgwv6vCfl6cOyLn7P5IIHCClIGnobnZlge9+PVB+07vdO1yyEDG6hbeARA?=
 =?us-ascii?Q?IxcjqttM0QZNnVTOlRe4vw8Nr5woCAhOLcZ41X615oRP3+XHKxBrEP/3ubjC?=
 =?us-ascii?Q?O+evKtPhklaRWkSmMOou62TEmGrJf5+grWgfVkHV7c3Yo5lWRUS3g68ANkEd?=
 =?us-ascii?Q?wUR3PikIXlienrahtOKD5Ut2vAyqlenVlOG7psPA?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR05MB4276
Cc: Vishnu Dasa <vdasa@vmware.com>, linux-scsi@vger.kernel.org,
 pv-drivers@vmware.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-rdma@vger.kernel.org,
 linux-input@vger.kernel.org, joe@perches.com
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
From: vdasa--- via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: vdasa@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Vishnu Dasa <vdasa@vmware.com>

Add a new entry for VMWARE VSOCK VMCI TRANSPORT DRIVER in the
MAINTAINERS file.

Signed-off-by: Vishnu Dasa <vdasa@vmware.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5a634b5d6f6c..0e52ee3521c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21873,6 +21873,14 @@ L:	netdev@vger.kernel.org
 S:	Supported
 F:	drivers/net/vmxnet3/
 
+VMWARE VSOCK VMCI TRANSPORT DRIVER
+M:	Bryan Tan <bryantan@vmware.com>
+M:	Vishnu Dasa <vdasa@vmware.com>
+R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
+L:	linux-kernel@vger.kernel.org
+S:	Supported
+F:	net/vmw_vsock/vmci_transport*
+
 VOCORE VOCORE2 BOARD
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
 L:	linux-mips@vger.kernel.org
-- 
2.35.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
