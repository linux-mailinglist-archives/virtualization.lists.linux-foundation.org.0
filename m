Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACBF18BB77
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 16:46:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2DE6186CA6;
	Thu, 19 Mar 2020 15:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kD-o8VaI5a8E; Thu, 19 Mar 2020 15:46:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 57C0486C8C;
	Thu, 19 Mar 2020 15:46:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CD25C07FF;
	Thu, 19 Mar 2020 15:46:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82134C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 795E486C8C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J4CQ7DFMLEOr
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:46:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0C50086C76
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:46:50 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B45A208C3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584632809;
 bh=Cn1m0nZsjDiV+FYhoJLlELXGkyDw2CZ03wWFmubUPo8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XngItLjx0RxK+PimP3jEzaqooTBTwBy4kih8MW6Imxm+fj223z/qpfIE2BKk4Fzdd
 RiQqOnv5aQwLbox4Z/d8xAdb9GpLC9QnI7Ux5YIJViMyGg+L/UawGnm256GEoDCKRq
 ZtMTYkqWdljH2vRVcgKhtW3oQUDlWRYQ14szfV74=
Received: by mail-wr1-f44.google.com with SMTP id j17so226304wru.13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 08:46:49 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3BKSnxhH0CV2Xd8TVhtpVIR/qLlcnbiN41qwFIsvNkmCsjF+ff
 JMfCPldpCeVs6SZ5SE1SB2N5KH23jcUFh6rPGMOjHg==
X-Google-Smtp-Source: ADFU+vtRWY7b1vbCxAUKKJKmAYVxdIrYpSMuMiWvH4H8RWo6SRJpLSPLzDmmHbdXmaoFC1CnppEqPqcDFxLdoNnM7Rk=
X-Received: by 2002:adf:e883:: with SMTP id d3mr4992846wrm.75.1584632808043;
 Thu, 19 Mar 2020 08:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-43-joro@8bytes.org>
In-Reply-To: <20200319091407.1481-43-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 19 Mar 2020 08:46:36 -0700
X-Gmail-Original-Message-ID: <CALCETrXiWjALMTcG=92DmMn_H=yR88e0-3cj8CjTAjtjTvBR8w@mail.gmail.com>
Message-ID: <CALCETrXiWjALMTcG=92DmMn_H=yR88e0-3cj8CjTAjtjTvBR8w@mail.gmail.com>
Subject: Re: [PATCH 42/70] x86/sev-es: Support nested #VC exceptions
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

On Thu, Mar 19, 2020 at 2:14 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> From: Joerg Roedel <jroedel@suse.de>
>
> Handle #VC exceptions that happen while the GHCB is in use. This can
> happen when an NMI happens in the #VC exception handler and the NMI
> handler causes a #VC exception itself. Save the contents of the GHCB
> when nesting is detected and restore it when the GHCB is no longer
> used.
>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/sev-es.c | 63 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 59 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
> index 97241d2f0f70..3b7bbc8d841e 100644
> --- a/arch/x86/kernel/sev-es.c
> +++ b/arch/x86/kernel/sev-es.c
> @@ -32,9 +32,57 @@ struct ghcb boot_ghcb_page __bss_decrypted __aligned(PAGE_SIZE);
>   */
>  struct ghcb __initdata *boot_ghcb;
>
> +struct ghcb_state {
> +       struct ghcb *ghcb;
> +};
> +
>  /* Runtime GHCB pointers */
>  static struct ghcb __percpu *ghcb_page;
>
> +/*
> + * Mark the per-cpu GHCB as in-use to detect nested #VC exceptions.
> + * There is no need for it to be atomic, because nothing is written to the GHCB
> + * between the read and the write of ghcb_active. So it is safe to use it when a
> + * nested #VC exception happens before the write.
> + */
> +static DEFINE_PER_CPU(bool, ghcb_active);
> +
> +static struct ghcb *sev_es_get_ghcb(struct ghcb_state *state)
> +{
> +       struct ghcb *ghcb = (struct ghcb *)this_cpu_ptr(ghcb_page);
> +       bool *active = this_cpu_ptr(&ghcb_active);
> +
> +       if (unlikely(*active)) {
> +               /* GHCB is already in use - save its contents */
> +
> +               state->ghcb = kzalloc(sizeof(struct ghcb), GFP_ATOMIC);
> +               if (!state->ghcb)
> +                       return NULL;

This can't possibly end well.  Maybe have a little percpu list of
GHCBs and make sure there are enough for any possible nesting?

Also, I admit confusion.  Isn't the GHCB required to be unencrypted?
How does that work with kzalloc()?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
