Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CC32DCE4F
	for <lists.virtualization@lfdr.de>; Thu, 17 Dec 2020 10:31:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8A44A87559;
	Thu, 17 Dec 2020 09:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HIgSQrATryDT; Thu, 17 Dec 2020 09:31:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9DB738755F;
	Thu, 17 Dec 2020 09:31:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 871B4C163C;
	Thu, 17 Dec 2020 09:31:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 029EBC1DA2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Dec 2020 09:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DED6E87A44
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Dec 2020 09:31:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMU9nszcCBiy
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Dec 2020 09:31:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8A06087A3C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Dec 2020 09:31:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1608197510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QbhN8nDn8ElFaPhinA1wJiI1Qr2HaGBNE+bcWGQlFpI=;
 b=UFoQlSy4Dkk3IGYqpUsYwqK3x/2DMMD2RVRF0AFx3WupuOh8INGNwy1YOnqk73w8nBO7lq
 7Sc81VGyhZdXgXTPFN0fW6vOOCOL7i2y0I6M4Wgu0IzV4ZBY9IO1lAldq5Q8GS2I2BpVXp
 7BFQrpQDmDPkie4o7I8sVGexzABwWOY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 290A0B722;
 Thu, 17 Dec 2020 09:31:50 +0000 (UTC)
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/15] x86/paravirt: switch functions with custom code to
 ALTERNATIVE
Date: Thu, 17 Dec 2020 10:31:32 +0100
Message-Id: <20201217093133.1507-15-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201217093133.1507-1-jgross@suse.com>
References: <20201217093133.1507-1-jgross@suse.com>
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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

Instead of using paravirt patching for custom code sequences use
ALTERNATIVE for the functions with custom code replacements.

Instead of patching an ud2 instruction for unpopulated vector entries
into the caller site, use a simple function just calling BUG() as a
replacement.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/paravirt.h       | 72 ++++++++++++++--------
 arch/x86/include/asm/paravirt_types.h |  1 -
 arch/x86/kernel/paravirt.c            | 16 ++---
 arch/x86/kernel/paravirt_patch.c      | 88 ---------------------------
 4 files changed, 53 insertions(+), 124 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 49a823abc0e1..fc551dcc6458 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -108,7 +108,8 @@ static inline void write_cr0(unsigned long x)
 
 static inline unsigned long read_cr2(void)
 {
-	return PVOP_CALLEE0(unsigned long, mmu.read_cr2);
+	return PVOP_ALT_CALLEE0(unsigned long, mmu.read_cr2,
+				"mov %%cr2, %%rax;", ~X86_FEATURE_XENPV);
 }
 
 static inline void write_cr2(unsigned long x)
@@ -118,12 +119,14 @@ static inline void write_cr2(unsigned long x)
 
 static inline unsigned long __read_cr3(void)
 {
-	return PVOP_CALL0(unsigned long, mmu.read_cr3);
+	return PVOP_ALT_CALL0(unsigned long, mmu.read_cr3,
+			      "mov %%cr3, %%rax;", ~X86_FEATURE_XENPV);
 }
 
 static inline void write_cr3(unsigned long x)
 {
-	PVOP_VCALL1(mmu.write_cr3, x);
+	PVOP_ALT_VCALL1(mmu.write_cr3, x,
+			"mov %%rdi, %%cr3", ~X86_FEATURE_XENPV);
 }
 
 static inline void __write_cr4(unsigned long x)
@@ -143,7 +146,7 @@ static inline void halt(void)
 
 static inline void wbinvd(void)
 {
-	PVOP_VCALL0(cpu.wbinvd);
+	PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ~X86_FEATURE_XENPV);
 }
 
 static inline u64 paravirt_read_msr(unsigned msr)
@@ -357,22 +360,28 @@ static inline void paravirt_release_p4d(unsigned long pfn)
 
 static inline pte_t __pte(pteval_t val)
 {
-	return (pte_t) { PVOP_CALLEE1(pteval_t, mmu.make_pte, val) };
+	return (pte_t) { PVOP_ALT_CALLEE1(pteval_t, mmu.make_pte, val,
+					  "mov %%rdi, %%rax",
+					  ~X86_FEATURE_XENPV) };
 }
 
 static inline pteval_t pte_val(pte_t pte)
 {
-	return PVOP_CALLEE1(pteval_t, mmu.pte_val, pte.pte);
+	return PVOP_ALT_CALLEE1(pteval_t, mmu.pte_val, pte.pte,
+				"mov %%rdi, %%rax", ~X86_FEATURE_XENPV);
 }
 
 static inline pgd_t __pgd(pgdval_t val)
 {
-	return (pgd_t) { PVOP_CALLEE1(pgdval_t, mmu.make_pgd, val) };
+	return (pgd_t) { PVOP_ALT_CALLEE1(pgdval_t, mmu.make_pgd, val,
+					  "mov %%rdi, %%rax",
+					  ~X86_FEATURE_XENPV) };
 }
 
 static inline pgdval_t pgd_val(pgd_t pgd)
 {
-	return PVOP_CALLEE1(pgdval_t, mmu.pgd_val, pgd.pgd);
+	return PVOP_ALT_CALLEE1(pgdval_t, mmu.pgd_val, pgd.pgd,
+				"mov %%rdi, %%rax", ~X86_FEATURE_XENPV);
 }
 
 #define  __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
