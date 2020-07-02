Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 69258211C9A
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 09:23:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D0C5A8A578;
	Thu,  2 Jul 2020 07:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HfDtiSj4RRSK; Thu,  2 Jul 2020 07:23:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 395728A563;
	Thu,  2 Jul 2020 07:23:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00B65C0733;
	Thu,  2 Jul 2020 07:23:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E44DC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 41ED2253CA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3DCAowXjneX
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:23:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 084B4252A8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:23:09 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B3D42073E;
 Thu,  2 Jul 2020 07:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593674588;
 bh=Re61RwD/CyQqWBiQskwnaPfGr1o4kLsu1CWsfLls+hM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kuS2Mmhm+7c/+nST2Wi4JbOT82ZSobqK5KFCdbVqQXwCGLZBy7/LpmgMb7Pq85t1G
 a6m6BrCh5id96wu1KUG0opwCahVKpnhDfkXuSg9AMslVdZ1XMgtrIMFp1PT5EHGsL9
 n0XlU4lEskbMa3Pt2IwRkzphNfPJu+6WmVYkG9DQ=
Date: Thu, 2 Jul 2020 08:23:02 +0100
From: Will Deacon <will@kernel.org>
To: Dave P Martin <dave.martin@arm.com>
Subject: Re: [PATCH 18/18] arm64: lto: Strengthen READ_ONCE() to acquire when
 CLANG_LTO=y
Message-ID: <20200702072301.GA15963@willie-the-truck>
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-19-will@kernel.org>
 <20200701170722.4rte5ssnmrn2uqzg@bakewell.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701170722.4rte5ssnmrn2uqzg@bakewell.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 virtualization@lists.linux-foundation.org, Arnd Bergmann <arnd@arndb.de>,
 Alan Stern <stern@rowland.harvard.edu>,
 Sami Tolvanen <samitolvanen@google.com>, Matt Turner <mattst88@gmail.com>,
 kernel-team@android.com, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org
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

On Wed, Jul 01, 2020 at 06:07:25PM +0100, Dave P Martin wrote:
> On Tue, Jun 30, 2020 at 06:37:34PM +0100, Will Deacon wrote:
> > When building with LTO, there is an increased risk of the compiler
> > converting an address dependency headed by a READ_ONCE() invocation
> > into a control dependency and consequently allowing for harmful
> > reordering by the CPU.
> > 
> > Ensure that such transformations are harmless by overriding the generic
> > READ_ONCE() definition with one that provides acquire semantics when
> > building with LTO.
> > 
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/include/asm/rwonce.h   | 63 +++++++++++++++++++++++++++++++
> >  arch/arm64/kernel/vdso/Makefile   |  2 +-
> >  arch/arm64/kernel/vdso32/Makefile |  2 +-
> >  3 files changed, 65 insertions(+), 2 deletions(-)
> >  create mode 100644 arch/arm64/include/asm/rwonce.h
> > 
> > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > new file mode 100644
> > index 000000000000..515e360b01a1
> > --- /dev/null
> > +++ b/arch/arm64/include/asm/rwonce.h
> > @@ -0,0 +1,63 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020 Google LLC.
> > + */
> > +#ifndef __ASM_RWONCE_H
> > +#define __ASM_RWONCE_H
> > +
> > +#ifdef CONFIG_CLANG_LTO
> 
> Don't we have a generic option for LTO that's not specific to Clang.

/me looks at the LTO series some more

Oh yeah, there's CONFIG_LTO which is selected by CONFIG_LTO_CLANG, which is
the non-typoed version of the above. I can switch this to CONFIG_LTO.

> Also, can you illustrate code that can only be unsafe with Clang LTO?

I don't have a concrete example, but it's an ongoing concern over on the LTO
thread [1], so I cooked this to show one way we could deal with it. The main
concern is that the whole-program optimisations enabled by LTO may allow the
compiler to enumerate possible values for a pointer at link time and replace
an address dependency between two loads with a control dependency instead,
defeating the dependency ordering within the CPU.

We likely won't realise if/when this goes wrong, other than impossible to
debug, subtle breakage that crops up seemingly randomly. Ideally, we'd be
able to detect this sort of thing happening at build time, and perhaps
even prevent it with compiler options or annotations, but none of that is
close to being available and I'm keen to progress the LTO patches in the
meantime because they are a requirement for CFI.

Will

[1] https://lore.kernel.org/r/20200624203200.78870-1-samitolvanen@google.com
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
