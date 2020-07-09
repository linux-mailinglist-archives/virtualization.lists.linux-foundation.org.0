Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B548219E9D
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 13:03:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 921B98584A;
	Thu,  9 Jul 2020 11:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4mNKXmU7w1e; Thu,  9 Jul 2020 11:03:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 04FCB86451;
	Thu,  9 Jul 2020 11:03:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEE30C016F;
	Thu,  9 Jul 2020 11:03:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DB76C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 11:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2206D88E59
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 11:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOdcmupS68W6
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 11:03:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8E9B188E56
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 11:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kAodoJjxw+oZcu/SKU1xNGXdBrfnaoxdi6oL3ywEXIs=; b=ReiXtoRsWHjtkeuJwfJ+pv7m8c
 OuLBP5TSleXNRejXhR9wm2UuDuubf7xh1g4UYohYbfkJlVm4/MXRjgfMrrhYKvbCbS/Gqx7nob/K5
 XoI4rXaic5OCSP5fs9eDY5PVQzXOxnWusnm8iax+jqgAhz/i0+I4XWWlT2v1mTX6FBa34CO6EazeR
 RDQ0761FLfwnhc58i8tnjZlCpPF0VCSuQDnRlU5Rg0ZPAB4Rppuob2IL/G0yLfSJLwywfJyYMnTer
 60Wsm2Z8V0hT+4lzqGp2aC9xfRSJ3QzzSGaG9LYJemIPpx53CQYLtmoEVi1ePHIVbwT8Fa8vUEpDV
 IfjXd6Jw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtUKX-00059M-Ah; Thu, 09 Jul 2020 11:03:05 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 017CC30047A;
 Thu,  9 Jul 2020 13:03:04 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id E3C8F235B3D19; Thu,  9 Jul 2020 13:03:03 +0200 (CEST)
Date: Thu, 9 Jul 2020 13:03:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks
 for SPLPAR
Message-ID: <20200709110303.GS597537@hirez.programming.kicks-ass.net>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874kqhvu1v.fsf@mpe.ellerman.id.au>
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

On Thu, Jul 09, 2020 at 08:53:16PM +1000, Michael Ellerman wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
> 
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  arch/powerpc/include/asm/paravirt.h           | 28 ++++++++
> >  arch/powerpc/include/asm/qspinlock.h          | 66 +++++++++++++++++++
> >  arch/powerpc/include/asm/qspinlock_paravirt.h |  7 ++
> >  arch/powerpc/platforms/pseries/Kconfig        |  5 ++
> >  arch/powerpc/platforms/pseries/setup.c        |  6 +-
> >  include/asm-generic/qspinlock.h               |  2 +
> 
> Another ack?

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
