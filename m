Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD102B490A
	for <lists.virtualization@lfdr.de>; Mon, 16 Nov 2020 16:23:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C84F3870F8;
	Mon, 16 Nov 2020 15:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AAARVzaMq0wb; Mon, 16 Nov 2020 15:23:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1603A870F4;
	Mon, 16 Nov 2020 15:23:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7C08C07FF;
	Mon, 16 Nov 2020 15:23:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90076C0891
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 15:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 89030870D7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 15:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0C4J5IA6fED7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 15:23:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F0D1A870AD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 15:23:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1605540192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c+r2h7lsdFFR0LxyJ7ZKzN3l3z/WJ2B6A3rDCIxtzbk=;
 b=QTj+ivK4XGUI5GqsG9xpPoBbHIWElNCvk36c5+5OjaofeJ4xIXQFeSX2RLcN0Kiaw3VXiy
 zF2QvTqu2uejqzbgH72IC+OBO97+a0ONmklxOo5GJ1hz3at8jWuMy4+8wnyQ9TGFa5jWE9
 ipL288LRwjIaJSoN+hO8S03lvvB01G0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4043AAF59;
 Mon, 16 Nov 2020 15:23:12 +0000 (UTC)
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Subject: [PATCH 4/4] x86/xen: drop USERGS_SYSRET64 paravirt call
Date: Mon, 16 Nov 2020 16:23:01 +0100
Message-Id: <20201116152301.24558-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201116152301.24558-1-jgross@suse.com>
References: <20201116152301.24558-1-jgross@suse.com>
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

USERGS_SYSRET64 is used to return from a syscall via sysret, but
a Xen PV guest will nevertheless use the iret hypercall, as there
is no sysret PV hypercall defined.

So instead of testing all the prerequisites for doing a sysret and
then mangling the stack for Xen PV again for doing an iret just use
the iret exit from the beginning.

This can easily be done via an ALTERNATIVE like it is done for the
sysenter compat case already.

While at it remove to stale sysret32 remnants.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/entry/entry_64.S             | 22 +++++++++-------------
 arch/x86/include/asm/irqflags.h       |  6 ------
 arch/x86/include/asm/paravirt.h       |  5 -----
 arch/x86/include/asm/paravirt_types.h |  8 --------
 arch/x86/kernel/asm-offsets_64.c      |  2 --
 arch/x86/kernel/paravirt.c            |  5 +----
 arch/x86/kernel/paravirt_patch.c      |  4 ----
 arch/x86/xen/enlighten_pv.c           |  1 -
 arch/x86/xen/xen-asm.S                | 20 --------------------
 arch/x86/xen/xen-ops.h                |  2 --
 10 files changed, 10 insertions(+), 65 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index a876204a73e0..df865eebd3d7 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -46,14 +46,6 @@
 .code64
 .section .entry.text, "ax"
 
-#ifdef CONFIG_PARAVIRT_XXL
-SYM_CODE_START(native_usergs_sysret64)
-	UNWIND_HINT_EMPTY
-	swapgs
-	sysretq
-SYM_CODE_END(native_usergs_sysret64)
-#endif /* CONFIG_PARAVIRT_XXL */
-
 /*
  * 64-bit SYSCALL instruction entry. Up to 6 arguments in registers.
  *
@@ -123,12 +115,15 @@ SYM_INNER_LABEL(entry_SYSCALL_64_after_hwframe, SYM_L_GLOBAL)
 	 * Try to use SYSRET instead of IRET if we're returning to
 	 * a completely clean 64-bit userspace context.  If we're not,
 	 * go to the slow exit path.
+	 * In the Xen PV case we must use iret anyway.
 	 */
-	movq	RCX(%rsp), %rcx
-	movq	RIP(%rsp), %r11
 
