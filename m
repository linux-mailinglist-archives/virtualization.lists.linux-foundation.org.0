Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1B62577F6
	for <lists.virtualization@lfdr.de>; Mon, 31 Aug 2020 13:11:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C1DFA20438;
	Mon, 31 Aug 2020 11:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hRnUhvUcXP2w; Mon, 31 Aug 2020 11:11:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ACD7C20404;
	Mon, 31 Aug 2020 11:11:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CF60C0051;
	Mon, 31 Aug 2020 11:11:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8EB8C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 11:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C552D863E0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 11:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76VxF3uGTu-l
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 11:11:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 11FB08633B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 11:11:24 +0000 (UTC)
Received: from zn.tnic (p200300ec2f085000329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f08:5000:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 747751EC02C1;
 Mon, 31 Aug 2020 13:11:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1598872282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=6DWUFpLyD0dihOF5P86+PovaOqwSm4uuphdxui7Xrvw=;
 b=jDIns6L2Fow2zYngKM/z6o3+stBkjSGWtG75dZ7oqtqaPxtxigor349Wn+PgLw4keVwjjp
 aGyvQWklsUrmaMPkcUNbJSsd80F8bQK6/LPR2n+OcCBSaZdvuOTAI5qxMjjzxfkNrMnbvY
 xet6+Btlqkzw/ZLmYY6co4sAhcafvDM=
Date: Mon, 31 Aug 2020 13:11:23 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v6 47/76] x86/dumpstack/64: Add noinstr version of
 get_stack_info()
Message-ID: <20200831111123.GG27517@zn.tnic>
References: <20200824085511.7553-1-joro@8bytes.org>
 <20200824085511.7553-48-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824085511.7553-48-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>, Joerg Roedel <jroedel@suse.de>,
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

On Mon, Aug 24, 2020 at 10:54:42AM +0200, Joerg Roedel wrote:
> diff --git a/arch/x86/kernel/dumpstack_64.c b/arch/x86/kernel/dumpstack_64.c
> index c49cf594714b..5a85730eb0ca 100644
> --- a/arch/x86/kernel/dumpstack_64.c
> +++ b/arch/x86/kernel/dumpstack_64.c
> @@ -85,7 +85,7 @@ struct estack_pages estack_pages[CEA_ESTACK_PAGES] ____cacheline_aligned = {
>  	EPAGERANGE(VC2),
>  };
>  
> -static bool in_exception_stack(unsigned long *stack, struct stack_info *info)
> +static bool __always_inline in_exception_stack(unsigned long *stack, struct stack_info *info)

Yeah, checkpatch seems to complain correctly here:

ERROR: inline keyword should sit between storage class and type
#88: FILE: arch/x86/kernel/dumpstack_64.c:88:
+static bool __always_inline in_exception_stack(unsigned long *stack, struct stack_info *info)

ERROR: inline keyword should sit between storage class and type
#97: FILE: arch/x86/kernel/dumpstack_64.c:129:
+static bool __always_inline in_irq_stack(unsigned long *stack, struct stack_info *info)

> +int get_stack_info(unsigned long *stack, struct task_struct *task,
> +		   struct stack_info *info, unsigned long *visit_mask)
> +{
> +	task = task ? : current;
> +
> +	if (!stack)
> +		goto unknown;
> +
> +	if (!get_stack_info_noinstr(stack, task, info))
> +		goto unknown;
>  
> -recursion_check:
>  	/*
>  	 * Make sure we don't iterate through any given stack more than once.
>  	 * If it comes up a second time then there's something wrong going on:
> @@ -196,4 +202,5 @@ int get_stack_info(unsigned long *stack, struct task_struct *task,
>  unknown:
>  	info->type = STACK_TYPE_UNKNOWN;
>  	return -EINVAL;
> +
^ Superfluous newline.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
