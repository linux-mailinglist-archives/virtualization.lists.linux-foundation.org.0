Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7621221F108
	for <lists.virtualization@lfdr.de>; Tue, 14 Jul 2020 14:18:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 283AD8A43A;
	Tue, 14 Jul 2020 12:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Tp18LcMAH6Q; Tue, 14 Jul 2020 12:18:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68FE78A4CF;
	Tue, 14 Jul 2020 12:18:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F24FC0733;
	Tue, 14 Jul 2020 12:18:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74FAAC0733
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 71E8E88EAE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRPFH-jQkGqf
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A7B4E88797
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:33 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id EFDB4F95;
 Tue, 14 Jul 2020 14:10:58 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v4 47/75] x86/entry/64: Add entry code for #VC handler
Date: Tue, 14 Jul 2020 14:08:49 +0200
Message-Id: <20200714120917.11253-48-joro@8bytes.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714120917.11253-1-joro@8bytes.org>
References: <20200714120917.11253-1-joro@8bytes.org>
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

The #VC handler needs special entry code because:

	1. It runs on an IST stack

	2. It needs to be able to handle nested #VC exceptions

To make this work the entry code is implemented to pretend it doesn't
use an IST stack. When entered from user-mode or early SYSCALL entry
path it switches to the task stack, if entered from kernel-mode it
tries to switch back to the previous stack in the IRET frame.

