Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9269221BBFE
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 19:15:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 34F2189C3C;
	Fri, 10 Jul 2020 17:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eOGpWczKiUqf; Fri, 10 Jul 2020 17:15:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BF6FA89C3A;
	Fri, 10 Jul 2020 17:15:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A059CC016F;
	Fri, 10 Jul 2020 17:15:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE16AC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 17:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CA78289C30
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 17:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2SMDw72kxNBg
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 17:15:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6706C899D4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 17:15:16 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D19C020674;
 Fri, 10 Jul 2020 17:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594401316;
 bh=L7/tSb+Pse5aLWVxH/CLIrVK11DXAitXfSjGWiPzMUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ODn+wBX8HVqj1KZ2HGIGv/MORKu3ZZn1aHWKKfff8Ba+oqIUoNxRgomJHmFYKPNHS
 P1MuJ6OVVATCam7HY3GwWvnyCmD9TLL59R8ZtNw8xhnMxMpwg3QAynx9yvsiNN5Ud7
 r7lMVIb3kVpC3xRWR0p0fhp6Z1rXKg0F4ZE4sIz8=
Date: Fri, 10 Jul 2020 18:15:09 +0100
From: Will Deacon <will@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v3 06/19] asm/rwonce: Don't pull <asm/barrier.h> into
 'asm-generic/rwonce.h'
Message-ID: <20200710171508.GA31366@willie-the-truck>
References: <20200710165203.31284-1-will@kernel.org>
 <20200710165203.31284-7-will@kernel.org>
 <CAKwvOd=HJye0iHr=9=7EMytO8ycFNJEsHHe1m64uT8s0jOQw0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOd=HJye0iHr=9=7EMytO8ycFNJEsHHe1m64uT8s0jOQw0Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Joel Fernandes <joelaf@google.com>, Mark Rutland <mark.rutland@arm.com>,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>, linux-alpha@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>, Matt Turner <mattst88@gmail.com>,
 kernel-team <kernel-team@android.com>, Boqun Feng <boqun.feng@gmail.com>,
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

On Fri, Jul 10, 2020 at 10:06:12AM -0700, Nick Desaulniers wrote:
> On Fri, Jul 10, 2020 at 9:52 AM Will Deacon <will@kernel.org> wrote:
> > diff --git a/include/linux/nospec.h b/include/linux/nospec.h
> > index 0c5ef54fd416..c1e79f72cd89 100644
> > --- a/include/linux/nospec.h
> > +++ b/include/linux/nospec.h
> > @@ -5,6 +5,8 @@
> >
> >  #ifndef _LINUX_NOSPEC_H
> >  #define _LINUX_NOSPEC_H
> > +
> > +#include <linux/compiler.h>
> 
> The other hunks LGTM, but this one is a little more curious to me. Can
> you walk me through this addition?

Sure. Without it, the build breaks on riscv because it includes this header
without first including <linux/compiler.h>, and this header relies on
OPTIMIZER_HIDE_VAR() being to defined as it is used in static inline
functions.

Perhaps I should squash this hunk into "compiler.h: Split {READ,WRITE}_ONCE
definitions out into rwonce.h" instead, as that is where I remove the
include of <linux/compiler.h> from 'asm-generic/barrier.h'. I'll check
the bisection on riscv...

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
