Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 433247CA82E
	for <lists.virtualization@lfdr.de>; Mon, 16 Oct 2023 14:40:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7FD6812B9;
	Mon, 16 Oct 2023 12:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7FD6812B9
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=jOzU66hy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g2Zy2B-6V6_g; Mon, 16 Oct 2023 12:39:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0BD4681260;
	Mon, 16 Oct 2023 12:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BD4681260
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 349E3C008C;
	Mon, 16 Oct 2023 12:39:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6AF4C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Oct 2023 12:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCCF6414FD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Oct 2023 12:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCCF6414FD
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com
 header.a=rsa-sha256 header.s=susede1 header.b=jOzU66hy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JW3-4iZTVHZZ
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Oct 2023 12:39:55 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0056D404C2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Oct 2023 12:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0056D404C2
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2D6CF1FE53;
 Mon, 16 Oct 2023 12:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1697459993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eL6ySgDbw/DWW5oYRPicKcLcqT19mWB4HW/9tkojrLI=;
 b=jOzU66hyBY6xLrputrNcXG2dHW69FQ7Z4K+CoSrjNq+EH31UUSIGJgB1bXDWnGAhGeoqXY
 F1fen73x4P5J/jH+GF2g/XMNEyhXuNIgdQT9Q6IKxhDGvmPV2PV5nIjp2m/BMRmCvYQA3A
 0XY8A653CJOGQ7gwaShKdBozC09VpM0=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3E07133B7;
 Mon, 16 Oct 2023 12:39:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FPSiKhgvLWUpIwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 16 Oct 2023 12:39:52 +0000
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v2 3/4] x86/paravirt: switch mixed paravirt/alternative calls
 to alternative_2
