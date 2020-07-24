Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9F722CAA0
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 18:14:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CFC8688B4B;
	Fri, 24 Jul 2020 16:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iYa9yUjC1gsM; Fri, 24 Jul 2020 16:14:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1210A88B31;
	Fri, 24 Jul 2020 16:14:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE763C004C;
	Fri, 24 Jul 2020 16:14:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2BE9C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DE71788B31
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzOkqWwgnqc2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9D13288B2F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:28 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id A40BEFEC;
 Fri, 24 Jul 2020 18:04:37 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v5 69/75] x86/smpboot: Setup TSS for starting AP
Date: Fri, 24 Jul 2020 18:03:30 +0200
Message-Id: <20200724160336.5435-70-joro@8bytes.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724160336.5435-1-joro@8bytes.org>
References: <20200724160336.5435-1-joro@8bytes.org>
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

Set up the TSS for starting APs before they are kicked. This allows the
APs to use IST in early exception handling.

Also load the TSS early if the TSS entry in the GDT is present. This
makes sure a TSS is only loaded when it has been set up.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/processor.h |  7 ++++++
 arch/x86/kernel/cpu/common.c     | 37 +++++++++++++++++++-------------
 arch/x86/kernel/head64.c         | 11 ++++++++++
 arch/x86/kernel/head_64.S        |  5 +++++
 arch/x86/kernel/smpboot.c        |  6 ++++++
 5 files changed, 51 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 2a1f7e1d7151..c69d1eb8e504 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -761,6 +761,13 @@ extern void load_fixmap_gdt(int);
 extern void load_percpu_segment(int);
 extern void cpu_init(void);
 extern void cr4_init(void);
+extern void tss_setup(int cpu);
+
+#ifdef CONFIG_X86_64
+extern void setup_getcpu(int cpu);
+#else
+static inline void setup_getcpu(int cpu) { }
+#endif
 
 static inline unsigned long get_debugctlmsr(void)
 {
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 86efa9c207e5..ad20647c79a4 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1794,7 +1794,7 @@ static void wait_for_master_cpu(int cpu)
 }
 
 #ifdef CONFIG_X86_64
-static inline void setup_getcpu(int cpu)
+void setup_getcpu(int cpu)
 {
 	unsigned long cpudata = vdso_encode_cpunode(cpu, early_cpu_to_node(cpu));
 	struct desc_struct d = { };
@@ -1821,27 +1821,26 @@ static inline void ucode_cpu_init(int cpu)
 		load_ucode_ap();
 }
 
-static inline void tss_setup_ist(struct tss_struct *tss)
+static inline void tss_setup_ist(struct tss_struct *tss,
+				 struct cpu_entry_area *cea)
 {
 	/* Set up the per-CPU TSS IST stacks */
-	tss->x86_tss.ist[IST_INDEX_DF] = __this_cpu_ist_top_va(DF);
-	tss->x86_tss.ist[IST_INDEX_NMI] = __this_cpu_ist_top_va(NMI);
-	tss->x86_tss.ist[IST_INDEX_DB] = __this_cpu_ist_top_va(DB);
-	tss->x86_tss.ist[IST_INDEX_MCE] = __this_cpu_ist_top_va(MCE);
+	tss->x86_tss.ist[IST_INDEX_DF]  = CEA_ESTACK_TOP(&cea->estacks, DF);
+	tss->x86_tss.ist[IST_INDEX_NMI] = CEA_ESTACK_TOP(&cea->estacks, NMI);
+	tss->x86_tss.ist[IST_INDEX_DB]  = CEA_ESTACK_TOP(&cea->estacks, DB);
+	tss->x86_tss.ist[IST_INDEX_MCE] = CEA_ESTACK_TOP(&cea->estacks, MCE);
 	/* Only mapped when SEV-ES is active */
-	tss->x86_tss.ist[IST_INDEX_VC] = __this_cpu_ist_top_va(VC);
+	tss->x86_tss.ist[IST_INDEX_VC]	= CEA_ESTACK_TOP(&cea->estacks, VC);
 }
 
 #else /* CONFIG_X86_64 */
 
