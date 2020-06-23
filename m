Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 632B7204E4E
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 11:45:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 12720888FC;
	Tue, 23 Jun 2020 09:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNOlLu-PV2er; Tue, 23 Jun 2020 09:45:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8104989128;
	Tue, 23 Jun 2020 09:45:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A208C016F;
	Tue, 23 Jun 2020 09:45:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87D78C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 09:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 68A4E20130
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 09:45:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVfpJ5-rC1hk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 09:45:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id C5C2B2012F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 09:45:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07763AE8C;
 Tue, 23 Jun 2020 09:45:22 +0000 (UTC)
Date: Tue, 23 Jun 2020 11:45:19 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623094519.GF31822@suse.de>
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, X86 ML <x86@kernel.org>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
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

On Mon, Apr 27, 2020 at 10:37:41AM -0700, Andy Lutomirski wrote:
> 1. Use IST for #VC and deal with all the mess that entails.

With the removal of IST shifting I wonder what you would suggest on how
to best implement an NMI-safe IST handler with nesting support.

My current plan is to implement an IST handler which switches itself off
the IST stack as soon as possible, freeing it for re-use.

The flow would be roughly like this upon entering the handler;

	build_pt_regs();

	RSP = pt_regs->sp;

	if (RSP in VC_IST_stack)
		error("unallowed nesting")

	if (RSP in current_kernel_stack)
		RSP = round_down_to_8(RSP)
	else
		RSP = current_top_of_stack() // non-ist kernel stack

	copy_pt_regs(pt_regs, RSP);
	switch_stack_to(RSP);

To make this NMI safe, the NMI handler needs some logic too. Upon
entering NMI, it needs to check the return RSP, and if it is in the #VC
IST stack, it must do the above flow by itself and update the return RSP
and RIP. It needs to take into account the case when PT_REGS is not
fully populated on the return side.

Alternativly the NMI handler could safe/restore the contents of the #VC
IST stack or just switch to a special #VC-in-NMI IST stack.

All in all it could get complicated, and imho shift_ist would have been
simpler, but who am I anyway...

Or maybe you have a better idea how to implement this, so I'd like to
hear your opinion first before I spend too many days implementing
something.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
