Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C0722C9E6
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 18:04:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EB8A188765;
	Fri, 24 Jul 2020 16:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kI-9lngIbJUZ; Fri, 24 Jul 2020 16:04:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 22764886CE;
	Fri, 24 Jul 2020 16:04:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09399C004C;
	Fri, 24 Jul 2020 16:04:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 590F1C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 42A2788700
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id shUx484ZHl+Y
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 63D8A88731
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:28 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id EA64EFBF;
 Fri, 24 Jul 2020 18:04:16 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v5 36/75] x86/head/64: Move early exception dispatch to C code
Date: Fri, 24 Jul 2020 18:02:57 +0200
Message-Id: <20200724160336.5435-37-joro@8bytes.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724160336.5435-1-joro@8bytes.org>
References: <20200724160336.5435-1-joro@8bytes.org>
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
---
 arch/x86/include/asm/pgtable.h |  2 +-
 arch/x86/include/asm/setup.h   |  1 -
 arch/x86/kernel/head64.c       | 19 +++++++++++++++----
 arch/x86/kernel/head_64.S      | 11 +----------
 4 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index b836138ce852..7b8f2127de37 100644
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
index 5c09f50ecf1c..78bdc0f686fb 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -49,7 +49,6 @@ extern void i386_reserve_resources(void);
 extern unsigned long __startup_64(unsigned long physaddr, struct boot_params *bp);
 extern unsigned long __startup_secondary_64(void);
 extern void startup_64_setup_env(unsigned long physbase);
-extern int early_make_pgtable(unsigned long address);
 extern void early_idt_setup_early_handler(unsigned long physaddr);
 extern void early_load_idt(void);
 
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
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