-	cmpq	%rcx, %r11	/* SYSRET requires RCX == RIP */
-	jne	swapgs_restore_regs_and_return_to_usermode
+	ALTERNATIVE __stringify( \
+		movq	RCX(%rsp), %rcx; \
+		movq	RIP(%rsp), %r11; \
+		cmpq	%rcx, %r11;	/* SYSRET requires RCX == RIP */ \
+		jne	swapgs_restore_regs_and_return_to_usermode), \
+	"jmp	swapgs_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV
 
 	/*
 	 * On Intel CPUs, SYSRET with non-canonical RCX/RIP will #GP
@@ -215,7 +210,8 @@ syscall_return_via_sysret:
 
 	popq	%rdi
 	popq	%rsp
-	USERGS_SYSRET64
+	swapgs
+	sysretq
 SYM_CODE_END(entry_SYSCALL_64)
 
 /*
diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
index 8c86edefa115..e585a4705b8d 100644
--- a/arch/x86/include/asm/irqflags.h
+++ b/arch/x86/include/asm/irqflags.h
@@ -132,12 +132,6 @@ static __always_inline unsigned long arch_local_irq_save(void)
 #endif
 
 #define INTERRUPT_RETURN	jmp native_iret
-#define USERGS_SYSRET64				\
-	swapgs;					\
-	sysretq;
-#define USERGS_SYSRET32				\
-	swapgs;					\
-	sysretl
 
 #else
 #define INTERRUPT_RETURN		iret
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 5647bcdba776..8121cf9b8d81 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -776,11 +776,6 @@ extern void default_banner(void);
 
 #ifdef CONFIG_X86_64
 #ifdef CONFIG_PARAVIRT_XXL
-#define USERGS_SYSRET64							\
-	PARA_SITE(PARA_PATCH(PV_CPU_usergs_sysret64),			\
-		  ANNOTATE_RETPOLINE_SAFE;				\
-		  jmp PARA_INDIRECT(pv_ops+PV_CPU_usergs_sysret64);)
-
 #ifdef CONFIG_DEBUG_ENTRY
 #define SAVE_FLAGS(clobbers)                                        \
 	PARA_SITE(PARA_PATCH(PV_IRQ_save_fl),			    \
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 903d71884fa2..55d8b7950e61 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -157,14 +157,6 @@ struct pv_cpu_ops {
 
 	u64 (*read_pmc)(int counter);
 
-	/*
-	 * Switch to usermode gs and return to 64-bit usermode using
-	 * sysret.  Only used in 64-bit kernels to return to 64-bit
-	 * processes.  Usermode register state, including %rsp, must
-	 * already be restored.
-	 */
-	void (*usergs_sysret64)(void);
-
 	/* Normal iret.  Jump to this with the standard iret stack
 	   frame set up. */
 	void (*iret)(void);
