Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F11D205B35
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 20:56:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DB93589939;
	Tue, 23 Jun 2020 18:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wABKTD0zpWGh; Tue, 23 Jun 2020 18:56:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 39E38896F1;
	Tue, 23 Jun 2020 18:56:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BB0AC016F;
	Tue, 23 Jun 2020 18:56:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DC99C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 18:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0456388F16
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 18:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r13ckVdNR9Fi
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 18:56:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5B261878DB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 18:56:09 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HZoyfT2vf33w1z9W96Q31xxyjCAMO0xw8TBy2gZTBDmoSy1MZFeXrch2n1spl+f6E/NmTrtxwS
 k5iP7kQ8cuLxbbU/vnhwv+jjfEP+J4H7JT9PoWyzn9SMW32au21uissWCgPFMqewyZ+dmLcQmm
 xToOXokdpxYtZvL+C7DQ2JGvzLImSCiT/rWn4+gqqkVjcrBkNDR1toDJYNrOUlwscUAo3zkcWF
 YwCzwu7QTuQSrF+xGeJofhf4ROYfqp3oP8mmvifiIBd7DBn9hUnF0i5LHE+uR6dxKq+LyfjgFx
 fo8=
X-SBRS: 2.7
X-MesageID: 20764232
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,272,1589256000"; d="scan'208";a="20764232"
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
To: Andy Lutomirski <luto@kernel.org>
References: <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200623094519.GF31822@suse.de>
 <20200623104559.GA4817@hirez.programming.kicks-ass.net>
 <20200623111107.GG31822@suse.de>
 <20200623111443.GC4817@hirez.programming.kicks-ass.net>
 <20200623114324.GA14101@suse.de>
 <20200623115014.GE4817@hirez.programming.kicks-ass.net>
 <20200623121237.GC14101@suse.de>
 <20200623130322.GH4817@hirez.programming.kicks-ass.net>
 <9e3f9b2a-505e-dfd7-c936-461227b4033e@citrix.com>
 <CALCETrWEUXU_BYd5ypF3XC10hSQUJ=XCVz40n3VfcWELS+roTg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7a7c6e7c-8450-3785-035a-197be9268b70@citrix.com>
Date: Tue, 23 Jun 2020 19:56:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CALCETrWEUXU_BYd5ypF3XC10hSQUJ=XCVz40n3VfcWELS+roTg@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Cc: Juergen Gross <JGross@suse.com>, Tom
 Lendacky <Thomas.Lendacky@amd.com>, Thomas Hellstrom <thellstrom@vmware.com>,
 Joerg Roedel <jroedel@suse.de>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm list <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Dan
 Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>,
 X86 ML <x86@kernel.org>
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

On 23/06/2020 19:26, Andy Lutomirski wrote:
> On Tue, Jun 23, 2020 at 8:23 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 23/06/2020 14:03, Peter Zijlstra wrote:
>>> On Tue, Jun 23, 2020 at 02:12:37PM +0200, Joerg Roedel wrote:
>>>> On Tue, Jun 23, 2020 at 01:50:14PM +0200, Peter Zijlstra wrote:
>>>>> If SNP is the sole reason #VC needs to be IST, then I'd strongly urge
>>>>> you to only make it IST if/when you try and make SNP happen, not before.
>>>> It is not the only reason, when ES guests gain debug register support
>>>> then #VC also needs to be IST, because #DB can be promoted into #VC
>>>> then, and as #DB is IST for a reason, #VC needs to be too.
>>> Didn't I read somewhere that that is only so for Rome/Naples but not for
>>> the later chips (Milan) which have #DB pass-through?
>> I don't know about hardware timelines, but some future part can now opt
>> in to having debug registers as part of the encrypted state, and swapped
>> by VMExit, which would make debug facilities generally usable, and
>> supposedly safe to the #DB infinite loop issues, at which point the
>> hypervisor need not intercept #DB for safety reasons.
>>
>> Its worth nothing that on current parts, the hypervisor can set up debug
>> facilities on behalf of the guest (or behind its back) as the DR state
>> is unencrypted, but that attempting to intercept #DB will redirect to
>> #VC inside the guest and cause fun. (Also spare a thought for 32bit
>> kernels which have to cope with userspace singlestepping the SYSENTER
>> path with every #DB turning into #VC.)
> What do you mean 32-bit?  64-bit kernels have exactly the same
> problem.  At least the stack is okay, though.

:)

AMD-like CPUs disallow SYSENTER/SYSEXIT in Long Mode, and raise #UD,
even from a compatibility mode segment.

64bit kernels only have this problem on Intel-like CPUs.

(It is a massive shame that between everyone's attempts, there are 0
"fast system call" instructions with sane semantics, but it is several
decades late to fix this problem...)

~Andrew
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
