Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9901CE50F
	for <lists.virtualization@lfdr.de>; Mon, 11 May 2020 22:07:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E984288550;
	Mon, 11 May 2020 20:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zysTJtDU+a+M; Mon, 11 May 2020 20:07:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1D9DF88046;
	Mon, 11 May 2020 20:07:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00F60C016F;
	Mon, 11 May 2020 20:07:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47918C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 20:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 43AB586FAD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 20:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wyD_y9Ix5Qoi
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 20:07:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1FAAA870F8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 20:07:18 +0000 (UTC)
Received: from zn.tnic (p200300EC2F05F100A8DEEC94B2257A59.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f05:f100:a8de:ec94:b225:7a59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D318C1EC0181;
 Mon, 11 May 2020 22:07:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1589227635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=6V0UglHmaPSn0pB7O5vwdd6aAFUZM3fIGTypXgEARCU=;
 b=BMJCAA/UBiKZxAw/nUA7M3/0bJYk5/UYgZ3bdMYa+unPvnqZd8t1p+785fVTys2QvCbQFs
 lCJitOtnkhOhGi4I00ZpvyqaIsWnkNWYeHeUpIYoko6aQucsWFbcs7U1XmBA+Kh5Gie/1X
 j7jJxWHctWYX79YCC0gI55on7Ud9r7s=
Date: Mon, 11 May 2020 22:07:09 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 23/75] x86/boot/compressed/64: Setup GHCB Based VC
 Exception handler
Message-ID: <20200511200709.GE25861@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-24-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-24-joro@8bytes.org>
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

On Tue, Apr 28, 2020 at 05:16:33PM +0200, Joerg Roedel wrote:
> @@ -63,3 +175,45 @@ void __init do_vc_no_ghcb(struct pt_regs *regs, unsigned long exit_code)
>  	while (true)
>  		asm volatile("hlt\n");
>  }
> +
> +static enum es_result vc_insn_string_read(struct es_em_ctxt *ctxt,
> +					  void *src, char *buf,
> +					  unsigned int data_size,
> +					  unsigned int count,
> +					  bool backwards)
> +{
> +	int i, b = backwards ? -1 : 1;
> +	enum es_result ret = ES_OK;
> +
> +	for (i = 0; i < count; i++) {
> +		void *s = src + (i * data_size * b);
> +		char *d = buf + (i * data_size);

From a previous review:

Where are we checking whether that count is not exceeding @buf or
similar discrepancies?

Ditto below.

> +
> +		ret = vc_read_mem(ctxt, s, d, data_size);
> +		if (ret != ES_OK)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
> +static enum es_result vc_insn_string_write(struct es_em_ctxt *ctxt,
> +					   void *dst, char *buf,
> +					   unsigned int data_size,
> +					   unsigned int count,
> +					   bool backwards)
> +{
> +	int i, s = backwards ? -1 : 1;
> +	enum es_result ret = ES_OK;
> +
> +	for (i = 0; i < count; i++) {
> +		void *d = dst + (i * data_size * s);
> +		char *b = buf + (i * data_size);
> +
> +		ret = vc_write_mem(ctxt, d, b, data_size);
> +		if (ret != ES_OK)
> +			break;
> +	}
> +
> +	return ret;
> +}
> -- 
> 2.17.1
> 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
