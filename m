Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7480F7A9459
	for <lists.virtualization@lfdr.de>; Thu, 21 Sep 2023 14:42:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEA2460A77;
	Thu, 21 Sep 2023 12:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEA2460A77
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KKpMjvPS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2XzjVoEcoLK; Thu, 21 Sep 2023 12:42:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C6FBE6101A;
	Thu, 21 Sep 2023 12:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6FBE6101A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24BCDC0DD3;
	Thu, 21 Sep 2023 12:42:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6221CC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Sep 2023 12:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D9984209F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Sep 2023 12:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D9984209F
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=KKpMjvPS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIOhnqoBREsn
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Sep 2023 12:42:03 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::608])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26646420A6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Sep 2023 12:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26646420A6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3Qc2NWQ4tWV+7KGEDCUnaoknarsd+kYJJChrsAiHYZ4Mpg7YHc3xIM5fbsDOSgZ7+51ppoH5Cj1mGG5sqQTGSYHomq/+8G1rNrmQCNGSonqiq73VJICxP0YlQ7K/GGJa3BCrXyG+MefD9/LadT5/o5g/powyjOm8uAwRdSJghQHvpqA/KdK4+VHXCsPvvmMsQQsVn7bUIBn7ZeD9g1aXOxX61MS9TKZbqte8vN9ja7vx9CgKrTB5OL9kfaeoiann7iDtET9AiTrDRQHytUYyAH1tYl3YE6u3uZOhZIWXP4gU/21VyAypCs1y9tG+nQSE8SlmhFFjOTPkUw0OZbI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgDMGFjt7FhY5awHmR/4HjyxidJdDGmuEBy/dRx1OYw=;
 b=Q2C26n/iedINiZ9hR7g+zpMa+1mvF5negyDXsHySGV15Ci7mDyjPE8VCtuBpLfd6/q9ekv7iWc9yrOnLoY066G8Y+lGPDvlx9WS9GBGCMZA1BfWfU2oQabL6Dib/ItVPlXVlUp1tM+ckehCyu2xtE1pr+c3SarV3hO0zuQQHBg8Aw0mpZYucK0b1kNXAVaI9k9C0ZaQqyMzM+pgGcT335CCtPFe71eZIYcM7/iGGcjG59ttnFdIBufZbvswPmhH4vDRnnGITln5fAUziJSrQ13byg9JAL6w4qwuEFgLcRDUI1XI0tN02WUdoLnanOOQ7qXka3zelHHqrvNuoPeYRnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgDMGFjt7FhY5awHmR/4HjyxidJdDGmuEBy/dRx1OYw=;
 b=KKpMjvPSkhyi7ODFJ1WeKb8x3lJAQeJBI8GJOkL2g+/pUcxoUNGp5vwmbpZcfMR7rOAhr8A/vcRk3HgiGBFIcMZ9jPTR4y70m1GgVe7eT5D9JGtROd9khK3iq3pWZf3YwlCr8WMuiCw1oCP1cwEmE1NPVMW95Dznf4DQZaPY7SWa9fWl7zPUVVuO3Pn9gJmTgqbnbVKbiZPTM71CPM8Ls26B3qgeLAAiYVP2gMwYSkwpzkn4SN9RhOX+WNDgg6en8uKWEnursoSipl6oHgmhFSQBxoyDvInebdcribINDBuI30Ns9tdgdoqQJFe2MItda727CHPt8sKkQoFgYOnTJg==
