Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFD31D72E1
	for <lists.virtualization@lfdr.de>; Mon, 18 May 2020 10:23:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BB3EE8815C;
	Mon, 18 May 2020 08:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IheM9QlrAS41; Mon, 18 May 2020 08:23:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 114E7880E0;
	Mon, 18 May 2020 08:23:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3749C07FF;
	Mon, 18 May 2020 08:23:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EEBCCC07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 May 2020 08:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DD67987943
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 May 2020 08:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6upXnLygjg5c
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 May 2020 08:23:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4C7D2878BD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 May 2020 08:23:23 +0000 (UTC)
Received: from zn.tnic (p200300EC2F06E800ECDCE19D4A51D977.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f06:e800:ecdc:e19d:4a51:d977])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0AB141EC0295;
 Mon, 18 May 2020 10:23:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1589790200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=NRH8oUNhkxpcUz5rd9LcRTM109aECD+/gUl0zIMTl5w=;
 b=EmRutMjnTt3s/OCgVTsnLs5lE1J795LjE9ueGF2jckGBoi40V3GjCQ465iK19AYHmDM2Ns
 WS9YUgSW70oUTt9Jx7wyuf4vUyYmw5ddYxHDzc4pdOHplM0R13+b4syehDAXt8GPNlMRLR
 nqaFEm49nhK7F0ahvS00kE5h7VwuMV4=
Date: Mon, 18 May 2020 10:23:13 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 31/75] x86/head/64: Install boot GDT
Message-ID: <20200518082313.GA25034@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-32-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-32-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
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

On Tue, Apr 28, 2020 at 05:16:41PM +0200, Joerg Roedel wrote:
> @@ -480,6 +500,22 @@ SYM_DATA_LOCAL(early_gdt_descr_base,	.quad INIT_PER_CPU_VAR(gdt_page))
>  SYM_DATA(phys_base, .quad 0x0)
>  EXPORT_SYMBOL(phys_base)
>
> +/* Boot GDT used when kernel addresses are not mapped yet */
> +SYM_DATA_LOCAL(boot_gdt_descr,		.word boot_gdt_end - boot_gdt)
> +SYM_DATA_LOCAL(boot_gdt_base,		.quad 0)
> +SYM_DATA_START(boot_gdt)
> +	.quad	0
> +	.quad   0x00cf9a000000ffff	/* __KERNEL32_CS */
> +	.quad   0x00af9a000000ffff	/* __KERNEL_CS */
> +	.quad   0x00cf92000000ffff	/* __KERNEL_DS */
> +	.quad	0			/* __USER32_CS - unused */
> +	.quad	0			/* __USER_DS   - unused */
> +	.quad	0			/* __USER_CS   - unused */
> +	.quad	0			/* unused */
> +	.quad   0x0080890000000000	/* TSS descriptor */
> +	.quad   0x0000000000000000	/* TSS continued */

Any chance you could use macros ala GDT_ENTRY_INIT() for those instead
of the naked values?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
