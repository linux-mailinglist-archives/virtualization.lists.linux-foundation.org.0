Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAED22C087
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 10:17:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 76E2687E3F;
	Fri, 24 Jul 2020 08:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vuP1-Kb4mj3c; Fri, 24 Jul 2020 08:16:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 01F2687D96;
	Fri, 24 Jul 2020 08:16:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4571C004C;
	Fri, 24 Jul 2020 08:16:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28F38C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 08:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1CE3B87D65
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 08:16:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcQ0aw7RnHFv
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 08:16:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 92BE987B41
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 08:16:53 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 776FE2074A;
 Fri, 24 Jul 2020 08:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595578613;
 bh=MtSSJVr7CkQ6qYnldFXBBhVSH/FImYJYfT41DnqnyfQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RwKzdNIM0IbM4QhStWrpabxkbmQfmemxolOJQbQ35i0L7IjfMB2mLxbxDs3yf9OMG
 t5gjDHgkaIcsKKrEcDnxZ3E6OOSzQ0tacBMUiHRqwCuYIXYMIMsfdvbx+wenpuiypB
 b+V/llaOX/7WR8IKO4GbceZdbj7sGKlc3q02Gn3Q=
Date: Fri, 24 Jul 2020 09:16:48 +0100
From: Will Deacon <will@kernel.org>
To: peterz@infradead.org
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks
 for SPLPAR
Message-ID: <20200724081647.GA16642@willie-the-truck>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
 <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
 <20200723140011.GR5523@worktop.programming.kicks-ass.net>
 <845de183-56f5-2958-3159-faa131d46401@redhat.com>
 <20200723184759.GS119549@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723184759.GS119549@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arch@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Anton Blanchard <anton@ozlabs.org>,
 linuxppc-dev@lists.ozlabs.org
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

On Thu, Jul 23, 2020 at 08:47:59PM +0200, peterz@infradead.org wrote:
> On Thu, Jul 23, 2020 at 02:32:36PM -0400, Waiman Long wrote:
> > BTW, do you have any comment on my v2 lock holder cpu info qspinlock patch?
> > I will have to update the patch to fix the reported 0-day test problem, but
> > I want to collect other feedback before sending out v3.
> 
> I want to say I hate it all, it adds instructions to a path we spend an
> aweful lot of time optimizing without really getting anything back for
> it.
> 
> Will, how do you feel about it?

I can see it potentially being useful for debugging, but I hate the
limitation to 256 CPUs. Even arm64 is hitting that now.

Also, you're talking ~1% gains here. I think our collective time would
be better spent off reviewing the CNA series and trying to make it more
deterministic.

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
