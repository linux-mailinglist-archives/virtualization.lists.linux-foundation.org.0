Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7C03AB541
	for <lists.virtualization@lfdr.de>; Thu, 17 Jun 2021 15:55:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B799641631;
	Thu, 17 Jun 2021 13:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N8NyLSLTVlI8; Thu, 17 Jun 2021 13:55:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DEDD341630;
	Thu, 17 Jun 2021 13:55:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C0FDC0022;
	Thu, 17 Jun 2021 13:55:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51271C000B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Jun 2021 13:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 296CE60765
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Jun 2021 13:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vy1RdDIqsWSE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Jun 2021 13:55:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B64D360640
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Jun 2021 13:55:43 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 410AE387; Thu, 17 Jun 2021 15:55:40 +0200 (CEST)
Date: Thu, 17 Jun 2021 15:55:39 +0200
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v6.1 2/2] x86/sev: Split up runtime #VC handler for correct
 state tracking
Message-ID: <YMtUW2+kjQQG1Uy7@8bytes.org>
References: <20210616184913.13064-1-joro@8bytes.org>
 <20210616184913.13064-3-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616184913.13064-3-joro@8bytes.org>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, David Rientjes <rientjes@google.com>,
 Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 linux-coco@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Juergen Gross <jgross@suse.com>,
 Mike Stunes <mstunes@vmware.com>, Sean Christopherson <seanjc@google.com>,
 linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Erdem Aktas <erdemaktas@google.com>
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

Split up the #VC handler code into a from-user and a from-kernel part.
This allows clean and correct state tracking, as the #VC handler needs
to enter NMI-state when raised from kernel mode and plain IRQ state when
raised from user-mode.

Fixes: 62441a1fb532 ("x86/sev-es: Correctly track IRQ states in runtime #VC handler")
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/entry/entry_64.S       |   4 +-
 arch/x86/include/asm/idtentry.h |  29 +++----
 arch/x86/kernel/sev.c           | 148 +++++++++++++++++---------------
 3 files changed, 91 insertions(+), 90 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index a16a5294d55f..1886aaf19914 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -506,7 +506,7 @@ SYM_CODE_START(\asmsym)
 
 	movq	%rsp, %rdi		/* pt_regs pointer */
 
-	call	\cfunc
+	call	kernel_\cfunc
 
 	/*
 	 * No need to switch back to the IST stack. The current stack is either
@@ -517,7 +517,7 @@ SYM_CODE_START(\asmsym)
 
 	/* Switch to the regular task stack */
 .Lfrom_usermode_switch_stack_\@:
-	idtentry_body safe_stack_\cfunc, has_error_code=1
+	idtentry_body user_\cfunc, has_error_code=1
 
 _ASM_NOKPROBE(\asmsym)
 SYM_CODE_END(\asmsym)
diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index 73d45b0dfff2..cd9f3e304944 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -312,8 +312,8 @@ static __always_inline void __##func(struct pt_regs *regs)
  */
 #define DECLARE_IDTENTRY_VC(vector, func)				\
 	DECLARE_IDTENTRY_RAW_ERRORCODE(vector, func);			\
-	__visible noinstr void ist_##func(struct pt_regs *regs, unsigned long error_code);	\
-	__visible noinstr void safe_stack_##func(struct pt_regs *regs, unsigned long error_code)
+	__visible noinstr void kernel_##func(struct pt_regs *regs, unsigned long error_code);	\
+	__visible noinstr void   user_##func(struct pt_regs *regs, unsigned long error_code)
 
 /**
  * DEFINE_IDTENTRY_IST - Emit code for IST entry points
@@ -355,33 +355,24 @@ static __always_inline void __##func(struct pt_regs *regs)
 	DEFINE_IDTENTRY_RAW_ERRORCODE(func)
 
 /**
- * DEFINE_IDTENTRY_VC_SAFE_STACK - Emit code for VMM communication handler
-				   which runs on a safe stack.
+ * DEFINE_IDTENTRY_VC_KERNEL - Emit code for VMM communication handler
+			       when raised from kernel mode
  * @func:	Function name of the entry point
  *
  * Maps to DEFINE_IDTENTRY_RAW_ERRORCODE
  */
