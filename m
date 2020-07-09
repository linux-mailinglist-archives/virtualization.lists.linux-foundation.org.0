Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDFF21A458
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 18:06:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2568527158;
	Thu,  9 Jul 2020 16:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GSL26xu9tYmc; Thu,  9 Jul 2020 16:06:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5A2E72C87E;
	Thu,  9 Jul 2020 16:06:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 341F3C016F;
	Thu,  9 Jul 2020 16:06:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65B48C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 16:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5252D87ED9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 16:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l8g0crGxdLFP
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 16:06:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 874E287C94
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594310781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5OfLVV9ee+e3aH9dIq9Uyj1RNa4dEfM45FxDPLW9s5s=;
 b=VouPM7FbUzs9gAvBps3AW8ZmnsDwQgQo9pnbA5ZoYBHiD9gaaSrTVpDAncetij5vwL4lfa
 rvYFwEnsy+6yO6GT/Qutv5Z35dfuKQeQW9rK1MSH16vGqLxaFugeGexsgEpKdzlvjlsn29
 qH7qsXH5oPYNKo35csE34+PbASG2EwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-3cdqq7fgOK-wggAAqi1Q3w-1; Thu, 09 Jul 2020 12:06:17 -0400
X-MC-Unique: 3cdqq7fgOK-wggAAqi1Q3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83A94100AA21;
 Thu,  9 Jul 2020 16:06:15 +0000 (UTC)
Received: from llong.remote.csb (ovpn-120-122.rdu2.redhat.com [10.10.120.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB60179CE7;
 Thu,  9 Jul 2020 16:06:13 +0000 (UTC)
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
Date: Thu, 9 Jul 2020 12:06:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <874kqhvu1v.fsf@mpe.ellerman.id.au>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Anton Blanchard <anton@ozlabs.org>,
 Will Deacon <will@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 7/9/20 6:53 AM, Michael Ellerman wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/paravirt.h           | 28 ++++++++
>>   arch/powerpc/include/asm/qspinlock.h          | 66 +++++++++++++++++++
>>   arch/powerpc/include/asm/qspinlock_paravirt.h |  7 ++
>>   arch/powerpc/platforms/pseries/Kconfig        |  5 ++
>>   arch/powerpc/platforms/pseries/setup.c        |  6 +-
>>   include/asm-generic/qspinlock.h               |  2 +
> Another ack?
>
I am OK with adding the #ifdef around queued_spin_lock().

Acked-by: Waiman Long <longman@redhat.com>

>> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
>> index 7a8546660a63..f2d51f929cf5 100644
>> --- a/arch/powerpc/include/asm/paravirt.h
>> +++ b/arch/powerpc/include/asm/paravirt.h
>> @@ -45,6 +55,19 @@ static inline void yield_to_preempted(int cpu, u32 yield_count)
>>   {
>>   	___bad_yield_to_preempted(); /* This would be a bug */
>>   }
>> +
>> +extern void ___bad_yield_to_any(void);
>> +static inline void yield_to_any(void)
>> +{
>> +	___bad_yield_to_any(); /* This would be a bug */
>> +}
> Why do we do that rather than just not defining yield_to_any() at all
> and letting the build fail on that?
>
> There's a condition somewhere that we know will false at compile time
> and drop the call before linking?
>
>> diff --git a/arch/powerpc/include/asm/qspinlock_paravirt.h b/arch/powerpc/include/asm/qspinlock_paravirt.h
>> new file mode 100644
>> index 000000000000..750d1b5e0202
>> --- /dev/null
>> +++ b/arch/powerpc/include/asm/qspinlock_paravirt.h
>> @@ -0,0 +1,7 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#ifndef __ASM_QSPINLOCK_PARAVIRT_H
>> +#define __ASM_QSPINLOCK_PARAVIRT_H
> _ASM_POWERPC_QSPINLOCK_PARAVIRT_H please.
>
>> +
>> +EXPORT_SYMBOL(__pv_queued_spin_unlock);
> Why's that in a header? Should that (eventually) go with the generic implementation?
The PV qspinlock implementation is not that generic at the moment. Even 
though native qspinlock is used by a number of archs, PV qspinlock is 
only currently used in x86. This is certainly an area that needs 
improvement.
>> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
>> index 24c18362e5ea..756e727b383f 100644
>> --- a/arch/powerpc/platforms/pseries/Kconfig
>> +++ b/arch/powerpc/platforms/pseries/Kconfig
>> @@ -25,9 +25,14 @@ config PPC_PSERIES
>>   	select SWIOTLB
>>   	default y
>>   
>> +config PARAVIRT_SPINLOCKS
>> +	bool
>> +	default n
> default n is the default.
>
>> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
>> index 2db8469e475f..747a203d9453 100644
>> --- a/arch/powerpc/platforms/pseries/setup.c
>> +++ b/arch/powerpc/platforms/pseries/setup.c
>> @@ -771,8 +771,12 @@ static void __init pSeries_setup_arch(void)
>>   	if (firmware_has_feature(FW_FEATURE_LPAR)) {
>>   		vpa_init(boot_cpuid);
>>   
>> -		if (lppaca_shared_proc(get_lppaca()))
>> +		if (lppaca_shared_proc(get_lppaca())) {
>>   			static_branch_enable(&shared_processor);
>> +#ifdef CONFIG_PARAVIRT_SPINLOCKS
>> +			pv_spinlocks_init();
>> +#endif
>> +		}
> We could avoid the ifdef with this I think?
>
> diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
> index 434615f1d761..6ec72282888d 100644
> --- a/arch/powerpc/include/asm/spinlock.h
> +++ b/arch/powerpc/include/asm/spinlock.h
> @@ -10,5 +10,9 @@
>   #include <asm/simple_spinlock.h>
>   #endif
>
> +#ifndef CONFIG_PARAVIRT_SPINLOCKS
> +static inline void pv_spinlocks_init(void) { }
> +#endif
> +
>   #endif /* __KERNEL__ */
>   #endif /* __ASM_SPINLOCK_H */
>
>
> cheers
>
We don't really need to do a pv_spinlocks_init() if pv_kick() isn't 
supported.

Cheers,
Longman

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
