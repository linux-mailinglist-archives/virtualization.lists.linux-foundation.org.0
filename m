Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E57EF21F107
	for <lists.virtualization@lfdr.de>; Tue, 14 Jul 2020 14:18:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8DD802E763;
	Tue, 14 Jul 2020 12:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-vIToYBbxYO; Tue, 14 Jul 2020 12:18:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3A7F92EABD;
	Tue, 14 Jul 2020 12:18:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EC7AC0888;
	Tue, 14 Jul 2020 12:18:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95839C0888
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 921F48A43E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZYH2-C7hZgi
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 12D548A443
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:36 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 3BFD8FEA;
 Tue, 14 Jul 2020 14:11:11 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v4 69/75] x86/head/64: Setup TSS early for secondary CPUs
Date: Tue, 14 Jul 2020 14:09:11 +0200
Message-Id: <20200714120917.11253-70-joro@8bytes.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714120917.11253-1-joro@8bytes.org>
References: <20200714120917.11253-1-joro@8bytes.org>
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

The #VC exception will trigger very early in head_64.S, when the first
CPUID instruction is executed. When secondary CPUs boot, they already
load the real system IDT, which has the #VC handler configured to use an
IST stack. IST stacks require a TSS to be loaded, so set up the TSS
early for bringing up the secondary CPUs. Use the read-write version of
the per-CPU TSS struct early, until cpu_init() switches to the read-only
mapping.

On the boot CPU the TSS will also be loaded early, but not used as the
the early boot #VC handlers do not use IST stacks.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/head64.c  | 13 +++++++++++++
 arch/x86/kernel/head_64.S |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 23d492091f3b..f57eefb1e4ba 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -545,6 +545,19 @@ void __head early_idt_setup_early_handler(unsigned long descr_addr, unsigned lon
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
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 static void __head set_early_idt_handler(gate_desc *idt, int n, void *handler)
 {
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 3bd4c36d1d36..5b577d6bce7a 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -235,6 +235,11 @@ SYM_CODE_START(secondary_startup_64)
 	 */
 	movq initial_stack(%rip), %rsp
 
+	/* Setup a TSS for early IST handlers - needs %gs to be set up */
+	pushq	%rsi
+	call	early_load_tss
+	popq	%rsi
+
 	/* Load IDT */
 	lidt	idt_descr(%rip)
 
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
