Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A484621091D
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 12:19:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3B2E589434;
	Wed,  1 Jul 2020 10:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFRxg1ulEP2Y; Wed,  1 Jul 2020 10:19:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B5141893E2;
	Wed,  1 Jul 2020 10:19:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94B19C0733;
	Wed,  1 Jul 2020 10:19:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1BD7C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 10:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DC0498AA80
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 10:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7utOLqsMFie
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 10:19:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7917D8AA64
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 10:19:29 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD328206B6;
 Wed,  1 Jul 2020 10:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593598769;
 bh=9Kej8N7/444vyXQnl8/ioGdJ8CvpVggYRN8p0S6A3hA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XMtZZ1DarIqro0ULGuCiTjSVyJcESurJDaZsh5CFvc6CBXTm3pedcUVJFRlirmjlr
 92x2fLcppQnSp5oM9ELuhyJpmszSzZJYg4gVTVdrHIX069eolAhFnwXqU1AJ25irZh
 XNHpUTaw9KdSfGins0gbmJvLeNQsCViZVDBnjSYk=
Date: Wed, 1 Jul 2020 11:19:23 +0100
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 18/18] arm64: lto: Strengthen READ_ONCE() to acquire when
 CLANG_LTO=y
Message-ID: <20200701101922.GC14959@willie-the-truck>
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-19-will@kernel.org>
 <CAK8P3a2zB4z121reuy6BCqQ3-1mDBAkUkRRXeDuvSFtSr3ha2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2zB4z121reuy6BCqQ3-1mDBAkUkRRXeDuvSFtSr3ha2g@mail.gmail.com>
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

On Tue, Jun 30, 2020 at 09:25:03PM +0200, Arnd Bergmann wrote:
> On Tue, Jun 30, 2020 at 7:39 PM Will Deacon <will@kernel.org> wrote:
> > +#define __READ_ONCE(x)                                                 \
> > +({                                                                     \
> > +       int atomic = 1;                                                 \
> > +       union { __unqual_scalar_typeof(x) __val; char __c[1]; } __u;    \
> > +       typeof(&(x)) __x = &(x);                                        \
> > +       switch (sizeof(x)) {                                            \
> ...
> > +       atomic ? (typeof(x))__u.__val : (*(volatile typeof(x) *)__x);   \
> > +})
> 
> This expands (x) nine times (five in __unqual_scala_typeof()), which can
> lead to significant code bloat after preprocessing if something passes a
> compound expression into READ_ONCE().
> The compiler works it out eventually, but we've seen an actual slowdown
> in compile speed from this recently, especially on clang.
> 
> I think if you move the
> 
>         typeof(&(x)) __x = &(x);
> 
> line first, all other instances can use typeof(*__x) instead of typeof(x)
> and avoid this problem.

Cheers, I was only thinking about side-effects when I wrote this, but
bloating built time is very unpopular, so I'll go with your suggestion.

> Once we make gcc-4.9 the minimum version,
> this could be further improved to
> 
>        __auto_type __x = &(x);

Is anybody working on moving to 4.9? I've seen the mails from Linus
championing it, but I thought there was a RHEL in support that people
might care about?

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
