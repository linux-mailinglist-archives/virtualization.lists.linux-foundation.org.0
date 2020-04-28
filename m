Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC951BC2C7
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 17:18:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 46CD287593;
	Tue, 28 Apr 2020 15:18:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BEWiHe5RbCYW; Tue, 28 Apr 2020 15:18:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2CE2F8748A;
	Tue, 28 Apr 2020 15:18:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13621C0863;
	Tue, 28 Apr 2020 15:18:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB466C088C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8ADB722803
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o57eINytK9L5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 3A3BC22851
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:04 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E526AF0E; Tue, 28 Apr 2020 17:17:47 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 31/75] x86/head/64: Install boot GDT
Date: Tue, 28 Apr 2020 17:16:41 +0200
Message-Id: <20200428151725.31091-32-joro@8bytes.org>
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

Handling exceptions during boot requires a working GDT. The kernel GDT
is not yet ready for use, so install a temporary boot GDT.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/head_64.S | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 4bbc770af632..11a28c1fb51f 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -72,6 +72,26 @@ SYM_CODE_START_NOALIGN(startup_64)
 	/* Set up the stack for verify_cpu(), similar to initial_stack below */
 	leaq	(__end_init_task - SIZEOF_PTREGS)(%rip), %rsp
 
+	/* Setup boot GDT descriptor and load boot GDT */
+	leaq	boot_gdt(%rip), %rax
+	movq	%rax, boot_gdt_base(%rip)
+	lgdt	boot_gdt_descr(%rip)
+
+	/* New GDT is live - reload data segment registers */
+	movl	$__KERNEL_DS, %eax
+	movl	%eax, %ds
+	movl	%eax, %ss
+	movl	%eax, %es
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
 
@@ -480,6 +500,22 @@ SYM_DATA_LOCAL(early_gdt_descr_base,	.quad INIT_PER_CPU_VAR(gdt_page))
 SYM_DATA(phys_base, .quad 0x0)
 EXPORT_SYMBOL(phys_base)
 
+/* Boot GDT used when kernel addresses are not mapped yet */
+SYM_DATA_LOCAL(boot_gdt_descr,		.word boot_gdt_end - boot_gdt)
+SYM_DATA_LOCAL(boot_gdt_base,		.quad 0)
+SYM_DATA_START(boot_gdt)
+	.quad	0
+	.quad   0x00cf9a000000ffff	/* __KERNEL32_CS */
+	.quad   0x00af9a000000ffff	/* __KERNEL_CS */
+	.quad   0x00cf92000000ffff	/* __KERNEL_DS */
+	.quad	0			/* __USER32_CS - unused */
+	.quad	0			/* __USER_DS   - unused */
+	.quad	0			/* __USER_CS   - unused */
+	.quad	0			/* unused */
+	.quad   0x0080890000000000	/* TSS descriptor */
+	.quad   0x0000000000000000	/* TSS continued */
+SYM_DATA_END_LABEL(boot_gdt, SYM_L_LOCAL, boot_gdt_end)
+
 #include "../../x86/xen/xen-head.S"
 
 	__PAGE_ALIGNED_BSS
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
