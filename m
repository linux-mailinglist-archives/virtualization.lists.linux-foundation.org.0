Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2CB70A237
	for <lists.virtualization@lfdr.de>; Fri, 19 May 2023 23:57:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25FEF612D6;
	Fri, 19 May 2023 21:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25FEF612D6
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vPniqq/l
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEOFgJC5zwus; Fri, 19 May 2023 21:57:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 97546612D9;
	Fri, 19 May 2023 21:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97546612D9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7464EC008C;
	Fri, 19 May 2023 21:57:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AA1BC002A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 May 2023 21:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2495283FAE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 May 2023 21:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2495283FAE
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vPniqq/l
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XbWPrBGsfHDS
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 May 2023 21:57:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CC2983FDD
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::620])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CC2983FDD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 May 2023 21:57:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zyl0e5CFSarEPNzV225r4gVbX7CKHC59C8e2ou/SEh0fqhsrcSGJel05z8hYOQ0bfchh/rNC5UUZ0igxVr7o/hWPaYlNJg4xesFIkJ17lpEeBiLG738mMJRSjN+sn90Ajfb+JYzpWLqYkG1ehhYYGOZR0sG9skcP5NUYVB21S4Uka36/hzgZrN/HfXiYOVtHyBMYRQGnCNmeBq0C1zOJNwj79vBaGsUtkepzYXdksC6JAJNmCBsa91UntQvldbGOlq0YNly3v7PDSTb1uCGB1iONoL4c3I1Hdi4L/kLDT98yWI8/qb8/eCz62Ey5HmlzoeGH4mRlF0tQInCBQ5o5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXlZb/WNICO5DvKdZpoAQzSWPWBkf6YiB7NN0OoBtp0=;
 b=aD1DGPsANGbK9ttgqcGm0yAergG1etjk0QTu7i6Oo7/BHPSBrRF5Gx9f8U2TWTVEyTk4Yd37AIrGwiWHFSjSuOu643kk271jPJ2SydFcOBToJcf8QfYDDpx/2IdsG8LB/5Y+9O7jAej6NiWGRzJy10VD3uFZLzvvJdrQb38SoBZmZ534odsfIrZaCxXczH4sgPK5NSVy8/MN4p9bNoRUxU+WcNJhhmMmco5ndlrDZdm9BqDF+7rqzfoxSremuZ/FlOtZJqfKaSHYnONt487sEEfEjb22CHpBrvKJZHpDpd7H+sfmn/S39iQNqfGIQkw8fcvY/fZUoVO3W/SVcnjpvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXlZb/WNICO5DvKdZpoAQzSWPWBkf6YiB7NN0OoBtp0=;
 b=vPniqq/lQbSP7yRS9JLbQanPOuj3za2d701UWpvYnDba4d4Z85CDHi9aAorfvqtMB7gF1Rsq5bWyQPBtvRp3kTmy8YZcyKuB8FVRo3+wWrM9wzvsSB35+4A8I8dBMYfAivHQuTv7jzUagzj3eD+SvwNULTQOilL9fovhQkyKtPs=
