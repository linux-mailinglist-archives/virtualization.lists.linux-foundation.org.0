Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9222F1ECD01
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 11:54:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 44FFD8852A;
	Wed,  3 Jun 2020 09:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wvoh7crwLQIr; Wed,  3 Jun 2020 09:54:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 635638852E;
	Wed,  3 Jun 2020 09:54:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 423F4C016E;
	Wed,  3 Jun 2020 09:54:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D411C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 09:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0CAA286B00
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 09:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_Mo84M2vp2f
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 09:54:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 36EA786A99
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 09:54:34 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0b2300d541c55e36baf562.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:2300:d541:c55e:36ba:f562])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 66CAB1EC02CF;
 Wed,  3 Jun 2020 11:54:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1591178071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=bSC5v9pq6HGi+3XtTAaeKewohWX8QeHbDID0hOwG0pY=;
 b=pUCWTJtRDBixL1/rL2J71p2JHm64P1CBHO/NNH00XF5+OWmSZlJj9GLIdiFdwhbHnX2pZo
 bXBLABD3QW9lvT9++tK9YYmUj+a23sMwG/rk+KEtxVIZE6lh+Eg+hw94jVOfh1CpdIWyzO
 9QBaI53KU5J74sP9JTJoBhekViVGObE=
Date: Wed, 3 Jun 2020 11:54:26 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 73/75] x86/sev-es: Support CPU offline/online
Message-ID: <20200603095426.GA19711@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-74-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-74-joro@8bytes.org>
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

On Tue, Apr 28, 2020 at 05:17:23PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Add a play_dead handler when running under SEV-ES. This is needed
> because the hypervisor can't deliver an SIPI request to restart the AP.
> Instead the kernel has to issue a VMGEXIT to halt the VCPU. When the
> hypervisor would deliver and SIPI is wakes up the VCPU instead.

That last sentence needs fixing.

Also, that explanation belongs as comment over sev_es_ap_hlt_loop()
because commit messages are not that easy to find.

> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/include/uapi/asm/svm.h |  1 +
>  arch/x86/kernel/sev-es.c        | 58 +++++++++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/arch/x86/include/uapi/asm/svm.h b/arch/x86/include/uapi/asm/svm.h
> index a19ce9681ec2..20a05839dd9a 100644
> --- a/arch/x86/include/uapi/asm/svm.h
> +++ b/arch/x86/include/uapi/asm/svm.h
> @@ -84,6 +84,7 @@
>  /* SEV-ES software-defined VMGEXIT events */
>  #define SVM_VMGEXIT_MMIO_READ			0x80000001
>  #define SVM_VMGEXIT_MMIO_WRITE			0x80000002
> +#define SVM_VMGEXIT_AP_HLT_LOOP			0x80000004
>  #define SVM_VMGEXIT_AP_JUMP_TABLE		0x80000005
>  #define		SVM_VMGEXIT_SET_AP_JUMP_TABLE			0
>  #define		SVM_VMGEXIT_GET_AP_JUMP_TABLE			1
> diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
> index 28725c38e6fb..00a5d0483730 100644
> --- a/arch/x86/kernel/sev-es.c
> +++ b/arch/x86/kernel/sev-es.c
> @@ -32,6 +32,8 @@
>  #include <asm/processor.h>
>  #include <asm/traps.h>
>  #include <asm/svm.h>
> +#include <asm/smp.h>
> +#include <asm/cpu.h>
>  
>  #define DR7_RESET_VALUE        0x400
>  
> @@ -448,6 +450,60 @@ static bool __init sev_es_setup_ghcb(void)
>  	return true;
>  }
>  
> +#ifdef CONFIG_HOTPLUG_CPU
> +static void sev_es_ap_hlt_loop(void)
> +{
> +	struct ghcb_state state;
> +	struct ghcb *ghcb;
> +
> +	ghcb = sev_es_get_ghcb(&state);
> +
> +	while (true) {
> +		vc_ghcb_invalidate(ghcb);
> +		ghcb_set_sw_exit_code(ghcb, SVM_VMGEXIT_AP_HLT_LOOP);
> +		ghcb_set_sw_exit_info_1(ghcb, 0);
> +		ghcb_set_sw_exit_info_2(ghcb, 0);
> +
> +		sev_es_wr_ghcb_msr(__pa(ghcb));
> +		VMGEXIT();
> +
> +		/* Wakup Signal? */

		  "Wakeup"

> +		if (ghcb_is_valid_sw_exit_info_2(ghcb) &&
> +		    ghcb->save.sw_exit_info_2 != 0)

No need for the "!= 0".

> +			break;
> +	}
> +
> +	sev_es_put_ghcb(&state);
> +}

...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
