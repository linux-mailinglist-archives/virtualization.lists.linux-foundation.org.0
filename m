Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D02501BFB
	for <lists.virtualization@lfdr.de>; Thu, 14 Apr 2022 21:33:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AD154182F;
	Thu, 14 Apr 2022 19:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IgrIOzRUpHLj; Thu, 14 Apr 2022 19:33:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E245E41867;
	Thu, 14 Apr 2022 19:33:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59928C0085;
	Thu, 14 Apr 2022 19:33:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C374C002C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Apr 2022 19:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49CE341839
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Apr 2022 19:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWjK_v3cL3Yq
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Apr 2022 19:33:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::607])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6B934182F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Apr 2022 19:33:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kp7rIgvr9aW/lKdO87HlZzuXysNBS2VXfiphmlsmIK8uA5oFqqJbvE1KWhRzXtBS34KSxnM1JfLZAVHQ6qgZR9mc8bn77o6y9QRaUgcNCmQo579SANybYj3BO7aZnVbzdYjZNlL+tp9b03GSiWnNlRjgDSY/68UPyG4bW5PU8NncUZv/2o5S3VfX44PCmA41Fggb2bOGf9AWK+LRUVj6wT3mQ+xkj366Q/+SftEjKi7CJL+vbFj/4BBL2oYssPNwTwPz198cCVlnqDSEpVMyAGFiCDJqkVGYmD3KxROPEHOEPYHojcLEN4GplrNLgrqQJexJ5SV+IwdbBwiJB1Qf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1G4mHZc6JVwHuJ+0qp0fVcHtrmqU2RBILrTbC6Np7Vo=;
 b=QEEMgxRYNG248apBdgUPVLZzEZbZ+xx84ugRjDseELPJtUl/TxZctqi0ufSZA27OqnOpUUeiKCRbskhceHS+bbi/wZNewcJcjdftHXsluAVBfi6j+hZVOx1IGfczVGLIngQdsp4uAT1t2l+gIT11fDWJOFybMXljjg1aoNr7+CYmOp/uBLTOhtTmJvry7KCo20Oz5MhQ6ZpbcK8ee+ppX2VGCBZXQU+RBWvhPAxPo3zDBx8ITh3Id5+bWYoy9S6MFkwyAt+K9gguM2qlwZwGfMe30vwsI38CnE/8CxyxownTP2TX1758P9fnYv4nVObLgOGysWiLo+8dIWRtmydipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1G4mHZc6JVwHuJ+0qp0fVcHtrmqU2RBILrTbC6Np7Vo=;
 b=f9++CNvoHiLkNz4NufW/KfX85gXnV4Hm53wbb6hbCERwG79Oh/LVc00iah7aRYokwHwN6x54AqNC68sQL87sRsuq3COG9CIXUC4fyFPjurvRwV6VutNDx+AiUYwYxJr3TkqwHnOJXLRsE5KyyP67jy02DVhTLIaGoLyp0swJmzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from BYAPR05MB3960.namprd05.prod.outlook.com (2603:10b6:a02:88::12)
 by MN2PR05MB6013.namprd05.prod.outlook.com (2603:10b6:208:d0::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 19:33:34 +0000
Received: from BYAPR05MB3960.namprd05.prod.outlook.com
 ([fe80::41ca:85a3:ec90:bf6f]) by BYAPR05MB3960.namprd05.prod.outlook.com
 ([fe80::41ca:85a3:ec90:bf6f%3]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 19:33:34 +0000
From: vdasa@vmware.com
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] VMCI: Add support for ARM64
Date: Thu, 14 Apr 2022 12:33:16 -0700
Message-Id: <20220414193316.14356-1-vdasa@vmware.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: BY5PR20CA0012.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::25) To BYAPR05MB3960.namprd05.prod.outlook.com
 (2603:10b6:a02:88::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 983c37f0-c80a-4a7b-a719-08da1e4da9d3
X-MS-TrafficTypeDiagnostic: MN2PR05MB6013:EE_
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS: <MN2PR05MB6013AC74A2F05F13053FD580CEEF9@MN2PR05MB6013.namprd05.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BhNUFOk96BCDomlEmabRs/7LTvWsfv41r9ne2IGRfBtFEWuZJp2MxXTWRyUn7u0rsu7JKjzzpPqJTKUj7NDcJw0RkmstCxqckmEkZFq47ADyxMt4AB7VcgZwCgLbwZSuYGOTog+1JX3HOYOzzPy6pGUlg1amnr1w0at+xnVpsvuAhSDUJ2IoUAWEubMNcaOl09Sb/Rbv98mHQMATlq46HicUIrGD0JysWRM8iICBqc+PZm4EAk4yBCqtQGZ8wJCcWPcMTKfch/jSFBXjYUwkB1UX4YzumFjKVUeTsQqXkHq4BpMGRmzU6hWCD9UCK9W/Ht7ky9RizRPPrnLubZ9v35vvlAFqA6/lLBHTwecEA7yHPJlVODVBSbrE1PECSSY9YWAJeuWPzxhvIaIO/jS1DkxZGxMRAdep80XvrGnVUOlXv9SgncPYGPnIPdU/yPGjBkAjeqULDEwh87nnMryeMafz5SL3DVmmh7w4GFQM1SCx2fJd0FIt1hxKYGCfv1CMQQFZPpdBl3uHz9ARALtVBx0Ppv+EQGlmEfZHUqF2h5YM6AX+J7V00rEfkaoQZs2XhQhJDVw5h99Lmt/noZo7TDPBBMLnQYfEVsu5iFp4aoO2OWXid7uwqDCvI4q43ZXoLGa4G4W10RY9tr0F2/Vq3kwk/Gv6i24GlptK9fvTONqZ/DvTO0lC7+n7auI6nYZqkPpLWG7QtNAhtmjsoR6ORQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB3960.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8676002)(86362001)(316002)(186003)(26005)(66476007)(6486002)(2906002)(6506007)(54906003)(107886003)(66946007)(9686003)(6666004)(508600001)(83380400001)(5660300002)(6512007)(1076003)(36756003)(8936002)(38100700002)(2616005)(66556008)(52116002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ea3ZUTc31gtGhsxaaykyekCh4lw1g1hy8oD6P+zDKQ2G+W/WpDlPckHyhUCl?=
 =?us-ascii?Q?7p9CgJsurxxAWS5zh7UjcuKzLtv6nddOH+0OfbqGl1KFM7etOSHUET3njdgY?=
 =?us-ascii?Q?pboPwBxPGiecB6G/j9Q5fvWxnV1mWF9BQSsPW+ggkuAfXwIJedCS2sSpBQlT?=
 =?us-ascii?Q?2IBPbjaUpy4G7DS3j0F8MG2ZKPsgW0Sk/QP9UjIB6tBXIgtcca4AWpevISGn?=
 =?us-ascii?Q?9erB8MUsqlI28DTgarTqUl4wvTqdXohwmG/2AiS1rxRRyyyAOUfp4o/xxsee?=
 =?us-ascii?Q?t2o9hjQ79w2XWf7F+wmCLGKEr/mtoZ8F3axtOezkIEd8rFWlmOY1U7GUuQXk?=
 =?us-ascii?Q?1SXF1htVK2TQqxDanCrxo6Vf8jYMvlT0Cl1dhy2k4hPy06DBoUE/pZXjhpRx?=
 =?us-ascii?Q?ZJcsnQgoP2hFcDV3lXPjpHT/LeErU849vzQVc9ktkWpaitrks4OtDbid/ZfM?=
 =?us-ascii?Q?P1lPkd4QNc+OhLB7+WKbG6vD9vOi/iLZQXq2G7PXyoOGXv8zK5myDfNK59rG?=
 =?us-ascii?Q?Jj9zFKtwh0wzhWzzwfwSebCql7fEHAKENDXq5EGUao+k4wh5d3ck6xVq/Rf6?=
 =?us-ascii?Q?2g/w/GfEnb9n2br0LgjGyWQ5mt9OA+apCYMacrIjKG5xZxahqc83uAoD8cyh?=
 =?us-ascii?Q?GYAaWEoUA0lFcxI5KB2lqEq3T/aGionx/47mtnTmX+m8UegcYjFMAuD3IciE?=
 =?us-ascii?Q?NCK999O+Y3i5JzUb7H+L/arcp/TiHW8XPBtKLFSuEALOvN+W+GI5Z1it/gmm?=
 =?us-ascii?Q?OWzdP0sLEKe0mfT0WlZpQYteAW2Yysbb81fE18Stm9eZLDLswccEhpZL1W5M?=
 =?us-ascii?Q?eDeWKOGozJ5+OArKIz10DCiqezKvU2WpzLlfYEscziR8UxzN0YOxErwaYsaF?=
 =?us-ascii?Q?qWXscfSwhcfYMkHBLlzk29z5sWvjg/QpQobvZWcSacxwHX0tr3z+hzpjAQb4?=
 =?us-ascii?Q?73MKbHfrrraYObqzl3qLwpEi0XkO7J730T0d9Rf8YPU9I1I3R+WCC2qQ0v0N?=
 =?us-ascii?Q?3LPUtIzNncNDa5+q7+a8vYNiFrEVsyyUUEUSVUJiLaAwFEMn1DmiCR7loEnj?=
 =?us-ascii?Q?b0HR2aE7b6LoQ0WY7XE71nenEQc5YUdsNLEHLFYo8U8IOmD72e5DaX1KBjMZ?=
 =?us-ascii?Q?42FNmbgg61x0SxBmUYjnFHa6HUNHZ1ksPdoZvD2paMU1qfe5VdYwHV7Yqryj?=
 =?us-ascii?Q?khG49R03gnOByr30lDRxtfw8iY9MzFd/uq3TUZZ17g9yZ291IURlYWZgLZ2i?=
 =?us-ascii?Q?/iFXiNziY0R9SNiOf1wyxELKTBaprw5e87lf5SJRcz+zjeRwCxDPcn1Ydgnn?=
 =?us-ascii?Q?w5LlBX6YGCAm8yL0QS2qVS66Wiy7PPkr/PGS9aDl4qz3J811dfTbvl07itDx?=
 =?us-ascii?Q?mdDn7+N7kwWx47RZlhiyFQS2qddW61Ta0GOzyeQq7tOGbx/+ZX6IlditxORi?=
 =?us-ascii?Q?KekW7Kpxx1hFr73BNKg5b3Oz3xhCcuEw/DAGN/BI1ouYl3C1QRJdEcvNmCvR?=
 =?us-ascii?Q?MLeZmQSmGW9u4O4m3WKw799jgar0VOD4GypsG8nAcS9UyP6A2eVxjrZ7C+s0?=
 =?us-ascii?Q?+dxlcBipxgSuD0WDjfCrzyYawcC4SltM+uwUrdZYJSy/rovsBUAVM0/Wbayq?=
 =?us-ascii?Q?7bLRr0hylmGA8osEqi05MYcYZLsZSNickhhfcA0dLCy+/zcee0ZEV4gYoun6?=
 =?us-ascii?Q?Cl17nI3/cU5rloDSwsbacG6jATMG1BuBWgyybIyrih7Jkyr30PD3D5YgU+LU?=
 =?us-ascii?Q?bW8chdOuEQ=3D=3D?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983c37f0-c80a-4a7b-a719-08da1e4da9d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB3960.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 19:33:34.0006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlLDIxJ8PmNzGogoVL0qr6YwlHpw1kIGpZTZBmw0ySlp0HkA46pcUb5JJzBCTG3cQ+Cy/MOHlcfsONTMxrFMCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6013
Cc: pv-drivers@vmware.com, linux-kernel-review@vmware.com,
 Cyprien Laplace <claplace@vmware.com>, Vishnu Dasa <vdasa@vmware.com>,
 Bryan Tan <bryantan@vmware.com>
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
Reply-To: vdasa@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Vishnu Dasa <vdasa@vmware.com>

Add support for ARM64 architecture so that the driver can now be built
and VMCI device can be used.

Update Kconfig file to allow the driver to be built on ARM64 as well.
Fail vmci_guest_probe_device() on ARM64 if the device does not support
MMIO register access.  Lastly, add virtualization specific barriers
which map to actual memory barrier instructions on ARM64, because it
is required in case of ARM64 for queuepair (de)queuing.

Reviewed-by: Bryan Tan <bryantan@vmware.com>
Reviewed-by: Cyprien Laplace <claplace@vmware.com>
Signed-off-by: Vishnu Dasa <vdasa@vmware.com>
---
 drivers/misc/vmw_vmci/Kconfig           |  2 +-
 drivers/misc/vmw_vmci/vmci_guest.c      |  4 ++++
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 12 ++++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/vmw_vmci/Kconfig b/drivers/misc/vmw_vmci/Kconfig
index 605794aadf11..b6d4d7fd686a 100644
--- a/drivers/misc/vmw_vmci/Kconfig
+++ b/drivers/misc/vmw_vmci/Kconfig
@@ -5,7 +5,7 @@
 
 config VMWARE_VMCI
 	tristate "VMware VMCI Driver"
-	depends on X86 && PCI
+	depends on (X86 || ARM64) && !CPU_BIG_ENDIAN && PCI
 	help
 	  This is VMware's Virtual Machine Communication Interface.  It enables
 	  high-speed communication between host and guest in a virtual
diff --git a/drivers/misc/vmw_vmci/vmci_guest.c b/drivers/misc/vmw_vmci/vmci_guest.c
index 57a6157209a1..aa7b05de97dd 100644
--- a/drivers/misc/vmw_vmci/vmci_guest.c
+++ b/drivers/misc/vmw_vmci/vmci_guest.c
@@ -614,6 +614,10 @@ static int vmci_guest_probe_device(struct pci_dev *pdev,
 	}
 
 	if (!mmio_base) {
+		if (IS_ENABLED(CONFIG_ARM64)) {
+			dev_err(&pdev->dev, "MMIO base is invalid\n");
+			return -ENXIO;
+		}
 		error = pcim_iomap_regions(pdev, BIT(0), KBUILD_MODNAME);
 		if (error) {
 			dev_err(&pdev->dev, "Failed to reserve/map IO regions\n");
diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index 94ebf7f3fd58..8f2de1893245 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -2577,6 +2577,12 @@ static ssize_t qp_enqueue_locked(struct vmci_queue *produce_q,
 	if (result < VMCI_SUCCESS)
 		return result;
 
+	/*
+	 * This virt_wmb() ensures that data written to the queue
+	 * is observable before the new producer_tail is.
+	 */
+	virt_wmb();
+
 	vmci_q_header_add_producer_tail(produce_q->q_header, written,
 					produce_q_size);
 	return written;
@@ -2620,6 +2626,12 @@ static ssize_t qp_dequeue_locked(struct vmci_queue *produce_q,
 	if (buf_ready < VMCI_SUCCESS)
 		return (ssize_t) buf_ready;
 
+	/*
+	 * This virt_rmb() ensures that data from the queue will be read
+	 * after we have determined how much is ready to be consumed.
+	 */
+	virt_rmb();
+
 	read = (size_t) (buf_ready > buf_size ? buf_size : buf_ready);
 	head = vmci_q_header_consumer_head(produce_q->q_header);
 	if (likely(head + read < consume_q_size)) {
-- 
2.35.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
