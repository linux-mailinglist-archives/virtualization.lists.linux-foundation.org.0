Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 267A631DEAA
	for <lists.virtualization@lfdr.de>; Wed, 17 Feb 2021 19:00:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0B9D6F613
	for <lists.virtualization@lfdr.de>; Wed, 17 Feb 2021 17:59:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uiuf4TaJzu1R for <lists.virtualization@lfdr.de>;
	Wed, 17 Feb 2021 17:59:58 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id E4ACB6F5E3; Wed, 17 Feb 2021 17:59:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5C706E6C5;
	Wed, 17 Feb 2021 17:59:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D1BBC013A;
	Wed, 17 Feb 2021 17:59:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6F8EC013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 17:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A0D4E8574B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 17:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5M1IrxGhBvk
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 17:59:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 82DF5845C0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 17:59:47 +0000 (UTC)
Received: from zn.tnic (p200300ec2f05bb00a5a1b5cb6f03bfce.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f05:bb00:a5a1:b5cb:6f03:bfce])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id ED4941EC0402;
 Wed, 17 Feb 2021 18:59:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1613584784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=WmuQ8y/fflrvmjf86SX6xiFBOAxGxvoIY9jzq881ltE=;
 b=VtuqqWV9FksO9bvGEz8s/uGpYsmQhciTMb5Bf5x7ZRbliGBwcMAr4OEUnISJXR69BwU8JS
 gfteNUD430fYDD5Kj6HzYtes586+ku381MB0OWQ2UpD4sqHIPXR8P3HfmMaEIRoEW+MeMV
 +StFS37yM89lDHr/vpDza8tR87BZG+M=
Date: Wed, 17 Feb 2021 18:59:39 +0100
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 1/3] x86/sev-es: Introduce from_syscall_gap() helper
Message-ID: <20210217175939.GA6479@zn.tnic>
References: <20210217120143.6106-1-joro@8bytes.org>
 <20210217120143.6106-2-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210217120143.6106-2-joro@8bytes.org>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Erdem Aktas <erdemaktas@google.com>
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

I guess subject prefix should be "x86/traps:" but I'll fix that up while
applying eventually.

On Wed, Feb 17, 2021 at 01:01:41PM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Introduce a helper to check whether an exception came from the syscall
> gap and use it in the SEV-ES code
> 
> Fixes: 315562c9af3d5 ("x86/sev-es: Adjust #VC IST Stack on entering NMI handler")
> Cc: stable@vger.kernel.org # 5.10+
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/include/asm/ptrace.h | 8 ++++++++
>  arch/x86/kernel/traps.c       | 3 +--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/ptrace.h b/arch/x86/include/asm/ptrace.h
> index d8324a236696..14854b2c4944 100644
> --- a/arch/x86/include/asm/ptrace.h
> +++ b/arch/x86/include/asm/ptrace.h
> @@ -94,6 +94,8 @@ struct pt_regs {
>  #include <asm/paravirt_types.h>
>  #endif
>  
> +#include <asm/proto.h>
> +
>  struct cpuinfo_x86;
>  struct task_struct;
>  
> @@ -175,6 +177,12 @@ static inline bool any_64bit_mode(struct pt_regs *regs)
>  #ifdef CONFIG_X86_64
>  #define current_user_stack_pointer()	current_pt_regs()->sp
>  #define compat_user_stack_pointer()	current_pt_regs()->sp
> +
> +static inline bool from_syscall_gap(struct pt_regs *regs)

rip_within_syscall_gap() sounds kinda better to me and it is more
readable when you look at it at the usage site:

	if (rip_within_syscall_gap(regs))
		...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
