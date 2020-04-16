Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBA01AD38B
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 02:16:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0A5EF80EAE;
	Fri, 17 Apr 2020 00:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P74S7qJliRHI; Fri, 17 Apr 2020 00:16:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C329858BA;
	Fri, 17 Apr 2020 00:16:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FF32C0172;
	Fri, 17 Apr 2020 00:16:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50561C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 00:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3912A87FE9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 00:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ByyzoqXb3yt8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 00:16:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0F90087FE3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 00:16:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaeWNp4AN+9CKaKkwFLMKMOtKEWTXO7eD2h/YM81VX2EbuZn9j/O9YTqYOW2YrmWqnYKtNiy02wNIBlIiPYvQw+sx8mfZoGPBhsqO3AtbI5bv5IdR8ZGztZvlG+cNVnlq3WEIa7zzdaVDfeGej1RlaMKI2ZSkVm7lOnqVywz75CZYQss/QQcZstABuSopi51Ry+kkK1m3VbQ/nI4VxXMxbfE3jhHT4SiCX8jEJk4+I0qe/yWj0uDpL/5nuGNfsaT6graFDQ3/N7TiRSdShFyjzXTzCiNQZY2IRi9AKFGapefmYJI48WnTuUFmoQ1WucCFQFORPIDzMBxFXktR5i76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89z8afWhayviN51aOMPVFzXwSXiZzXdGjaUdEDw2wRo=;
 b=L0BzteeZ/qCKW/OiihtnnhvBAuw7fQkjbh70+ivnHzTgJCZDwypG16cjPQ5qDvlmqeyv34G9OY/+CVEDeYVBduCVhSqvQHnHhvYfgGeW0gcZWN/qyIapitLYQpodngAmsDgB7gDMcOivvbOKuJWgNFNl6gCV23WjYea2RuLqGvYukl+wYK2ovbk2LTpeD9Rum7IcS7DrEu+WDi/9iLwyedX9ZT8UqRYMGF5PnkaL8GNboYIZJWQt9JkDeM7p7szwAfsM8qxTyBH8c5f5Kzw33Jy0lYTQ0R7pKBFxYfEjUH4WWmXgQpcmTmMMDRTePjybhsA+Q21S7byhSNdhVu9N/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89z8afWhayviN51aOMPVFzXwSXiZzXdGjaUdEDw2wRo=;
 b=j1Ut1uZ3Iu12sa+0bw3QjR3tG/5oFVU4NHH2ze7BB/+6YXU/WJF6hmSOs2wJlusJWgfCCa9ZpwbVV7DR8pXbn325DTGmdJPc2FMVkF1euYgRuHJQ7gpF4NZ4w+il7psErrN5YixkysZeNSy5QmbJDzvBK1C+AkBPp5cQ6Q2wLkU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=sdeep@vmware.com; 
