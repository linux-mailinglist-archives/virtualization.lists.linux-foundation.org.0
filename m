Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A66A2159C32
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 23:29:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 38AF887356;
	Tue, 11 Feb 2020 22:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4PCsXY9KvC04; Tue, 11 Feb 2020 22:29:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B1AD4879A3;
	Tue, 11 Feb 2020 22:29:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F4FBC07FE;
	Tue, 11 Feb 2020 22:29:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE17FC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CC69C82DC4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTFut70un2wk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:29:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BB22B823E6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:29:38 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5465121569
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581460178;
 bh=KbBBWvLVK/nodTeKKBzWdDxesPO9rH86mdssi2OYvmE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DEpqbkvuTZXMkr63GM08gp5bKr12sFU+qQi9r5Zj4HWdj7aslzu8jgZSigrAe2eQU
 RP6IiPQqnLnmgJBtQ8Sp0A5ySeD+z0EsIWHL/OXdxBcq/7M90Bi/UlGbpzm/2hPm0y
 UnqVtWL9dY39uCU4ZBjxv6N+E6hI3lWhITd4TEe8=
Received: by mail-wm1-f51.google.com with SMTP id p17so5740030wma.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:29:38 -0800 (PST)
X-Gm-Message-State: APjAAAVNA3cIqmbz/Oqr4uZFGl3lxUnI6IibRu5vcMvnJs36IYVU32Ek
 0iiYfG8M3WupRClxE8SkZfQI44hYQHHq+6NC06/wsQ==
X-Google-Smtp-Source: APXvYqxAXjknmXNrLHvDElSilQoVMSXHJMtigVdOl5IHhqhN4u1qCSPsaq5HYAeGjLH+qh9AEhijdGGotRqPNvYIFyc=
X-Received: by 2002:a05:600c:2207:: with SMTP id
 z7mr8217365wml.138.1581460176281; 
 Tue, 11 Feb 2020 14:29:36 -0800 (PST)
MIME-Version: 1.0
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-26-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-26-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 11 Feb 2020 14:29:24 -0800
X-Gmail-Original-Message-ID: <CALCETrWryvrGoPD5zOVxVs3pk+WFfb287NV46Zw7Gz7FtNAHag@mail.gmail.com>
Message-ID: <CALCETrWryvrGoPD5zOVxVs3pk+WFfb287NV46Zw7Gz7FtNAHag@mail.gmail.com>
Subject: Re: [PATCH 25/62] x86/head/64: Install boot GDT
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
> Handling exceptions during boot requires a working GDT. The kernel GDT
> is not yet ready for use, so install a temporary boot GDT.
>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/head_64.S | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
> index 4bbc770af632..5a3cde971cb7 100644
> --- a/arch/x86/kernel/head_64.S
> +++ b/arch/x86/kernel/head_64.S
> @@ -72,6 +72,20 @@ SYM_CODE_START_NOALIGN(startup_64)
>         /* Set up the stack for verify_cpu(), similar to initial_stack below */
>         leaq    (__end_init_task - SIZEOF_PTREGS)(%rip), %rsp
>
> +       /* Setup boot GDT descriptor and load boot GDT */
> +       leaq    boot_gdt(%rip), %rax
> +       movq    %rax, boot_gdt_base(%rip)
> +       lgdt    boot_gdt_descr(%rip)
> +
> +       /* GDT loaded - switch to __KERNEL_CS so IRET works reliably */
> +       pushq   $__KERNEL_CS
> +       leaq    .Lon_kernel_cs(%rip), %rax
> +       pushq   %rax
> +       lretq
> +
> +.Lon_kernel_cs:
> +       UNWIND_HINT_EMPTY

I would suggest fixing at least SS as well.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
