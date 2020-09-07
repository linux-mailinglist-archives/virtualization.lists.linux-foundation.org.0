Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D1E25FB51
	for <lists.virtualization@lfdr.de>; Mon,  7 Sep 2020 15:27:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CA79086126;
	Mon,  7 Sep 2020 13:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20ld1PVV9oIC; Mon,  7 Sep 2020 13:27:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C110D86109;
	Mon,  7 Sep 2020 13:27:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8F6DC0859;
	Mon,  7 Sep 2020 13:27:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD9FAC0051
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 940C7867BD
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LwU4FBlhR0AF
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:27:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 92C70867B7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:27:47 +0000 (UTC)
Received: from cap.home.8bytes.org (p549add56.dip0.t-ipconnect.de
 [84.154.221.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 298771017;
 Mon,  7 Sep 2020 15:17:04 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v7 43/72] x86/sev-es: Adjust #VC IST Stack on entering NMI
 handler
Date: Mon,  7 Sep 2020 15:15:44 +0200
Message-Id: <20200907131613.12703-44-joro@8bytes.org>
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

When an NMI hits in the #VC handler entry code before it switched to
another stack, any subsequent #VC exception in the NMI code-path will
overwrite the interrupted #VC handlers stack.

Make sure this doesn't happen by  explicitly adjusting the #VC IST entry
in the NMI handler for the time in can cause #VC exceptions.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/sev-es.h | 19 +++++++++++++
 arch/x86/kernel/nmi.c         |  9 ++++++
 arch/x86/kernel/sev-es.c      | 53 +++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/arch/x86/include/asm/sev-es.h b/arch/x86/include/asm/sev-es.h
index 9fbeedaa66ee..59176e8c6b81 100644
--- a/arch/x86/include/asm/sev-es.h
+++ b/arch/x86/include/asm/sev-es.h
@@ -78,4 +78,23 @@ extern void vc_no_ghcb(void);
 extern void vc_boot_ghcb(void);
 extern bool handle_vc_boot_ghcb(struct pt_regs *regs);
 
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+extern struct static_key_false sev_es_enable_key;
+extern void __sev_es_ist_enter(struct pt_regs *regs);
+extern void __sev_es_ist_exit(void);
+static __always_inline void sev_es_ist_enter(struct pt_regs *regs)
+{
+	if (static_branch_unlikely(&sev_es_enable_key))
+		__sev_es_ist_enter(regs);
+}
+static __always_inline void sev_es_ist_exit(void)
+{
+	if (static_branch_unlikely(&sev_es_enable_key))
+		__sev_es_ist_exit();
+}
+#else
+static inline void sev_es_ist_enter(struct pt_regs *regs) { }
+static inline void sev_es_ist_exit(void) { }
+#endif
+
 #endif
diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 4fc9954a9560..5859cec774a4 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -33,6 +33,7 @@
 #include <asm/reboot.h>
 #include <asm/cache.h>
 #include <asm/nospec-branch.h>
+#include <asm/sev-es.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/nmi.h>
@@ -488,6 +489,12 @@ DEFINE_IDTENTRY_RAW(exc_nmi)
 	this_cpu_write(nmi_cr2, read_cr2());
 nmi_restart:
 
+	/*
+	 * Needs to happen before DR7 is accessed, because the hypervisor can
+	 * intercept DR7 reads/writes, turings those into #VC exceptions.
+	 */
+	sev_es_ist_enter(regs);
+
 	this_cpu_write(nmi_dr7, local_db_save());
 
 	irq_state = idtentry_enter_nmi(regs);
@@ -501,6 +508,8 @@ DEFINE_IDTENTRY_RAW(exc_nmi)
 
 	local_db_restore(this_cpu_read(nmi_dr7));
 
+	sev_es_ist_exit();
+
 	if (unlikely(this_cpu_read(nmi_cr2) != read_cr2()))
 		write_cr2(this_cpu_read(nmi_cr2));
 	if (this_cpu_dec_return(nmi_state))
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 5541788420ce..69c55f0fdf6a 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -51,6 +51,7 @@ struct sev_es_runtime_data {
 };
 
 static DEFINE_PER_CPU(struct sev_es_runtime_data*, runtime_data);
+DEFINE_STATIC_KEY_FALSE(sev_es_enable_key);
 
 static void __init setup_vc_stacks(int cpu)
 {
@@ -73,6 +74,55 @@ static void __init setup_vc_stacks(int cpu)
 	cea_set_pte((void *)vaddr, pa, PAGE_KERNEL);
 }
 
+static __always_inline bool on_vc_stack(unsigned long sp)
+{
+	return ((sp >= __this_cpu_ist_bottom_va(VC)) && (sp < __this_cpu_ist_top_va(VC)));
+}
+
+/*
+ * This function handles the case when an NM is raised in the #VC exception
+ * handler entry code. In this case the IST entry for #VC must be adjusted, so
+ * that any subsequent #VC exception will not overwrite the stack contents of the
+ * interrupted #VC handler.
+ *
+ * The IST entry is adjusted unconditionally so that it can be also be
+ * unconditionally adjusted back in sev_es_ist_exit(). Otherwise a nested
+ * sev_es_ist_exit() call may adjust back the IST entry too early.
+ */
+void noinstr __sev_es_ist_enter(struct pt_regs *regs)
+{
+	unsigned long old_ist, new_ist;
+
+	/* Read old IST entry */
+	old_ist = __this_cpu_read(cpu_tss_rw.x86_tss.ist[IST_INDEX_VC]);
+
+	/* Make room on the IST stack */
+	if (on_vc_stack(regs->sp))
+		new_ist = ALIGN_DOWN(regs->sp, 8) - sizeof(old_ist);
+	else
+		new_ist = old_ist - sizeof(old_ist);
+
+	/* Store old IST entry */
+	*(unsigned long *)new_ist = old_ist;
+
+	/* Set new IST entry */
+	this_cpu_write(cpu_tss_rw.x86_tss.ist[IST_INDEX_VC], new_ist);
+}
+
+void noinstr __sev_es_ist_exit(void)
+{
+	unsigned long ist;
+
+	/* Read IST entry */
+	ist = __this_cpu_read(cpu_tss_rw.x86_tss.ist[IST_INDEX_VC]);
+
+	if (WARN_ON(ist == __this_cpu_ist_top_va(VC)))
+		return;
+
+	/* Read back old IST entry and write it to the TSS */
+	this_cpu_write(cpu_tss_rw.x86_tss.ist[IST_INDEX_VC], *(unsigned long *)ist);
+}
+
 /* Needed in vc_early_forward_exception */
 void do_early_exception(struct pt_regs *regs, int trapnr);
 
@@ -277,6 +327,9 @@ void __init sev_es_init_vc_handling(void)
 	if (!sev_es_active())
 		return;
 
+	/* Enable SEV-ES special handling */
+	static_branch_enable(&sev_es_enable_key);
+
 	/* Initialize per-cpu GHCB pages */
 	for_each_possible_cpu(cpu) {
 		alloc_runtime_data(cpu);
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
