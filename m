Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CE99521090E
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 12:16:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2A19E2EB62;
	Wed,  1 Jul 2020 10:16:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id COIw6+0zw6xR; Wed,  1 Jul 2020 10:16:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CBAE62E95A;
	Wed,  1 Jul 2020 10:16:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1243C0733;
	Wed,  1 Jul 2020 10:16:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA8BEC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 10:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D365D894CE
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 10:16:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2XV7L5G7pEDr
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 10:16:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C801B8947B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 10:16:10 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AECE206B6;
 Wed,  1 Jul 2020 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593598570;
 bh=zaXs2CbDvdszPriMRibslBZHNsXjv65VQsj0rfFmR+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=x9F1GjIcBBX3hdCVHlt6wJhlZPB1N66WRkkqZTlXlWM63OjP7z5kH6BN/nqF+TGdK
 0l2eDCnBkdVi58H2QL0fQ2HW5wh+cQZXqBCv4zjoK3BLLwxqaxwskMx48hdn7mC2PX
 hIbO1vcmH/rJuuU6I20zoA0/9Lb9QB1M0qPY6kII=
Date: Wed, 1 Jul 2020 11:16:04 +0100
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 02/18] compiler.h: Split {READ,WRITE}_ONCE definitions
 out into rwonce.h
Message-ID: <20200701101603.GB14959@willie-the-truck>
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-3-will@kernel.org>
 <CAK8P3a136e2k-iGoJ4X51mnj0f0KSLJKOw6b=s4F2QHHeyAMEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a136e2k-iGoJ4X51mnj0f0KSLJKOw6b=s4F2QHHeyAMEQ@mail.gmail.com>
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

Hi Arnd,

On Tue, Jun 30, 2020 at 09:11:32PM +0200, Arnd Bergmann wrote:
> On Tue, Jun 30, 2020 at 7:37 PM Will Deacon <will@kernel.org> wrote:
> >
> > In preparation for allowing architectures to define their own
> > implementation of the READ_ONCE() macro, move the generic
> > {READ,WRITE}_ONCE() definitions out of the unwieldy 'linux/compiler.h'
> > file and into a new 'rwonce.h' header under 'asm-generic'.
> >
> > Acked-by: Paul E. McKenney <paulmck@kernel.org>
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  include/asm-generic/Kbuild   |  1 +
> >  include/asm-generic/rwonce.h | 91 ++++++++++++++++++++++++++++++++++++
> >  include/linux/compiler.h     | 83 +-------------------------------
> 
> Very nice, this has the added benefit of allowing us to stop including
> asm/barrier.h once linux/compiler.h gets changed to not include
> asm/rwonce.h.

Yeah, with this series linux/compiler.h _does_ include asm/rwonce.h because
otherwise there are many callers to fix up, but that could be addressed
subsequently, I suppose.

> The asm/barrier.h header has a circular dependency, pulling in
> linux/compiler.h itself.

Hmm. Once smp_read_barrier_depends() disappears, I could actually remove
the include of <asm/barrier.h> from asm-generic/rwonce.h. It would have to
remain for arch/alpha/, however, since we need the barrier definitions to
implement READ_ONCE(). I can probably also replace the include of
<linux/compiler.h> in asm-generic/barrier.h with <asm/rwonce.h> too (so it's
still circular, but at least a lot simpler).

I'll have a play...

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
