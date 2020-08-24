Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CC10124F625
	for <lists.virtualization@lfdr.de>; Mon, 24 Aug 2020 10:56:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8A1CC85EAF;
	Mon, 24 Aug 2020 08:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNLjT8xc-oWn; Mon, 24 Aug 2020 08:56:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EAF0185DF8;
	Mon, 24 Aug 2020 08:56:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD149C0051;
	Mon, 24 Aug 2020 08:56:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2CF95C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F2F812051A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TEnNUph0h-QV
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 363C1207A9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:16 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2bb8d.dip0.t-ipconnect.de
 [79.242.187.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id DB23EF6F;
 Mon, 24 Aug 2020 10:56:06 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v6 36/76] x86/head/64: Load IDT earlier
Date: Mon, 24 Aug 2020 10:54:31 +0200
Message-Id: <20200824085511.7553-37-joro@8bytes.org>
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

Load the IDT right after switching to virtual addresses in head_64.S
so that the kernel can handle #VC exceptions.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Link: https://lore.kernel.org/r/20200724160336.5435-36-joro@8bytes.org
---
 arch/x86/include/asm/setup.h |  3 +++
 arch/x86/kernel/head64.c     |  3 +++
 arch/x86/kernel/head_64.S    |  5 +++++
 arch/x86/kernel/idt.c        | 23 +++++++++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index 8aa6ba0427b0..5c09f50ecf1c 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -50,6 +50,8 @@ extern unsigned long __startup_64(unsigned long physaddr, struct boot_params *bp
 extern unsigned long __startup_secondary_64(void);
 extern void startup_64_setup_env(unsigned long physbase);
 extern int early_make_pgtable(unsigned long address);
+extern void early_idt_setup_early_handler(unsigned long physaddr);
+extern void early_load_idt(void);
 
 #ifdef CONFIG_X86_INTEL_MID
 extern void x86_intel_mid_early_setup(void);
@@ -66,6 +68,7 @@ static inline void x86_ce4100_early_setup(void) { }
 #ifndef _SETUP
 
 #include <asm/espfix.h>
+#include <asm/sections.h>
 #include <linux/kernel.h>
 
 /*
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 8703292a35e9..096b09d06d1c 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -286,6 +286,9 @@ unsigned long __head __startup_64(unsigned long physaddr,
 		}
 	}
 
+	/* Setup IDT with early handlers */
+	early_idt_setup_early_handler(physaddr);
+
 	/*
 	 * Return the SME encryption mask (if SME is active) to be used as a
 	 * modifier for the initial pgdir entry programmed into CR3.
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index a5e1939d1dc9..28de83fecda3 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -206,6 +206,11 @@ SYM_CODE_START(secondary_startup_64)
 	 */
 	movq initial_stack(%rip), %rsp
 
+	/* Load IDT */
+	pushq	%rsi
+	call	early_load_idt
+	popq	%rsi
+
 	/* Check if nx is implemented */
 	movl	$0x80000001, %eax
 	cpuid
diff --git a/arch/x86/kernel/idt.c b/arch/x86/kernel/idt.c
index c19773174221..e2777cc264f5 100644
--- a/arch/x86/kernel/idt.c
+++ b/arch/x86/kernel/idt.c
@@ -10,6 +10,7 @@
 #include <asm/proto.h>
 #include <asm/desc.h>
 #include <asm/hw_irq.h>
+#include <asm/setup.h>
 
 struct idt_data {
 	unsigned int	vector;
@@ -385,3 +386,25 @@ void __init alloc_intr_gate(unsigned int n, const void *addr)
 	if (!WARN_ON(test_and_set_bit(n, system_vectors)))
 		set_intr_gate(n, addr);
 }
+
+void __init early_idt_setup_early_handler(unsigned long physaddr)
+{
+	gate_desc *idt;
+	int i;
+
+	idt = fixup_pointer(idt_table, physaddr);
+
+	for (i = 0; i < NUM_EXCEPTION_VECTORS; i++) {
+		struct idt_data data;
+		gate_desc desc;
+
+		init_idt_data(&data, i, early_idt_handler_array[i]);
+		idt_init_desc(&desc, &data);
+		native_write_idt_entry(idt, i, &desc);
+	}
+}
+
+void early_load_idt(void)
+{
+	load_idt(&idt_descr);
+}
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
