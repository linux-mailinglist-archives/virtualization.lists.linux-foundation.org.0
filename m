Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A387A945B
	for <lists.virtualization@lfdr.de>; Thu, 21 Sep 2023 14:42:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F6354002B;
	Thu, 21 Sep 2023 12:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F6354002B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=k4CMP9cl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxdINNkCLctF; Thu, 21 Sep 2023 12:42:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AD27A40BFE;
	Thu, 21 Sep 2023 12:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD27A40BFE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F264C0DD7;
	Thu, 21 Sep 2023 12:42:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C69EC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Sep 2023 12:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2493B82134
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Sep 2023 12:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2493B82134
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=k4CMP9cl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ICEddj5gcnup
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Sep 2023 12:42:08 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::604])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4462482140
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Sep 2023 12:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4462482140
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0P3gujRrdEg/YgG0J8AAr20h6WlO0eX8hRTgAf/1FI9lg/d4gyowktJNYl0q8W308hfb45LexsE/wUHcNYkPR3OPa0D3kG4btbepg5h0wbkGaz22vCb/y0qLmXO0XHjrjFwcr9EF+4fjfGYRZiVoS9xgcsKL3k8qfKg6YdGXcnQ5CeG+QYBt3SbzBaHLaanoegkMNHpEHoId+PvLDR6nZ4KXiYhQlbleCE5e3mgmLzLr2wdwMGj56XSoecy2OstPIoHuMMdvpwzaW+MP0PeE710ePca4kJ2yLsct93Xby0sQ5P0tTDoLyp5T1lv7jCofJ+J+RTewlNXpOttRxx+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoCuwgDC8nSkydt1xw3EhuUYLdSoxtsTl5j142Bf8Z8=;
 b=i6ynx/KFXPdl7CWnHOr0Y+0PdaZfp8Yk2D6L+DL7VwbocTGRjIEsmcbxMreErIOFKopyXPNbWThT397on4t7hrBwIyt7m4XNd97oVWdrAut4YK6SmybG6B4U+4ZqUzOksIN3AUfWxQfgbB0XuVPZfwMtLni2w7cYoEKnyfx/t8xS6f1OUJcMnDs/0g0m4LMT+hLzYWGj/9lAn+aZkTrl+pTFkaCr6lnXKuZ8DbiYy7amXA1E4aPjwKKe9nwwPjil5/HJ0TE9s2eawJyoDeHxvuQ3aVOL2gqhWb+IIpMBVDfvNp/QuCwx5cr93QsknuspvJolZRDCAwlJtXz7Fms+FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoCuwgDC8nSkydt1xw3EhuUYLdSoxtsTl5j142Bf8Z8=;
 b=k4CMP9clZ3uKO0MJQ+tZ/i4cQYUsOT8MFxy9R/hi7Xt/QKi3mCS+pL+85tJq4kgWMR/+NQ//JclTzhU3P87+C/QRv76iM86Q2xNwCU2pKgaJcISU7AkRAMuvwimbfoHNc2A8pCR+EHzv26RGNA1gpLCLkArNvSVwhnvBwQpLLP/Y8ZY4HmipCoGCHASnPSxHNQOww5SqTJae9VS2ywdlMzQ9v4ktESKH5zvsUFc3Ur9R6dJYTPFVq7ERBwWAOidEUHBeQL2ZtkSW3nH2FGKAqqTh8f8shYgQMHUOW/T41h4BU9JUXm7GDGRtY+eds/shsNein53QkbH4s+JzXuEP2g==
