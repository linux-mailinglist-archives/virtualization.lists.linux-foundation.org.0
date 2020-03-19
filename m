Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F518BBE4
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 17:08:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F1603203CA;
	Thu, 19 Mar 2020 16:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcgMFzHvlm7O; Thu, 19 Mar 2020 16:07:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C0DC7231E9;
	Thu, 19 Mar 2020 16:07:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97D3FC07FF;
	Thu, 19 Mar 2020 16:07:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F9A5C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 16:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4B1CE230F6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 16:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcItvkABXHGV
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 16:07:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 12FE6203CA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 16:07:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 2F7C1217; Thu, 19 Mar 2020 17:07:51 +0100 (CET)
Date: Thu, 19 Mar 2020 17:07:49 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 70/70] x86/sev-es: Add NMI state tracking
Message-ID: <20200319160749.GC5122@8bytes.org>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-71-joro@8bytes.org>
 <CALCETrUOQneBHjoZkP-7T5PDijb=WOyv7xF7TD0GLR2Aw77vyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrUOQneBHjoZkP-7T5PDijb=WOyv7xF7TD0GLR2Aw77vyA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>
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

Hi Andy,

On Thu, Mar 19, 2020 at 08:35:59AM -0700, Andy Lutomirski wrote:
> On Thu, Mar 19, 2020 at 2:14 AM Joerg Roedel <joro@8bytes.org> wrote:
> >
> > From: Joerg Roedel <jroedel@suse.de>
> >
> > Keep NMI state in SEV-ES code so the kernel can re-enable NMIs for the
> > vCPU when it reaches IRET.
> 
> IIRC I suggested just re-enabling NMI in C from do_nmi().  What was
> wrong with that approach?

If I understand the code correctly a nested NMI will just reset the
interrupted NMI handler to start executing again at 'restart_nmi'.
The interrupted NMI handler could be in the #VC handler, and it is not
safe to just jump back to the start of the NMI handler from somewhere
within the #VC handler.

So I decided to not allow NMI nesting for SEV-ES and only re-enable the
NMI window when the first NMI returns. This is not implemented in this
patch, but I will do that once Thomas' entry-code rewrite is upstream.

> This causes us to pop the NMI frame off the stack.  Assuming the NMI
> restart logic is invoked (which is maybe impossible?), we get #DB,
> which presumably is actually delivered.  And we end up on the #DB
> stack, which might already have been in use, so we have a potential
> increase in nesting.  Also, #DB may be called from an unexpected
> context.

An SEV-ES hypervisor is required to intercept #DB, which means that the
#DB exception actually ends up being a #VC exception. So it will not end
up on the #DB stack.

> Now somehow #DB is supposed to invoke #VC, which is supposed to do the
> magic hypercall, and all of this is supposed to be safe?  Or is #DB
> unconditionally redirected to #VC?  What happens if we had no stack
> (e.g. we interrupted SYSCALL) or we were already in #VC to begin with?

Yeah, as I said above, the #DB is redirected to #VC, as the hypervisor
has to intercept #DB.

The stack-problem is the one that prevents the Single-step-over-iret
approach right now, because the NMI can hit while in kernel mode and on
entry stack, which the generic entry code (besided NMI) does not handle.
Getting a #VC exception there (like after an IRET to that state) breaks
things.

Last, in this version of the patch-set the #VC handler became
nesting-safe. It detects whether the per-cpu GHCB is in use and
safes/restores its contents in this case.


> I think there are two credible ways to approach this:
> 
> 1. Just put the NMI unmask in do_nmi().  The kernel *already* knows
> how to handle running do_nmi() with NMIs unmasked.  This is much, much
> simpler than your code.

Right, and I thought about that, but the implication is that the
complexity is moved somewhere else, namely into the #VC handler, which
then has to be restartable.

> 2. Have an entirely separate NMI path for the
> SEV-ES-on-misdesigned-CPU case.  And have very clear documentation for
> what prevents this code from being executed on future CPUs (Zen3?)
> that have this issue fixed for real?

That sounds like a good alternative, I will investigate this approach.
The NMI handler should be much simpler as it doesn't need to allow NMI
nesting. The question is, does the C code down the NMI path depend on
the NMI handlers stack frame layout (e.g. the in-nmi flag)?

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
