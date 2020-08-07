Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5C823EA4D
	for <lists.virtualization@lfdr.de>; Fri,  7 Aug 2020 11:24:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4E73D253D4;
	Fri,  7 Aug 2020 09:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4xcEiYXTTGf; Fri,  7 Aug 2020 09:24:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EC5A620481;
	Fri,  7 Aug 2020 09:24:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA622C004C;
	Fri,  7 Aug 2020 09:24:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AA38C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 09:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 236EC885FC
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 09:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O6kW+0zGyP4u
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 09:24:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EA1658861A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 09:24:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5CA28AC55;
 Fri,  7 Aug 2020 09:24:45 +0000 (UTC)
Subject: Re: [PATCH] x86/paravirt: Add missing noinstr to arch_local*() helpers
To: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>
References: <0000000000007d3b2d05ac1c303e@google.com>
 <20200805132629.GA87338@elver.google.com>
 <20200805134232.GR2674@hirez.programming.kicks-ass.net>
 <20200805135940.GA156343@elver.google.com>
 <20200805141237.GS2674@hirez.programming.kicks-ass.net>
 <20200805141709.GD35926@hirez.programming.kicks-ass.net>
 <CANpmjNN6FWZ+MsAn3Pj+WEez97diHzqF8hjONtHG15C2gSpSgw@mail.gmail.com>
 <CANpmjNNy3XKQqgrjGPPKKvXhAoF=mae7dk8hmoS4k4oNnnB=KA@mail.gmail.com>
 <20200806074723.GA2364872@elver.google.com>
 <20200806113236.GZ2674@hirez.programming.kicks-ass.net>
 <20200806131702.GA3029162@elver.google.com>
 <CANpmjNNqt8YrCad4WqgCoXvH47pRXtSLpnTKhD8W8+UpoYJ+jQ@mail.gmail.com>
 <CANpmjNO860SHpNve+vaoAOgarU1SWy8o--tUWCqNhn82OLCiew@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fe2bfa7f-132f-7581-a967-d01d58be1588@suse.com>
Date: Fri, 7 Aug 2020 11:24:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANpmjNO860SHpNve+vaoAOgarU1SWy8o--tUWCqNhn82OLCiew@mail.gmail.com>
Content-Language: en-US
Cc: syzbot <syzbot+8db9e1ecde74e590a657@syzkaller.appspotmail.com>,
 fenghua.yu@intel.com, yu-cheng.yu@intel.com, "Luck,
 Tony" <tony.luck@intel.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 the arch/x86 maintainers <x86@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 07.08.20 11:01, Marco Elver wrote:
> On Thu, 6 Aug 2020 at 18:06, Marco Elver <elver@google.com> wrote:
>> On Thu, 6 Aug 2020 at 15:17, Marco Elver <elver@google.com> wrote:
>>> On Thu, Aug 06, 2020 at 01:32PM +0200, peterz@infradead.org wrote:
>>>> On Thu, Aug 06, 2020 at 09:47:23AM +0200, Marco Elver wrote:
>>>>> Testing my hypothesis that raw then nested non-raw
>>>>> local_irq_save/restore() breaks IRQ state tracking -- see the reproducer
>>>>> below. This is at least 1 case I can think of that we're bound to hit.
>>> ...
>>>>
>>>> /me goes ponder things...
>>>>
>>>> How's something like this then?
>>>>
>>>> ---
>>>>   include/linux/sched.h |  3 ---
>>>>   kernel/kcsan/core.c   | 62 ++++++++++++++++++++++++++++++++++++---------------
>>>>   2 files changed, 44 insertions(+), 21 deletions(-)
>>>
>>> Thank you! That approach seems to pass syzbot (also with
>>> CONFIG_PARAVIRT) and kcsan-test tests.
>>>
>>> I had to modify it some, so that report.c's use of the restore logic
>>> works and not mess up the IRQ trace printed on KCSAN reports (with
>>> CONFIG_KCSAN_VERBOSE).
>>>
>>> I still need to fully convince myself all is well now and we don't end
>>> up with more fixes. :-) If it passes further testing, I'll send it as a
>>> real patch (I want to add you as Co-developed-by, but would need your
>>> Signed-off-by for the code you pasted, I think.)
> 
> I let it run on syzbot through the night, and it's fine without
> PARAVIRT (see below). I have sent the patch (need your Signed-off-by
> as it's based on your code, thank you!):
> https://lkml.kernel.org/r/20200807090031.3506555-1-elver@google.com
> 
>> With CONFIG_PARAVIRT=y (without the notrace->noinstr patch), I still
>> get lockdep DEBUG_LOCKS_WARN_ON(!lockdep_hardirqs_enabled()), although
>> it takes longer for syzbot to hit them. But I think that's expected
>> because we can still get the recursion that I pointed out, and will
>> need that patch.
> 
> Never mind, I get these warnings even if I don't turn on KCSAN
> (CONFIG_KCSAN=n). Something else is going on with PARAVIRT=y that
> throws off IRQ state tracking. :-/

What are the settings of CONFIG_PARAVIRT_XXL and
CONFIG_PARAVIRT_SPINLOCKS in this case?


Juergen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
