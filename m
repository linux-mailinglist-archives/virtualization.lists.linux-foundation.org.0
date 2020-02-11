Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 13018159C75
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 23:46:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B334F84647;
	Tue, 11 Feb 2020 22:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esPUQmyCQd6E; Tue, 11 Feb 2020 22:46:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2DC2E8455D;
	Tue, 11 Feb 2020 22:46:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12754C07FE;
	Tue, 11 Feb 2020 22:46:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D785CC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C0C4187ADF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7QqNr3pNxUwi
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:46:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9691987A60
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:46:24 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C15E2465D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581461184;
 bh=9zLCa0HTXZYtXrs14B/zXbcAM+4CsAnHeAwUWEaDQbU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tEpjSeql3DYLAsrYSUbprtMEMw4C1h4U9B78zjw3Qwnq3PhruIVJrZW8I5dlgSnI6
 RCIp+Vz9WgnqGblWwxpp3lhHSfdMKx+4t6P4j+em9epOg+/6e+14nf9fPQcXYTnq6P
 +BDN9l79+1oay7W+lPw8cHQ29YuY1J1E6/p9/UXQ=
Received: by mail-wr1-f48.google.com with SMTP id c9so14624526wrw.8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:46:24 -0800 (PST)
X-Gm-Message-State: APjAAAURK7pzCLX4mwn+jgay1hrWC/LRpFMVg/pKevmryROWdmyXSHHo
 9OXF8vz+vx9tfftnt99q2qzO0lmusecxub6deB4GFQ==
X-Google-Smtp-Source: APXvYqzDG+yy1Y1bMAL59wrUEfua8nCDrkCgCp14PmWU1Fe0rMfRwXKkAP8PvX1rVCDgCCV2/NPugHE40sdjEg/9qFs=
X-Received: by 2002:adf:a354:: with SMTP id d20mr10846226wrb.257.1581461182628; 
 Tue, 11 Feb 2020 14:46:22 -0800 (PST)
MIME-Version: 1.0
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-36-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-36-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 11 Feb 2020 14:46:11 -0800
X-Gmail-Original-Message-ID: <CALCETrWVYM_EQJYznNzPT0q2yYjUojCHYpHmdYoSCdqApitTrA@mail.gmail.com>
Message-ID: <CALCETrWVYM_EQJYznNzPT0q2yYjUojCHYpHmdYoSCdqApitTrA@mail.gmail.com>
Subject: Re: [PATCH 35/62] x86/sev-es: Setup per-cpu GHCBs for the runtime
 handler
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
> From: Tom Lendacky <thomas.lendacky@amd.com>
>
> The runtime handler needs a GHCB per CPU. Set them up and map them
> unencrypted.
>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/include/asm/mem_encrypt.h |  2 ++
>  arch/x86/kernel/sev-es.c           | 25 ++++++++++++++++++++++++-
>  arch/x86/kernel/traps.c            |  3 +++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/include/asm/mem_encrypt.h b/arch/x86/include/asm/mem_encrypt.h
> index 6f61bb93366a..d48e7be9bb49 100644
> --- a/arch/x86/include/asm/mem_encrypt.h
> +++ b/arch/x86/include/asm/mem_encrypt.h
> @@ -48,6 +48,7 @@ int __init early_set_memory_encrypted(unsigned long vaddr, unsigned long size);
>  void __init mem_encrypt_init(void);
>  void __init mem_encrypt_free_decrypted_mem(void);
>
> +void __init encrypted_state_init_ghcbs(void);
>  bool sme_active(void);
>  bool sev_active(void);
>  bool sev_es_active(void);
> @@ -71,6 +72,7 @@ static inline void __init sme_early_init(void) { }
>  static inline void __init sme_encrypt_kernel(struct boot_params *bp) { }
>  static inline void __init sme_enable(struct boot_params *bp) { }
>
> +static inline void encrypted_state_init_ghcbs(void) { }
>  static inline bool sme_active(void) { return false; }
>  static inline bool sev_active(void) { return false; }
>  static inline bool sev_es_active(void) { return false; }
> diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
> index 0e0b28477627..9a5530857db7 100644
> --- a/arch/x86/kernel/sev-es.c
> +++ b/arch/x86/kernel/sev-es.c
> @@ -8,8 +8,11 @@
>   */
>
>  #include <linux/sched/debug.h> /* For show_regs() */
> -#include <linux/kernel.h>
> +#include <linux/percpu-defs.h>
> +#include <linux/mem_encrypt.h>
>  #include <linux/printk.h>
> +#include <linux/set_memory.h>
> +#include <linux/kernel.h>
>  #include <linux/mm.h>
>
>  #include <asm/trap_defs.h>
> @@ -28,6 +31,9 @@ struct ghcb boot_ghcb_page __bss_decrypted __aligned(PAGE_SIZE);
>   */
>  struct ghcb __initdata *boot_ghcb;
>
> +/* Runtime GHCBs */
> +static DEFINE_PER_CPU_DECRYPTED(struct ghcb, ghcb_page) __aligned(PAGE_SIZE);

Hmm.  This is a largeish amount of memory on large non-SEV-ES systems.
Maybe store a pointer instead?  It would be even better if it could be
DEFINE_PER_CPU like this but be discarded if we don't need it, but I
don't think we have the infrastructure for that.

--Andy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
