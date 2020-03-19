Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA0918B01A
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:24:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 78D3A8834D;
	Thu, 19 Mar 2020 09:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tf3w+M0FNz2; Thu, 19 Mar 2020 09:24:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 28AC288349;
	Thu, 19 Mar 2020 09:24:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E54EC07FF;
	Thu, 19 Mar 2020 09:24:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44A27C1D85
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2E3BB88252
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xh5Vvry-ZNgP
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AC124882D8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 47419F03; Thu, 19 Mar 2020 10:14:29 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 70/70] x86/sev-es: Add NMI state tracking
Date: Thu, 19 Mar 2020 10:14:07 +0100
Message-Id: <20200319091407.1481-71-joro@8bytes.org>
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

From: Joerg Roedel <jroedel@suse.de>

Keep NMI state in SEV-ES code so the kernel can re-enable NMIs for the
vCPU when it reaches IRET.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/entry/entry_64.S       | 48 +++++++++++++++++++++++++++++++++
 arch/x86/include/asm/sev-es.h   | 27 +++++++++++++++++++
 arch/x86/include/uapi/asm/svm.h |  1 +
 arch/x86/kernel/nmi.c           |  8 ++++++
 arch/x86/kernel/sev-es.c        | 31 ++++++++++++++++++++-
 5 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 729876d368c5..355470b36896 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -38,6 +38,7 @@
 #include <asm/export.h>
 #include <asm/frame.h>
 #include <asm/nospec-branch.h>
+#include <asm/sev-es.h>
 #include <linux/err.h>
 
 #include "calling.h"
@@ -629,6 +630,13 @@ SYM_INNER_LABEL(swapgs_restore_regs_and_return_to_usermode, SYM_L_GLOBAL)
 	ud2
 1:
 #endif
+
+	/*
+	 * This code path is used by the NMI handler, so check if NMIs
+	 * need to be re-enabled when running as an SEV-ES guest.
+	 */
+	SEV_ES_IRET_CHECK
+
 	POP_REGS pop_rdi=0
 
 	/*
@@ -1474,6 +1482,8 @@ SYM_CODE_START(nmi)
 	movq	$-1, %rsi
 	call	do_nmi
 
+	SEV_ES_NMI_COMPLETE
+
 	/*
 	 * Return back to user mode.  We must *not* do the normal exit
 	 * work, because we don't want to enable interrupts.
@@ -1599,6 +1609,7 @@ nested_nmi_out:
 	popq	%rdx
 
 	/* We are returning to kernel mode, so this cannot result in a fault. */
+	SEV_ES_NMI_COMPLETE
 	iretq
 
 first_nmi:
@@ -1687,6 +1698,12 @@ end_repeat_nmi:
 	movq	$-1, %rsi
 	call	do_nmi
 
+	/*
+	 * When running as an SEV-ES guest, jump to the SEV-ES NMI IRET
+	 * path.
+	 */
+	SEV_ES_NMI_COMPLETE
+
 	/* Always restore stashed CR3 value (see paranoid_entry) */
 	RESTORE_CR3 scratch_reg=%r15 save_reg=%r14
 
@@ -1715,6 +1732,9 @@ nmi_restore:
 	std
 	movq	$0, 5*8(%rsp)		/* clear "NMI executing" */
 
+nmi_return:
+	UNWIND_HINT_IRET_REGS
+
 	/*
 	 * iretq reads the "iret" frame and exits the NMI stack in a
 	 * single instruction.  We are returning to kernel mode, so this
@@ -1724,6 +1744,34 @@ nmi_restore:
 	iretq
 SYM_CODE_END(nmi)
 
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+SYM_CODE_START(sev_es_iret_user)
+	UNWIND_HINT_IRET_REGS offset=8
+	/*
+	 * The kernel jumps here directly from
+	 * swapgs_restore_regs_and_return_to_usermode. %rsp points already to
+	 * trampoline stack, but %cr3 is still from kernel. User-regs are live
+	 * except %rdi. Switch to user CR3, restore user %rdi and user gs_base
+	 * and single-step over IRET
+	 */
+	SWITCH_TO_USER_CR3_STACK scratch_reg=%rdi
+	popq	%rdi
+	SWAPGS
+	/*
+	 * Enable single-stepping and execute IRET. When IRET is
+	 * finished the resulting #DB exception will cause a #VC
+	 * exception to be raised. The #VC exception handler will send a
+	 * NMI-complete message to the hypervisor to re-open the NMI
+	 * window.
+	 */
+sev_es_iret_kernel:
+	pushf
+	btsq $X86_EFLAGS_TF_BIT, (%rsp)
+	popf
+	iretq
+SYM_CODE_END(sev_es_iret_user)
+#endif
+
 #ifndef CONFIG_IA32_EMULATION
 /*
  * This handles SYSCALL from 32-bit code.  There is no way to program
diff --git a/arch/x86/include/asm/sev-es.h b/arch/x86/include/asm/sev-es.h
index 63acf50e6280..d866adb3e6d4 100644
--- a/arch/x86/include/asm/sev-es.h
+++ b/arch/x86/include/asm/sev-es.h
@@ -8,6 +8,8 @@
 #ifndef __ASM_ENCRYPTED_STATE_H
 #define __ASM_ENCRYPTED_STATE_H
 
+#ifndef __ASSEMBLY__
+
 #include <linux/types.h>
 #include <asm/insn.h>
 
@@ -82,11 +84,36 @@ struct real_mode_header;
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 int sev_es_setup_ap_jump_table(struct real_mode_header *rmh);
+void sev_es_nmi_enter(void);
 #else /* CONFIG_AMD_MEM_ENCRYPT */
 static inline int sev_es_setup_ap_jump_table(struct real_mode_header *rmh)
 {
 	return 0;
 }
