Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05968195E
	for <lists.virtualization@lfdr.de>; Mon, 30 Jan 2023 19:36:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E414C40AF4;
	Mon, 30 Jan 2023 18:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E414C40AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kLkFBx4GQajb; Mon, 30 Jan 2023 18:36:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B28DF40A68;
	Mon, 30 Jan 2023 18:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B28DF40A68
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0991C007C;
	Mon, 30 Jan 2023 18:36:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27157C002B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Jan 2023 18:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2FC440739
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Jan 2023 18:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2FC440739
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MLNGMkIcvC-2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Jan 2023 18:36:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D87D940554
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id D87D940554
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Jan 2023 18:36:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDC211FB;
 Mon, 30 Jan 2023 10:37:23 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.12.187])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBF2C3F71E;
 Mon, 30 Jan 2023 10:36:39 -0800 (PST)
Date: Mon, 30 Jan 2023 18:36:32 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 0/2] vhost: improve livepatch switching for heavily
 loaded vhost worker kthreads
Message-ID: <Y9gOMCWGmoc5GQMj@FVFF77S0Q05N>
References: <20230120-vhost-klp-switching-v1-0-7c2b65519c43@kernel.org>
 <Y9KyVKQk3eH+RRse@alley> <Y9LswwnPAf+nOVFG@do-x1extreme>
 <20230127044355.frggdswx424kd5dq@treble>
 <Y9OpTtqWjAkC2pal@hirez.programming.kicks-ass.net>
 <20230127165236.rjcp6jm6csdta6z3@treble>
 <20230127170946.zey6xbr4sm4kvh3x@treble>
 <20230127221131.sdneyrlxxhc4h3fa@treble>
 <Y9e6ssSHUt+MUvum@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9e6ssSHUt+MUvum@hirez.programming.kicks-ass.net>
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 "Seth Forshee \(DigitalOcean\)" <sforshee@digitalocean.com>,
 live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
 Josh Poimboeuf <jpoimboe@kernel.org>
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

On Mon, Jan 30, 2023 at 01:40:18PM +0100, Peter Zijlstra wrote:
> On Fri, Jan 27, 2023 at 02:11:31PM -0800, Josh Poimboeuf wrote:
> > @@ -8500,8 +8502,10 @@ EXPORT_STATIC_CALL_TRAMP(might_resched);
> >  static DEFINE_STATIC_KEY_FALSE(sk_dynamic_cond_resched);
> >  int __sched dynamic_cond_resched(void)
> >  {
> > -	if (!static_branch_unlikely(&sk_dynamic_cond_resched))
> > +	if (!static_branch_unlikely(&sk_dynamic_cond_resched)) {
> > +		klp_sched_try_switch();
> >  		return 0;
> > +	}
> >  	return __cond_resched();
> >  }
> >  EXPORT_SYMBOL(dynamic_cond_resched);
> 
> I would make the klp_sched_try_switch() not depend on
> sk_dynamic_cond_resched, because __cond_resched() is not a guaranteed
> pass through __schedule().
> 
> But you'll probably want to check with Mark here, this all might
> generate crap code on arm64.

IIUC here klp_sched_try_switch() is a static call, so on arm64 this'll generate
at least a load, a conditional branch, and an indirect branch. That's not
ideal, but I'd have to benchmark it to find out whether it's a significant
overhead relative to the baseline of PREEMPT_DYNAMIC.

For arm64 it'd be a bit nicer to have another static key check, and a call to
__klp_sched_try_switch(). That way the static key check gets turned into a NOP
in the common case, and the call to __klp_sched_try_switch() can be a direct
call (potentially a tail-call if we made it return 0).

Thanks,
Mark.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
