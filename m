Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D5115B9C7
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 07:51:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E689E203D9;
	Thu, 13 Feb 2020 06:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MhUm3-tMQvZJ; Thu, 13 Feb 2020 06:51:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 76B32203F4;
	Thu, 13 Feb 2020 06:51:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68981C0177;
	Thu, 13 Feb 2020 06:51:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69054C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 06:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4C0C2203D9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 06:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0RLZADvry41p
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 06:51:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by silver.osuosl.org (Postfix) with ESMTPS id 0C673203D3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 06:51:43 +0000 (UTC)
Received: from zn.tnic (p200300EC2F07F600C900F9734EF2E51F.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f07:f600:c900:f973:4ef2:e51f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C4EDE1EC0CD2;
 Thu, 13 Feb 2020 07:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1581576699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=wf2AmwI9fi4Vl0/u0IIy7+8D26tMI5ezRzlAF6DDWs8=;
 b=P65ey5vigoXjTd7ueflajmSjmkBu2Bllf6vzf1XgbPemXuoGDfOlbNXaqfPNcgyGSr2EWy
 NAYs2muwd1lcDwmLVWFQhoOPxBscCFa9RaScvP8CC7axukYg6aiImLSWDraOolnsBUbBFG
 sXhEd0CHSK5zjMfgt/gRS63dnJk8QHk=
Date: Thu, 13 Feb 2020 07:51:30 +0100
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 03/62] x86/cpufeatures: Add SEV-ES CPU feature
Message-ID: <20200213065130.GC31799@zn.tnic>
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-4-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211135256.24617-4-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
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

On Tue, Feb 11, 2020 at 02:51:57PM +0100, Joerg Roedel wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> Add CPU feature detection for Secure Encrypted Virtualization with
> Encrypted State. This feature enhances SEV by also encrypting the
> guest register state, making it in-accessible to the hypervisor.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/include/asm/cpufeatures.h | 1 +
>  arch/x86/kernel/cpu/amd.c          | 4 +++-
>  arch/x86/kernel/cpu/scattered.c    | 1 +
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index f3327cb56edf..26e4ee209f7b 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -285,6 +285,7 @@
>  #define X86_FEATURE_CQM_MBM_LOCAL	(11*32+ 3) /* LLC Local MBM monitoring */
>  #define X86_FEATURE_FENCE_SWAPGS_USER	(11*32+ 4) /* "" LFENCE in user entry SWAPGS path */
>  #define X86_FEATURE_FENCE_SWAPGS_KERNEL	(11*32+ 5) /* "" LFENCE in kernel entry SWAPGS path */
> +#define X86_FEATURE_SEV_ES		(11*32+ 6) /* AMD Secure Encrypted Virtualization - Encrypted State */

Let's put this in word 8 which is for virt flags. X86_FEATURE_SEV could
go there too but that should be a separate patch anyway, if at all.

>  /* Intel-defined CPU features, CPUID level 0x00000007:1 (EAX), word 12 */
>  #define X86_FEATURE_AVX512_BF16		(12*32+ 5) /* AVX512 BFLOAT16 instructions */
> diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
> index ac83a0fef628..aad2223862ef 100644
> --- a/arch/x86/kernel/cpu/amd.c
> +++ b/arch/x86/kernel/cpu/amd.c
> @@ -580,7 +580,7 @@ static void early_detect_mem_encrypt(struct cpuinfo_x86 *c)
>  	 *	      If BIOS has not enabled SME then don't advertise the
>  	 *	      SME feature (set in scattered.c).
>  	 *   For SEV: If BIOS has not enabled SEV then don't advertise the
> -	 *            SEV feature (set in scattered.c).
> +	 *            SEV and SEV_ES feature (set in scattered.c).
>  	 *
>  	 *   In all cases, since support for SME and SEV requires long mode,
>  	 *   don't advertise the feature under CONFIG_X86_32.
> @@ -611,6 +611,8 @@ static void early_detect_mem_encrypt(struct cpuinfo_x86 *c)
>  		setup_clear_cpu_cap(X86_FEATURE_SME);
>  clear_sev:
>  		setup_clear_cpu_cap(X86_FEATURE_SEV);
> +		setup_clear_cpu_cap(X86_FEATURE_SEV);

X86_FEATURE_SEV twice? Because once didn't stick?

:-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
