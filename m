Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2DE1E085D
	for <lists.virtualization@lfdr.de>; Mon, 25 May 2020 10:02:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3019086783;
	Mon, 25 May 2020 08:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lYsn-YkziC4y; Mon, 25 May 2020 08:02:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 785B7863AE;
	Mon, 25 May 2020 08:02:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4640EC016F;
	Mon, 25 May 2020 08:02:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76B95C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 08:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5EB3586917
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 08:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6x3E2lsUnJoI
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 08:02:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BB8ED85B00
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 08:02:35 +0000 (UTC)
Received: from zn.tnic (p200300ec2f06f3004418adec9d2f63e2.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f06:f300:4418:adec:9d2f:63e2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 514AC1EC0116;
 Mon, 25 May 2020 10:02:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1590393752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=HbItycmNHopexuynDp8v3E/cG41XLiYYR0XUaufHcT4=;
 b=RmXdg7Qxfd5JvK24kf//ZDbwbxh9yQ5WD9aNGgVJpTGZHMBxdRlxPXD/+P3C9pxjmN05Qr
 5k/sXpwDV7HfYvnPa5HDdxDwTKYlbnKTymFHiUjx9bi13AXJXs4jZcYgeAQv5CG+57bxS3
 17uS9WxUnIQaMuJTnaWakP3wDY6lsTk=
Date: Mon, 25 May 2020 10:02:26 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 51/75] x86/sev-es: Handle MMIO events
Message-ID: <20200525080226.GB25636@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-52-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-52-joro@8bytes.org>
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

On Tue, Apr 28, 2020 at 05:17:01PM +0200, Joerg Roedel wrote:
> +static enum es_result vc_do_mmio(struct ghcb *ghcb, struct es_em_ctxt *ctxt,
> +				 unsigned int bytes, bool read)
> +{
> +	u64 exit_code, exit_info_1, exit_info_2;
> +	unsigned long ghcb_pa = __pa(ghcb);
> +	void __user *ref;
> +
> +	ref = insn_get_addr_ref(&ctxt->insn, ctxt->regs);
> +	if (ref == (void __user *)-1L)
> +		return ES_UNSUPPORTED;
> +
> +	exit_code = read ? SVM_VMGEXIT_MMIO_READ : SVM_VMGEXIT_MMIO_WRITE;
> +
> +	exit_info_1 = vc_slow_virt_to_phys(ghcb, (unsigned long)ref);
> +	exit_info_2 = bytes;    /* Can never be greater than 8 */

No trailing comments pls - put them over the line.

> +	ghcb->save.sw_scratch = ghcb_pa + offsetof(struct ghcb, shared_buffer);
> +
> +	return sev_es_ghcb_hv_call(ghcb, ctxt, exit_code, exit_info_1, exit_info_2);
> +}
> +
> +static enum es_result vc_handle_mmio_twobyte_ops(struct ghcb *ghcb,
> +						 struct es_em_ctxt *ctxt)
> +{
> +	struct insn *insn = &ctxt->insn;
> +	unsigned int bytes = 0;
> +	enum es_result ret;
> +	int sign_byte;
> +	long *reg_data;
> +
> +	switch (insn->opcode.bytes[1]) {
> +		/* MMIO Read w/ zero-extension */
> +	case 0xb6:
> +		bytes = 1;
> +		/* Fallthrough */

I'm guessing we're supposed to annotate it this way now:

WARNING: Prefer 'fallthrough;' over fallthrough comment
#139: FILE: arch/x86/kernel/sev-es.c:504:
+               /* Fallthrough */


> +	case 0xb7:
> +		if (!bytes)
> +			bytes = 2;
> +
> +		ret = vc_do_mmio(ghcb, ctxt, bytes, true);
> +		if (ret)
> +			break;
> +
> +		/* Zero extend based on operand size */
> +		reg_data = vc_insn_get_reg(ctxt);

That function can return NULL - you need to test reg_data. Ditto for all
its invocations.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
