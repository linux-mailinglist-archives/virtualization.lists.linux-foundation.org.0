Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D211DA9BF
	for <lists.virtualization@lfdr.de>; Wed, 20 May 2020 07:16:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F05D385FA4;
	Wed, 20 May 2020 05:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4v5kTF-cgzfK; Wed, 20 May 2020 05:16:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D42986099;
	Wed, 20 May 2020 05:16:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3500DC0176;
	Wed, 20 May 2020 05:16:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84179C0176
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 05:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6C13F85FA4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 05:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QYGLW4ne3iOU
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 05:16:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 96E2185E06
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 05:16:43 +0000 (UTC)
IronPort-SDR: YWVvCwP2fjfJgn3sX7UZZmj3hiqLgWyeSVz46m90+LnbTPij7Cp+GMZorMm6PrI9PQ9/WQ6Yu5
 rHo2JqY5t84g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 22:16:37 -0700
IronPort-SDR: edQYPoNFAVTUiUGEt675lz/q2cfDj+zYnay8YXQ4q7zlMWS5A+zq/iR4sR2xgE4wfSA3o1J6oO
 sK7Epnexw6kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,412,1583222400"; d="scan'208";a="264557977"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.152])
 by orsmga003.jf.intel.com with ESMTP; 19 May 2020 22:16:37 -0700
Date: Tue, 19 May 2020 22:16:37 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 64/75] x86/sev-es: Cache CPUID results for improved
 performance
Message-ID: <20200520051637.GA16599@linux.intel.com>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-65-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-65-joro@8bytes.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

On Tue, Apr 28, 2020 at 05:17:14PM +0200, Joerg Roedel wrote:
> From: Mike Stunes <mstunes@vmware.com>
> 
> To avoid a future VMEXIT for a subsequent CPUID function, cache the
> results returned by CPUID into an xarray.
> 
>  [tl: coding standard changes, register zero extension]
> 
> Signed-off-by: Mike Stunes <mstunes@vmware.com>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> [ jroedel@suse.de: - Wrapped cache handling into vc_handle_cpuid_cached()
>                    - Used lower_32_bits() where applicable
> 		   - Moved cache_index out of struct es_em_ctxt ]
> Co-developed-by: Joerg Roedel <jroedel@suse.de>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---

...

> +struct sev_es_cpuid_cache_entry {
> +	unsigned long eax;
> +	unsigned long ebx;
> +	unsigned long ecx;
> +	unsigned long edx;

Why are these unsigned longs?  CPUID returns 32-bit values, this wastes 16
bytes per entry.

> +};
> +
> +static struct xarray sev_es_cpuid_cache;
> +static bool __ro_after_init sev_es_cpuid_cache_initialized;
> +
>  /* For early boot hypervisor communication in SEV-ES enabled guests */
>  static struct ghcb boot_ghcb_page __bss_decrypted __aligned(PAGE_SIZE);
>  
> @@ -463,6 +474,9 @@ void __init sev_es_init_vc_handling(void)
>  		sev_es_setup_vc_stack(cpu);
>  	}
>  
> +	xa_init_flags(&sev_es_cpuid_cache, XA_FLAGS_LOCK_IRQ);
> +	sev_es_cpuid_cache_initialized = true;
> +
>  	init_vc_stack_names();
>  }
>  
> @@ -744,6 +758,91 @@ static enum es_result vc_handle_mmio(struct ghcb *ghcb,
>  	return ret;
>  }
>  
> +static unsigned long sev_es_get_cpuid_cache_index(struct es_em_ctxt *ctxt)
> +{
> +	unsigned long hi, lo;
> +
> +	/* Don't attempt to cache until the xarray is initialized */
> +	if (!sev_es_cpuid_cache_initialized)
> +		return ULONG_MAX;
> +
> +	lo = lower_32_bits(ctxt->regs->ax);
> +
> +	/*
> +	 * CPUID 0x0000000d requires both RCX and XCR0, so it can't be
> +	 * cached.
> +	 */
> +	if (lo == 0x0000000d)
> +		return ULONG_MAX;
> +
> +	/*
> +	 * Some callers of CPUID don't always set RCX to zero for CPUID
> +	 * functions that don't require RCX, which can result in excessive
> +	 * cached values, so RCX needs to be manually zeroed for use as part
> +	 * of the cache index. Future CPUID values may need RCX, but since
> +	 * they can't be known, they must not be cached.
> +	 */
> +	if (lo > 0x80000020)
> +		return ULONG_MAX;
> +
> +	switch (lo) {
> +	case 0x00000007:

OSPKE may or may not be cached correctly depending on when
sev_es_cpuid_cache_initialized is set.

> +	case 0x0000000b:
> +	case 0x0000000f:
> +	case 0x00000010:
> +	case 0x8000001d:
> +	case 0x80000020:
> +		hi = ctxt->regs->cx << 32;
> +		break;
> +	default:
> +		hi = 0;
> +	}
> +
> +	return hi | lo;

This needs to be way more restrictive on what is cached.  Unless I've
overlooked something, this lets userspace trigger arbitrary, unaccounted
kernel memory allocations.  E.g.

	for (i = 0; i <= 0x80000020; i++) {
		for (j = 0; j <= 0xffffffff; j++) {
			cpuid(i, j);
			if (i != 7 || i != 0xb || i != 0xf || i != 0x10 ||
			    i != 0x8000001d || i != 0x80000020)
				break;
		}
	}

The whole cache on-demand approach seems like overkill.  The number of CPUID
leaves that are invoked after boot with any regularity can probably be counted
on one hand.   IIRC glibc invokes CPUID to gather TLB/cache info, XCR0-based
features, and one or two other leafs.  A statically sized global array that's
arbitrarily index a la x86_capability would be just as simple and more
performant.  It would also allow fancier things like emulating CPUID 0xD in
the guest if you want to go down that road.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