Received: from DS7PR05CA0034.namprd05.prod.outlook.com (2603:10b6:8:2f::35) by
 MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Thu, 21 Sep
 2023 12:42:06 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:2f:cafe::5a) by DS7PR05CA0034.outlook.office365.com
 (2603:10b6:8:2f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.9 via Frontend
 Transport; Thu, 21 Sep 2023 12:42:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20 via Frontend Transport; Thu, 21 Sep 2023 12:42:06 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 21 Sep
 2023 05:41:55 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 21 Sep
 2023 05:41:54 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport; Thu, 21 Sep
 2023 05:41:51 -0700
To: <alex.williamson@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <jgg@nvidia.com>
Subject: [PATCH vfio 08/11] vfio/pci: Expose vfio_pci_core_setup_barmap()
Date: Thu, 21 Sep 2023 15:40:37 +0300
Message-ID: <20230921124040.145386-9-yishaih@nvidia.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230921124040.145386-1-yishaih@nvidia.com>
References: <20230921124040.145386-1-yishaih@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|MW6PR12MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa6021e-cda3-43f0-515f-08dbbaa029d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PfBSQPeNA8ov5FmvqUU4SxIphmZKKim+Lq1r6rg6ZoyBYrSc8ievKDkWu/0dVtOOLoG0vE8RmsIb+GdKv60KGfHLRFdxvXFJehlSKvmEM3LrJVyJADwUAW0BY1WOhrjlNl3N1mBWeIWf25eaQ+ib6id12sGN00aijhjPUPgocrr0oQuKADG4RJZCpDmNDaIt9OYIqSJiCM+1gMoHyj6LvGcJKu34LBKI5yjsf1PHnvX3x0BzDXXXA/ETpvTQ+UZUQxoSZVVdIqIkb9pOukvaDn4LBD2LgxqmrQCSqN0YWF3zdDchi9y2ai1NLsSmxdNJhLJCqN5/X4jm6rzVhigqZdBb00DXVH8MSWhY3dG9Qg4GRbnbny8ZguQ6qPVj+J8gxkQGyVhB9c+1zcAviV6iqSYCEZk3x1zhCsHik69bT+GfriWSvoWZoToVB6dpHLkmkBgthW9hryZYg6Pe9JgSkIgOjuRTIUZbpBfczHUEcl/vohHgd2cKY8h7L+13906Yeub0OiH/JsBpSsU5SUb0RWARdUxV9h1yTGuGCtTZqEtZxoDb8JceydbBydWPglWNtZZMNQHhC2E6nqkgPTXiw2OpCBAd9dXPVmxWYiTE8HXMk8QxK7+65eS5YkAZOQ9tSQmxqp5ZX1qxSGqD48XFllozFo4N8MIFDatT/TEBGoG3vX/UEVfbcJDiOWUvOiK/l/KRAwJ5iYr3l3/TZWuhweVNJhxpHcxmVrF2A1Em62DfpLUg+uS9vpg3GQyuPMD2DoKAcwVn+IUczUfYzQFKMw==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(136003)(39860400002)(376002)(82310400011)(451199024)(1800799009)(186009)(40470700004)(36840700001)(46966006)(2906002)(5660300002)(4326008)(8676002)(41300700001)(8936002)(6636002)(316002)(54906003)(70206006)(26005)(70586007)(110136005)(336012)(426003)(1076003)(478600001)(7636003)(40460700003)(7696005)(6666004)(2616005)(107886003)(83380400001)(36756003)(356005)(82740400003)(47076005)(36860700001)(40480700001)(86362001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 12:42:06.0899 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa6021e-cda3-43f0-515f-08dbbaa029d3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072
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

Expose vfio_pci_core_setup_barmap() to be used by drivers.

This will let drivers to mmap a BAR and re-use it from both vfio and the
driver when it's applicable.

This API will be used in the next patches by the vfio/virtio coming
driver.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 25 +++++++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_rdwr.c | 28 ++--------------------------
 include/linux/vfio_pci_core.h    |  1 +
 3 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 1929103ee59a..b56111ed8a8c 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -684,6 +684,31 @@ void vfio_pci_core_disable(struct vfio_pci_core_device *vdev)
 }
 EXPORT_SYMBOL_GPL(vfio_pci_core_disable);
 
+int vfio_pci_core_setup_barmap(struct vfio_pci_core_device *vdev, int bar)
+{
+	struct pci_dev *pdev = vdev->pdev;
+	void __iomem *io;
+	int ret;
+
+	if (vdev->barmap[bar])
+		return 0;
+
+	ret = pci_request_selected_regions(pdev, 1 << bar, "vfio");
+	if (ret)
+		return ret;
+
+	io = pci_iomap(pdev, bar, 0);
+	if (!io) {
+		pci_release_selected_regions(pdev, 1 << bar);
+		return -ENOMEM;
+	}
+
+	vdev->barmap[bar] = io;
+
+	return 0;
+}
+EXPORT_SYMBOL(vfio_pci_core_setup_barmap);
+
 void vfio_pci_core_close_device(struct vfio_device *core_vdev)
 {
 	struct vfio_pci_core_device *vdev =
diff --git a/drivers/vfio/pci/vfio_pci_rdwr.c b/drivers/vfio/pci/vfio_pci_rdwr.c
index e27de61ac9fe..6f08b3ecbb89 100644
--- a/drivers/vfio/pci/vfio_pci_rdwr.c
+++ b/drivers/vfio/pci/vfio_pci_rdwr.c
@@ -200,30 +200,6 @@ static ssize_t do_io_rw(struct vfio_pci_core_device *vdev, bool test_mem,
 	return done;
 }
 
-static int vfio_pci_setup_barmap(struct vfio_pci_core_device *vdev, int bar)
-{
-	struct pci_dev *pdev = vdev->pdev;
-	int ret;
-	void __iomem *io;
-
-	if (vdev->barmap[bar])
-		return 0;
-
-	ret = pci_request_selected_regions(pdev, 1 << bar, "vfio");
-	if (ret)
-		return ret;
-
-	io = pci_iomap(pdev, bar, 0);
-	if (!io) {
-		pci_release_selected_regions(pdev, 1 << bar);
-		return -ENOMEM;
-	}
-
-	vdev->barmap[bar] = io;
-
-	return 0;
-}
-
 ssize_t vfio_pci_bar_rw(struct vfio_pci_core_device *vdev, char __user *buf,
 			size_t count, loff_t *ppos, bool iswrite)
 {
@@ -262,7 +238,7 @@ ssize_t vfio_pci_bar_rw(struct vfio_pci_core_device *vdev, char __user *buf,
 		}
 		x_end = end;
 	} else {
-		int ret = vfio_pci_setup_barmap(vdev, bar);
+		int ret = vfio_pci_core_setup_barmap(vdev, bar);
 		if (ret) {
 			done = ret;
 			goto out;
@@ -438,7 +414,7 @@ int vfio_pci_ioeventfd(struct vfio_pci_core_device *vdev, loff_t offset,
 		return -EINVAL;
 #endif
 
-	ret = vfio_pci_setup_barmap(vdev, bar);
+	ret = vfio_pci_core_setup_barmap(vdev, bar);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
index 562e8754869d..67ac58e20e1d 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -127,6 +127,7 @@ int vfio_pci_core_match(struct vfio_device *core_vdev, char *buf);
 int vfio_pci_core_enable(struct vfio_pci_core_device *vdev);
 void vfio_pci_core_disable(struct vfio_pci_core_device *vdev);
 void vfio_pci_core_finish_enable(struct vfio_pci_core_device *vdev);
+int vfio_pci_core_setup_barmap(struct vfio_pci_core_device *vdev, int bar);
 pci_ers_result_t vfio_pci_core_aer_err_detected(struct pci_dev *pdev,
 						pci_channel_state_t state);
 
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
