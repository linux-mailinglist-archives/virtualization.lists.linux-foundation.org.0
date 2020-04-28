Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 331401BC297
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 17:18:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C605A8761D;
	Tue, 28 Apr 2020 15:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PsMXy3rhYbd6; Tue, 28 Apr 2020 15:18:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C5089875CA;
	Tue, 28 Apr 2020 15:17:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA9C4C0863;
	Tue, 28 Apr 2020 15:17:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6980DC088A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4F06C22851
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CQDKUmlaSLKY
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:17:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 65EE022846
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:17:50 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 23C2B791; Tue, 28 Apr 2020 17:17:43 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 05/75] x86/traps: Move some definitions to <asm/trap_defs.h>
Date: Tue, 28 Apr 2020 17:16:15 +0200
Message-Id: <20200428151725.31091-6-joro@8bytes.org>
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

Move the definition of x86 trap vector numbers and the page-fault
error code bits to the new header file asm/trap_defs.h. This makes it
easier to include them into pre-decompression boot code. No functional
changes.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/trap_defs.h | 49 ++++++++++++++++++++++++++++++++
 arch/x86/include/asm/traps.h     | 44 +---------------------------
 2 files changed, 50 insertions(+), 43 deletions(-)
 create mode 100644 arch/x86/include/asm/trap_defs.h

diff --git a/arch/x86/include/asm/trap_defs.h b/arch/x86/include/asm/trap_defs.h
new file mode 100644
index 000000000000..488f82ac36da
--- /dev/null
+++ b/arch/x86/include/asm/trap_defs.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_TRAP_DEFS_H
+#define _ASM_X86_TRAP_DEFS_H
+
+/* Interrupts/Exceptions */
+enum {
+	X86_TRAP_DE = 0,	/*  0, Divide-by-zero */
+	X86_TRAP_DB,		/*  1, Debug */
+	X86_TRAP_NMI,		/*  2, Non-maskable Interrupt */
+	X86_TRAP_BP,		/*  3, Breakpoint */
+	X86_TRAP_OF,		/*  4, Overflow */
+	X86_TRAP_BR,		/*  5, Bound Range Exceeded */
+	X86_TRAP_UD,		/*  6, Invalid Opcode */
+	X86_TRAP_NM,		/*  7, Device Not Available */
+	X86_TRAP_DF,		/*  8, Double Fault */
+	X86_TRAP_OLD_MF,	/*  9, Coprocessor Segment Overrun */
+	X86_TRAP_TS,		/* 10, Invalid TSS */
+	X86_TRAP_NP,		/* 11, Segment Not Present */
+	X86_TRAP_SS,		/* 12, Stack Segment Fault */
+	X86_TRAP_GP,		/* 13, General Protection Fault */
+	X86_TRAP_PF,		/* 14, Page Fault */
+	X86_TRAP_SPURIOUS,	/* 15, Spurious Interrupt */
+	X86_TRAP_MF,		/* 16, x87 Floating-Point Exception */
+	X86_TRAP_AC,		/* 17, Alignment Check */
+	X86_TRAP_MC,		/* 18, Machine Check */
+	X86_TRAP_XF,		/* 19, SIMD Floating-Point Exception */
+	X86_TRAP_IRET = 32,	/* 32, IRET Exception */
+};
+
+/*
+ * Page fault error code bits:
+ *
+ *   bit 0 ==	 0: no page found	1: protection fault
+ *   bit 1 ==	 0: read access		1: write access
+ *   bit 2 ==	 0: kernel-mode access	1: user-mode access
+ *   bit 3 ==				1: use of reserved bit detected
+ *   bit 4 ==				1: fault was an instruction fetch
+ *   bit 5 ==				1: protection keys block access
+ */
+enum x86_pf_error_code {
+	X86_PF_PROT	=		1 << 0,
+	X86_PF_WRITE	=		1 << 1,
+	X86_PF_USER	=		1 << 2,
+	X86_PF_RSVD	=		1 << 3,
+	X86_PF_INSTR	=		1 << 4,
+	X86_PF_PK	=		1 << 5,
+};
+
+#endif /* _ASM_X86_TRAP_DEFS_H */
diff --git a/arch/x86/include/asm/traps.h b/arch/x86/include/asm/traps.h
index c26a7e1d8a2c..104991c05425 100644
--- a/arch/x86/include/asm/traps.h
+++ b/arch/x86/include/asm/traps.h
@@ -5,6 +5,7 @@
 #include <linux/context_tracking_state.h>
 #include <linux/kprobes.h>
 
+#include <asm/trap_defs.h>
 #include <asm/debugreg.h>
 #include <asm/siginfo.h>			/* TRAP_TRACE, ... */
 
@@ -129,47 +130,4 @@ void __noreturn handle_stack_overflow(const char *message,
 				      unsigned long fault_address);
 #endif
 
-/* Interrupts/Exceptions */
-enum {
-	X86_TRAP_DE = 0,	/*  0, Divide-by-zero */
-	X86_TRAP_DB,		/*  1, Debug */
-	X86_TRAP_NMI,		/*  2, Non-maskable Interrupt */
-	X86_TRAP_BP,		/*  3, Breakpoint */
-	X86_TRAP_OF,		/*  4, Overflow */
-	X86_TRAP_BR,		/*  5, Bound Range Exceeded */
-	X86_TRAP_UD,		/*  6, Invalid Opcode */
-	X86_TRAP_NM,		/*  7, Device Not Available */
-	X86_TRAP_DF,		/*  8, Double Fault */
-	X86_TRAP_OLD_MF,	/*  9, Coprocessor Segment Overrun */
-	X86_TRAP_TS,		/* 10, Invalid TSS */
-	X86_TRAP_NP,		/* 11, Segment Not Present */
-	X86_TRAP_SS,		/* 12, Stack Segment Fault */
-	X86_TRAP_GP,		/* 13, General Protection Fault */
-	X86_TRAP_PF,		/* 14, Page Fault */
-	X86_TRAP_SPURIOUS,	/* 15, Spurious Interrupt */
-	X86_TRAP_MF,		/* 16, x87 Floating-Point Exception */
-	X86_TRAP_AC,		/* 17, Alignment Check */
-	X86_TRAP_MC,		/* 18, Machine Check */
-	X86_TRAP_XF,		/* 19, SIMD Floating-Point Exception */
-	X86_TRAP_IRET = 32,	/* 32, IRET Exception */
-};
-
-/*
- * Page fault error code bits:
- *
- *   bit 0 ==	 0: no page found	1: protection fault
- *   bit 1 ==	 0: read access		1: write access
- *   bit 2 ==	 0: kernel-mode access	1: user-mode access
- *   bit 3 ==				1: use of reserved bit detected
- *   bit 4 ==				1: fault was an instruction fetch
- *   bit 5 ==				1: protection keys block access
- */
-enum x86_pf_error_code {
-	X86_PF_PROT	=		1 << 0,
-	X86_PF_WRITE	=		1 << 1,
-	X86_PF_USER	=		1 << 2,
-	X86_PF_RSVD	=		1 << 3,
-	X86_PF_INSTR	=		1 << 4,
-	X86_PF_PK	=		1 << 5,
-};
 #endif /* _ASM_X86_TRAPS_H */
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
