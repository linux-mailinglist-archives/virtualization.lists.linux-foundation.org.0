Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 18042159C23
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 23:26:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 67F8B86BE0;
	Tue, 11 Feb 2020 22:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ucbe7QuwoTYY; Tue, 11 Feb 2020 22:26:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A72D886A3C;
	Tue, 11 Feb 2020 22:26:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 990D2C07FE;
	Tue, 11 Feb 2020 22:26:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 001D3C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E27CD85533
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tr0U223h06yi
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:26:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7D85F84D11
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:26:03 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12ED821569
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581459963;
 bh=jwOvEweDP3a6frfUBwUsTRLm3KUOaJHDLObO3bfMngQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zZYakXND4nSyArsUYniGdrmaKSyq1gknzDCuf0po+GIXwSJFpic9i7FaMFT5+FR+2
 OgpeNiEc6wN+3KbrRoQWDiWm0QjF4KCTdbL02gOc9XOuU4E8hi2JKG7ZHCh98mPmnM
 bw7k9TPplzbMJREMCV+2FkmwzoEhDOOarizM7dEo=
Received: by mail-wr1-f43.google.com with SMTP id c9so14575731wrw.8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:26:03 -0800 (PST)
X-Gm-Message-State: APjAAAVjopAMs+y6H2y/1j9Lp9D5mvTJbtZFQ0twI1sVAaIMTRyQ+YCk
 GyrWVVQT8KMm7j+1vmdfKGFpv0TlU1OzBflgoVXmHg==
X-Google-Smtp-Source: APXvYqzhlwE9e/rHSQa1i4zUzoVmEyewXxrV5b2agTpUtz0bDQeneWSxaZrnHZkjhP0nWHhNPn8gEdVFwZOXFNRhQHY=
X-Received: by 2002:a5d:494b:: with SMTP id r11mr10831273wrs.184.1581459961446; 
 Tue, 11 Feb 2020 14:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-19-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-19-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 11 Feb 2020 14:25:49 -0800
X-Gmail-Original-Message-ID: <CALCETrVWoG7ugfE_FJgNKyyWYCmZh1162kfceJ2bs+O7Qyf-8A@mail.gmail.com>
Message-ID: <CALCETrVWoG7ugfE_FJgNKyyWYCmZh1162kfceJ2bs+O7Qyf-8A@mail.gmail.com>
Subject: Re: [PATCH 18/62] x86/boot/compressed/64: Setup GHCB Based VC
 Exception handler
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
> Install an exception handler for #VC exception that uses a GHCB. Also
> add the infrastructure for handling different exit-codes by decoding
> the instruction that caused the exception and error handling.
>

> diff --git a/arch/x86/boot/compressed/sev-es.c b/arch/x86/boot/compressed/sev-es.c
> index 8d13121a8cf2..02fb6f57128b 100644
> --- a/arch/x86/boot/compressed/sev-es.c
> +++ b/arch/x86/boot/compressed/sev-es.c
> @@ -8,12 +8,16 @@
>  #include <linux/kernel.h>
>
>  #include <asm/sev-es.h>
> +#include <asm/trap_defs.h>
>  #include <asm/msr-index.h>
>  #include <asm/ptrace.h>
>  #include <asm/svm.h>
>
>  #include "misc.h"
>
> +struct ghcb boot_ghcb_page __aligned(PAGE_SIZE);
> +struct ghcb *boot_ghcb;
> +
>  static inline u64 read_ghcb_msr(void)
>  {
>         unsigned long low, high;
> @@ -35,8 +39,95 @@ static inline void write_ghcb_msr(u64 val)
>                         "a"(low), "d" (high) : "memory");
>  }
>
> +static enum es_result es_fetch_insn_byte(struct es_em_ctxt *ctxt,
> +                                        unsigned int offset,
> +                                        char *buffer)
> +{
> +       char *rip = (char *)ctxt->regs->ip;
> +
> +       buffer[offset] = rip[offset];
> +
> +       return ES_OK;
> +}
> +
> +static enum es_result es_write_mem(struct es_em_ctxt *ctxt,
> +                                  void *dst, char *buf, size_t size)
> +{
> +       memcpy(dst, buf, size);
> +
> +       return ES_OK;
> +}
> +
> +static enum es_result es_read_mem(struct es_em_ctxt *ctxt,
> +                                 void *src, char *buf, size_t size)
> +{
> +       memcpy(buf, src, size);
> +
> +       return ES_OK;
> +}


What are all these abstractions for?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
