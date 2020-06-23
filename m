Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3C720561E
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 17:39:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BF23326426;
	Tue, 23 Jun 2020 15:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DFa3QzYypiQ7; Tue, 23 Jun 2020 15:39:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2860F26661;
	Tue, 23 Jun 2020 15:39:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0B61C016F;
	Tue, 23 Jun 2020 15:38:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C19E7C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BDDED88AAD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jo349L4mORqc
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:38:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 826AF8871A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MAuMHFTHX8XSOrS+3WRKmxA3YZs5uM2D2sS+hm8j/xA=; b=Q2V8keP0FVZG/TkiTzzDC4vKCj
 nyT6JjEu5SmZ8Er8y26AZbbgkMF9mKPNSmAFN9XQBQQqP4264ILIB06TlmxfjBabBTG6Y2NicjupJ
 BAvy12H7mmAKvaxjdM8ad7SRMIhiRvyFTnekaSC+rwLSzAbCO1mQIsrZv0+9Lhu5j6zkp2Z5mFONc
 80XN5GSP4bOB4TvlyRq0sWNQUFDHDDjo1FOAWItkimokCQlBzt2XZQqjItjtwZfxGzNt7fhwRQnH7
 WH9UsqHANKhP4VJ4ph07S4gcfxEvJIq24QXBhv7MbZI5g9K9eYwub4yRvwGPfCxi9NkA21uyFQjzH
 ocw5FYSg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnl0X-0008BI-L3; Tue, 23 Jun 2020 15:38:45 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8B35730477A;
 Tue, 23 Jun 2020 17:38:44 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 79859234EBA52; Tue, 23 Jun 2020 17:38:44 +0200 (CEST)
Date: Tue, 23 Jun 2020 17:38:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623153844.GN4817@hirez.programming.kicks-ass.net>
References: <20200623110706.GB4817@hirez.programming.kicks-ass.net>
 <20200623113007.GH31822@suse.de>
 <20200623114818.GD4817@hirez.programming.kicks-ass.net>
 <20200623120433.GB14101@suse.de>
 <20200623125201.GG4817@hirez.programming.kicks-ass.net>
 <20200623134003.GD14101@suse.de>
 <20200623135916.GI4817@hirez.programming.kicks-ass.net>
 <20200623145344.GA117543@hirez.programming.kicks-ass.net>
 <20200623145914.GF14101@suse.de>
 <20200623152326.GL4817@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623152326.GL4817@hirez.programming.kicks-ass.net>
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

On Tue, Jun 23, 2020 at 05:23:26PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 23, 2020 at 04:59:14PM +0200, Joerg Roedel wrote:
> > On Tue, Jun 23, 2020 at 04:53:44PM +0200, Peter Zijlstra wrote:
> > > +noinstr void idtentry_validate_ist(struct pt_regs *regs)
> > > +{
> > > +	if ((regs->sp & ~(EXCEPTION_STKSZ-1)) ==
> > > +	    (_RET_IP_ & ~(EXCEPTION_STKSZ-1)))
> > > +		die("IST stack recursion", regs, 0);
> > > +}
> > 
> > Yes, this is a start, it doesn't cover the case where the NMI stack is
> > in-between, so I think you need to walk down regs->sp too.
> 
> That shouldn't be possible with the current code, I think.

To clarify, we have: NMI, MCE, DB and DF.

DF (with the exception of ESPFIX) is fatal.
MCE from kernel is fatal (which is what makes the MCE in NMI 'work')
NMI and DB clear DR7, which avoids DB in NMI.

So that leaves: NMI in DB, and that works.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