+static inline void sev_es_nmi_enter(void) { }
+#endif /* CONFIG_AMD_MEM_ENCRYPT*/
+
+#else /* !__ASSEMBLY__ */
+
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+#define SEV_ES_NMI_COMPLETE		\
+	ALTERNATIVE	"", "callq sev_es_nmi_complete", X86_FEATURE_SEV_ES_GUEST
+
+.macro	SEV_ES_IRET_CHECK
+	ALTERNATIVE	"jmp	.Lend_\@", "", X86_FEATURE_SEV_ES_GUEST
+	movq	PER_CPU_VAR(sev_es_in_nmi), %rdi
+	testq	%rdi, %rdi
+	jz	.Lend_\@
+	callq	sev_es_nmi_complete
+.Lend_\@:
+.endm
+
+#else  /* CONFIG_AMD_MEM_ENCRYPT */
+#define	SEV_ES_NMI_COMPLETE
+.macro	SEV_ES_IRET_CHECK
+.endm
 #endif /* CONFIG_AMD_MEM_ENCRYPT*/
 
+#endif /* __ASSEMBLY__ */
+
 #endif
diff --git a/arch/x86/include/uapi/asm/svm.h b/arch/x86/include/uapi/asm/svm.h
index 20a05839dd9a..0f837339db66 100644
--- a/arch/x86/include/uapi/asm/svm.h
+++ b/arch/x86/include/uapi/asm/svm.h
@@ -84,6 +84,7 @@
 /* SEV-ES software-defined VMGEXIT events */
 #define SVM_VMGEXIT_MMIO_READ			0x80000001
 #define SVM_VMGEXIT_MMIO_WRITE			0x80000002
+#define SVM_VMGEXIT_NMI_COMPLETE		0x80000003
 #define SVM_VMGEXIT_AP_HLT_LOOP			0x80000004
 #define SVM_VMGEXIT_AP_JUMP_TABLE		0x80000005
 #define		SVM_VMGEXIT_SET_AP_JUMP_TABLE			0
diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 54c21d6abd5a..7312a6d4d50f 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -37,6 +37,7 @@
 #include <asm/reboot.h>
 #include <asm/cache.h>
 #include <asm/nospec-branch.h>
+#include <asm/sev-es.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/nmi.h>
@@ -510,6 +511,13 @@ NOKPROBE_SYMBOL(is_debug_stack);
 dotraplinkage notrace void
 do_nmi(struct pt_regs *regs, long error_code)
 {
+	/*
+	 * For SEV-ES the kernel needs to track whether NMIs are blocked until
+	 * IRET is reached, even when the CPU is offline.
+	 */
+	if (sev_es_active())
+		sev_es_nmi_enter();
+
 	if (IS_ENABLED(CONFIG_SMP) && cpu_is_offline(smp_processor_id()))
 		return;
 
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 3c22f256645e..409a7a2aa630 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -37,6 +37,7 @@ struct ghcb boot_ghcb_page __bss_decrypted __aligned(PAGE_SIZE);
  */
 struct ghcb __initdata *boot_ghcb;
 static DEFINE_PER_CPU(unsigned long, cached_dr7) = DR7_RESET_VALUE;
+DEFINE_PER_CPU(bool, sev_es_in_nmi) = false;
 
 struct ghcb_state {
 	struct ghcb *ghcb;
@@ -270,6 +271,31 @@ static phys_addr_t vc_slow_virt_to_phys(struct ghcb *ghcb, long vaddr)
 /* Include code shared with pre-decompression boot stage */
 #include "sev-es-shared.c"
 
+void sev_es_nmi_enter(void)
+{
+	this_cpu_write(sev_es_in_nmi, true);
+}
+
+void sev_es_nmi_complete(void)
+{
+	struct ghcb_state state;
+	struct ghcb *ghcb;
+
+	ghcb = sev_es_get_ghcb(&state);
+
+	vc_ghcb_invalidate(ghcb);
+	ghcb_set_sw_exit_code(ghcb, SVM_VMGEXIT_NMI_COMPLETE);
+	ghcb_set_sw_exit_info_1(ghcb, 0);
+	ghcb_set_sw_exit_info_2(ghcb, 0);
+
+	sev_es_wr_ghcb_msr(__pa(ghcb));
+	VMGEXIT();
+
+	sev_es_put_ghcb(&state);
+
+	this_cpu_write(sev_es_in_nmi, false);
+}
+
 static u64 sev_es_get_jump_table_addr(void)
 {
 	struct ghcb_state state;
@@ -891,7 +917,10 @@ static enum es_result vc_handle_vmmcall(struct ghcb *ghcb,
 static enum es_result vc_handle_db_exception(struct ghcb *ghcb,
 					     struct es_em_ctxt *ctxt)
 {
-	do_debug(ctxt->regs, 0);
+	if (this_cpu_read(sev_es_in_nmi))
+		sev_es_nmi_complete();
+	else
+		do_debug(ctxt->regs, 0);
 
 	/* Exception event, do not advance RIP */
 	return ES_RETRY;
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
