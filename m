Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8F62055BB
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 17:23:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2CB5626633;
	Tue, 23 Jun 2020 15:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oWmx2povDalo; Tue, 23 Jun 2020 15:23:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 18F6424F78;
	Tue, 23 Jun 2020 15:23:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFA10C016F;
	Tue, 23 Jun 2020 15:23:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BF62C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 979AC87647
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:23:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id voH6b7pH_WDk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:23:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0091887646
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=67GmQHoj5zNuUwz09OSjiIC4O8VKYFdYpYZwr4wExTc=; b=HKSxQszno971bP/TsveUX1OfYN
 w+iddIX3Sb92BzDuh9mM+TMd424oct3epZCyddn8xYMXBq2wYT92dhpKJLqXjKVgS3b3qyGyC7HE1
 jdNWFF+LsxwRamTTgoCMYmptuxP9dIkgdc/piRBGfC0z2EXgQMlfYqjVz6SF9uCFAa+PNY0Q7pUpD
 y8qIHKn8jwZGsl/4ZFkT95KFdxCd8HuPbP+IODLDl0y6amInT0EYw1+XAoCGUScP3zwAF8GJHOsTG
 H4vzhX9bOmnERkNENcGq2LrO6Sv/s7921BB80kd93Wfg931RZpLLOKf5q/hf20joXKq/9UM9Q4ebC
 2UsjCpJg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnklk-00037n-BU; Tue, 23 Jun 2020 15:23:28 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AC38A303DA0;
 Tue, 23 Jun 2020 17:23:26 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 9AB3C234EBA53; Tue, 23 Jun 2020 17:23:26 +0200 (CEST)
Date: Tue, 23 Jun 2020 17:23:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623152326.GL4817@hirez.programming.kicks-ass.net>
References: <20200428075512.GP30814@suse.de>
 <20200623110706.GB4817@hirez.programming.kicks-ass.net>
 <20200623113007.GH31822@suse.de>
 <20200623114818.GD4817@hirez.programming.kicks-ass.net>
 <20200623120433.GB14101@suse.de>
 <20200623125201.GG4817@hirez.programming.kicks-ass.net>
 <20200623134003.GD14101@suse.de>
 <20200623135916.GI4817@hirez.programming.kicks-ass.net>
 <20200623145344.GA117543@hirez.programming.kicks-ass.net>
 <20200623145914.GF14101@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623145914.GF14101@suse.de>
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

On Tue, Jun 23, 2020 at 04:59:14PM +0200, Joerg Roedel wrote:
> On Tue, Jun 23, 2020 at 04:53:44PM +0200, Peter Zijlstra wrote:
> > +noinstr void idtentry_validate_ist(struct pt_regs *regs)
> > +{
> > +	if ((regs->sp & ~(EXCEPTION_STKSZ-1)) ==
> > +	    (_RET_IP_ & ~(EXCEPTION_STKSZ-1)))
> > +		die("IST stack recursion", regs, 0);
> > +}
> 
> Yes, this is a start, it doesn't cover the case where the NMI stack is
> in-between, so I think you need to walk down regs->sp too.

That shouldn't be possible with the current code, I think.

> The dumpstack code already has some logic for this.

Reliability of that depends on the unwinder, I wouldn't want the guess
uwinder to OOPS me by accident.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
