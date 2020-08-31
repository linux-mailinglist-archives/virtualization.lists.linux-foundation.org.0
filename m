Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 438D1257F8E
	for <lists.virtualization@lfdr.de>; Mon, 31 Aug 2020 19:25:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E99CF85F33;
	Mon, 31 Aug 2020 17:25:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9C5sMhsvJ4z; Mon, 31 Aug 2020 17:25:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 54C69848BE;
	Mon, 31 Aug 2020 17:25:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 300C7C0051;
	Mon, 31 Aug 2020 17:25:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12032C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 17:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 009C7853E3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 17:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9IuJndm6nJ7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 17:25:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6468B8507B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 17:25:24 +0000 (UTC)
Received: from zn.tnic (p200300ec2f085000329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f08:5000:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B10141EC0428;
 Mon, 31 Aug 2020 19:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1598894722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=55N3m19xFX+WeTO1FbLrZJGhHueve9LBb3xbHqo4WZc=;
 b=KKOc6D3lpnJoODJ4KbKeLr28wdnjbr7+fuvuUwJFH3E1UBaA9FaDiFbEBYxtFN6cvGCm+R
 FuSByUuFImwEoa9FnyY60HLjv3klMPCT+V7r1V+IretyrkuZfTUATjBpn2jIqUjwG4iJmH
 ebRA+zcZsrYhOplPjtq9nsOHjKNQP5k=
Date: Mon, 31 Aug 2020 19:25:19 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v6 70/76] x86/smpboot: Setup TSS for starting AP
Message-ID: <20200831172519.GL27517@zn.tnic>
References: <20200824085511.7553-1-joro@8bytes.org>
 <20200824085511.7553-71-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824085511.7553-71-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
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

On Mon, Aug 24, 2020 at 10:55:05AM +0200, Joerg Roedel wrote:
> @@ -1814,27 +1814,26 @@ static inline void ucode_cpu_init(int cpu)
>  		load_ucode_ap();
>  }
>  
> -static inline void tss_setup_ist(struct tss_struct *tss)
> +static inline void tss_setup_ist(struct tss_struct *tss,
> +				 struct cpu_entry_area *cea)
>  {
>  	/* Set up the per-CPU TSS IST stacks */
> -	tss->x86_tss.ist[IST_INDEX_DF] = __this_cpu_ist_top_va(DF);
> -	tss->x86_tss.ist[IST_INDEX_NMI] = __this_cpu_ist_top_va(NMI);
> -	tss->x86_tss.ist[IST_INDEX_DB] = __this_cpu_ist_top_va(DB);
> -	tss->x86_tss.ist[IST_INDEX_MCE] = __this_cpu_ist_top_va(MCE);
> +	tss->x86_tss.ist[IST_INDEX_DF]  = CEA_ESTACK_TOP(&cea->estacks, DF);
> +	tss->x86_tss.ist[IST_INDEX_NMI] = CEA_ESTACK_TOP(&cea->estacks, NMI);
> +	tss->x86_tss.ist[IST_INDEX_DB]  = CEA_ESTACK_TOP(&cea->estacks, DB);
> +	tss->x86_tss.ist[IST_INDEX_MCE] = CEA_ESTACK_TOP(&cea->estacks, MCE);

#ifdef CONFIG_AMD_MEM_ENCRYPT

>  	/* Only mapped when SEV-ES is active */
> -	tss->x86_tss.ist[IST_INDEX_VC] = __this_cpu_ist_top_va(VC);
> +	tss->x86_tss.ist[IST_INDEX_VC]	= CEA_ESTACK_TOP(&cea->estacks, VC);

#endif

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
