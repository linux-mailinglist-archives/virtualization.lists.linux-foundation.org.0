Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAE518DA0B
	for <lists.virtualization@lfdr.de>; Fri, 20 Mar 2020 22:16:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D0E2221553;
	Fri, 20 Mar 2020 21:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWLxI5sQUKmO; Fri, 20 Mar 2020 21:16:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3EE5023223;
	Fri, 20 Mar 2020 21:16:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02C15C07FF;
	Fri, 20 Mar 2020 21:16:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2B01C07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 21:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B8A2C86355
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 21:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JTZCKWpUYNfk
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 21:16:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A6B9F85F79
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 21:16:41 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id h72so1723579pfe.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 14:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=sPNjOMWv5tH+y8DR9zRGwW8VovTIaVhSNxirxK4bRvw=;
 b=qJm7mQBhow7miniq3pN1Q0zWjYozOumz39ILHSWw5JPNezgYzOMGhNX+L3gKPrP27d
 JCjmsCPRkVyEbcgRfYDdTRw756dZEeSiZm2bgGoOeHSwclYC/Q1n0YWq2oJIvhrqalQZ
 iIoxbXPSUZ+4hW1YimFiHj6PW1vVqP4J9uvDihDGDjsAIYnjHjkXGJoVDCNA/5mnRr08
 2IT4AItr8pVs0MiF6TVuU/mdnwbZrK0lO1TCBzT/eaelPWrdDtLsUKkndAfY5GRdMkTD
 j9gYnTDx702HAwTyhozUabvs/Zwb/OMoq/7nXZfJc6BeTqYrX0fnwJWqQwZgOhA3KAww
 5vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=sPNjOMWv5tH+y8DR9zRGwW8VovTIaVhSNxirxK4bRvw=;
 b=Crplq1ojKkOv23YoQcmKCDhc6fL1UL1Pr7kD833LV4zs3Nhpr9J1pOvDzp+2vdDT5g
 gvLVGd5KczihdePRsvrfBxilXA+KpqHLUO4B0EG3mgmKtpE8e2TromSwTBR0Wf7Paoyj
 K4hs7iH0la0JnwDZ6Z948FGw/csCn0E1l86tUwOyyauu8TQYKoegS9WFP9igjTERLzp+
 bNb9luhILNYRzY6XwW/GOxwRjl/YXST9ysNrHCBGF/ELDRVM4nwBUxeixFZZFI1TxA6w
 GeW5SiyHfZoweea7aTc+cCRgzfCaS3InVO48VhsEhUMdiTIAA7kTnQOkEP65QaJuClkk
 bMNQ==
X-Gm-Message-State: ANhLgQ27VtaLWqOoTIYuag4to3OhIXHCXFnPZptroklKTmehBGlrB+SO
 UO+BGNYEuNd+iCDqdnDqaOqriQ==
X-Google-Smtp-Source: ADFU+vt7tmXBZHZs8iTn2PbuBTIF+ft5pzs2V8T7GPerNEV6PCz3cI+0aORiv3PtC3ghNqnqMdZWjg==
X-Received: by 2002:a63:30c4:: with SMTP id
 w187mr10906683pgw.239.1584739000823; 
 Fri, 20 Mar 2020 14:16:40 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id g14sm6323165pfb.131.2020.03.20.14.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 14:16:39 -0700 (PDT)
Date: Fri, 20 Mar 2020 14:16:39 -0700 (PDT)
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Joerg Roedel <joro@8bytes.org>, erdemaktas@google.com
Subject: Re: [PATCH 18/70] x86/boot/compressed/64: Add stage1 #VC handler
In-Reply-To: <20200319091407.1481-19-joro@8bytes.org>
Message-ID: <alpine.DEB.2.21.2003201413010.205664@chino.kir.corp.google.com>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-19-joro@8bytes.org>
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

> diff --git a/arch/x86/include/asm/sev-es.h b/arch/x86/include/asm/sev-es.h
> new file mode 100644
> index 000000000000..f524b40aef07
> --- /dev/null
> +++ b/arch/x86/include/asm/sev-es.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * AMD Encrypted Register State Support
> + *
> + * Author: Joerg Roedel <jroedel@suse.de>
> + */
> +
> +#ifndef __ASM_ENCRYPTED_STATE_H
> +#define __ASM_ENCRYPTED_STATE_H
> +
> +#include <linux/types.h>
> +
> +#define GHCB_SEV_CPUID_REQ	0x004UL
> +#define		GHCB_CPUID_REQ_EAX	0
> +#define		GHCB_CPUID_REQ_EBX	1
> +#define		GHCB_CPUID_REQ_ECX	2
> +#define		GHCB_CPUID_REQ_EDX	3
> +#define		GHCB_CPUID_REQ(fn, reg) (GHCB_SEV_CPUID_REQ | \
> +					(((unsigned long)reg & 3) << 30) | \
> +					(((unsigned long)fn) << 32))
> +
> +#define GHCB_SEV_CPUID_RESP	0x005UL
> +#define GHCB_SEV_TERMINATE	0x100UL
> +
> +#define	GHCB_SEV_GHCB_RESP_CODE(v)	((v) & 0xfff)
> +#define	VMGEXIT()			{ asm volatile("rep; vmmcall\n\r"); }

