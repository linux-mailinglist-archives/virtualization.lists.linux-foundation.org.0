Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0AE21660F
	for <lists.virtualization@lfdr.de>; Tue,  7 Jul 2020 07:57:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 60F44894E7;
	Tue,  7 Jul 2020 05:57:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IQjqwG+SDTT; Tue,  7 Jul 2020 05:57:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BB69C89525;
	Tue,  7 Jul 2020 05:57:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96853C016F;
	Tue,  7 Jul 2020 05:57:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCC5EC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 05:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B7CB789525
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 05:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mIxdgwcwHATj
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 05:57:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EDDF3894E7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 05:57:11 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id t11so13103690pfq.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Jul 2020 22:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=I7ns89tYStKSD19MEHznyG2I9XSfuUkGKtpU/r5MMac=;
 b=PDoHvPLxNl6TaF6PxvEjhtHK8f4JDz/IfWer/E1UJubzsbNLxzT7qZt1VpGsjA5ZKf
 eNpJQ995yfHQzT7jv59geBsJ6xN1reEX4Bk0eQRaZP89L0yz7bhxQfhv8pmhq0Von0oW
 f7KUtjSv/p+roRH7gJm10UCz5d32YK4AdVoNfDi4gc7MgSjHxrWGt6oI4s4qFEfNnW1Z
 dDzbVG7MfDKvZs5afxztEsaDNlwmiN96s4+aPiTnfI5w16SKqSCJAG58cbc/MEe5roCM
 pL98oqdNzB6kMRypLiGnKY8LcS8OP2a/Y2pvipFvK4GX73hdO99Jcq99JWm8Mp7mY12i
 gnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=I7ns89tYStKSD19MEHznyG2I9XSfuUkGKtpU/r5MMac=;
 b=CIbQ3pBfhNzxN85shTAljQbgQaZzC3BfNZb5vMQw/dc9qqG/THVDEWw8FGOUtXdIDj
 t1/S0uMqy/Xj+Qu5aTHPeFwFpXre+PlC1vZs/yU/KxsqdMejsyzNxGCD9VfH+taYn5PI
 kz1CEQqYzXj/ELzTsIGqOlZJ93ywW9z/DSKYL4wfp0kktkSlh4bD80tP1cVlG3DzBsUQ
 OOFdpG78GQqpIo8YEyrMxZyfrU3CrDKDdzZ11q0dHG78OLVzn8CYFsPLRqhkFbQ2nWy7
 rc2CpBlF2liZ5kAzEZwrcQkiyv3ajdTESykJX/dpVR+JgHj2gCjxpd0HBCyPQf+HWGG4
 VJDQ==
X-Gm-Message-State: AOAM533EoDcWuvdddkIODebzvIhOTTnNq6ykq9MSj1CrL9QhsrcmKghT
 8WcQ8wTpkrBMPwZBav5CF18=
X-Google-Smtp-Source: ABdhPJzgoP//jHra6cbNRfSfL58k0z7LGnKGSFV6r4z5xdDumbyO9o0SKdBgLzyJp/37ixgJbLb9wA==
X-Received: by 2002:a65:6246:: with SMTP id q6mr43272321pgv.133.1594101431561; 
 Mon, 06 Jul 2020 22:57:11 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id u74sm21211889pgc.58.2020.07.06.22.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 22:57:11 -0700 (PDT)
Date: Tue, 07 Jul 2020 15:57:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
To: linuxppc-dev@lists.ozlabs.org, Waiman Long <longman@redhat.com>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
In-Reply-To: <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
MIME-Version: 1.0
Message-Id: <1594101082.hfq9x5yact.astroid@bobo.none>
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Anton Blanchard <anton@ozlabs.org>,
 Will Deacon <will@kernel.org>
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

Excerpts from Waiman Long's message of July 7, 2020 4:39 am:
> On 7/6/20 12:35 AM, Nicholas Piggin wrote:
>> v3 is updated to use __pv_queued_spin_unlock, noticed by Waiman (thank you).
>>
>> Thanks,
>> Nick
>>
>> Nicholas Piggin (6):
>>    powerpc/powernv: must include hvcall.h to get PAPR defines
>>    powerpc/pseries: move some PAPR paravirt functions to their own file
>>    powerpc: move spinlock implementation to simple_spinlock
>>    powerpc/64s: implement queued spinlocks and rwlocks
>>    powerpc/pseries: implement paravirt qspinlocks for SPLPAR
>>    powerpc/qspinlock: optimised atomic_try_cmpxchg_lock that adds the
>>      lock hint
>>
>>   arch/powerpc/Kconfig                          |  13 +
>>   arch/powerpc/include/asm/Kbuild               |   2 +
>>   arch/powerpc/include/asm/atomic.h             |  28 ++
>>   arch/powerpc/include/asm/paravirt.h           |  89 +++++
>>   arch/powerpc/include/asm/qspinlock.h          |  91 ++++++
>>   arch/powerpc/include/asm/qspinlock_paravirt.h |   7 +
>>   arch/powerpc/include/asm/simple_spinlock.h    | 292 +++++++++++++++++
>>   .../include/asm/simple_spinlock_types.h       |  21 ++
>>   arch/powerpc/include/asm/spinlock.h           | 308 +-----------------
>>   arch/powerpc/include/asm/spinlock_types.h     |  17 +-
>>   arch/powerpc/lib/Makefile                     |   3 +
>>   arch/powerpc/lib/locks.c                      |  12 +-
>>   arch/powerpc/platforms/powernv/pci-ioda-tce.c |   1 +
>>   arch/powerpc/platforms/pseries/Kconfig        |   5 +
>>   arch/powerpc/platforms/pseries/setup.c        |   6 +-
>>   include/asm-generic/qspinlock.h               |   4 +
>>   16 files changed, 577 insertions(+), 322 deletions(-)
>>   create mode 100644 arch/powerpc/include/asm/paravirt.h
>>   create mode 100644 arch/powerpc/include/asm/qspinlock.h
>>   create mode 100644 arch/powerpc/include/asm/qspinlock_paravirt.h
>>   create mode 100644 arch/powerpc/include/asm/simple_spinlock.h
>>   create mode 100644 arch/powerpc/include/asm/simple_spinlock_types.h
>>
> This patch looks OK to me.