-#define DEFINE_IDTENTRY_VC_SAFE_STACK(func)				\
-	DEFINE_IDTENTRY_RAW_ERRORCODE(safe_stack_##func)
+#define DEFINE_IDTENTRY_VC_KERNEL(func)				\
+	DEFINE_IDTENTRY_RAW_ERRORCODE(kernel_##func)
 
 /**
- * DEFINE_IDTENTRY_VC_IST - Emit code for VMM communication handler
-			    which runs on the VC fall-back stack
+ * DEFINE_IDTENTRY_VC_USER - Emit code for VMM communication handler
+			     when raised from user mode
  * @func:	Function name of the entry point
  *
  * Maps to DEFINE_IDTENTRY_RAW_ERRORCODE
  */
-#define DEFINE_IDTENTRY_VC_IST(func)				\
-	DEFINE_IDTENTRY_RAW_ERRORCODE(ist_##func)
-
-/**
- * DEFINE_IDTENTRY_VC - Emit code for VMM communication handler
- * @func:	Function name of the entry point
- *
- * Maps to DEFINE_IDTENTRY_RAW_ERRORCODE
- */
-#define DEFINE_IDTENTRY_VC(func)					\
-	DEFINE_IDTENTRY_RAW_ERRORCODE(func)
+#define DEFINE_IDTENTRY_VC_USER(func)				\
+	DEFINE_IDTENTRY_RAW_ERRORCODE(user_##func)
 
 #else	/* CONFIG_X86_64 */
 
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index e0d12728bcb7..fe98cec2973e 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -796,7 +796,7 @@ void __init sev_es_init_vc_handling(void)
 	sev_es_setup_play_dead();
 
 	/* Secondary CPUs use the runtime #VC handler */
-	initial_vc_handler = (unsigned long)safe_stack_exc_vmm_communication;
+	initial_vc_handler = (unsigned long)kernel_exc_vmm_communication;
 }
 
 static void __init vc_early_forward_exception(struct es_em_ctxt *ctxt)
@@ -1234,14 +1234,6 @@ static enum es_result vc_handle_trap_ac(struct ghcb *ghcb,
 	return ES_EXCEPTION;
 }
 
-static __always_inline void vc_handle_trap_db(struct pt_regs *regs)
-{
-	if (user_mode(regs))
-		noist_exc_debug(regs);
-	else
-		exc_debug(regs);
-}
-
 static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
 					 struct ghcb *ghcb,
 					 unsigned long exit_code)
@@ -1337,41 +1329,13 @@ static __always_inline bool on_vc_fallback_stack(struct pt_regs *regs)
 	return (sp >= __this_cpu_ist_bottom_va(VC2) && sp < __this_cpu_ist_top_va(VC2));
 }
 
-/*
- * Main #VC exception handler. It is called when the entry code was able to
- * switch off the IST to a safe kernel stack.
- *
- * With the current implementation it is always possible to switch to a safe
- * stack because #VC exceptions only happen at known places, like intercepted
- * instructions or accesses to MMIO areas/IO ports. They can also happen with
- * code instrumentation when the hypervisor intercepts #DB, but the critical
- * paths are forbidden to be instrumented, so #DB exceptions currently also
- * only happen in safe places.
- */
-DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
+static bool vc_raw_handle_exception(struct pt_regs *regs, unsigned long error_code)
 {
-	irqentry_state_t irq_state;
 	struct ghcb_state state;
 	struct es_em_ctxt ctxt;
 	enum es_result result;
 	struct ghcb *ghcb;
-
-	/*
-	 * Handle #DB before calling into !noinstr code to avoid recursive #DB.
-	 */
-	if (error_code == SVM_EXIT_EXCP_BASE + X86_TRAP_DB) {
-		vc_handle_trap_db(regs);
-		return;
-	}
-
-	irq_state = irqentry_nmi_enter(regs);
-	instrumentation_begin();
-
-	/*
-	 * This is invoked through an interrupt gate, so IRQs are disabled. The
-	 * code below might walk page-tables for user or kernel addresses, so
-	 * keep the IRQs disabled to protect us against concurrent TLB flushes.
-	 */
+	bool ret = true;
 
 	ghcb = __sev_get_ghcb(&state);
 
@@ -1391,15 +1355,18 @@ DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
 	case ES_UNSUPPORTED:
 		pr_err_ratelimited("Unsupported exit-code 0x%02lx in #VC exception (IP: 0x%lx)\n",
 				   error_code, regs->ip);
-		goto fail;
+		ret = false;
+		break;
 	case ES_VMM_ERROR:
 		pr_err_ratelimited("Failure in communication with VMM (exit-code 0x%02lx IP: 0x%lx)\n",
 				   error_code, regs->ip);
-		goto fail;
+		ret = false;
+		break;
 	case ES_DECODE_FAILED:
 		pr_err_ratelimited("Failed to decode instruction (exit-code 0x%02lx IP: 0x%lx)\n",
 				   error_code, regs->ip);
-		goto fail;
+		ret = false;
+		break;
 	case ES_EXCEPTION:
 		vc_forward_exception(&ctxt);
 		break;
@@ -1415,24 +1382,52 @@ DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
 		BUG();
 	}
 
-out:
-	instrumentation_end();
-	irqentry_nmi_exit(regs, irq_state);
+	return ret;
+}
 
