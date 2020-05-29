Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 589411E78F2
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 11:02:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F26FA8839A;
	Fri, 29 May 2020 09:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EmxzP4fQ83Uc; Fri, 29 May 2020 09:02:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 76C708838C;
	Fri, 29 May 2020 09:02:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47F31C016F;
	Fri, 29 May 2020 09:02:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A06AC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 09:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7D58686DCA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 09:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B40xjKkmrWLi
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 09:02:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 274E186DA3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 09:02:31 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0f5e00e15a1b2e1d2ace20.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:5e00:e15a:1b2e:1d2a:ce20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 35F751EC03D2;
 Fri, 29 May 2020 11:02:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1590742948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=YgI+deux/7QqPwTMEpnAWUAEJvChvf4UJKUuseczbb4=;
 b=PvGwZ3rYkyScKSVfHSnOMSijlVOIzSrLpHiSrsUElDG4vAzwAYEsx6De23tXnYVphT6ZgT
 Dr4h4i5vlcTx2lq79mmX7QhWu+2bY+eytnB7asc3JQXZjR8YwcsapWBxZvRxBUX7Wwrh7X
 U2INYoyOAHuXtTHPwVuZtStgsNeMBEs=
Date: Fri, 29 May 2020 11:02:22 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 69/75] x86/realmode: Setup AP jump table
Message-ID: <20200529090222.GA9011@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-70-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-70-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
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

On Tue, Apr 28, 2020 at 05:17:19PM +0200, Joerg Roedel wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> Setup the AP jump table to point to the SEV-ES trampoline code so that
> the APs can boot.

Tom, in his laconic way, doesn't want to explain to us why is this even
needed...

:)

/me reads the code

/me reads the GHCB spec

aha, it gets it from the HV. And it can be set by the guest too...

So how about expanding that commit message as to why this is done, why
needed, etc?

Thx.

> diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
> index 262f83cad355..1c5cbfd102d5 100644
> --- a/arch/x86/realmode/init.c
> +++ b/arch/x86/realmode/init.c
> @@ -9,6 +9,7 @@
>  #include <asm/realmode.h>
>  #include <asm/tlbflush.h>
>  #include <asm/crash.h>
> +#include <asm/sev-es.h>
>  
>  struct real_mode_header *real_mode_header;
>  u32 *trampoline_cr4_features;
> @@ -107,6 +108,11 @@ static void __init setup_real_mode(void)
>  	if (sme_active())
>  		trampoline_header->flags |= TH_FLAGS_SME_ACTIVE;
>  
> +	if (sev_es_active()) {
> +		if (sev_es_setup_ap_jump_table(real_mode_header))
> +			panic("Failed to update SEV-ES AP Jump Table");
> +	}
> +

So this function gets slowly sprinkled with

	if (sev-something)
		bla

Please wrap at least those last two into a

	sev_setup_real_mode()

or so.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
