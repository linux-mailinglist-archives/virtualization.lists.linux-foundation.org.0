Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 221FE18DA13
	for <lists.virtualization@lfdr.de>; Fri, 20 Mar 2020 22:24:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C724C892AF;
	Fri, 20 Mar 2020 21:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TMYSQ12snrP3; Fri, 20 Mar 2020 21:24:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F3B988B83;
	Fri, 20 Mar 2020 21:24:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23475C07FF;
	Fri, 20 Mar 2020 21:24:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05B83C07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 21:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E31F88746B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 21:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RaYi2YeTyNet
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 21:24:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DC25386DF4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 21:24:00 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id f16so3047552plj.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 14:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=X/c8paRwLZjm2U0/5wiR8BCzpWAXOizbkJkAGz1/xTY=;
 b=FmSfes3fzmDsxSDf9OY3G5hCUjwK5b8FM/PgWRhGkPg+DeLtF37pFoTd3rxKuwRYor
 ZCG6EBLl0CqtWgB3EdHZkzQk6pM2lbakxbB1mYU135Wm5BVhHt1Iz4pyKDxPIMg4ZCun
 8YLRN13LNT6V5rDbTkeJNTL0ZLKid/Pypuew9XtXwAj1kr6LqqvGg/kaXs1xPqC1Hz09
 DUCHFkfuoOBZkvFw2+KKaJJjzlrXzzkQr2q3KcQkX8xxl+zD7eIbz0GyzuAeL5sD2lMm
 FOHpJsqjzxYtysFc+O4sRpPPoFB2Xl/6In0xHpPy2UEf3iOoJdjtgODqaD3nCxRGPeFj
 C8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=X/c8paRwLZjm2U0/5wiR8BCzpWAXOizbkJkAGz1/xTY=;
 b=Llf6D1kMzFTr4UzdF9u4SIsRdnbNnISooUuq2dlWfAjCGuAwcyZMzapCcw1GTrZ7Xf
 m0BwipqrthPqCUMmSuO4FxPJVhoNy45vfbto5gJIJCLIRRv+2pg1JHk48gOWH7rnypLr
 z71K8gvuSRvgqCHE6Dald9puSAIJAqoicuFIK6AJf7XbtfW0xLJ/7kYMBDqRt7lh6vr0
 eUxVOlkM+iyldnlDV91r195Y4YStLdfxA0nPNB1As3GUtHo+lwzeWzzD9xFYoOji1FHg
 NJok1b7RpbpS0/i2GZcdEimZktbh8Uh0nmKFDFdATjI64oVaAKHyUiuqOOZrECOKJF7q
 +q1g==
X-Gm-Message-State: ANhLgQ22jCSBmv6DXMUtK2ZY89APYBzmkaNXWxfVWVX0jxTI/t7ORjIh
 +Ce7Wj9xbbnFktFiAuXlhle6dg==
X-Google-Smtp-Source: ADFU+vuFnCFN+GyTb1nOC+QI3RpAP+BeUX9VfNuO7G0qK7pWfbChQ4USVqOp6comwU1r9y51yS8kBw==
X-Received: by 2002:a17:90a:a791:: with SMTP id
 f17mr12242960pjq.22.1584739440181; 
 Fri, 20 Mar 2020 14:24:00 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id h11sm6340185pfq.56.2020.03.20.14.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 14:23:59 -0700 (PDT)
Date: Fri, 20 Mar 2020 14:23:58 -0700 (PDT)
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Joerg Roedel <joro@8bytes.org>, erdemaktas@google.com
Subject: Re: [PATCH 62/70] x86/kvm: Add KVM specific VMMCALL handling under
 SEV-ES
In-Reply-To: <20200319091407.1481-63-joro@8bytes.org>
Message-ID: <alpine.DEB.2.21.2003201423230.205664@chino.kir.corp.google.com>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-63-joro@8bytes.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
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
From: David Rientjes via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, 19 Mar 2020, Joerg Roedel wrote:

> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> Implement the callbacks to copy the processor state required by KVM to
> the GHCB.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> [ jroedel@suse.de: - Split out of a larger patch
>                    - Adapt to different callback functions ]
> Co-developed-by: Joerg Roedel <jroedel@suse.de>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/kvm.c | 35 +++++++++++++++++++++++++++++------
>  1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
> index 6efe0410fb72..0e3fc798d719 100644
> --- a/arch/x86/kernel/kvm.c
> +++ b/arch/x86/kernel/kvm.c
> @@ -34,6 +34,8 @@
>  #include <asm/hypervisor.h>
>  #include <asm/tlb.h>
>  #include <asm/cpuidle_haltpoll.h>
> +#include <asm/ptrace.h>
> +#include <asm/svm.h>
>  
>  static int kvmapf = 1;
>  
> @@ -729,13 +731,34 @@ static void __init kvm_init_platform(void)
>  	x86_platform.apic_post_init = kvm_apic_init;
>  }
>  
> +#if defined(CONFIG_AMD_MEM_ENCRYPT)
> +static void kvm_sev_es_hcall_prepare(struct ghcb *ghcb, struct pt_regs *regs)
> +{
> +	/* RAX and CPL are already in the GHCB */
> +	ghcb_set_rbx(ghcb, regs->bx);
> +	ghcb_set_rcx(ghcb, regs->cx);
> +	ghcb_set_rdx(ghcb, regs->dx);
> +	ghcb_set_rsi(ghcb, regs->si);

Is it possible to check the hypercall from RAX and only copy the needed 
regs or is there a requirement that they must all be copied 
unconditionally?

> +}
> +
> +static bool kvm_sev_es_hcall_finish(struct ghcb *ghcb, struct pt_regs *regs)
> +{
> +	/* No checking of the return state needed */
> +	return true;
> +}
> +#endif
> +
>  const __initconst struct hypervisor_x86 x86_hyper_kvm = {
> -	.name			= "KVM",
> -	.detect			= kvm_detect,
> -	.type			= X86_HYPER_KVM,
> -	.init.guest_late_init	= kvm_guest_init,
> -	.init.x2apic_available	= kvm_para_available,
> -	.init.init_platform	= kvm_init_platform,
> +	.name				= "KVM",
> +	.detect				= kvm_detect,
> +	.type				= X86_HYPER_KVM,
> +	.init.guest_late_init		= kvm_guest_init,
> +	.init.x2apic_available		= kvm_para_available,
> +	.init.init_platform		= kvm_init_platform,
> +#if defined(CONFIG_AMD_MEM_ENCRYPT)
> +	.runtime.sev_es_hcall_prepare	= kvm_sev_es_hcall_prepare,
> +	.runtime.sev_es_hcall_finish	= kvm_sev_es_hcall_finish,
> +#endif
>  };
>  
>  static __init int activate_jump_labels(void)
> -- 
> 2.17.1
> 
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
