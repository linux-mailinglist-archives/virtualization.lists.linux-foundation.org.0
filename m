Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B5826337567
	for <lists.virtualization@lfdr.de>; Thu, 11 Mar 2021 15:23:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E22DD6F7C8;
	Thu, 11 Mar 2021 14:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3r_zX_f5w5s; Thu, 11 Mar 2021 14:23:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 818876F502;
	Thu, 11 Mar 2021 14:23:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5073EC000A;
	Thu, 11 Mar 2021 14:23:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8863EC000C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 14:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 841D584151
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 14:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bl029tFu9DK4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 14:23:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AD5F8410F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 14:23:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1615472606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IoI7oHufeO8pieHlsxYeq8uKmilyQjXsUQUWZlzb7OE=;
 b=JTodUFeSkwVptUe+WEDIhCYBsfvIKyFCCawDwjkRTsQA5A58As0giziNTz37dloIRJyjYe
 oCJ/k3Q1vNixFiQa4Pml/1PcmKQf4h36+ffSK+q/GTxDqO8p7BTHv9pSVEIsCsAMB5tyOn
 yRHGRcb50GXCnHIu0T4CEczhIdGWTD8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E305AAE44;
 Thu, 11 Mar 2021 14:23:25 +0000 (UTC)
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 11/14] x86/paravirt: switch iret pvops to ALTERNATIVE
Date: Thu, 11 Mar 2021 15:23:16 +0100
Message-Id: <20210311142319.4723-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311142319.4723-1-jgross@suse.com>
References: <20210311142319.4723-1-jgross@suse.com>
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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

The iret paravirt op is rather special as it is using a jmp instead
of a call instruction. Switch it to ALTERNATIVE.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
V3:
- use ALTERNATIVE_TERNARY
---
 arch/x86/include/asm/paravirt.h       |  6 +++---
 arch/x86/include/asm/paravirt_types.h |  5 +----
 arch/x86/kernel/asm-offsets.c         |  5 -----
 arch/x86/kernel/paravirt.c            | 26 ++------------------------
 arch/x86/xen/enlighten_pv.c           |  3 +--
 5 files changed, 7 insertions(+), 38 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index a780509186bd..913acf7a0ebf 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -747,9 +747,9 @@ extern void default_banner(void);
 #define PARA_INDIRECT(addr)	*addr(%rip)
 
 #define INTERRUPT_RETURN						\
-	PARA_SITE(PARA_PATCH(PV_CPU_iret),				\
-		  ANNOTATE_RETPOLINE_SAFE;				\
-		  jmp PARA_INDIRECT(pv_ops+PV_CPU_iret);)
+	ANNOTATE_RETPOLINE_SAFE;					\
+	ALTERNATIVE_TERNARY("jmp *paravirt_iret(%rip);",		\
+		X86_FEATURE_XENPV, "jmp xen_iret;", "jmp native_iret;")
 
 #ifdef CONFIG_DEBUG_ENTRY
 #define SAVE_FLAGS(clobbers)                                        \
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 45bd21647dd8..0afdac83f926 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -151,10 +151,6 @@ struct pv_cpu_ops {
 
 	u64 (*read_pmc)(int counter);
 
-	/* Normal iret.  Jump to this with the standard iret stack
-	   frame set up. */
-	void (*iret)(void);
-
 	void (*start_context_switch)(struct task_struct *prev);
 	void (*end_context_switch)(struct task_struct *next);
 #endif
@@ -294,6 +290,7 @@ struct paravirt_patch_template {
 
 extern struct pv_info pv_info;
 extern struct paravirt_patch_template pv_ops;
+extern void (*paravirt_iret)(void);
 
 #define PARAVIRT_PATCH(x)					\
 	(offsetof(struct paravirt_patch_template, x) / sizeof(void *))
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 736508004b30..ecd3fd6993d1 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -61,11 +61,6 @@ static void __used common(void)
 	OFFSET(IA32_RT_SIGFRAME_sigcontext, rt_sigframe_ia32, uc.uc_mcontext);
 #endif
 
-#ifdef CONFIG_PARAVIRT_XXL
-	BLANK();
-	OFFSET(PV_CPU_iret, paravirt_patch_template, cpu.iret);
-#endif
-
 #ifdef CONFIG_XEN
 	BLANK();
 	OFFSET(XEN_vcpu_info_mask, vcpu_info, evtchn_upcall_mask);
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index a688edf35e31..9b0f568b0200 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -86,25 +86,6 @@ u64 notrace _paravirt_ident_64(u64 x)
 {
 	return x;
 }
-
-static unsigned paravirt_patch_jmp(void *insn_buff, const void *target,
-				   unsigned long addr, unsigned len)
-{
-	struct branch *b = insn_buff;
-	unsigned long delta = (unsigned long)target - (addr+5);
-
-	if (len < 5) {
-#ifdef CONFIG_RETPOLINE
-		WARN_ONCE(1, "Failing to patch indirect JMP in %ps\n", (void *)addr);
-#endif
-		return len;	/* call too long for patch site */
-	}
-
-	b->opcode = 0xe9;	/* jmp */
-	b->delta = delta;
-
-	return 5;
-}
 #endif
 
 DEFINE_STATIC_KEY_TRUE(virt_spin_lock_key);
@@ -136,9 +117,6 @@ unsigned paravirt_patch_default(u8 type, void *insn_buff,
 	else if (opfunc == _paravirt_ident_64)
 		ret = paravirt_patch_ident_64(insn_buff, len);
 
-	else if (type == PARAVIRT_PATCH(cpu.iret))
-		/* If operation requires a jmp, then jmp */
-		ret = paravirt_patch_jmp(insn_buff, opfunc, addr, len);
 #endif
 	else
 		/* Otherwise call the function. */
@@ -313,8 +291,6 @@ struct paravirt_patch_template pv_ops = {
 
 	.cpu.load_sp0		= native_load_sp0,
 
-	.cpu.iret		= native_iret,
-
 #ifdef CONFIG_X86_IOPL_IOPERM
 	.cpu.invalidate_io_bitmap	= native_tss_invalidate_io_bitmap,
 	.cpu.update_io_bitmap		= native_tss_update_io_bitmap,
@@ -419,6 +395,8 @@ struct paravirt_patch_template pv_ops = {
 NOKPROBE_SYMBOL(native_get_debugreg);
 NOKPROBE_SYMBOL(native_set_debugreg);
 NOKPROBE_SYMBOL(native_load_idt);
+
+void (*paravirt_iret)(void) = native_iret;
 #endif
 
 EXPORT_SYMBOL(pv_ops);
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index dc0a337f985b..08dca7bebb30 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1070,8 +1070,6 @@ static const struct pv_cpu_ops xen_cpu_ops __initconst = {
 
 	.read_pmc = xen_read_pmc,
 
-	.iret = xen_iret,
-
 	.load_tr_desc = paravirt_nop,
 	.set_ldt = xen_set_ldt,
 	.load_gdt = xen_load_gdt,
@@ -1235,6 +1233,7 @@ asmlinkage __visible void __init xen_start_kernel(void)
 	pv_info = xen_info;
 	pv_ops.init.patch = paravirt_patch_default;
 	pv_ops.cpu = xen_cpu_ops;
+	paravirt_iret = xen_iret;
 	xen_init_irq_ops();
 
 	/*
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
