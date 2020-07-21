Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C793228258
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 16:36:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 032AF88318;
	Tue, 21 Jul 2020 14:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zBoTVP3pD-hm; Tue, 21 Jul 2020 14:36:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4A61488702;
	Tue, 21 Jul 2020 14:36:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17271C016F;
	Tue, 21 Jul 2020 14:36:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A84CC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 14:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 68D4F884B4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 14:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zX1PeI97NfxB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 14:36:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6D89D88318
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 14:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595342186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NycHO4cCvRulg7ZB9M1xTLI2cl8/0+geie9uWHt9/cE=;
 b=SOcTtIX9AB6Af4/xkEjTNXx1AcZgzgbzRsczryEDdzLPL1vFpiqkXf9XJyvNa1IrGiECZt
 iLzyxbnOVl0VB4+2eX2DdkKHhVmAIOUMRmpD+g2hFqOgDDfK8NXxaeIw2kVcKzM9v18OHE
 /t+QIT7AXJLtZS6wpbw2eUsBPVhN8SA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-Zm_0Vb-1P1eJUlH4iKjACg-1; Tue, 21 Jul 2020 10:36:22 -0400
X-MC-Unique: Zm_0Vb-1P1eJUlH4iKjACg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE3FE80183C;
 Tue, 21 Jul 2020 14:36:19 +0000 (UTC)
Received: from llong.remote.csb (ovpn-115-32.rdu2.redhat.com [10.10.115.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A76752B6E2;
 Tue, 21 Jul 2020 14:36:16 +0000 (UTC)
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
To: Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <20200708084106.GE597537@hirez.programming.kicks-ass.net>
 <1595327263.lk78cqolxm.astroid@bobo.none>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <eaabf501-80fe-dd15-c03c-f75ce4f75877@redhat.com>
Date: Tue, 21 Jul 2020 10:36:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1595327263.lk78cqolxm.astroid@bobo.none>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 7/21/20 7:08 AM, Nicholas Piggin wrote:
> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
> index b752d34517b3..26d8766a1106 100644
> --- a/arch/powerpc/include/asm/qspinlock.h
> +++ b/arch/powerpc/include/asm/qspinlock.h
> @@ -31,16 +31,57 @@ static inline void queued_spin_unlock(struct qspinlock *lock)
>   
>   #else
>   extern void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
> +extern void queued_spin_lock_slowpath_queue(struct qspinlock *lock);
>   #endif
>   
>   static __always_inline void queued_spin_lock(struct qspinlock *lock)
>   {
> -	u32 val = 0;
> -
> -	if (likely(atomic_try_cmpxchg_lock(&lock->val, &val, _Q_LOCKED_VAL)))
> +	atomic_t *a = &lock->val;
> +	u32 val;
> +
> +again:
> +	asm volatile(
> +"1:\t"	PPC_LWARX(%0,0,%1,1) "	# queued_spin_lock			\n"
> +	: "=&r" (val)
> +	: "r" (&a->counter)
> +	: "memory");
> +
> +	if (likely(val == 0)) {
> +		asm_volatile_goto(
> +	"	stwcx.	%0,0,%1							\n"
> +	"	bne-	%l[again]						\n"
> +	"\t"	PPC_ACQUIRE_BARRIER "						\n"
> +		:
> +		: "r"(_Q_LOCKED_VAL), "r" (&a->counter)
> +		: "cr0", "memory"
> +		: again );
>   		return;
> -
> -	queued_spin_lock_slowpath(lock, val);
> +	}
> +
> +	if (likely(val == _Q_LOCKED_VAL)) {
> +		asm_volatile_goto(
> +	"	stwcx.	%0,0,%1							\n"
> +	"	bne-	%l[again]						\n"
> +		:
> +		: "r"(_Q_LOCKED_VAL | _Q_PENDING_VAL), "r" (&a->counter)
> +		: "cr0", "memory"
> +		: again );
> +
> +		atomic_cond_read_acquire(a, !(VAL & _Q_LOCKED_MASK));
> +//		clear_pending_set_locked(lock);
> +		WRITE_ONCE(lock->locked_pending, _Q_LOCKED_VAL);
> +//		lockevent_inc(lock_pending);
> +		return;
> +	}
> +
> +	if (val == _Q_PENDING_VAL) {
> +		int cnt = _Q_PENDING_LOOPS;
> +		val = atomic_cond_read_relaxed(a,
> +					       (VAL != _Q_PENDING_VAL) || !cnt--);
> +		if (!(val & ~_Q_LOCKED_MASK))
> +			goto again;
> +        }
> +	queued_spin_lock_slowpath_queue(lock);
>   }
>   #define queued_spin_lock queued_spin_lock
>   

I am fine with the arch code override some part of the generic code.


> diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
> index b9515fcc9b29..ebcc6f5d99d5 100644
> --- a/kernel/locking/qspinlock.c
> +++ b/kernel/locking/qspinlock.c
> @@ -287,10 +287,14 @@ static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
>   
>   #ifdef CONFIG_PARAVIRT_SPINLOCKS
>   #define queued_spin_lock_slowpath	native_queued_spin_lock_slowpath
> +#define queued_spin_lock_slowpath_queue	native_queued_spin_lock_slowpath_queue
>   #endif
>   
>   #endif /* _GEN_PV_LOCK_SLOWPATH */
>   
> +void queued_spin_lock_slowpath_queue(struct qspinlock *lock);
> +static void __queued_spin_lock_slowpath_queue(struct qspinlock *lock);
> +
>   /**
>    * queued_spin_lock_slowpath - acquire the queued spinlock
>    * @lock: Pointer to queued spinlock structure
> @@ -314,12 +318,6 @@ static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
>    */
>   void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
>   {
> -	struct mcs_spinlock *prev, *next, *node;
> -	u32 old, tail;
> -	int idx;
> -
> -	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
> -
>   	if (pv_enabled())
>   		goto pv_queue;
>   
> @@ -397,6 +395,26 @@ void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
>   queue:
>   	lockevent_inc(lock_slowpath);
>   pv_queue:
> +	__queued_spin_lock_slowpath_queue(lock);
> +}
> +EXPORT_SYMBOL(queued_spin_lock_slowpath);
> +
> +void queued_spin_lock_slowpath_queue(struct qspinlock *lock)
> +{
> +	lockevent_inc(lock_slowpath);
> +	__queued_spin_lock_slowpath_queue(lock);
> +}
> +EXPORT_SYMBOL(queued_spin_lock_slowpath_queue);
> +
> +static void __queued_spin_lock_slowpath_queue(struct qspinlock *lock)
> +{
> +	struct mcs_spinlock *prev, *next, *node;
> +	u32 old, tail;
> +	u32 val;
> +	int idx;
> +
> +	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
> +
>   	node = this_cpu_ptr(&qnodes[0].mcs);
>   	idx = node->count++;
>   	tail = encode_tail(smp_processor_id(), idx);
> @@ -559,7 +577,6 @@ void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
>   	 */
>   	__this_cpu_dec(qnodes[0].mcs.count);
>   }
> -EXPORT_SYMBOL(queued_spin_lock_slowpath);
>   
>   /*
>    * Generate the paravirt code for queued_spin_unlock_slowpath().
>
I would prefer to extract out the pending bit handling code out into a 
separate helper function which can be overridden by the arch code 
instead of breaking the slowpath into 2 pieces.

Cheers,
Longman

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
