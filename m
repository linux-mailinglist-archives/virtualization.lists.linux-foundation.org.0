Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB07B2279
	for <lists.virtualization@lfdr.de>; Thu, 28 Sep 2023 18:35:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60CBA61197;
	Thu, 28 Sep 2023 16:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60CBA61197
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sLtZq4Sz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ciT2WIY3j1Xy; Thu, 28 Sep 2023 16:35:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EBE8F61198;
	Thu, 28 Sep 2023 16:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBE8F61198
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 188A2C008C;
	Thu, 28 Sep 2023 16:35:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20DFEC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Sep 2023 16:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E446D81E55
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Sep 2023 16:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E446D81E55
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=sLtZq4Sz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNqf0HTafeID
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Sep 2023 16:35:06 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9795281E52
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Sep 2023 16:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9795281E52
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1rAO1DjyQXTTqa+Tvc+EBH7TBL5idMce3vN5tfiGMAF9P/jyKqsVOPw2hJPHafWf8rrcHDkHV5ZSTyMJLfLSvrqO2nH/XcJhN6rB90S2qRab1UxhmzgPM7XEP3TM2+GS1up0jgV/WVOwFCHfoEK0rd0RxLAVEIbHxI1PIpPo+e6tfzSg1EU1IzTY5pE9SgEFqlIRw3ANLGeAfL4xK0c23tMkeN/O7Jjsj4E1S3SyroUVSLoV322dNk9Qo82q8tmV4HgwZ9Npk7qLblQLsDodCkUIvQG792xqvFLb7sJEj2rXX9ZEe7cHnhbiQRhnNHOAr84VpZ9CPC+WCCPU6NRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmPn4qWmP7KfJ+WpATYZhbiwWGz86s/5qlts7hBoVyU=;
 b=mDdOH+CFdIZV6uXMFRWG4vRXy/SzG47uuUb042W33N4qtXQ6sHkThvfJeVyBgKeM+D3OMsawqf2/xN/BbpIWbGQCWuI0PuJ/xsDejuFHOKFSBnW/uAAaY+fhgs5JFySZv5NRRkcGe3uKIhXHnQvl9BKDDEWHm0dupqAj4gKuLUQfrG9865/x/HA1afpGVN2UdhxVSkPS7ZtplhM2u5TqKzl6LSJkWPb7VUNp98WtdOx6ifolI8VUvalkgqQQX9URo6ze5mQe64JV/eIx13RHVWVRRp2zIX+Rz3MSpXVTpMBgZjTuliohwp2UBCyRdL/5LF7w7jgykfMb6mStQXd9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmPn4qWmP7KfJ+WpATYZhbiwWGz86s/5qlts7hBoVyU=;
 b=sLtZq4Sz9rI5lZ0NzzePHMo9+oXWjk2569k8tEDB4w8FLN+EkPTHuPhGjSFoQ2JtC/IF9vlm6ZTZXZpS6YcI4OlTWFIQUcUG2190JPN1Ee2P+UBH6OhfYK5deG1NBcJb/+w+r8DisgTTD+QigohH6u5ydZtCCXNvg4aE+940Vgc4ipapn3jRtso/PCRHLBK7B+DQwBTvQkfcC38meVpFX0S7t+kUQ4gZqRVggcB17IrMkUAE9ERcXNnEamNlatPCyXEDmutV8VthOC7+W7ryw7ZhtkJZgW3F03sRqta27P40QHP//Z/wfcRvYLTSd2U4+7L7YkxUmMhgni8dZGpDmg==
