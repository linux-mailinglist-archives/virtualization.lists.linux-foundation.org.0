Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 38398603341
	for <lists.virtualization@lfdr.de>; Tue, 18 Oct 2022 21:19:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 660E283EF7;
	Tue, 18 Oct 2022 19:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 660E283EF7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.a=rsa-sha256 header.s=TM-DKIM-20210503141657 header.b=HoeXQIEh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ptws5uCl2wNT; Tue, 18 Oct 2022 19:19:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 02ED283EE9;
	Tue, 18 Oct 2022 19:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02ED283EE9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03EEFC0080;
	Tue, 18 Oct 2022 19:19:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA0B8C0033
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 19:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADB0C40158
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 19:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADB0C40158
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.a=rsa-sha256 header.s=TM-DKIM-20210503141657 header.b=HoeXQIEh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CVhs3w880Mbz
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 19:19:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ADD740111
Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu
 [18.185.115.25])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7ADD740111
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 19:19:28 +0000 (UTC)
Received: from 104.47.12.50_.trendmicro.com (unknown [172.21.183.236])
 by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 1F10510000631;
 Tue, 18 Oct 2022 19:19:26 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1666120765.555000
X-TM-MAIL-UUID: 9066b0dd-d2db-4d31-a8d7-56375b195f26
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [104.47.12.50])
 by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id
 87A0D10002B32; Tue, 18 Oct 2022 19:19:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHSBK+2VaGk+SAShIW2T3/5HReYtLxEUABkluLbLRE6NUOkSqaZDqLXV6NBIQ+f4AR36miO9kaDEvywP4LrwcN7ofknHTzbpteEuGlepwJlOdmhz+rrLPlio8X/lrER9Nm51Xd8O+Nn0WwblgB/RPdzXoRePPDDi0ePBddG9nmrrgp0Lhtk558xaNc4/mMvUqV1uHo6DPk2ZHfy0bHT6Gacer91RshNcY2pJUX9wCKNkMsdTsUttdy4Dxj7y91vcsMlikXvNteUl5Gw5aNe59azO/A9VUikhmjd8TweBzh9k6Yo2VGyMTZBHZ8sr8G3E3zydRF61n+w81Yq51k9j+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PTqWON0tFus0A+Tdf6DvvhzAwoaHaTPS17wa6Wg7zA=;
 b=CaomnOEpEUP0cPtxFasOHLMAtVG3ynlBVmcclviBc4GNC/TH966YUM6h8VTYgzlMgexmQLKHe8IUAEozlKUvrjq0fTguUWNWQxQcGvA2Uo7e9zESaxAk12+7Yt9yD584AhP9+d4XSNXVNK1ldimm814LDYx5+H6crSPu17knwEEvcMEhZ153x+bsVMqHH1OFXQgTAFX7h0ahBmO6RUtYHq0636gIvUjomg4GJq3m5jy0t3ExmRvxeBTVWTUgjnNiSGJUqFnnCL5iaiIJ39QViHKXkl4vIcuva9WnCRDN2Vj0MFZemQ12zBaqx3QWUg3aFVY+Aprtx5Qo0JoT8BabZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.66.60.4) smtp.rcpttodomain=gmail.com smtp.mailfrom=opensynergy.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=opensynergy.com;
 dkim=none (message not signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.66.60.4)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=opensynergy.com;
