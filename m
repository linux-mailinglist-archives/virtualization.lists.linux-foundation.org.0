Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C32422B108
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 16:10:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F3FF586CC7;
	Thu, 23 Jul 2020 14:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TxbxZx0s7-IV; Thu, 23 Jul 2020 14:09:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3076388766;
	Thu, 23 Jul 2020 14:09:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11DEFC004C;
	Thu, 23 Jul 2020 14:09:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A193C004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 14:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 262B6874C1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 14:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIsFB3EzRYQX
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 14:09:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 91623874BC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 14:09:55 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id n5so3160585pgf.7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 07:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=QQ+1Br77BLz8lQjoivkzwXKzJFU6kfi+6X+tKUpNas4=;
 b=VrjaKnJdpR1Q8/zxNQwaywYVL4aRO5VkRzHmFjYwybGM9tx089/g1Ffv46QKdc+RUs
 R6DCZA9k7t+FSZ+Mx0vuWBZYJQ3WTcoGb0I4V6VpiEKCbu9AdTetnakuIydsSwfoz2+j
 l9EEEwDmIUWZaHP8Ud2g2is+SUIFouXgPyKbBKXnQFdCHgwraxGL1m6ZgEJgDc8Y5tPM
 A9btbBCW4lz7/PYi8S0j5NpaOSvPfDMwrMQ9KKnOcxBdZWT/pclllFueGNwszxTu6NYA
 M65pHDPqBZpoRwWQi+vBgtEGz3FonNJXLnNsaxu5yE/7TsVl63Qg3ZTXw78Xo8A9jJtj
 DI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=QQ+1Br77BLz8lQjoivkzwXKzJFU6kfi+6X+tKUpNas4=;
 b=EXdvLVDihq07GJpfUbTYzE1b5TplixHspCh+5i5fmlY991h4d2egR9vFLHL6ARsIeD
 PNrbx6X5yqqOb/nDteB5qeW/9c6+pVjpeTyUui/wdrRIyYeDRMeaupDHSddjE+1/7awa
 GBcADw3iFDu0lS8FSrtQdcMBAELniKNGnMHBc8/GwRkDaMVd1eAZl77KEWjgUXhH6SlX
 EZ8hJBxsYRrnxfMwyNYduOfsTRMt7BqVpDoU9uNyJExEw9MlVZEIwMubz5VJNZtgCaV/
 Aes+B6Fqe9raPYcAa5RjzsojfTFlyR/Md1CP5keOv/V5V5B46UI2t0rK0D8xbVXBypz1
 OYQQ==
X-Gm-Message-State: AOAM530G9scvoeHN0k05eeP7WpCsTCYAdEq+MU3hMiUV9E8lqMj9UlXG
 30iXIZvYeQOnkT2MWooCLTM=
X-Google-Smtp-Source: ABdhPJz9Ux/xe9gUmHJptXyzmvpTWCDbn3NSD1ykHJ9GcvjlxMgG8/bFHnuOpReypGSbZRKQ2OYRGA==
X-Received: by 2002:a63:ca11:: with SMTP id n17mr4276124pgi.439.1595513395017; 
 Thu, 23 Jul 2020 07:09:55 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id q4sm3208683pjq.36.2020.07.23.07.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 07:09:54 -0700 (PDT)
Date: Fri, 24 Jul 2020 00:09:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
In-Reply-To: <874kqhvu1v.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1595512823.5k2rrd4zk5.astroid@bobo.none>
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Anton Blanchard <anton@ozlabs.org>, Will Deacon <will@kernel.org>
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

Excerpts from Michael Ellerman's message of July 9, 2020 8:53 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
> 
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/paravirt.h           | 28 ++++++++
>>  arch/powerpc/include/asm/qspinlock.h          | 66 +++++++++++++++++++
>>  arch/powerpc/include/asm/qspinlock_paravirt.h |  7 ++
>>  arch/powerpc/platforms/pseries/Kconfig        |  5 ++
>>  arch/powerpc/platforms/pseries/setup.c        |  6 +-
>>  include/asm-generic/qspinlock.h               |  2 +
> 
> Another ack?
> 
>> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
>> index 7a8546660a63..f2d51f929cf5 100644
>> --- a/arch/powerpc/include/asm/paravirt.h
>> +++ b/arch/powerpc/include/asm/paravirt.h
>> @@ -45,6 +55,19 @@ static inline void yield_to_preempted(int cpu, u32 yield_count)
>>  {
>>  	___bad_yield_to_preempted(); /* This would be a bug */
>>  }
>> +
>> +extern void ___bad_yield_to_any(void);
>> +static inline void yield_to_any(void)
>> +{
>> +	___bad_yield_to_any(); /* This would be a bug */
>> +}
> 
> Why do we do that rather than just not defining yield_to_any() at all
> and letting the build fail on that?
> 
> There's a condition somewhere that we know will false at compile time
> and drop the call before linking?

Mainly so you could use it in if (IS_ENABLED()) blocks, but would still
catch the (presumably buggy) case where something calls it without the
option set.

I think I had it arranged a different way that was using IS_ENABLED 
earlier and changed it but might as well keep it this way.

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
> 
> _ASM_POWERPC_QSPINLOCK_PARAVIRT_H please.
> 
>> +
>> +EXPORT_SYMBOL(__pv_queued_spin_unlock);
> 
> Why's that in a header? Should that (eventually) go with the generic implementation?

Yeah the qspinlock_paravirt.h header is a bit weird and only gets 
included into kernel/locking/qspinlock.c

>> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
>> index 24c18362e5ea..756e727b383f 100644
>> --- a/arch/powerpc/platforms/pseries/Kconfig
>> +++ b/arch/powerpc/platforms/pseries/Kconfig
>> @@ -25,9 +25,14 @@ config PPC_PSERIES
>>  	select SWIOTLB
>>  	default y
>>  
>> +config PARAVIRT_SPINLOCKS
>> +	bool
>> +	default n
> 
> default n is the default.
> 
>> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
>> index 2db8469e475f..747a203d9453 100644
>> --- a/arch/powerpc/platforms/pseries/setup.c
>> +++ b/arch/powerpc/platforms/pseries/setup.c
>> @@ -771,8 +771,12 @@ static void __init pSeries_setup_arch(void)
>>  	if (firmware_has_feature(FW_FEATURE_LPAR)) {
>>  		vpa_init(boot_cpuid);
>>  
>> -		if (lppaca_shared_proc(get_lppaca()))
>> +		if (lppaca_shared_proc(get_lppaca())) {
>>  			static_branch_enable(&shared_processor);
>> +#ifdef CONFIG_PARAVIRT_SPINLOCKS
>> +			pv_spinlocks_init();
>> +#endif
>> +		}
> 
> We could avoid the ifdef with this I think?

Yes I think so.

Thanks,
Nick

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
