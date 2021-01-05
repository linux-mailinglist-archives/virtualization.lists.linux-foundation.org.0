Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B33E2EA1F5
	for <lists.virtualization@lfdr.de>; Tue,  5 Jan 2021 02:03:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 77D7E866F8;
	Tue,  5 Jan 2021 01:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id noJUHz4ug7Ii; Tue,  5 Jan 2021 01:03:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D910F86684;
	Tue,  5 Jan 2021 01:03:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B37DBC013A;
	Tue,  5 Jan 2021 01:03:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0FA1C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 01:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D3CF686F87
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 01:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ex-wlHqbBvli
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 01:03:04 +0000 (UTC)
X-Greylist: delayed 00:15:06 by SQLgrey-1.7.6
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2125786E1D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 01:03:04 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Mon, 4 Jan 2021 16:47:53 -0800
Received: from amakhalov-virtual-machine.eng.vmware.com (unknown
 [10.118.101.187])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id 0859A20355;
 Mon,  4 Jan 2021 16:47:55 -0800 (PST)
From: Alexey Makhalov <amakhalov@vmware.com>
To: <linux-kernel@vger.kernel.org>,
 <virtualization@lists.linux-foundation.org>, <hpa@zytor.com>, <bp@alien8.de>, 
 <mingo@redhat.com>, <tglx@linutronix.de>, <pv-drivers@vmware.com>,
 <sdeep@vmware.com>
Subject: [PATCH] x86/vmware: avoid TSC recalibration
Date: Mon, 4 Jan 2021 16:47:52 -0800
Message-ID: <20210105004752.131069-1-amakhalov@vmware.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-001.vmware.com: amakhalov@vmware.com does not
 designate permitted sender hosts)
Cc: Alexey Makhalov <amakhalov@vmware.com>
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

When TSC frequency is known (retrieved from hypervisor), we should skip
TSC refined calibration by setting X86_FEATURE_TSC_KNOWN_FREQ.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
---
 arch/x86/kernel/cpu/vmware.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index c6ede3b3d302..83164110ccc5 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -378,6 +378,8 @@ static void __init vmware_set_capabilities(void)
 {
 	setup_force_cpu_cap(X86_FEATURE_CONSTANT_TSC);
 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+	if (vmware_tsc_khz)
+		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMCALL)
 		setup_force_cpu_cap(X86_FEATURE_VMCALL);
 	else if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMMCALL)
-- 
2.11.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
