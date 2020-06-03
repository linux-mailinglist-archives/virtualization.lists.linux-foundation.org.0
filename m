Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 063A01ECD08
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 11:59:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A8FD7877AD;
	Wed,  3 Jun 2020 09:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kkfvc1WMJ7hS; Wed,  3 Jun 2020 09:59:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 157E786D13;
	Wed,  3 Jun 2020 09:59:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E823DC016E;
	Wed,  3 Jun 2020 09:59:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA6E0C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 09:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B0D9820456
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 09:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cDRMF-q76b5Z
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 09:59:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by silver.osuosl.org (Postfix) with ESMTPS id 2885320444
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 09:59:26 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0b230065380e66e0b088b7.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:2300:6538:e66:e0b0:88b7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 295AD1EC02CF;
 Wed,  3 Jun 2020 11:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1591178364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=ZSIGNEfL6Ayr2ush2OvY8suckgH4tStEBhJ1EqO29j8=;
 b=AF8qxysH81/eRXfJNTzW4bclbP+TZSCTVSWFGUXe8z5Kocy7/M5D20vBFUP2fziRzsxEIv
 7o7mweDKVAky6yOKlqEzED25VQnfupBLexUJaUgpB+N2fOZpqIsutvR69VTp6+d/rGOCXD
 WSSIF/MwSbg7PLbMwieaUEOKdh3cmxw=
Date: Wed, 3 Jun 2020 11:59:23 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 74/75] x86/sev-es: Handle NMI State
Message-ID: <20200603095923.GB19711@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-75-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-75-joro@8bytes.org>
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

On Tue, Apr 28, 2020 at 05:17:24PM +0200, Joerg Roedel wrote:
> diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
> index 27d1016ec840..8898002e5600 100644
> --- a/arch/x86/kernel/nmi.c
> +++ b/arch/x86/kernel/nmi.c
> @@ -511,6 +511,13 @@ NOKPROBE_SYMBOL(is_debug_stack);
>  dotraplinkage notrace void
>  do_nmi(struct pt_regs *regs, long error_code)
>  {
> +	/*
> +	 * Re-enable NMIs right here when running as an SEV-ES guest. This might
> +	 * cause nested NMIs, but those can be handled safely.
> +	 */
> +	if (sev_es_active())
> +		sev_es_nmi_complete();

Pls move the comment and the sev_es_active() check into
the sev_es_nmi_complete() function.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
