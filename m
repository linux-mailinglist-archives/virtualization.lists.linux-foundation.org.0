Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DD05231DEB1
	for <lists.virtualization@lfdr.de>; Wed, 17 Feb 2021 19:00:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 85DBD87283;
	Wed, 17 Feb 2021 18:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P3J8c7AH8mmh; Wed, 17 Feb 2021 18:00:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B1D8C8725F;
	Wed, 17 Feb 2021 18:00:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D9E6C013A;
	Wed, 17 Feb 2021 18:00:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADADBC013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 18:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9BB9A85F8A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 18:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5AvmLBPe9iNg
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 18:00:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D9CB885F63
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 18:00:52 +0000 (UTC)
Received: from zn.tnic (p200300ec2f05bb00a5a1b5cb6f03bfce.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f05:bb00:a5a1:b5cb:6f03:bfce])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 426BF1EC0402;
 Wed, 17 Feb 2021 19:00:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1613584851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=OyC60AEXb/9wdHg79nRJVAwmz+d5y82NOII64Aytkw4=;
 b=rZCe/fUCQVQIdCLfy0ZZX86wa1k2dVKkf+PDmFOG4MS7fmj2VZoM4iC/mO0MQe9ouVSUV4
 AA5HzXgovgE4O63ljYDoXrY24nbmBoNNpStJFJOEg2TL1n1FfPZSR6+rMznkaIIGgV6+e8
 Ls90hdQStGA73QaE4V43VHLz45AeEIc=
Date: Wed, 17 Feb 2021 19:00:54 +0100
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 3/3] x86/sev-es: Improve comments in and around
 __sev_es_ist_enter/exit()
Message-ID: <20210217180054.GC6479@zn.tnic>
References: <20210217120143.6106-1-joro@8bytes.org>
 <20210217120143.6106-4-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210217120143.6106-4-joro@8bytes.org>
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
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

On Wed, Feb 17, 2021 at 01:01:43PM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Better explain why this code is necessary and what it is doing.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/sev-es.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
> index 0df38b185d53..79241bc45f25 100644
> --- a/arch/x86/kernel/sev-es.c
> +++ b/arch/x86/kernel/sev-es.c
> @@ -127,14 +127,20 @@ static __always_inline bool on_vc_stack(unsigned long sp)
>  }
>  
>  /*
> - * This function handles the case when an NMI is raised in the #VC exception
> - * handler entry code. In this case, the IST entry for #VC must be adjusted, so
> - * that any subsequent #VC exception will not overwrite the stack contents of the
> - * interrupted #VC handler.
> + * This function handles the case when an NMI is raised in the #VC
> + * exception handler entry code, before the #VC handler has switched off
> + * its IST stack. In this case, the IST entry for #VC must be adjusted,
> + * so that any nested #VC exception will not overwrite the stack
> + * contents of the interrupted #VC handler.
>   *
>   * The IST entry is adjusted unconditionally so that it can be also be
> - * unconditionally adjusted back in sev_es_ist_exit(). Otherwise a nested
> - * sev_es_ist_exit() call may adjust back the IST entry too early.
> + * unconditionally adjusted back in __sev_es_ist_exit(). Otherwise a
> + * nested sev_es_ist_exit() call may adjust back the IST entry too
> + * early.
> + *
> + * The __sev_es_ist_enter() and __sev_es_ist_exit() functions always run
> + * on the NMI IST stack, as they are only called from NMI handling code
> + * right now.
>   */
>  void noinstr __sev_es_ist_enter(struct pt_regs *regs)
>  {
> @@ -143,7 +149,10 @@ void noinstr __sev_es_ist_enter(struct pt_regs *regs)
>  	/* Read old IST entry */
>  	old_ist = __this_cpu_read(cpu_tss_rw.x86_tss.ist[IST_INDEX_VC]);
>  
> -	/* Make room on the IST stack */
> +	/*
> +	 * Make room on the IST stack - Reserve 8 bytes to store the old
> +	 * IST entry.
> +	 */
>  	if (on_vc_stack(regs->sp) &&
>  	    !user_mode(regs) &&
>  	    !from_syscall_gap(regs))
> -- 

Yah, and then we probably should simplify this __sev_es_ist_enter()
function even more as it is not easy to grok.

For example, the ALIGN_DOWN(regs->sp, 8) is not really needed, right?

Also, both branches do "- sizeof(old_ist);" so you can just as well do
it unconditionally.

And the sizeof(old_ist) is just a confusing way to write 8, right? We're
64-bit only so there's no need for that, I'd say.

And then you probably should change the comments from

	/* Store old IST entry */

and

	/* Set new IST entry */

to something like:

 /*
  * If on the #VC IST stack, new_ist gets set to point one stack slot
  * further down from the #VC interrupt frame which has been pushed on
  * it during the first #VC exception entry.
  *
  * If not, simply the next slot on the #VC IST stack is set to point...

and here I'm not even sure why we're doing it?

The else branch, when we're not on the #VC stack, why are we doing

	new_ist = old_ist - sizeof(old_ist);

?

I mean, if the NMI handler causes a #VC exception, it will simply run on
the #VC IST stack so why do we have to do that - 8 thing at all?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
