Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F38C322B710
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 21:59:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8CA7D21F6F;
	Thu, 23 Jul 2020 19:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiC9uee29dlO; Thu, 23 Jul 2020 19:59:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4418D228DB;
	Thu, 23 Jul 2020 19:59:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C07EC004C;
	Thu, 23 Jul 2020 19:59:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9365C004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 19:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AF52186D42
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 19:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZETiQRkybx5n
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 19:59:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A944086D2E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 19:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MRwVqr0N2b8WDaLImhLP0DB/IrZrREwuBWJI9q4jFik=; b=F8/Idme1+fZ+UyqfWxqOjQiiOv
 kWGRCzma/YyUhpR5nC5pQLnZ3KCnnK8P1BDAcvnLhea+4+0pM46KYYrL0VKeeVBQ4fR1RHSRbiVIZ
 SKgxxIqNgARKSoRnP6fdQiWkfmT80xSTcswSEb8FqfbbUFoR2KHKPY6f7HtQemc267mP6Kk/onlSj
 jZjLDvXaVO2nmOD6dwGyEwS+4+TQyR5UndHu1oP4FD68DfiLjzFMjmdA6cxlvjZ3vEn27my0iQPq8
 t9vHlgWZ3ZcPcZY3aFq07InXlvZAAVknTFxaLbh9h7DDtBIqh7rO+TuX/H32s7lN3Np9/l9suq4YS
 0TaiwXFg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyhMo-0008Nu-4V; Thu, 23 Jul 2020 19:58:59 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id F0287304E03;
 Thu, 23 Jul 2020 21:58:55 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 7C49425942EEE; Thu, 23 Jul 2020 21:58:55 +0200 (CEST)
Date: Thu, 23 Jul 2020 21:58:55 +0200
From: peterz@infradead.org
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks
 for SPLPAR
Message-ID: <20200723195855.GU119549@hirez.programming.kicks-ass.net>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
 <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
 <20200723140011.GR5523@worktop.programming.kicks-ass.net>
 <845de183-56f5-2958-3159-faa131d46401@redhat.com>
 <20200723184759.GS119549@hirez.programming.kicks-ass.net>
 <6d6279ad-7432-63c1-14c3-18c4cff30bf8@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d6279ad-7432-63c1-14c3-18c4cff30bf8@redhat.com>
Cc: linux-arch@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Boqun Feng <boqun.feng@gmail.com>, virtualization@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, Anton Blanchard <anton@ozlabs.org>,
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

On Thu, Jul 23, 2020 at 03:04:13PM -0400, Waiman Long wrote:
> On 7/23/20 2:47 PM, peterz@infradead.org wrote:
> > On Thu, Jul 23, 2020 at 02:32:36PM -0400, Waiman Long wrote:
> > > BTW, do you have any comment on my v2 lock holder cpu info qspinlock patch?
> > > I will have to update the patch to fix the reported 0-day test problem, but
> > > I want to collect other feedback before sending out v3.
> > I want to say I hate it all, it adds instructions to a path we spend an
> > aweful lot of time optimizing without really getting anything back for
> > it.
> 
> It does add some extra instruction that may slow it down slightly, but I
> don't agree that it gives nothing back. The cpu lock holder information can
> be useful in analyzing crash dumps and in some debugging situation. I think
> it can be useful in RHEL for this readon. How about an x86 config option to
> allow distros to decide if they want to have it enabled? I will make sure
> that it will have no performance degradation if the option is not enabled.

Config knobs suck too; they create a maintenance burden (we get to make
sure all the permutations works/build/etc..) and effectively nobody uses
them, since world+dog uses what distros pick.

Anyway, instead of adding a second per-cpu variable, can you see how
horrible something like this is:

unsigned char adds(unsigned char var, unsigned char val)
{
	unsigned short sat = 0xff, tmp = var;

	asm ("addb	%[val], %b[var];"
	     "cmovc	%[sat], %[var];"
	     : [var] "+r" (tmp)
	     : [val] "ir" (val), [sat] "r" (sat)
	     );

	return tmp;
}

Another thing to try is, instead of threading that lockval throughout
the thing, simply:

#define _Q_LOCKED_VAL	this_cpu_read_stable(cpu_sat)

or combined with the above

#define _Q_LOCKED_VAL	adds(this_cpu_read_stable(cpu_number), 2)

and see if the compiler really makes a mess of things.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
