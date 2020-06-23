Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AC020512A
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 13:48:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A628086C3B;
	Tue, 23 Jun 2020 11:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4etBjomqJ2ht; Tue, 23 Jun 2020 11:48:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3194E86BBD;
	Tue, 23 Jun 2020 11:48:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 181D8C016F;
	Tue, 23 Jun 2020 11:48:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7C5FC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B3A1486BBD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wl2n73oXBcQa
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:48:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A2CF984628
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jDPd8VkI8efCBcrOsnIHTnPuv2t1otNb8V/eq4wKFwo=; b=YZPRv33A9sygKFDGs9Y3X0oRsV
 vmYCaQC9/Kvjb6UQCZbskfYgSjkfL5ugrXGLpOXC+8OUdEV+XucaC3EHCUJ3BFUItgxiMgd+WaYso
 n10PDALn2CiVFgXkQ29oaZeXF9QqcC2ueTT/fPIitlLBsf8EITO9OTrIZgnx8koACzNASxCLk2aF5
 4agvl2fBbWKp/npms27JBSbSUpCEqLE5XhWYsGO+7kTvz2VB/3Tvgf8Rr7K+0gggkPNlkxmiw8AOf
 F05IE/gKqYYe62LnniblDoyzqm0phobGbKZNM3Fp09sWJxuJXMf2asDF2J7Dq/Zdvof8nFPNflCJ+
 ievLNt7g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnhPY-00082L-3n; Tue, 23 Jun 2020 11:48:20 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E2E77303DA0;
 Tue, 23 Jun 2020 13:48:18 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D65CB2370FA3D; Tue, 23 Jun 2020 13:48:18 +0200 (CEST)
Date: Tue, 23 Jun 2020 13:48:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623114818.GD4817@hirez.programming.kicks-ass.net>
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200428075512.GP30814@suse.de>
 <20200623110706.GB4817@hirez.programming.kicks-ass.net>
 <20200623113007.GH31822@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623113007.GH31822@suse.de>
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

On Tue, Jun 23, 2020 at 01:30:07PM +0200, Joerg Roedel wrote:
> Note that this is an issue only with secure nested paging (SNP), which
> is not enabled yet with this patch-set. When it gets enabled a stack
> recursion check in the #VC handler is needed which panics the VM. That
> also fixes the #VC-in-early-NMI problem.

But you cannot do a recursion check in #VC, because the NMI can happen
on the first instruction of #VC, before we can increment our counter,
and then the #VC can happen on NMI because the IST stack is a goner, and
we're fscked again (or on a per-cpu variable we touch in our elaborate
NMI setup, etc..).

There is no way I can see SNP-#VC 'work'. The best I can come up with is
'mostly', but do you like your bridges/dikes/etc.. to be mostly ok? Or
do you want a guarantee they'll actually work?

I'll keep repeating this, x86_64 exceptions are a trainwreck, and IST in
specific is utter crap.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
