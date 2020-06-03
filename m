Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFE41ED176
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 15:52:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 176B488437;
	Wed,  3 Jun 2020 13:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3nrzZR6DTyst; Wed,  3 Jun 2020 13:52:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 236F188424;
	Wed,  3 Jun 2020 13:52:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EAC8DC0895;
	Wed,  3 Jun 2020 13:52:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9A9FC016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 13:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B38F588437
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 13:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id joXjaEU-A5gF
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 13:52:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6EE5B88424
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 13:52:53 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0b2300fc641046fe5d6605.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:2300:fc64:1046:fe5d:6605])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 564F01EC0391;
 Wed,  3 Jun 2020 15:52:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1591192370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=tupcOtxWYMxyJ3y62hq5YRNljYinVUxG6t+SPocYtUQ=;
 b=bVSWSttxu5jfvdmiza7JUElW6ZgnEDEy503L18klnvJDHBqAFLRKLFLorzo3l9JD3hE/AG
 JcBY5Xtx0hjaYuLe7GgEYnJBNH24lEGSm0BzmVbrGeL0PSW7+S9wgK6hN2JWEA0WFLJW+W
 eMhJ0O4gIFfAOJ9bu9emst5EStRHHLE=
Date: Wed, 3 Jun 2020 15:52:44 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 75/75] x86/efi: Add GHCB mappings when SEV-ES is active
Message-ID: <20200603135244.GD19711@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-76-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-76-joro@8bytes.org>
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

On Tue, Apr 28, 2020 at 05:17:25PM +0200, Joerg Roedel wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> Calling down to EFI runtime services can result in the firmware performing
> VMGEXIT calls. The firmware is likely to use the GHCB of the OS (e.g., for
> setting EFI variables), so each GHCB in the system needs to be identity
> mapped in the EFI page tables, as unencrypted, to avoid page faults.

...

> diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
> index eef6e2196ef4..3b62714723b5 100644
> --- a/arch/x86/kernel/sev-es.c
> +++ b/arch/x86/kernel/sev-es.c
> @@ -422,6 +422,31 @@ int sev_es_setup_ap_jump_table(struct real_mode_header *rmh)
>  	return 0;
>  }
>  

Trusting the firmware is never a good decision but we've established on
IRC that *this* firmware is in OVMF and is going to be part of the guest
measurement so if there's trouble we can always fix it, as opposed to
the actual firmware in the chip.

Please add some blurb above this function about it so that it is clear
what kind of EFI firmware it is about here.

> +int __init sev_es_efi_map_ghcbs(pgd_t *pgd)
> +{
> +	struct sev_es_runtime_data *data;
> +	unsigned long address, pflags;
> +	int cpu;
> +	u64 pfn;
> +
> +	if (!sev_es_active())
> +		return 0;
> +
> +	pflags = _PAGE_NX | _PAGE_RW;
> +
> +	for_each_possible_cpu(cpu) {
> +		data = per_cpu(runtime_data, cpu);
> +
> +		address = __pa(&data->ghcb_page);
> +		pfn = address >> PAGE_SHIFT;
> +
> +		if (kernel_map_pages_in_pgd(pgd, pfn, address, 1, pflags))
> +			return 1;
> +	}
> +
> +	return 0;
> +}

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
