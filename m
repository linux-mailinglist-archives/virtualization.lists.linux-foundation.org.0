Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DEE6F5D9D
	for <lists.virtualization@lfdr.de>; Wed,  3 May 2023 20:13:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 240D840107;
	Wed,  3 May 2023 18:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 240D840107
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=e/+x3gGr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tXjPySGSCdKu; Wed,  3 May 2023 18:13:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C80EE41B4C;
	Wed,  3 May 2023 18:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C80EE41B4C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BBD6C0090;
	Wed,  3 May 2023 18:13:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69976C002A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 May 2023 18:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42DAA40597
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 May 2023 18:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42DAA40597
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=e/+x3gGr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RWLqV47oB7y9
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 May 2023 18:13:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54B2B40201
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::611])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54B2B40201
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 May 2023 18:13:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMN0p7QItRTVsc5AN7aeGq1lj/OrisWjvU77G7Cg7fKDVRID/x5XiGBYXAA52yUgsXc6Bw0S70P+axoIrXPAbZsehzkXqz6v2M2JPhrdjWkWL/XSXGFdej8hjD6TZvf0FiaD6CMz1UCqdTPyuXgQO1eaRxijOleiP6/VZjXhTPN/tFmUf7VdMJyk0/wl5pQ5etAOVyQCzoBLXVw+ag0Ui6OSkIdEixFsxDi7fxvcCi2JEIuK5T9BSke6GM4FDBnCIEf9NA5cogpbG5849K1wW2/f5SqYTLb+BD0UGb7XiTaUwrD2+hIXWtDXirT4Ltnw/GlsnXxEr8mie+f568PuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2phjSk5/ktRNE6QTOKLym3vATrUDD9Aa2POuZC2Wy2c=;
 b=avqnxpStTCtBKcpvt7iIgyFdu+pk2PXzDR4kcfs9eHXL8N7ONL4owUogA3LzHz4Ousf7DOMKIb/rD3kBopblEKlN2gksgIgIab612AcixvPmKkRJrpin7uPx2NTKFeqqZvjtnEBaocNGIfrvGXJRpvwyNl1BcoBDf5VTSPuDouusjN+3Dzvf7iSGlqNZnRE/R0tX1Ax3874smvAcN1ALPvCBVHZLPDdbiDXxVtAPNTnFWBkQpcjjJVno4/uvsjmXvpZI1HcG8RzSemALRAPavfHjI+kMFx+5t3GJdLe0BM3juTuRi/5unca9zuBXjTsdUoYLb7VfQKeFaMC8O1nWFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2phjSk5/ktRNE6QTOKLym3vATrUDD9Aa2POuZC2Wy2c=;
 b=e/+x3gGrnxT8iRltGXAXRYtKohu9bW8ZWlmQbJEE7iV4jPivVsh1+JL/8fjN4Llp5B8S45zjHcqhmm1iXLHYvAYwjY1uv5/KZm0cjNiel4JOtwZDELVBghfD2jhDpSfhfnzLqIOI3UzOUrNv9NmuoNMHXncmgvxyX4QHGx/62XQ=