Thanks for reviewing and testing.

> I had run some microbenchmark on powerpc system with or w/o the patch.
> 
> On a 2-socket 160-thread SMT4 POWER9 system (not virtualized):
> 
> 5.8.0-rc4
> =========
> 
> Running locktest with spinlock [runtime = 10s, load = 1]
> Threads = 160, Min/Mean/Max = 77,665/90,153/106,895
> Threads = 160, Total Rate = 1,441,759 op/s; Percpu Rate = 9,011 op/s
> 
> Running locktest with rwlock [runtime = 10s, r% = 50%, load = 1]
> Threads = 160, Min/Mean/Max = 47,879/53,807/63,689
> Threads = 160, Total Rate = 860,192 op/s; Percpu Rate = 5,376 op/s
> 
> Running locktest with spinlock [runtime = 10s, load = 1]
> Threads = 80, Min/Mean/Max = 242,907/319,514/463,161
> Threads = 80, Total Rate = 2,555 kop/s; Percpu Rate = 32 kop/s
> 
> Running locktest with rwlock [runtime = 10s, r% = 50%, load = 1]
> Threads = 80, Min/Mean/Max = 146,161/187,474/259,270
> Threads = 80, Total Rate = 1,498 kop/s; Percpu Rate = 19 kop/s
> 
> Running locktest with spinlock [runtime = 10s, load = 1]
> Threads = 40, Min/Mean/Max = 646,639/1,000,817/1,455,205
> Threads = 40, Total Rate = 4,001 kop/s; Percpu Rate = 100 kop/s
> 
> Running locktest with rwlock [runtime = 10s, r% = 50%, load = 1]
> Threads = 40, Min/Mean/Max = 402,165/597,132/814,555
> Threads = 40, Total Rate = 2,388 kop/s; Percpu Rate = 60 kop/s
> 
> 5.8.0-rc4-qlock+
> ================
> 
> Running locktest with spinlock [runtime = 10s, load = 1]
> Threads = 160, Min/Mean/Max = 123,835/124,580/124,587
> Threads = 160, Total Rate = 1,992 kop/s; Percpu Rate = 12 kop/s
> 
> Running locktest with rwlock [runtime = 10s, r% = 50%, load = 1]
> Threads = 160, Min/Mean/Max = 254,210/264,714/276,784
> Threads = 160, Total Rate = 4,231 kop/s; Percpu Rate = 26 kop/s
> 
> Running locktest with spinlock [runtime = 10s, load = 1]
> Threads = 80, Min/Mean/Max = 599,715/603,397/603,450
> Threads = 80, Total Rate = 4,825 kop/s; Percpu Rate = 60 kop/s
> 
> Running locktest with rwlock [runtime = 10s, r% = 50%, load = 1]
> Threads = 80, Min/Mean/Max = 492,687/525,224/567,456
> Threads = 80, Total Rate = 4,199 kop/s; Percpu Rate = 52 kop/s
> 
> Running locktest with spinlock [runtime = 10s, load = 1]
> Threads = 40, Min/Mean/Max = 1,325,623/1,325,628/1,325,636
> Threads = 40, Total Rate = 5,299 kop/s; Percpu Rate = 132 kop/s
> 
> Running locktest with rwlock [runtime = 10s, r% = 50%, load = 1]
> Threads = 40, Min/Mean/Max = 1,249,731/1,292,977/1,342,815
> Threads = 40, Total Rate = 5,168 kop/s; Percpu Rate = 129 kop/s
> 
> On systems on large number of cpus, qspinlock lock is faster and more fair.
> 
> With some tuning, we may be able to squeeze out more performance.

Yes, powerpc could certainly get more performance out of the slow
paths, and then there are a few parameters to tune.

We don't have a good alternate patching for function calls yet, but
that would be something to do for native vs pv.

And then there seem to be one or two tunable parameters we could
experiment with.

The paravirt locks may need a bit more tuning. Some simple testing
under KVM shows we might be a bit slower in some cases. Whether this
is fairness or something else I'm not sure. The current simple pv
spinlock code can do a directed yield to the lock holder CPU, whereas 
the pv qspl here just does a general yield. I think we might actually
be able to change that to also support directed yield. Though I'm
not sure if this is actually the cause of the slowdown yet.

Thanks,
Nick
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