Received: from DS7PR06CA0008.namprd06.prod.outlook.com (2603:10b6:8:2a::15) by
 BL1PR12MB5756.namprd12.prod.outlook.com (2603:10b6:208:393::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.28; Thu, 21 Sep 2023 12:42:00 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::a0) by DS7PR06CA0008.outlook.office365.com
 (2603:10b6:8:2a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.31 via Frontend
 Transport; Thu, 21 Sep 2023 12:42:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20 via Frontend Transport; Thu, 21 Sep 2023 12:42:00 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 21 Sep
 2023 05:41:47 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 21 Sep
 2023 05:41:46 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport; Thu, 21 Sep
 2023 05:41:43 -0700
To: <alex.williamson@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <jgg@nvidia.com>
Subject: [PATCH vfio 06/11] virtio-pci: Introduce API to get PF virtio device
 from VF PCI device
Date: Thu, 21 Sep 2023 15:40:35 +0300
Message-ID: <20230921124040.145386-7-yishaih@nvidia.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230921124040.145386-1-yishaih@nvidia.com>
References: <20230921124040.145386-1-yishaih@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|BL1PR12MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd09c3d-c23d-4a87-13e1-08dbbaa02664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RoTGVpt1x/4ODigQwlrMsf7wE/JvBuAb3pYxs08kskZ+DcrIIO1jRXz+3k0WHYe+jr2fyE44DqgC9m+rdBozPB5Qzg9Cg++BVXc+sl/fZeRAKik7/CUYR0ZduORRm0EktpDrBtAQwCRrH/B5mL1MmybJDjYkkM3Y3Gmxq6R1JtQBA6SpzMZwbjlqGMiLWpXzehDiqo99jIMc68degbHJyQwXdtaNiz0b3xYAIy+jf4v+siH5ig3viqSRIqIefY5qijFW9Dd+iuFaZda+nyccmPz87oieobWce3g+lLjim+V6k7f1hI/rxUDZOpsUo320kKpSJnhlo8nipbyhXhPV4eZpKheZU556ddIVpvD4k2Hh3wfganiIu9gPxNPDGYT8ye1OseML4+sI39Tq605Q0HsH3vtzXPY3tj0Ze/x3f89o9GWWxmeRAA9B/hppt0csqWbifQETfb9LTl/BYc0MzrrhQEQco1Yv50OpwZzpgzj/JSSsvkDC88BH5EGYzM3ouSFzaSshGQBxAhBJAEdtejoqTIPIX8fGuY17RtR0fBncgGfG7gzhUEDt0WA/YWB7OcKrZq5aYz5a3GSt/mMtr7S/W9D8dPr5//5IzJUVbIWYgsVRl9n9ftmdI3JIMUdeVbJ041wDOi+hY3HthPxxt3XhFcYESsXjRA0L+uf50W6QGvF+ZFF1YTggIgAS3ggZw45BdwpACvYl+ZlBlrlIe+/dKZ/BumUmZV78XIbD2+JbzSAP2euF8cLhWeFklWtR3+MqVY5SCTsZuAzuXIKDfg==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199024)(186009)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(6666004)(7696005)(426003)(40480700001)(356005)(40460700003)(36756003)(82740400003)(7636003)(26005)(36860700001)(86362001)(107886003)(2906002)(478600001)(83380400001)(47076005)(70586007)(6636002)(70206006)(8936002)(2616005)(41300700001)(5660300002)(4326008)(8676002)(1076003)(316002)(336012)(110136005)(54906003)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 12:42:00.3277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd09c3d-c23d-4a87-13e1-08dbbaa02664
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5756
Cc: kvm@vger.kernel.org, maorg@nvidia.com,
 virtualization@lists.linux-foundation.org, jiri@nvidia.com, leonro@nvidia.com
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
From: Yishai Hadas via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Yishai Hadas <yishaih@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Feng Liu <feliu@nvidia.com>

Introduce API to get PF virtio device from the given VF PCI device so
that other modules such as vfio in subsequent patch can use it.

Signed-off-by: Feng Liu <feliu@nvidia.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
---
 drivers/virtio/virtio_pci_common.c | 12 ++++++++++++
 include/linux/virtio.h             |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index 7a3e6edc4dd6..c64484cd5b13 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -648,6 +648,18 @@ static struct pci_driver virtio_pci_driver = {
 	.sriov_configure = virtio_pci_sriov_configure,
 };
 
+struct virtio_device *virtio_pci_vf_get_pf_dev(struct pci_dev *pdev)
+{
+	struct virtio_pci_device *pf_vp_dev;
+
+	pf_vp_dev = pci_iov_get_pf_drvdata(pdev, &virtio_pci_driver);
+	if (IS_ERR(pf_vp_dev))
+		return NULL;
+
+	return &pf_vp_dev->vdev;
+}
+EXPORT_SYMBOL_GPL(virtio_pci_vf_get_pf_dev);
+
 module_pci_driver(virtio_pci_driver);
 
 MODULE_AUTHOR("Anthony Liguori <aliguori@us.ibm.com>");
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index 094a2ef1c8b8..4ae088ea9299 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -217,6 +217,7 @@ static inline struct virtio_driver *drv_to_virtio(struct device_driver *drv)
 
 int virtio_admin_cmd_exec(struct virtio_device *vdev,
 			  struct virtio_admin_cmd *cmd);
+struct virtio_device *virtio_pci_vf_get_pf_dev(struct pci_dev *pdev);
 
 int register_virtio_driver(struct virtio_driver *drv);
 void unregister_virtio_driver(struct virtio_driver *drv);
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
