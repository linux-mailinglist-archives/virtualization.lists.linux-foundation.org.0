Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD711DBDEB
	for <lists.virtualization@lfdr.de>; Wed, 20 May 2020 21:22:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 220BF870B5;
	Wed, 20 May 2020 19:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U8xdTNPwdgDM; Wed, 20 May 2020 19:22:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E2D3870B6;
	Wed, 20 May 2020 19:22:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CAB6C0176;
	Wed, 20 May 2020 19:22:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5014DC0176
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 19:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 37C8E870B6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 19:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ycxBdssXJbOt
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 19:22:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A084E870B5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 19:22:39 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0bab0028d24a65f02999fe.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:ab00:28d2:4a65:f029:99fe])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 729681EC0350;
 Wed, 20 May 2020 21:22:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1590002556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=YoNcQo6x1W8TxzWUCk2SRnUEN6+ujdV8K1zMMMM7K9w=;
 b=QnDgj2c7erKXF3m48N2kXaCZYdPDB5MWID4LlHGbzp/0OLMhpPWVLM4Ckuu+4FzqSymM2b
 Tn1sEI7aI7cqIuJQ5hI/AOTJELuDaDwk+EATRLjvONMnutf0FLFVVYGLQ8g9ONbAl0jE49
 jCzdAiOusfz1gfqvMpn9h0w2u4PG2Po=
Date: Wed, 20 May 2020 21:22:30 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 42/75] x86/sev-es: Setup GHCB based boot #VC handler
Message-ID: <20200520192230.GK1457@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-43-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-43-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Tue, Apr 28, 2020 at 05:16:52PM +0200, Joerg Roedel wrote:
> diff --git a/arch/x86/include/asm/sev-es.h b/arch/x86/include/asm/sev-es.h
> index b2cbcd40b52e..e1ed963a57ec 100644
> --- a/arch/x86/include/asm/sev-es.h
> +++ b/arch/x86/include/asm/sev-es.h
> @@ -74,5 +74,6 @@ static inline u64 lower_bits(u64 val, unsigned int bits)
>  }
>  
>  extern void vc_no_ghcb(void);
> +extern bool vc_boot_ghcb(struct pt_regs *regs);

Those function names need verbs:

	handle_vc_no_ghcb
	handle_vc_boot_ghcb

> @@ -161,3 +176,104 @@ static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
>  
>  /* Include code shared with pre-decompression boot stage */
>  #include "sev-es-shared.c"
> +
> +/*
> + * This function runs on the first #VC exception after the kernel
> + * switched to virtual addresses.
> + */
> +static bool __init sev_es_setup_ghcb(void)

There's already another sev_es_setup_ghcb() in compressed/. All those
functions with the same name are just confusion waiting to happen. Let's
prepend the ones in compressed/ with "early_" or so, so that their names
are at least different even if they're in two different files with the
same name.

This way you know at least which function is used in which boot stages.

> +{
> +	/* First make sure the hypervisor talks a supported protocol. */
> +	if (!sev_es_negotiate_protocol())
> +		return false;

<---- newline here.

> +	/*
> +	 * Clear the boot_ghcb. The first exception comes in before the bss
> +	 * section is cleared.
> +	 */
> +	memset(&boot_ghcb_page, 0, PAGE_SIZE);
> +
> +	/* Alright - Make the boot-ghcb public */
> +	boot_ghcb = &boot_ghcb_page;
> +
> +	return true;
> +}
> +
> +static void __init vc_early_vc_forward_exception(struct es_em_ctxt *ctxt)

That second "vc" looks redundant.

> +{
> +	int trapnr = ctxt->fi.vector;
> +
> +	if (trapnr == X86_TRAP_PF)
> +		native_write_cr2(ctxt->fi.cr2);
> +
> +	ctxt->regs->orig_ax = ctxt->fi.error_code;
> +	do_early_exception(ctxt->regs, trapnr);
> +}
> +
> +static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
> +					 struct ghcb *ghcb,
> +					 unsigned long exit_code)
> +{
> +	enum es_result result;
> +
> +	switch (exit_code) {
> +	default:
> +		/*
> +		 * Unexpected #VC exception
> +		 */
> +		result = ES_UNSUPPORTED;
> +	}
> +
> +	return result;
> +}
> +
> +bool __init vc_boot_ghcb(struct pt_regs *regs)
> +{
> +	unsigned long exit_code = regs->orig_ax;
> +	struct es_em_ctxt ctxt;
> +	enum es_result result;
> +
> +	/* Do initial setup or terminate the guest */
> +	if (unlikely(boot_ghcb == NULL && !sev_es_setup_ghcb()))
> +		sev_es_terminate(GHCB_SEV_ES_REASON_GENERAL_REQUEST);
> +
> +	vc_ghcb_invalidate(boot_ghcb);

Newline here...

> +	result = vc_init_em_ctxt(&ctxt, regs, exit_code);
> +

... remove that one here.

> +	if (result == ES_OK)
> +		result = vc_handle_exitcode(&ctxt, boot_ghcb, exit_code);

...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
