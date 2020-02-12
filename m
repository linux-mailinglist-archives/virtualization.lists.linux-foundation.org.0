Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 260C815B1AA
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 21:18:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AF9CF87DDE;
	Wed, 12 Feb 2020 20:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHwa9uisRuim; Wed, 12 Feb 2020 20:18:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 182C987CC9;
	Wed, 12 Feb 2020 20:18:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1341C0177;
	Wed, 12 Feb 2020 20:18:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9E20C1D88
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 83FEC86A7C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0kSASb5vyudd
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:50 +0000 (UTC)
X-Greylist: delayed 00:15:01 by SQLgrey-1.7.6
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6E39F824B0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:50 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 12 Feb 2020 12:03:46 -0800
Received: from localhost.localdomain (unknown [10.118.101.94])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 7348340771;
 Wed, 12 Feb 2020 12:03:48 -0800 (PST)
To: <x86@kernel.org>
Subject: [PATCH 2/5] x86/vmware: Remove vmware_sched_clock_setup()
Date: Wed, 12 Feb 2020 20:03:09 +0000
Message-ID: <20200212200312.2033-3-amakhalov@vmware.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20200212200312.2033-1-amakhalov@vmware.com>
References: <20200212200312.2033-1-amakhalov@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-001.vmware.com: amakhalov@vmware.com does not
 designate permitted sender hosts)
Cc: Juergen Gross <jgross@suse.com>, Alexey
 Makhalov <amakhalov@vmware.com>, Jonathan Corbet <corbet@lwn.net>, "VMware,
 Inc." <pv-drivers@vmware.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
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
From: Alexey Makhalov via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Alexey Makhalov <amakhalov@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Move cyc2ns setup logic to separate function.
This separation will allow to use cyc2ns mult/shift pair
not only for the sched_clock but also for other clocks
such as steal_clock.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>
---
 arch/x86/kernel/cpu/vmware.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index d280560fd75e..efb22fa76ba4 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -122,7 +122,7 @@ static unsigned long long notrace vmware_sched_clock(void)
 	return ns;
 }
 
-static void __init vmware_sched_clock_setup(void)
+static void __init vmware_cyc2ns_setup(void)
 {
 	struct cyc2ns_data *d = &vmware_cyc2ns;
 	unsigned long long tsc_now = rdtsc();
@@ -132,8 +132,7 @@ static void __init vmware_sched_clock_setup(void)
 	d->cyc2ns_offset = mul_u64_u32_shr(tsc_now, d->cyc2ns_mul,
 					   d->cyc2ns_shift);
 
-	pv_ops.time.sched_clock = vmware_sched_clock;
-	pr_info("using sched offset of %llu ns\n", d->cyc2ns_offset);
+	pr_info("using clock offset of %llu ns\n", d->cyc2ns_offset);
 }
 
 static void __init vmware_paravirt_ops_setup(void)
@@ -141,8 +140,14 @@ static void __init vmware_paravirt_ops_setup(void)
 	pv_info.name = "VMware hypervisor";
 	pv_ops.cpu.io_delay = paravirt_nop;
 
-	if (vmware_tsc_khz && vmw_sched_clock)
-		vmware_sched_clock_setup();
+	if (vmware_tsc_khz == 0)
+		return;
+
+	vmware_cyc2ns_setup();
+
+	if (vmw_sched_clock)
+		pv_ops.time.sched_clock = vmware_sched_clock;
+
 }
 #else
 #define vmware_paravirt_ops_setup() do {} while (0)
-- 
2.14.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
