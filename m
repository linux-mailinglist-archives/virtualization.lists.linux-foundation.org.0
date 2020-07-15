Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 300B222099B
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 12:13:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D63478AB93;
	Wed, 15 Jul 2020 10:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AahOBKQd+Zd0; Wed, 15 Jul 2020 10:13:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A8AE8AB9B;
	Wed, 15 Jul 2020 10:13:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 196B1C0733;
	Wed, 15 Jul 2020 10:13:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 248E5C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1D5992271F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VY97+PPCVpfT
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:13:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by silver.osuosl.org (Postfix) with ESMTPS id 36E43226FC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NxRs2Pm10c75mSdn1nbWIbzhX1JLNphOAFM5Lj4SR3I=; b=GROMyPHHWeTIOf3KDPDXNwa4WK
 R6jB4NQoMOAmc/Ypqc5rNl5Pduyjwh6S6W5xtWeB1GvVcDG7gBVHNrsHI07Fy10HjeGU1EqyxF+zI
 Z7L8hPzKZoU1b0QWe8WkKpAy6ZfvYtqAf3DyUQwQPZqm0uv9A1SGMWyXDeF+QNrUhxAIsFPw2Nh+o
 twcqqDM+ZmirX0VPrZzGJTUIikrkFR5aXJhLf+TIO5WLrmwYLK9BYjp6ehD9m9nQYLbJ7fVTwaBPo
 LRP06aNFPZzCjjGDsXB3PxXSBpJlBf7zUkc1XFb/bPNX44372SwUAz23oKL7tU2iPuwqYL2T/e7xC
 6T8FRkrA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvePY-0005R7-KE; Wed, 15 Jul 2020 10:13:12 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E910B300130;
 Wed, 15 Jul 2020 12:13:10 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D474020D27C63; Wed, 15 Jul 2020 12:13:10 +0200 (CEST)
Date: Wed, 15 Jul 2020 12:13:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v4 63/75] x86/sev-es: Handle #DB Events
Message-ID: <20200715101310.GJ10769@hirez.programming.kicks-ass.net>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-64-joro@8bytes.org>
 <20200715084752.GD10769@hirez.programming.kicks-ass.net>
 <20200715091337.GI16200@suse.de>
 <20200715095136.GG10769@hirez.programming.kicks-ass.net>
 <20200715100808.GL16200@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715100808.GL16200@suse.de>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Cfir Cohen <cfir@google.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
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

On Wed, Jul 15, 2020 at 12:08:08PM +0200, Joerg Roedel wrote:
> On Wed, Jul 15, 2020 at 11:51:36AM +0200, Peter Zijlstra wrote:
> > On Wed, Jul 15, 2020 at 11:13:37AM +0200, Joerg Roedel wrote:
> > > Then my understanding of intrumentation_begin/end() is wrong, I thought
> > > that the kernel will forbid setting breakpoints before
> > > instrumentation_begin(), which is necessary here because a break-point
> > > in the #VC handler might cause recursive #VC-exceptions when #DB is
> > > intercepted.
> > > Maybe you can elaborate on why this makes no sense?
> > 
> > Kernel avoids breakpoints in any noinstr text, irrespective of
> > instrumentation_begin().
> > 
> > instrumentation_begin() merely allows one to call !noinstr functions.
> 
> Right, but the handler calls into various other functions. I actually
> started to annotate them all with noinstr, but that was a can of worms
> when calling into generic kernel functions. And the only problem with
> intrumentation in the #VC handler is the #VC-for-#DB exit-code, so I
> decided to only handle this one with instrumentation forbidden and allow
> it for the rest of the handler.

OK, then maybe change the comment to something like:

 /*
  * Handle #DB before calling any !noinstr code to avoid
  * recursive #DB.
  */

?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