@@ -405,12 +414,15 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 
 static inline pmd_t __pmd(pmdval_t val)
 {
-	return (pmd_t) { PVOP_CALLEE1(pmdval_t, mmu.make_pmd, val) };
+	return (pmd_t) { PVOP_ALT_CALLEE1(pmdval_t, mmu.make_pmd, val,
+					  "mov %%rdi, %%rax",
+					  ~X86_FEATURE_XENPV) };
 }
 
 static inline pmdval_t pmd_val(pmd_t pmd)
 {
-	return PVOP_CALLEE1(pmdval_t, mmu.pmd_val, pmd.pmd);
+	return PVOP_ALT_CALLEE1(pmdval_t, mmu.pmd_val, pmd.pmd,
+				"mov %%rdi, %%rax", ~X86_FEATURE_XENPV);
 }
 
 static inline void set_pud(pud_t *pudp, pud_t pud)
@@ -422,14 +434,16 @@ static inline pud_t __pud(pudval_t val)
 {
 	pudval_t ret;
 
-	ret = PVOP_CALLEE1(pudval_t, mmu.make_pud, val);
+	ret = PVOP_ALT_CALLEE1(pudval_t, mmu.make_pud, val,
+			       "mov %%rdi, %%rax", ~X86_FEATURE_XENPV);
 
 	return (pud_t) { ret };
 }
 
 static inline pudval_t pud_val(pud_t pud)
 {
-	return PVOP_CALLEE1(pudval_t, mmu.pud_val, pud.pud);
+	return PVOP_ALT_CALLEE1(pudval_t, mmu.pud_val, pud.pud,
+				"mov %%rdi, %%rax", ~X86_FEATURE_XENPV);
 }
 
 static inline void pud_clear(pud_t *pudp)
@@ -448,14 +462,16 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 
 static inline p4d_t __p4d(p4dval_t val)
 {
-	p4dval_t ret = PVOP_CALLEE1(p4dval_t, mmu.make_p4d, val);
+	p4dval_t ret = PVOP_ALT_CALLEE1(p4dval_t, mmu.make_p4d, val,
+					"mov %%rdi, %%rax", ~X86_FEATURE_XENPV);
 
 	return (p4d_t) { ret };
 }
 
 static inline p4dval_t p4d_val(p4d_t p4d)
 {
-	return PVOP_CALLEE1(p4dval_t, mmu.p4d_val, p4d.p4d);
+	return PVOP_ALT_CALLEE1(p4dval_t, mmu.p4d_val, p4d.p4d,
+				"mov %%rdi, %%rax", ~X86_FEATURE_XENPV);
 }
 
 static inline void __set_pgd(pgd_t *pgdp, pgd_t pgd)