Received: from DM6PR03CA0055.namprd03.prod.outlook.com (2603:10b6:5:100::32)
 by BY5PR12MB4225.namprd12.prod.outlook.com (2603:10b6:a03:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 18:13:00 +0000
Received: from DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::4d) by DM6PR03CA0055.outlook.office365.com
 (2603:10b6:5:100::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22 via Frontend
 Transport; Wed, 3 May 2023 18:12:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT109.mail.protection.outlook.com (10.13.173.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.22 via Frontend Transport; Wed, 3 May 2023 18:12:59 +0000
Received: from driver-dev1.pensando.io (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 3 May
 2023 13:12:58 -0500
To: <jasowang@redhat.com>, <mst@redhat.com>,
 <virtualization@lists.linux-foundation.org>, <shannon.nelson@amd.com>,
 <brett.creeley@amd.com>, <netdev@vger.kernel.org>
Subject: [PATCH v5 virtio 02/11] virtio: allow caller to override device DMA
 mask in vp_modern
Date: Wed, 3 May 2023 11:12:31 -0700
Message-ID: <20230503181240.14009-3-shannon.nelson@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230503181240.14009-1-shannon.nelson@amd.com>
References: <20230503181240.14009-1-shannon.nelson@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT109:EE_|BY5PR12MB4225:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d4acf1-637f-4fd3-c5c2-08db4c020756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bv27er6A0JF2Fcf2xgk04/GBnYOB4Z+P03XpZ5+ViR/7hnC94wpEs0e2BuU2P691K8VmFMHRH37X8K958JTpR3U9aaNOlwcR43gpVJ0LlxvM7x3YMzH9l9DQwfz3+IWDKCklynxbwxKbo+XNOLflwfkK52wmK3/S7jukkTyF26xOuJ7T6mrx2lXKSmnpm67S6Cbkr4q4dvGpqyWgPMbHBZdP00RjCodkp9k9559UKgvSCDgnatAXq85HvEc3Y3AiUSThC+bzjVqC3N5NQ89m6TLaWlVsxGInzKx3dmXjcPqDHEKCnFvmHHIgiIAh8q2Ova0QxXDlLJrN11NUwcTeuyChXQ7qTKG9SJHGNqVW8Gy6VwhrddVmRnVXQsFDUk+nqemkIyEhfmSH1aZ6e2ojevE+qflwqouZxFhZkErbGG94eQpEHu3nK5yr5DGWyX/44jiJEShp4F45eicsZ9ZiTUIbdyDwzeyqde4kI8G7IJbcvaX+bDJ4XT1EyKIjyJ+hWoqjZ9CAuowbvQg0pjm0Mxm1GHZnCPsbtH6FME0IrJqfMx8q6quI+X99qt9kpnCRYwfx2kRpc4l+H2YvHeZRUkKkklBhJgadJa5cQbor/ZXgwD9G5wLGPJvF3Z38Sizjv8o0ZI4jMN3+k6Ifs3Sln2bszkge1C3K24zRVleUvV1Dmx0voDCl56qTmkxsSAxWjSWQQ1jML17aXZyd8VKUab/KVA6dhYTIAwcCJXocbzA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(26005)(16526019)(1076003)(186003)(2616005)(44832011)(2906002)(5660300002)(426003)(336012)(83380400001)(47076005)(40480700001)(36860700001)(8936002)(8676002)(40460700003)(41300700001)(81166007)(6666004)(36756003)(356005)(82740400003)(82310400005)(478600001)(316002)(110136005)(54906003)(70206006)(4326008)(86362001)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 18:12:59.9048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d4acf1-637f-4fd3-c5c2-08db4c020756
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4225
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

To add a bit of vendor flexibility with various virtio based devices,
allow the caller to specify a different DMA mask.  This adds a dma_mask
field to struct virtio_pci_modern_device.  If defined by the driver,
this mask will be used in a call to dma_set_mask_and_coherent() instead
of the traditional DMA_BIT_MASK(64).  This allows limiting the DMA space
on vendor devices with address limitations.

Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
---
 drivers/virtio/virtio_pci_modern_dev.c | 3 ++-
 include/linux/virtio_pci_modern.h      | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_pci_modern_dev.c b/drivers/virtio/virtio_pci_modern_dev.c
index 9b2d6614de67..aad7d9296e77 100644
--- a/drivers/virtio/virtio_pci_modern_dev.c
+++ b/drivers/virtio/virtio_pci_modern_dev.c
@@ -268,7 +268,8 @@ int vp_modern_probe(struct virtio_pci_modern_device *mdev)
 		return -EINVAL;
 	}
 
-	err = dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(64));
+	err = dma_set_mask_and_coherent(&pci_dev->dev,
+					mdev->dma_mask ? : DMA_BIT_MASK(64));
 	if (err)
 		err = dma_set_mask_and_coherent(&pci_dev->dev,
 						DMA_BIT_MASK(32));
diff --git a/include/linux/virtio_pci_modern.h b/include/linux/virtio_pci_modern.h
index e7b1db1dd0bb..067ac1d789bc 100644
--- a/include/linux/virtio_pci_modern.h
+++ b/include/linux/virtio_pci_modern.h
@@ -41,6 +41,9 @@ struct virtio_pci_modern_device {
 
 	/* optional check for vendor virtio device, returns dev_id or -ERRNO */
 	int (*device_id_check)(struct pci_dev *pdev);
+
+	/* optional mask for devices with limited DMA space */
+	u64 dma_mask;
 };
 
 /*
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
