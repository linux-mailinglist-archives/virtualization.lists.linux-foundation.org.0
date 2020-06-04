Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2181EE3AA
	for <lists.virtualization@lfdr.de>; Thu,  4 Jun 2020 13:48:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 59B0287D69;
	Thu,  4 Jun 2020 11:48:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DuxsViun3Ptw; Thu,  4 Jun 2020 11:48:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 25AF887D5D;
	Thu,  4 Jun 2020 11:48:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDDAFC016E;
	Thu,  4 Jun 2020 11:48:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0571EC016E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 11:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F30A688809
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 11:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUWdAHnbzSR4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 11:48:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F209188808
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 11:48:25 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 21C4126F; Thu,  4 Jun 2020 13:48:23 +0200 (CEST)
Date: Thu, 4 Jun 2020 13:48:21 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 31/75] x86/head/64: Install boot GDT
Message-ID: <20200604114821.GA30945@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-32-joro@8bytes.org>
 <20200518082313.GA25034@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518082313.GA25034@zn.tnic>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
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

On Mon, May 18, 2020 at 10:23:13AM +0200, Borislav Petkov wrote:
> On Tue, Apr 28, 2020 at 05:16:41PM +0200, Joerg Roedel wrote:
> > @@ -480,6 +500,22 @@ SYM_DATA_LOCAL(early_gdt_descr_base,	.quad INIT_PER_CPU_VAR(gdt_page))
> >  SYM_DATA(phys_base, .quad 0x0)
> >  EXPORT_SYMBOL(phys_base)
> >
> > +/* Boot GDT used when kernel addresses are not mapped yet */
> > +SYM_DATA_LOCAL(boot_gdt_descr,		.word boot_gdt_end - boot_gdt)
> > +SYM_DATA_LOCAL(boot_gdt_base,		.quad 0)
> > +SYM_DATA_START(boot_gdt)
> > +	.quad	0
> > +	.quad   0x00cf9a000000ffff	/* __KERNEL32_CS */
> > +	.quad   0x00af9a000000ffff	/* __KERNEL_CS */
> > +	.quad   0x00cf92000000ffff	/* __KERNEL_DS */
> > +	.quad	0			/* __USER32_CS - unused */
> > +	.quad	0			/* __USER_DS   - unused */
> > +	.quad	0			/* __USER_CS   - unused */
> > +	.quad	0			/* unused */
> > +	.quad   0x0080890000000000	/* TSS descriptor */
> > +	.quad   0x0000000000000000	/* TSS continued */
> 
> Any chance you could use macros ala GDT_ENTRY_INIT() for those instead
> of the naked values?

Yeah, seems to work. Updated patch attached.

From 1350746f9063147a33156c0b56a7b12b1794f555 Mon Sep 17 00:00:00 2001
From: Joerg Roedel <jroedel@suse.de>
Date: Fri, 15 Nov 2019 13:49:55 +0100
Subject: [PATCH 31/74] x86/head/64: Install boot GDT

Handling exceptions during boot requires a working GDT. The kernel GDT
is not yet ready for use, so install a temporary boot GDT.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/head64.c  | 19 +++++++++++++++++++
 arch/x86/kernel/head_64.S | 25 +++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 206a4b6144c2..900c3372cc6a 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -61,6 +61,25 @@ unsigned long vmemmap_base __ro_after_init = __VMEMMAP_BASE_L4;
 EXPORT_SYMBOL(vmemmap_base);
 #endif
 
+/*
+ * GDT used before %gs is set up and the kernel can use gdt_page. Needed for
+ * early exception handling.
+ */
+struct desc_struct boot_gdt[GDT_ENTRIES] = {
+	[GDT_ENTRY_KERNEL32_CS]         = GDT_ENTRY_INIT(0xc09b, 0, 0xfffff),
+	[GDT_ENTRY_KERNEL_CS]           = GDT_ENTRY_INIT(0xa09b, 0, 0xfffff),
+	[GDT_ENTRY_KERNEL_DS]           = GDT_ENTRY_INIT(0xc093, 0, 0xfffff),
+};
+
+/*
+ * Address needs to be set at runtime because it references the boot_gdt while
+ * the kernel still uses a direct mapping.
+ */
+struct desc_ptr boot_gdt_descr = {
+	.size = sizeof(boot_gdt),
+	.address = 0,
+};
+
 #define __head	__section(.head.text)
 
 static void __head *fixup_pointer(void *ptr, unsigned long physaddr)
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 4bbc770af632..62513dd1e0e4 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -72,6 +72,26 @@ SYM_CODE_START_NOALIGN(startup_64)
 	/* Set up the stack for verify_cpu(), similar to initial_stack below */
 	leaq	(__end_init_task - SIZEOF_PTREGS)(%rip), %rsp
 
+	/* Setup boot GDT descriptor and load boot GDT */
+	leaq	boot_gdt(%rip), %rax
+	movq	%rax, boot_gdt_descr+2(%rip)
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
 
@@ -143,6 +163,11 @@ SYM_CODE_START(secondary_startup_64)
 1:
 	UNWIND_HINT_EMPTY
 
+	/* Setup boot GDT descriptor and load boot GDT */
+	leaq	boot_gdt(%rip), %rax
+	movq	%rax, boot_gdt_descr+2(%rip)
+	lgdt	boot_gdt_descr(%rip)
+
 	/* Check if nx is implemented */
 	movl	$0x80000001, %eax
 	cpuid
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
