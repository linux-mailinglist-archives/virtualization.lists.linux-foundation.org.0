Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C0E33278D
	for <lists.virtualization@lfdr.de>; Tue,  9 Mar 2021 14:48:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9599B430E4;
	Tue,  9 Mar 2021 13:48:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IYzTDjSEIxb3; Tue,  9 Mar 2021 13:48:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4BDF4019A;
	Tue,  9 Mar 2021 13:48:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02968C000B;
	Tue,  9 Mar 2021 13:48:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D295C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 13:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD49D605C9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 13:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CrEs35L44pIY
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 13:48:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C38B46F548
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 13:48:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1615297701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dCx1fNhYw/V2GNDtlKOZ+uXJwV9FmyavLSGcVpyYJ4=;
 b=jgUb85x64FRRB4cDriZUvNgADkzS4yVinwKcurAHPtS4uV1oxlvY4yG8qeOY48Yhv7sD3e
 hEIzqzop6CcSZ8Kk9a3EWplU9JTedG+IInK+Q/f6ozSCAGnR7Y1EOUBDJH6+zFMBcL06+8
 esrjsuH5Wgxt97nENB+wdDKdiJg/+Ns=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EAD9AD87;
 Tue,  9 Mar 2021 13:48:21 +0000 (UTC)
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Subject: [PATCH v6 07/12] x86/paravirt: remove no longer needed 32-bit pvops
 cruft
Date: Tue,  9 Mar 2021 14:48:08 +0100
Message-Id: <20210309134813.23912-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309134813.23912-1-jgross@suse.com>
References: <20210309134813.23912-1-jgross@suse.com>
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
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
From: Juergen Gross via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

PVOP_VCALL4() is only used for Xen PV, while PVOP_CALL4() isn't used
at all. Keep PVOP_CALL4() for 64 bits due to symmetry reasons.

This allows to remove the 32-bit definitions of those macros leading
to a substantial simplification of the paravirt macros, as those were
the only ones needing non-empty "pre" and "post" parameters.

PVOP_CALLEE2() and PVOP_VCALLEE2() are used nowhere, so remove them.

Another no longer needed case is special handling of return types
larger than unsigned long. Replace that with a BUILD_BUG_ON().

DISABLE_INTERRUPTS() is used in 32-bit code only, so it can just be
replaced by cli.

INTERRUPT_RETURN in 32-bit code can be replaced by iret.

ENABLE_INTERRUPTS is used nowhere, so it can be removed.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/entry/entry_32.S             |   4 +-
 arch/x86/include/asm/irqflags.h       |   5 --
 arch/x86/include/asm/paravirt.h       |  35 +-------
 arch/x86/include/asm/paravirt_types.h | 112 ++++++++------------------
 arch/x86/kernel/asm-offsets.c         |   2 -
 5 files changed, 35 insertions(+), 123 deletions(-)

diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index df8c017e6161..765487e57d6e 100644
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -430,7 +430,7 @@
 	 * will soon execute iret and the tracer was already set to
 	 * the irqstate after the IRET:
 	 */
-	DISABLE_INTERRUPTS(CLBR_ANY)
+	cli
 	lss	(%esp), %esp			/* switch to espfix segment */
 .Lend_\@:
 #endif /* CONFIG_X86_ESPFIX32 */
@@ -1077,7 +1077,7 @@ restore_all_switch_stack:
 	 * when returning from IPI handler and when returning from
 	 * scheduler to user-space.
 	 */
-	INTERRUPT_RETURN
+	iret
 
 .section .fixup, "ax"
 SYM_CODE_START(asm_iret_error)
diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
index 144d70ea4393..a0efbcd24b86 100644
--- a/arch/x86/include/asm/irqflags.h
+++ b/arch/x86/include/asm/irqflags.h
@@ -109,9 +109,6 @@ static __always_inline unsigned long arch_local_irq_save(void)
 }
 #else
 
-#define ENABLE_INTERRUPTS(x)	sti
-#define DISABLE_INTERRUPTS(x)	cli
-
 #ifdef CONFIG_X86_64
 #ifdef CONFIG_DEBUG_ENTRY
 #define SAVE_FLAGS(x)		pushfq; popq %rax
@@ -119,8 +116,6 @@ static __always_inline unsigned long arch_local_irq_save(void)
 
 #define INTERRUPT_RETURN	jmp native_iret
 
-#else
-#define INTERRUPT_RETURN		iret
 #endif
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 8c354099d9c3..c6496a82fad1 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -721,6 +721,7 @@ extern void default_banner(void);
 	.if ((~(set)) & mask); pop %reg; .endif
 
 #ifdef CONFIG_X86_64
