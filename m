Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D4653219E37
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 12:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8303B89876;
	Thu,  9 Jul 2020 10:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmCk2AiNSa33; Thu,  9 Jul 2020 10:51:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 00EE18986B;
	Thu,  9 Jul 2020 10:51:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D02DFC016F;
	Thu,  9 Jul 2020 10:51:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3A0EC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CEE3A89883
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rrt-tDc7s2e1
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:51:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B6FF489873
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:51:05 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2Xyv3zTwz9sQt;
 Thu,  9 Jul 2020 20:51:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594291864;
 bh=VI4aFN/tvbsGFEJ4xA4/0VeUoMRZZnfq/gpr3pAx8G0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=IKD2ten4BhzVwExubvn3K93mtWqnC3WWAZoRzc+c3H8YbG4WdsqsYIsWtHE7Mr0GH
 nGpjcBK6Dan3kZ/RMkJ8HleBBVOarl2j8GlhAGagpMFmLzOUokO9woJyZe4KB9Tvwf
 0gHMuKiiBQ3KcLbW84Ee0saFgPCykKlyofIbboYWIBK9RSlMTJJFeFiEwRu+zC4apq
 bE4ngiBaxW+gJCjWBfPK2R/oK0LL8F7QhMQriTR0TsdOezFACf1z9JYBLvElvotO+B
 y9apR0IOzs3WlCA9v8OvGe3t3FZaAfE4Haq+4aFUFiz6O2rlfWYCuDwrQiPGASWc69
 zr4ZnuPJOXulA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
In-Reply-To: <20200706043540.1563616-6-npiggin@gmail.com>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
Date: Thu, 09 Jul 2020 20:53:16 +1000
Message-ID: <874kqhvu1v.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Anton Blanchard <anton@ozlabs.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/paravirt.h           | 28 ++++++++
>  arch/powerpc/include/asm/qspinlock.h          | 66 +++++++++++++++++++
>  arch/powerpc/include/asm/qspinlock_paravirt.h |  7 ++
>  arch/powerpc/platforms/pseries/Kconfig        |  5 ++
>  arch/powerpc/platforms/pseries/setup.c        |  6 +-
>  include/asm-generic/qspinlock.h               |  2 +

Another ack?

> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> index 7a8546660a63..f2d51f929cf5 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -45,6 +55,19 @@ static inline void yield_to_preempted(int cpu, u32 yield_count)
>  {
>  	___bad_yield_to_preempted(); /* This would be a bug */
>  }
> +
> +extern void ___bad_yield_to_any(void);
> +static inline void yield_to_any(void)
> +{
> +	___bad_yield_to_any(); /* This would be a bug */
> +}

Why do we do that rather than just not defining yield_to_any() at all
and letting the build fail on that?

There's a condition somewhere that we know will false at compile time
and drop the call before linking?

> diff --git a/arch/powerpc/include/asm/qspinlock_paravirt.h b/arch/powerpc/include/asm/qspinlock_paravirt.h
> new file mode 100644
> index 000000000000..750d1b5e0202
> --- /dev/null
> +++ b/arch/powerpc/include/asm/qspinlock_paravirt.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __ASM_QSPINLOCK_PARAVIRT_H
> +#define __ASM_QSPINLOCK_PARAVIRT_H

_ASM_POWERPC_QSPINLOCK_PARAVIRT_H please.

> +
> +EXPORT_SYMBOL(__pv_queued_spin_unlock);

Why's that in a header? Should that (eventually) go with the generic implementation?

> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
> index 24c18362e5ea..756e727b383f 100644
> --- a/arch/powerpc/platforms/pseries/Kconfig
> +++ b/arch/powerpc/platforms/pseries/Kconfig
> @@ -25,9 +25,14 @@ config PPC_PSERIES
>  	select SWIOTLB
>  	default y
>  
> +config PARAVIRT_SPINLOCKS
> +	bool
> +	default n

default n is the default.

> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index 2db8469e475f..747a203d9453 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -771,8 +771,12 @@ static void __init pSeries_setup_arch(void)
>  	if (firmware_has_feature(FW_FEATURE_LPAR)) {
>  		vpa_init(boot_cpuid);
>  
> -		if (lppaca_shared_proc(get_lppaca()))
> +		if (lppaca_shared_proc(get_lppaca())) {
>  			static_branch_enable(&shared_processor);
> +#ifdef CONFIG_PARAVIRT_SPINLOCKS
> +			pv_spinlocks_init();
> +#endif
> +		}

We could avoid the ifdef with this I think?

diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index 434615f1d761..6ec72282888d 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -10,5 +10,9 @@
 #include <asm/simple_spinlock.h>
 #endif

+#ifndef CONFIG_PARAVIRT_SPINLOCKS
+static inline void pv_spinlocks_init(void) { }
+#endif
+
 #endif /* __KERNEL__ */
 #endif /* __ASM_SPINLOCK_H */


cheers
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
