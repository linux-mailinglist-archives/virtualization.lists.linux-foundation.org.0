Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C01E51CD5CE
	for <lists.virtualization@lfdr.de>; Mon, 11 May 2020 12:02:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B1C642047D;
	Mon, 11 May 2020 10:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2jgBkT8hchIb; Mon, 11 May 2020 10:02:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9C5A6204A7;
	Mon, 11 May 2020 10:02:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64F19C016F;
	Mon, 11 May 2020 10:02:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A306FC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 10:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 910868852D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 10:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CvxNU+zbRRt4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 10:02:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B75808791E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 10:02:10 +0000 (UTC)
Received: from zn.tnic (p200300EC2F05F1002C1974F11FB72105.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f05:f100:2c19:74f1:1fb7:2105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 45A641EC02FA;
 Mon, 11 May 2020 12:02:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1589191327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=zwMOv/5lYrHVlC0KrboBSXdHgtiHMsqiApbipX705iE=;
 b=g1zePbp4zFJpzqNjEzIJ0MjfU42ysbAD86M/i6EJcFGZYnQFoUwU9TZWE9EGYpwUSqVVOB
 x8cBcUP13CAUZH+OvPxcw2KH21AwRYvi8CqxzNDqkT6mvEcdATfTQk1Ngx3Q8T8HcZ2x6x
 BFna8ZFwCLH3XjZeRCFMJ8EokPVQd80=
Date: Mon, 11 May 2020 12:02:01 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 22/75] x86/boot/compressed/64: Add
 set_page_en/decrypted() helpers
Message-ID: <20200511100201.GA25861@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-23-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-23-joro@8bytes.org>
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

On Tue, Apr 28, 2020 at 05:16:32PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The functions are needed to map the GHCB for SEV-ES guests. The GHCB is
> used for communication with the hypervisor, so its content must not be
> encrypted. After the GHCB is not needed anymore it must be mapped
> encrypted again so that the running kernel image can safely re-use the
> memory.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/boot/compressed/ident_map_64.c | 134 ++++++++++++++++++++++++
>  arch/x86/boot/compressed/misc.h         |   2 +
>  2 files changed, 136 insertions(+)

...

> +
> +static int set_clr_page_flags(struct x86_mapping_info *info,
> +			      unsigned long address,
> +			      pteval_t set, pteval_t clr)
> +{
> +	unsigned long scratch, *target;
> +	pgd_t *pgdp = (pgd_t *)top_level_pgt;
> +	p4d_t *p4dp;
> +	pud_t *pudp;
> +	pmd_t *pmdp;
> +	pte_t *ptep, pte;
> +
> +	/*
> +	 * First make sure there is a PMD mapping for 'address'.
> +	 * It should already exist, but keep things generic.
> +	 *
> +	 * To map the page just read from it and fault it in if there is no
> +	 * mapping yet. add_identity_map() can't be called here because that
> +	 * would unconditionally map the address on PMD level, destroying any
> +	 * PTE-level mappings that might already exist.  Also do something
> +	 * useless

You mean something like this?

        asm volatile("mov %[address], %%r9"
                     :: [address] "g" (*(unsigned long *)address)
                     : "r9", "memory");

The "memory" clobber should prevent gcc from optimizing that thing away
and r9 is callee-clobbered.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