Since preemption and irqs should be disabled before updating the GHCB and 
its MSR and until the contents have been accessed following VMGEXIT, 
should there be checks in place to ensure that's always the case?

> +
> +static inline u64 lower_bits(u64 val, unsigned int bits)
> +{
> +	u64 mask = (1ULL << bits) - 1;
> +
> +	return (val & mask);
> +}
> +
> +static inline u64 copy_lower_bits(u64 out, u64 in, unsigned int bits)
> +{
> +	u64 mask = (1ULL << bits) - 1;
> +
> +	out &= ~mask;
> +	out |= lower_bits(in, bits);
> +
> +	return out;
> +}
> +
> +#endif
> diff --git a/arch/x86/include/asm/trap_defs.h b/arch/x86/include/asm/trap_defs.h
> index 488f82ac36da..af45d65f0458 100644
> --- a/arch/x86/include/asm/trap_defs.h
> +++ b/arch/x86/include/asm/trap_defs.h
> @@ -24,6 +24,7 @@ enum {
>  	X86_TRAP_AC,		/* 17, Alignment Check */
>  	X86_TRAP_MC,		/* 18, Machine Check */
>  	X86_TRAP_XF,		/* 19, SIMD Floating-Point Exception */
> +	X86_TRAP_VC = 29,	/* 29, VMM Communication Exception */
>  	X86_TRAP_IRET = 32,	/* 32, IRET Exception */
>  };
>  
> diff --git a/arch/x86/kernel/sev-es-shared.c b/arch/x86/kernel/sev-es-shared.c
> new file mode 100644
> index 000000000000..e963b48d3e86
> --- /dev/null
> +++ b/arch/x86/kernel/sev-es-shared.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Encrypted Register State Support
> + *
> + * Author: Joerg Roedel <jroedel@suse.de>
> + *
> + * This file is not compiled stand-alone. It contains code shared
> + * between the pre-decompression boot code and the running Linux kernel
> + * and is included directly into both code-bases.
> + */
> +
> +/*
> + * Boot VC Handler - This is the first VC handler during boot, there is no GHCB
> + * page yet, so it only supports the MSR based communication with the
> + * hypervisor and only the CPUID exit-code.
> + */
> +void __init vc_no_ghcb_handler(struct pt_regs *regs, unsigned long exit_code)
> +{
> +	unsigned int fn = lower_bits(regs->ax, 32);
> +	unsigned long val;
> +
> +	/* Only CPUID is supported via MSR protocol */
> +	if (exit_code != SVM_EXIT_CPUID)
> +		goto fail;
> +
> +	sev_es_wr_ghcb_msr(GHCB_CPUID_REQ(fn, GHCB_CPUID_REQ_EAX));
> +	VMGEXIT();
> +	val = sev_es_rd_ghcb_msr();
> +	if (GHCB_SEV_GHCB_RESP_CODE(val) != GHCB_SEV_CPUID_RESP)
> +		goto fail;
> +	regs->ax = val >> 32;
> +
> +	sev_es_wr_ghcb_msr(GHCB_CPUID_REQ(fn, GHCB_CPUID_REQ_EBX));
> +	VMGEXIT();
> +	val = sev_es_rd_ghcb_msr();
> +	if (GHCB_SEV_GHCB_RESP_CODE(val) != GHCB_SEV_CPUID_RESP)
> +		goto fail;
> +	regs->bx = val >> 32;
> +
> +	sev_es_wr_ghcb_msr(GHCB_CPUID_REQ(fn, GHCB_CPUID_REQ_ECX));
> +	VMGEXIT();
> +	val = sev_es_rd_ghcb_msr();
> +	if (GHCB_SEV_GHCB_RESP_CODE(val) != GHCB_SEV_CPUID_RESP)
> +		goto fail;
> +	regs->cx = val >> 32;
> +
> +	sev_es_wr_ghcb_msr(GHCB_CPUID_REQ(fn, GHCB_CPUID_REQ_EDX));
> +	VMGEXIT();
> +	val = sev_es_rd_ghcb_msr();
> +	if (GHCB_SEV_GHCB_RESP_CODE(val) != GHCB_SEV_CPUID_RESP)
> +		goto fail;
> +	regs->dx = val >> 32;
> +
> +	regs->ip += 2;
> +
> +	return;
> +
> +fail:
> +	sev_es_wr_ghcb_msr(GHCB_SEV_TERMINATE);
> +	VMGEXIT();
> +
> +	/* Shouldn't get here - if we do halt the machine */
> +	while (true)
> +		asm volatile("hlt\n");
> +}
> -- 
> 2.17.1
> 
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
