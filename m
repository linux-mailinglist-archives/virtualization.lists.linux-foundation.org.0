Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC7D763F47
	for <lists.virtualization@lfdr.de>; Wed, 26 Jul 2023 21:11:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACE6E8366E;
	Wed, 26 Jul 2023 19:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACE6E8366E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TWP2Q+VR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5WcJsztk23qg; Wed, 26 Jul 2023 19:11:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5D7CB83657;
	Wed, 26 Jul 2023 19:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D7CB83657
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6395C0DD4;
	Wed, 26 Jul 2023 19:11:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD6CBC0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jul 2023 19:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 705C041E4D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jul 2023 19:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 705C041E4D
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=TWP2Q+VR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eii5jnkxxxFh
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jul 2023 19:11:08 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 817C141915
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jul 2023 19:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 817C141915
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bP5sJNAtBaTNkwIdKThs15/jGeRwM6wdQ3Px/QxJsqsEoWNvxCTKH5GPcd2GZyszGoCQrPJ63vbNDZE/01/cMN9fLRL/OkKlC5CWy4KgNcfgIbJSBf60ckdUxOINZklz81Ym3fv7PPOwkXRQqcyGHIO/xbWrPwqqlFOjYWtkqG6mPOD3KGs+7UADw8HXVJ3m3blmzaLtxl45g0tbylU0QwaI9ZWDddoQ6T5Z5y0xSAYvsa/LCNYV6r8UPxqU9VXil01YEWInkvCdhFmV/1KCzu8JZFD/dO1tNfhGtzwRD+kCh0G+COWYHS7GT2dFYMIy8estb/xWrBByGWHwBZHSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50uyCv6q9T5xOO82OAidZLM3ZMIb/RAddhyEUMSBmYQ=;
 b=k77huHIFPjT56yF4fyB2TcuGGGv4qzwY8vs48cUgZDRrReDwezKm8nS0ONQad1LBjSdQVDSYLKMktZdDP9VeN9n/HRjZkO0UMZbGxMzKLbYBilcPGpTN51ls0QMRQD+seVONGWCxSWDit+o/tTgxkZ8BSfY4LTa9jNR9F39yPUc7CsdWQAn8XgknJfuWwcQKl5PQtPJGemSRegY17NCdVs1qAygUBt97ctKBYefbcXLk9B+nzyLL7ogGi/9vFjFh853d1CnRr8NHyMRMnP+5YfirvsH7INtUtWP0kifPul3geTqfEQFs+2ys8V9ChC26yC1PmL8tdguex5XXEWUZOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50uyCv6q9T5xOO82OAidZLM3ZMIb/RAddhyEUMSBmYQ=;
 b=TWP2Q+VRyceh8lwKIGill+aJk9bglUi2zNAk97X4ZAu3sIYeTthtyRRykzhxVnwXQESt+iRg32cL1XNCXTpzb7PAvvr/Cvodh0UD0fsGCJZWeseKTtdQDvB9Cav3uZidbhDtnjREF8k9yM9m11P6SBMbmEZ5b+kGFEeOQOLlDbUGnM38rmH7TInXxMGMhyioSMu0i6acvHS0asrattvE5UIn+Ul1q4JTwYLb0Y8ooTZGTBUHW77/acffJSbKwqqwIFj9C3xC62eXWuUk5NjPFpUXbKca+nIeW/GcvlIZD9OVYAGmcahQz5SY/D4WxRlrXpgjfbiXFqY4AXu48WPfhQ==
