Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 028392052E0
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 14:52:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9208E87E71;
	Tue, 23 Jun 2020 12:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4BQG4eLttKPy; Tue, 23 Jun 2020 12:52:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EE3EC87E45;
	Tue, 23 Jun 2020 12:52:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3195C016F;
	Tue, 23 Jun 2020 12:52:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA3D0C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 12:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 95EF487D60
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 12:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHVXN46WgysZ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 12:52:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 070FA87D56
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 12:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LyGXCQbBjA1RL7EQ24/1+IBfI7cHxTXkkAPcsBmfZf4=; b=maQA3A/n4fXnwedsyFDIlCzshd
 3P/+FfPylnGfzbb/LR6DWp0V05k/lUCN+MHXRqb0xn1bSpQnEiUR4/ZLFReWYZoHAPugDh+gBnrrn
 Fam7mb61MDRG+GDY+s6D85u+S2yiGVQVuU0xht6f/6Dq2HmeIYGMaffZeXxcRT+OoeyKIHZkwb1yX
 gumYwQjenmsiuQhTvIa3ESIXCcRkMszYMcmm5rSRkvjblLzqFfUJezUFGPQkhiQKXmKLCpmbsrX9S
 XNkqILJIAAQIvhGB6fjzwcqinSZlgdIT2ON3w76tyiKcxteTqIKUjwErXAZAJ4o36Ygmelcn31Mi/
 DVr4iJcw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jniPE-0002Zz-Fj; Tue, 23 Jun 2020 12:52:04 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 13AEB300F28;
 Tue, 23 Jun 2020 14:52:02 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 04FE72370F7C3; Tue, 23 Jun 2020 14:52:02 +0200 (CEST)
Date: Tue, 23 Jun 2020 14:52:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623125201.GG4817@hirez.programming.kicks-ass.net>
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200428075512.GP30814@suse.de>
 <20200623110706.GB4817@hirez.programming.kicks-ass.net>
 <20200623113007.GH31822@suse.de>
 <20200623114818.GD4817@hirez.programming.kicks-ass.net>
 <20200623120433.GB14101@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623120433.GB14101@suse.de>
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, X86 ML <x86@kernel.org>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

On Tue, Jun 23, 2020 at 02:04:33PM +0200, Joerg Roedel wrote:
> On Tue, Jun 23, 2020 at 01:48:18PM +0200, Peter Zijlstra wrote:
> > On Tue, Jun 23, 2020 at 01:30:07PM +0200, Joerg Roedel wrote:
> 
> > But you cannot do a recursion check in #VC, because the NMI can happen
> > on the first instruction of #VC, before we can increment our counter,
> > and then the #VC can happen on NMI because the IST stack is a goner, and
> > we're fscked again (or on a per-cpu variable we touch in our elaborate
> > NMI setup, etc..).
> 
> No, the recursion check is fine, because overwriting an already used IST
> stack doesn't matter (as long as it can be detected) if we are going to
> panic anyway. It doesn't matter because the kernel will not leave the
> currently running handler anymore.

You only have that guarantee when any SNP #VC from kernel is an
automatic panic. But in that case, what's the point of having the
recursion count?

> > I'll keep repeating this, x86_64 exceptions are a trainwreck, and IST in
> > specific is utter crap.
> 
> I agree, but don't forget the most prominent underlying reason for IST:
> The SYSCALL gap. If SYSCALL would switch stacks most of those issues
> would not exist. IST would still be needed because there are no task
> gates in x86-64, but still...

We could all go back to int80 ;-) /me runs like heck
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
