Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8002182BF
	for <lists.virtualization@lfdr.de>; Wed,  8 Jul 2020 10:42:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C53B485116;
	Wed,  8 Jul 2020 08:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mYuKiZcV__Ej; Wed,  8 Jul 2020 08:42:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 69B7085087;
	Wed,  8 Jul 2020 08:42:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58CFCC016F;
	Wed,  8 Jul 2020 08:42:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6336C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 08:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1144685EC1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 08:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1OUFCagobr4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 08:41:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 481CE85C3B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 08:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=S32XUF0JR40sOoi2lYA1Jt2WlEew0VlzGuJ1gwYbhcU=; b=s35D4xLyvnkYZU4YcWf+9NjRFK
 qAGphMcWSVhYkoJc8aLz2jh51DodnUkao4ypjVVvtlh5fcEIsMpk6UdXCby8V2qdZA2gSM5VTx11d
 ejcgbzpQUBqwaR783SFDpecCm7eKgFdgoL4fECk9Qy30bGquxIr924rnywePvDNug5/GOl4mBqpIf
 yhYDUhFAoVr+rZtcrUHltrwRK7hN7qpv20iSjblFycKsMdUlki/Rvlx96bthlu203IRbVK2rv+Qyz
 fe6lVWcbvlapeHkqUU1cRfS5tDsGg7qLw6HfdJdLjRTuWghNE1CJUhLCA2Q5UKIbSoK08YZTIcjeG
 XvtIgbgA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jt5df-0008Ee-Rc; Wed, 08 Jul 2020 08:41:16 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BAE6F304D58;
 Wed,  8 Jul 2020 10:41:06 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A7CDA203D34DE; Wed,  8 Jul 2020 10:41:06 +0200 (CEST)
Date: Wed, 8 Jul 2020 10:41:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
Message-ID: <20200708084106.GE597537@hirez.programming.kicks-ass.net>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594101082.hfq9x5yact.astroid@bobo.none>
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Anton Blanchard <anton@ozlabs.org>, linuxppc-dev@lists.ozlabs.org
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

On Tue, Jul 07, 2020 at 03:57:06PM +1000, Nicholas Piggin wrote:
> Yes, powerpc could certainly get more performance out of the slow
> paths, and then there are a few parameters to tune.

Can you clarify? The slow path is already in use on ARM64 which is weak,
so I doubt there's superfluous serialization present. And Will spend a
fair amount of time on making that thing guarantee forward progressm, so
there just isn't too much room to play.

> We don't have a good alternate patching for function calls yet, but
> that would be something to do for native vs pv.

Going by your jump_label implementation, support for static_call should
be fairly straight forward too, no?

  https://lkml.kernel.org/r/20200624153024.794671356@infradead.org
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
