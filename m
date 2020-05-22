Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 721F31DE7A1
	for <lists.virtualization@lfdr.de>; Fri, 22 May 2020 15:06:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 02780204E2;
	Fri, 22 May 2020 13:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rcyCiDOXhnQ4; Fri, 22 May 2020 13:06:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4764220000;
	Fri, 22 May 2020 13:06:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FDFAC0176;
	Fri, 22 May 2020 13:06:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB980C0176
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 May 2020 13:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B3D0D88A9D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 May 2020 13:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hMuslKx0ouR1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 May 2020 13:06:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BBBF488AA0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 May 2020 13:06:51 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0d4900a503efeda57d2ecc.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:4900:a503:efed:a57d:2ecc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2897F1EC02DD;
 Fri, 22 May 2020 15:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1590152808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=f1OkI+Vzd1wskJk7/8gnkbFS2SZjRjcQWBV0MrHyvlg=;
 b=bJ2ETP+3jHY1hqbeNezyvTjFa461+jPOrZry8F9S8xH16sZfFsvcFIHR4ksBQqYeiw+S2+
 QwhfpseLeEH4DgPNmZaOuxK5/qhQKZmV5EWN7wNcKxZf54FA6/HkFcfoZwM5iM2FqzJBsF
 Haik+YqW5g+WJyUteTXbhb/9XVBguPo=
Date: Fri, 22 May 2020 15:06:41 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 45/75] x86/dumpstack/64: Handle #VC exception stacks
Message-ID: <20200522130641.GE28750@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-46-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-46-joro@8bytes.org>
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

On Tue, Apr 28, 2020 at 05:16:55PM +0200, Joerg Roedel wrote:
> diff --git a/arch/x86/include/asm/stacktrace.h b/arch/x86/include/asm/stacktrace.h
> index 14db05086bbf..2f3534ef4b5f 100644
> --- a/arch/x86/include/asm/stacktrace.h
> +++ b/arch/x86/include/asm/stacktrace.h
> @@ -21,6 +21,10 @@ enum stack_type {
>  	STACK_TYPE_ENTRY,
>  	STACK_TYPE_EXCEPTION,
>  	STACK_TYPE_EXCEPTION_LAST = STACK_TYPE_EXCEPTION + N_EXCEPTION_STACKS-1,
> +#ifdef CONFIG_X86_64

CONFIG_AMD_MEM_ENCRYPT

> +	STACK_TYPE_VC,
> +	STACK_TYPE_VC_LAST = STACK_TYPE_VC + N_VC_STACKS - 1,
> +#endif
>  };
>  
>  struct stack_info {
> diff --git a/arch/x86/kernel/dumpstack_64.c b/arch/x86/kernel/dumpstack_64.c
> index 87b97897a881..2468963c1424 100644
> --- a/arch/x86/kernel/dumpstack_64.c
> +++ b/arch/x86/kernel/dumpstack_64.c
> @@ -18,6 +18,7 @@
>  
>  #include <asm/cpu_entry_area.h>
>  #include <asm/stacktrace.h>
> +#include <asm/sev-es.h>
>  
>  static const char * const exception_stack_names[] = {
>  		[ ESTACK_DF	]	= "#DF",
> @@ -47,6 +48,9 @@ const char *stack_type_name(enum stack_type type)
>  	if (type >= STACK_TYPE_EXCEPTION && type <= STACK_TYPE_EXCEPTION_LAST)
>  		return exception_stack_names[type - STACK_TYPE_EXCEPTION];
>  
> +	if (type >= STACK_TYPE_VC && type <= STACK_TYPE_VC_LAST)

That test can be inside vc_stack_name() so that it gets optimized away
for !CONFIG_AMD_MEM_ENCRYPT and there's no need for ifdeffery.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
