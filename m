Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0D6205626
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 17:39:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2835F86E64;
	Tue, 23 Jun 2020 15:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zWF4OscO2PJi; Tue, 23 Jun 2020 15:39:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BCF3C86F6A;
	Tue, 23 Jun 2020 15:39:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9A91C016F;
	Tue, 23 Jun 2020 15:39:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 076A2C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EA1A486E7E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:39:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ssrwLjemhawe
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:39:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 695A686E64
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:39:32 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: eiqxVBWKC88b1iIh5nTj/f7V8Jh2ethNUebZFkujWdRGxn9kUdey47KybRdBPzpPU3UaTmRUbu
 hhEzIKGB0mKgn/ZmC+NiJ8ZJHLfOksnJ/vSslBnIPYj9seYdLRSUz7dZQO5BZc0yl6bA4IjueI
 bn/dF7MfxrIDT5AJWZamzmm2rM+4+z+TgKWNEpAvbpz8sL4gjqSGcJ87E0t/npmOhY35o2I+VS
 bM3rkhL4sTcknZFOm6T2ilmQIhGnWQVAsmrT/yXfdhHaHKXse6ioUbmCYLyCKwuA42B/Hhy1WM
 Epo=
X-SBRS: 2.7
X-MesageID: 21039380
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,271,1589256000"; d="scan'208";a="21039380"
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
To: Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <jroedel@suse.de>
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
 <20200623152326.GL4817@hirez.programming.kicks-ass.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <56af2f70-a1c6-aa64-006e-23f2f3880887@citrix.com>
Date: Tue, 23 Jun 2020 16:39:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623152326.GL4817@hirez.programming.kicks-ass.net>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, X86 ML <x86@kernel.org>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>, Dave
 Hansen <dave.hansen@intel.com>, Andy Lutomirski <luto@kernel.org>,
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

On 23/06/2020 16:23, Peter Zijlstra wrote:
> On Tue, Jun 23, 2020 at 04:59:14PM +0200, Joerg Roedel wrote:
>> On Tue, Jun 23, 2020 at 04:53:44PM +0200, Peter Zijlstra wrote:
>>> +noinstr void idtentry_validate_ist(struct pt_regs *regs)
>>> +{
>>> +	if ((regs->sp & ~(EXCEPTION_STKSZ-1)) ==
>>> +	    (_RET_IP_ & ~(EXCEPTION_STKSZ-1)))
>>> +		die("IST stack recursion", regs, 0);
>>> +}
>> Yes, this is a start, it doesn't cover the case where the NMI stack is
>> in-between, so I think you need to walk down regs->sp too.
> That shouldn't be possible with the current code, I think.

NMI; #MC; Anything which IRET but isn't fatal - #DB, or #BP from
patching, #GP from *_safe(), etc; NMI

Sure its a corner case, but did you hear that IST is evil?

~Andrew

P.S. did you also hear that with Rowhammer, userspace has a nonzero
quantity of control over generating #MC, depending on how ECC is
configured on the platform.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