@@ -542,7 +558,9 @@ static __always_inline void pv_queued_spin_lock_slowpath(struct qspinlock *lock,
 
 static __always_inline void pv_queued_spin_unlock(struct qspinlock *lock)
 {
-	PVOP_VCALLEE1(lock.queued_spin_unlock, lock);
+	PVOP_ALT_VCALLEE1(lock.queued_spin_unlock, lock,
+			  "movb $0, (%%" _ASM_ARG1 ");",
+			  ~X86_FEATURE_PVUNLOCK);
 }
 
 static __always_inline void pv_wait(u8 *ptr, u8 val)
@@ -557,7 +575,9 @@ static __always_inline void pv_kick(int cpu)
 
 static __always_inline bool pv_vcpu_is_preempted(long cpu)
 {
-	return PVOP_CALLEE1(bool, lock.vcpu_is_preempted, cpu);
+	return PVOP_ALT_CALLEE1(bool, lock.vcpu_is_preempted, cpu,
+				"xor %%" _ASM_AX ", %%" _ASM_AX ";",
+				~X86_FEATURE_VCPUPREEMPT);
 }
 
 void __raw_callee_save___native_queued_spin_unlock(struct qspinlock *lock);
@@ -631,17 +651,18 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
 #ifdef CONFIG_PARAVIRT_XXL
 static inline notrace unsigned long arch_local_save_flags(void)
 {
-	return PVOP_CALLEE0(unsigned long, irq.save_fl);
+	return PVOP_ALT_CALLEE0(unsigned long, irq.save_fl,
+				"pushf; pop %%rax;", ~X86_FEATURE_XENPV);
 }
 
 static inline notrace void arch_local_irq_disable(void)
 {
-	PVOP_VCALLEE0(irq.irq_disable);
+	PVOP_ALT_VCALLEE0(irq.irq_disable, "cli;", ~X86_FEATURE_XENPV);
 }
 
 static inline notrace void arch_local_irq_enable(void)
 {
-	PVOP_VCALLEE0(irq.irq_enable);
+	PVOP_ALT_VCALLEE0(irq.irq_enable, "sti;", ~X86_FEATURE_XENPV);
 }
 
 static inline notrace unsigned long arch_local_irq_save(void)
@@ -725,12 +746,13 @@ extern void default_banner(void);
 		X86_FEATURE_XENPV, "jmp xen_iret;", "jmp native_iret;")
 
 #ifdef CONFIG_DEBUG_ENTRY
-#define SAVE_FLAGS(clobbers)                                        \
-	PARA_SITE(PARA_PATCH(PV_IRQ_save_fl),			    \
-		  PV_SAVE_REGS(clobbers | CLBR_CALLEE_SAVE);        \
-		  ANNOTATE_RETPOLINE_SAFE;			    \
-		  call PARA_INDIRECT(pv_ops+PV_IRQ_save_fl);	    \
-		  PV_RESTORE_REGS(clobbers | CLBR_CALLEE_SAVE);)
+#define SAVE_FLAGS(clobbers)						      \
+	ALTERNATIVE(PARA_SITE(PARA_PATCH(PV_IRQ_save_fl),		      \
+			      PV_SAVE_REGS(clobbers | CLBR_CALLEE_SAVE);      \
+			      ANNOTATE_RETPOLINE_SAFE;			      \
+			      call PARA_INDIRECT(pv_ops+PV_IRQ_save_fl);      \
+			      PV_RESTORE_REGS(clobbers | CLBR_CALLEE_SAVE);), \
+		    "pushf; pop %rax;", ~X86_FEATURE_XENPV)
 #endif
 #endif /* CONFIG_PARAVIRT_XXL */
 #endif	/* CONFIG_X86_64 */
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 7e0130781b12..f9e77046b61b 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -322,7 +322,6 @@ extern void (*paravirt_iret)(void);
 /* Simple instruction patching code. */
 #define NATIVE_LABEL(a,x,b) "\n\t.globl " a #x "_" #b "\n" a #x "_" #b ":\n\t"
 
-unsigned paravirt_patch_ident_64(void *insn_buff, unsigned len);
 unsigned paravirt_patch_default(u8 type, void *insn_buff, unsigned long addr, unsigned len);
 unsigned paravirt_patch_insns(void *insn_buff, unsigned len, const char *start, const char *end);
 
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 2ab547dd66c3..db6ae7f7c14e 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -53,7 +53,10 @@ void __init default_banner(void)
 }
 
 /* Undefined instruction for dealing with missing ops pointers. */
