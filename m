Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 700616EE992
	for <lists.virtualization@lfdr.de>; Tue, 25 Apr 2023 23:26:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C79BB417BC;
	Tue, 25 Apr 2023 21:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C79BB417BC
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dahnUiZ7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zm9v0qCwZoRd; Tue, 25 Apr 2023 21:26:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C2AA6416F5;
	Tue, 25 Apr 2023 21:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2AA6416F5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCEC5C008A;
	Tue, 25 Apr 2023 21:26:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57BE3C002A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Apr 2023 21:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5E6C820AF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Apr 2023 21:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5E6C820AF
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dahnUiZ7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lYH26f8mQUwd
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Apr 2023 21:26:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB12B8207C
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::605])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB12B8207C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Apr 2023 21:26:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REDxoB2RfRyAYbhYtZgLTQLFZ7GbDGZYI6RdxMGnvG/fheAxSnzIgkSbtoIUY/NaCcueMAY4sHgholKLvuk6YLxihIpYJMxcIpRD1L3nXCwK7grDzN2B6noaOpuJHm2eSAHliLhiQuc0QjLjFW/N9I1dPendCd5GyaIGZpr+iiDYR8Urdi2HkeBnkh7koQ0ofw8oNBqEn2wIBDf/e2SjzhUMOrwHoqm5QSKiqPMe2WrZDVmzbA57GywR8W7Y+KEUPu+HchTgWxHyyVVLmrg8k1E1EAAoWKYas49QpjrbZFkOJVFn77rXGgDvlHcnZObPi8c2jbjZEzXUza+1CA8PIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6rV2LJNu/InPBVEvjGFRID58KlWgdkUW6P5X7kUndE=;
 b=lpCRUI92LHzAIzmvmYa7uvtwBn+wBKuCSRprxcW2c1XKC1bs6SEVyzjbEkO8EHc1obnQ/1ov5veuo3HW/YV/0d/odesC3HIKaVoZLCbfD3U4m4huOQzkzYdvfJUikQI1cRo2AV6f5+o2orCxC6sVXSXCKlvPoeHQNQUg2DowEigsvbHEp6o5FurX3wqPb5WhVwEBK300Tnv+oxdTFOOspGnU5sZyhGxH2dR7Gcc68DRmUJP0lFkvEiUecDkpGwRZPfwzH9nb7Z+qplKJ+jcR8MkDtbSDG1SUWEk8MzXhx1OWhGYKA9RGfGSVIGHYLP87phNgoEezlW1KqQheRSAVsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6rV2LJNu/InPBVEvjGFRID58KlWgdkUW6P5X7kUndE=;
 b=dahnUiZ7CWVN4TstLBgSE5xA9uEfI3lm49eVtUzkaQJq39c8aotBW6UWTPoaXgYFsaj9VbAf88PzIijv6+wpUzm3OBKDBxi5dSpRMO3fuUAkcyS7wv3+ZSmixDkcTuHjMMcnd3lKZxGhyyVyd+8SJVLhUH256T7ger89AaQGR8s=
