Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FD924F618
	for <lists.virtualization@lfdr.de>; Mon, 24 Aug 2020 10:56:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 49AFA85DE1;
	Mon, 24 Aug 2020 08:56:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OfvFwP5FF4VO; Mon, 24 Aug 2020 08:56:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 344F085F4D;
	Mon, 24 Aug 2020 08:56:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D952C0051;
	Mon, 24 Aug 2020 08:56:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AD79C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0E5A488146
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DhieamEJPept
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 32137882DD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:16 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2bb8d.dip0.t-ipconnect.de
 [79.242.187.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 8845BF84;
 Mon, 24 Aug 2020 10:56:07 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v6 37/76] x86/head/64: Move early exception dispatch to C code
Date: Mon, 24 Aug 2020 10:54:32 +0200
Message-Id: <20200824085511.7553-38-joro@8bytes.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824085511.7553-1-joro@8bytes.org>
References: <20200824085511.7553-1-joro@8bytes.org>
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

Move the assembly coded dispatch between page-faults and all other
exceptions to C code to make it easier to maintain and extend.

Also change the return-type of early_make_pgtable() to bool and make it
static.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Link: https://lore.kernel.org/r/20200724160336.5435-37-joro@8bytes.org
---
 arch/x86/include/asm/pgtable.h |  2 +-
 arch/x86/include/asm/setup.h   |  4 +++-
 arch/x86/kernel/head64.c       | 19 +++++++++++++++----
 arch/x86/kernel/head_64.S      | 11 +----------
 4 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 5e0dcc20614d..a02c67291cfc 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -28,7 +28,7 @@
 #include <asm-generic/pgtable_uffd.h>
 
 extern pgd_t early_top_pgt[PTRS_PER_PGD];
-int __init __early_make_pgtable(unsigned long address, pmdval_t pmd);
+bool __init __early_make_pgtable(unsigned long address, pmdval_t pmd);
 
 void ptdump_walk_pgd_level(struct seq_file *m, struct mm_struct *mm);
 void ptdump_walk_pgd_level_debugfs(struct seq_file *m, struct mm_struct *mm,
diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index 5c09f50ecf1c..cafae86813ae 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -39,6 +39,8 @@ void vsmp_init(void);
 static inline void vsmp_init(void) { }
 #endif
 
+struct pt_regs;
+
 void setup_bios_corruption_check(void);
 void early_platform_quirks(void);
 
@@ -49,9 +51,9 @@ extern void i386_reserve_resources(void);
 extern unsigned long __startup_64(unsigned long physaddr, struct boot_params *bp);
 extern unsigned long __startup_secondary_64(void);
 extern void startup_64_setup_env(unsigned long physbase);
-extern int early_make_pgtable(unsigned long address);
 extern void early_idt_setup_early_handler(unsigned long physaddr);
 extern void early_load_idt(void);
+extern void __init do_early_exception(struct pt_regs *regs, int trapnr);
 
 #ifdef CONFIG_X86_INTEL_MID
 extern void x86_intel_mid_early_setup(void);
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 096b09d06d1c..41514ec1e6f0 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -37,6 +37,8 @@
 #include <asm/kasan.h>
 #include <asm/fixmap.h>
 #include <asm/realmode.h>
+#include <asm/extable.h>
+#include <asm/trapnr.h>
 
 /*
  * Manage page tables very early on.
@@ -314,7 +316,7 @@ static void __init reset_early_page_tables(void)
 }
 
 /* Create a new PMD entry */
-int __init __early_make_pgtable(unsigned long address, pmdval_t pmd)
+bool __init __early_make_pgtable(unsigned long address, pmdval_t pmd)
 {
 	unsigned long physaddr = address - __PAGE_OFFSET;
 	pgdval_t pgd, *pgd_p;
@@ -324,7 +326,7 @@ int __init __early_make_pgtable(unsigned long address, pmdval_t pmd)
 
 	/* Invalid address or early pgt is done ?  */
 	if (physaddr >= MAXMEM || read_cr3_pa() != __pa_nodebug(early_top_pgt))
-		return -1;
+		return false;
 
 again:
 	pgd_p = &early_top_pgt[pgd_index(address)].pgd;
@@ -381,10 +383,10 @@ int __init __early_make_pgtable(unsigned long address, pmdval_t pmd)
 	}
 	pmd_p[pmd_index(address)] = pmd;
 
-	return 0;
+	return true;
 }
 
-int __init early_make_pgtable(unsigned long address)
+static bool __init early_make_pgtable(unsigned long address)
 {
 	unsigned long physaddr = address - __PAGE_OFFSET;
 	pmdval_t pmd;
@@ -394,6 +396,15 @@ int __init early_make_pgtable(unsigned long address)
 	return __early_make_pgtable(address, pmd);
 }
 
+void __init do_early_exception(struct pt_regs *regs, int trapnr)
+{
+	if (trapnr == X86_TRAP_PF &&
+	    early_make_pgtable(native_read_cr2()))
+		return;
+
+	early_fixup_exception(regs, trapnr);
+}
+
 /* Don't add a printk in there. printk relies on the PDA which is not initialized 
    yet. */
 static void __init clear_bss(void)
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 28de83fecda3..08412f308de3 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -349,18 +349,9 @@ SYM_CODE_START_LOCAL(early_idt_handler_common)
 	pushq %r15				/* pt_regs->r15 */
 	UNWIND_HINT_REGS
 
-	cmpq $14,%rsi		/* Page fault? */
-	jnz 10f
-	GET_CR2_INTO(%rdi)	/* can clobber %rax if pv */
-	call early_make_pgtable
-	andl %eax,%eax
-	jz 20f			/* All good */
-
-10:
 	movq %rsp,%rdi		/* RDI = pt_regs; RSI is already trapnr */
-	call early_fixup_exception
+	call do_early_exception
 
-20:
 	decl early_recursion_flag(%rip)
 	jmp restore_regs_and_return_to_kernel
 SYM_CODE_END(early_idt_handler_common)
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