-static const unsigned char ud2a[] = { 0x0f, 0x0b };
+static void paravirt_BUG(void)
+{
+	BUG();
+}
 
 struct branch {
 	unsigned char opcode;
@@ -107,17 +110,10 @@ unsigned paravirt_patch_default(u8 type, void *insn_buff,
 	unsigned ret;
 
 	if (opfunc == NULL)
-		/* If there's no function, patch it with a ud2a (BUG) */
-		ret = paravirt_patch_insns(insn_buff, len, ud2a, ud2a+sizeof(ud2a));
+		/* If there's no function, patch it with paravirt_BUG() */
+		ret = paravirt_patch_call(insn_buff, paravirt_BUG, addr, len);
 	else if (opfunc == _paravirt_nop)
 		ret = 0;
-
-#ifdef CONFIG_PARAVIRT_XXL
-	/* identity functions just return their single argument */
-	else if (opfunc == _paravirt_ident_64)
-		ret = paravirt_patch_ident_64(insn_buff, len);
-
-#endif
 	else
 		/* Otherwise call the function. */
 		ret = paravirt_patch_call(insn_buff, opfunc, addr, len);
diff --git a/arch/x86/kernel/paravirt_patch.c b/arch/x86/kernel/paravirt_patch.c
index abd27ec67397..10543dcc8211 100644
--- a/arch/x86/kernel/paravirt_patch.c
+++ b/arch/x86/kernel/paravirt_patch.c
@@ -4,96 +4,8 @@
 #include <asm/paravirt.h>
 #include <asm/asm-offsets.h>
 
-#define PSTART(d, m)							\
-	patch_data_##d.m
-
-#define PEND(d, m)							\
-	(PSTART(d, m) + sizeof(patch_data_##d.m))
-
-#define PATCH(d, m, insn_buff, len)						\
-	paravirt_patch_insns(insn_buff, len, PSTART(d, m), PEND(d, m))
-
-#define PATCH_CASE(ops, m, data, insn_buff, len)				\
-	case PARAVIRT_PATCH(ops.m):					\
-		return PATCH(data, ops##_##m, insn_buff, len)
-
-#ifdef CONFIG_PARAVIRT_XXL
-struct patch_xxl {
-	const unsigned char	irq_irq_disable[1];
-	const unsigned char	irq_irq_enable[1];
-	const unsigned char	irq_save_fl[2];
-	const unsigned char	mmu_read_cr2[3];
-	const unsigned char	mmu_read_cr3[3];
-	const unsigned char	mmu_write_cr3[3];
-	const unsigned char	cpu_wbinvd[2];
-	const unsigned char	mov64[3];
-};
-
-static const struct patch_xxl patch_data_xxl = {
-	.irq_irq_disable	= { 0xfa },		// cli
-	.irq_irq_enable		= { 0xfb },		// sti
-	.irq_save_fl		= { 0x9c, 0x58 },	// pushf; pop %[re]ax
-	.mmu_read_cr2		= { 0x0f, 0x20, 0xd0 },	// mov %cr2, %[re]ax
-	.mmu_read_cr3		= { 0x0f, 0x20, 0xd8 },	// mov %cr3, %[re]ax
-	.mmu_write_cr3		= { 0x0f, 0x22, 0xdf },	// mov %rdi, %cr3
-	.cpu_wbinvd		= { 0x0f, 0x09 },	// wbinvd
-	.mov64			= { 0x48, 0x89, 0xf8 },	// mov %rdi, %rax
-};
-
-unsigned int paravirt_patch_ident_64(void *insn_buff, unsigned int len)
-{
-	return PATCH(xxl, mov64, insn_buff, len);
-}
-# endif /* CONFIG_PARAVIRT_XXL */
-
-#ifdef CONFIG_PARAVIRT_SPINLOCKS
-struct patch_lock {
-	unsigned char queued_spin_unlock[3];
-	unsigned char vcpu_is_preempted[2];
-};
-
-static const struct patch_lock patch_data_lock = {
-	.vcpu_is_preempted	= { 0x31, 0xc0 },	// xor %eax, %eax
-
-# ifdef CONFIG_X86_64
-	.queued_spin_unlock	= { 0xc6, 0x07, 0x00 },	// movb $0, (%rdi)
-# else
-	.queued_spin_unlock	= { 0xc6, 0x00, 0x00 },	// movb $0, (%eax)
-# endif
-};
-#endif /* CONFIG_PARAVIRT_SPINLOCKS */
-
 unsigned int native_patch(u8 type, void *insn_buff, unsigned long addr,
 			  unsigned int len)
 {
-	switch (type) {
-
-#ifdef CONFIG_PARAVIRT_XXL
-	PATCH_CASE(irq, save_fl, xxl, insn_buff, len);
-	PATCH_CASE(irq, irq_enable, xxl, insn_buff, len);
-	PATCH_CASE(irq, irq_disable, xxl, insn_buff, len);
-
-	PATCH_CASE(mmu, read_cr2, xxl, insn_buff, len);
-	PATCH_CASE(mmu, read_cr3, xxl, insn_buff, len);
-	PATCH_CASE(mmu, write_cr3, xxl, insn_buff, len);
-
-	PATCH_CASE(cpu, wbinvd, xxl, insn_buff, len);
-#endif
-
-#ifdef CONFIG_PARAVIRT_SPINLOCKS
-	case PARAVIRT_PATCH(lock.queued_spin_unlock):
-		if (pv_is_native_spin_unlock())
-			return PATCH(lock, queued_spin_unlock, insn_buff, len);
-		break;
-
-	case PARAVIRT_PATCH(lock.vcpu_is_preempted):
-		if (pv_is_native_vcpu_is_preempted())
-			return PATCH(lock, vcpu_is_preempted, insn_buff, len);
-		break;
-#endif
-	default:
-		break;
-	}
-
 	return paravirt_patch_default(type, insn_buff, addr, len);
 }
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
