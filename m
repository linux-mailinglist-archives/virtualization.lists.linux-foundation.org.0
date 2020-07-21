Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCB0227EA6
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 13:20:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B49E489458;
	Tue, 21 Jul 2020 11:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nmWlq6NyiGHR; Tue, 21 Jul 2020 11:20:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EABE489451;
	Tue, 21 Jul 2020 11:20:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9136C08A6;
	Tue, 21 Jul 2020 11:20:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EAF7C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 11:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6513A89212
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 11:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNVAnSyTGg0T
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 11:20:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 05ED189445
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 11:20:19 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s10so20759582wrw.12
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 04:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=cgE7yCvC2TsM3N9RxN0ivNvrTATSLMzpTj/dTB9AGDk=;
 b=mu8Irwtky5HM+EiEeEeJR5ujsfvK+4dRAQRaaVcc7HsqkvVK5OdZ66y3jHwGTwX8Cu
 zczEMY4FPKkfMJPyqoq/zEQTDqVrWHiKq35CWL+NseYxjRUXqM17lsfcA3S2fUbacz4F
 paoMeJ2RbHu5MMFCr9bSA1dbKVqhP5CQFlBIRXxKK2DBfodI5dmWrdix02VwYwBLvq7Y
 TftEIFzy6Oqpsf3KxqPjswQGUu4zx2fkccY9iW9azevcnJDENK3yYmxXnT8KmtHnkU+O
 QAlb9uxvjbo6Lx3o/O/kQVN+N4n65xMKivLjHruWEFxL5BOP2ogapw3UZF/MG5dgU8Tv
 2Uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=cgE7yCvC2TsM3N9RxN0ivNvrTATSLMzpTj/dTB9AGDk=;
 b=GCpBXCrSzql7IVNDbLOWysju4zHDkEXJLEA6Zh1tIyYPL5mEbr5D/QtlXP2qcFYoBt
 /oQCdFBCL5j6yOmLCxqeZdb5UUZQccgcg9xswFlMW+0kFC0RuAhqd/YbD7PRVxbXc5oE
 NxYt93N3CLm/E+QBxqFDOxNv1uicJvWrfL4vYc5RpazWYH0okkRzOGnsJ8GT9LVPRha2
 aMLeLToSPK3PmXaXcm0vLiGMEcWJw+MizJBgomaerWjJEC5FSthYIDtJr3AL0H99qrDY
 +O0rJlWumNOpgBxRQe2Hp8bkkuQROTuPmeq76x1VgVRl8dePT8QabK/w/diH1rW3ubxy
 FS0g==
X-Gm-Message-State: AOAM5322Y7LNhhoi7TiP0qjilVKN6IeNtMIchbD8xpUnE/Q1BcOvKIol
 K/HGLJqK7Dm3KthXpp6MyTU=
X-Google-Smtp-Source: ABdhPJwmCaJOo8AdzQqS2eChCE+7XLE3Au1lXisG7/a/kYL/4vC9x9VNW5OotawEVy00sIUB49kphA==
X-Received: by 2002:adf:de12:: with SMTP id b18mr28232045wrm.390.1595330417294; 
 Tue, 21 Jul 2020 04:20:17 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id c188sm3106579wma.22.2020.07.21.04.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 04:20:16 -0700 (PDT)
Date: Tue, 21 Jul 2020 21:20:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
To: Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <20200708084106.GE597537@hirez.programming.kicks-ass.net>
 <a9834278-25bf-90e9-10f2-cd10e5407ff6@redhat.com>
 <20200709083113.GI597537@hirez.programming.kicks-ass.net>
In-Reply-To: <20200709083113.GI597537@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1595329799.y24rka8cv4.astroid@bobo.none>
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Anton Blanchard <anton@ozlabs.org>,
 linuxppc-dev@lists.ozlabs.org
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

Excerpts from Peter Zijlstra's message of July 9, 2020 6:31 pm:
> On Wed, Jul 08, 2020 at 07:54:34PM -0400, Waiman Long wrote:
>> On 7/8/20 4:41 AM, Peter Zijlstra wrote:
>> > On Tue, Jul 07, 2020 at 03:57:06PM +1000, Nicholas Piggin wrote:
>> > > Yes, powerpc could certainly get more performance out of the slow
>> > > paths, and then there are a few parameters to tune.
>> > Can you clarify? The slow path is already in use on ARM64 which is weak,
>> > so I doubt there's superfluous serialization present. And Will spend a
>> > fair amount of time on making that thing guarantee forward progressm, so
>> > there just isn't too much room to play.
>> > 
>> > > We don't have a good alternate patching for function calls yet, but
>> > > that would be something to do for native vs pv.
>> > Going by your jump_label implementation, support for static_call should
>> > be fairly straight forward too, no?
>> > 
>> >    https://lkml.kernel.org/r/20200624153024.794671356@infradead.org
>> > 
>> Speaking of static_call, I am also looking forward to it. Do you have an
>> idea when that will be merged?
> 
> 0day had one crash on the last round, I think Steve send a fix for that
> last night and I'll go look at it.
> 
> That said, the last posting got 0 feedback, so either everybody is
> really happy with it, or not interested. So let us know in the thread,
> with some review feedback.
> 
> Once I get through enough of the inbox to actually find the fix and test
> it, I'll also update the thread, and maybe threaten to merge it if
> everybody stays silent :-)

I'd like to use it in powerpc. We have code now for example that patches 
a branch immediately at the top of memcpy which branches to a different 
version of the function. pv queued spinlock selection obviously, and
there's a bunch of platform ops struct things that get filled in at boot 
time, etc.

So +1 here if you can get them through. I'm not 100% sure we can do
it with existing toolchain and no ugly hacks, but there's no way to
structure things that can get around that AFAIKS. We'd eventually
use it though, I'd say.

Thanks,
Nick
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