Received: from DS7PR03CA0116.namprd03.prod.outlook.com (2603:10b6:5:3b7::31)
 by DS7PR12MB5864.namprd12.prod.outlook.com (2603:10b6:8:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 21:26:17 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::44) by DS7PR03CA0116.outlook.office365.com
 (2603:10b6:5:3b7::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20 via Frontend
 Transport; Tue, 25 Apr 2023 21:26:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.21 via Frontend Transport; Tue, 25 Apr 2023 21:26:17 +0000
Received: from driver-dev1.pensando.io (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 25 Apr
 2023 16:26:16 -0500
To: <jasowang@redhat.com>, <mst@redhat.com>,
 <virtualization@lists.linux-foundation.org>, <shannon.nelson@amd.com>,
 <brett.creeley@amd.com>, <netdev@vger.kernel.org>
Subject: [PATCH v4 virtio 00/10] pds_vdpa driver
Date: Tue, 25 Apr 2023 14:25:52 -0700
Message-ID: <20230425212602.1157-1-shannon.nelson@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT068:EE_|DS7PR12MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: bf49315b-c9a3-4df0-e1c7-08db45d3b4ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YZqFxMMVn4xEMNNg+gi0h+WXeHTHWWFGlYRrvusVd2ogDuDHCpc1yfW5hVa6eiYozr3d6PKkOer5Cdvb2DGre8S+2iAyu4k0u5o6GuaTBAxIG62RZjadnA4OzREqVgiM5RqrekJY8qdz5qdaAgBzDP3jIksRA0cQUIKjVN0d1Pb//iu8nFCsxAMSBwhMBT7zwsDXKfMLb0VqPmcO1BEhnBZQ7kgAoY9tk/kgamUSMd/XAApAFQSR6xUrtnmU1I0N6sZMC9f9LGkqWTQf4l2zpKZdz5QaStjn22Ox6tCNCHwU0JUXfbCnOQV2TI6TvJBDWu0YtRRzFYF/y2XK3iKFh9NUuc9JURUO3qbP3WZLTBFoI/Q37c1FXeF8r4RmiOlCwE/Ho+ktKM3VVbb0dihaZ5aN0ZDjUBNHLmDUWO+G7YdEfXhbMy1akRhgQVse0dgc9ELXZMkSqQThFd6v8cGSN/bh0sumVGybzpiVtIR9/OCaJ6CAVeLdxqkMuFI3UGRn9hFsgsu7aAYlU76UC+yfTv4dsxKYK454pTKWdNjdtnBj804emTKNF3IheuN9ladsx6mM5TOqZbz3H8fNeB1jcViO2jvGgqa4Dh6Swj8xI7Xpzonjk16NMBCfIRr2FD1GKNtwbnFVCBEmSWWsymy5HZCxNHP0U/GOcY2QS1gUeTSO13F7GwOjYRpK0Lqg01wEI0kHctgwMfPWXk6Ero7QqOB94/nDdosFBOE+L/MQhjg5MDKUYVmz0JUNzIIQlXJlJeiKv25sIKEBLZR+SIHDjQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199021)(40470700004)(36840700001)(46966006)(82740400003)(44832011)(966005)(70586007)(70206006)(2906002)(6666004)(1076003)(8936002)(40480700001)(336012)(426003)(186003)(16526019)(83380400001)(8676002)(2616005)(41300700001)(26005)(36860700001)(5660300002)(316002)(40460700003)(47076005)(86362001)(110136005)(36756003)(4326008)(81166007)(356005)(82310400005)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 21:26:17.8115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf49315b-c9a3-4df0-e1c7-08db45d3b4ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5864
Cc: drivers@pensando.io
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

This patchset implements a new module for the AMD/Pensando DSC that
supports vDPA services on PDS Core VF devices.  This code is based on
and depends on include files from the pds_core driver described here[0].
The pds_core driver creates the auxiliary_bus devices that this module
connects to, and this creates vdpa devices for use by the vdpa module.

The first version of this driver was a part of the original pds_core RFC
[1] but has since been reworked to pull out the PCI driver and to make
better use of the virtio and virtio_net configuration spaces made available
by the DSC's PCI configuration.  As the device development has progressed,
the ability to rely on the virtio config spaces has grown.

This patchset includes a modification to the existing vp_modern_probe()
which implements overrides for the PCI device id check and the DMA mask.
These are intended to be used with vendor vDPA devices that implement
enough of the virtio config space to be used directly, but don't use the
virtio device id.

To use this module, enable the VFs and turn on the vDPA services in the
pds_core PF, then use the 'vdpa' utility to create devices for use by
virtio_vdpa or vhost_vdpa:
   echo 1 > /sys/bus/pci/drivers/pds_core/$PF_BDF/sriov_numvfs
   devlink dev param set pci/$PF_BDF name enable_vnet value true cmode runtime
   PDS_VDPA_MGMT=`vdpa mgmtdev show | grep vDPA | head -1 | cut -d: -f1`
   vdpa dev add name vdpa1 mgmtdev $PDS_VDPA_MGMT mac 00:11:22:33:44:55

[0] Link: https://lore.kernel.org/netdev/20230322185626.38758-1-shannon.nelson@amd.com/
[1] Link: https://lore.kernel.org/netdev/20221118225656.48309-1-snelson@pensando.io/

Changes:
 v4:
 - rename device_id_check_override() to device_id_check()
 - make device_id_check() return the device_id found and checked
 - removed pds_vdpa.h, put its adminq changes into pds_adminq.h
 - added a patch to separate out the adminq changes
 - added a patch to move an adminq enum from pds_common.h to pds_adminq.h
 - moved adminq calls for get/set_vq_state into cmds.c
 - limit max_vqs by number of msix available
 - don't increment nintrs for CVQ, it should already be covered from max_vqs
 - pds_core API related rework following pds_core inclusion to net-next
 - use non-debugfs method to find PF pci address in pds_vdpa.rst instructions

 v3:
Link: https://lore.kernel.org/netdev/20230330192313.62018-1-shannon.nelson@amd.com/
 - added a patch to modify vp_modern_probe() such that specific device id and
   DMA mask overrides can be used
 - add pds_vdpa.rst into index file
 - dev_dbg instead of dev_err on most of the adminq commands
 - rework use of pds_vdpa_cmd_reset() and pds_vdpa_init_hw() for better
   firmware setup in start-stop-start scenarios
 - removed unused pds_vdpa_cmd_set_features(), we can rely on vp_modern_set_features()
 - remove unused hw_qtype and hw_qindex from pds_vdpa_vq_info
 - reworked debugfs print_feature_bits to also print unknown bits
 - changed use of PAGE_SIZE to local PDS_PAGE_SIZE to keep with FW layout needs
   without regard to kernel PAGE_SIZE configuration

 v2:
https://lore.kernel.org/netdev/20230309013046.23523-1-shannon.nelson@amd.com/
 - removed PCI driver code
 - replaced home-grown event listener with notifier
 - replaced many adminq uses with direct virtio_net config access
 - reworked irqs to follow virtio layout
 - removed local_mac_bit logic
 - replaced uses of devm_ interfaces as suggested in pds_core reviews
 - updated copyright strings to reflect the new owner

Shannon Nelson (10):
  virtio: allow caller to override device id and DMA mask
  pds_vdpa: Add new vDPA driver for AMD/Pensando DSC
  pds_vdpa: move enum from common to adminq header
  pds_vdpa: new adminq entries
  pds_vdpa: get vdpa management info
  pds_vdpa: virtio bar setup for vdpa
  pds_vdpa: add vdpa config client commands
  pds_vdpa: add support for vdpa and vdpamgmt interfaces
  pds_vdpa: subscribe to the pds_core events
  pds_vdpa: pds_vdps.rst and Kconfig

 .../device_drivers/ethernet/amd/pds_vdpa.rst  |  85 +++
 .../device_drivers/ethernet/index.rst         |   1 +
 MAINTAINERS                                   |   4 +
 drivers/vdpa/Kconfig                          |   8 +
 drivers/vdpa/Makefile                         |   1 +
 drivers/vdpa/pds/Makefile                     |  10 +
 drivers/vdpa/pds/aux_drv.c                    | 140 ++++
 drivers/vdpa/pds/aux_drv.h                    |  26 +
 drivers/vdpa/pds/cmds.c                       | 207 +++++
 drivers/vdpa/pds/cmds.h                       |  20 +
 drivers/vdpa/pds/debugfs.c                    | 287 +++++++
 drivers/vdpa/pds/debugfs.h                    |  17 +
 drivers/vdpa/pds/vdpa_dev.c                   | 704 ++++++++++++++++++
 drivers/vdpa/pds/vdpa_dev.h                   |  47 ++
 drivers/virtio/virtio_pci_modern_dev.c        |  37 +-
 include/linux/pds/pds_adminq.h                | 287 +++++++
 include/linux/pds/pds_common.h                |  21 +-
 include/linux/virtio_pci_modern.h             |   6 +
 18 files changed, 1876 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/networking/device_drivers/ethernet/amd/pds_vdpa.rst
 create mode 100644 drivers/vdpa/pds/Makefile
 create mode 100644 drivers/vdpa/pds/aux_drv.c
 create mode 100644 drivers/vdpa/pds/aux_drv.h
 create mode 100644 drivers/vdpa/pds/cmds.c
 create mode 100644 drivers/vdpa/pds/cmds.h
 create mode 100644 drivers/vdpa/pds/debugfs.c
 create mode 100644 drivers/vdpa/pds/debugfs.h
 create mode 100644 drivers/vdpa/pds/vdpa_dev.c
 create mode 100644 drivers/vdpa/pds/vdpa_dev.h

-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
