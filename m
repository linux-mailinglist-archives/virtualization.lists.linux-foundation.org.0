Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D10205141
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 13:50:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4D7F186CBD;
	Tue, 23 Jun 2020 11:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9EdhynJi_Dmm; Tue, 23 Jun 2020 11:50:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B04A786D3C;
	Tue, 23 Jun 2020 11:50:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84232C016F;
	Tue, 23 Jun 2020 11:50:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0CBA7C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ECCC989494
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t8BjSjFgYpjl
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:50:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1E5398923C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aiVkeicD79xrHH2MDVHjdOtjMnN8FcgFYepOS8k0muE=; b=EDvXpjRwRiWz5VfLeVl7JzHg3f
 x4dHtqMUkLsONa0nUGU8wT3Ft9ryJmQ5THUfSCggkT3OzDNJlDqGXdOUBd+TRGH85/sOLi5lDHl9G
 lOV1OE1pxKcRl3T92sVXNqPNFTB7t3KsMUo98+uLsk+SlcUpsCQxejCEMg40knl3T2IkFX2bzXPeZ
 xnJ5wgAWm9Z7m2KkkmdtZJVdJOhzLBBBlYoCOoR3z4BH8prfDBy/FdcOzSpostBvsjevokivifqnF
 V32Tzv5H/+7uSj+u0LdpX8PXd9vugeJH8ciDz2WAGJbRGbYz2FDxDn1Ddqrf8P0/ml1+v+KoOoQKM
 QKuRBYlA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnhRQ-0002Cb-IP; Tue, 23 Jun 2020 11:50:16 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A0F95300F28;
 Tue, 23 Jun 2020 13:50:14 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 860502370F7D2; Tue, 23 Jun 2020 13:50:14 +0200 (CEST)
Date: Tue, 23 Jun 2020 13:50:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623115014.GE4817@hirez.programming.kicks-ass.net>
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200623094519.GF31822@suse.de>
 <20200623104559.GA4817@hirez.programming.kicks-ass.net>
 <20200623111107.GG31822@suse.de>
 <20200623111443.GC4817@hirez.programming.kicks-ass.net>
 <20200623114324.GA14101@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623114324.GA14101@suse.de>
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

On Tue, Jun 23, 2020 at 01:43:24PM +0200, Joerg Roedel wrote:
> On Tue, Jun 23, 2020 at 01:14:43PM +0200, Peter Zijlstra wrote:
> > On Tue, Jun 23, 2020 at 01:11:07PM +0200, Joerg Roedel wrote:
> 
> > > The v3 patchset implements an unconditional shift of the #VC IST entry
> > > in the NMI handler, before it can trigger a #VC exception.
> > 
> > Going by that other thread -- where you said that any memory access can
> > trigger a #VC, there just isn't such a guarantee.
> 
> As I wrote in the other mail, this can only happen when SNP gets enabled
> (which is follow-on work to this) and is handled by a stack recursion
> check in the #VC handler.
> 
> The reason I mentioned the #VC-anywhere case is to make it more clear
> why #VC needs an IST handler.

If SNP is the sole reason #VC needs to be IST, then I'd strongly urge
you to only make it IST if/when you try and make SNP happen, not before.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