Received: from BYAPR05MB4408.namprd05.prod.outlook.com (2603:10b6:a02:fd::26)
 by BYAPR05MB5574.namprd05.prod.outlook.com (2603:10b6:a03:75::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.6; Thu, 16 Apr
 2020 23:44:16 +0000
Received: from BYAPR05MB4408.namprd05.prod.outlook.com
 ([fe80::cc6c:d126:929c:5215]) by BYAPR05MB4408.namprd05.prod.outlook.com
 ([fe80::cc6c:d126:929c:5215%4]) with mapi id 15.20.2921.027; Thu, 16 Apr 2020
 23:44:16 +0000
Date: Thu, 16 Apr 2020 16:45:20 -0700
From: Deep Shah <sdeep@vmware.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update PARAVIRT_OPS_INTERFACE and
 VMWARE_HYPERVISOR_INTERFACE
Message-ID: <20200416234520.GA1700@prme-mon-cfl-mlw-07>
Content-Disposition: inline
X-ClientProxiedBy: BYAPR08CA0047.namprd08.prod.outlook.com
 (2603:10b6:a03:117::24) To BYAPR05MB4408.namprd05.prod.outlook.com
 (2603:10b6:a02:fd::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prme-mon-cfl-mlw-07 (66.170.99.2) by
 BYAPR08CA0047.namprd08.prod.outlook.com (2603:10b6:a03:117::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Thu, 16 Apr 2020 23:44:15 +0000
X-Originating-IP: [66.170.99.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81ac3373-3524-4495-2d0d-08d7e26012fe
X-MS-TrafficTypeDiagnostic: BYAPR05MB5574:|BYAPR05MB5574:|BYAPR05MB5574:
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR05MB557425916288DB63F6724767C8D80@BYAPR05MB5574.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-Forefront-PRVS: 0375972289
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB4408.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(16526019)(9686003)(33656002)(316002)(66946007)(186003)(86362001)(6666004)(478600001)(26005)(66556008)(66476007)(6496006)(33716001)(8936002)(81156014)(52116002)(55016002)(4744005)(107886003)(8676002)(2906002)(6916009)(1076003)(4326008)(5660300002)(956004);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5O06tpxSio7LmHTxXMMQNUYNSvkMrV5JZpAiCYPqgkYVJHuYqKzXyICVQOvhcyfh2Pn70RExGH7ZfXO1/DEbdYWgrjA724OyR7D2YO1aeg6cxXc6/fvREyialL2tq2YrHl+F/1dd9mF69szaQWb4Nz9naZ98VEjeyaHvnUdgkdkvJfAsKYU5ANZFh07VQbI0GUGVLYAS1AY+9uPMxLrm6aw5UX8cxDaZXrdygvuo74+Ebyb04UsFG4XuNSfE0nK5s9EylHF3yzC3YmPMo7ufkojz6Dfie52S5jtnHCN6A+CiS3BdV90mpiKjgpMvFocB3F/fiAZqdANi0nzEsCqmaAqEpiM/SXBKdfziVWk7zVmCWF44+nJH30Yz04RNOWqpJb1MTCsgXeWHdEUucruq5IILikC3vbKd2pjAZC0ESXdIUc9OCccd90QfyCWh6CMx
X-MS-Exchange-AntiSpam-MessageData: kY+APFAmHpK+HJCkyB7PaqYPWv6OHOjv8eK2q8oLTG83SJm0Z1mo0JLyQd1uT/ZuA9kiomdwgxM3KD2cGz7k+1mxsBMh9W0POxp2HBpMf44Ms3/PAt0abUIMVMYA4yWDnlPoU7SrlfIEphL8d2IR3A==
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ac3373-3524-4495-2d0d-08d7e26012fe
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2020 23:44:16.2808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGQKR1kV/8DSmlaVlGPCamPPOBfDv/DQ+YEy6aNVpSoIF41z4rbJ7kHN8uQ1vsNy4G5o5yXGqRpiD4oBuTEzng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB5574
Cc: pv-drivers@vmware.com, jgross@suse.com, thellstrom@vmware.com,
 virtualization@lists.linux-foundation.org
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

Thomas Hellstrom will be handing over VMware's maintainership of these
interfaces to Deep Shah.

Signed-off-by: Deep Shah <sdeep@vmware.com>
Acked-by: Thomas Hellstrom <thellstrom@vmware.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..c9bdbb65e96b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12730,7 +12730,7 @@ F:	include/uapi/linux/ppdev.h
 
 PARAVIRT_OPS INTERFACE
 M:	Juergen Gross <jgross@suse.com>
-M:	Thomas Hellstrom <thellstrom@vmware.com>
+M:	Deep Shah <sdeep@vmware.com>
 M:	"VMware, Inc." <pv-drivers@vmware.com>
 L:	virtualization@lists.linux-foundation.org
 S:	Supported
@@ -18025,7 +18025,7 @@ S:	Maintained
 F:	drivers/misc/vmw_balloon.c
 
 VMWARE HYPERVISOR INTERFACE
-M:	Thomas Hellstrom <thellstrom@vmware.com>
+M:	Deep Shah <sdeep@vmware.com>
 M:	"VMware, Inc." <pv-drivers@vmware.com>
 L:	virtualization@lists.linux-foundation.org
 S:	Supported
-- 
2.7.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
