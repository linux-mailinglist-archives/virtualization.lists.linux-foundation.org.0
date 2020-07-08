Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBEC21949D
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 01:50:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A0580204C0;
	Wed,  8 Jul 2020 23:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJ1DEipQubv4; Wed,  8 Jul 2020 23:50:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 787EE2050C;
	Wed,  8 Jul 2020 23:50:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66DB4C016F;
	Wed,  8 Jul 2020 23:50:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FACAC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 23:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8AD9B87E01
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 23:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSVCkSp4JyOH
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 23:50:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A68CC86BFE
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 23:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594252214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7a+U5YBzYfEsFsCMWL9LQvEdqafvJrKo9TGytXjXtNY=;
 b=eRFum40tEpxZLIdeFTAHQ9NJ+608fxIb7EkPgvWrYb3MxM3GjEZPwaaKHsjg+G4sGo0wQM
 9ktqoCjTprWNftOGLJRbQn5D75+bL+tFejK76XomE3rydV+PoC5r/sEr+d8Wbxmuhi63id
 byz31vwOUyA5VT1JuyDtq914TafYMoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-y7uP8t23P4WocJdbNKNi9g-1; Wed, 08 Jul 2020 19:50:12 -0400
X-MC-Unique: y7uP8t23P4WocJdbNKNi9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DD511085;
 Wed,  8 Jul 2020 23:50:10 +0000 (UTC)
Received: from llong.remote.csb (ovpn-116-205.rdu2.redhat.com [10.10.116.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B6FD60E3E;
 Wed,  8 Jul 2020 23:50:06 +0000 (UTC)
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <de3ead58-7f81-8ebd-754d-244f6be24af4@redhat.com>
 <1594184204.ncuq7vstsz.astroid@bobo.none>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <62fa6343-e084-75c3-01c9-349a4617e67c@redhat.com>
Date: Wed, 8 Jul 2020 19:50:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1594184204.ncuq7vstsz.astroid@bobo.none>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 7/8/20 1:10 AM, Nicholas Piggin wrote:
> Excerpts from Waiman Long's message of July 8, 2020 1:33 pm:
>> On 7/7/20 1:57 AM, Nicholas Piggin wrote:
>>> Yes, powerpc could certainly get more performance out of the slow
>>> paths, and then there are a few parameters to tune.
>>>
>>> We don't have a good alternate patching for function calls yet, but
>>> that would be something to do for native vs pv.
>>>
>>> And then there seem to be one or two tunable parameters we could
>>> experiment with.
>>>
>>> The paravirt locks may need a bit more tuning. Some simple testing
>>> under KVM shows we might be a bit slower in some cases. Whether this
>>> is fairness or something else I'm not sure. The current simple pv
>>> spinlock code can do a directed yield to the lock holder CPU, whereas
>>> the pv qspl here just does a general yield. I think we might actually
>>> be able to change that to also support directed yield. Though I'm
>>> not sure if this is actually the cause of the slowdown yet.
>> Regarding the paravirt lock, I have taken a further look into the
>> current PPC spinlock code. There is an equivalent of pv_wait() but no
>> pv_kick(). Maybe PPC doesn't really need that.
> So powerpc has two types of wait, either undirected "all processors" or
> directed to a specific processor which has been preempted by the
> hypervisor.
>
> The simple spinlock code does a directed wait, because it knows the CPU
> which is holding the lock. In this case, there is a sequence that is
> used to ensure we don't wait if the condition has become true, and the
> target CPU does not need to kick the waiter it will happen automatically
> (see splpar_spin_yield). This is preferable because we only wait as
> needed and don't require the kick operation.
Thanks for the explanation.
>
> The pv spinlock code I did uses the undirected wait, because we don't
> know the CPU number which we are waiting on. This is undesirable because
> it's higher overhead and the wait is not so accurate.
>
> I think perhaps we could change things so we wait on the correct CPU
> when queued, which might be good enough (we could also put the lock
> owner CPU in the spinlock word, if we add another format).

The LS byte of the lock word is used to indicate locking status. If we 
have less than 255 cpus, we can put the (cpu_nr + 1) into the lock byte. 
The special 0xff value can be used to indicate a cpu number >= 255 for 
indirect yield. The required change to the qspinlock code will be 
minimal, I think.


>> Attached are two
>> additional qspinlock patches that adds a CONFIG_PARAVIRT_QSPINLOCKS_LITE
>> option to not require pv_kick(). There is also a fixup patch to be
>> applied after your patchset.
>>
>> I don't have access to a PPC LPAR with shared processor at the moment,
>> so I can't test the performance of the paravirt code. Would you mind
>> adding my patches and do some performance test on your end to see if it
>> gives better result?
> Great, I'll do some tests. Any suggestions for what to try?

I will just like to see if it will produce some better performance 
result compared with your current version.

Cheers,
Longman

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
