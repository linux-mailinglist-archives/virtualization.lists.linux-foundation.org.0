Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 762D02DBCCB
	for <lists.virtualization@lfdr.de>; Wed, 16 Dec 2020 09:41:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 150F887196;
	Wed, 16 Dec 2020 08:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5Al1Mx-7tAR; Wed, 16 Dec 2020 08:41:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 05F2E8714E;
	Wed, 16 Dec 2020 08:41:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBC3CC013B;
	Wed, 16 Dec 2020 08:41:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1146C013B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 08:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E0142859EF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 08:41:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1viJTUWjHVa7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 08:41:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 35436859E3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0Vl8v+K48CQ1CpDPZyiLdlZ3QZd1xhq2vGyfDmO1QSk=; b=d0ukNEGopW7xSAvf4l6oxB/hVo
 FRyEdkJ6gVh6WhW3HqIsdfeYXWYQ1HLOyEXl/M8OOjMOALFor8DXrwW8OkhssqBZWj2qY+dOjn3WQ
 w+eOTFIjqNLK3/OUKiTAiR7DfaZ2tzpDvvAr4qqHg7G/gm2EllebQ0U87v/0G0msGEUvStoO64DY+
 jRApct0VEjBdukFFaWwT/w5fpgGG2r/xGFbqZ+y+RR+1foywG9EkTHpqpIVFJmYZHyDNnwWxdOg8q
 B4pWQSqNEGAgqHIW+S7+CgCiPXoMiutaQwIno90DVH6FICQhR2vzciTHwxWeaxxT1doUmhnq8aMrv
 PjYDhOMw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpSMu-0005UY-Qg; Wed, 16 Dec 2020 08:41:09 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AB87E307697;
 Wed, 16 Dec 2020 09:40:59 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 967842CADD880; Wed, 16 Dec 2020 09:40:59 +0100 (CET)
Date: Wed, 16 Dec 2020 09:40:59 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH v2 00/12] x86: major paravirt cleanup
Message-ID: <20201216084059.GL3040@hirez.programming.kicks-ass.net>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120125342.GC3040@hirez.programming.kicks-ass.net>
 <20201123134317.GE3092@hirez.programming.kicks-ass.net>
 <6771a12c-051d-1655-fb3a-cc45a3c82e29@suse.com>
 <20201215141834.GG3040@hirez.programming.kicks-ass.net>
 <20201215145408.GR3092@hirez.programming.kicks-ass.net>
 <20201216003802.5fpklvx37yuiufrt@treble>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216003802.5fpklvx37yuiufrt@treble>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-hyperv@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Wanpeng Li <wanpengli@tencent.com>,
 kvm@vger.kernel.org, "VMware, Inc." <pv-drivers@vmware.com>,
 virtualization@lists.linux-foundation.org, Ben Segall <bsegall@google.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 xen-devel@lists.xenproject.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Jim Mattson <jmattson@google.com>,
 =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
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

On Tue, Dec 15, 2020 at 06:38:02PM -0600, Josh Poimboeuf wrote:
> On Tue, Dec 15, 2020 at 03:54:08PM +0100, Peter Zijlstra wrote:
> > The problem is that a single instance of unwind information (ORC) must
> > capture and correctly unwind all alternatives. Since the trivially
> > correct mandate is out, implement the straight forward brute-force
> > approach:
> > 
> >  1) generate CFI information for each alternative
> > 
> >  2) unwind every alternative with the merge-sort of the previously
> >     generated CFI information -- O(n^2)
> > 
> >  3) for any possible conflict: yell.
> > 
> >  4) Generate ORC with merge-sort
> > 
> > Specifically for 3 there are two possible classes of conflicts:
> > 
> >  - the merge-sort itself could find conflicting CFI for the same
> >    offset.
> > 
> >  - the unwind can fail with the merged CFI.
> 
> So much algorithm.

:-)

It's not really hard, but it has a few pesky details (as always).

> Could we make it easier by caching the shared
> per-alt-group CFI state somewhere along the way?

Yes, but when I tried it grew the code required. Runtime costs would be
less, but I figured that since alternatives are typically few and small,
that wasn't a real consideration.

That is, it would basically cache the results of find_alt_unwind(), but
you still need find_alt_unwind() to generate that data, and so you gain
the code for filling and using the extra data structure.

Yes, computing it 3 times is naf, but meh.

> [ 'offset' is a byte offset from the beginning of the group.  It could
>   be calculated based on 'orig_insn' or 'orig_insn->alts', depending on
>   whether 'insn' is an original or a replacement. ]

That's exactly what it already does ofcourse ;-)

> If the array entry is NULL, just update it with a pointer to the CFI.
> If it's not NULL, make sure it matches the existing CFI, and WARN if it
> doesn't.
> 
> Also, with this data structure, the ORC generation should also be a lot
> more straightforward, just ignore the NULL entries.

Yeah, I suppose it gets rid of the memcmp-prev thing.

> Thoughts?  This is all theoretical of course, I could try to do a patch
> tomorrow.

No real objection, I just didn't do it because 1) it works, and 2) even
moar lines.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
