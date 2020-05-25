Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 537301E0C57
	for <lists.virtualization@lfdr.de>; Mon, 25 May 2020 12:59:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9FDC487CD6;
	Mon, 25 May 2020 10:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlBUKn4-nAmE; Mon, 25 May 2020 10:59:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2F8AB87DAF;
	Mon, 25 May 2020 10:59:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15063C0865;
	Mon, 25 May 2020 10:59:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23890C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 10:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1288C85E7D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 10:59:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3p_0n7bRiI7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 10:59:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8AEC685932
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 10:59:44 +0000 (UTC)
Received: from zn.tnic (p200300ec2f06f3002884bb6a9703d441.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f06:f300:2884:bb6a:9703:d441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BF2A61EC01E0;
 Mon, 25 May 2020 12:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1590404381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=BjuXSESQj06++1FVczfy6FPyMVhHDlsVpK90rZ0EYqU=;
 b=HJA9f4y3T8PN5nUEk1pZ8uRkMTTM3Rf089DcwCcMSLgS8ImdyeWEAv8P0TP8gZdv80RS1x
 8riSP7CGgsZfc4RE1b8xT2EYlmG7e7GD1zMM4O44byf2wekd9uH1EIzWMxI6C8VG61nAM2
 OAbaJ3Se1DYjOQ30eg1u9Dd/MxWs0Kg=
Date: Mon, 25 May 2020 12:59:35 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 54/75] x86/sev-es: Handle DR7 read/write events
Message-ID: <20200525105935.GH25636@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-55-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-55-joro@8bytes.org>
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

On Tue, Apr 28, 2020 at 05:17:04PM +0200, Joerg Roedel wrote:
> +static enum es_result vc_handle_dr7_write(struct ghcb *ghcb,
> +					  struct es_em_ctxt *ctxt)
> +{
> +	struct sev_es_runtime_data *data = this_cpu_read(runtime_data);
> +	long val, *reg = vc_insn_get_rm(ctxt);
> +	enum es_result ret;
> +
> +	if (!reg)
> +		return ES_DECODE_FAILED;
> +
> +	val = *reg;
> +
> +	/* Upper 32 bits must be written as zeroes */
> +	if (val >> 32) {
> +		ctxt->fi.vector = X86_TRAP_GP;
> +		ctxt->fi.error_code = 0;
> +		return ES_EXCEPTION;
> +	}
> +
> +	/* Clear out other reservered bits and set bit 10 */

"reserved"

> +	val = (val & 0xffff23ffL) | BIT(10);
> +
> +	/* Early non-zero writes to DR7 are not supported */
> +	if (!data && (val & ~DR7_RESET_VALUE))
> +		return ES_UNSUPPORTED;
> +
> +	/* Using a value of 0 for ExitInfo1 means RAX holds the value */
> +	ghcb_set_rax(ghcb, val);
> +	ret = sev_es_ghcb_hv_call(ghcb, ctxt, SVM_EXIT_WRITE_DR7, 0, 0);
> +	if (ret != ES_OK)
> +		return ret;
> +
> +	if (data)
> +		data->dr7 = val;

Are we still returning ES_OK if !data?

> +
> +	return ES_OK;
> +}

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
