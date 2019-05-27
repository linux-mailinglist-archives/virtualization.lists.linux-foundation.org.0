Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 082092B20B
	for <lists.virtualization@lfdr.de>; Mon, 27 May 2019 12:22:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C29A21502;
	Mon, 27 May 2019 10:22:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0AD071598
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 10:22:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7669C878
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 10:22:02 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l17so7975439wrm.10
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 03:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=b21qaBk7xgBLkh/tR0jiPGLO6jWcDKAw7epKgIMYkgI=;
	b=N1eCtaF91k5Si02FuqcNx2d9rtsg71keu1GXcQ9y6FWW4kcxPWJ01bbAZ0HjuQgLnJ
	Vl6eyVXVB3oN4KMLlIRcgyJc2kovxCT1j8/72cDw9CMdQREQLCUgE1oFAdR5ACFz5gnW
	Q6Uy9/0I+WHxLnMOJu25e8sf2YC93adT7Ohm/7XWQvvXe/NPH6hll6QHH9qkdWl/cZ1i
	n2a9C25g7GEgWc5gtWwwERI4+omQJcE8xhWnPJvHpQ2o3+zEEKdHMqDCG5I/BuzeLwPD
	4POXzhND3HjiVw+VeQ0B4VCjgpo7PeRdJ+A3vSeLTfegxfbNyUErd80qeJeE0BW13eRW
	wQ1g==
X-Gm-Message-State: APjAAAXzGOpYOaT7Sh9FypMhykAishIgbnGsLea2iwpmDJi4i2iExWwX
	GQNp8dvUsiVnUBrP9u3HccUDRA==
X-Google-Smtp-Source: APXvYqyHBiTtlTwjGNSoRY9mSrO2K+MXLJKpJDqJEZ9a29tUYpcW0gYHSxIWv7TusW+bveIx9CmIaw==
X-Received: by 2002:adf:db87:: with SMTP id u7mr25167674wri.245.1558952521069; 
	Mon, 27 May 2019 03:22:01 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c43e:46a8:e962:cee8?
	([2001:b07:6468:f312:c43e:46a8:e962:cee8])
	by smtp.gmail.com with ESMTPSA id
	a17sm8328827wrr.80.2019.05.27.03.21.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 03:22:00 -0700 (PDT)
Subject: Re: [RFC PATCH 5/6] x86/mm/tlb: Flush remote and local TLBs
	concurrently
To: Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>
References: <20190525082203.6531-1-namit@vmware.com>
	<20190525082203.6531-6-namit@vmware.com>
	<08b21fb5-2226-7924-30e3-31e4adcfc0a3@suse.com>
	<20190527094710.GU2623@hirez.programming.kicks-ass.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e9c0dc1f-799a-b6e3-8d41-58f0a6b693cd@redhat.com>
Date: Mon, 27 May 2019 12:21:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527094710.GU2623@hirez.programming.kicks-ass.net>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	Haiyang Zhang <haiyangz@microsoft.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	xen-devel@lists.xenproject.org, Nadav Amit <namit@vmware.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 27/05/19 11:47, Peter Zijlstra wrote:
> On Sat, May 25, 2019 at 10:54:50AM +0200, Juergen Gross wrote:
>> On 25/05/2019 10:22, Nadav Amit wrote:
> 
>>> diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
>>> index 946f8f1f1efc..3a156e63c57d 100644
>>> --- a/arch/x86/include/asm/paravirt_types.h
>>> +++ b/arch/x86/include/asm/paravirt_types.h
>>> @@ -211,6 +211,12 @@ struct pv_mmu_ops {
>>>  	void (*flush_tlb_user)(void);
>>>  	void (*flush_tlb_kernel)(void);
>>>  	void (*flush_tlb_one_user)(unsigned long addr);
>>> +	/*
>>> +	 * flush_tlb_multi() is the preferred interface. When it is used,
>>> +	 * flush_tlb_others() should return false.
>>
>> This comment does not make sense. flush_tlb_others() return type is
>> void.
> 
> I suspect that is an artifact from before the static_key; an attempt to
> make the pv interface less awkward.
> 
> Something like the below would work for KVM I suspect, the others
> (Hyper-V and Xen are more 'interesting').
> 
> ---
> --- a/arch/x86/kernel/kvm.c
> +++ b/arch/x86/kernel/kvm.c
> @@ -580,7 +580,7 @@ static void __init kvm_apf_trap_init(voi
>  
>  static DEFINE_PER_CPU(cpumask_var_t, __pv_tlb_mask);
>  
> -static void kvm_flush_tlb_others(const struct cpumask *cpumask,
> +static void kvm_flush_tlb_multi(const struct cpumask *cpumask,
>  			const struct flush_tlb_info *info)
>  {
>  	u8 state;
> @@ -594,6 +594,9 @@ static void kvm_flush_tlb_others(const s
>  	 * queue flush_on_enter for pre-empted vCPUs
>  	 */
>  	for_each_cpu(cpu, flushmask) {
> +		if (cpu == smp_processor_id())
> +			continue;
> +

Even this would be just an optimization; the vCPU you're running on
cannot be preempted.  You can just change others to multi.

Paolo

>  		src = &per_cpu(steal_time, cpu);
>  		state = READ_ONCE(src->preempted);
>  		if ((state & KVM_VCPU_PREEMPTED)) {
> @@ -603,7 +606,7 @@ static void kvm_flush_tlb_others(const s
>  		}
>  	}
>  
> -	native_flush_tlb_others(flushmask, info);
> +	native_flush_tlb_multi(flushmask, info);
>  }
>  
>  static void __init kvm_guest_init(void)
> @@ -628,9 +631,8 @@ static void __init kvm_guest_init(void)
>  	if (kvm_para_has_feature(KVM_FEATURE_PV_TLB_FLUSH) &&
>  	    !kvm_para_has_hint(KVM_HINTS_REALTIME) &&
>  	    kvm_para_has_feature(KVM_FEATURE_STEAL_TIME)) {
> -		pv_ops.mmu.flush_tlb_others = kvm_flush_tlb_others;
> +		pv_ops.mmu.flush_tlb_multi = kvm_flush_tlb_multi;
>  		pv_ops.mmu.tlb_remove_table = tlb_remove_table;
> -		static_key_disable(&flush_tlb_multi_enabled.key);
>  	}
>  
>  	if (kvm_para_has_feature(KVM_FEATURE_PV_EOI))
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
