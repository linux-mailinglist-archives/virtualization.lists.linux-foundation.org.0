Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8AD2056B5
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 18:02:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B6F9F88933;
	Tue, 23 Jun 2020 16:02:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Er2qNx8Php-U; Tue, 23 Jun 2020 16:02:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4CB90886E8;
	Tue, 23 Jun 2020 16:02:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2375DC016F;
	Tue, 23 Jun 2020 16:02:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75DF8C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 16:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5BFE686B1C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 16:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r4OwCMmHiei2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 16:02:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D05B9869B7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 16:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=inEENWPOzGzfsRSt470zS1Lo3/U6Y1WgM8bPuF0BE3s=; b=vklOthUx90OknmglN/7t1NkgIU
 79j+4BcR4TJlT6iVzTfl5fAzvw8vz6lmSM2iod8IG5T98bck5m/zrnJA5eoC9p9/WZOoBkl8UX9cs
 DCzlQrHW8ITqu9LbaQFujnXWFILM8OFw7X/Ss1id9S84yal9wiD/3Ixl9boAyaORr3j9v8qFA+nN9
 0ypvnZ+iJRvDZImoDygYw1SfKurZMzMTFtI7D11hXqDjhzvoGWbs1/jHW50SEU007OH3xepHIh8HI
 ecYAdfH3gwNp/D7FqX01M/3UVAgGjLytHd3q93sLHONiDntvqXvyCvG+EWmhHdYlcMwJd7jhGIEx6
 Jk/2RsgQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnlNJ-0003gH-8n; Tue, 23 Jun 2020 16:02:17 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 77B34300F28;
 Tue, 23 Jun 2020 18:02:15 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 652D6234EBA53; Tue, 23 Jun 2020 18:02:15 +0200 (CEST)
Date: Tue, 23 Jun 2020 18:02:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623160215.GP4817@hirez.programming.kicks-ass.net>
References: <20200623113007.GH31822@suse.de>
 <20200623114818.GD4817@hirez.programming.kicks-ass.net>
 <20200623120433.GB14101@suse.de>
 <20200623125201.GG4817@hirez.programming.kicks-ass.net>
 <20200623134003.GD14101@suse.de>
 <20200623135916.GI4817@hirez.programming.kicks-ass.net>
 <20200623145344.GA117543@hirez.programming.kicks-ass.net>
 <20200623145914.GF14101@suse.de>
 <20200623152326.GL4817@hirez.programming.kicks-ass.net>
 <20200623153855.GM14101@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623153855.GM14101@suse.de>
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

On Tue, Jun 23, 2020 at 05:38:55PM +0200, Joerg Roedel wrote:
> On Tue, Jun 23, 2020 at 05:23:26PM +0200, Peter Zijlstra wrote:

> > Reliability of that depends on the unwinder, I wouldn't want the guess
> > uwinder to OOPS me by accident.
> 
> It doesn't use the full unwinder, it just assumes that there is a
> pt_regs struct at the top of every kernel stack and walks through them
> until SP points to a user-space stack.
> 
> As long as the assumption that there is a pt_regs struct on top of every
> stack holds, this should be safe. The assumption might be wrong when an
> exception happens during SYSCALL/SYSENTER entry, when the return frame
> is not written by hardware.

The IRQ and SoftIRQ stacks don't have that I think. Only the task and
exception stacks.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