-	return;
+static __always_inline bool vc_is_db(unsigned long error_code)
+{
+	return error_code == SVM_EXIT_EXCP_BASE + X86_TRAP_DB;
+}
 
-fail:
-	if (user_mode(regs)) {
-		/*
-		 * Do not kill the machine if user-space triggered the
-		 * exception. Send SIGBUS instead and let user-space deal with
-		 * it.
-		 */
-		force_sig_fault(SIGBUS, BUS_OBJERR, (void __user *)0);
-	} else {
-		pr_emerg("PANIC: Unhandled #VC exception in kernel space (result=%d)\n",
-			 result);
+/*
+ * Runtime #VC exception handler when raised from kernel mode. Runs in NMI mode
+ * and will panic when an error happens.
+ */
+DEFINE_IDTENTRY_VC_KERNEL(exc_vmm_communication)
+{
+	irqentry_state_t irq_state;
+
+	/*
+	 * With the current implementation it is always possible to switch to a
+	 * safe stack because #VC exceptions only happen at known places, like
+	 * intercepted instructions or accesses to MMIO areas/IO ports. They can
+	 * also happen with code instrumentation when the hypervisor intercepts
+	 * #DB, but the critical paths are forbidden to be instrumented, so #DB
+	 * exceptions currently also only happen in safe places.
+	 *
+	 * But keep this here in case the noinstr annotations are violated due
+	 * to bug elsewhere.
+	 */
+	if (unlikely(on_vc_fallback_stack(regs))) {
+		instrumentation_begin();
+		panic("Can't handle #VC exception from unsupported context\n");
+		instrumentation_end();
+	}
+
+	/*
+	 * Handle #DB before calling into !noinstr code to avoid recursive #DB.
+	 */
+	if (vc_is_db(error_code)) {
+		exc_debug(regs);
+		return;
+	}
+
+	irq_state = irqentry_nmi_enter(regs);
 
+	instrumentation_begin();
+
+	if (!vc_raw_handle_exception(regs, error_code)) {
 		/* Show some debug info */
 		show_regs(regs);
 
@@ -1443,23 +1438,38 @@ DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
 		panic("Returned from Terminate-Request to Hypervisor\n");
 	}
 
-	goto out;
+	instrumentation_end();
+	irqentry_nmi_exit(regs, irq_state);
 }
 
-/* This handler runs on the #VC fall-back stack. It can cause further #VC exceptions */
-DEFINE_IDTENTRY_VC_IST(exc_vmm_communication)
+/*
+ * Runtime #VC exception handler when raised from user mode. Runs in IRQ mode
+ * and will kill the current task with SIGBUS when an error happens.
+ */
+DEFINE_IDTENTRY_VC_USER(exc_vmm_communication)
 {
+	/*
+	 * Handle #DB before calling into !noinstr code to avoid recursive #DB.
+	 */
+	if (vc_is_db(error_code)) {
+		noist_exc_debug(regs);
+		return;
+	}
+
+	irqentry_enter_from_user_mode(regs);
 	instrumentation_begin();
-	panic("Can't handle #VC exception from unsupported context\n");
-	instrumentation_end();
-}
 
-DEFINE_IDTENTRY_VC(exc_vmm_communication)
-{
-	if (likely(!on_vc_fallback_stack(regs)))
-		safe_stack_exc_vmm_communication(regs, error_code);
-	else
-		ist_exc_vmm_communication(regs, error_code);
+	if (!vc_raw_handle_exception(regs, error_code)) {
+		/*
+		 * Do not kill the machine if user-space triggered the
+		 * exception. Send SIGBUS instead and let user-space deal with
+		 * it.
+		 */
+		force_sig_fault(SIGBUS, BUS_OBJERR, (void __user *)0);
+	}
+
+	instrumentation_end();
+	irqentry_exit_to_user_mode(regs);
 }
 
 bool __init handle_vc_boot_ghcb(struct pt_regs *regs)
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
