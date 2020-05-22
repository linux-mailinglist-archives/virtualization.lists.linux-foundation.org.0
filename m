Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B4D1DE37D
	for <lists.virtualization@lfdr.de>; Fri, 22 May 2020 11:49:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 40DFB894D5;
	Fri, 22 May 2020 09:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSIK-rnMLtSw; Fri, 22 May 2020 09:49:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1F0B8894D1;
	Fri, 22 May 2020 09:49:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED141C0176;
	Fri, 22 May 2020 09:49:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E814FC0176
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 May 2020 09:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DDAF48789F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 May 2020 09:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESxQcgVya5QS
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 May 2020 09:49:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 22A088789E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 May 2020 09:49:14 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0d490039ac3da161697ee8.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:4900:39ac:3da1:6169:7ee8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4835B1EC02B3;
 Fri, 22 May 2020 11:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1590140951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=YorJd/UW8za62EgPzsjhTpQQFYtsUWpCAha43MJPlmY=;
 b=OQ8IdOxfgaN59mWcAQ2EW+kyXp9W7iNleMbU9QRcSczAwRB4AoYt9bsh9oiD+jA1E5C4d7
 qcDbGLG84wTar1XjR7laE98dvyeQ+ot7gGFjwmOumjn076xMDKLuBSpcKtbWTMdVmrD8G3
 A3yC791s6qaS+v1C64KCSVJ4ZYb5nNE=
Date: Fri, 22 May 2020 11:49:04 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 44/75] x86/sev-es: Allocate and Map IST stacks for #VC
 handler
Message-ID: <20200522094904.GB28750@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-45-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-45-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
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

Dropping thellstrom@vmware.com from Cc from now on because of some
microsloth mail rule not delivering my mails.

On Tue, Apr 28, 2020 at 05:16:54PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Allocate and map enough stacks for the #VC handler to support sufficient
> levels of nesting and the NMI-in-#VC scenario.
> 
> Also setup the IST entrys for the #VC handler on all CPUs because #VC

		"entries"

> needs to work before cpu_init() has set up the per-cpu TSS.

Add a sentence to the commit message pointing to that "VC Handler IST
Stacks" comment in the code explaining the justification for the need
for IST stacks and the nesting.

> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/include/asm/cpu_entry_area.h | 61 +++++++++++++++++++++++++++
>  arch/x86/include/asm/page_64_types.h  |  1 +
>  arch/x86/kernel/cpu/common.c          |  1 +
>  arch/x86/kernel/sev-es.c              | 40 ++++++++++++++++++
>  4 files changed, 103 insertions(+)
> 
> diff --git a/arch/x86/include/asm/cpu_entry_area.h b/arch/x86/include/asm/cpu_entry_area.h
> index 02c0078d3787..85aac6c63653 100644
> --- a/arch/x86/include/asm/cpu_entry_area.h
> +++ b/arch/x86/include/asm/cpu_entry_area.h
> @@ -64,6 +64,61 @@ enum exception_stack_ordering {
>  #define CEA_ESTACK_PAGES					\
>  	(sizeof(struct cea_exception_stacks) / PAGE_SIZE)
>  
> +/*
> + * VC Handler IST Stacks
> + *
> + * The IST stacks for the #VC handler are only allocated when SEV-ES is active,
> + * so they are not part of 'struct exception_stacks'.
> + *
> + * The VC handler uses shift_ist so that #VC can be nested. Nesting happens for
> + * example when the #VC handler has to call printk in the case of and error or

								     "an"

> + * when emulating 'movs' instructions.
> + *
> + * NMIs are another special case which can cause nesting of #VC handlers. The
> + * do_nmi() code path can cause #VC, e.g. for RDPMC. An NMI can also hit in
> + * the time window when the #VC handler is raised but before it has shifted its
> + * IST entry. To make sure any #VC raised from the NMI code path uses a new
> + * stack, the NMI handler unconditionally shifts the #VC handlers IST entry.
> + * This can cause one IST stack for #VC to be omitted.
> + *
> + * To support sufficient levels of nesting for the #VC handler, make the number
> + * of nesting levels configurable. It is currently set to 5 to support this
> + * scenario:
> + *
> + * #VC - IST stack 4, IST entry already shifted to 3
> + *
> + *     -> NMI - shifts #VC IST entry to 2
> + *
> + *     -> #VC(RDPMC) - shifts #VC IST to 1, something goes wrong, print
> + *                     an error message
> + *
> + *     -> #VC(printk) - shifts #VC IST entry to 0, output driver
> + *                      uses 'movs'
> + *
> + *     -> #VC(movs) - shifts IST to unmapped stack, further #VCs will
> + *                    cause #DF
> + *
> + */
> +#define N_VC_STACKS		5
> +
> +#define VC_STACK_MEMBERS(guardsize, holesize)			\
> +	char	hole[holesize];					\
> +	struct {						\
> +		char guard[guardsize];				\
> +		char stack[EXCEPTION_STKSZ];			\
> +	} stacks[N_VC_STACKS];					\
> +	char top_guard[guardsize];				\
> +
> +/* Physical storage */
> +struct vmm_exception_stacks {
> +	VC_STACK_MEMBERS(0, 0)
> +};
> +
> +/* Mapping in cpu_entry_area */
> +struct cea_vmm_exception_stacks {
> +	VC_STACK_MEMBERS(PAGE_SIZE, EXCEPTION_STKSZ)
> +};

All those things should be under an CONFIG_AMD_MEM_ENCRYPT ifdeffery.

> +
>  #endif
>  
>  #ifdef CONFIG_X86_32
> @@ -110,6 +165,12 @@ struct cpu_entry_area {
>  	 * Exception stacks used for IST entries with guard pages.
>  	 */
>  	struct cea_exception_stacks estacks;
> +
> +	/*
> +	 * IST Exception stacks for VC handler - Only allocated and mapped when
> +	 * SEV-ES is active.
> +	 */
> +	struct cea_vmm_exception_stacks vc_stacks;

Ditto.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