Date: Mon, 16 Oct 2023 14:39:32 +0200
Message-Id: <20231016123933.17284-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231016123933.17284-1-jgross@suse.com>
References: <20231016123933.17284-1-jgross@suse.com>
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 DKIM_SIGNED(0.00)[suse.com:s=susede1];
 NEURAL_HAM_SHORT(-0.99)[-0.995]; NEURAL_SPAM_LONG(3.00)[1.000];
 RCPT_COUNT_TWELVE(0.00)[12]; MID_CONTAINS_FROM(1.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
Cc: Juergen Gross <jgross@suse.com>, Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ajay Kaher <akaher@vmware.com>,
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

Instead of stacking alternative and paravirt patching, use the new
ALT_FLAG_CALL flag to switch those mixed calls to pure alternative
handling.

This eliminates the need to be careful regarding the sequence of
alternative and paravirt patching.

For call depth tracking callthunks_setup() needs to be adapted to patch
calls at alternative patching sites instead of paravirt calls.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/alternative.h    |  5 +--
 arch/x86/include/asm/paravirt.h       | 49 +++++++++++++--------------
 arch/x86/include/asm/paravirt_types.h | 29 +++++++---------
 arch/x86/kernel/callthunks.c          | 17 +++++-----
 arch/x86/kernel/module.c              | 20 +++--------
 5 files changed, 51 insertions(+), 69 deletions(-)

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index dd63b96577e9..f6c0ff678e2e 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -89,6 +89,8 @@ struct alt_instr {
 	u8  replacementlen;	/* length of new instruction */
 } __packed;
 
+extern struct alt_instr __alt_instructions[], __alt_instructions_end[];
+
 /*
  * Debug flag that can be tested to see whether alternative
  * instructions were patched in already:
@@ -104,11 +106,10 @@ extern void apply_fineibt(s32 *start_retpoline, s32 *end_retpoine,
 			  s32 *start_cfi, s32 *end_cfi);
 
 struct module;
-struct paravirt_patch_site;
 
 struct callthunk_sites {
 	s32				*call_start, *call_end;
-	struct paravirt_patch_site	*pv_start, *pv_end;
+	struct alt_instr		*alt_start, *alt_end;
 };
 
 #ifdef CONFIG_CALL_THUNKS
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index ed5c7342f2ef..9c6c5cfa9fe2 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -142,8 +142,7 @@ static inline void write_cr0(unsigned long x)
 static __always_inline unsigned long read_cr2(void)
 {
 	return PVOP_ALT_CALLEE0(unsigned long, mmu.read_cr2,
-				"mov %%cr2, %%rax;",
-				ALT_NOT(X86_FEATURE_XENPV));
+				"mov %%cr2, %%rax;", ALT_NOT_XEN);
 }
 
 static __always_inline void write_cr2(unsigned long x)
@@ -154,13 +153,12 @@ static __always_inline void write_cr2(unsigned long x)
 static inline unsigned long __read_cr3(void)
 {
 	return PVOP_ALT_CALL0(unsigned long, mmu.read_cr3,
-			      "mov %%cr3, %%rax;", ALT_NOT(X86_FEATURE_XENPV));
+			      "mov %%cr3, %%rax;", ALT_NOT_XEN);
 }
 
 static inline void write_cr3(unsigned long x)
 {
-	PVOP_ALT_VCALL1(mmu.write_cr3, x,
-			"mov %%rdi, %%cr3", ALT_NOT(X86_FEATURE_XENPV));
+	PVOP_ALT_VCALL1(mmu.write_cr3, x, "mov %%rdi, %%cr3", ALT_NOT_XEN);
 }
 
 static inline void __write_cr4(unsigned long x)
@@ -182,7 +180,7 @@ extern noinstr void pv_native_wbinvd(void);
 
 static __always_inline void wbinvd(void)
 {
-	PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT(X86_FEATURE_XENPV));
+	PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT_XEN);
 }
 
 static inline u64 paravirt_read_msr(unsigned msr)
@@ -390,27 +388,25 @@ static inline void paravirt_release_p4d(unsigned long pfn)
 static inline pte_t __pte(pteval_t val)
 {
 	return (pte_t) { PVOP_ALT_CALLEE1(pteval_t, mmu.make_pte, val,
-					  "mov %%rdi, %%rax",
-					  ALT_NOT(X86_FEATURE_XENPV)) };
+					  "mov %%rdi, %%rax", ALT_NOT_XEN) };
 }
 
 static inline pteval_t pte_val(pte_t pte)
 {
 	return PVOP_ALT_CALLEE1(pteval_t, mmu.pte_val, pte.pte,
-				"mov %%rdi, %%rax", ALT_NOT(X86_FEATURE_XENPV));
+				"mov %%rdi, %%rax", ALT_NOT_XEN);
 }
 
 static inline pgd_t __pgd(pgdval_t val)
 {
 	return (pgd_t) { PVOP_ALT_CALLEE1(pgdval_t, mmu.make_pgd, val,
-					  "mov %%rdi, %%rax",
-					  ALT_NOT(X86_FEATURE_XENPV)) };
+					  "mov %%rdi, %%rax", ALT_NOT_XEN) };
 }
 
 static inline pgdval_t pgd_val(pgd_t pgd)
 {
 	return PVOP_ALT_CALLEE1(pgdval_t, mmu.pgd_val, pgd.pgd,
-				"mov %%rdi, %%rax", ALT_NOT(X86_FEATURE_XENPV));
+				"mov %%rdi, %%rax", ALT_NOT_XEN);
 }
 
 #define  __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
@@ -444,14 +440,13 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 static inline pmd_t __pmd(pmdval_t val)
 {
 	return (pmd_t) { PVOP_ALT_CALLEE1(pmdval_t, mmu.make_pmd, val,
-					  "mov %%rdi, %%rax",
-					  ALT_NOT(X86_FEATURE_XENPV)) };
+					  "mov %%rdi, %%rax", ALT_NOT_XEN) };
 }
 
 static inline pmdval_t pmd_val(pmd_t pmd)
 {
 	return PVOP_ALT_CALLEE1(pmdval_t, mmu.pmd_val, pmd.pmd,
-				"mov %%rdi, %%rax", ALT_NOT(X86_FEATURE_XENPV));
+				"mov %%rdi, %%rax", ALT_NOT_XEN);
 }
 
 static inline void set_pud(pud_t *pudp, pud_t pud)
@@ -464,7 +459,7 @@ static inline pud_t __pud(pudval_t val)
 	pudval_t ret;
 
 	ret = PVOP_ALT_CALLEE1(pudval_t, mmu.make_pud, val,
-			       "mov %%rdi, %%rax", ALT_NOT(X86_FEATURE_XENPV));
+			       "mov %%rdi, %%rax", ALT_NOT_XEN);
 
 	return (pud_t) { ret };
 }
@@ -472,7 +467,7 @@ static inline pud_t __pud(pudval_t val)
 static inline pudval_t pud_val(pud_t pud)
 {
 	return PVOP_ALT_CALLEE1(pudval_t, mmu.pud_val, pud.pud,
-				"mov %%rdi, %%rax", ALT_NOT(X86_FEATURE_XENPV));
+				"mov %%rdi, %%rax", ALT_NOT_XEN);
 }
 
 static inline void pud_clear(pud_t *pudp)
@@ -492,8 +487,7 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 static inline p4d_t __p4d(p4dval_t val)
 {
 	p4dval_t ret = PVOP_ALT_CALLEE1(p4dval_t, mmu.make_p4d, val,
-					"mov %%rdi, %%rax",
-					ALT_NOT(X86_FEATURE_XENPV));
+					"mov %%rdi, %%rax", ALT_NOT_XEN);
 
 	return (p4d_t) { ret };
 }
@@ -501,7 +495,7 @@ static inline p4d_t __p4d(p4dval_t val)
 static inline p4dval_t p4d_val(p4d_t p4d)
 {
 	return PVOP_ALT_CALLEE1(p4dval_t, mmu.p4d_val, p4d.p4d,
-				"mov %%rdi, %%rax", ALT_NOT(X86_FEATURE_XENPV));
+				"mov %%rdi, %%rax", ALT_NOT_XEN);
 }
 
 static inline void __set_pgd(pgd_t *pgdp, pgd_t pgd)
@@ -687,17 +681,17 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
 static __always_inline unsigned long arch_local_save_flags(void)
 {
 	return PVOP_ALT_CALLEE0(unsigned long, irq.save_fl, "pushf; pop %%rax;",
-				ALT_NOT(X86_FEATURE_XENPV));
+				ALT_NOT_XEN);
 }
 
 static __always_inline void arch_local_irq_disable(void)
 {
-	PVOP_ALT_VCALLEE0(irq.irq_disable, "cli;", ALT_NOT(X86_FEATURE_XENPV));
+	PVOP_ALT_VCALLEE0(irq.irq_disable, "cli;", ALT_NOT_XEN);
 }
 
 static __always_inline void arch_local_irq_enable(void)
 {
-	PVOP_ALT_VCALLEE0(irq.irq_enable, "sti;", ALT_NOT(X86_FEATURE_XENPV));
+	PVOP_ALT_VCALLEE0(irq.irq_enable, "sti;", ALT_NOT_XEN);
 }
 
 static __always_inline unsigned long arch_local_irq_save(void)
@@ -746,20 +740,23 @@ void native_pv_lock_init(void) __init;
 
 #ifdef CONFIG_X86_64
 #ifdef CONFIG_PARAVIRT_XXL
+#ifdef CONFIG_DEBUG_ENTRY
 
 #define PARA_PATCH(off)		((off) / 8)
 #define PARA_SITE(ptype, ops)	_PVSITE(ptype, ops, .quad, 8)
 #define PARA_INDIRECT(addr)	*addr(%rip)
 
-#ifdef CONFIG_DEBUG_ENTRY
 .macro PARA_IRQ_save_fl
 	PARA_SITE(PARA_PATCH(PV_IRQ_save_fl),
 		  ANNOTATE_RETPOLINE_SAFE;
 		  call PARA_INDIRECT(pv_ops+PV_IRQ_save_fl);)
+	ANNOTATE_RETPOLINE_SAFE;
+	call PARA_INDIRECT(pv_ops+PV_IRQ_save_fl);
 .endm
 
-#define SAVE_FLAGS	ALTERNATIVE "PARA_IRQ_save_fl;", "pushf; pop %rax;", \
-				    ALT_NOT(X86_FEATURE_XENPV)
+#define SAVE_FLAGS ALTERNATIVE_2 "PARA_IRQ_save_fl;",			\
+				 ALT_CALL_INSTR, ALT_CALL_ALWAYS,	\
+				 "pushf; pop %rax;", ALT_NOT_XEN
 #endif
 #endif /* CONFIG_PARAVIRT_XXL */
 #endif	/* CONFIG_X86_64 */
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 9f84dc074f88..323dca625eea 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -278,15 +278,11 @@ extern struct paravirt_patch_template pv_ops;
 #define NATIVE_LABEL(a,x,b) "\n\t.globl " a #x "_" #b "\n" a #x "_" #b ":\n\t"
 
 unsigned int paravirt_patch(u8 type, void *insn_buff, unsigned long addr, unsigned int len);
+#define paravirt_ptr(op)	[paravirt_opptr] "m" (pv_ops.op)
 
 int paravirt_disable_iospace(void);
 
-/*
- * This generates an indirect call based on the operation type number.
- * The type number, computed in PARAVIRT_PATCH, is derived from the
- * offset into the paravirt_patch_template structure, and can therefore be
- * freely converted back into a structure offset.
- */
+/* This generates an indirect call based on the operation type number. */
 #define PARAVIRT_CALL					\
 	ANNOTATE_RETPOLINE_SAFE				\
 	"call *%[paravirt_opptr];"
@@ -319,12 +315,6 @@ int paravirt_disable_iospace(void);
  * However, x86_64 also has to clobber all caller saved registers, which
  * unfortunately, are quite a bit (r8 - r11)
  *
- * The call instruction itself is marked by placing its start address
- * and size into the .parainstructions section, so that
- * apply_paravirt() in arch/i386/kernel/alternative.c can do the
- * appropriate patching under the control of the backend pv_init_ops
- * implementation.
- *
  * Unfortunately there's no way to get gcc to generate the args setup
  * for the call, and then allow the call itself to be generated by an
  * inline asm.  Because of this, we must do the complete arg setup and
@@ -428,9 +418,10 @@ int paravirt_disable_iospace(void);
 	({								\
 		PVOP_CALL_ARGS;						\
 		PVOP_TEST_NULL(op);					\
-		asm volatile(paravirt_alt(PARAVIRT_CALL)		\
+		asm volatile(ALTERNATIVE(PARAVIRT_CALL, ALT_CALL_INSTR,	\
+				ALT_CALL_ALWAYS)			\
 			     : call_clbr, ASM_CALL_CONSTRAINT		\
-			     : paravirt_type(op),			\
+			     : paravirt_ptr(op),			\
 			       ##__VA_ARGS__				\
 			     : "memory", "cc" extra_clbr);		\
 		ret;							\
@@ -441,10 +432,11 @@ int paravirt_disable_iospace(void);
 	({								\
 		PVOP_CALL_ARGS;						\
 		PVOP_TEST_NULL(op);					\
-		asm volatile(ALTERNATIVE(paravirt_alt(PARAVIRT_CALL),	\
-					 alt, cond)			\
+		asm volatile(ALTERNATIVE_2(PARAVIRT_CALL,		\
+				 ALT_CALL_INSTR, ALT_CALL_ALWAYS,	\
+				 alt, cond)				\
 			     : call_clbr, ASM_CALL_CONSTRAINT		\
-			     : paravirt_type(op),			\
+			     : paravirt_ptr(op),			\
 			       ##__VA_ARGS__				\
 			     : "memory", "cc" extra_clbr);		\
 		ret;							\
@@ -557,5 +549,8 @@ extern struct paravirt_patch_site __parainstructions[],
 	__parainstructions_end[];
 
 #endif	/* __ASSEMBLY__ */
+
+#define ALT_NOT_XEN	ALT_NOT(X86_FEATURE_XENPV)
+
 #endif  /* CONFIG_PARAVIRT */
 #endif	/* _ASM_X86_PARAVIRT_TYPES_H */
diff --git a/arch/x86/kernel/callthunks.c b/arch/x86/kernel/callthunks.c
index faa9f2299848..200ea8087ddb 100644
--- a/arch/x86/kernel/callthunks.c
+++ b/arch/x86/kernel/callthunks.c
@@ -238,14 +238,13 @@ patch_call_sites(s32 *start, s32 *end, const struct core_text *ct)
 }
 
 static __init_or_module void
-patch_paravirt_call_sites(struct paravirt_patch_site *start,
-			  struct paravirt_patch_site *end,
-			  const struct core_text *ct)
+patch_alt_call_sites(struct alt_instr *start, struct alt_instr *end,
+		     const struct core_text *ct)
 {
-	struct paravirt_patch_site *p;
+	struct alt_instr *a;
 
-	for (p = start; p < end; p++)
-		patch_call(p->instr, ct);
+	for (a = start; a < end; a++)
+		patch_call((u8 *)&a->instr_offset + a->instr_offset, ct);
 }
 
 static __init_or_module void
@@ -253,7 +252,7 @@ callthunks_setup(struct callthunk_sites *cs, const struct core_text *ct)
 {
 	prdbg("Patching call sites %s\n", ct->name);
 	patch_call_sites(cs->call_start, cs->call_end, ct);
-	patch_paravirt_call_sites(cs->pv_start, cs->pv_end, ct);
+	patch_alt_call_sites(cs->alt_start, cs->alt_end, ct);
 	prdbg("Patching call sites done%s\n", ct->name);
 }
 
@@ -262,8 +261,8 @@ void __init callthunks_patch_builtin_calls(void)
 	struct callthunk_sites cs = {
 		.call_start	= __call_sites,
 		.call_end	= __call_sites_end,
-		.pv_start	= __parainstructions,
-		.pv_end		= __parainstructions_end
+		.alt_start	= __alt_instructions,
+		.alt_end	= __alt_instructions_end
 	};
 
 	if (!cpu_feature_enabled(X86_FEATURE_CALL_DEPTH))
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index 5f71a0cf4399..e18914c0e38a 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -276,7 +276,7 @@ int module_finalize(const Elf_Ehdr *hdr,
 		    struct module *me)
 {
 	const Elf_Shdr *s, *alt = NULL, *locks = NULL,
-		*para = NULL, *orc = NULL, *orc_ip = NULL,
+		*orc = NULL, *orc_ip = NULL,
 		*retpolines = NULL, *returns = NULL, *ibt_endbr = NULL,
 		*calls = NULL, *cfi = NULL;
 	char *secstrings = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
@@ -286,8 +286,6 @@ int module_finalize(const Elf_Ehdr *hdr,
 			alt = s;
 		if (!strcmp(".smp_locks", secstrings + s->sh_name))
 			locks = s;
-		if (!strcmp(".parainstructions", secstrings + s->sh_name))
-			para = s;
 		if (!strcmp(".orc_unwind", secstrings + s->sh_name))
 			orc = s;
 		if (!strcmp(".orc_unwind_ip", secstrings + s->sh_name))
@@ -304,14 +302,6 @@ int module_finalize(const Elf_Ehdr *hdr,
 			ibt_endbr = s;
 	}
 
-	/*
-	 * See alternative_instructions() for the ordering rules between the
-	 * various patching types.
-	 */
-	if (para) {
-		void *pseg = (void *)para->sh_addr;
-		apply_paravirt(pseg, pseg + para->sh_size);
-	}
 	if (retpolines || cfi) {
 		void *rseg = NULL, *cseg = NULL;
 		unsigned int rsize = 0, csize = 0;
@@ -341,7 +331,7 @@ int module_finalize(const Elf_Ehdr *hdr,
 		void *aseg = (void *)alt->sh_addr;
 		apply_alternatives(aseg, aseg + alt->sh_size);
 	}
-	if (calls || para) {
+	if (calls || alt) {
 		struct callthunk_sites cs = {};
 
 		if (calls) {
@@ -349,9 +339,9 @@ int module_finalize(const Elf_Ehdr *hdr,
 			cs.call_end = (void *)calls->sh_addr + calls->sh_size;
 		}
 
-		if (para) {
-			cs.pv_start = (void *)para->sh_addr;
-			cs.pv_end = (void *)para->sh_addr + para->sh_size;
+		if (alt) {
+			cs.alt_start = (void *)alt->sh_addr;
+			cs.alt_end = (void *)alt->sh_addr + alt->sh_size;
 		}
 
 		callthunks_patch_module_calls(&cs, me);
-- 
2.35.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
