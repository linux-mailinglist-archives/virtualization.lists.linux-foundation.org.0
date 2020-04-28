Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5A61BC385
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 17:26:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B283E875D6;
	Tue, 28 Apr 2020 15:26:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIR-ITGtOsDF; Tue, 28 Apr 2020 15:26:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8539B87657;
	Tue, 28 Apr 2020 15:26:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7788DC0863;
	Tue, 28 Apr 2020 15:26:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2BDD7C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 201B88829D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTLw6ctBgQqO
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7C6C088277
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:42 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D7287F4A; Tue, 28 Apr 2020 17:17:55 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 70/75] x86/head/64: Setup TSS early for secondary CPUs
Date: Tue, 28 Apr 2020 17:17:20 +0200
Message-Id: <20200428151725.31091-71-joro@8bytes.org>
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

The #VC exception will trigger very early in head_64.S, when the first
CPUID instruction is executed. When secondary CPUs boot, they already
load the real system IDT, which has the #VC handler configured to be
using an IST stack. IST stacks require a TSS to be loaded, to set up the
TSS early for bringing up the secondary CPUs. Use the RW version of
early, until cpu_init() switches to the RO mapping.

On the boot CPU the TSS will also be loaded early, but not used as the
the early #VC handlers do not use IST stacks.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/desc.h |  2 ++
 arch/x86/kernel/head64.c    | 13 +++++++++++++
 arch/x86/kernel/head_64.S   |  3 +++
 3 files changed, 18 insertions(+)

diff --git a/arch/x86/include/asm/desc.h b/arch/x86/include/asm/desc.h
index 30e2a0e863b6..0777b100dc63 100644
--- a/arch/x86/include/asm/desc.h
+++ b/arch/x86/include/asm/desc.h
@@ -40,6 +40,8 @@ static inline void fill_ldt(struct desc_struct *desc, const struct user_desc *in
 	desc->l			= 0;
 }
 
+extern unsigned char boot_gdt[];
+
 extern struct desc_ptr idt_descr;
 extern gate_desc idt_table[];
 extern const struct desc_ptr debug_idt_descr;
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index d83d59c15548..30a6d09fd9d0 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -523,6 +523,19 @@ void __head early_idt_setup_early_handler(unsigned long physaddr)
 	}
 }
 
+void __head early_load_tss(void)
+{
+	struct desc_struct *gdt = (struct desc_struct *)boot_gdt;
+	struct tss_struct *tss = this_cpu_ptr(&cpu_tss_rw);
+	tss_desc tss_desc;
+
+	set_tssldt_descriptor(&tss_desc, (unsigned long)tss, DESC_TSS,
+			      __KERNEL_TSS_LIMIT);
+	native_write_gdt_entry(gdt, GDT_ENTRY_TSS, &tss_desc, DESC_TSS);
+
+	asm volatile("ltr %w0"::"q" (GDT_ENTRY_TSS*8));
+}
+
 void __head early_idt_setup(unsigned long physbase)
 {
 	gate_desc *idt = fixup_pointer(idt_table, physbase);
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 4d84a0c72e36..7f2d5e14db73 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -220,6 +220,9 @@ SYM_CODE_START(secondary_startup_64)
 	 */
 	movq initial_stack(%rip), %rsp
 
+	/* Setup a TSS for early IST handlers - needs %gs to be set up */
+	call	early_load_tss
+
 	/* Load IDT */
 	lidt	idt_descr(%rip)
 
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
