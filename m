Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B503B22B846
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 23:02:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0899822CB0;
	Thu, 23 Jul 2020 21:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vpMIy1Kb7uZt; Thu, 23 Jul 2020 21:02:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9CFD522B6D;
	Thu, 23 Jul 2020 21:02:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72061C004C;
	Thu, 23 Jul 2020 21:02:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03CC0C004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 21:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E00A588582
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 21:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id URhc5B+XEZsB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 21:02:02 +0000 (UTC)
X-Greylist: delayed 00:31:07 by SQLgrey-1.7.6
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5FDB488581
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 21:02:02 +0000 (UTC)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 06NKUlRb019444;
 Thu, 23 Jul 2020 15:30:47 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 06NKUkhI019442;
 Thu, 23 Jul 2020 15:30:46 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 23 Jul 2020 15:30:46 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: peterz@infradead.org
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
Message-ID: <20200723203046.GI32057@gate.crashing.org>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
 <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
 <20200723140011.GR5523@worktop.programming.kicks-ass.net>
 <845de183-56f5-2958-3159-faa131d46401@redhat.com>
 <20200723184759.GS119549@hirez.programming.kicks-ass.net>
 <6d6279ad-7432-63c1-14c3-18c4cff30bf8@redhat.com>
 <20200723195855.GU119549@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723195855.GU119549@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.4.2.3i
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Waiman Long <longman@redhat.com>, linuxppc-dev@lists.ozlabs.org
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

On Thu, Jul 23, 2020 at 09:58:55PM +0200, peterz@infradead.org wrote:
> 	asm ("addb	%[val], %b[var];"
> 	     "cmovc	%[sat], %[var];"
> 	     : [var] "+r" (tmp)
> 	     : [val] "ir" (val), [sat] "r" (sat)
> 	     );

"var" (operand 0) needs an earlyclobber ("sat" is read after "var" is
written for the first time).


Segher
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
