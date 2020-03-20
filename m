Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0D818D9BD
	for <lists.virtualization@lfdr.de>; Fri, 20 Mar 2020 21:53:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 87391873E4;
	Fri, 20 Mar 2020 20:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N1rnQ5KHUubL; Fri, 20 Mar 2020 20:53:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C672E8721A;
	Fri, 20 Mar 2020 20:53:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A65D9C07FF;
	Fri, 20 Mar 2020 20:53:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A4DEC07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 20:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E7EA48765A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 20:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mXrk1dCy3Bn
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 20:53:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D57F987653
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 20:53:10 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id np9so3023687pjb.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 13:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=J/8p3UslkfxkazuuIhw9AGyhLcWU24JMkJmDvprnAhY=;
 b=nOwZCr2ivALZt1aDv9YFo6F4kwz4JRZolQqjxNvEdRHdm8SyYBRHW2HIIp6WKHnO02
 V1Y9ERrmONv+hlcSM+SoFxnCtjFOffoFK88FB5ActwZ7Ly1gS6nkKs85c2DZcXEf7Sji
 ohs+9aoo5+rurAFbIdYMY74Mb3i+hj2DcEq0Pf1YemnM98/uyDAnZUsYfzG8X1IhIXrq
 C1bUti2JiW0WDPgSlWk1p/Cp9MDjnyfPD+/jc0zUymBi8yQNYSBn68WSCtHz6Fdy36TU
 HfR71t5JNxGtAdGySpJw8rKPjkwFBKyb3pBQ5IutgR5ECR6FWy+QmVxhgzJevlb5FiDh
 oVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=J/8p3UslkfxkazuuIhw9AGyhLcWU24JMkJmDvprnAhY=;
 b=mcFUR0kdhlIfdNPQfqlmL9To3tqJPEjZyIIX+GsItnz0G10n/qziVdxdV4PP0yFAOH
 +pMI95ufqjvOFNs/gNdB7wa3d1mtKvD9ZrcESIacCl9Qy9vsUZT3YEtw2MsdyYnPFV98
 LUxvTCCehOpi0GDdb13pAS11ZcKjFYkudNcn1cit/zgOcGxQRSxZPg2xcArYA5m3V3N4
 4wXPbQukKDFH0vQECvTivy30OLG09TsY7Vf2pL11S6R5l+BYBzS5P5pwVVmQm4ObUh4r
 rrRsQHlP+CbZMVqEM74aGDoP3N2iBcfztFJlJNiDeOLogjSisw3JpQoel189JOTQRmVr
 S2RQ==
X-Gm-Message-State: ANhLgQ163Zix9+WvQDlJ6V5AmMkP4GZ1FCVtSqbGJIGRkztQ8H2/5pHn
 8djqhaJUaedK3eS7bRks5ykQDw==
X-Google-Smtp-Source: ADFU+vubVfAdTukwmO0ljrIThZF6+MhebcGkYcCypvlm4XwSD9cP0lf8G4PA9GO3s3pCxaj3g3nDwg==
X-Received: by 2002:a17:90b:3613:: with SMTP id
 ml19mr11555148pjb.71.1584737590060; 
 Fri, 20 Mar 2020 13:53:10 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id u18sm6538998pfl.40.2020.03.20.13.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 13:53:09 -0700 (PDT)
Date: Fri, 20 Mar 2020 13:53:08 -0700 (PDT)
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 21/70] x86/boot/compressed/64: Add function to map a page
 unencrypted
In-Reply-To: <20200319091407.1481-22-joro@8bytes.org>
Message-ID: <alpine.DEB.2.21.2003201350300.205664@chino.kir.corp.google.com>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-22-joro@8bytes.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
From: David Rientjes via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, 19 Mar 2020, Joerg Roedel wrote:

