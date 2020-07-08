Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 321D32194C3
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 01:58:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C3A0789737;
	Wed,  8 Jul 2020 23:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mrbyMDNq6090; Wed,  8 Jul 2020 23:58:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 448B58973E;
	Wed,  8 Jul 2020 23:58:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27F7BC016F;
	Wed,  8 Jul 2020 23:58:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3ADAC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 23:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 910438973A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 23:58:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IAzlUbL+civ5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 23:58:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 82FE889737
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 23:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594252725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnQ0NpLgUMhM2rS/Fc950+H8OU2zboSJSf+KmCP3N40=;
 b=XvDMFGN9fhBJj9NmbHmXIqnwmtVP4K03a8/xmfbov2UhVBy1BAzxpXA6C6w+5PWuIN2Ch2
 MFV1UZQcTvlTGiDZxQq6Dgd5UFEiVptOX/UKPHiNZFvZzzcwXeFC3oc/MBOPU2JGJc+WHA
 yNVlnDmCzguYibwzTkRk6IcFImleYcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-OX3HluVBObG5NMo_XcEqww-1; Wed, 08 Jul 2020 19:58:43 -0400
X-MC-Unique: OX3HluVBObG5NMo_XcEqww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D26521005504;
 Wed,  8 Jul 2020 23:58:41 +0000 (UTC)
Received: from llong.remote.csb (ovpn-116-205.rdu2.redhat.com [10.10.116.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A75C61001925;
 Wed,  8 Jul 2020 23:58:40 +0000 (UTC)
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
From: Waiman Long <longman@redhat.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <de3ead58-7f81-8ebd-754d-244f6be24af4@redhat.com>
 <1594184204.ncuq7vstsz.astroid@bobo.none>
 <62fa6343-e084-75c3-01c9-349a4617e67c@redhat.com>
Organization: Red Hat
Message-ID: <808a262d-8863-5986-082d-1088b66714df@redhat.com>
Date: Wed, 8 Jul 2020 19:58:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <62fa6343-e084-75c3-01c9-349a4617e67c@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

On 7/8/20 7:50 PM, Waiman Long wrote:
> On 7/8/20 1:10 AM, Nicholas Piggin wrote:
>> Excerpts from Waiman Long's message of July 8, 2020 1:33 pm:
>>> On 7/7/20 1:57 AM, Nicholas Piggin wrote:
>>>> Yes, powerpc could certainly get more performance out of the slow
>>>> paths, and then there are a few parameters to tune.
>>>>
>>>> We don't have a good alternate patching for function calls yet, but
>>>> that would be something to do for native vs pv.
>>>>
>>>> And then there seem to be one or two tunable parameters we could
>>>> experiment with.
>>>>
>>>> The paravirt locks may need a bit more tuning. Some simple testing
>>>> under KVM shows we might be a bit slower in some cases. Whether this
>>>> is fairness or something else I'm not sure. The current simple pv
>>>> spinlock code can do a directed yield to the lock holder CPU, whereas
>>>> the pv qspl here just does a general yield. I think we might actually
>>>> be able to change that to also support directed yield. Though I'm
>>>> not sure if this is actually the cause of the slowdown yet.
>>> Regarding the paravirt lock, I have taken a further look into the
>>> current PPC spinlock code. There is an equivalent of pv_wait() but no
>>> pv_kick(). Maybe PPC doesn't really need that.
>> So powerpc has two types of wait, either undirected "all processors" or
>> directed to a specific processor which has been preempted by the
>> hypervisor.
>>
>> The simple spinlock code does a directed wait, because it knows the CPU
>> which is holding the lock. In this case, there is a sequence that is
>> used to ensure we don't wait if the condition has become true, and the
>> target CPU does not need to kick the waiter it will happen automatically
>> (see splpar_spin_yield). This is preferable because we only wait as
>> needed and don't require the kick operation.
> Thanks for the explanation.
>>
>> The pv spinlock code I did uses the undirected wait, because we don't
>> know the CPU number which we are waiting on. This is undesirable because
>> it's higher overhead and the wait is not so accurate.
>>
>> I think perhaps we could change things so we wait on the correct CPU
>> when queued, which might be good enough (we could also put the lock
>> owner CPU in the spinlock word, if we add another format).
>
> The LS byte of the lock word is used to indicate locking status. If we 
> have less than 255 cpus, we can put the (cpu_nr + 1) into the lock 
> byte. The special 0xff value can be used to indicate a cpu number >= 
> 255 for indirect yield. The required change to the qspinlock code will 
> be minimal, I think. 

BTW, we can also keep track of the previous cpu in the waiting queue. 
Due to lock stealing, that may not be the cpu that is holding the lock. 
Maybe we can use this, if available, in case the cpu number is >= 255.

Regards,
Longman

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
