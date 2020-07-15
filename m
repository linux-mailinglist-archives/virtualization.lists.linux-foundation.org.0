Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 592F72201EC
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 03:40:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E066C895D5;
	Wed, 15 Jul 2020 01:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KWM1MHI42I2i; Wed, 15 Jul 2020 01:40:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 45713895CC;
	Wed, 15 Jul 2020 01:40:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30577C08A9;
	Wed, 15 Jul 2020 01:40:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 784EAC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5A182895CC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F15VZEyRi7v1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:40:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A2F3E895CB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:40:32 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id j20so766288pfe.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 18:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yB4mfZhVGgML4uV5FJMaGcIbxMBeIJoUsQc2RIfPst4=;
 b=GwQiBY/mF/gzosD/19uNdGcObWYOeTnMNqoTyK/Mra8Yom+dF+q9WqmgL3exkJj5Ks
 ThzoIIqFrRVrwrBf2ezFEZbzlcV88k6koT1GBJS+RPZz5MUcJE4VyIexZyZoQNMN4biB
 mYfToQLkYNPG5zuJGNEKuZc80GG84FkVaqIOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yB4mfZhVGgML4uV5FJMaGcIbxMBeIJoUsQc2RIfPst4=;
 b=Gag75M0M/daA4KUvswpK8cT9UJ++Z3iAvw0/jSFfPRTgEB32htF4p1UXlvI/OWQm+C
 O85WAfgtn7lZBc7lJS47Fu5+OJvMHUs9PMbtJ3sVIZXdoyNYhXsjYEqW7Z1RbCAzG0XV
 M2FBZ+YoP9ohQBL+YcRA4WNx0d4Uhle4qos7MrmT8A0hR7rofHh5mueApO6/UUEyL4v9
 2mKr6mAspdFnF5cYePrAVSaqfO802To9LVP1beaYMyals1vZBpAqJDELB/lN6SjQfUsP
 EoswjPFxkLt07bBSKu9pUuGwHFPbj4is1+d6AhDN0EbtL5bUdJsAS0LKohzF3zqRn+Hd
 ZD3A==
X-Gm-Message-State: AOAM532RxwwtOvfrgJbRzvQuZpr+LERgc3C131UftMipljMUmaSU6Zvj
 jhyA2G5NtN+TeHf0TQ3OWmj7Cw==
X-Google-Smtp-Source: ABdhPJwZlZG81xgIsES7Sgk18FpcVoLdUj5ncFZJKakDpHjmEazwsdHMNLs36Zv3OD5kEjNWNMDBAg==
X-Received: by 2002:a63:dc50:: with SMTP id f16mr5461349pgj.19.1594777232199; 
 Tue, 14 Jul 2020 18:40:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z11sm345567pfr.71.2020.07.14.18.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 18:40:31 -0700 (PDT)
Date: Tue, 14 Jul 2020 18:40:30 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 70/75] x86/head/64: Don't call verify_cpu() on
 starting APs
Message-ID: <202007141837.2B93BBD78@keescook>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-71-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714120917.11253-71-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
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

On Tue, Jul 14, 2020 at 02:09:12PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The APs are not ready to handle exceptions when verify_cpu() is called
> in secondary_startup_64.

Eek, no. MSR_IA32_MISC_ENABLE_XD_DISABLE needs to be cleared very early
during CPU startup; this can't just be skipped.

Also, is UNWIND_HINT_EMPTY needed for the new target?

-Kees

> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/include/asm/realmode.h | 1 +
>  arch/x86/kernel/head_64.S       | 1 +
>  arch/x86/realmode/init.c        | 6 ++++++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/arch/x86/include/asm/realmode.h b/arch/x86/include/asm/realmode.h
> index 6590394af309..5c97807c38a4 100644
> --- a/arch/x86/include/asm/realmode.h
> +++ b/arch/x86/include/asm/realmode.h
> @@ -69,6 +69,7 @@ extern unsigned char startup_32_smp[];
>  extern unsigned char boot_gdt[];
>  #else
>  extern unsigned char secondary_startup_64[];
> +extern unsigned char secondary_startup_64_no_verify[];
>  #endif
>  
>  static inline size_t real_mode_size_needed(void)
> diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
> index 5b577d6bce7a..8b43ed0592e8 100644
> --- a/arch/x86/kernel/head_64.S
> +++ b/arch/x86/kernel/head_64.S
> @@ -165,6 +165,7 @@ SYM_CODE_START(secondary_startup_64)
>  	/* Sanitize CPU configuration */
>  	call verify_cpu
>  
> +SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
>  	/*
>  	 * Retrieve the modifier (SME encryption mask if SME is active) to be
>  	 * added to the initial pgdir entry that will be programmed into CR3.
> diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
> index 61a52b925d15..df701f87ddef 100644
> --- a/arch/x86/realmode/init.c
> +++ b/arch/x86/realmode/init.c
> @@ -46,6 +46,12 @@ static void sme_sev_setup_real_mode(struct trampoline_header *th)
>  		th->flags |= TH_FLAGS_SME_ACTIVE;
>  
>  	if (sev_es_active()) {
> +		/*
> +		 * Skip the call to verify_cpu() in secondary_startup_64 as it
> +		 * will cause #VC exceptions when the AP can't handle them yet.
> +		 */
> +		th->start = (u64) secondary_startup_64_no_verify;
> +
>  		if (sev_es_setup_ap_jump_table(real_mode_header))
>  			panic("Failed to update SEV-ES AP Jump Table");
>  	}
> -- 
> 2.27.0
> 

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
