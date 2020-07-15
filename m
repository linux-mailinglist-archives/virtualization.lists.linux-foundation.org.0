Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A332209F6
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 12:27:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3043789230;
	Wed, 15 Jul 2020 10:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXq18dnV49fu; Wed, 15 Jul 2020 10:27:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7A41889222;
	Wed, 15 Jul 2020 10:27:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52EB3C08A9;
	Wed, 15 Jul 2020 10:27:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67DBBC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 629098AF9B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t9KVQn-uhJfV
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:26:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 46BDE8AFAA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:26:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69727B1ED;
 Wed, 15 Jul 2020 10:26:59 +0000 (UTC)
Date: Wed, 15 Jul 2020 12:26:53 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v4 45/75] x86/sev-es: Adjust #VC IST Stack on entering
 NMI handler
Message-ID: <20200715102653.GN16200@suse.de>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-46-joro@8bytes.org>
 <20200715094702.GF10769@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715094702.GF10769@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, Jul 15, 2020 at 11:47:02AM +0200, Peter Zijlstra wrote:
> On Tue, Jul 14, 2020 at 02:08:47PM +0200, Joerg Roedel wrote:

> DECLARE_STATIC_KEY_FALSE(sev_es_enabled_key);
> 
> static __always_inline void sev_es_foo()
> {
> 	if (static_branch_unlikely(&sev_es_enabled_key))
> 		__sev_es_foo();
> }
> 
> So that normal people will only see an extra NOP?

Yes, that is a good idea, I will use a static key for these cases.

> > +static bool on_vc_stack(unsigned long sp)
> 
> noinstr or __always_inline

Will add __always_inline, thanks.

> > +/*
> > + * This function handles the case when an NMI or an NMI-like exception
> > + * like #DB is raised in the #VC exception handler entry code. In this
> 
> I've yet to find you handle the NMI-like cases..

The comment is not 100% accurate anymore, I will update it. Initially
#DB was an NMI-like case, but I figured that with .text.noinstr and the
way the #VC entry code switches stacks, there is no #DB special handling
necessary anymore.

> > + * case the IST entry for VC must be adjusted, so that any subsequent VC
> > + * exception will not overwrite the stack contents of the interrupted VC
> > + * handler.
> > + *
> > + * The IST entry is adjusted unconditionally so that it can be also be
> > + * unconditionally back-adjusted in sev_es_nmi_exit(). Otherwise a
> > + * nested nmi_exit() call (#VC->NMI->#DB) may back-adjust the IST entry
> > + * too early.
> 
> Is this comment accurate, I cannot find the patch touching
> nmi_enter/exit()?

Right, will update that too. I had the sev-es NMI stack adjustment in
nmi_enter/exit first, but needed to move it out because the possible DR7
access needs the #VC stack already adjusted.

> > + */
> > +void noinstr sev_es_ist_enter(struct pt_regs *regs)
> > +{
> > +	unsigned long old_ist, new_ist;
> > +	unsigned long *p;
> > +
> > +	if (!sev_es_active())
> > +		return;
> > +
> > +	/* Read old IST entry */
> > +	old_ist = __this_cpu_read(cpu_tss_rw.x86_tss.ist[IST_INDEX_VC]);
> > +
> > +	/* Make room on the IST stack */
> > +	if (on_vc_stack(regs->sp))
> > +		new_ist = ALIGN_DOWN(regs->sp, 8) - sizeof(old_ist);
> > +	else
> > +		new_ist = old_ist - sizeof(old_ist);
> > +
> > +	/* Store old IST entry */
> > +	p       = (unsigned long *)new_ist;
> > +	*p      = old_ist;
> > +
> > +	/* Set new IST entry */
> > +	this_cpu_write(cpu_tss_rw.x86_tss.ist[IST_INDEX_VC], new_ist);
> > +}
> > +
> > +void noinstr sev_es_ist_exit(void)
> > +{
> > +	unsigned long ist;
> > +	unsigned long *p;
> > +
> > +	if (!sev_es_active())
> > +		return;
> > +
> > +	/* Read IST entry */
> > +	ist = __this_cpu_read(cpu_tss_rw.x86_tss.ist[IST_INDEX_VC]);
> > +
> > +	if (WARN_ON(ist == __this_cpu_ist_top_va(VC)))
> > +		return;
> > +
> > +	/* Read back old IST entry and write it to the TSS */
> > +	p = (unsigned long *)ist;
> > +	this_cpu_write(cpu_tss_rw.x86_tss.ist[IST_INDEX_VC], *p);
> > +}
> 
> That's pretty disguisting :-(

Yeah, but its needed because ... IST :(
I am open for suggestions on how to make it less disgusting. Or maybe
you like it more if you think of it as a software implementation of what
hardware should actually do to make IST less painful.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