-static inline void setup_getcpu(int cpu) { }
-
 static inline void ucode_cpu_init(int cpu)
 {
 	show_ucode_info_early();
 }
 
-static inline void tss_setup_ist(struct tss_struct *tss) { }
+static inline void tss_setup_ist(struct tss_struct *tss, struct cpu_entry_area *cea) { }
 
 #endif /* !CONFIG_X86_64 */
 
@@ -1861,6 +1860,17 @@ static inline void tss_setup_io_bitmap(struct tss_struct *tss)
 #endif
 }
 
+void tss_setup(int cpu)
+{
+	struct tss_struct *tss = per_cpu_ptr(&cpu_tss_rw, cpu);
+	struct cpu_entry_area *cea = get_cpu_entry_area(cpu);
+
+	/* Initialize the TSS for cpu. */
+	tss_setup_ist(tss, cea);
+	tss_setup_io_bitmap(tss);
+	set_tss_desc(cpu, &cea->tss.x86_tss);
+}
+
 /*
  * cpu_init() initializes state that is per-CPU. Some data is already
  * initialized (naturally) in the bootstrap process, such as the GDT
@@ -1869,7 +1879,6 @@ static inline void tss_setup_io_bitmap(struct tss_struct *tss)
  */
 void cpu_init(void)
 {
-	struct tss_struct *tss = this_cpu_ptr(&cpu_tss_rw);
 	struct task_struct *cur = current;
 	int cpu = raw_smp_processor_id();
 
@@ -1915,10 +1924,8 @@ void cpu_init(void)
 	initialize_tlbstate_and_flush();
 	enter_lazy_tlb(&init_mm, cur);
 
-	/* Initialize the TSS. */
-	tss_setup_ist(tss);
-	tss_setup_io_bitmap(tss);
-	set_tss_desc(cpu, &get_cpu_entry_area(cpu)->tss.x86_tss);
+	/* Initialize the TSS - Only needed on the boot-CPU */
+	tss_setup(cpu);
 
 	load_TR_desc();
 	/*
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index ce2d8284edb9..b26a7f1bd6fe 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -545,3 +545,14 @@ void __head startup_64_setup_env(unsigned long physbase)
 	gsbase = (unsigned long)fixup_pointer((void *)initial_gs, physbase);
 	__wrmsr(MSR_GS_BASE, (u32)gsbase, (u32)(gsbase >> 32));
 }
+
+void __head early_load_tss(void)
+{
+	struct desc_struct *gdt = (struct desc_struct *)early_gdt_descr.address;
+	tss_desc tss;
+
+	/* Load TSS only if entry in GDT is marked present */
+	memcpy(&tss, &gdt[GDT_ENTRY_TSS], sizeof(tss_desc));
+	if (tss.p)
+		asm volatile("ltr %w0"::"q" (GDT_ENTRY_TSS*8));
+}
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 12bf6f11fd83..8d5bf7c568a4 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -220,6 +220,11 @@ SYM_CODE_START(secondary_startup_64)
 	 */
 	movq initial_stack(%rip), %rsp
 
+	/* Setup a TSS for early IST handlers - needs %gs to be set up */
+	pushq	%rsi
+	call	early_load_tss
+	popq	%rsi
+
 	/* Load IDT */
 	pushq	%rsi
 	call	early_load_idt
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 27aa04a95702..fb55d28332e2 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1040,6 +1040,12 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
 	/* Enable the espfix hack for this CPU */
 	init_espfix_ap(cpu);
 
+	/* Set up GDT_ENTRY_CPUNODE for early exception handling */
+	setup_getcpu(cpu);
+
+	/* Setup TSS so that AP can use IST early */
+	tss_setup(cpu);
+
 	/* So we see what's up */
 	announce_cpu(cpu, apicid);
 
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
