Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2909F15AA7C
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 14:54:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D80C987BFE;
	Wed, 12 Feb 2020 13:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WgiZEfzJWMZh; Wed, 12 Feb 2020 13:54:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3D6FA87BEE;
	Wed, 12 Feb 2020 13:54:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23A14C0177;
	Wed, 12 Feb 2020 13:54:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E76EC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 743D6843BB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6oJLVGfshibb
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:54:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4789784042
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:54:50 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E433020E; Wed, 12 Feb 2020 14:54:47 +0100 (CET)
Date: Wed, 12 Feb 2020 14:54:36 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [RFC PATCH 00/62] Linux as SEV-ES Guest Support
Message-ID: <20200212135436.GJ20066@8bytes.org>
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211145008.GT14914@hirez.programming.kicks-ass.net>
 <20200211154321.GB22063@8bytes.org>
 <CALCETrUtvd0OuLoo=ZBRmaJRFxgFWV9hSZyHBwmWCs2+b4J-sg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrUtvd0OuLoo=ZBRmaJRFxgFWV9hSZyHBwmWCs2+b4J-sg@mail.gmail.com>
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

On Tue, Feb 11, 2020 at 02:12:04PM -0800, Andy Lutomirski wrote:
> On Tue, Feb 11, 2020 at 7:43 AM Joerg Roedel <joro@8bytes.org> wrote:
> >
> > On Tue, Feb 11, 2020 at 03:50:08PM +0100, Peter Zijlstra wrote:
> >
> > > Oh gawd; so instead of improving the whole NMI situation, AMD went and
> > > made it worse still ?!?
> >
> > Well, depends on how you want to see it. Under SEV-ES an IRET will not
> > re-open the NMI window, but the guest has to tell the hypervisor
> > explicitly when it is ready to receive new NMIs via the NMI_COMPLETE
> > message.  NMIs stay blocked even when an exception happens in the
> > handler, so this could also be seen as a (slight) improvement.
> >
> 
> I don't get it.  VT-x has a VMCS bit "Interruptibility
> state"."Blocking by NMI" that tracks the NMI masking state.  Would it
> have killed AMD to solve the problem they same way to retain
> architectural behavior inside a SEV-ES VM?

No, but it wouldn't solve the problem. Inside an NMI handler there could
be #VC exceptions, which do an IRET on their own. Hardware NMI state
tracking would re-enable NMIs when the #VC exception returns to the NMI
handler, which is not what every OS is comfortable with.

Yes, there are many ways to hack around this. The GHCB spec mentions the
single-stepping-over-IRET idea, which I also prototyped in a previous
version of this patch-set. I gave up on it when I discovered that NMIs
that happen when executing in kernel-mode but on entry stack will cause
the #VC handler to call into C code while on entry stack, because
neither paranoid_entry nor error_entry handle the
from-kernel-with-entry-strack case. This could of course also be fixed,
but further complicates things already complicated enough by the PTI
changes and nested-NMI support.

My patch for using the NMI_COMPLETE message is certainly not perfect and
needs changes, but having the message specified in the protocol gives
the guest the best flexibility in deciding when it is ready to receive
new NMIs, imho.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
