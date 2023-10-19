Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E457CEEB6
	for <lists.virtualization@lfdr.de>; Thu, 19 Oct 2023 06:41:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DDB26FA8B;
	Thu, 19 Oct 2023 04:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DDB26FA8B
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J6FyjU8Z
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YYChQ7LMYjbe; Thu, 19 Oct 2023 04:41:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2A4826FA8A;
	Thu, 19 Oct 2023 04:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4826FA8A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42CDEC008C;
	Thu, 19 Oct 2023 04:41:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A2F4C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 04:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 302C341D18
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 04:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 302C341D18
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=J6FyjU8Z
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eejs03YH7WXa
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 04:41:49 +0000 (UTC)
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55D50400FD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 04:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55D50400FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1697690500;
 bh=aZD3f3MJzhsJpL8v00FCIVTR80RmPudwdmbBGZ55N60=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=J6FyjU8ZcUqzKfrbX6tvRVugxcuuDAuhQZm7b9zE61MsAnCf5APF7LyescJyN6wZR
 m1khyZCQYb/ZJSmomAzMQZInm2insvZJDM5l0ZJsR6LKiXPRE7vWag8RxDZVT8L3Rg
 c32Y5+4JYqlQKndElHkVVephQtpVDDNqG3LwkED0A28En/90Tm7Rqocn7z4UBFnJq0
 6uXg/vzi871Xe6qTz6cEK/jaOkU0tIpqozIqty+xr4ybU1YzHiLKRNsH8wbe+i5He8
 HLjtmDOw9kIpRAms4NOPuXh+UuNhMrCrklTZ+rbg7GlqCF48yQOGZfMNqy92wYSh4q
 t6gZAbp6V8vtA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9w6D66dcz4xPy;
 Thu, 19 Oct 2023 15:41:40 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/6] powerpc/smp: Move shared_processor static key to
 smp.h
In-Reply-To: <20231018163751.2423181-4-srikar@linux.vnet.ibm.com>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-4-srikar@linux.vnet.ibm.com>
Date: Thu, 19 Oct 2023 15:41:40 +1100
Message-ID: <87sf675im3.fsf@mail.lhotse>
MIME-Version: 1.0
Cc: Valentin Schneider <vschneid@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 x86@kernel.org, Ajay Kaher <akaher@vmware.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 virtualization@lists.linux-foundation.org,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Alexey Makhalov <amakhalov@vmware.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>
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

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> The ability to detect if the system is running in a shared processor
> mode is helpful in few more generic cases not just in
> paravirtualization.
> For example: At boot time, different scheduler/ topology flags may be
> set based on the processor mode. Hence move it to a more generic file.

I'd rather you just included paravirt.h in the few files where you need it.

cheers

> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> index 0372b0093f72..cf83e837a571 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -15,13 +15,6 @@
>  #include <asm/kvm_guest.h>
>  #include <asm/cputhreads.h>
>  
> -DECLARE_STATIC_KEY_FALSE(shared_processor);
> -
> -static inline bool is_shared_processor(void)
> -{
> -	return static_branch_unlikely(&shared_processor);
> -}
> -
>  #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
>  extern struct static_key paravirt_steal_enabled;
>  extern struct static_key paravirt_steal_rq_enabled;
> @@ -77,11 +70,6 @@ static inline bool is_vcpu_idle(int vcpu)
>  	return lppaca_of(vcpu).idle;
>  }
>  #else
> -static inline bool is_shared_processor(void)
> -{
> -	return false;
> -}
> -
>  static inline u32 yield_count_of(int cpu)
>  {
>  	return 0;
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index aaaa576d0e15..08631b2a4528 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -34,6 +34,20 @@ extern bool coregroup_enabled;
>  extern int cpu_to_chip_id(int cpu);
>  extern int *chip_id_lookup_table;
>  
> +#ifdef CONFIG_PPC_SPLPAR
> +DECLARE_STATIC_KEY_FALSE(shared_processor);
> +
> +static inline bool is_shared_processor(void)
> +{
> +	return static_branch_unlikely(&shared_processor);
> +}
> +#else
> +static inline bool is_shared_processor(void)
> +{
> +	return false;
> +}
> +#endif
> +
>  DECLARE_PER_CPU(cpumask_var_t, thread_group_l1_cache_map);
>  DECLARE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
>  DECLARE_PER_CPU(cpumask_var_t, thread_group_l3_cache_map);
> -- 
> 2.31.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
