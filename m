Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 914CD205006
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 13:08:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0EF8F893BC;
	Tue, 23 Jun 2020 11:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7lao9wY+D2G; Tue, 23 Jun 2020 11:08:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5854C89236;
	Tue, 23 Jun 2020 11:08:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D92FC016F;
	Tue, 23 Jun 2020 11:08:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45581C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 310D188CA2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQTEqqVv-WjH
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:08:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 15CFA88B26
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=B1WPwb6BmprV17sdTfJbm9Oox9tpXpQcWcJkTgOLOpY=; b=LD2YZjbcst8zK+3aVeIV1Er8++
 Vty8JFIkh7rNw/YIQSSMUaA3vqu9Wr2kKwsX0WpCrzmvWsxNuyl9VlDW6HaWexE7PyqGNXvWx88Rp
 8GuhkgsNwkZZWiEWwSTmoBjvqUb1cun5wNfV33EOhtrb375BURVbR+wWqSvL3ygGNrN1uKtPmcRHD
 1PCEfMpdsDf5fFIBFs6da+HM6RP7uF8/Y8ACqYx/3MbIzKCL2klzrzuicid8RLoeDRAqiYTLVjpa2
 D3REhWmBtBa7hwKYjQ67LSjPGsAS55Hfx6D40LWfWkMbJlC9szoHTpaHK0QmQMA1hwNMhCfZ5KhN5
 oIlS+m+w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jngRH-0005eM-1o; Tue, 23 Jun 2020 10:46:03 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6F056303DA0;
 Tue, 23 Jun 2020 12:45:59 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 637212B7BB5F2; Tue, 23 Jun 2020 12:45:59 +0200 (CEST)
Date: Tue, 23 Jun 2020 12:45:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623104559.GA4817@hirez.programming.kicks-ass.net>
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200623094519.GF31822@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623094519.GF31822@suse.de>
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

On Tue, Jun 23, 2020 at 11:45:19AM +0200, Joerg Roedel wrote:
> Hi Andy,
> 
> On Mon, Apr 27, 2020 at 10:37:41AM -0700, Andy Lutomirski wrote:
> > 1. Use IST for #VC and deal with all the mess that entails.
> 
> With the removal of IST shifting I wonder what you would suggest on how
> to best implement an NMI-safe IST handler with nesting support.
> 
> My current plan is to implement an IST handler which switches itself off
> the IST stack as soon as possible, freeing it for re-use.
> 
> The flow would be roughly like this upon entering the handler;
> 
> 	build_pt_regs();
> 
> 	RSP = pt_regs->sp;
> 
> 	if (RSP in VC_IST_stack)
> 		error("unallowed nesting")
> 
> 	if (RSP in current_kernel_stack)
> 		RSP = round_down_to_8(RSP)
> 	else
> 		RSP = current_top_of_stack() // non-ist kernel stack
> 
> 	copy_pt_regs(pt_regs, RSP);
> 	switch_stack_to(RSP);
> 
> To make this NMI safe, the NMI handler needs some logic too. Upon
> entering NMI, it needs to check the return RSP, and if it is in the #VC
> IST stack, it must do the above flow by itself and update the return RSP
> and RIP. It needs to take into account the case when PT_REGS is not
> fully populated on the return side.
> 
> Alternativly the NMI handler could safe/restore the contents of the #VC
> IST stack or just switch to a special #VC-in-NMI IST stack.
> 
> All in all it could get complicated, and imho shift_ist would have been
> simpler, but who am I anyway...
> 
> Or maybe you have a better idea how to implement this, so I'd like to
> hear your opinion first before I spend too many days implementing
> something.

OK, excuse my ignorance, but I'm not seeing how that IST shifting
nonsense would've helped in the first place.

If I understand correctly the problem is:

	<#VC>
	  shift IST
	  <NMI>
	    ... does stuff
	    <#VC> # again, safe because the shift

But what happens if you get the NMI before your IST adjustment?

	<#VC>
	  <NMI>
	    ... does stuff
	    <#VC> # again, happily wrecks your earlier #VC
	  shift IST # whoopsy, too late

Either way around we get to fix this up in NMI (and any other IST
exception that can happen while in #VC, hello #MC). And more complexity
there is the very last thing we need :-(

There's no way you can fix up the IDT without getting an NMI first.

This entire exception model is fundamentally buggered :-/
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
