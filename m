Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3DA4A73D1
	for <lists.virtualization@lfdr.de>; Wed,  2 Feb 2022 15:55:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B46C5825D3;
	Wed,  2 Feb 2022 14:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrQYUHZVPZY9; Wed,  2 Feb 2022 14:55:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 81DC183E15;
	Wed,  2 Feb 2022 14:55:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 656F2C001A;
	Wed,  2 Feb 2022 14:55:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15380C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Feb 2022 14:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D6C0405B5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Feb 2022 14:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=vmware.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wej5CgBQ1URh
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Feb 2022 14:55:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB1DF404CD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Feb 2022 14:55:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaUSbWkCxDRLAPUWyLgak8hs0g7k1+Cwafa04j0ZJyubpBtV4RdsLWUKHeUpNRlXl9K7I6cRdnGNK9PULXtdpvC95qkb4/g+JmmLHsqLh1VvNSqqaDMdxr2NOlLR1uWWmjzibQGJvHeCz9ers8LVC+to/EVO2b4le0HWcuK5aiIDDR3JiEAnfU+qsR+pK+ZcrYzOZCSMPUSGPFkG9NtSIe84YfAfQrGOoP2UvtKsGjZEvMPQUrA2AXKmjVS51aATpNwbGnCCe0gNMMVFk6cdgKPmtH4swltEWg8jas+wbeNE8Hi+udqWbS4//jx9n/IeGZrttVibrL4f1w2X6EJYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7W8TrdRp9GTsb3nOerdsmaGgiZw0iRhnUQ5vSw5s6Lw=;
 b=KgL65NDsYhJwuQPtwq7LWRXyz1t6XH8zI0lh1fZvUqDM4jn5r4IM8Uknt5flKysj8mGF5ICiLs1jihTTOD1XmX3Hk17tLGJ0l6pnrmmcmhs9TczuBtjPft8Wtf5ap6DWPyhQYsf3e7P0MZdnRsuPZVGLNc6f5xAymZie6e+BG+r810pPus+sSs6mZKC11Uc4L/gPtvy+6Qceo8TgO+RMKrj7cgcP6c1vgA3inCsNHEGKOTYngBrRAiY54r/G44X/e87+Sdgp3zTOuhBS9AnOPmjiO8oNdN8WZe4QI5gSMwHjkzf94ueqkezwCnkD7hiwNVY/47hsmSRNot32AKUecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W8TrdRp9GTsb3nOerdsmaGgiZw0iRhnUQ5vSw5s6Lw=;
 b=icqckl+jJOMjyswv1pMfUGp0NeFaXPuYaLccgXNjJsuVfEbyAVCgTPC/15Rwt7IYsEat93G7PRF/C7mdxF+xUwckfFo6GA/4M5VeuxBUM99q4tzBcQ/Y863euC6SXRmaNQgxcgm12K4xuID2U3++RO6NTYfOduUk931BkLjIM1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from BY3PR05MB8081.namprd05.prod.outlook.com (2603:10b6:a03:366::15)
 by BN6PR05MB2803.namprd05.prod.outlook.com (2603:10b6:404:2c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.5; Wed, 2 Feb
 2022 14:55:13 +0000
Received: from BY3PR05MB8081.namprd05.prod.outlook.com
 ([fe80::304c:2b94:4f26:a581]) by BY3PR05MB8081.namprd05.prod.outlook.com
 ([fe80::304c:2b94:4f26:a581%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 14:55:13 +0000
From: Jorgen Hansen <jhansen@vmware.com>
To: linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH 1/8] VMCI: dma dg: whitespace formatting change for vmci
 register defines
Date: Wed,  2 Feb 2022 06:49:03 -0800
Message-Id: <20220202144910.10349-2-jhansen@vmware.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220202144910.10349-1-jhansen@vmware.com>
References: <20220202144910.10349-1-jhansen@vmware.com>
X-ClientProxiedBy: SJ0PR03CA0362.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::7) To BY3PR05MB8081.namprd05.prod.outlook.com
 (2603:10b6:a03:366::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d77cb99-3167-44f1-b6ec-08d9e65c03e4
X-MS-TrafficTypeDiagnostic: BN6PR05MB2803:EE_
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS: <BN6PR05MB28032AC5F631AEBE960D34B9DA279@BN6PR05MB2803.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q8BDzdeaWZYknG59jbHTd0Qsuo1lpJ294FB+Ve1ZJ5z30l9gE1nvI/wQTOE1cInJ9KIyKlwl064IN+9uwh5rCg3tWoPzWADaHHWU07APuyR1s0hxQYfe/m2u9LHbjczmVry9n6CpMesKPcXbHv54oFWV+swxJtFcF2chitSa4nT+Ac5M2NAiPbzSYGXI5CN8kZLxe4CRvRVoUWKY6Tk9CgJbT/Dqdi/vy2hAAmI4u9fFHQ+itHD3WvqDUgO2T32zSIkQrQYyVnecg3TArmUSfOAwQVVxPj369HVuPfEh93P5RyQ3qs83pt4KgpkdvEUwxUMRCornfkXihW7GVBl0mYTKzAgU7334SszvR59rhntKv3DUYRxt4V0sabsZ7irPHDG7RJqoIhAxSGRiP2q7DcH396c+ZY54BImHR5/rEF0N845/PQQtFJSgV4+teCcuwgCtkjzoVf129VMrvb/xD98sOxlHPKjDCQvDm11LFs/+g8M2ETiHbAjh5RQ02AscmPdeMxn/oplhc3ot+Wn6O4N32OoK4vum83Y2eljUJx2O38HqL3ptUDixXb5LGsJOzYL/RY6Z9HoQiLPjJYTVjudfwM4E6lbBij9Qon9ye9/ArAMsg1lMONzjBAU1zzdmnfMn53AhsJEWYRk4YnV+sLR1plee3ne5YTL4/3DcNgKf3duLTCG9zsizxOh/V6d0VQNtIJbY0VF7SqCckwHplQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY3PR05MB8081.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(316002)(6512007)(38100700002)(38350700002)(5660300002)(2616005)(8676002)(8936002)(54906003)(4326008)(66476007)(66556008)(66946007)(83380400001)(107886003)(508600001)(6486002)(86362001)(1076003)(36756003)(186003)(6506007)(26005)(2906002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k/okn7eB/TticUDgMdzkqy7OUwBSjBHxSv3bQDjwibg0swRkmLHZ2XeM/FAQ?=
 =?us-ascii?Q?Y0qh2fmMuVfaE9iXkgA/y9GyXYZwYi4yiU0kPDuIYQiK8FUDU2YJwJdhCxJ9?=
 =?us-ascii?Q?Y/K6r6o68Cn08ulqs0zxNVtlDHOwF1VZqmDg5cVKafC6lM8689EyyT1SL5Ec?=
 =?us-ascii?Q?cyQ5pjJ/ZaXqQ6DjaytXfuuZrwtfFXR8n2fs60lLgozeEk5iXFdJ+4NuKMBX?=
 =?us-ascii?Q?EOT3h1MOCXhAXBcs2VaSFVxLrujM+4jROGxdQZb6aHE0mcW2zgmdBUnFg1NJ?=
 =?us-ascii?Q?hIaWfdiswt2vIDTFdQwHRRty2R0We2iytA/0NPR/Ou9wBDAwBYR5m0pxeJgi?=
 =?us-ascii?Q?IXydpGXjDcEGHtP87QsNQ8KxqgoKBFwAH37kmHkqo+rho/2PUe9MAEMoXySR?=
 =?us-ascii?Q?T/weFZhatVT2KSL2xZ/EmPhElKtcfTAXU70b+MPCBRvSnEQRnqZX6+2CJjj3?=
 =?us-ascii?Q?8nMGGjlPldqYQAcaPKEy8ceP0csjGKwMmO1ACxdqKeUm43P57STB/20CjIN3?=
 =?us-ascii?Q?AD4cnxpZCLHCUVEatFuNHFmipy5G11bdaBTvXbpQ5DLJnaJh9f0pgPfPG9Rx?=
 =?us-ascii?Q?NOrezWV2cb9LW4qmsOwz4WnoM+c2XeNClru2F6BJCqN0Wkn+NcZ9cEx2kvcI?=
 =?us-ascii?Q?prvZsLNNq78GSFHfjzjyfjONR06EssSNuUPqSCb0tin3XvFa3jjLg1HkVWrl?=
 =?us-ascii?Q?9mr5RU2w/QnBePMXpRsujfmQ+Nx4JN3/z55VzV4dbuWBTMvhlQ71zeML4pM4?=
 =?us-ascii?Q?qErqWfckRSruapc/BPa0kwvUTYZyJ50Qq1ZUEe8xpmyHRSNqbikUygoepYSM?=
 =?us-ascii?Q?I+CV27q9y7G+sODa4m5gmriGo8fPU+iKSQOpoMYarURRLqvIHqVM+wTv3L5L?=
 =?us-ascii?Q?mA51z5NosxVzvPgfbWPWFigIFGBjvUz8dUakDVTVPUtOiShIENXY2FACi65x?=
 =?us-ascii?Q?YJ9v0UEJybd9eF7xTOvhmGHtsWXJ1uv4QjLFrt2FEy3x2GadibUQXiw1ZOPC?=
 =?us-ascii?Q?diVaM7cXPleeWfPAKipFh5oJj5wBof44FyfbD+sY0lfZDN3HhmAQHtLHp8HP?=
 =?us-ascii?Q?IKuar+ZB4gUX7+tEoaHOdrqBRCKOAVn+Iqr1ljZ6unXH98PgeqBPGp1mgDGd?=
 =?us-ascii?Q?B86tnEhIuLOERIfhLJAH3f9JBX1TaU1iv0Zx8putpCovs44FDfEk1kwqvESb?=
 =?us-ascii?Q?feAFUucFpT6PCBOHVrDRX/0mVL90VOkLemn0wRtEgFLtJ1CelS+Fr+t6D66x?=
 =?us-ascii?Q?ACML91GqH6EOsIwVbXDH3UUBdN0+olURjaXEAFuFZZU9W2wRYnf7lJffHz9z?=
 =?us-ascii?Q?g/zRwJStfrYRdsDeD9uCiFyzn2gKshxyRGO6bdL+9HGHiNUj9alKHWVCK6z/?=
 =?us-ascii?Q?NuseYLi0i4OP+ILVVqrvgF22RdiwmzXWVaVl84ZVCNqw74iotDIfdKgqHcJX?=
 =?us-ascii?Q?6CuIVbEQV/jotoqwfovraS3hb5wIV98D8OjOQXdC3pjj5J783Mxz21H4ptv0?=
 =?us-ascii?Q?A3eudthpMWaA3BgzO2GMpXlzfUc7OY5MAl28sq/g5okMh7keGetwQBNN1hSS?=
 =?us-ascii?Q?BPXU6iB1QMGxedDw4mz6x2gxZJwyN0yc4rdjmu6rjye6v3mDDgSPjgMG6anm?=
 =?us-ascii?Q?jRoY0Peeu/jtkiscvCndxiw=3D?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d77cb99-3167-44f1-b6ec-08d9e65c03e4
X-MS-Exchange-CrossTenant-AuthSource: BY3PR05MB8081.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 14:55:12.9148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjGOujsPwtN4FREheUxgW8u9C/hXD12+1j0hc610O7DYDjIPNJEKzze2Xb6OPAMksGn1IaXkkc3eTT9E+0KHmg==
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

Update formatting of existing register defines in preparation for
adding additional register definitions for the VMCI device.

Reviewed-by: Vishnu Dasa <vdasa@vmware.com>
Signed-off-by: Jorgen Hansen <jhansen@vmware.com>
---
 include/linux/vmw_vmci_defs.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/vmw_vmci_defs.h b/include/linux/vmw_vmci_defs.h
index e36cb114c188..9911ecfc18ba 100644
--- a/include/linux/vmw_vmci_defs.h
+++ b/include/linux/vmw_vmci_defs.h
@@ -12,15 +12,15 @@
 #include <linux/bits.h>
 
 /* Register offsets. */
-#define VMCI_STATUS_ADDR      0x00
-#define VMCI_CONTROL_ADDR     0x04
-#define VMCI_ICR_ADDR	      0x08
-#define VMCI_IMR_ADDR         0x0c
-#define VMCI_DATA_OUT_ADDR    0x10
-#define VMCI_DATA_IN_ADDR     0x14
-#define VMCI_CAPS_ADDR        0x18
-#define VMCI_RESULT_LOW_ADDR  0x1c
-#define VMCI_RESULT_HIGH_ADDR 0x20
+#define VMCI_STATUS_ADDR        0x00
+#define VMCI_CONTROL_ADDR       0x04
+#define VMCI_ICR_ADDR           0x08
+#define VMCI_IMR_ADDR           0x0c
+#define VMCI_DATA_OUT_ADDR      0x10
+#define VMCI_DATA_IN_ADDR       0x14
+#define VMCI_CAPS_ADDR          0x18
+#define VMCI_RESULT_LOW_ADDR    0x1c
+#define VMCI_RESULT_HIGH_ADDR   0x20
 
 /* Max number of devices. */
 #define VMCI_MAX_DEVICES 1
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
