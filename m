Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F874A73D6
	for <lists.virtualization@lfdr.de>; Wed,  2 Feb 2022 15:55:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20E04404CD;
	Wed,  2 Feb 2022 14:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gdVrzs_YZieU; Wed,  2 Feb 2022 14:55:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9B32140594;
	Wed,  2 Feb 2022 14:55:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64857C0077;
	Wed,  2 Feb 2022 14:55:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12C0BC000B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Feb 2022 14:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DC5A408AC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Feb 2022 14:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hLzQPpw8eLfx
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Feb 2022 14:55:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5270640594
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Feb 2022 14:55:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftVodke0Rxs3vsrlWJQxeqnsN0RTn9XoQhTomqf1jbDGP3BXX+o3iGaZhYFUoGU2Ng2upFer49rE24qR4PMYeNH8ZpkiTrpwW5xiSMacV4kGECwtzGU7TbICxNBxnMLTybWqsAKw0Swym+JPPQwZdQWucQaTy/VCkyvR8/5c4tIvTA+uM55oeLQ6jNH0zDenz8Zr1Sl+1IDAYM2Ku3boauyj45zQSW8pcYqkjAamipC7ZyuuE/lu78AoMDyUf6xthkRqCQ2fd/Hzf/T33JNRC3DBcRNk9ert1U8J8dXkeyBYh6Kv8mMVBDPWjzBVqJXsvpmdEzdzFufHOlifShJVXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flacZchePt8fdRY6L67vMFuq2TXvotfFMCzsLC9D2Zs=;
 b=bAfrHTphqO0sVYfyF6zlULeG3NocI69l7gur1ARr+UdKTuWSpeeejxjPNzS3vhcoNSvSxzV8tsC3AkpM3nP7ydwWCUXsrku0rLvijxaYHUcSEbdTsOorGalNqb7TEXkko1lBLRK+rsJUQKxla+97jsQagUfmnXuhUpJW9ZPL/uqK6NRfgEpBOPeCSopCNlSmaimApwyyi9u1GW0/mPCbJn60M0EkCgXB/bsbv8K44+ej6YZzBhEuz9VqGA+aQZIJVuyvD0+aziX84IfHU9kAVZ2V1qTUTCdsENsUGi3R7fAc9fsF06jSYU46xR0yq3EAsGwy8hBuVn599YEqhQnX3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flacZchePt8fdRY6L67vMFuq2TXvotfFMCzsLC9D2Zs=;
 b=dqfVIZYBqOo3iiUKpcpI859gmKnm1bCy09wCYm9A3+PbViH1KykCq3sXPRA4m7Oz1MvfzG+3TUZTpGKjfNiBRhDDB7py9uMrH62Lz6iJNflSQoNaUNzaq8B2zgKWr8gFtAY7WEROrSwqwyWg9cvNI6gegsgAji9vTHjfI2SnLB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from BY3PR05MB8081.namprd05.prod.outlook.com (2603:10b6:a03:366::15)
 by BN6PR05MB2803.namprd05.prod.outlook.com (2603:10b6:404:2c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.5; Wed, 2 Feb
 2022 14:55:16 +0000
Received: from BY3PR05MB8081.namprd05.prod.outlook.com
 ([fe80::304c:2b94:4f26:a581]) by BY3PR05MB8081.namprd05.prod.outlook.com
 ([fe80::304c:2b94:4f26:a581%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 14:55:16 +0000
From: Jorgen Hansen <jhansen@vmware.com>
To: linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH 6/8] VMCI: dma dg: allocate send and receive buffers for DMA
 datagrams
Date: Wed,  2 Feb 2022 06:49:08 -0800
Message-Id: <20220202144910.10349-7-jhansen@vmware.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220202144910.10349-1-jhansen@vmware.com>
References: <20220202144910.10349-1-jhansen@vmware.com>
X-ClientProxiedBy: SJ0PR03CA0362.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::7) To BY3PR05MB8081.namprd05.prod.outlook.com
 (2603:10b6:a03:366::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1277305e-5efe-480b-6ea1-08d9e65c0530
X-MS-TrafficTypeDiagnostic: BN6PR05MB2803:EE_
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS: <BN6PR05MB2803599288FC21F13F9E1B8CDA279@BN6PR05MB2803.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MFQaUq3XHMshOJyqW9pLpj9EmwgSck74ztKewAiXrkJBw5OnfIk42soTtlrSCd2tM3cNvPEEwnsqiHBYTmJolA+28+Gsjhiw8VMfv1uYzRdQc+QLk0zHU44KyUPOJIRtEw7HNmQ+tDdkcM5qGQ1nhpDcJeN9qoajXJnO9NiIcNfv6TH8XuHnGnZVxQVO9UZoS88JYG7zEYGjfAV+Jz4nmiaifOBUAvd2XV0wilQagZXyapdwDBaAzMWbVWzZRramZuHN9KwWuO7hFBFeNPO/yhEIvnq5JKmmHo1d/tn3qQSO9FN/j3d6tKqyVQl2nhjmIn0cbgFOx3+0pzt6108bJAFjk/nIuZ70RB9VScdFq24ipOP+GBlaB71g1z2k4TzDBdAeipCvE6WBYZHqVCbHPANFzsFpjBl3FfUYCuLsL0wdQjbTipNfh96dBPy9JSk0+bmUSg6QwZ1gm1zUfCre2Pd/FrPbgzYNK/WcA0/atiJH8uWJdTki44/Ueayx9SCLGz4KWglQW271jBESN+nT0CNARSZozO2/m1xgRinuD515bsWK+TU06e91Cf3He5n6kDa48QFlUUMBa1N7YUeBCcaqhKxe+UZ9C0eEnbRLnLVAhQbiwtKh69GSYcdxXJL/znRVGxJTLyigquldclc8VRzMoFC1Qs5IJNN1NEr8pm7xfpdS8ZusEsfpG1+6jDqvwh1/fRanZUXUSW28Ej3n9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY3PR05MB8081.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(316002)(6512007)(38100700002)(38350700002)(5660300002)(2616005)(8676002)(8936002)(54906003)(4326008)(66476007)(66556008)(66946007)(83380400001)(107886003)(508600001)(6486002)(86362001)(1076003)(36756003)(186003)(6506007)(26005)(2906002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bGdNP6Og4D/E57yXQ+J0/CiHKituCVwlN5xGG9vuDkVjGc4my4h1CadAAhTS?=
 =?us-ascii?Q?wnOGJ3QUHFr6Ow1v85asFNF7msGEEb2I3wgbdH+sC/UH87Wamw1ryHLirAVR?=
 =?us-ascii?Q?iTl3gbMedGO0KRcGxpgYzrs3u5ITlO/LLwWPbgme2bq5ClaTmBLGFEhav1sl?=
 =?us-ascii?Q?sRsOkXdXxs8a9fJx8fXIHDYzxgsWngZhSQSR/bM2MzYxalGV+DwvqxUqD9oa?=
 =?us-ascii?Q?tqQwvnEqQAMQ8RBrbrxzIBrVd3+1OAn+y7gzn3jlZ1StukBEaB46C3OBVZ7F?=
 =?us-ascii?Q?ZypiXlgE9dIbxpbJyMURJwR7tgmj8m0ep0Q9/fTRkCu7+T3BCpHwD4FOlA/t?=
 =?us-ascii?Q?mgQx+1Rdks6Luf6bgjFJTwI6zVo87D1ZAiNfEZEOnIpWEmu7nK62qsF0uuwV?=
 =?us-ascii?Q?iF8g8zrFHjrsaj/QKUGQQgm8UnHV30SP8eOg8eTbqSfvRh2kf2P8qkNqeKw6?=
 =?us-ascii?Q?9Zm67m/O14kzkZ2YOXkKhAKA65y1VtVFWJjNgy4g9eXUtwLuK8C9Fs3NVH/U?=
 =?us-ascii?Q?9y/Td92vQU9ClMmHq8pRune8+N3ZIQh050LAftTSGuhFM/q2hiJpAa/Mcwug?=
 =?us-ascii?Q?ZgsREcCCiDlNtMMOd+u5TwOIaYDLfwzfYjb7xUBiQwx14q90tbxb9uZugSV1?=
 =?us-ascii?Q?IzB8FXKX3LFVFQm4pCUE+Pe7S6f23iMDfQMK5etscoeeFRkd0in5u+jQqL9c?=
 =?us-ascii?Q?hyG7Br89qQw9wzqo0YAmPMuwfv3X51QMYth+5asDVhXEZx26lBRl2nGDOy0j?=
 =?us-ascii?Q?RRDdGCuih+17fh0tDj55SHeJfbjmWcvYnKZ+vhGJkLgpCj90qtjFFTxVCts5?=
 =?us-ascii?Q?jg04UAU/xowz/vPGuojiRayfE2cgDFafdO/FvBBDQwYXQtFNhU8MezP6ZiWx?=
 =?us-ascii?Q?+l5P9S+4JlS0hX5RUgBvLR2JppKQEBFOSIsyk3e+YLbdWGxiBLoHTUvZb6C+?=
 =?us-ascii?Q?0T2RDZo+yQl2+7PqBw6gaOHeG54EGGUj6iYPLM09HEDXzZbGk0STOeKjjpTZ?=
 =?us-ascii?Q?N3o6HUt7nRCvodHztjYflGtCBh47K/O78H6RRvQqbPqkTis5OxhypVv1Tk7/?=
 =?us-ascii?Q?1U/fFzYvssjB9vYes2eiT8WQCy0BHqlBR8BR9E7yYgiXQCyeJMe6fDm8NfJa?=
 =?us-ascii?Q?NtBh00jvdT6lAK0J9P5MUuO4NF7WSWOhlRb9K1CEHrqm1u4/d2BYEawRTh3y?=
 =?us-ascii?Q?117/488J6KF1DXM80NfJsVC/bVxVPnPd2bV0H+tKExWIQvMgnCjCy/h4YLwN?=
 =?us-ascii?Q?SNCg1xvEmZ+WP/x0Fzxr8IurUrUuU+O30EZ32YiOPKbcFYi+mm8FYNvYVyT+?=
 =?us-ascii?Q?bJwKe9df02t+gUrNKW0QI0WNSpnGY5mQJSp8s294KHr3dKY76lDlWbHYjzKk?=
 =?us-ascii?Q?0/CCzAv3KdWfqPepqv4oOEDTGwUatuSvk0BPj+YKkFnBakE/uthWmhVK0s5B?=
 =?us-ascii?Q?uIm+vRNfdHqbNz0+oHh3dQK0++0WM3D1kzB6w1hD4MjZFmP7MXcZpNuTYGwY?=
 =?us-ascii?Q?gwDmvZatupgDnjpZ+pdMJtKqS8ls9kE5LDUwaiSPXBSOnhRKnl5YJNG1raTI?=
 =?us-ascii?Q?2K3GwnZPCgfsoejkPckJyI2ZqotRDVAbcG1t5y1QirWUuW+vf54YpXshDBJv?=
 =?us-ascii?Q?fR2SIQzp/RL3iuFEQfovp/Q=3D?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1277305e-5efe-480b-6ea1-08d9e65c0530
X-MS-Exchange-CrossTenant-AuthSource: BY3PR05MB8081.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 14:55:15.1182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Npou5Bwo5FzjWPQoZQxtpk93fpGO5LLDhR7S91/DW6xRMTkCrDG1+/G9+9a3THFU82ZO4Y5rLpxnXdiUhcEEYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR05MB2803
Cc: pv-drivers@vmware.com, gregkh@linuxfoundation.org,
 Vishnu Dasa <vdasa@vmware.com>, Jorgen Hansen <jhansen@vmware.com>
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

If DMA datagrams are used, allocate send and receive buffers
in coherent DMA memory.

This is done in preparation for the send and receive datagram
operations, where the buffers are used for the exchange of data
between driver and device.

Reviewed-by: Vishnu Dasa <vdasa@vmware.com>
Signed-off-by: Jorgen Hansen <jhansen@vmware.com>
---
 drivers/misc/vmw_vmci/vmci_guest.c | 66 ++++++++++++++++++++++++++----
 include/linux/vmw_vmci_defs.h      |  4 ++
 2 files changed, 63 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_guest.c b/drivers/misc/vmw_vmci/vmci_guest.c
index 1903fe8e7c68..d0acb686b464 100644
--- a/drivers/misc/vmw_vmci/vmci_guest.c
+++ b/drivers/misc/vmw_vmci/vmci_guest.c
@@ -31,6 +31,12 @@
 
 #define VMCI_UTIL_NUM_RESOURCES 1
 
+/*
+ * Datagram buffers for DMA send/receive must accommodate at least
+ * a maximum sized datagram and the header.
+ */
+#define VMCI_DMA_DG_BUFFER_SIZE (VMCI_MAX_DG_SIZE + PAGE_SIZE)
+
 static bool vmci_disable_msi;
 module_param_named(disable_msi, vmci_disable_msi, bool, 0);
 MODULE_PARM_DESC(disable_msi, "Disable MSI use in driver - (default=0)");
@@ -53,6 +59,9 @@ struct vmci_guest_device {
 	struct tasklet_struct bm_tasklet;
 
 	void *data_buffer;
+	dma_addr_t data_buffer_base;
+	void *tx_buffer;
+	dma_addr_t tx_buffer_base;
 	void *notification_bitmap;
 	dma_addr_t notification_base;
 };
@@ -451,6 +460,24 @@ static irqreturn_t vmci_interrupt_dma_datagram(int irq, void *_dev)
 	return IRQ_HANDLED;
 }
 
+static void vmci_free_dg_buffers(struct vmci_guest_device *vmci_dev)
+{
+	if (vmci_dev->mmio_base != NULL) {
+		if (vmci_dev->tx_buffer != NULL)
+			dma_free_coherent(vmci_dev->dev,
+					  VMCI_DMA_DG_BUFFER_SIZE,
+					  vmci_dev->tx_buffer,
+					  vmci_dev->tx_buffer_base);
+		if (vmci_dev->data_buffer != NULL)
+			dma_free_coherent(vmci_dev->dev,
+					  VMCI_DMA_DG_BUFFER_SIZE,
+					  vmci_dev->data_buffer,
+					  vmci_dev->data_buffer_base);
+	} else {
+		vfree(vmci_dev->data_buffer);
+	}
+}
+
 /*
  * Most of the initialization at module load time is done here.
  */
@@ -520,11 +547,27 @@ static int vmci_guest_probe_device(struct pci_dev *pdev,
 	tasklet_init(&vmci_dev->bm_tasklet,
 		     vmci_process_bitmap, (unsigned long)vmci_dev);
 
-	vmci_dev->data_buffer = vmalloc(VMCI_MAX_DG_SIZE);
+	if (mmio_base != NULL) {
+		vmci_dev->tx_buffer = dma_alloc_coherent(&pdev->dev, VMCI_DMA_DG_BUFFER_SIZE,
+							 &vmci_dev->tx_buffer_base,
+							 GFP_KERNEL);
+		if (!vmci_dev->tx_buffer) {
+			dev_err(&pdev->dev,
+				"Can't allocate memory for datagram tx buffer\n");
+			return -ENOMEM;
+		}
+
+		vmci_dev->data_buffer = dma_alloc_coherent(&pdev->dev, VMCI_DMA_DG_BUFFER_SIZE,
+							   &vmci_dev->data_buffer_base,
+							   GFP_KERNEL);
+	} else {
+		vmci_dev->data_buffer = vmalloc(VMCI_MAX_DG_SIZE);
+	}
 	if (!vmci_dev->data_buffer) {
 		dev_err(&pdev->dev,
 			"Can't allocate memory for datagram buffer\n");
-		return -ENOMEM;
+		error = -ENOMEM;
+		goto err_free_data_buffers;
 	}
 
 	pci_set_master(pdev);	/* To enable queue_pair functionality. */
@@ -542,7 +585,7 @@ static int vmci_guest_probe_device(struct pci_dev *pdev,
 	if (!(capabilities & VMCI_CAPS_DATAGRAM)) {
 		dev_err(&pdev->dev, "Device does not support datagrams\n");
 		error = -ENXIO;
-		goto err_free_data_buffer;
+		goto err_free_data_buffers;
 	}
 	caps_in_use = VMCI_CAPS_DATAGRAM;
 
@@ -586,7 +629,7 @@ static int vmci_guest_probe_device(struct pci_dev *pdev,
 			dev_err(&pdev->dev,
 				"Missing capability: VMCI_CAPS_DMA_DATAGRAM\n");
 			error = -ENXIO;
-			goto err_free_data_buffer;
+			goto err_free_data_buffers;
 		}
 	}
 
@@ -602,6 +645,12 @@ static int vmci_guest_probe_device(struct pci_dev *pdev,
 		vmci_write_reg(vmci_dev, PAGE_SHIFT, VMCI_GUEST_PAGE_SHIFT);
 		page_shift = vmci_read_reg(vmci_dev, VMCI_GUEST_PAGE_SHIFT);
 		dev_info(&pdev->dev, "Using page shift %d\n", page_shift);
+
+		/* Configure the high order parts of the data in/out buffers. */
+		vmci_write_reg(vmci_dev, upper_32_bits(vmci_dev->data_buffer_base),
+			       VMCI_DATA_IN_HIGH_ADDR);
+		vmci_write_reg(vmci_dev, upper_32_bits(vmci_dev->tx_buffer_base),
+			       VMCI_DATA_OUT_HIGH_ADDR);
 	}
 
 	/* Set up global device so that we can start sending datagrams */
@@ -755,8 +804,8 @@ static int vmci_guest_probe_device(struct pci_dev *pdev,
 	vmci_dev_g = NULL;
 	spin_unlock_irq(&vmci_dev_spinlock);
 
-err_free_data_buffer:
-	vfree(vmci_dev->data_buffer);
+err_free_data_buffers:
+	vmci_free_dg_buffers(vmci_dev);
 
 	/* The rest are managed resources and will be freed by PCI core */
 	return error;
@@ -814,7 +863,10 @@ static void vmci_guest_remove_device(struct pci_dev *pdev)
 				  vmci_dev->notification_base);
 	}
 
-	vfree(vmci_dev->data_buffer);
+	vmci_free_dg_buffers(vmci_dev);
+
+	if (vmci_dev->mmio_base != NULL)
+		pci_iounmap(pdev, vmci_dev->mmio_base);
 
 	/* The rest are managed resources and will be freed by PCI core */
 }
diff --git a/include/linux/vmw_vmci_defs.h b/include/linux/vmw_vmci_defs.h
index 2b70c024dacb..8bc37d8244a8 100644
--- a/include/linux/vmw_vmci_defs.h
+++ b/include/linux/vmw_vmci_defs.h
@@ -21,6 +21,10 @@
 #define VMCI_CAPS_ADDR          0x18
 #define VMCI_RESULT_LOW_ADDR    0x1c
 #define VMCI_RESULT_HIGH_ADDR   0x20
+#define VMCI_DATA_OUT_LOW_ADDR  0x24
+#define VMCI_DATA_OUT_HIGH_ADDR 0x28
+#define VMCI_DATA_IN_LOW_ADDR   0x2c
+#define VMCI_DATA_IN_HIGH_ADDR  0x30
 #define VMCI_GUEST_PAGE_SHIFT   0x34
 
 /* Max number of devices. */
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
