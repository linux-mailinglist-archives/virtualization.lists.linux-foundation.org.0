Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2C225FB5D
	for <lists.virtualization@lfdr.de>; Mon,  7 Sep 2020 15:28:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9AB5086211;
	Mon,  7 Sep 2020 13:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrKanG8T4Nx6; Mon,  7 Sep 2020 13:28:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C3C9D86222;
	Mon,  7 Sep 2020 13:27:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E94EC0051;
	Mon,  7 Sep 2020 13:27:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B92C5C0894
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 96134860D2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5gBXjhzMXYc
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:27:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6F085860AE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:27:49 +0000 (UTC)
Received: from cap.home.8bytes.org (p549add56.dip0.t-ipconnect.de
 [84.154.221.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id C630B3AAA;
 Mon,  7 Sep 2020 15:17:17 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v7 67/72] x86/smpboot: Load TSS and getcpu GDT entry before
 loading IDT
Date: Mon,  7 Sep 2020 15:16:08 +0200
Message-Id: <20200907131613.12703-68-joro@8bytes.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907131613.12703-1-joro@8bytes.org>
References: <20200907131613.12703-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Joerg Roedel <jroedel@suse.de>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

From: Joerg Roedel <jroedel@suse.de>

The IDT on 64bit contains vectors which use paranoid_entry() and/or IST
stacks. To make these vectors work the TSS and the getcpu GDT entry need
to be set up before the IDT is loaded.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/processor.h |  1 +
 arch/x86/kernel/cpu/common.c     | 23 +++++++++++++++++++++++
 arch/x86/kernel/smpboot.c        |  2 +-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index d8a82e650810..5ac507586769 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -696,6 +696,7 @@ extern void load_direct_gdt(int);
 extern void load_fixmap_gdt(int);
 extern void load_percpu_segment(int);
 extern void cpu_init(void);
+extern void cpu_init_exception_handling(void);
 extern void cr4_init(void);
 
 static inline unsigned long get_debugctlmsr(void)
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 1d65365363a1..a9527c0c38fb 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1854,6 +1854,29 @@ static inline void tss_setup_io_bitmap(struct tss_struct *tss)
 #endif
 }
 
+/*
+ * Setup everything needed to handle exceptions from the IDT, including the IST
+ * exceptions which use paranoid_entry()
+ */
+void cpu_init_exception_handling(void)
+{
+	struct tss_struct *tss = this_cpu_ptr(&cpu_tss_rw);
+	int cpu = raw_smp_processor_id();
+
+	/* paranoid_entry() gets the CPU number from the GDT */
+	setup_getcpu(cpu);
+
+	/* IST vectors need TSS to be set up. */
+	tss_setup_ist(tss);
+	tss_setup_io_bitmap(tss);
+	set_tss_desc(cpu, &get_cpu_entry_area(cpu)->tss.x86_tss);
+
+	load_TR_desc();
+
+	/* Finally load the IDT */
+	load_current_idt();
+}
+
 /*
  * cpu_init() initializes state that is per-CPU. Some data is already
  * initialized (naturally) in the bootstrap process, such as the GDT
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index f5ef689dd62a..de776b2e6046 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -227,7 +227,7 @@ static void notrace start_secondary(void *unused)
 	load_cr3(swapper_pg_dir);
 	__flush_tlb_all();
 #endif
-	load_current_idt();
+	cpu_init_exception_handling();
 	cpu_init();
 	x86_cpuinit.early_percpu_clock_init();
 	preempt_disable();
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
