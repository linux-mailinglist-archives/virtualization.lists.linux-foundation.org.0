Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC03260114
	for <lists.virtualization@lfdr.de>; Mon,  7 Sep 2020 18:59:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5E2EF857A3;
	Mon,  7 Sep 2020 16:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yJMpdweRzhYs; Mon,  7 Sep 2020 16:59:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0EFA68578B;
	Mon,  7 Sep 2020 16:59:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E06F4C088B;
	Mon,  7 Sep 2020 16:59:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6898FC0051
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 16:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 64F128676A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 16:59:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjgNXS4bynBj
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 16:59:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C3A9E86788
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 16:59:00 +0000 (UTC)
Received: from zn.tnic (p200300ec2f090900c4f00348aacf37a5.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f09:900:c4f0:348:aacf:37a5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EA64B1EC00F4;
 Mon,  7 Sep 2020 18:58:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1599497938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=f8SfAAyXeqxq2AQb205NNpHyD9AfmQyyAEljoRCFv6k=;
 b=KXJWYBon+qIU3Dc1jqyEl0uksmyVwjboVTQXyWOm6FdZvFVbSLGKec6ejmWNdxVLAbIvwp
 WFdL1LkX10BO5BGgpGw/Ma5JeXuDn2PCoEpdZMW/06MnMg6plGn/rQ/eG7Ad1IIX/E/Ndk
 LYheDfFOoz3D0esSwEqyajhwcrvprWo=
Date: Mon, 7 Sep 2020 18:58:51 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v7 19/72] x86/boot/compressed/64: Add stage1 #VC handler
Message-ID: <20200907165851.GE16029@zn.tnic>
References: <20200907131613.12703-1-joro@8bytes.org>
 <20200907131613.12703-20-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907131613.12703-20-joro@8bytes.org>
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

On Mon, Sep 07, 2020 at 03:15:20PM +0200, Joerg Roedel wrote:
> +static inline u64 sev_es_rd_ghcb_msr(void)
> +{
> +	unsigned long low, high;
> +
> +	asm volatile("rdmsr\n" : "=a" (low), "=d" (high) :
> +			"c" (MSR_AMD64_SEV_ES_GHCB));
> +
> +	return ((high << 32) | low);
> +}
> +
> +static inline void sev_es_wr_ghcb_msr(u64 val)
> +{
> +	u32 low, high;
> +
> +	low  = val & 0xffffffffUL;
> +	high = val >> 32;
> +
> +	asm volatile("wrmsr\n" : : "c" (MSR_AMD64_SEV_ES_GHCB),
			   ^^

No need for that newline and the one above. I've zapped it while applying.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
