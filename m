Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 230DE389656
	for <lists.virtualization@lfdr.de>; Wed, 19 May 2021 21:13:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92E1E84315;
	Wed, 19 May 2021 19:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fsVzuHMdQ4un; Wed, 19 May 2021 19:13:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6394F84368;
	Wed, 19 May 2021 19:13:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E132FC0001;
	Wed, 19 May 2021 19:13:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0AE74C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 19:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3EAF40EAD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 19:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Vsfpt18ZUW4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 19:13:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22A5C40EC1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 19:13:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 88F15AFAB;
 Wed, 19 May 2021 19:13:10 +0000 (UTC)
Date: Wed, 19 May 2021 21:13:08 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 5/8] x86/sev-es: Leave NMI-mode before sending signals
Message-ID: <YKVjRJmva/Y2EHPZ@suse.de>
References: <20210519135251.30093-1-joro@8bytes.org>
 <20210519135251.30093-6-joro@8bytes.org>
 <20210519175450.GF21560@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519175450.GF21560@worktop.programming.kicks-ass.net>
Cc: kvm@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Kees Cook <keescook@chromium.org>,
 Cfir Cohen <cfir@google.com>, Hyunwook Baek <baekhw@google.com>,
 linux-coco@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Juergen Gross <jgross@suse.com>,
 Mike Stunes <mstunes@vmware.com>, Sean Christopherson <seanjc@google.com>,
 linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Erdem Aktas <erdemaktas@google.com>
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

Hi Peter,

thanks for your review.

On Wed, May 19, 2021 at 07:54:50PM +0200, Peter Zijlstra wrote:
> On Wed, May 19, 2021 at 03:52:48PM +0200, Joerg Roedel wrote:
> > --- a/arch/x86/kernel/sev.c
> > +++ b/arch/x86/kernel/sev.c
> > @@ -1343,9 +1343,10 @@ DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
> >  		return;
> >  	}
> >  
> > +	instrumentation_begin();
> > +
> >  	irq_state = irqentry_nmi_enter(regs);
> >  	lockdep_assert_irqs_disabled();
> > -	instrumentation_begin();
> >  
> >  	/*
> >  	 * This is invoked through an interrupt gate, so IRQs are disabled. The
> 
> That's just plain wrong. No instrumentation is allowed before you enter
> the exception context.

Okay.

> > +	irqentry_nmi_exit(regs, irq_state);
> > +
> 
> And this is wrong too; because at this point the handler doesn't run in
> _any_ context anymore, certainly not one you can call regular C code
> from.

The #VC handler is at this point not running on the IST stack anymore,
but on the stack it came from or on the task stack. So my believe was
that at this point it inherits the context it came from (just like the
page-fault handler). But I also don't fully understand the context
tracking, so is my assumption wrong?

Regards,

	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
