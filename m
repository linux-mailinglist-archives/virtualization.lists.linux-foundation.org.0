Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B02E1219DE3
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 12:33:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4EA4820437;
	Thu,  9 Jul 2020 10:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PVoJf95L7lNi; Thu,  9 Jul 2020 10:33:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3D7E626B0A;
	Thu,  9 Jul 2020 10:33:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2342C08A5;
	Thu,  9 Jul 2020 10:33:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 787F4C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5D8C288BC8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vumgs4nXkIme
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:33:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 835A688C3F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IvpXUYK9H+QnmAsI+N7Y+NJkZMFkfZkklbiU2ToyVQs=; b=ysIolg+CeRhNjk4NEZhTj9mj5g
 ca828lNtjuaGV9NHITlG2ZDPtxGhXNhk3KrvudsXjUJmb8J4XG/OF1nzUOwI//gHDtqE0EANnpbE+
 bbiBnPXo5VHSiHumhpr2Qu+akcJEqpES74jCyTShVPKFLAmD/sBzeRgZb/ORaBfu5DUyt8R+5OLWf
 GfezKgB7POj5RVO9xyLQJYa4YqvWXnYTcjZguHbo5tiN+wTk/yxkJo9dnoBBMvOLBeJh/GXmNplaB
 k6UuaBO7U4dpxgXLgt+GyuZ9p/eO25EDL03UeJAkSn2ViIUTHUSjhhYACWMO+fCLOzes7hYXYC/zl
 7sbP7/LA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtTs4-0007rF-9q; Thu, 09 Jul 2020 10:33:40 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 66F76300739;
 Thu,  9 Jul 2020 12:33:38 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 53455235B3D17; Thu,  9 Jul 2020 12:33:38 +0200 (CEST)
Date: Thu, 9 Jul 2020 12:33:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 4/6] powerpc/64s: implement queued spinlocks and rwlocks
Message-ID: <20200709103338.GQ597537@hirez.programming.kicks-ass.net>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-5-npiggin@gmail.com>
 <877dvdvvkm.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877dvdvvkm.fsf@mpe.ellerman.id.au>
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
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

On Thu, Jul 09, 2020 at 08:20:25PM +1000, Michael Ellerman wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
> > These have shown significantly improved performance and fairness when
> > spinlock contention is moderate to high on very large systems.
> >
> >  [ Numbers hopefully forthcoming after more testing, but initial
> >    results look good ]
> 
> Would be good to have something here, even if it's preliminary.
> 
> > Thanks to the fast path, single threaded performance is not noticably
> > hurt.
> >
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  arch/powerpc/Kconfig                      | 13 ++++++++++++
> >  arch/powerpc/include/asm/Kbuild           |  2 ++
> >  arch/powerpc/include/asm/qspinlock.h      | 25 +++++++++++++++++++++++
> >  arch/powerpc/include/asm/spinlock.h       |  5 +++++
> >  arch/powerpc/include/asm/spinlock_types.h |  5 +++++
> >  arch/powerpc/lib/Makefile                 |  3 +++
> 
> >  include/asm-generic/qspinlock.h           |  2 ++
> 
> Who's ack do we need for that part?

Mine I suppose would do, as discussed earlier, it probably isn't
required anymore, but I understand the paranoia of not wanting to change
too many things at once :-)


Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
