Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 543A2205655
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 17:52:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B72252DB63;
	Tue, 23 Jun 2020 15:52:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5x8f178qQRJI; Tue, 23 Jun 2020 15:52:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4B65026426;
	Tue, 23 Jun 2020 15:52:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BBAEC016F;
	Tue, 23 Jun 2020 15:52:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12D8BC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EF2A288C64
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id atWab9oQVPEm
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:52:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 50A9E88AAD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=V+I5M6T0vX0U3AsFDgchL+f1L6gn7BSv3aERPVrjnPY=; b=P+jdsz0ucfshSY+SPQ8CRHAJD+
 x4g4UkTqpdDwyLW7IHndErlpvnUEKSuBos0fi391zScfBZg4cN3Tj56VCg4zTawV5zzyskojPa2Ns
 70wOMACbqtQ9ryX6O0y7oKh9zeN9KjCY0Ub914IGNKVUaC+FMR7ZXF+PAlT+Fwbre1YSz+Bb5Cw1e
 kOddoPFwBkU7dqyg0y8k0Oo4m/QPWh+rK3TG9b+jLQt4W6zcbukO7JWa0QB/SH1iYn/GP3FlmQmt6
 Wq3nNq/PmV/3mUlKi5YRLVU3pI5DK8KiKa0eVG8IPKGe3gsc21N+y/wnvkRZnTqpp9StJibYoU2Sd
 8cWEhqJg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnlDS-0001Ra-Ti; Tue, 23 Jun 2020 15:52:07 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id F0C27306E5C;
 Tue, 23 Jun 2020 17:52:04 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id DF0EA234EBA5D; Tue, 23 Jun 2020 17:52:04 +0200 (CEST)
Date: Tue, 23 Jun 2020 17:52:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623155204.GO4817@hirez.programming.kicks-ass.net>
References: <20200623113007.GH31822@suse.de>
 <20200623114818.GD4817@hirez.programming.kicks-ass.net>
 <20200623120433.GB14101@suse.de>
 <20200623125201.GG4817@hirez.programming.kicks-ass.net>
 <20200623134003.GD14101@suse.de>
 <20200623135916.GI4817@hirez.programming.kicks-ass.net>
 <20200623145344.GA117543@hirez.programming.kicks-ass.net>
 <20200623145914.GF14101@suse.de>
 <20200623152326.GL4817@hirez.programming.kicks-ass.net>
 <56af2f70-a1c6-aa64-006e-23f2f3880887@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56af2f70-a1c6-aa64-006e-23f2f3880887@citrix.com>
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>, X86 ML <x86@kernel.org>
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

On Tue, Jun 23, 2020 at 04:39:26PM +0100, Andrew Cooper wrote:
> On 23/06/2020 16:23, Peter Zijlstra wrote:
> > On Tue, Jun 23, 2020 at 04:59:14PM +0200, Joerg Roedel wrote:

> >> Yes, this is a start, it doesn't cover the case where the NMI stack is
> >> in-between, so I think you need to walk down regs->sp too.
> > That shouldn't be possible with the current code, I think.
> 
> NMI; #MC; Anything which IRET but isn't fatal - #DB, or #BP from
> patching, #GP from *_safe(), etc; NMI
> 
> Sure its a corner case, but did you hear that IST is evil?

Isn't current #MC unconditionally fatal from kernel? But yes, I was
sorta aware people want that changed.

And yes, NMI can recurse, mostly on #BP and #PF. Like I wrote, its
broken vs #MC.

But Joerg was talking about IST recursion with NMI in the middle,
something like: #DB, NMI, #DB, and not already being fatal. This one in
particular is ruled out by #DB itself clearing DR7 (but NMI would also
do that).

> P.S. did you also hear that with Rowhammer, userspace has a nonzero
> quantity of control over generating #MC, depending on how ECC is
> configured on the platform.

Yes, excellent stuff.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
