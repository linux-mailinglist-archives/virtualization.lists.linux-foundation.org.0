Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 05117211FF9
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 11:32:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A2EB62047A;
	Thu,  2 Jul 2020 09:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YIT5Z7q5IsB0; Thu,  2 Jul 2020 09:32:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DE02621514;
	Thu,  2 Jul 2020 09:32:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C393EC08A2;
	Thu,  2 Jul 2020 09:32:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1346C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 09:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B88C78A5E8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 09:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6obwvEuALs8n
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 09:32:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id B9FB28A431
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 09:32:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D892B31B;
 Thu,  2 Jul 2020 02:32:50 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.12.193])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7322A3F71E;
 Thu,  2 Jul 2020 02:32:46 -0700 (PDT)
Date: Thu, 2 Jul 2020 10:32:39 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 04/18] alpha: Override READ_ONCE() with barriered
 implementation
Message-ID: <20200702093239.GA15391@C02TD0UTHF1T.local>
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-5-will@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630173734.14057-5-will@kernel.org>
Cc: Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Josh Triplett <josh@joshtriplett.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Sami Tolvanen <samitolvanen@google.com>,
 linux-alpha@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
 Matt Turner <mattst88@gmail.com>, virtualization@lists.linux-foundation.org,
 kernel-team@android.com, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>
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

On Tue, Jun 30, 2020 at 06:37:20PM +0100, Will Deacon wrote:
> Rather then relying on the core code to use smp_read_barrier_depends()
> as part of the READ_ONCE() definition, instead override __READ_ONCE()
> in the Alpha code so that it is treated the same way as
> smp_load_acquire().
> 
> Acked-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/alpha/include/asm/barrier.h | 61 ++++----------------------------
>  arch/alpha/include/asm/rwonce.h  | 19 ++++++++++
>  2 files changed, 26 insertions(+), 54 deletions(-)
>  create mode 100644 arch/alpha/include/asm/rwonce.h
> 
> diff --git a/arch/alpha/include/asm/barrier.h b/arch/alpha/include/asm/barrier.h
> index 92ec486a4f9e..2ecd068d91d1 100644
> --- a/arch/alpha/include/asm/barrier.h
> +++ b/arch/alpha/include/asm/barrier.h
> @@ -2,64 +2,17 @@
>  #ifndef __BARRIER_H
>  #define __BARRIER_H
>  
> -#include <asm/compiler.h>
> -
>  #define mb()	__asm__ __volatile__("mb": : :"memory")
>  #define rmb()	__asm__ __volatile__("mb": : :"memory")
>  #define wmb()	__asm__ __volatile__("wmb": : :"memory")

> -#define read_barrier_depends() __asm__ __volatile__("mb": : :"memory")
> +#define __smp_load_acquire(p)						\
> +({									\
> +	__unqual_scalar_typeof(*p) ___p1 =				\
> +		(*(volatile typeof(___p1) *)(p));			\
> +	compiletime_assert_atomic_type(*p);				\
> +	___p1;								\
> +})

Sorry if I'm being thick, but doesn't this need a barrier after the
volatile access to provide the acquire semantic?

IIUC prior to this commit alpha would have used the asm-generic
__smp_load_acquire, i.e.

| #ifndef __smp_load_acquire
| #define __smp_load_acquire(p)                                           \
| ({                                                                      \
|         __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
|         compiletime_assert_atomic_type(*p);                             \
|         __smp_mb();                                                     \
|         (typeof(*p))___p1;                                              \
| })
| #endif

... where the __smp_mb() would be alpha's mb() from earlier in the patch
context, i.e.

| #define mb() __asm__ __volatile__("mb": : :"memory")

... so don't we need similar before returning ___p1 above in
__smp_load_acquire() (and also matching the old read_barrier_depends())?

[...]

> +#include <asm/barrier.h>
> +
> +/*
> + * Alpha is apparently daft enough to reorder address-dependent loads
> + * on some CPU implementations. Knock some common sense into it with
> + * a memory barrier in READ_ONCE().
> + */
> +#define __READ_ONCE(x)	__smp_load_acquire(&(x))

As above, I don't see a memory barrier implied here, so this doesn't
look quite right.

Thanks,
Mark.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