Received-SPF: Pass (protection.outlook.com: domain of opensynergy.com
 designates 217.66.60.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.66.60.4; helo=SR-MAIL-03.open-synergy.com; pr=C
From: Igor Skalkin <Igor.Skalkin@opensynergy.com>
To: virtualization@lists.linux-foundation.org, luiz.dentz@gmail.com,
 mst@redhat.com
Subject: [PATCH v3 1/1] virtio_bt: Fix alignment in configuration struct
Date: Tue, 18 Oct 2022 21:19:11 +0200
Message-Id: <20221018191911.589564-2-Igor.Skalkin@opensynergy.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221018191911.589564-1-Igor.Skalkin@opensynergy.com>
References: <20221018191911.589564-1-Igor.Skalkin@opensynergy.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1EUR05FT057:EE_|AS4PR04MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de1fbf8-c2cb-4748-78ef-08dab13daac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jF/Uk4YtQO0vqAxdhZ8CZJVsRqAmdHHFB9MEXdtFScGILqBx4rl1EYVNJ9uySYfs7YhFa5xH3ulZ0C39DcKdyIA6PVl9jkcrKS7dtio4j9PltOspWBz/rlz/ARMVsWYKs6z2NxwbwjjaTjt54tUHanPklBEe0e+JbJq8pV1ZSIWRO5j6Q9MfJRAcyfJz3VlnJAOY4t/7bK1orSSiEUx1ExPpKXD8D2SIIsE4kivf1OTI28LezH8HvkOcUGu5ieCReV9MCu5Ky6ESKxJIxfAgFaWFzcCVeG+kZdyB75TbfrZMoseIa1yOfxu5MfxEBay3ltJUqB42PmXApAgnWY6PsDkF4oXaoXJkdaaucvJGYaPU4KLv1GeY8yvufXngjFvBQOaaxSHND4UtAsMKfPmpHjP5lEsPq1tEBzUtuqZuEs+nIozwHHvorTooNTOeQdGbROoLxfOsTfQn6ZVp879bt0GVpHnH072bwxP54E/liau72vvz5WZ6Ik8gDKwoEt0RIT3RUCEZdjy5X3YfrLr1W/MwP8xtz8faf5hauWyDAYJ7tcDki+i7cERdN3HVWpbAC525X/PBBX6jqf+xs0eQzzInuoF8OKrA9jps/cVcsENRvWebnq2xMOYUKhS3gwsK4V+8NbXA9ARoy0pgOeyrIvewk+Z77ehEylHezvtp2RakZ2BX6Eal3rXC4AZkemot8NZlYaFIrIwFIbGwsZY0SypY7KaRvLAfP1lWq0JMGYcEBDa8I6uR+2m5jfqOhOtEb7lcbt2EQqcjFAAUoA5CTYra+Neeu6etHgN6ChPzhMQ=
X-Forefront-Antispam-Report: CIP:217.66.60.4; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SR-MAIL-03.open-synergy.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230022)(376002)(396003)(39840400004)(346002)(136003)(451199015)(46966006)(36840700001)(36860700001)(2616005)(107886003)(1076003)(26005)(47076005)(83380400001)(336012)(186003)(5660300002)(40480700001)(8936002)(82310400005)(316002)(70586007)(2906002)(478600001)(4326008)(41300700001)(966005)(8676002)(70206006)(42186006)(66899015)(86362001)(36756003)(81166007)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 19:19:24.1311 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de1fbf8-c2cb-4748-78ef-08dab13daac3
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64; Ip=[217.66.60.4];
 Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT057.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9410
X-TM-AS-ERS: 104.47.12.50-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.0.1006-27210.001
X-TMASE-Result: 10--9.079000-4.000000
X-TMASE-MatchedRID: IMuFrDGWl2QxZoNWTqFxuUXBhxFdFgcQBXngI6jFvpeueqlDxh8ToXMW
 fmr8UEU8gRXUy3f9jsQW+rN4H33dkdyU5e20qrzVuce7gFxhKa3BOVz0Jwcxl6vCrG0TnfVUilv
 Ab18i4hOxIT6WtCo5I1cnoO4Nx+loO4kcA8kjsz+8coKUcaOOvXiywgNDw+2oYHEoQgBRP6UwhB
 ahsGBBJGGVjGzWpzaq0IBzswjjWMxMGPWd3bHvfijPfBDLwtluMQN1uVM9I/izllWfDcUJq7ZTW
 XFJmOgDego2wiaj2iG5cURAloITPv46FBYGUp+VFEUknJ/kEl4+IIVHuzUb7A1fU1q220JrKrau
 Xd3MZDWU7rL13kdicLfXZq+WXHSCKRn+Fu8cjYWjse1qY0kZUQuk1fKPiPoS
X-TMASE-XGENCLOUD: a74d4875-784e-4b8b-ae7c-93c0c2493c28-0-0-200-0
X-TM-Deliver-Signature: E9544974AD5E395BCBCB74874A054FE7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
 s=TM-DKIM-20210503141657; t=1666120766;
 bh=YH50lXef3NIHfAOTFrt2fmD8LHTKJg7LLA8vRLSBLak=; l=3789;
 h=From:To:Date;
 b=HoeXQIEhdo4rDLOb5qVtle0YS0QGCEUPq6mKVhHbx3bU8gL/fnEGS2GuwkddhTC0L
 RbTIhLxccZnEZ6EU3MpG4Xfadv88fxnTNtDDK3cjZyT5xOci+b8i1AcnENvEKCySPc
 HuRMXR5De/60sRMbHnhiRZ46NoQ64VRPeei095gF7dS3j3xmBp4g+WzeTqteiGXEI5
 1qRWSfMI+iJeTbiyJxkeOwparl9VtJ/lq9pdlNNCB1BREO1KVotwMDIlkuAPJyuRaC
 Xp9Dbn5WHWi1XwwDt9PVyxpTbhTWd+sB8v1PiIBN8zQCBUpGHCmLwLakSdI9gVow8V
 B4Nb3jLNdi06g==