The stack found in the IRET frame is validated first, and if it is not
safe to use it for the #VC handler, the code will switch to a
fall-back stack (the #VC2 IST stack). From there it can cause nested
exceptions again.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/entry/entry_64.S       | 78 +++++++++++++++++++++++++++++++++
 arch/x86/include/asm/idtentry.h | 44 +++++++++++++++++++
 arch/x86/include/asm/proto.h    |  1 +
 arch/x86/include/asm/traps.h    |  1 +
 arch/x86/kernel/traps.c         | 51 +++++++++++++++++++++
 5 files changed, 175 insertions(+)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index d2a00c97e53f..4168d9cd95c0 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -100,6 +100,8 @@ SYM_CODE_START(entry_SYSCALL_64)
 	SWITCH_TO_KERNEL_CR3 scratch_reg=%rsp
 	movq	PER_CPU_VAR(cpu_current_top_of_stack), %rsp
 
+SYM_INNER_LABEL(entry_SYSCALL_64_safe_stack, SYM_L_GLOBAL)
+
 	/* Construct struct pt_regs on stack */
 	pushq	$__USER_DS				/* pt_regs->ss */
 	pushq	PER_CPU_VAR(cpu_tss_rw + TSS_sp2)	/* pt_regs->sp */
@@ -448,6 +450,82 @@ _ASM_NOKPROBE(\asmsym)
 SYM_CODE_END(\asmsym)
 .endm
 
+/**
+ * idtentry_vc - Macro to generate entry stub for #VC
+ * @vector:		Vector number
+ * @asmsym:		ASM symbol for the entry point
+ * @cfunc:		C function to be called
+ *
+ * The macro emits code to set up the kernel context for #VC. The #VC handler
+ * runs on an IST stack and needs to be able to cause nested #VC exceptions.
+ *
+ * To make this work the #VC entry code tries its best to pretend it doesn't use
+ * an IST stack by switching to the task stack if coming from user-space (which
+ * includes early SYSCALL entry path) or back to the stack in the IRET frame if
+ * entered from kernel-mode.
+ *
+ * If entered from kernel-mode the return stack is validated first, and if it is
+ * not safe to use (e.g. because it points to the entry stack) the #VC handler
+ * will switch to a fall-back stack (VC2) and call a special handler function.
+ *
+ * The macro is only used for one vector, but it is planned to extend it in the
+ * future for the #HV exception.
+ */
+.macro idtentry_vc vector asmsym cfunc
+SYM_CODE_START(\asmsym)
+	UNWIND_HINT_IRET_REGS
+	ASM_CLAC
+
+	/*
+	 * If the entry is from userspace, switch stacks and treat it as
+	 * a normal entry.
+	 */
+	testb	$3, CS-ORIG_RAX(%rsp)
+	jnz	.Lfrom_usermode_switch_stack_\@
+
+	/*
+	 * paranoid_entry returns SWAPGS flag for paranoid_exit in EBX.
+	 * EBX == 0 -> SWAPGS, EBX == 1 -> no SWAPGS
+	 */
+	call	paranoid_entry
+
+	UNWIND_HINT_REGS
+
+	/*
+	 * Switch off the IST stack to make it free for nested exceptions. The
+	 * vc_switch_off_ist() function will switch back to the interrupted
+	 * stack if it is safe to do so. If not it switches to the VC fall-back
+	 * stack.
+	 */
+	movq	%rsp, %rdi		/* pt_regs pointer */
+	call	vc_switch_off_ist
+	movq	%rax, %rsp		/* Switch to new stack */
+
+	UNWIND_HINT_REGS
+
+	/* Update pt_regs */
+	movq	ORIG_RAX(%rsp), %rsi	/* get error code into 2nd argument*/
+	movq	$-1, ORIG_RAX(%rsp)	/* no syscall to restart */
+
+	movq	%rsp, %rdi		/* pt_regs pointer */
+
+	call	\cfunc
+
+	/*
+	 * No need to switch back to the IST stack. The current stack is either
+	 * identical to the stack in the IRET frame or the VC fall-back stack,
+	 * so it is definitly mapped even with PTI enabled.
+	 */
+	jmp	paranoid_exit
+	
+	/* Switch to the regular task stack */
+.Lfrom_usermode_switch_stack_\@:
+	idtentry_body safe_stack_\cfunc, has_error_code=1
+
+_ASM_NOKPROBE(\asmsym)
+SYM_CODE_END(\asmsym)
+.endm
+
 /*
  * Double fault entry. Straight paranoid. No checks from which context
  * this comes because for the espfix induced #DF this would do the wrong
diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index eeac6dc2adaa..c38494b2bb54 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -312,6 +312,18 @@ static __always_inline void __##func(struct pt_regs *regs)
 	DECLARE_IDTENTRY_RAW(vector, func);				\
 	__visible void noist_##func(struct pt_regs *regs)
 
+/**
+ * DECLARE_IDTENTRY_VC - Declare functions for the VC entry point
+ * @vector:	Vector number (ignored for C)
+ * @func:	Function name of the entry point
+ *
+ * Maps to DECLARE_IDTENTRY_RAW_ERRORCODE, but declares also the
+ * safe_stack C handler.
+ */
+#define DECLARE_IDTENTRY_VC(vector, func)				\
+	DECLARE_IDTENTRY_RAW_ERRORCODE(vector, func);			\
+	__visible noinstr void safe_stack_##func(struct pt_regs *regs, unsigned long error_code)
+
 /**
  * DEFINE_IDTENTRY_IST - Emit code for IST entry points
  * @func:	Function name of the entry point
@@ -351,6 +363,35 @@ static __always_inline void __##func(struct pt_regs *regs)
 #define DEFINE_IDTENTRY_DF(func)					\
 	DEFINE_IDTENTRY_RAW_ERRORCODE(func)
 
+/**
+ * DEFINE_IDTENTRY_VC_SAFE_STACK - Emit code for VMM communication handler
+				   which runs on a safe stack.
+ * @func:	Function name of the entry point
+ *
+ * Maps to DEFINE_IDTENTRY_RAW_ERRORCODE
+ */
+#define DEFINE_IDTENTRY_VC_SAFE_STACK(func)				\
+	DEFINE_IDTENTRY_RAW_ERRORCODE(safe_stack_##func)
+
+/**
+ * DEFINE_IDTENTRY_VC_IST - Emit code for VMM communication handler
+			    which runs on the VC fall-back stack
+ * @func:	Function name of the entry point
+ *
+ * Maps to DEFINE_IDTENTRY_RAW_ERRORCODE
+ */
+#define DEFINE_IDTENTRY_VC_IST(func)				\
+	DEFINE_IDTENTRY_RAW_ERRORCODE(ist_##func)
+
+/**
+ * DEFINE_IDTENTRY_VC - Emit code for VMM communication handler
+ * @func:	Function name of the entry point
+ *
+ * Maps to DEFINE_IDTENTRY_RAW_ERRORCODE
+ */
+#define DEFINE_IDTENTRY_VC(func)					\
+	DEFINE_IDTENTRY_RAW_ERRORCODE(func)
+
 #else	/* CONFIG_X86_64 */
 
 /**
@@ -437,6 +478,9 @@ __visible noinstr void func(struct pt_regs *regs,			\
 # define DECLARE_IDTENTRY_XENCB(vector, func)				\
 	DECLARE_IDTENTRY(vector, func)
 
+# define DECLARE_IDTENTRY_VC(vector, func)				\
+	idtentry_vc vector asm_##func func
+
 #else
 # define DECLARE_IDTENTRY_MCE(vector, func)				\
 	DECLARE_IDTENTRY(vector, func)
diff --git a/arch/x86/include/asm/proto.h b/arch/x86/include/asm/proto.h
index 6e81788a30c1..40f1f0cb73d7 100644
--- a/arch/x86/include/asm/proto.h
+++ b/arch/x86/include/asm/proto.h
@@ -10,6 +10,7 @@ void syscall_init(void);
 
 #ifdef CONFIG_X86_64
 void entry_SYSCALL_64(void);
+void entry_SYSCALL_64_safe_stack(void);
 long do_arch_prctl_64(struct task_struct *task, int option, unsigned long arg2);
 #endif
 
diff --git a/arch/x86/include/asm/traps.h b/arch/x86/include/asm/traps.h
index 6a308355ea29..1b86bb3abc56 100644
--- a/arch/x86/include/asm/traps.h
+++ b/arch/x86/include/asm/traps.h
@@ -15,6 +15,7 @@ asmlinkage __visible notrace struct pt_regs *sync_regs(struct pt_regs *eregs);
 asmlinkage __visible notrace
 struct bad_iret_stack *fixup_bad_iret(struct bad_iret_stack *s);
 void __init trap_init(void);
+asmlinkage __visible noinstr struct pt_regs *vc_switch_off_ist(struct pt_regs *eregs);
 #endif
 
 #ifdef CONFIG_X86_F00F_BUG
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 59d17e541df9..c43b12f3f339 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -43,6 +43,7 @@
 #include <asm/stacktrace.h>
 #include <asm/processor.h>
 #include <asm/debugreg.h>
+#include <asm/realmode.h>
 #include <asm/text-patching.h>
 #include <asm/ftrace.h>
 #include <asm/traps.h>
@@ -676,6 +677,56 @@ asmlinkage __visible noinstr struct pt_regs *sync_regs(struct pt_regs *eregs)
 	return regs;
 }
 
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+asmlinkage __visible noinstr struct pt_regs *vc_switch_off_ist(struct pt_regs *eregs)
+{
+	unsigned long sp, *stack;
+	struct stack_info info;
+	struct pt_regs *regs;
+
+	/*
+	 * In the SYSCALL entry path the RSP value comes from user-space - don't
+	 * trust it and switch to the current kernel stack
+	 */
+	if (eregs->ip >= (unsigned long)entry_SYSCALL_64 &&
+	    eregs->ip <  (unsigned long)entry_SYSCALL_64_safe_stack) {
+		sp = this_cpu_read(cpu_current_top_of_stack);
+		goto sync;
+	}
+
+	/*
+	 * From here on the the RSP value is trusted - more RSP sanity checks
+	 * need to happen above.
+	 *
+	 * Check whether entry happened from a safe stack.
+	 */
+	sp    = eregs->sp;
+	stack = (unsigned long *)sp;
+	get_stack_info_noinstr(stack, current, &info);
+
+	/*
+	 * Don't sync to entry stack or other unknown stacks - use the fall-back
+	 * stack instead.
+	 */
+	if (info.type == STACK_TYPE_UNKNOWN || info.type == STACK_TYPE_ENTRY ||
+	    info.type >= STACK_TYPE_EXCEPTION_LAST)
+		sp = __this_cpu_ist_top_va(VC2);
+
+sync:
+	/*
+	 * Found a safe stack - switch to it as if the entry didn't happen via
+	 * IST stack. The code below only copies pt_regs, the real switch happens
+	 * in assembly code.
+	 */
+	sp = ALIGN_DOWN(sp, 8) - sizeof(*regs);
+
+	regs = (struct pt_regs *)sp;
+	*regs = *eregs;
+
+	return regs;
+}
+#endif
+
 struct bad_iret_stack {
 	void *error_entry_ret;
 	struct pt_regs regs;
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
