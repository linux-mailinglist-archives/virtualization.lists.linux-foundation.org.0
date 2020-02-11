Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EE3159C16
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 23:23:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2977986FE7;
	Tue, 11 Feb 2020 22:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fyrUJ1kOlk+F; Tue, 11 Feb 2020 22:23:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 390B486FCD;
	Tue, 11 Feb 2020 22:23:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 186DEC07FE;
	Tue, 11 Feb 2020 22:23:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9FEFC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D3FE4851AD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t3TN76rNJSHW
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:23:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C123784BAF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:23:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 540AA2073C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581459816;
 bh=B7K4yeP+wsAaGM+9asZDsvxz4eZpyBHcowR6WxBytJ4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CY/TDN8CTOy4uhUDE9MtwexEwTPeH9ydGAc14TkvdiNuMvj1gTvSfuSBmvnUmLWBh
 F0eRW8YtKvFzX0+3iWfyceWjauVSbQkEbchtX5WeDAJLl9ry1+oxRnkaXfjUErpkb8
 7QHSriIJU4RupYMkJ5dynPuuTOyvPgaahUNDu4rM=
Received: by mail-wr1-f51.google.com with SMTP id z3so14565283wru.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:23:36 -0800 (PST)
X-Gm-Message-State: APjAAAUp3BlRxzcXh2dhLC0IpDPdNUs4bBnkxxdEsfvInJ7TJHtVg3gO
 XkmMLh2igzfkDLV81bqOE9OC7g3KrdcMyOi61KTNjQ==
X-Google-Smtp-Source: APXvYqwNKgD18pxIMnZ+UjAmzP3C4LJr4TQCPTCaN06PRaE2H/CA8ii1AroRFVGL7JhSZML6c4Tc2PZGC+b4Rgf4nso=
X-Received: by 2002:a5d:5305:: with SMTP id e5mr11036703wrv.18.1581459814664; 
 Tue, 11 Feb 2020 14:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-15-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-15-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 11 Feb 2020 14:23:22 -0800
X-Gmail-Original-Message-ID: <CALCETrWh58j3a2exXE0GE5E9EN+U=F8JEix74MUEFkoWY6Gf6Q@mail.gmail.com>
Message-ID: <CALCETrWh58j3a2exXE0GE5E9EN+U=F8JEix74MUEFkoWY6Gf6Q@mail.gmail.com>
Subject: Re: [PATCH 14/62] x86/boot/compressed/64: Add stage1 #VC handler
To: Joerg Roedel <joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
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

