Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A06A4682A58
	for <lists.virtualization@lfdr.de>; Tue, 31 Jan 2023 11:22:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7526340894;
	Tue, 31 Jan 2023 10:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7526340894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yNKQ4QaqvDgO; Tue, 31 Jan 2023 10:22:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EC461408EE;
	Tue, 31 Jan 2023 10:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC461408EE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19A0BC0078;
	Tue, 31 Jan 2023 10:22:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBBB4C002B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Jan 2023 10:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C658C6079B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Jan 2023 10:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C658C6079B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XxA-6afofG1Y
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Jan 2023 10:22:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7BC960899
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7BC960899
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Jan 2023 10:22:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFD102F4;
 Tue, 31 Jan 2023 02:22:56 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.12.254])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C65F63F64C;
 Tue, 31 Jan 2023 02:22:12 -0800 (PST)
Date: Tue, 31 Jan 2023 10:22:09 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH 0/2] vhost: improve livepatch switching for heavily
 loaded vhost worker kthreads
Message-ID: <Y9jr0fP7DtA9Of1L@FVFF77S0Q05N>
References: <Y9KyVKQk3eH+RRse@alley> <Y9LswwnPAf+nOVFG@do-x1extreme>
 <20230127044355.frggdswx424kd5dq@treble>
 <Y9OpTtqWjAkC2pal@hirez.programming.kicks-ass.net>
 <20230127165236.rjcp6jm6csdta6z3@treble>
 <20230127170946.zey6xbr4sm4kvh3x@treble>
 <20230127221131.sdneyrlxxhc4h3fa@treble>
 <Y9e6ssSHUt+MUvum@hirez.programming.kicks-ass.net>
 <Y9gOMCWGmoc5GQMj@FVFF77S0Q05N>
 <20230130194823.6y3rc227bvsgele4@treble>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130194823.6y3rc227bvsgele4@treble>
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, netdev@vger.kernel.org,
 Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 "Seth Forshee \(DigitalOcean\)" <sforshee@digitalocean.com>,
 live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>
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

On Mon, Jan 30, 2023 at 11:48:23AM -0800, Josh Poimboeuf wrote:
> On Mon, Jan 30, 2023 at 06:36:32PM +0000, Mark Rutland wrote:
> > On Mon, Jan 30, 2023 at 01:40:18PM +0100, Peter Zijlstra wrote:
> > > On Fri, Jan 27, 2023 at 02:11:31PM -0800, Josh Poimboeuf wrote:
> > > > @@ -8500,8 +8502,10 @@ EXPORT_STATIC_CALL_TRAMP(might_resched);
> > > >  static DEFINE_STATIC_KEY_FALSE(sk_dynamic_cond_resched);
> > > >  int __sched dynamic_cond_resched(void)
> > > >  {
> > > > -	if (!static_branch_unlikely(&sk_dynamic_cond_resched))
> > > > +	if (!static_branch_unlikely(&sk_dynamic_cond_resched)) {
> > > > +		klp_sched_try_switch();
> > > >  		return 0;
> > > > +	}
> > > >  	return __cond_resched();
> > > >  }
> > > >  EXPORT_SYMBOL(dynamic_cond_resched);
> > > 
> > > I would make the klp_sched_try_switch() not depend on
> > > sk_dynamic_cond_resched, because __cond_resched() is not a guaranteed
> > > pass through __schedule().
> > > 
> > > But you'll probably want to check with Mark here, this all might
> > > generate crap code on arm64.
> > 
> > IIUC here klp_sched_try_switch() is a static call, so on arm64 this'll generate
> > at least a load, a conditional branch, and an indirect branch. That's not
> > ideal, but I'd have to benchmark it to find out whether it's a significant
> > overhead relative to the baseline of PREEMPT_DYNAMIC.
> > 
> > For arm64 it'd be a bit nicer to have another static key check, and a call to
> > __klp_sched_try_switch(). That way the static key check gets turned into a NOP
> > in the common case, and the call to __klp_sched_try_switch() can be a direct
> > call (potentially a tail-call if we made it return 0).
> 
> Hm, it might be nice if our out-of-line static call implementation would
> automatically do a static key check as part of static_call_cond() for
> NULL-type static calls.
> 
> But the best answer is probably to just add inline static calls to
> arm64.  Is the lack of objtool the only thing blocking that?

The major issues were branch range limitations (and needing the linker to add
PLTs), and painful instruction patching requirements (e.g. the architecture's
"CMODX" rules for Concurrent MODification and eXecution of instructions). We
went with the static key scheme above because that was what our assembled code
generation would devolve to anyway.

If we knew each call-site would only call a particular function or skip the
call, then we could do better (and would probably need something like objtool
to NOP that out at compile time), but since we don't know the callee at build
time we can't ensure we have a PLT in range when necessary.

> Objtool is now modular, so all the controversial CFG reverse engineering
> is now optional, so it shouldn't be too hard to just enable objtool for
> static call inlines.

Funnily enough, I spent some time yesterday looking at enabling a trivial
objtool for arm64 as I wanted some basic ELF rewriting functionality (to
manipulate the mcount_loc table). So I'll likely be looking at that soon
regardless of static calls. :)

Thanks,
Mark.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
