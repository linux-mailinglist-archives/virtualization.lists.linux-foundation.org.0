Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DE14E1D1CBB
	for <lists.virtualization@lfdr.de>; Wed, 13 May 2020 19:59:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8D72187556;
	Wed, 13 May 2020 17:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLkdp6PEysT6; Wed, 13 May 2020 17:59:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D577C8751D;
	Wed, 13 May 2020 17:59:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE556C016F;
	Wed, 13 May 2020 17:59:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B5E5C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 17:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0804A22193
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 17:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUQAfdBS5kYQ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 17:59:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by silver.osuosl.org (Postfix) with ESMTPS id 8A19B2154C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 17:59:07 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0AC30000E7FCC03D02E6FD.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:c300:e7:fcc0:3d02:e6fd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 761AF1EC02CF;
 Wed, 13 May 2020 19:59:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1589392743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=qly6k0bS0jaJ4vTsa92+67UL4fjNB6/GPr5KzlthQcQ=;
 b=b2fmu6R5CwARmJ82Ii9IC4F9SFQKrbd7AAjpxwuLzTkb3nJ8H5eHCkXglWJfVEmuzz1jNh
 9wHKVT/EDt0M7zvbjvUm7GvesRGaJySqfhPmu0WwV2QzoIoZN1Ajk2fV8n3IJK02XlJ4/A
 Q9vkNh6Mw13MDMQwarcjHK4wXrl4eA8=
Date: Wed, 13 May 2020 19:58:59 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 25/75] x86/sev-es: Add support for handling IOIO
 exceptions
Message-ID: <20200513175859.GF4025@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-26-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-26-joro@8bytes.org>
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

On Tue, Apr 28, 2020 at 05:16:35PM +0200, Joerg Roedel wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> Add support for decoding and handling #VC exceptions for IOIO events.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> [ jroedel@suse.de: Adapted code to #VC handling framework ]
> Co-developed-by: Joerg Roedel <jroedel@suse.de>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/boot/compressed/sev-es.c |  32 +++++
>  arch/x86/kernel/sev-es-shared.c   | 202 ++++++++++++++++++++++++++++++
>  2 files changed, 234 insertions(+)

Just nitpicks and some more commenting needed:

> +static enum es_result vc_handle_ioio(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
> +{
> +	struct pt_regs *regs = ctxt->regs;
> +	u64 exit_info_1, exit_info_2;
> +	enum es_result ret;
> +
> +	ret = vc_ioio_exitinfo(ctxt, &exit_info_1);
> +	if (ret != ES_OK)
> +		return ret;
> +
> +	if (exit_info_1 & IOIO_TYPE_STR) {
> +		int df = (regs->flags & X86_EFLAGS_DF) ? -1 : 1;
> +		unsigned int io_bytes, exit_bytes;
> +		unsigned int ghcb_count, op_count;
> +		unsigned long es_base;
> +		u64 sw_scratch;
> +
> +		/*
> +		 * For the string variants with rep prefix the amount of in/out
> +		 * operations per #VC exception is limited so that the kernel
> +		 * has a chance to take interrupts an re-schedule while the
						   ^
						   and

> +		 * instruction is emulated.
> +		 */
> +		io_bytes   = (exit_info_1 >> 4) & 0x7;
> +		ghcb_count = sizeof(ghcb->shared_buffer) / io_bytes;
> +
> +		op_count    = (exit_info_1 & IOIO_REP) ? regs->cx : 1;
> +		exit_info_2 = min(op_count, ghcb_count);
> +		exit_bytes  = exit_info_2 * io_bytes;
> +
> +		es_base = insn_get_seg_base(ctxt->regs, INAT_SEG_REG_ES);

In general, I could use some commenting here to find my way around it:

		/* Read bytes of OUTS into the shared buffer */

> +
> +		if (!(exit_info_1 & IOIO_TYPE_IN)) {
> +			ret = vc_insn_string_read(ctxt,
> +					       (void *)(es_base + regs->si),
> +					       ghcb->shared_buffer, io_bytes,
> +					       exit_info_2, df);
> +			if (ret)
> +				return ret;
> +		}

		/*
		 * Issue an VMGEXIT to the HV to consume the bytes from the
		 * shared buffer or to have it write them into the shared buffer
		 * depending on the instruction: OUTS or INS.
		 */

> +
> +		sw_scratch = __pa(ghcb) + offsetof(struct ghcb, shared_buffer);
> +		ghcb_set_sw_scratch(ghcb, sw_scratch);
> +		ret = sev_es_ghcb_hv_call(ghcb, ctxt, SVM_EXIT_IOIO,
> +				   exit_info_1, exit_info_2);

Align arguments on the opening brace.

> +		if (ret != ES_OK)
> +			return ret;
> +
> +		/* Everything went well, write back results */

		/* Read bytes from shared buffer into the guest's destination. */

> +		if (exit_info_1 & IOIO_TYPE_IN) {
> +			ret = vc_insn_string_write(ctxt,
> +						(void *)(es_base + regs->di),
> +						ghcb->shared_buffer, io_bytes,
> +						exit_info_2, df);
> +			if (ret)
> +				return ret;
> +
> +			if (df)
> +				regs->di -= exit_bytes;
> +			else
> +				regs->di += exit_bytes;
> +		} else {
> +			if (df)
> +				regs->si -= exit_bytes;
> +			else
> +				regs->si += exit_bytes;
> +		}
> +
> +		if (exit_info_1 & IOIO_REP)
> +			regs->cx -= exit_info_2;
> +
> +		ret = regs->cx ? ES_RETRY : ES_OK;
> +
> +	} else {

		/* IN/OUT into/from rAX */

> +		int bits = (exit_info_1 & 0x70) >> 1;
> +		u64 rax = 0;
> +
> +		if (!(exit_info_1 & IOIO_TYPE_IN))
> +			rax = lower_bits(regs->ax, bits);
> +
> +		ghcb_set_rax(ghcb, rax);
> +
> +		ret = sev_es_ghcb_hv_call(ghcb, ctxt, SVM_EXIT_IOIO, exit_info_1, 0);
> +		if (ret != ES_OK)
> +			return ret;
> +
> +		if (exit_info_1 & IOIO_TYPE_IN) {
> +			if (!ghcb_is_valid_rax(ghcb))
> +				return ES_VMM_ERROR;
> +			regs->ax = lower_bits(ghcb->save.rax, bits);
> +		}
> +	}
> +
> +	return ret;
> +}
> -- 

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
