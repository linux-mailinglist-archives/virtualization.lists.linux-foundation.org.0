Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E48179D18C
	for <lists.virtualization@lfdr.de>; Tue, 12 Sep 2023 15:02:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63BE941BAF;
	Tue, 12 Sep 2023 13:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63BE941BAF
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EqAUr+s2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YeaoaWuOjgjD; Tue, 12 Sep 2023 13:02:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6A48A41B50;
	Tue, 12 Sep 2023 13:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A48A41B50
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA1A5C0071;
	Tue, 12 Sep 2023 13:02:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0032C0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Sep 2023 13:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 887A361192
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Sep 2023 13:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 887A361192
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=EqAUr+s2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WmT--ILy--Hm
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Sep 2023 13:02:10 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::604])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48C986114E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Sep 2023 13:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48C986114E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJcoPLAwk7WD7TVO06HuLd3Z9g2iqEYjr5z3Dpex/fjX4R9sDMM2twAPTBdytBmxpLmguMwlc3d0z2sFdK9OF0yTyrPOJbclhALXhuQZq+uD/wJNxLyvmPpSoGGVXL/QtVHFi0/wFk/9+2i8trwOTUuG+GZwTonRZIe5uwSqWLTKCxVBFVrYVCtpc+FAGMD7Eq2Ey2gFCw9vmeCX10B7V9WkTco/OYFMLh4UmsRzSs3ysB3Ml9u8p00cZ8jyeoPyK/uyK2Vka6n0xkd+dye14+IGClEcp3qhwWmZvw6l3jeKy/cFdBvuE++kyMflHIZa7wWb7ni2bv2J3++5fNyogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+dXJCvzCTXQjgflifo+HFC+x50V9Pe4EnLdKJohe18=;
 b=HgaC9Eplo0Ubv7PKdZtGKmXI0x3uarHR01Mr87Ju6E2wjWJy8uZ9Avjv3sbDrlmspEYsBdfYquGhAuuvXG0iuClDLif/6qSu/L7RsEiEQ2/0awmafyEhweydnqgxvJcDnT3cvXEp5Lq7zk3AMWaxQ2+8KyAaSoDs9udzbPA1z6F5ny22n3llp23nsG5Wp1AGn1fmo0VsQ1LezgJyh9VRHzyCCzj1RbtmZy5rPRo6McPnnMhduEQHQgi82Gw1NTMWgOyd4DLzA1DDYDexuFVnKjWk3d1UMDtKOwP+1oYOU+mFo75931fR2EPDZBXSZDVenvpvd+Ssf228F02azGS+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+dXJCvzCTXQjgflifo+HFC+x50V9Pe4EnLdKJohe18=;
 b=EqAUr+s21Zxy3hKulUJw9iSOEDjj+VIPkZEZMPgo2lLj06RNtzg4UDqg18eMSnTwYMvvMLvAaAcOdYbuH7x3v2gxfkT3JlSBVVggH4VAJq/RPUhYEBqh+zXMesTC0+MT0/WWcwGX6IatNF11sSnSZygkuUZ4yxVxdviR/N0eurisfimI4RB2n3j+hWcCLTxwgT8VXMI4dNHFC/8m/3R+70nLvt5T+HS91GnZwdPMr13ConNnkumSPYetkLGk5qukBtQoDEl4Uwr7Uh4UH3B7S/RKuI+T+/O56UPVp9Qk/zCXCQEphws6WV/wGvLtoJHt7EK2VOOCB9oVfzHZbsDPHg==
Received: from SN6PR01CA0020.prod.exchangelabs.com (2603:10b6:805:b6::33) by
 LV2PR12MB5895.namprd12.prod.outlook.com (2603:10b6:408:173::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Tue, 12 Sep
 2023 13:02:07 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:805:b6:cafe::50) by SN6PR01CA0020.outlook.office365.com
 (2603:10b6:805:b6::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Tue, 12 Sep 2023 13:02:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.16 via Frontend Transport; Tue, 12 Sep 2023 13:02:07 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 12 Sep 2023
 06:01:37 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 12 Sep
 2023 06:01:37 -0700
Received: from c-237-113-220-225.mtl.labs.mlnx (10.127.8.12) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.986.37 via
 Frontend Transport; Tue, 12 Sep 2023 06:01:34 -0700
To: Jason Wang <jasowang@redhat.com>, =?UTF-8?q?Eugenio=20P=C3=A9rez?=
 <eperezma@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 00/16] vdpa: Add support for vq descriptor mappings
Date: Tue, 12 Sep 2023 16:01:10 +0300
Message-ID: <20230912130132.561193-1-dtatulea@nvidia.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|LV2PR12MB5895:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c757d42-c69d-4e64-84a4-08dbb39077f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ADPi3HzDTaIf0F7G0HkkycYJKjFs2XBu6W5XE9ui6vYC+xYlfhFrBFAHen/rCb2N2OPwX9QsbEd0+54Cppo/7h22Ha8F8BUO1bYOhBXsQQZl97+5qwg5+a237NX0UuFojJtko/5YCWGb/XrSUxK+hOViCidKUypkX74haiJ3R7h5kcaP3EMV9vEMqbCHW2V/thgiv/pzJGyYdPlkogx8JqoifuKdKvzctbcy9bjrBUW5w/wyc7b0I/06eSTWO6mkcAQ0xhvDWzpFPMsTlok/S5c9INWt1+b9sdhJnoFh4Wm1fKmkQ/49kytiihyRkSb6yk1yXunp+m45ugegF2FYwP6qdu3qAFcQHn0HDmlhBcj3msh3M5bR2jB9Y2uBU9Fw3pRBQw7S+jgFnQQrqKRKfOLq3HsUfKcw5st7+z4yUnlDfRQlBmQrDHnDrUpBnEBkWK0Yfmy1C+RDbqYb5aGz/N5SLaSZawYrwDnUpmGFkmLvjjBTRNMlHSBT2f4JY+32zlb4UiU/YlR/FNNjL4LNxdxtY21IcHHgmBDQbV7C9Bco6439y16/u+sfqmEdkZqk5kcjSNWSfHG1Gr6BrDYQnW6OGF/PlyD3wP2N5XoaSnjj1Hj/E3EKIHu08w4f8moahset6bPtJZ0z75w0O/9ZuoA85HrMaoQAY3XJsDUQsYPXYr1PUlkBuBBaJ8eg4eoXXtfB0zqNI9h9jGPlBSGk+/hs/eb1ND69hx9KVk6+pP2qgXds6BpRAQPd74+YwRVAFrqcEzOXx8++twJkHRKO4j4imYRh5GP7CU2qRFRKOVk=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(82310400011)(451199024)(186009)(1800799009)(46966006)(36840700001)(40470700004)(36860700001)(83380400001)(426003)(336012)(2616005)(26005)(54906003)(70586007)(41300700001)(6666004)(7636003)(356005)(82740400003)(70206006)(1076003)(8676002)(110136005)(966005)(478600001)(8936002)(316002)(4326008)(5660300002)(47076005)(2906002)(86362001)(36756003)(40460700003)(40480700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 13:02:07.0852 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c757d42-c69d-4e64-84a4-08dbb39077f2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5895
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, kvm@vger.kernel.org
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

[0] https://lore.kernel.org/virtualization/1694248959-13369-1-git-send-email-si-wei.liu@oracle.com

Dragos Tatulea (13):
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
  Cover letter: vdpa/mlx5: Add support for vq descriptor mappings

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
