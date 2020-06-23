Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DF0205040
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 13:15:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B1CC920450;
	Tue, 23 Jun 2020 11:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J-wZeisg7pcg; Tue, 23 Jun 2020 11:14:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AAA0E203ED;
	Tue, 23 Jun 2020 11:14:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BDD4C016F;
	Tue, 23 Jun 2020 11:14:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A51EC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 37B4088491
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ADqTuIIRIlN
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:14:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5549288399
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kbjAKWhzfgOj923ZSmk/+0La2WIuOqVntNXB3to3NaY=; b=xsXdYkCrqqHaG0/uNn9otnZ92O
 bQLlNydLgpYpRZ19BLNcTK51b7J6swMSOX2NKGX8Hy0bXAwxheGpBaivL2lF311orkcO5VSiZ7oxD
 OL8nBV4GZBkD2zuJ4wzQucOc4qbT2WIRLdws+iCHmAc78Ax3GgfArKXaDTmo5CSRLn4yoaDRxBr6i
 PMhRrAT3PLo+fp/Z6DY3wGLET4pisfFbcyBMjDvE+J2IkD8qPYM38ZgVlnMnoBbX22Wr8upCldDKq
 Og09chKT10e9T3DFlyzPLo8eOQVUPcwAHKeiia0mBkSiyxpwG8QvWNb7+VwWEKn0hC9alHDY009Kr
 /zssl0yA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jngt3-0008DI-3y; Tue, 23 Jun 2020 11:14:45 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6901730477A;
 Tue, 23 Jun 2020 13:14:43 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 55D892370FA07; Tue, 23 Jun 2020 13:14:43 +0200 (CEST)
Date: Tue, 23 Jun 2020 13:14:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623111443.GC4817@hirez.programming.kicks-ass.net>
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200623094519.GF31822@suse.de>
 <20200623104559.GA4817@hirez.programming.kicks-ass.net>
 <20200623111107.GG31822@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623111107.GG31822@suse.de>
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

On Tue, Jun 23, 2020 at 01:11:07PM +0200, Joerg Roedel wrote:
> Hi Peter,
> 
> On Tue, Jun 23, 2020 at 12:45:59PM +0200, Peter Zijlstra wrote:
> > On Tue, Jun 23, 2020 at 11:45:19AM +0200, Joerg Roedel wrote:
> > > Or maybe you have a better idea how to implement this, so I'd like to
> > > hear your opinion first before I spend too many days implementing
> > > something.
> > 
> > OK, excuse my ignorance, but I'm not seeing how that IST shifting
> > nonsense would've helped in the first place.
> > 
> > If I understand correctly the problem is:
> > 
> > 	<#VC>
> > 	  shift IST
> > 	  <NMI>
> > 	    ... does stuff
> > 	    <#VC> # again, safe because the shift
> > 
> > But what happens if you get the NMI before your IST adjustment?
> 
> The v3 patchset implements an unconditional shift of the #VC IST entry
> in the NMI handler, before it can trigger a #VC exception.

Going by that other thread -- where you said that any memory access can
trigger a #VC, there just isn't such a guarantee.

> > Either way around we get to fix this up in NMI (and any other IST
> > exception that can happen while in #VC, hello #MC). And more complexity
> > there is the very last thing we need :-(
> 
> Yes, in whatever way this gets implemented, it needs some fixup in the
> NMI handler. But that can happen in C code, so it does not make the
> assembly more complex, at least.
> 
> > There's no way you can fix up the IDT without getting an NMI first.
> 
> Not sure what you mean by this.

I was talking about the case where #VC would try and fix up its own IST.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