Received: from DM6PR07CA0049.namprd07.prod.outlook.com (2603:10b6:5:74::26) by
 IA1PR12MB8189.namprd12.prod.outlook.com (2603:10b6:208:3f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Thu, 28 Sep
 2023 16:35:03 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::38) by DM6PR07CA0049.outlook.office365.com
 (2603:10b6:5:74::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25 via Frontend
 Transport; Thu, 28 Sep 2023 16:35:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Thu, 28 Sep 2023 16:35:02 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 28 Sep
 2023 09:34:48 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 28 Sep 2023 09:34:47 -0700
Received: from c-237-113-220-225.mtl.labs.mlnx (10.127.8.12) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.986.41
 via Frontend Transport; Thu, 28 Sep 2023 09:34:44 -0700
To: <eperezma@redhat.com>, <gal@nvidia.com>, Jason Wang <jasowang@redhat.com>, 
 Leon Romanovsky <leon@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: [PATCH vhost v2 00/16] vdpa: Add support for vq descriptor mappings
Date: Thu, 28 Sep 2023 19:33:49 +0300
Message-ID: <20230928163429.978090-1-dtatulea@nvidia.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|IA1PR12MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f965c6-be92-4eaa-841f-08dbc040dd5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EyezHFDWDVeR5bvo0zlqOwRY6nmmPDFSUQQlmwe2nn7WNX1lDG3qwefXxlTpD0UcvtgO2MsD2sypiPHvXvgVSooQdUnDlh/iVnCZsD9c3Kagh4+GlBs8EHP9kSC7rFRlpQoOuSgLaOTFKrA844DIEkhPHRYk6Abw4I6CYAA7oTUA+V+Vk8eNReSWpZlsghz9XOtsDU2Ju/rP0FWVVz5fvexdezyHVSo4+N64xoeiQNop3RA5ulRrXa10iULc7bhYgL5XWVIgGm7VxQVDyc2X80Ku6e9r5vquCmzLgWV05k2pWRmrX3tBWPaEbGchA/283sOpYlw3hTqfOsN6Iqz8GptIrPJ3uEXl51ewgcKkI77DoJ4m6wmrpBFfBODTeVcX6Xhotfk1dyl+sA4q+XeMy/J9fgUaDcf0624A5M30SekMZXO6/x/FrBw9ACSYM05mYu7kZJ+tEQ9St3BMLaiVNYkQ2hSnBk4QRWFlQjEVoQJkEV8S5f+zmGVLOSrXrIDSF52iHc1J0gtV0lIJtMJxLln7m5Byo58NYf1hq5osAOkkacZYPCg9JNt3iurRQUBpySLaDIYgFVd5WrDTtf8YSilWCJOapnGtXoPWs7QSroLus4GJomalEf/56Gt8nXVV6zKqIj8lo5zBmk4xXehy6LWgOHWlzAPgnzprKOlSN9bl2uBjIrJyrHqCaPm87K+GTLdX14IB/ZrJsrZa11jUZQR3tR7cUlUP+6Afy88sdFrs/OY3Itnp26YrKIPT6KZ+s9X5CAs8/UWuDuwoHjUkXp3QcmwksdNqSHh6szrhWGA=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(64100799003)(82310400011)(1800799009)(451199024)(186009)(46966006)(36840700001)(40470700004)(2906002)(40460700003)(1076003)(426003)(2616005)(110136005)(54906003)(70206006)(70586007)(86362001)(478600001)(966005)(83380400001)(47076005)(36860700001)(26005)(336012)(82740400003)(356005)(7636003)(5660300002)(36756003)(7416002)(41300700001)(316002)(40480700001)(4326008)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 16:35:02.6049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f965c6-be92-4eaa-841f-08dbc040dd5e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8189
Cc: kvm@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

This patch series adds support for vq descriptor table mappings which
are used to improve vdpa live migration downtime. The improvement comes
from using smaller mappings which take less time to create and destroy
in hw.

The first part adds the vdpa core changes from Si-Wei [0].

The second part adds support in mlx5_vdpa:
- Refactor the mr code to be able to cleanly add descriptor mappings.
- Add hardware descriptor mr support.
- Properly update iotlb for cvq during ASID switch.

Changes in v2:

- The "vdpa/mlx5: Enable hw support for vq descriptor mapping" change
  was split off into two patches to avoid merge conflicts into the tree
  of Linus.

  The first patch contains only changes for mlx5_ifc.h. This must be
  applied into the mlx5-next tree [1] first. Once this patch is applied
  on mlx5-next, the change has to be pulled fom mlx5-next into the vhost
  tree and only then the remaining patches can be applied.

[0] https://lore.kernel.org/virtualization/1694248959-13369-1-git-send-email-si-wei.liu@oracle.com
[1] https://git.kernel.org/pub/scm/linux/kernel/git/mellanox/linux.git/log/?h=mlx5-next

Dragos Tatulea (13):
  vdpa/mlx5: Expose descriptor group mkey hw capability
  vdpa/mlx5: Create helper function for dma mappings
  vdpa/mlx5: Decouple cvq iotlb handling from hw mapping code
  vdpa/mlx5: Take cvq iotlb lock during refresh
  vdpa/mlx5: Collapse "dvq" mr add/delete functions
  vdpa/mlx5: Rename mr destroy functions
  vdpa/mlx5: Allow creation/deletion of any given mr struct
  vdpa/mlx5: Move mr mutex out of mr struct
  vdpa/mlx5: Improve mr update flow
  vdpa/mlx5: Introduce mr for vq descriptor
  vdpa/mlx5: Enable hw support for vq descriptor mapping
  vdpa/mlx5: Make iotlb helper functions more generic
  vdpa/mlx5: Update cvq iotlb mapping on ASID change

Si-Wei Liu (3):
  vdpa: introduce dedicated descriptor group for virtqueue
  vhost-vdpa: introduce descriptor group backend feature
  vhost-vdpa: uAPI to get dedicated descriptor group id

 drivers/vdpa/mlx5/core/mlx5_vdpa.h |  31 +++--
 drivers/vdpa/mlx5/core/mr.c        | 191 ++++++++++++++++-------------
 drivers/vdpa/mlx5/core/resources.c |   6 +-
 drivers/vdpa/mlx5/net/mlx5_vnet.c  | 100 ++++++++++-----
 drivers/vhost/vdpa.c               |  27 ++++
 include/linux/mlx5/mlx5_ifc.h      |   8 +-
 include/linux/mlx5/mlx5_ifc_vdpa.h |   7 +-
 include/linux/vdpa.h               |  11 ++
 include/uapi/linux/vhost.h         |   8 ++
 include/uapi/linux/vhost_types.h   |   5 +
 10 files changed, 264 insertions(+), 130 deletions(-)

-- 
2.41.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
