Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C99522657E
	for <lists.virtualization@lfdr.de>; Mon, 20 Jul 2020 17:55:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 91CD687D28;
	Mon, 20 Jul 2020 15:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0c1STHIdmpj; Mon, 20 Jul 2020 15:55:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2156587D39;
	Mon, 20 Jul 2020 15:55:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0088C016F;
	Mon, 20 Jul 2020 15:55:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 386D8C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 15:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2165F85683
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 15:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JFNQeR89tUc
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 15:55:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A49CD8558F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 15:55:08 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0960B22BEF;
 Mon, 20 Jul 2020 15:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595260508;
 bh=CPfkp2QBSP3gKifkBSkUyRSWEi+JHbUnJ+ZB0izj7DY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a5D8vvsdPtuyNYv8qE1jt1t3R9hwgKBR8Ede9nALJ4GZh3UC88Nws0YRzwzNNeorI
 I6F07W869uTS3luWta0bx2aHQA6vGJ8h5e5sxVfXxpGZN+kyk/pEq36G0rCjq/iKmZ
 /FYTeONkLgSEhZ5hG4MefWUaAVfzMFvXZKz/EBg0=
Date: Mon, 20 Jul 2020 16:55:02 +0100
From: Will Deacon <will@kernel.org>
To: boqun.feng@gmail.com
Subject: Re: [PATCH v3 02/19] compiler.h: Split {READ, WRITE}_ONCE definitions
 out into rwonce.h
Message-ID: <20200720155501.GA12064@willie-the-truck>
References: <20200710165203.31284-1-will@kernel.org>
 <20200710165203.31284-3-will@kernel.org>
 <20200713122322.GD72639@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713122322.GD72639@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Joel Fernandes <joelaf@google.com>, Mark Rutland <mark.rutland@arm.com>,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Sami Tolvanen <samitolvanen@google.com>,
 linux-alpha@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
 Matt Turner <mattst88@gmail.com>, kernel-team@android.com,
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

On Mon, Jul 13, 2020 at 08:23:22PM +0800, boqun.feng@gmail.com wrote:
> On Fri, Jul 10, 2020 at 05:51:46PM +0100, Will Deacon wrote:
> > diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
> > new file mode 100644
> > index 000000000000..92cc2f223cb3
> > --- /dev/null
> > +++ b/include/asm-generic/rwonce.h
> > @@ -0,0 +1,91 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Prevent the compiler from merging or refetching reads or writes. The
> > + * compiler is also forbidden from reordering successive instances of
> > + * READ_ONCE and WRITE_ONCE, but only when the compiler is aware of some
> > + * particular ordering. One way to make the compiler aware of ordering is to
> > + * put the two invocations of READ_ONCE or WRITE_ONCE in different C
> > + * statements.
> > + *
> > + * These two macros will also work on aggregate data types like structs or
> > + * unions.
> > + *
> > + * Their two major use cases are: (1) Mediating communication between
> > + * process-level code and irq/NMI handlers, all running on the same CPU,
> > + * and (2) Ensuring that the compiler does not fold, spindle, or otherwise
> > + * mutilate accesses that either do not require ordering or that interact
> > + * with an explicit memory barrier or atomic instruction that provides the
> > + * required ordering.
> > + */
> > +#ifndef __ASM_GENERIC_RWONCE_H
> > +#define __ASM_GENERIC_RWONCE_H
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +#include <linux/compiler_types.h>
> > +#include <linux/kasan-checks.h>
> > +#include <linux/kcsan-checks.h>
> > +
> > +#include <asm/barrier.h>
> > +
> > +/*
> > + * Use __READ_ONCE() instead of READ_ONCE() if you do not require any
> > + * atomicity or dependency ordering guarantees. Note that this may result
> > + * in tears!
> > + */
> > +#define __READ_ONCE(x)	(*(const volatile __unqual_scalar_typeof(x) *)&(x))
> > +
> > +#define __READ_ONCE_SCALAR(x)						\
> > +({									\
> > +	__unqual_scalar_typeof(x) __x = __READ_ONCE(x);			\
> > +	smp_read_barrier_depends();					\
> > +	(typeof(x))__x;							\
> > +})
> > +
> > +#define READ_ONCE(x)							\
> > +({									\
> > +	compiletime_assert_rwonce_type(x);				\
> 
> Does it make sense if we also move the definition of this compile time
> assertion into rwonce.h too?

Yes, that looks straightforward enough. Thanks for the suggestion!

I'll also try to get this lot into -next this week.

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