Received: from DM6PR07CA0114.namprd07.prod.outlook.com (2603:10b6:5:330::29)
 by CH3PR12MB8306.namprd12.prod.outlook.com (2603:10b6:610:12c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 19:11:02 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::b5) by DM6PR07CA0114.outlook.office365.com
 (2603:10b6:5:330::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29 via Frontend
 Transport; Wed, 26 Jul 2023 19:11:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29 via Frontend Transport; Wed, 26 Jul 2023 19:11:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 26 Jul 2023
 12:10:48 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Wed, 26 Jul
 2023 12:10:48 -0700
Received: from c-237-113-220-225.mtl.labs.mlnx (10.127.8.12) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.986.37 via
 Frontend Transport; Wed, 26 Jul 2023 12:10:45 -0700
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Xie Yongji <xieyongji@bytedance.com>
Subject: [PATCH] virtio-vdpa: Fix cpumask memory leak in virtio_vdpa_find_vqs()
Date: Wed, 26 Jul 2023 22:10:07 +0300
Message-ID: <20230726191036.14324-1-dtatulea@nvidia.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT023:EE_|CH3PR12MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: f8eb4417-d055-4fee-2870-08db8e0c0deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 74GP4BmmHalZbLu1QKQ+gdUsGwSDweK5Nqf02rmjLLA2zd+gtag3VahrcKcUg/6ZVw2A6QXzi/ADNIlSxP5bk2pl+ASGzbo9IViGUfjDsEqNOSP399UNv+wKIVP0SBX+ziV4HxWHHSWrrgJhbGWTsMpD64aV2D4v2uo1uqKhqyss4aVBLMsEV1hOZKHfmMA+HBD6JuP/5sM6Fs2Bpzbyox7tP2c61hc2V8rXbqhFukp4YZpo3rTByMdw8M/2ioX26JErdvlXquD7nSaV55Shf/q0/jbYUtZiV0oG3GnsDtqekBV+kFaBpFUpUNkn8uP00cnxs53FAfhD6r0oN2OUZAFrxi7UjInVEbXsfwV9lEKoZSBLdkWd/pF5ehU4evPzIWtfi3fOWYsC47G6oByozMg8AEft/G6fQUIoGP5xrI9OuB+p3isAfRWArNyn3MVV36p/Izj9pEu/fdw0EHXdPnzgxZcxgg3ATaFVtwfS9+h8ZabFj32qGWBjxyyYxVVjyw8dKhOI4AdHvuqooRXnNl4j4w3IIr+8eJCmQp0VJyHyCjddGcx3XINTUpD7PCDVkC4goC23XJiOjxVxC+syw/yiMUCYykTqjjYA4xVy8fSvm2S+HWZyEWvqoYgTvcU817XJde1ndnAEILBwMuXVsBo+j16BAlf8Hq2KGCEBsGHvNDGbz/m5Pqbdp7UiaDMTF3wy6UmYHq6cNOpgqPGw9L4245P5/TtXFhassDDTVUgxYi1zZQX4jeTSFk3oDK+m
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(7636003)(336012)(41300700001)(26005)(36860700001)(478600001)(86362001)(36756003)(4326008)(8676002)(8936002)(70206006)(70586007)(186003)(316002)(82740400003)(5660300002)(2906002)(40460700003)(110136005)(2616005)(47076005)(356005)(54906003)(426003)(1076003)(40480700001)(6666004)(4744005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 19:11:02.5917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8eb4417-d055-4fee-2870-08db8e0c0deb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8306
Cc: linux-kernel@vger.kernel.org, Gal Pressman <gal@nvidia.com>,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org
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

From: Gal Pressman <gal@nvidia.com>

Free the cpumask allocated by create_affinity_masks() before returning
from the function.

Fixes: 3dad56823b53 ("virtio-vdpa: Support interrupt affinity spreading mechanism")
Signed-off-by: Gal Pressman <gal@nvidia.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 drivers/virtio/virtio_vdpa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
index 989e2d7184ce..961161da5900 100644
--- a/drivers/virtio/virtio_vdpa.c
+++ b/drivers/virtio/virtio_vdpa.c
@@ -393,11 +393,13 @@ static int virtio_vdpa_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 	cb.callback = virtio_vdpa_config_cb;
 	cb.private = vd_dev;
 	ops->set_config_cb(vdpa, &cb);
+	kfree(masks);
 
 	return 0;
 
 err_setup_vq:
 	virtio_vdpa_del_vqs(vdev);
+	kfree(masks);
 	return err;
 }
 
-- 
2.41.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