Cc: johan.hedberg@gmail.com, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, marcel@holtmann.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

The current version of the configuration structure has unaligned
16-bit fields, but according to the specification [1], access to
the configuration space must be aligned.

Add a second, aligned  version of the configuration structure
and a new feature bit indicating that this version is being used.

[1] https://docs.oasis-open.org/virtio/virtio/v1.1/virtio-v1.1.pdf

Signed-off-by: Igor Skalkin <Igor.Skalkin@opensynergy.com>
---
 drivers/bluetooth/virtio_bt.c  | 16 +++++++++++++---
 include/uapi/linux/virtio_bt.h |  8 ++++++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/virtio_bt.c b/drivers/bluetooth/virtio_bt.c
index 67c21263f9e0..35f8041722c8 100644
--- a/drivers/bluetooth/virtio_bt.c
+++ b/drivers/bluetooth/virtio_bt.c
@@ -306,7 +306,12 @@ static int virtbt_probe(struct virtio_device *vdev)
        if (virtio_has_feature(vdev, VIRTIO_BT_F_VND_HCI)) {
                __u16 vendor;

-               virtio_cread(vdev, struct virtio_bt_config, vendor, &vendor);
+               if (virtio_has_feature(vdev, VIRTIO_BT_F_CONFIG_V2))
+                       virtio_cread(vdev, struct virtio_bt_config_v2,
+                                    vendor, &vendor);
+               else
+                       virtio_cread(vdev, struct virtio_bt_config,
+                                    vendor, &vendor);

                switch (vendor) {
                case VIRTIO_BT_CONFIG_VENDOR_ZEPHYR:
@@ -339,8 +344,12 @@ static int virtbt_probe(struct virtio_device *vdev)
        if (virtio_has_feature(vdev, VIRTIO_BT_F_MSFT_EXT)) {
                __u16 msft_opcode;

-               virtio_cread(vdev, struct virtio_bt_config,
-                            msft_opcode, &msft_opcode);
+               if (virtio_has_feature(vdev, VIRTIO_BT_F_CONFIG_V2))
+                       virtio_cread(vdev, struct virtio_bt_config_v2,
+                                    msft_opcode, &msft_opcode);
+               else
+                       virtio_cread(vdev, struct virtio_bt_config,
+                                    msft_opcode, &msft_opcode);

                hci_set_msft_opcode(hdev, msft_opcode);
        }
@@ -387,6 +396,7 @@ static const unsigned int virtbt_features[] = {
        VIRTIO_BT_F_VND_HCI,
        VIRTIO_BT_F_MSFT_EXT,
        VIRTIO_BT_F_AOSP_EXT,
+       VIRTIO_BT_F_CONFIG_V2,
 };

 static struct virtio_driver virtbt_driver = {
diff --git a/include/uapi/linux/virtio_bt.h b/include/uapi/linux/virtio_bt.h
index a7bd48daa9a9..af798f4c9680 100644
--- a/include/uapi/linux/virtio_bt.h
+++ b/include/uapi/linux/virtio_bt.h
@@ -9,6 +9,7 @@
 #define VIRTIO_BT_F_VND_HCI    0       /* Indicates vendor command support */
 #define VIRTIO_BT_F_MSFT_EXT   1       /* Indicates MSFT vendor support */
 #define VIRTIO_BT_F_AOSP_EXT   2       /* Indicates AOSP vendor support */
+#define VIRTIO_BT_F_CONFIG_V2  3       /* Use second version configuration */

 enum virtio_bt_config_type {
        VIRTIO_BT_CONFIG_TYPE_PRIMARY   = 0,
@@ -28,4 +29,11 @@ struct virtio_bt_config {
        __u16 msft_opcode;
 } __attribute__((packed));

+struct virtio_bt_config_v2 {
+       __u8  type;
+       __u8  alignment;
+       __u16 vendor;
+       __u16 msft_opcode;
+};
+
 #endif /* _UAPI_LINUX_VIRTIO_BT_H */
--
2.37.2


Please mind our privacy notice<https://www.opensynergy.com/datenschutzerklaerung/privacy-notice-for-business-partners-pursuant-to-article-13-of-the-general-data-protection-regulation-gdpr/> pursuant to Art. 13 GDPR. // Unsere Hinweise zum Datenschutz gem. Art. 13 DSGVO finden Sie hier.<https://www.opensynergy.com/de/datenschutzerklaerung/datenschutzhinweise-fuer-geschaeftspartner-gem-art-13-dsgvo/>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
