Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A14C1DF641
	for <lists.virtualization@lfdr.de>; Sat, 23 May 2020 11:24:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 41AFD204D7;
	Sat, 23 May 2020 09:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xuv60DFOVPKe; Sat, 23 May 2020 09:24:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 33FF72037B;
	Sat, 23 May 2020 09:24:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF1F4C0176;
	Sat, 23 May 2020 09:24:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32F24C0176
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 May 2020 09:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 210B887371
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 May 2020 09:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JoqeFyAKjWO3
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 May 2020 09:24:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CB5E58735E
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 May 2020 09:24:00 +0000 (UTC)
Received: from zn.tnic (p200300ec2f1b96004c59f332ede330a0.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f1b:9600:4c59:f332:ede3:30a0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D4F011EC00F8;
 Sat, 23 May 2020 11:23:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1590225837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=RhlLOpWrzFCYAA5wjrrTkxDaFVK4ufjSSsBDJauVbXs=;
 b=W6i4bXYbASIdWPDlvAWA9Sw9TKs/imch2CRIvLqZAZ4AKkFkjp/UuQi1aiIvRsUqpb/Ijj
 rhKqdXWe1V8tbZrsV+ydJdjBXCSo3iOhh1eYx5fNwk/T/wLPMiQnd007L0F2AmgC3CZUHh
 n/hVT/CyRpJEn0ufXVLgJKYXhQaudvg=
Date: Sat, 23 May 2020 11:23:51 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 49/75] x86/sev-es: Handle instruction fetches from
 user-space
Message-ID: <20200523092351.GE27431@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-50-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-50-joro@8bytes.org>
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

On Tue, Apr 28, 2020 at 05:16:59PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> When a #VC exception is triggered by user-space the instruction decoder
> needs to read the instruction bytes from user addresses.  Enhance
> vc_decode_insn() to safely fetch kernel and user instructions.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/sev-es.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
> index 85027fb4177e..c2223c2a28c2 100644
> --- a/arch/x86/kernel/sev-es.c
> +++ b/arch/x86/kernel/sev-es.c
> @@ -165,17 +165,30 @@ static enum es_result vc_decode_insn(struct es_em_ctxt *ctxt)
>  	enum es_result ret;
>  	int res;
>  
> -	res = vc_fetch_insn_kernel(ctxt, buffer);
> -	if (unlikely(res == -EFAULT)) {

Let's also test for 0 in case the probe_read* guts get changed and start
returning so other errval besides -EFAULT.

> -		ctxt->fi.vector     = X86_TRAP_PF;
> -		ctxt->fi.error_code = 0;
> -		ctxt->fi.cr2        = ctxt->regs->ip;
> -		return ES_EXCEPTION;
> +	if (!user_mode(ctxt->regs)) {

Flip that check so that it reads more naturally:

	if (user_mode(..)
			insn_fetch_from_user()

		...
	} else {
		vc_fetch_insn_kernel()

	}

> +		res = vc_fetch_insn_kernel(ctxt, buffer);



> +		if (unlikely(res == -EFAULT)) {
> +			ctxt->fi.vector     = X86_TRAP_PF;
> +			ctxt->fi.error_code = 0;
> +			ctxt->fi.cr2        = ctxt->regs->ip;
> +			return ES_EXCEPTION;
> +		}
> +
> +		insn_init(&ctxt->insn, buffer, MAX_INSN_SIZE - res, 1);
> +		insn_get_length(&ctxt->insn);
> +	} else {
> +		res = insn_fetch_from_user(ctxt->regs, buffer);
> +		if (res == 0) {

		if (!res)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