Received: from BN9PR03CA0978.namprd03.prod.outlook.com (2603:10b6:408:109::23)
 by DS0PR12MB9037.namprd12.prod.outlook.com (2603:10b6:8:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 21:57:02 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::fb) by BN9PR03CA0978.outlook.office365.com
 (2603:10b6:408:109::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 21:57:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.21 via Frontend Transport; Fri, 19 May 2023 21:57:02 +0000
Received: from driver-dev1.pensando.io (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 19 May
 2023 16:56:59 -0500
To: <jasowang@redhat.com>, <mst@redhat.com>,
 <virtualization@lists.linux-foundation.org>, <shannon.nelson@amd.com>,
 <brett.creeley@amd.com>, <netdev@vger.kernel.org>
Subject: [PATCH v7 virtio 11/11] pds_vdpa: pds_vdps.rst and Kconfig
Date: Fri, 19 May 2023 14:56:32 -0700
Message-ID: <20230519215632.12343-12-shannon.nelson@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230519215632.12343-1-shannon.nelson@amd.com>
References: <20230519215632.12343-1-shannon.nelson@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT009:EE_|DS0PR12MB9037:EE_
X-MS-Office365-Filtering-Correlation-Id: dd31044e-5437-458d-d21e-08db58b3fa2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0nw58egMIXflry6E+DEzRIVADcDdKzb6kjfEDpfKCG1AHUGitAyicewJL5r+W57o5XR+H5nrBwPDBCMQReFQOHueQ6s6/Bs91ew7WLZpIKcAjB5PegsoQA9vn8k0pzm7r82vhIaSLueQ2oL0/DnzEM0H1PwLElJIFHgKFZrdfDtoQltwpsEZrmQzuDvvunQu9reSJknxv8qrG2GFMmDCukOr1Xr6DQVV+o6oX1j8hMhX70bwzfzzon5D0qX7fSR4e3nuVp1k3PCpr9ypw8xWQ03mfH6oVA0KNwTq4v/G45jqddOilC+CinyeAQH/grhSBA6greJs3RxV+ICQ18CRLoQb9GUbVRyKEeTMwtxjpjFfun/cB7q5kzBRmGqyoaKqRqEtrGu9ImZXiX98XozIdrD5+mnP8/GgLh0Yj5hu6GXP+ZbyAOu685KRe2BLMDwzZQWn4iA+TN15+miVpRMEc2MhCbbb2mVaH5NnhHfQXcRxHbMp4Zewno55BjCOST/4ZZdEdtpr9XP/JG6JHsX/Es3HGWoktvQL2qa55ajxDPC/uoMCkXfCFSlDY9KrhAl+IfT46RgRNmTVGSNZiqjVYxIa0P6m3JMeJeNyhD1ZrXdi4gkHgAM8GcvSSTKXn/bukFKqI6kZdCKEFuTUQWHhDqCyM00DhbZfy81f7vZhLHQXBldR+52vCN9YAp518t4a78Wxv4yTI+PZ4JOSmhdXCo5uaI/nDmPfBLT98VgfSi4NOfx+70whn/MTSRYUWp5JOh5zoU29CH8H+o/qQMDkV8w9EbDHzgdD0G+1kGm6dFpqHHMvJgK9NelYOWefRcJu
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(2906002)(8936002)(478600001)(4326008)(41300700001)(8676002)(316002)(110136005)(54906003)(44832011)(66899021)(6666004)(70206006)(70586007)(5660300002)(1076003)(26005)(40460700003)(16526019)(186003)(82740400003)(356005)(40480700001)(47076005)(2616005)(36860700001)(83380400001)(43170500006)(36756003)(82310400005)(86362001)(336012)(426003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 21:57:02.2416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd31044e-5437-458d-d21e-08db58b3fa2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9037
Cc: simon.horman@corigine.com, drivers@pensando.io
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
From: Shannon Nelson via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Shannon Nelson <shannon.nelson@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Add the documentation and Kconfig entry for pds_vdpa driver.

Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 .../device_drivers/ethernet/amd/pds_vdpa.rst  | 85 +++++++++++++++++++
 .../device_drivers/ethernet/index.rst         |  1 +
 MAINTAINERS                                   |  4 +
 drivers/vdpa/Kconfig                          | 10 +++
 4 files changed, 100 insertions(+)
 create mode 100644 Documentation/networking/device_drivers/ethernet/amd/pds_vdpa.rst

diff --git a/Documentation/networking/device_drivers/ethernet/amd/pds_vdpa.rst b/Documentation/networking/device_drivers/ethernet/amd/pds_vdpa.rst
new file mode 100644
index 000000000000..587927d3de92
--- /dev/null
+++ b/Documentation/networking/device_drivers/ethernet/amd/pds_vdpa.rst
@@ -0,0 +1,85 @@
+.. SPDX-License-Identifier: GPL-2.0+
+.. note: can be edited and viewed with /usr/bin/formiko-vim
+
+==========================================================
+PCI vDPA driver for the AMD/Pensando(R) DSC adapter family
+==========================================================
+
+AMD/Pensando vDPA VF Device Driver
+
+Copyright(c) 2023 Advanced Micro Devices, Inc
+
+Overview
+========
+
+The ``pds_vdpa`` driver is an auxiliary bus driver that supplies
+a vDPA device for use by the virtio network stack.  It is used with
+the Pensando Virtual Function devices that offer vDPA and virtio queue
+services.  It depends on the ``pds_core`` driver and hardware for the PF
+and VF PCI handling as well as for device configuration services.
+
+Using the device
+================
+
+The ``pds_vdpa`` device is enabled via multiple configuration steps and
+depends on the ``pds_core`` driver to create and enable SR-IOV Virtual
+Function devices.  After the VFs are enabled, we enable the vDPA service
+in the ``pds_core`` device to create the auxiliary devices used by pds_vdpa.
+
+Example steps:
+
+.. code-block:: bash
+
+  #!/bin/bash
+
+  modprobe pds_core
+  modprobe vdpa
+  modprobe pds_vdpa
+
+  PF_BDF=`ls /sys/module/pds_core/drivers/pci\:pds_core/*/sriov_numvfs | awk -F / '{print $7}'`
+
+  # Enable vDPA VF auxiliary device(s) in the PF
+  devlink dev param set pci/$PF_BDF name enable_vnet cmode runtime value true
+
+  # Create a VF for vDPA use
+  echo 1 > /sys/bus/pci/drivers/pds_core/$PF_BDF/sriov_numvfs
+
+  # Find the vDPA services/devices available
+  PDS_VDPA_MGMT=`vdpa mgmtdev show | grep vDPA | head -1 | cut -d: -f1`
+
+  # Create a vDPA device for use in virtio network configurations
+  vdpa dev add name vdpa1 mgmtdev $PDS_VDPA_MGMT mac 00:11:22:33:44:55
+
+  # Set up an ethernet interface on the vdpa device
+  modprobe virtio_vdpa
+
+
+
+Enabling the driver
+===================
+
+The driver is enabled via the standard kernel configuration system,
+using the make command::
+
+  make oldconfig/menuconfig/etc.
+
+The driver is located in the menu structure at:
+
+  -> Device Drivers
+    -> Network device support (NETDEVICES [=y])
+      -> Ethernet driver support
+        -> Pensando devices
+          -> Pensando Ethernet PDS_VDPA Support
+
+Support
+=======
+
+For general Linux networking support, please use the netdev mailing
+list, which is monitored by Pensando personnel::
+
+  netdev@vger.kernel.org
+
+For more specific support needs, please use the Pensando driver support
+email::
+
+  drivers@pensando.io
diff --git a/Documentation/networking/device_drivers/ethernet/index.rst b/Documentation/networking/device_drivers/ethernet/index.rst
index 417ca514a4d0..94ecb67c0885 100644
--- a/Documentation/networking/device_drivers/ethernet/index.rst
+++ b/Documentation/networking/device_drivers/ethernet/index.rst
@@ -15,6 +15,7 @@ Contents:
    amazon/ena
    altera/altera_tse
    amd/pds_core
+   amd/pds_vdpa
    aquantia/atlantic
    chelsio/cxgb
    cirrus/cs89x0
diff --git a/MAINTAINERS b/MAINTAINERS
index c25172d6471a..2bd6d0e8a084 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22304,6 +22304,10 @@ F:	include/linux/vringh.h
 F:	include/uapi/linux/virtio_*.h
 F:	tools/virtio/
 
+PDS DSC VIRTIO DATA PATH ACCELERATOR
+R:	Shannon Nelson <shannon.nelson@amd.com>
+F:	drivers/vdpa/pds/
+
 VIRTIO CRYPTO DRIVER
 M:	Gonglei <arei.gonglei@huawei.com>
 L:	virtualization@lists.linux-foundation.org
diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index cd6ad92f3f05..656c1cb541de 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -116,4 +116,14 @@ config ALIBABA_ENI_VDPA
 	  This driver includes a HW monitor device that
 	  reads health values from the DPU.
 
+config PDS_VDPA
+	tristate "vDPA driver for AMD/Pensando DSC devices"
+	select VIRTIO_PCI_LIB
+	depends on PCI_MSI
+	depends on PDS_CORE
+	help
+	  vDPA network driver for AMD/Pensando's PDS Core devices.
+	  With this driver, the VirtIO dataplane can be
+	  offloaded to an AMD/Pensando DSC device.
+
 endif # VDPA
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