+#ifdef CONFIG_PARAVIRT_XXL
 
 #define PV_SAVE_REGS(set)			\
 	COND_PUSH(set, CLBR_RAX, rax);		\
@@ -746,46 +747,12 @@ extern void default_banner(void);
 #define PARA_PATCH(off)		((off) / 8)
 #define PARA_SITE(ptype, ops)	_PVSITE(ptype, ops, .quad, 8)
 #define PARA_INDIRECT(addr)	*addr(%rip)
-#else
-#define PV_SAVE_REGS(set)			\
-	COND_PUSH(set, CLBR_EAX, eax);		\
-	COND_PUSH(set, CLBR_EDI, edi);		\
-	COND_PUSH(set, CLBR_ECX, ecx);		\
-	COND_PUSH(set, CLBR_EDX, edx)
-#define PV_RESTORE_REGS(set)			\
-	COND_POP(set, CLBR_EDX, edx);		\
-	COND_POP(set, CLBR_ECX, ecx);		\
-	COND_POP(set, CLBR_EDI, edi);		\
-	COND_POP(set, CLBR_EAX, eax)
-
-#define PARA_PATCH(off)		((off) / 4)
-#define PARA_SITE(ptype, ops)	_PVSITE(ptype, ops, .long, 4)
-#define PARA_INDIRECT(addr)	*%cs:addr
-#endif
 
-#ifdef CONFIG_PARAVIRT_XXL
 #define INTERRUPT_RETURN						\
 	PARA_SITE(PARA_PATCH(PV_CPU_iret),				\
 		  ANNOTATE_RETPOLINE_SAFE;				\
 		  jmp PARA_INDIRECT(pv_ops+PV_CPU_iret);)
 
-#define DISABLE_INTERRUPTS(clobbers)					\
-	PARA_SITE(PARA_PATCH(PV_IRQ_irq_disable),			\
-		  PV_SAVE_REGS(clobbers | CLBR_CALLEE_SAVE);		\
-		  ANNOTATE_RETPOLINE_SAFE;				\
-		  call PARA_INDIRECT(pv_ops+PV_IRQ_irq_disable);	\
-		  PV_RESTORE_REGS(clobbers | CLBR_CALLEE_SAVE);)
-
-#define ENABLE_INTERRUPTS(clobbers)					\
-	PARA_SITE(PARA_PATCH(PV_IRQ_irq_enable),			\
-		  PV_SAVE_REGS(clobbers | CLBR_CALLEE_SAVE);		\
-		  ANNOTATE_RETPOLINE_SAFE;				\
-		  call PARA_INDIRECT(pv_ops+PV_IRQ_irq_enable);		\
-		  PV_RESTORE_REGS(clobbers | CLBR_CALLEE_SAVE);)
-#endif
-
-#ifdef CONFIG_X86_64
-#ifdef CONFIG_PARAVIRT_XXL
 #ifdef CONFIG_DEBUG_ENTRY
 #define SAVE_FLAGS(clobbers)                                        \
 	PARA_SITE(PARA_PATCH(PV_IRQ_save_fl),			    \
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 1fff349e4792..42f9eef84131 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -470,55 +470,34 @@ int paravirt_disable_iospace(void);
 	})
 
 
-#define ____PVOP_CALL(rettype, op, clbr, call_clbr, extra_clbr,		\
-		      pre, post, ...)					\
+#define ____PVOP_CALL(rettype, op, clbr, call_clbr, extra_clbr, ...)	\
 	({								\
-		rettype __ret;						\
 		PVOP_CALL_ARGS;						\
 		PVOP_TEST_NULL(op);					\
-		/* This is 32-bit specific, but is okay in 64-bit */	\
-		/* since this condition will never hold */		\
-		if (sizeof(rettype) > sizeof(unsigned long)) {		\
-			asm volatile(pre				\
-				     paravirt_alt(PARAVIRT_CALL)	\
-				     post				\
-				     : call_clbr, ASM_CALL_CONSTRAINT	\
-				     : paravirt_type(op),		\
-				       paravirt_clobber(clbr),		\
-				       ##__VA_ARGS__			\
-				     : "memory", "cc" extra_clbr);	\
-			__ret = (rettype)((((u64)__edx) << 32) | __eax); \
-		} else {						\
-			asm volatile(pre				\
-				     paravirt_alt(PARAVIRT_CALL)	\
-				     post				\
-				     : call_clbr, ASM_CALL_CONSTRAINT	\
-				     : paravirt_type(op),		\
-				       paravirt_clobber(clbr),		\
-				       ##__VA_ARGS__			\
-				     : "memory", "cc" extra_clbr);	\
-			__ret = (rettype)(__eax & PVOP_RETMASK(rettype));	\
-		}							\
-		__ret;							\
+		BUILD_BUG_ON(sizeof(rettype) > sizeof(unsigned long));	\
+		asm volatile(paravirt_alt(PARAVIRT_CALL)		\
+			     : call_clbr, ASM_CALL_CONSTRAINT		\
+			     : paravirt_type(op),			\
+			       paravirt_clobber(clbr),			\
+			       ##__VA_ARGS__				\
+			     : "memory", "cc" extra_clbr);		\
+		(rettype)(__eax & PVOP_RETMASK(rettype));		\
 	})
 