diff --git a/arch/x86/kernel/asm-offsets_64.c b/arch/x86/kernel/asm-offsets_64.c
index 1354bc30614d..b14533af7676 100644
--- a/arch/x86/kernel/asm-offsets_64.c
+++ b/arch/x86/kernel/asm-offsets_64.c
@@ -13,8 +13,6 @@ int main(void)
 {
 #ifdef CONFIG_PARAVIRT
 #ifdef CONFIG_PARAVIRT_XXL
-	OFFSET(PV_CPU_usergs_sysret64, paravirt_patch_template,
-	       cpu.usergs_sysret64);
 #ifdef CONFIG_DEBUG_ENTRY
 	OFFSET(PV_IRQ_save_fl, paravirt_patch_template, irq.save_fl);
 #endif
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 5e5fcf5c376d..18560b71e717 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -135,8 +135,7 @@ unsigned paravirt_patch_default(u8 type, void *insn_buff,
 	else if (opfunc == _paravirt_ident_64)
 		ret = paravirt_patch_ident_64(insn_buff, len);
 
-	else if (type == PARAVIRT_PATCH(cpu.iret) ||
-		 type == PARAVIRT_PATCH(cpu.usergs_sysret64))
+	else if (type == PARAVIRT_PATCH(cpu.iret))
 		/* If operation requires a jmp, then jmp */
 		ret = paravirt_patch_jmp(insn_buff, opfunc, addr, len);
 #endif
@@ -170,7 +169,6 @@ static u64 native_steal_clock(int cpu)
 
 /* These are in entry.S */
 extern void native_iret(void);
-extern void native_usergs_sysret64(void);
 
 static struct resource reserve_ioports = {
 	.start = 0,
@@ -310,7 +308,6 @@ struct paravirt_patch_template pv_ops = {
 
 	.cpu.load_sp0		= native_load_sp0,
 
-	.cpu.usergs_sysret64	= native_usergs_sysret64,
 	.cpu.iret		= native_iret,
 
 #ifdef CONFIG_X86_IOPL_IOPERM
diff --git a/arch/x86/kernel/paravirt_patch.c b/arch/x86/kernel/paravirt_patch.c
index 7c518b08aa3c..2fada2c347c9 100644
--- a/arch/x86/kernel/paravirt_patch.c
+++ b/arch/x86/kernel/paravirt_patch.c
@@ -27,7 +27,6 @@ struct patch_xxl {
 	const unsigned char	mmu_write_cr3[3];
 	const unsigned char	irq_restore_fl[2];
 	const unsigned char	cpu_wbinvd[2];
-	const unsigned char	cpu_usergs_sysret64[6];
 	const unsigned char	mov64[3];
 };
 
@@ -40,8 +39,6 @@ static const struct patch_xxl patch_data_xxl = {
 	.mmu_write_cr3		= { 0x0f, 0x22, 0xdf },	// mov %rdi, %cr3
 	.irq_restore_fl		= { 0x57, 0x9d },	// push %rdi; popfq
 	.cpu_wbinvd		= { 0x0f, 0x09 },	// wbinvd
-	.cpu_usergs_sysret64	= { 0x0f, 0x01, 0xf8,
-				    0x48, 0x0f, 0x07 },	// swapgs; sysretq
 	.mov64			= { 0x48, 0x89, 0xf8 },	// mov %rdi, %rax
 };
 
@@ -83,7 +80,6 @@ unsigned int native_patch(u8 type, void *insn_buff, unsigned long addr,
 	PATCH_CASE(mmu, read_cr3, xxl, insn_buff, len);
 	PATCH_CASE(mmu, write_cr3, xxl, insn_buff, len);
 
-	PATCH_CASE(cpu, usergs_sysret64, xxl, insn_buff, len);
 	PATCH_CASE(cpu, wbinvd, xxl, insn_buff, len);
 #endif
 
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 82030d49f4f7..2170553f524a 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1060,7 +1060,6 @@ static const struct pv_cpu_ops xen_cpu_ops __initconst = {
 	.read_pmc = xen_read_pmc,
 
 	.iret = xen_iret,
-	.usergs_sysret64 = xen_sysret64,
 
 	.load_tr_desc = paravirt_nop,
 	.set_ldt = xen_set_ldt,
diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
index 1d054c915046..c0630fd9f44e 100644
--- a/arch/x86/xen/xen-asm.S
+++ b/arch/x86/xen/xen-asm.S
@@ -214,26 +214,6 @@ SYM_CODE_START(xen_iret)
 	jmp hypercall_iret
 SYM_CODE_END(xen_iret)
 
-SYM_CODE_START(xen_sysret64)
-	/*
-	 * We're already on the usermode stack at this point, but
-	 * still with the kernel gs, so we can easily switch back.
-	 *
-	 * tss.sp2 is scratch space.
-	 */
-	movq %rsp, PER_CPU_VAR(cpu_tss_rw + TSS_sp2)
-	movq PER_CPU_VAR(cpu_current_top_of_stack), %rsp
-
-	pushq $__USER_DS
-	pushq PER_CPU_VAR(cpu_tss_rw + TSS_sp2)
-	pushq %r11
-	pushq $__USER_CS
-	pushq %rcx
-
-	pushq $VGCF_in_syscall
-	jmp hypercall_iret
-SYM_CODE_END(xen_sysret64)
-
 /*
  * Xen handles syscall callbacks much like ordinary exceptions, which
  * means we have:
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 9546c3384c75..b2fd80a01a36 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -138,8 +138,6 @@ __visible unsigned long xen_read_cr2_direct(void);
 
 /* These are not functions, and cannot be called normally */
 __visible void xen_iret(void);
-__visible void xen_sysret32(void);
-__visible void xen_sysret64(void);
 
 extern int xen_panic_handler_init(void);
 
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
