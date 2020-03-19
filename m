Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BF118AF38
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:15:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DD05D86B67;
	Thu, 19 Mar 2020 09:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhnzf-pq3oJh; Thu, 19 Mar 2020 09:15:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F2EE86B4E;
	Thu, 19 Mar 2020 09:15:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24388C07FF;
	Thu, 19 Mar 2020 09:15:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E5CBC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 77D4586838
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wOGKhdlGqtC2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1F34587D6D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:40 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 08C9080A; Thu, 19 Mar 2020 10:14:23 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 41/70] x86/sev-es: Add Runtime #VC Exception Handler
Date: Thu, 19 Mar 2020 10:13:38 +0100
Message-Id: <20200319091407.1481-42-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319091407.1481-1-joro@8bytes.org>
References: <20200319091407.1481-1-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Tom Lendacky <thomas.lendacky@amd.com>

Add the handler for #VC exceptions invoked at runtime.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/entry/entry_64.S    |  4 ++
 arch/x86/include/asm/traps.h |  7 ++++
 arch/x86/kernel/idt.c        |  4 +-
 arch/x86/kernel/sev-es.c     | 77 +++++++++++++++++++++++++++++++++++-
 4 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index f2bb91e87877..729876d368c5 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -1210,6 +1210,10 @@ idtentry async_page_fault	do_async_page_fault	has_error_code=1	read_cr2=1
 idtentry machine_check		do_mce			has_error_code=0	paranoid=1
 #endif
 
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+idtentry vmm_communication     do_vmm_communication    has_error_code=1
+#endif
+
 /*
  * Save all registers in pt_regs, and switch gs if needed.
  * Use slow, but surefire "are we in kernel?" check.
diff --git a/arch/x86/include/asm/traps.h b/arch/x86/include/asm/traps.h
index 2aa786484bb1..1be25c065698 100644
--- a/arch/x86/include/asm/traps.h
+++ b/arch/x86/include/asm/traps.h
@@ -35,6 +35,9 @@ asmlinkage void alignment_check(void);
 #ifdef CONFIG_X86_MCE
 asmlinkage void machine_check(void);
 #endif /* CONFIG_X86_MCE */
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+asmlinkage void vmm_communication(void);
+#endif
 asmlinkage void simd_coprocessor_error(void);
 
 #if defined(CONFIG_X86_64) && defined(CONFIG_XEN_PV)
@@ -93,6 +96,10 @@ dotraplinkage void do_alignment_check(struct pt_regs *regs, long error_code);
 dotraplinkage void do_machine_check(struct pt_regs *regs, long error_code);
 #endif
 dotraplinkage void do_simd_coprocessor_error(struct pt_regs *regs, long error_code);
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+dotraplinkage void do_vmm_communication_error(struct pt_regs *regs,
+					      long error_code);
+#endif
 #ifdef CONFIG_X86_32
 dotraplinkage void do_iret_error(struct pt_regs *regs, long error_code);
 #endif
diff --git a/arch/x86/kernel/idt.c b/arch/x86/kernel/idt.c
index 135d208a2d38..25fa8ba70993 100644
--- a/arch/x86/kernel/idt.c
+++ b/arch/x86/kernel/idt.c
@@ -88,8 +88,10 @@ static const __initconst struct idt_data def_idts[] = {
 #ifdef CONFIG_X86_MCE
 	INTG(X86_TRAP_MC,		&machine_check),
 #endif
-
 	SYSG(X86_TRAP_OF,		overflow),
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+	INTG(X86_TRAP_VC,               vmm_communication),
+#endif
 #if defined(CONFIG_IA32_EMULATION)
 	SYSG(IA32_SYSCALL_VECTOR,	entry_INT80_compat),
 #elif defined(CONFIG_X86_32)
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 4bf5286310a0..97241d2f0f70 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -20,7 +20,7 @@
 #include <asm/insn-eval.h>
 #include <asm/fpu/internal.h>
 #include <asm/processor.h>
-#include <asm/trap_defs.h>
+#include <asm/traps.h>
 #include <asm/svm.h>
 
 /* For early boot hypervisor communication in SEV-ES enabled guests */
@@ -251,6 +251,81 @@ static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
 	return result;
 }
 
+static void vc_forward_exception(struct es_em_ctxt *ctxt)
+{
+	long error_code = ctxt->fi.error_code;
+	int trapnr = ctxt->fi.vector;
+
+	ctxt->regs->orig_ax = ctxt->fi.error_code;
+
+	switch (trapnr) {
+	case X86_TRAP_GP:
+		do_general_protection(ctxt->regs, error_code);
+		break;
+	case X86_TRAP_UD:
+		do_invalid_op(ctxt->regs, 0);
+		break;
+	default:
+		BUG();
+	}
+}
+
+dotraplinkage void do_vmm_communication(struct pt_regs *regs, unsigned long exit_code)
+{
+	struct es_em_ctxt ctxt;
+	enum es_result result;
+	struct ghcb *ghcb;
+
+	/*
+	 * This is invoked through an interrupt gate, so IRQs are disabled. The
+	 * code below might walk page-tables for user or kernel addresses, so
+	 * keep the IRQs disabled to protect us against concurrent TLB flushes.
+	 */
+
+	ghcb = (struct ghcb *)this_cpu_ptr(ghcb_page);
+
+	vc_ghcb_invalidate(ghcb);
+	result = vc_init_em_ctxt(&ctxt, regs, exit_code);
+
+	if (result == ES_OK)
+		result = vc_handle_exitcode(&ctxt, ghcb, exit_code);
+
+	/* Done - now check the result */
+	switch (result) {
+	case ES_OK:
+		vc_finish_insn(&ctxt);
+		break;
+	case ES_UNSUPPORTED:
+		pr_emerg("Unsupported exit-code 0x%02lx in early #VC exception (IP: 0x%lx)\n",
+			 exit_code, regs->ip);
+		goto fail;
+	case ES_VMM_ERROR:
+		pr_emerg("PANIC: Failure in communication with VMM (exit-code 0x%02lx IP: 0x%lx)\n",
+			 exit_code, regs->ip);
+		goto fail;
+	case ES_DECODE_FAILED:
+		pr_emerg("PANIC: Failed to decode instruction (exit-code 0x%02lx IP: 0x%lx)\n",
+			 exit_code, regs->ip);
+		goto fail;
+	case ES_EXCEPTION:
+		vc_forward_exception(&ctxt);
+		break;
+	case ES_RETRY:
+		/* Nothing to do */
+		break;
+	default:
+		BUG();
+	}
+
+	return;
+
+fail:
+	show_regs(regs);
+
+	while (true)
+		halt();
+}
+
 bool __init boot_vc_exception(struct pt_regs *regs)
 {
 	unsigned long exit_code = regs->orig_ax;
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