-#define __PVOP_CALL(rettype, op, pre, post, ...)			\
+#define __PVOP_CALL(rettype, op, ...)					\
 	____PVOP_CALL(rettype, op, CLBR_ANY, PVOP_CALL_CLOBBERS,	\
-		      EXTRA_CLOBBERS, pre, post, ##__VA_ARGS__)
+		      EXTRA_CLOBBERS, ##__VA_ARGS__)
 
-#define __PVOP_CALLEESAVE(rettype, op, pre, post, ...)			\
+#define __PVOP_CALLEESAVE(rettype, op, ...)				\
 	____PVOP_CALL(rettype, op.func, CLBR_RET_REG,			\
-		      PVOP_CALLEE_CLOBBERS, ,				\
-		      pre, post, ##__VA_ARGS__)
+		      PVOP_CALLEE_CLOBBERS, , ##__VA_ARGS__)
 
 
-#define ____PVOP_VCALL(op, clbr, call_clbr, extra_clbr, pre, post, ...)	\
+#define ____PVOP_VCALL(op, clbr, call_clbr, extra_clbr, ...)		\
 	({								\
 		PVOP_VCALL_ARGS;					\
 		PVOP_TEST_NULL(op);					\
-		asm volatile(pre					\
-			     paravirt_alt(PARAVIRT_CALL)		\
-			     post					\
+		asm volatile(paravirt_alt(PARAVIRT_CALL)		\
 			     : call_clbr, ASM_CALL_CONSTRAINT		\
 			     : paravirt_type(op),			\
 			       paravirt_clobber(clbr),			\
@@ -526,84 +505,57 @@ int paravirt_disable_iospace(void);
 			     : "memory", "cc" extra_clbr);		\
 	})
 
-#define __PVOP_VCALL(op, pre, post, ...)				\
+#define __PVOP_VCALL(op, ...)						\
 	____PVOP_VCALL(op, CLBR_ANY, PVOP_VCALL_CLOBBERS,		\
-		       VEXTRA_CLOBBERS,					\
-		       pre, post, ##__VA_ARGS__)
+		       VEXTRA_CLOBBERS, ##__VA_ARGS__)
 
-#define __PVOP_VCALLEESAVE(op, pre, post, ...)				\
+#define __PVOP_VCALLEESAVE(op, ...)					\
 	____PVOP_VCALL(op.func, CLBR_RET_REG,				\
-		      PVOP_VCALLEE_CLOBBERS, ,				\
-		      pre, post, ##__VA_ARGS__)
+		      PVOP_VCALLEE_CLOBBERS, , ##__VA_ARGS__)
 
 
 
 #define PVOP_CALL0(rettype, op)						\
-	__PVOP_CALL(rettype, op, "", "")
+	__PVOP_CALL(rettype, op)
 #define PVOP_VCALL0(op)							\
-	__PVOP_VCALL(op, "", "")
+	__PVOP_VCALL(op)
 
 #define PVOP_CALLEE0(rettype, op)					\
-	__PVOP_CALLEESAVE(rettype, op, "", "")
+	__PVOP_CALLEESAVE(rettype, op)
 #define PVOP_VCALLEE0(op)						\
-	__PVOP_VCALLEESAVE(op, "", "")
+	__PVOP_VCALLEESAVE(op)
 
 
 #define PVOP_CALL1(rettype, op, arg1)					\
-	__PVOP_CALL(rettype, op, "", "", PVOP_CALL_ARG1(arg1))
+	__PVOP_CALL(rettype, op, PVOP_CALL_ARG1(arg1))
 #define PVOP_VCALL1(op, arg1)						\
-	__PVOP_VCALL(op, "", "", PVOP_CALL_ARG1(arg1))
+	__PVOP_VCALL(op, PVOP_CALL_ARG1(arg1))
 
 #define PVOP_CALLEE1(rettype, op, arg1)					\
-	__PVOP_CALLEESAVE(rettype, op, "", "", PVOP_CALL_ARG1(arg1))
+	__PVOP_CALLEESAVE(rettype, op, PVOP_CALL_ARG1(arg1))
 #define PVOP_VCALLEE1(op, arg1)						\
-	__PVOP_VCALLEESAVE(op, "", "", PVOP_CALL_ARG1(arg1))
+	__PVOP_VCALLEESAVE(op, PVOP_CALL_ARG1(arg1))
 
 
 #define PVOP_CALL2(rettype, op, arg1, arg2)				\
-	__PVOP_CALL(rettype, op, "", "", PVOP_CALL_ARG1(arg1),		\
-		    PVOP_CALL_ARG2(arg2))
+	__PVOP_CALL(rettype, op, PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2))
 #define PVOP_VCALL2(op, arg1, arg2)					\
-	__PVOP_VCALL(op, "", "", PVOP_CALL_ARG1(arg1),			\
-		     PVOP_CALL_ARG2(arg2))
-
-#define PVOP_CALLEE2(rettype, op, arg1, arg2)				\
-	__PVOP_CALLEESAVE(rettype, op, "", "", PVOP_CALL_ARG1(arg1),	\
-			  PVOP_CALL_ARG2(arg2))
-#define PVOP_VCALLEE2(op, arg1, arg2)					\
-	__PVOP_VCALLEESAVE(op, "", "", PVOP_CALL_ARG1(arg1),		\
-			   PVOP_CALL_ARG2(arg2))
-
+	__PVOP_VCALL(op, PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2))
 
 #define PVOP_CALL3(rettype, op, arg1, arg2, arg3)			\
-	__PVOP_CALL(rettype, op, "", "", PVOP_CALL_ARG1(arg1),		\
+	__PVOP_CALL(rettype, op, PVOP_CALL_ARG1(arg1),			\
 		    PVOP_CALL_ARG2(arg2), PVOP_CALL_ARG3(arg3))
 #define PVOP_VCALL3(op, arg1, arg2, arg3)				\
-	__PVOP_VCALL(op, "", "", PVOP_CALL_ARG1(arg1),			\
+	__PVOP_VCALL(op, PVOP_CALL_ARG1(arg1),				\
 		     PVOP_CALL_ARG2(arg2), PVOP_CALL_ARG3(arg3))
 
-/* This is the only difference in x86_64. We can make it much simpler */
-#ifdef CONFIG_X86_32
 #define PVOP_CALL4(rettype, op, arg1, arg2, arg3, arg4)			\
 	__PVOP_CALL(rettype, op,					\
-		    "push %[_arg4];", "lea 4(%%esp),%%esp;",		\
-		    PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2),		\
-		    PVOP_CALL_ARG3(arg3), [_arg4] "mr" ((u32)(arg4)))
-#define PVOP_VCALL4(op, arg1, arg2, arg3, arg4)				\
-	__PVOP_VCALL(op,						\
-		    "push %[_arg4];", "lea 4(%%esp),%%esp;",		\
-		    "0" ((u32)(arg1)), "1" ((u32)(arg2)),		\
-		    "2" ((u32)(arg3)), [_arg4] "mr" ((u32)(arg4)))
-#else
-#define PVOP_CALL4(rettype, op, arg1, arg2, arg3, arg4)			\
-	__PVOP_CALL(rettype, op, "", "",				\
 		    PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2),		\
 		    PVOP_CALL_ARG3(arg3), PVOP_CALL_ARG4(arg4))
 #define PVOP_VCALL4(op, arg1, arg2, arg3, arg4)				\
-	__PVOP_VCALL(op, "", "",					\
-		     PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2),	\
+	__PVOP_VCALL(op, PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2),	\
 		     PVOP_CALL_ARG3(arg3), PVOP_CALL_ARG4(arg4))
-#endif
 
 /* Lazy mode for batching updates / context switch */
 enum paravirt_lazy_mode {
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 60b9f42ce3c1..736508004b30 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -63,8 +63,6 @@ static void __used common(void)
 
 #ifdef CONFIG_PARAVIRT_XXL
 	BLANK();
-	OFFSET(PV_IRQ_irq_disable, paravirt_patch_template, irq.irq_disable);
-	OFFSET(PV_IRQ_irq_enable, paravirt_patch_template, irq.irq_enable);
 	OFFSET(PV_CPU_iret, paravirt_patch_template, cpu.iret);
 #endif
 
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
