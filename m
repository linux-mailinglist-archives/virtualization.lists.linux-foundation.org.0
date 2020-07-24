Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A5C22C9E4
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 18:04:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A03DD23BC0;
	Fri, 24 Jul 2020 16:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H83madbVe-tL; Fri, 24 Jul 2020 16:04:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8B3FF240DF;
	Fri, 24 Jul 2020 16:04:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56E5CC004D;
	Fri, 24 Jul 2020 16:04:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF392C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AF8212377F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdciD5-Dt8hs
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id BBA2723799
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:22 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id C2DC1F95;
 Fri, 24 Jul 2020 18:04:11 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v5 29/75] x86/head/64: Install startup GDT
Date: Fri, 24 Jul 2020 18:02:50 +0200
Message-Id: <20200724160336.5435-30-joro@8bytes.org>
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

Handling exceptions during boot requires a working GDT. The kernel GDT
can't be used on the direct mapping, so load a startup GDT and setup
segments.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/setup.h |  1 +
 arch/x86/kernel/head64.c     | 33 +++++++++++++++++++++++++++++++++
 arch/x86/kernel/head_64.S    | 14 ++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index 84b645cc8bc9..5c2fd05bd52c 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -48,6 +48,7 @@ extern void reserve_standard_io_resources(void);
 extern void i386_reserve_resources(void);
 extern unsigned long __startup_64(unsigned long physaddr, struct boot_params *bp);
 extern unsigned long __startup_secondary_64(void);
+extern void startup_64_setup_env(unsigned long physbase);
 extern int early_make_pgtable(unsigned long address);
 
 #ifdef CONFIG_X86_INTEL_MID
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index cbb71c1b574f..8c82be44be94 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -61,6 +61,24 @@ unsigned long vmemmap_base __ro_after_init = __VMEMMAP_BASE_L4;
 EXPORT_SYMBOL(vmemmap_base);
 #endif
 
+/*
+ * GDT used on the boot CPU before switching to virtual addresses.
+ */
+static struct desc_struct startup_gdt[GDT_ENTRIES] = {
+	[GDT_ENTRY_KERNEL32_CS]         = GDT_ENTRY_INIT(0xc09b, 0, 0xfffff),
+	[GDT_ENTRY_KERNEL_CS]           = GDT_ENTRY_INIT(0xa09b, 0, 0xfffff),
+	[GDT_ENTRY_KERNEL_DS]           = GDT_ENTRY_INIT(0xc093, 0, 0xfffff),
+};
+
+/*
+ * Address needs to be set at runtime because it references the startup_gdt
+ * while the kernel still uses a direct mapping.
+ */
+static struct desc_ptr startup_gdt_descr = {
+	.size = sizeof(startup_gdt),
+	.address = 0,
+};
+
 #define __head	__section(.head.text)
 
 static void __head *fixup_pointer(void *ptr, unsigned long physaddr)
@@ -489,3 +507,18 @@ void __init x86_64_start_reservations(char *real_mode_data)
 
 	start_kernel();
 }
+
+/*
+ * Setup boot CPU state needed before kernel switches to virtual addresses.
+ */
+void __head startup_64_setup_env(unsigned long physbase)
+{
+	/* Load GDT */
+	startup_gdt_descr.address = (unsigned long)fixup_pointer(startup_gdt, physbase);
+	native_load_gdt(&startup_gdt_descr);
+
+	/* New GDT is live - reload data segment registers */
+	asm volatile("movl %%eax, %%ds\n"
+		     "movl %%eax, %%ss\n"
+		     "movl %%eax, %%es\n" : : "a"(__KERNEL_DS) : "memory");
+}
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 16da4ac01597..2b2e91627221 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -73,6 +73,20 @@ SYM_CODE_START_NOALIGN(startup_64)
 	/* Set up the stack for verify_cpu(), similar to initial_stack below */
 	leaq	(__end_init_task - SIZEOF_PTREGS)(%rip), %rsp
 
+	leaq	_text(%rip), %rdi
+	pushq	%rsi
+	call	startup_64_setup_env
+	popq	%rsi
+
+	/* Now switch to __KERNEL_CS so IRET works reliably */
+	pushq	$__KERNEL_CS
+	leaq	.Lon_kernel_cs(%rip), %rax
+	pushq	%rax
+	lretq
+
+.Lon_kernel_cs:
+	UNWIND_HINT_EMPTY
+
 	/* Sanitize CPU configuration */
 	call verify_cpu
 
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