On Tue, Feb 11, 2020 at 5:53 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> From: Joerg Roedel <jroedel@suse.de>
>
> Add the first handler for #VC exceptions. At stage 1 there is no GHCB
> yet becaue we might still be on the EFI page table and thus can't map
> memory unencrypted.
>
> The stage 1 handler is limited to the MSR based protocol to talk to
> the hypervisor and can only support CPUID exit-codes, but that is
> enough to get to stage 2.
>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/boot/compressed/Makefile          |  1 +
>  arch/x86/boot/compressed/idt_64.c          |  4 ++
>  arch/x86/boot/compressed/idt_handlers_64.S |  4 ++
>  arch/x86/boot/compressed/misc.h            |  1 +
>  arch/x86/boot/compressed/sev-es.c          | 42 ++++++++++++++
>  arch/x86/include/asm/msr-index.h           |  1 +
>  arch/x86/include/asm/sev-es.h              | 45 +++++++++++++++
>  arch/x86/include/asm/trap_defs.h           |  1 +
>  arch/x86/kernel/sev-es-shared.c            | 66 ++++++++++++++++++++++
>  9 files changed, 165 insertions(+)
>  create mode 100644 arch/x86/boot/compressed/sev-es.c
>  create mode 100644 arch/x86/include/asm/sev-es.h
>  create mode 100644 arch/x86/kernel/sev-es-shared.c
>
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> index e6b3e0fc48de..583678c78e1b 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -84,6 +84,7 @@ ifdef CONFIG_X86_64
>         vmlinux-objs-y += $(obj)/idt_64.o $(obj)/idt_handlers_64.o
>         vmlinux-objs-y += $(obj)/mem_encrypt.o
>         vmlinux-objs-y += $(obj)/pgtable_64.o
> +       vmlinux-objs-$(CONFIG_AMD_MEM_ENCRYPT) += $(obj)/sev-es.o
>  endif
>
>  vmlinux-objs-$(CONFIG_ACPI) += $(obj)/acpi.o
> diff --git a/arch/x86/boot/compressed/idt_64.c b/arch/x86/boot/compressed/idt_64.c
> index 84ba57d9d436..bdd20dfd1fd0 100644
> --- a/arch/x86/boot/compressed/idt_64.c
> +++ b/arch/x86/boot/compressed/idt_64.c
> @@ -31,6 +31,10 @@ void load_stage1_idt(void)
>  {
>         boot_idt_desc.address = (unsigned long)boot_idt;
>
> +#ifdef CONFIG_AMD_MEM_ENCRYPT
> +       set_idt_entry(X86_TRAP_VC, boot_stage1_vc_handler);
> +#endif
> +
>         load_boot_idt(&boot_idt_desc);
>  }
>
> diff --git a/arch/x86/boot/compressed/idt_handlers_64.S b/arch/x86/boot/compressed/idt_handlers_64.S
> index f7f1ea66dcbf..330eb4e5c8b3 100644
> --- a/arch/x86/boot/compressed/idt_handlers_64.S
> +++ b/arch/x86/boot/compressed/idt_handlers_64.S
> @@ -71,3 +71,7 @@ SYM_FUNC_END(\name)
>         .code64
>
>  EXCEPTION_HANDLER      boot_pf_handler do_boot_page_fault error_code=1
> +
> +#ifdef CONFIG_AMD_MEM_ENCRYPT
> +EXCEPTION_HANDLER      boot_stage1_vc_handler no_ghcb_vc_handler error_code=1
> +#endif
> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
> index 4e5bc688f467..0e3508c5c15c 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -141,5 +141,6 @@ extern struct desc_ptr boot_idt_desc;
>
>  /* IDT Entry Points */
>  void boot_pf_handler(void);
> +void boot_stage1_vc_handler(void);
>
>  #endif /* BOOT_COMPRESSED_MISC_H */
> diff --git a/arch/x86/boot/compressed/sev-es.c b/arch/x86/boot/compressed/sev-es.c
> new file mode 100644
> index 000000000000..8d13121a8cf2
> --- /dev/null
> +++ b/arch/x86/boot/compressed/sev-es.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Encrypted Register State Support
> + *
> + * Author: Joerg Roedel <jroedel@suse.de>
> + */
> +
> +#include <linux/kernel.h>
> +
> +#include <asm/sev-es.h>
> +#include <asm/msr-index.h>
> +#include <asm/ptrace.h>
> +#include <asm/svm.h>
> +
> +#include "misc.h"
> +
> +static inline u64 read_ghcb_msr(void)
> +{
> +       unsigned long low, high;
> +
> +       asm volatile("rdmsr\n" : "=a" (low), "=d" (high) :
> +                       "c" (MSR_AMD64_SEV_ES_GHCB));
> +
> +       return ((high << 32) | low);
> +}
> +
> +static inline void write_ghcb_msr(u64 val)
> +{
> +       u32 low, high;
> +
> +       low  = val & 0xffffffffUL;
> +       high = val >> 32;
> +
> +       asm volatile("wrmsr\n" : : "c" (MSR_AMD64_SEV_ES_GHCB),
> +                       "a"(low), "d" (high) : "memory");
> +}
> +
> +#undef __init
> +#define __init
> +
> +/* Include code for early handlers */
> +#include "../../kernel/sev-es-shared.c"
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index ebe1685e92dd..b6139b70db54 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -432,6 +432,7 @@
>  #define MSR_AMD64_IBSBRTARGET          0xc001103b
>  #define MSR_AMD64_IBSOPDATA4           0xc001103d
>  #define MSR_AMD64_IBS_REG_COUNT_MAX    8 /* includes MSR_AMD64_IBSBRTARGET */
> +#define MSR_AMD64_SEV_ES_GHCB          0xc0010130
>  #define MSR_AMD64_SEV                  0xc0010131
>  #define MSR_AMD64_SEV_ENABLED_BIT      0
>  #define MSR_AMD64_SEV_ENABLED          BIT_ULL(MSR_AMD64_SEV_ENABLED_BIT)
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
> +#define GHCB_SEV_CPUID_REQ     0x004UL
> +#define                GHCB_CPUID_REQ_EAX      0
> +#define                GHCB_CPUID_REQ_EBX      1
> +#define                GHCB_CPUID_REQ_ECX      2
> +#define                GHCB_CPUID_REQ_EDX      3
> +#define                GHCB_CPUID_REQ(fn, reg) (GHCB_SEV_CPUID_REQ | \
> +                                       (((unsigned long)reg & 3) << 30) | \
> +                                       (((unsigned long)fn) << 32))
> +
> +#define GHCB_SEV_CPUID_RESP    0x005UL
> +#define GHCB_SEV_TERMINATE     0x100UL
> +
> +#define        GHCB_SEV_GHCB_RESP_CODE(v)      ((v) & 0xfff)
> +#define        VMGEXIT()                       { asm volatile("rep; vmmcall\n\r"); }
> +
> +static inline u64 lower_bits(u64 val, unsigned int bits)
> +{
> +       u64 mask = (1ULL << bits) - 1;
> +
> +       return (val & mask);
> +}
> +
> +static inline u64 copy_lower_bits(u64 out, u64 in, unsigned int bits)
> +{
> +       u64 mask = (1ULL << bits) - 1;
> +
> +       out &= ~mask;
> +       out |= lower_bits(in, bits);
> +
> +       return out;
> +}
> +
> +#endif
> diff --git a/arch/x86/include/asm/trap_defs.h b/arch/x86/include/asm/trap_defs.h
> index 488f82ac36da..af45d65f0458 100644
> --- a/arch/x86/include/asm/trap_defs.h
> +++ b/arch/x86/include/asm/trap_defs.h
> @@ -24,6 +24,7 @@ enum {
>         X86_TRAP_AC,            /* 17, Alignment Check */
>         X86_TRAP_MC,            /* 18, Machine Check */
>         X86_TRAP_XF,            /* 19, SIMD Floating-Point Exception */
> +       X86_TRAP_VC = 29,       /* 29, VMM Communication Exception */
>         X86_TRAP_IRET = 32,     /* 32, IRET Exception */
>  };
>
> diff --git a/arch/x86/kernel/sev-es-shared.c b/arch/x86/kernel/sev-es-shared.c
> new file mode 100644
> index 000000000000..7edf2dfac71f
> --- /dev/null
> +++ b/arch/x86/kernel/sev-es-shared.c
> @@ -0,0 +1,66 @@
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
> +void __init no_ghcb_vc_handler(struct pt_regs *regs)

Isn't there a second parameter: unsigned long error_code?

--Andy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
