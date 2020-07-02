Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BABA2121FF
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 13:18:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5127289034;
	Thu,  2 Jul 2020 11:18:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1AfKk1ue1voh; Thu,  2 Jul 2020 11:18:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C51C189115;
	Thu,  2 Jul 2020 11:18:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9968C0733;
	Thu,  2 Jul 2020 11:18:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 980C5C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 11:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 87532890F0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 11:18:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFC3fvSJAvJ4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 11:18:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 06A4C89018
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 11:18:40 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 70F432070C;
 Thu,  2 Jul 2020 11:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593688719;
 bh=h84qaL3tEGgL2zFfFCmV5wFzP3FSpcWjx8fMB+KEr/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TEOri34UXEVBKgcj4rLGB/bJmudCDMyJL+tLvCgKpyoj8RzaK4APPbgu5RGOTP3p5
 5oXOCWMbf39NFuDmH+wlYd4Dc7VUwtHetvygZjh2VEHqUUXg8xiVgAGsUh4qOeP1r9
 KRGIfHHvKVj65yixb+M3JOkgh2dE76YFoeN4R2m4=
Date: Thu, 2 Jul 2020 12:18:33 +0100
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 04/18] alpha: Override READ_ONCE() with barriered
 implementation
Message-ID: <20200702111832.GC16418@willie-the-truck>
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-5-will@kernel.org>
 <20200702093239.GA15391@C02TD0UTHF1T.local>
 <20200702094833.GA16248@willie-the-truck>
 <CAK8P3a07G1dLC+RUBDkzDbCRCP_gwZAaVK+k1UxvXT+7Kj=o+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a07G1dLC+RUBDkzDbCRCP_gwZAaVK+k1UxvXT+7Kj=o+g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Josh Triplett <josh@joshtriplett.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Sami Tolvanen <samitolvanen@google.com>, alpha <linux-alpha@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, Matt Turner <mattst88@gmail.com>,
 virtualization@lists.linux-foundation.org,
 Android Kernel Team <kernel-team@android.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>
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

On Thu, Jul 02, 2020 at 12:08:41PM +0200, Arnd Bergmann wrote:
> On Thu, Jul 2, 2020 at 11:48 AM Will Deacon <will@kernel.org> wrote:
> > On Thu, Jul 02, 2020 at 10:32:39AM +0100, Mark Rutland wrote:
> > > On Tue, Jun 30, 2020 at 06:37:20PM +0100, Will Deacon wrote:
> > > > -#define read_barrier_depends() __asm__ __volatile__("mb": : :"memory")
> > > > +#define __smp_load_acquire(p)                                              \
> > > > +({                                                                 \
> > > > +   __unqual_scalar_typeof(*p) ___p1 =                              \
> > > > +           (*(volatile typeof(___p1) *)(p));                       \
> > > > +   compiletime_assert_atomic_type(*p);                             \
> > > > +   ___p1;                                                          \
> > > > +})
> > >
> > > Sorry if I'm being thick, but doesn't this need a barrier after the
> > > volatile access to provide the acquire semantic?
> > >
> > > IIUC prior to this commit alpha would have used the asm-generic
> > > __smp_load_acquire, i.e.
> > >
> > > | #ifndef __smp_load_acquire
> > > | #define __smp_load_acquire(p)                                           \
> > > | ({                                                                      \
> > > |         __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
> > > |         compiletime_assert_atomic_type(*p);                             \
> > > |         __smp_mb();                                                     \
> > > |         (typeof(*p))___p1;                                              \
> > > | })
> > > | #endif
> 
> I also have a question that I didn't dare ask when the same
> code came up before (I guess it's also what's in the kernel today):
> 
> With the cast to 'typeof(*p)' at the end, doesn't that mean we
> lose the effect of __unqual_scalar_typeof() again, so any "volatile"
> pointer passed into __READ_ONCE_SCALAR() or
> __smp_load_acquire() still leads to a volatile load of the original
> variable, plus another volatile access to ___p1 after
> spilling it to the stack as a non-volatile variable?

Not sure I follow you here, but I can confirm that what you're worried
about doesn't happen for the usual case of a pointer-to-volatile scalar.

For example, ignoring dependency ordering:

unsigned long foo(volatile unsigned long *p)
{
	return smp_load_acquire(p) + 1;
}

Ends up looking like:

	unsigned long ___p1 = *(const volatile unsigned long *)p;
	smp_mb();
	(volatile unsigned long)___p1;

My understanding is that casting a non-pointer type to volatile doesn't
do anything, so we're good.

On the other hand, you can still cause the stack reload if you use volatile
pointers to volatile:

volatile unsigned long *bar(volatile unsigned long * volatile *ptr)
{
	return READ_ONCE(*ptr);
}

but this is pretty weird code, I think.

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
