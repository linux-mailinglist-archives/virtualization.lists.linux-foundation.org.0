Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A592D257749
	for <lists.virtualization@lfdr.de>; Mon, 31 Aug 2020 12:27:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1B84F20784;
	Mon, 31 Aug 2020 10:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xMIA1CeKOI68; Mon, 31 Aug 2020 10:27:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 92994207A4;
	Mon, 31 Aug 2020 10:27:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63794C0051;
	Mon, 31 Aug 2020 10:27:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2CA9C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 10:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DE885877FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 10:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbm72SF-wl4Q
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 10:27:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D0A2F877F1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 10:27:09 +0000 (UTC)
Received: from zn.tnic (p200300ec2f085000329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f08:5000:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 31A0E1EC02F2;
 Mon, 31 Aug 2020 12:27:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1598869626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=ZuWmCteGQZKM0ko0ElODot8ukDLVFBwRtcdceTKHyJE=;
 b=V08T2WeqYCMhRjX3D5H2r4EqFkI0JVoF2Ohes825PrLzETVPYkLxl1GPEn/7TSpDZdWzbp
 8UU4qAGxRwPluiQYH2jRl0uT9qfcF9eCrrfw4Kf6Zk2aeZzG/dgYcnPaS16JfQ63jhp5ya
 pEpx11HroUZ5WqYtb7XAL7poJus3OKU=
Date: Mon, 31 Aug 2020 12:27:01 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v6 45/76] x86/sev-es: Allocate and Map IST stack for #VC
 handler
Message-ID: <20200831102701.GE27517@zn.tnic>
References: <20200824085511.7553-1-joro@8bytes.org>
 <20200824085511.7553-46-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824085511.7553-46-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>, Joerg Roedel <jroedel@suse.de>,
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

On Mon, Aug 24, 2020 at 10:54:40AM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Allocate and map an IST stack and an additional fall-back stack for
> the #VC handler.  The memory for the stacks is allocated only when
> SEV-ES is active.
> 
> The #VC handler needs to use an IST stack because it could be raised
> from kernel space with unsafe stack, e.g. in the SYSCALL entry path.
> 
> Since the #VC exception can be nested, the #VC handler switches back to
> the interrupted stack when entered from kernel space. If switching back
> is not possible the fall-back stack is used.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> Link: https://lore.kernel.org/r/20200724160336.5435-45-joro@8bytes.org
> ---
>  arch/x86/include/asm/cpu_entry_area.h | 33 +++++++++++++++++----------
>  arch/x86/include/asm/page_64_types.h  |  1 +
>  arch/x86/kernel/cpu/common.c          |  2 ++
>  arch/x86/kernel/dumpstack_64.c        |  8 +++++--
>  arch/x86/kernel/sev-es.c              | 33 +++++++++++++++++++++++++++
>  5 files changed, 63 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/x86/include/asm/cpu_entry_area.h b/arch/x86/include/asm/cpu_entry_area.h
> index 8902fdb7de13..f87e4c0c16f4 100644
> --- a/arch/x86/include/asm/cpu_entry_area.h
> +++ b/arch/x86/include/asm/cpu_entry_area.h
> @@ -11,25 +11,29 @@
>  #ifdef CONFIG_X86_64
>  
>  /* Macro to enforce the same ordering and stack sizes */
> -#define ESTACKS_MEMBERS(guardsize)		\
> -	char	DF_stack_guard[guardsize];	\
> -	char	DF_stack[EXCEPTION_STKSZ];	\
> -	char	NMI_stack_guard[guardsize];	\
> -	char	NMI_stack[EXCEPTION_STKSZ];	\
> -	char	DB_stack_guard[guardsize];	\
> -	char	DB_stack[EXCEPTION_STKSZ];	\
> -	char	MCE_stack_guard[guardsize];	\
> -	char	MCE_stack[EXCEPTION_STKSZ];	\
> -	char	IST_top_guard[guardsize];	\
> +#define ESTACKS_MEMBERS(guardsize, optional_stack_size)		\
> +	char	DF_stack_guard[guardsize];			\
> +	char	DF_stack[EXCEPTION_STKSZ];			\
> +	char	NMI_stack_guard[guardsize];			\
> +	char	NMI_stack[EXCEPTION_STKSZ];			\
> +	char	DB_stack_guard[guardsize];			\
> +	char	DB_stack[EXCEPTION_STKSZ];			\
> +	char	MCE_stack_guard[guardsize];			\
> +	char	MCE_stack[EXCEPTION_STKSZ];			\
> +	char	VC_stack_guard[guardsize];			\
> +	char	VC_stack[optional_stack_size];			\
> +	char	VC2_stack_guard[guardsize];			\
> +	char	VC2_stack[optional_stack_size];			\

So the VC* stuff needs to be ifdefferied and enabled only on
CONFIG_AMD_MEM_ENCRYPT... here and below.

I had that in my previous review too:

"All those things should be under an CONFIG_AMD_MEM_ENCRYPT ifdeffery."

> +	char	IST_top_guard[guardsize];			\
>  
>  /* The exception stacks' physical storage. No guard pages required */
>  struct exception_stacks {
> -	ESTACKS_MEMBERS(0)
> +	ESTACKS_MEMBERS(0, 0)
>  };
>  
>  /* The effective cpu entry area mapping with guard pages. */
>  struct cea_exception_stacks {
> -	ESTACKS_MEMBERS(PAGE_SIZE)
> +	ESTACKS_MEMBERS(PAGE_SIZE, EXCEPTION_STKSZ)
>  };
>  
>  /*
> @@ -40,6 +44,8 @@ enum exception_stack_ordering {
>  	ESTACK_NMI,
>  	ESTACK_DB,
>  	ESTACK_MCE,
> +	ESTACK_VC,
> +	ESTACK_VC2,
>  	N_EXCEPTION_STACKS
>  };
>  
> @@ -139,4 +145,7 @@ static inline struct entry_stack *cpu_entry_stack(int cpu)
>  #define __this_cpu_ist_top_va(name)					\
>  	CEA_ESTACK_TOP(__this_cpu_read(cea_exception_stacks), name)
>  
> +#define __this_cpu_ist_bot_va(name)					\

"bottom" please. I was wondering for a bit, what "bot"? And I know it is
CEA_ESTACK_BOT but that's not readable.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
