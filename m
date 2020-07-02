Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F51212050
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 11:48:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3A3FE88D9C;
	Thu,  2 Jul 2020 09:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Mh06tmUZkyy; Thu,  2 Jul 2020 09:48:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 84A2488EB8;
	Thu,  2 Jul 2020 09:48:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66D01C0733;
	Thu,  2 Jul 2020 09:48:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0937C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 09:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E47178A98D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 09:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l5SL4x23a4F5
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 09:48:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 828078A930
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 09:48:40 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E995020874;
 Thu,  2 Jul 2020 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593683320;
 bh=8To++DcBmhQUuz2eqkOVWHaWbqWUTZ6jhRKebFqKYqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pvvSqoKuX6EoQp3iR1pOFMS1VuWVSn9bXK/IVDhTQ1Bb8G4k5KaaptoPD6grev0aX
 fNdI68lGWQGkuhsT0oBuiB3hXEx9ZLANBXAgOTDc+ixQmjHmi9pG8qTts8l/Xw1PHx
 R1JOSfYU0SMNZ/OPMRKZNPdqf1Ztg/D9u+MRtgqw=
Date: Thu, 2 Jul 2020 10:48:33 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 04/18] alpha: Override READ_ONCE() with barriered
 implementation
Message-ID: <20200702094833.GA16248@willie-the-truck>
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-5-will@kernel.org>
 <20200702093239.GA15391@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702093239.GA15391@C02TD0UTHF1T.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, Jul 02, 2020 at 10:32:39AM +0100, Mark Rutland wrote:
> On Tue, Jun 30, 2020 at 06:37:20PM +0100, Will Deacon wrote:
> > -#define read_barrier_depends() __asm__ __volatile__("mb": : :"memory")
> > +#define __smp_load_acquire(p)						\
> > +({									\
> > +	__unqual_scalar_typeof(*p) ___p1 =				\
> > +		(*(volatile typeof(___p1) *)(p));			\
> > +	compiletime_assert_atomic_type(*p);				\
> > +	___p1;								\
> > +})
> 
> Sorry if I'm being thick, but doesn't this need a barrier after the
> volatile access to provide the acquire semantic?
> 
> IIUC prior to this commit alpha would have used the asm-generic
> __smp_load_acquire, i.e.
> 
> | #ifndef __smp_load_acquire
> | #define __smp_load_acquire(p)                                           \
> | ({                                                                      \
> |         __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
> |         compiletime_assert_atomic_type(*p);                             \
> |         __smp_mb();                                                     \
> |         (typeof(*p))___p1;                                              \
> | })
> | #endif
> 
> ... where the __smp_mb() would be alpha's mb() from earlier in the patch
> context, i.e.
> 
> | #define mb() __asm__ __volatile__("mb": : :"memory")
> 
> ... so don't we need similar before returning ___p1 above in
> __smp_load_acquire() (and also matching the old read_barrier_depends())?
> 
> [...]
> 
> > +#include <asm/barrier.h>
> > +
> > +/*
> > + * Alpha is apparently daft enough to reorder address-dependent loads
> > + * on some CPU implementations. Knock some common sense into it with
> > + * a memory barrier in READ_ONCE().
> > + */
> > +#define __READ_ONCE(x)	__smp_load_acquire(&(x))
> 
> As above, I don't see a memory barrier implied here, so this doesn't
> look quite right.

You're right, and Peter spotted the same thing off-list. I've reworked
locally so that the mb() ends up in __READ_ONCE() and __smp_load_acquire()
calles __READ_ONCE() instead of the other way round (which made more
sense before the rework in the merge window).

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
