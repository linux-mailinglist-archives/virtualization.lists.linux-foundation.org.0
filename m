Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B239C2CBD09
	for <lists.virtualization@lfdr.de>; Wed,  2 Dec 2020 13:32:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 65E97870E3;
	Wed,  2 Dec 2020 12:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYZnhvfRv2ly; Wed,  2 Dec 2020 12:32:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8149F870DE;
	Wed,  2 Dec 2020 12:32:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 566B5C0052;
	Wed,  2 Dec 2020 12:32:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 200E1C0052
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 12:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0E4EC87BB2
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 12:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WNrAg9MpeqMt
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 12:32:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1B0E787BA6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 12:32:42 +0000 (UTC)
Received: from zn.tnic (p200300ec2f161b00e186258fb055049e.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f16:1b00:e186:258f:b055:49e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 839061EC0445;
 Wed,  2 Dec 2020 13:32:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1606912359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=o/X2Q8TjgxS2AV7FMOJUAyk9P7ykB2huuy5Ud2cBljk=;
 b=fME5MejkgBN0mNXJWemh6uyBGI0q25TJUz52B4+MjOgCtx/vrQOy0f9Ub8yPrBnpMg8dIl
 1BtvFqXRtCl5jfju1qfzn/8xxugE+mK0UXIH4WMg2ulGvxAIS6TwI4OPYiLuQNYyxJFg8+
 GLKfO3eez6x6jvEShA/6zBynFK93hw4=
Date: Wed, 2 Dec 2020 13:32:35 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 04/12] x86/xen: drop USERGS_SYSRET64 paravirt call
Message-ID: <20201202123235.GD2951@zn.tnic>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-5-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120114630.13552-5-jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, peterz@infradead.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, "VMware,
 Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>, luto@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

On Fri, Nov 20, 2020 at 12:46:22PM +0100, Juergen Gross wrote:
> @@ -123,12 +115,15 @@ SYM_INNER_LABEL(entry_SYSCALL_64_after_hwframe, SYM_L_GLOBAL)
>  	 * Try to use SYSRET instead of IRET if we're returning to
>  	 * a completely clean 64-bit userspace context.  If we're not,
>  	 * go to the slow exit path.
> +	 * In the Xen PV case we must use iret anyway.
>  	 */
> -	movq	RCX(%rsp), %rcx
> -	movq	RIP(%rsp), %r11
>  
> -	cmpq	%rcx, %r11	/* SYSRET requires RCX == RIP */
> -	jne	swapgs_restore_regs_and_return_to_usermode
> +	ALTERNATIVE __stringify( \
> +		movq	RCX(%rsp), %rcx; \
> +		movq	RIP(%rsp), %r11; \
> +		cmpq	%rcx, %r11;	/* SYSRET requires RCX == RIP */ \
> +		jne	swapgs_restore_regs_and_return_to_usermode), \
> +	"jmp	swapgs_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV

Why such a big ALTERNATIVE when you can simply do:

        /*
         * Try to use SYSRET instead of IRET if we're returning to
         * a completely clean 64-bit userspace context.  If we're not,
         * go to the slow exit path.
         * In the Xen PV case we must use iret anyway.
         */
        ALTERNATIVE "", "jmp swapgs_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV

        movq    RCX(%rsp), %rcx;
        movq    RIP(%rsp), %r11;
        cmpq    %rcx, %r11;     /* SYSRET requires RCX == RIP */ \
        jne     swapgs_restore_regs_and_return_to_usermode

?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
