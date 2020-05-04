Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0912B1C371A
	for <lists.virtualization@lfdr.de>; Mon,  4 May 2020 12:41:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8EBD487C10;
	Mon,  4 May 2020 10:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85sTZsq5OQYC; Mon,  4 May 2020 10:41:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E34F587B2E;
	Mon,  4 May 2020 10:41:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7A67C0175;
	Mon,  4 May 2020 10:41:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC883C0175
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 10:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9DD1E2048B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 10:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPerIJNFjK9G
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 10:41:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by silver.osuosl.org (Postfix) with ESMTPS id 234B620485
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 10:41:37 +0000 (UTC)
Received: from zn.tnic (p200300EC2F08AF00A9258889345EFBFA.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f08:af00:a925:8889:345e:fbfa])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DC0E51EC011B;
 Mon,  4 May 2020 12:41:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1588588894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=iRUNm3gcqi81lpr43dwmxdWf16YWxyP1UxTVlnpFzUU=;
 b=kuIp+12Q+Ly/02XXR6hpYKN7OouGtkNo7biM9HOEmVEhTzPn6oWp7JLSYxLEcLL7THnsuI
 uOJ/KMNOHqrpBJLxGMZrz6Dnr3mvcCxOKjbb+pFhKh3I/1xOg9r8213Q4Y8B7Cn3h6pD+d
 lUiNekNhlKGzhQzLbDWp8+pUbFsCGjw=
Date: Mon, 4 May 2020 12:41:29 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 12/75] x86/boot/compressed/64: Switch to __KERNEL_CS
 after GDT is loaded
Message-ID: <20200504104129.GD15046@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-13-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-13-joro@8bytes.org>
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

On Tue, Apr 28, 2020 at 05:16:22PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> When the pre-decompression code loads its first GDT in startup_64, it is
> still running on the CS value of the previous GDT. In the case of SEV-ES
> this is the EFI GDT.
> 
> To make exception handling work (especially IRET) the CPU needs to
> switch to a CS value in the current GDT, so jump to __KERNEL_CS after
> the first GDT is loaded.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/boot/compressed/head_64.S | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/x86/boot/compressed/head_64.S b/arch/x86/boot/compressed/head_64.S
> index 4f7e6b84be07..6b11060c3a0f 100644
> --- a/arch/x86/boot/compressed/head_64.S
> +++ b/arch/x86/boot/compressed/head_64.S
> @@ -393,6 +393,14 @@ SYM_CODE_START(startup_64)
>  	addq	%rax, 2(%rax)
>  	lgdt	(%rax)
>  
> +	/* Reload CS so IRET returns to a CS actually in the GDT */
> +	pushq	$__KERNEL_CS
> +	leaq	.Lon_kernel_cs(%rip), %rax
> +	pushq	%rax
> +	lretq
> +
> +.Lon_kernel_cs:
> +
>  	/*
>  	 * paging_prepare() sets up the trampoline and checks if we need to
>  	 * enable 5-level paging.
> -- 

So I'm thinking I should take this one even now on the grounds that
it sanitizes CS to something known-good than what was there before and
who knows what set it and loaded the kernel...?

And that is a good thing in itself.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
