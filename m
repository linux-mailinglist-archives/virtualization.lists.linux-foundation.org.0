Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 795D61BC2A7
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 17:18:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 289AD8761E;
	Tue, 28 Apr 2020 15:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id riSuKati-+4u; Tue, 28 Apr 2020 15:18:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E20AA87626;
	Tue, 28 Apr 2020 15:18:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7D02C0863;
	Tue, 28 Apr 2020 15:18:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5015EC0888
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4940322851
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RgQgsdt0WDOe
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:17:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 5EECD22854
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:17:58 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E238FE96; Tue, 28 Apr 2020 17:17:44 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 15/75] x86/boot/compressed/64: Add page-fault handler
Date: Tue, 28 Apr 2020 17:16:25 +0200
Message-Id: <20200428151725.31091-16-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428151725.31091-1-joro@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Joerg Roedel <jroedel@suse.de>

Install a page-fault handler to add an identity mapping to addresses
not yet mapped. Also do some checking whether the error code is sane.

This makes non SEV-ES machines use the exception handling
infrastructure in the pre-decompressions boot code too, making it less
likely to break in the future.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/ident_map_64.c    | 33 ++++++++++++++++++++++
 arch/x86/boot/compressed/idt_64.c          |  2 ++
 arch/x86/boot/compressed/idt_handlers_64.S |  2 ++
 arch/x86/boot/compressed/misc.h            |  6 ++++
 4 files changed, 43 insertions(+)

diff --git a/arch/x86/boot/compressed/ident_map_64.c b/arch/x86/boot/compressed/ident_map_64.c
index 3a2115582920..33bdf923cbab 100644
--- a/arch/x86/boot/compressed/ident_map_64.c
+++ b/arch/x86/boot/compressed/ident_map_64.c
@@ -19,11 +19,13 @@
 /* No PAGE_TABLE_ISOLATION support needed either: */
 #undef CONFIG_PAGE_TABLE_ISOLATION
 
+#include "error.h"
 #include "misc.h"
 
 /* These actually do the work of building the kernel identity maps. */
 #include <asm/init.h>
 #include <asm/pgtable.h>
+#include <asm/trap_defs.h>
 /* Use the static base for this part of the boot process */
 #undef __PAGE_OFFSET
 #define __PAGE_OFFSET __PAGE_OFFSET_BASE
@@ -163,3 +165,34 @@ void finalize_identity_maps(void)
 {
 	write_cr3(top_level_pgt);
 }
+
+void do_boot_page_fault(struct pt_regs *regs, unsigned long error_code)
+{
+	unsigned long address = native_read_cr2();
+
+	/*
+	 * Check for unexpected error codes. Unexpected are:
+	 *	- Faults on present pages
+	 *	- User faults
+	 *	- Reserved bits set
+	 */
+	if (error_code & (X86_PF_PROT | X86_PF_USER | X86_PF_RSVD)) {
+		/* Print some information for debugging */
+		error_putstr("Unexpected page-fault:");
+		error_putstr("\nError Code: ");
+		error_puthex(error_code);
+		error_putstr("\nCR2: 0x");
+		error_puthex(address);
+		error_putstr("\nRIP relative to _head: 0x");
+		error_puthex(regs->ip - (unsigned long)_head);
+		error_putstr("\n");
+
+		error("Stopping.\n");
+	}
+
+	/*
+	 * Error code is sane - now identity map the 2M region around
+	 * the faulting address.
+	 */
+	add_identity_map(address & PMD_MASK, PMD_SIZE);
+}
diff --git a/arch/x86/boot/compressed/idt_64.c b/arch/x86/boot/compressed/idt_64.c
index 46ecea671b90..99cc78062684 100644
--- a/arch/x86/boot/compressed/idt_64.c
+++ b/arch/x86/boot/compressed/idt_64.c
@@ -39,5 +39,7 @@ void load_stage2_idt(void)
 {
 	boot_idt_desc.address = (unsigned long)boot_idt;
 
+	set_idt_entry(X86_TRAP_PF, boot_page_fault);
+
 	load_boot_idt(&boot_idt_desc);
 }
diff --git a/arch/x86/boot/compressed/idt_handlers_64.S b/arch/x86/boot/compressed/idt_handlers_64.S
index f86ea872d860..eda50cbdafa0 100644
--- a/arch/x86/boot/compressed/idt_handlers_64.S
+++ b/arch/x86/boot/compressed/idt_handlers_64.S
@@ -67,3 +67,5 @@ SYM_FUNC_END(\name)
 
 	.text
 	.code64
+
+EXCEPTION_HANDLER	boot_page_fault do_boot_page_fault error_code=1
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 3a030a878d53..345c90fbc500 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -37,6 +37,9 @@
 #define memptr unsigned
 #endif
 
+/* boot/compressed/vmlinux start and end markers */
+extern char _head[], _end[];
+
 /* misc.c */
 extern memptr free_mem_ptr;
 extern memptr free_mem_end_ptr;
@@ -146,4 +149,7 @@ extern pteval_t __default_kernel_pte_mask;
 extern gate_desc boot_idt[BOOT_IDT_ENTRIES];
 extern struct desc_ptr boot_idt_desc;
 
+/* IDT Entry Points */
+void boot_page_fault(void);
+
 #endif /* BOOT_COMPRESSED_MISC_H */
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
