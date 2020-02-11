Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FB3159C07
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 23:19:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 367F986B48;
	Tue, 11 Feb 2020 22:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UwGivYRk+G3l; Tue, 11 Feb 2020 22:19:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E9CF86BDE;
	Tue, 11 Feb 2020 22:19:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A6FBC07FE;
	Tue, 11 Feb 2020 22:19:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10324C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id ECE3B86BDE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:19:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBJVdeRURGiq
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:19:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4580B86B48
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:19:05 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C108520870
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581459545;
 bh=BtTTbf66d4ZndImglbcpTn7JSHa69QCkwdohC6uLX1M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pNbwbbi6Ci2U0CegsqKkSd0uMThWVqEvNPAYsf2DpZ1yT7m/16h5w6LqKBIT55mpA
 THrH5gPXzGb2YyfOdKfRYRkZLwBp2YMoxW1WQvz59IVtCxpT0/OjlzQSRJE30Dp6uP
 Ax4QtsSW0xKQ05QmUFM/gxvOnDNW6Zv1C9MiE140=
Received: by mail-wm1-f43.google.com with SMTP id a5so5740257wmb.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:19:04 -0800 (PST)
X-Gm-Message-State: APjAAAVM9DCJWD80kNjaoWAWDD71ozDjFkbarVJHKRAMOtME/IDVUy/W
 bJ0qgd9mKYead20SxUJKC0RooiURyOabDDUapYG8DQ==
X-Google-Smtp-Source: APXvYqxgH/L+PTOkvq4VwpcjEPNRJ4Rn+9UAJW/4iUfZMfvCSX5HF6lMTrDQecp2ABQPGJPH/KdOIIfJxqSFOOyTAqE=
X-Received: by 2002:a1c:3906:: with SMTP id g6mr8465912wma.49.1581459543059;
 Tue, 11 Feb 2020 14:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-9-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-9-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 11 Feb 2020 14:18:52 -0800
X-Gmail-Original-Message-ID: <CALCETrWznWHQNfd80G95G_CB-yCw8Botqee8bsLz3OcC4-SS=w@mail.gmail.com>
Message-ID: <CALCETrWznWHQNfd80G95G_CB-yCw8Botqee8bsLz3OcC4-SS=w@mail.gmail.com>
Subject: Re: [PATCH 08/62] x86/boot/compressed/64: Add IDT Infrastructure
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
> Add code needed to setup an IDT in the early pre-decompression
> boot-code. The IDT is loaded first in startup_64, which is after
> EfiExitBootServices() has been called, and later reloaded when the
> kernel image has been relocated to the end of the decompression area.
>
> This allows to setup different IDT handlers before and after the
> relocation.
>

> diff --git a/arch/x86/boot/compressed/idt_64.c b/arch/x86/boot/compressed/idt_64.c
> new file mode 100644
> index 000000000000..46ecea671b90
> --- /dev/null
> +++ b/arch/x86/boot/compressed/idt_64.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <asm/trap_defs.h>
> +#include <asm/segment.h>
> +#include "misc.h"
> +
> +static void set_idt_entry(int vector, void (*handler)(void))
> +{
> +       unsigned long address = (unsigned long)handler;
> +       gate_desc entry;
> +
> +       memset(&entry, 0, sizeof(entry));
> +
> +       entry.offset_low    = (u16)(address & 0xffff);
> +       entry.segment       = __KERNEL_CS;
> +       entry.bits.type     = GATE_TRAP;

^^^

I realize we're not running a real kernel here, but GATE_TRAP is
madness.  Please use GATE_INTERRUPT.

> +       entry.bits.p        = 1;
> +       entry.offset_middle = (u16)((address >> 16) & 0xffff);
> +       entry.offset_high   = (u32)(address >> 32);
> +
> +       memcpy(&boot_idt[vector], &entry, sizeof(entry));
> +}
> +
> +/* Have this here so we don't need to include <asm/desc.h> */
> +static void load_boot_idt(const struct desc_ptr *dtr)
> +{
> +       asm volatile("lidt %0"::"m" (*dtr));
> +}
> +
> +/* Setup IDT before kernel jumping to  .Lrelocated */
> +void load_stage1_idt(void)
> +{
> +       boot_idt_desc.address = (unsigned long)boot_idt;
> +
> +       load_boot_idt(&boot_idt_desc);
> +}
> +
> +/* Setup IDT after kernel jumping to  .Lrelocated */
> +void load_stage2_idt(void)
> +{
> +       boot_idt_desc.address = (unsigned long)boot_idt;
> +
> +       load_boot_idt(&boot_idt_desc);
> +}
> diff --git a/arch/x86/boot/compressed/idt_handlers_64.S b/arch/x86/boot/compressed/idt_handlers_64.S
> new file mode 100644
> index 000000000000..0b2b6cf747d2
> --- /dev/null
> +++ b/arch/x86/boot/compressed/idt_handlers_64.S
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Early IDT handler entry points
> + *
> + * Copyright (C) 2019 SUSE
> + *
> + * Author: Joerg Roedel <jroedel@suse.de>
> + */
> +
> +#include <asm/segment.h>
> +
> +.macro EXCEPTION_HANDLER name function error_code=0
> +SYM_FUNC_START(\name)
> +
> +       /* Build pt_regs */
> +       .if \error_code == 0
> +       pushq   $0
> +       .endif

cld

> +
> +       pushq   %rdi
> +       pushq   %rsi
> +       pushq   %rdx
> +       pushq   %rcx
> +       pushq   %rax
> +       pushq   %r8
> +       pushq   %r9
> +       pushq   %r10
> +       pushq   %r11
> +       pushq   %rbx
> +       pushq   %rbp
> +       pushq   %r12
> +       pushq   %r13
> +       pushq   %r14
> +       pushq   %r15
> +
> +       /* Call handler with pt_regs */
> +       movq    %rsp, %rdi
> +       call    \function
> +
> +       /* Restore regs */
> +       popq    %r15
> +       popq    %r14
> +       popq    %r13
> +       popq    %r12
> +       popq    %rbp
> +       popq    %rbx
> +       popq    %r11
> +       popq    %r10
> +       popq    %r9
> +       popq    %r8
> +       popq    %rax
> +       popq    %rcx
> +       popq    %rdx
> +       popq    %rsi
> +       popq    %rdi

if error_code?

> +
> +       /* Remove error code and return */
> +       addq    $8, %rsp
> +
> +       /*
> +        * Make sure we return to __KERNEL_CS - the CS selector on
> +        * the IRET frame might still be from an old BIOS GDT
> +        */
> +       movq    $__KERNEL_CS, 8(%rsp)
> +

If this actually happens, you have a major bug.  Please sanitize all
the segment registers after installing the GDT rather than hacking
around it here.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