> From: Joerg Roedel <jroedel@suse.de>
> 
> This function is needed to map the GHCB for SEV-ES guests. The GHCB is
> used for communication with the hypervisor, so its content must not be
> encrypted.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/boot/compressed/ident_map_64.c | 125 ++++++++++++++++++++++++
>  arch/x86/boot/compressed/misc.h         |   1 +
>  2 files changed, 126 insertions(+)
> 
> diff --git a/arch/x86/boot/compressed/ident_map_64.c b/arch/x86/boot/compressed/ident_map_64.c
> index feb180cced28..04a5ff4bda66 100644
> --- a/arch/x86/boot/compressed/ident_map_64.c
> +++ b/arch/x86/boot/compressed/ident_map_64.c
> @@ -26,6 +26,7 @@
>  #include <asm/init.h>
>  #include <asm/pgtable.h>
>  #include <asm/trap_defs.h>
> +#include <asm/cmpxchg.h>
>  /* Use the static base for this part of the boot process */
>  #undef __PAGE_OFFSET
>  #define __PAGE_OFFSET __PAGE_OFFSET_BASE
> @@ -157,6 +158,130 @@ void initialize_identity_maps(void)
>  	write_cr3(top_level_pgt);
>  }
>  
> +static pte_t *split_large_pmd(struct x86_mapping_info *info,
> +			      pmd_t *pmdp, unsigned long __address)
> +{
> +	unsigned long page_flags;
> +	unsigned long address;
> +	pte_t *pte;
> +	pmd_t pmd;
> +	int i;
> +
> +	pte = (pte_t *)info->alloc_pgt_page(info->context);
> +	if (!pte)
> +		return NULL;
> +
> +	address     = __address & PMD_MASK;
> +	/* No large page - clear PSE flag */
> +	page_flags  = info->page_flag & ~_PAGE_PSE;
> +
> +	/* Populate the PTEs */
> +	for (i = 0; i < PTRS_PER_PMD; i++) {
> +		set_pte(&pte[i], __pte(address | page_flags));
> +		address += PAGE_SIZE;
> +	}
> +
> +	/*
> +	 * Ideally we need to clear the large PMD first and do a TLB
> +	 * flush before we write the new PMD. But the 2M range of the
> +	 * PMD might contain the code we execute and/or the stack
> +	 * we are on, so we can't do that. But that should be safe here
> +	 * because we are going from large to small mappings and we are
> +	 * also the only user of the page-table, so there is no chance
> +	 * of a TLB multihit.
> +	 */
> +	pmd = __pmd((unsigned long)pte | info->kernpg_flag);
> +	set_pmd(pmdp, pmd);
> +	/* Flush TLB to establish the new PMD */
> +	write_cr3(top_level_pgt);
> +
> +	return pte + pte_index(__address);
> +}
> +
> +static void clflush_page(unsigned long address)
> +{
> +	unsigned int flush_size;
> +	char *cl, *start, *end;
> +
> +	/*
> +	 * Hardcode cl-size to 64 - CPUID can't be used here because that might
> +	 * cause another #VC exception and the GHCB is not ready to use yet.
> +	 */
> +	flush_size = 64;
> +	start      = (char *)(address & PAGE_MASK);
> +	end        = start + PAGE_SIZE;
> +
> +	/*
> +	 * First make sure there are no pending writes on the cache-lines to
> +	 * flush.
> +	 */
> +	asm volatile("mfence" : : : "memory");
> +
> +	for (cl = start; cl != end; cl += flush_size)
> +		clflush(cl);
> +}
> +
> +static int __set_page_decrypted(struct x86_mapping_info *info,
> +				unsigned long address)
> +{
> +	unsigned long scratch, *target;
> +	pgd_t *pgdp = (pgd_t *)top_level_pgt;
> +	p4d_t *p4dp;
> +	pud_t *pudp;
> +	pmd_t *pmdp;
> +	pte_t *ptep, pte;
> +
> +	/*
> +	 * First make sure there is a PMD mapping for 'address'.
> +	 * It should already exist, but keep things generic.
> +	 *
> +	 * To map the page just read from it and fault it in if there is no
> +	 * mapping yet. add_identity_map() can't be called here because that
> +	 * would unconditionally map the address on PMD level, destroying any
> +	 * PTE-level mappings that might already exist.  Also do something
> +	 * useless with 'scratch' so the access won't be optimized away.
> +	 */
> +	target = (unsigned long *)address;
> +	scratch = *target;
> +	arch_cmpxchg(target, scratch, scratch);
> +
> +	/*
> +	 * The page is mapped at least with PMD size - so skip checks and walk
> +	 * directly to the PMD.
> +	 */
> +	p4dp = p4d_offset(pgdp, address);
> +	pudp = pud_offset(p4dp, address);
> +	pmdp = pmd_offset(pudp, address);
> +
> +	if (pmd_large(*pmdp))
> +		ptep = split_large_pmd(info, pmdp, address);
> +	else
> +		ptep = pte_offset_kernel(pmdp, address);
> +
> +	if (!ptep)
> +		return -ENOMEM;
> +
> +	/* Clear encryption flag and write new pte */
> +	pte = pte_clear_flags(*ptep, _PAGE_ENC);
> +	set_pte(ptep, pte);
> +
> +	/* Flush TLB to map the page unencrypted */
> +	write_cr3(top_level_pgt);
> +

Is there a guarantee that this flushes the tlb if cr3 == top_level_pgt 
alrady without an invlpg?

> +	/*
> +	 * Changing encryption attributes of a page requires to flush it from
> +	 * the caches.
> +	 */
> +	clflush_page(address);
> +
> +	return 0;
> +}
> +
> +int set_page_decrypted(unsigned long address)
> +{
> +	return __set_page_decrypted(&mapping_info, address);
> +}
> +
>  static void pf_error(unsigned long error_code, unsigned long address,
>  		     struct pt_regs *regs)
>  {
> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
> index 0e3508c5c15c..42f68a858a35 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -98,6 +98,7 @@ static inline void choose_random_location(unsigned long input,
>  #endif
>  
>  #ifdef CONFIG_X86_64
> +extern int set_page_decrypted(unsigned long address);
>  extern unsigned char _pgtable[];
>  #endif
>  
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
