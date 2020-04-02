Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D3B19C075
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 13:49:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 866AF2045D;
	Thu,  2 Apr 2020 11:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YXqrt0ihd-cE; Thu,  2 Apr 2020 11:49:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1A2B020400;
	Thu,  2 Apr 2020 11:49:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA2E0C07FF;
	Thu,  2 Apr 2020 11:49:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A94BC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 11:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 14A6D87DB7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 11:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lFVR4v3D5XH1
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 11:49:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5D1DF86C0E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 11:49:49 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0A0E00AD683D730A68685D.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:e00:ad68:3d73:a68:685d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C35FB1EC0C84;
 Thu,  2 Apr 2020 13:49:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1585828186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=EBWepjr3mk654atQU7k38smGXPUg/5pwXX78nzJmpX0=;
 b=DokBBq+VRrV0fFmq1KmeCXHDEHQVRm5kV7++LpllNWjMhx2/KgCZ4oe1NhNHMrUD6NF9JY
 GlKuYNDL3k9duREm6BQ77ETmp+Gswh7SJXlMhtjRJi0nWZnGKDGIRzQAzC8DrbUmiKPioe
 6zy+Qm9xMQN61MMLLZGD5orCRFZaF5U=
Date: Thu, 2 Apr 2020 13:49:41 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 14/70] x86/boot/compressed/64: Add page-fault handler
Message-ID: <20200402114941.GA9352@zn.tnic>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-15-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319091407.1481-15-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
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

On Thu, Mar 19, 2020 at 10:13:11AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Install a page-fault handler to add an identity mapping to addresses
> not yet mapped. Also do some checking whether the error code is sane.
> 
> This makes non SEV-ES machines use the exception handling
> infrastructure in the pre-decompressions boot code too, making it less
> likely to break in the future.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/boot/compressed/ident_map_64.c    | 38 ++++++++++++++++++++++
>  arch/x86/boot/compressed/idt_64.c          |  2 ++
>  arch/x86/boot/compressed/idt_handlers_64.S |  2 ++
>  arch/x86/boot/compressed/misc.h            |  6 ++++
>  4 files changed, 48 insertions(+)
> 
> diff --git a/arch/x86/boot/compressed/ident_map_64.c b/arch/x86/boot/compressed/ident_map_64.c
> index 3a2115582920..0865d181b85d 100644
> --- a/arch/x86/boot/compressed/ident_map_64.c
> +++ b/arch/x86/boot/compressed/ident_map_64.c
> @@ -19,11 +19,13 @@
>  /* No PAGE_TABLE_ISOLATION support needed either: */
>  #undef CONFIG_PAGE_TABLE_ISOLATION
>  
> +#include "error.h"
>  #include "misc.h"
>  
>  /* These actually do the work of building the kernel identity maps. */
>  #include <asm/init.h>
>  #include <asm/pgtable.h>
> +#include <asm/trap_defs.h>
>  /* Use the static base for this part of the boot process */
>  #undef __PAGE_OFFSET
>  #define __PAGE_OFFSET __PAGE_OFFSET_BASE
> @@ -163,3 +165,39 @@ void finalize_identity_maps(void)
>  {
>  	write_cr3(top_level_pgt);
>  }
> +
> +static void pf_error(unsigned long error_code, unsigned long address,
> +		     struct pt_regs *regs)

AFAICT, that function is called below only so just merge its body into
the call site instead...

> +{
> +	error_putstr("Unexpected page-fault:");
> +	error_putstr("\nError Code: ");
> +	error_puthex(error_code);
> +	error_putstr("\nCR2: 0x");
> +	error_puthex(address);
> +	error_putstr("\nRIP relative to _head: 0x");
> +	error_puthex(regs->ip - (unsigned long)_head);
> +	error_putstr("\n");
> +
> +	error("Stopping.\n");
> +}
> +
> +void do_boot_page_fault(struct pt_regs *regs)
> +{
> +	unsigned long address = native_read_cr2();
> +	unsigned long error_code = regs->orig_ax;
> +
> +	/*
> +	 * Check for unexpected error codes. Unexpected are:
> +	 *	- Faults on present pages
> +	 *	- User faults
> +	 *	- Reserved bits set
> +	 */
> +	if (error_code & (X86_PF_PROT | X86_PF_USER | X86_PF_RSVD))
> +		pf_error(error_code, address, regs);
> +
> +	/*
> +	 * Error code is sane - now identity map the 2M region around
> +	 * the faulting address.
> +	 */
> +	add_identity_map(address & PMD_MASK, PMD_SIZE);
> +}
> diff --git a/arch/x86/boot/compressed/idt_64.c b/arch/x86/boot/compressed/idt_64.c
> index 46ecea671b90..84ba57d9d436 100644
> --- a/arch/x86/boot/compressed/idt_64.c
> +++ b/arch/x86/boot/compressed/idt_64.c
> @@ -39,5 +39,7 @@ void load_stage2_idt(void)
>  {
>  	boot_idt_desc.address = (unsigned long)boot_idt;
>  
> +	set_idt_entry(X86_TRAP_PF, boot_pf_handler);
> +
>  	load_boot_idt(&boot_idt_desc);
>  }
> diff --git a/arch/x86/boot/compressed/idt_handlers_64.S b/arch/x86/boot/compressed/idt_handlers_64.S
> index 3d86ab35ef52..bfb3fc5aa144 100644
> --- a/arch/x86/boot/compressed/idt_handlers_64.S
> +++ b/arch/x86/boot/compressed/idt_handlers_64.S
> @@ -73,3 +73,5 @@ SYM_FUNC_END(\name)
>  
>  	.text
>  	.code64
> +
> +EXCEPTION_HANDLER	boot_pf_handler do_boot_page_fault error_code=1

			boot_page_fault do_boot_page_fault

equivalent to the PF handler proper naming pls. Grepping "page_fault"
would give you all then.

> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
> index 3a030a878d53..eff4ed0b1cea 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -37,6 +37,9 @@
>  #define memptr unsigned
>  #endif
>  
> +/* boot/compressed/vmlinux start and end markers */
> +extern char _head[], _end[];
> +
>  /* misc.c */
>  extern memptr free_mem_ptr;
>  extern memptr free_mem_end_ptr;
> @@ -146,4 +149,7 @@ extern pteval_t __default_kernel_pte_mask;
>  extern gate_desc boot_idt[BOOT_IDT_ENTRIES];
>  extern struct desc_ptr boot_idt_desc;
>  
> +/* IDT Entry Points */
> +void boot_pf_handler(void);
> +
>  #endif /* BOOT_COMPRESSED_MISC_H */
> -- 
> 2.17.1
> 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
