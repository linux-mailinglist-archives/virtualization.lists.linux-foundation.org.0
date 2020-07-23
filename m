Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A13522B084
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 15:30:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A2ADE89AC2;
	Thu, 23 Jul 2020 13:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Vg5Kkdo6aMl; Thu, 23 Jul 2020 13:30:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED1B889AC0;
	Thu, 23 Jul 2020 13:30:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3AF3C016F;
	Thu, 23 Jul 2020 13:30:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 924EAC004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 13:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 80B7287D86
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 13:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dk6L9gEK9EZZ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 13:30:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6814787D85
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 13:30:16 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w126so2847813pfw.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Td5n8VLQM5VzC3/ySr0x0FkE92YfVlucA4U3oDMBrpc=;
 b=nJOThBN3e0u2wPmuKSDicZ+MnhpMP1D4iUV1NevDGUNLVV/pnTf9+zsjxy0Qbbio20
 0MiiX36MZ0ZC4E71DLYgt/cADBAmI3H4MzayuAZG7DzEI7kaA9e9QwPC8lL1JqZQP+NL
 9MGVBFha1s2QXAWnx1C1AGhlwjqS8hcx22i1c5WfIxY0DFbIb6mc4Y32KjmVk6PiLbeG
 GoPigoJt0ecu9QSJzK2R1EDHjtsTbmfloVX4mn/0GnuomG5yEie0b35EjQ2/6Q5Wp5I4
 n22LyNjNL9sMD5ZFQyhsBEiiaJmT4JxbN546p048mlxo3r6w7CQPF4aegWwn/eZpecgd
 nubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Td5n8VLQM5VzC3/ySr0x0FkE92YfVlucA4U3oDMBrpc=;
 b=Sd2LxJ9jOw6xzfIVye4C9URfF5Z2OBkd6W4qyfxMOUc9w5w8vM4uvyWNoAfwJ6fCNM
 2Vc7s8rkDRaj33FhQ1Eu8CAHGH83WLGGQ9l3+nI17Jo5zdVDZHScuKGw7Z2gGfVgQ05/
 AOLbAh97uFRCGm4Kjs+oCnL/jPF8/cOf2PoNID5Gia1r0q7TKVdkXDyNZ1xMk44FeTYN
 Vn9VT4CSzyVrz9WSMQurEroYFFBathxEEL52zMCnGyEFM/1xnPrhBWtc6tQLWk4fCZSN
 bNtGhcbCOyC+8n0eBo7AfGvUFZgB/7dKlp8WW6I2VyvkCY/Xgd8YWfVhCj2kBUHiYPaM
 Rwpw==
X-Gm-Message-State: AOAM531ErQqq+cj48ffCbFZYiMi2JbcJuFY5BqnRLkM93eneaLTQ8C4u
 U7IZEH0N1fRc3jAM3ENZ3fs=
X-Google-Smtp-Source: ABdhPJzDRciPPyx06p/TELG6ZbrzJ5oreW4i8vpZMSYQR38q69s9sCgkLuLjxZA90YTp1MLQk8mQMQ==
X-Received: by 2002:a65:644d:: with SMTP id s13mr4226469pgv.103.1595511015960; 
 Thu, 23 Jul 2020 06:30:15 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id u26sm3148320pfn.54.2020.07.23.06.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 06:30:15 -0700 (PDT)
Date: Thu, 23 Jul 2020 23:30:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
To: Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <20200708084106.GE597537@hirez.programming.kicks-ass.net>
 <1595327263.lk78cqolxm.astroid@bobo.none>
 <eaabf501-80fe-dd15-c03c-f75ce4f75877@redhat.com>
In-Reply-To: <eaabf501-80fe-dd15-c03c-f75ce4f75877@redhat.com>
MIME-Version: 1.0
Message-Id: <1595510571.u39qfc8d1o.astroid@bobo.none>
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

Excerpts from Waiman Long's message of July 22, 2020 12:36 am:
> On 7/21/20 7:08 AM, Nicholas Piggin wrote:
>> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
>> index b752d34517b3..26d8766a1106 100644
>> --- a/arch/powerpc/include/asm/qspinlock.h
>> +++ b/arch/powerpc/include/asm/qspinlock.h
>> @@ -31,16 +31,57 @@ static inline void queued_spin_unlock(struct qspinlock *lock)
>>   
>>   #else
>>   extern void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
>> +extern void queued_spin_lock_slowpath_queue(struct qspinlock *lock);
>>   #endif
>>   
>>   static __always_inline void queued_spin_lock(struct qspinlock *lock)
>>   {
>> -	u32 val = 0;
>> -
>> -	if (likely(atomic_try_cmpxchg_lock(&lock->val, &val, _Q_LOCKED_VAL)))
>> +	atomic_t *a = &lock->val;
>> +	u32 val;
>> +
>> +again:
>> +	asm volatile(
>> +"1:\t"	PPC_LWARX(%0,0,%1,1) "	# queued_spin_lock			\n"
>> +	: "=&r" (val)
>> +	: "r" (&a->counter)
>> +	: "memory");
>> +
>> +	if (likely(val == 0)) {
>> +		asm_volatile_goto(
>> +	"	stwcx.	%0,0,%1							\n"
>> +	"	bne-	%l[again]						\n"
>> +	"\t"	PPC_ACQUIRE_BARRIER "						\n"
>> +		:
>> +		: "r"(_Q_LOCKED_VAL), "r" (&a->counter)
>> +		: "cr0", "memory"
>> +		: again );
>>   		return;
>> -
>> -	queued_spin_lock_slowpath(lock, val);
>> +	}
>> +
>> +	if (likely(val == _Q_LOCKED_VAL)) {
>> +		asm_volatile_goto(
>> +	"	stwcx.	%0,0,%1							\n"
>> +	"	bne-	%l[again]						\n"
>> +		:
>> +		: "r"(_Q_LOCKED_VAL | _Q_PENDING_VAL), "r" (&a->counter)
>> +		: "cr0", "memory"
>> +		: again );
>> +
>> +		atomic_cond_read_acquire(a, !(VAL & _Q_LOCKED_MASK));
>> +//		clear_pending_set_locked(lock);
>> +		WRITE_ONCE(lock->locked_pending, _Q_LOCKED_VAL);
>> +//		lockevent_inc(lock_pending);
>> +		return;
>> +	}
>> +
>> +	if (val == _Q_PENDING_VAL) {
>> +		int cnt = _Q_PENDING_LOOPS;
>> +		val = atomic_cond_read_relaxed(a,
>> +					       (VAL != _Q_PENDING_VAL) || !cnt--);
>> +		if (!(val & ~_Q_LOCKED_MASK))
>> +			goto again;
>> +        }
>> +	queued_spin_lock_slowpath_queue(lock);
>>   }
>>   #define queued_spin_lock queued_spin_lock
>>   
> 
> I am fine with the arch code override some part of the generic code.

Cool.

>> diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
>> index b9515fcc9b29..ebcc6f5d99d5 100644
>> --- a/kernel/locking/qspinlock.c
>> +++ b/kernel/locking/qspinlock.c
>> @@ -287,10 +287,14 @@ static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
>>   
>>   #ifdef CONFIG_PARAVIRT_SPINLOCKS
>>   #define queued_spin_lock_slowpath	native_queued_spin_lock_slowpath
>> +#define queued_spin_lock_slowpath_queue	native_queued_spin_lock_slowpath_queue
>>   #endif
>>   
>>   #endif /* _GEN_PV_LOCK_SLOWPATH */
>>   
>> +void queued_spin_lock_slowpath_queue(struct qspinlock *lock);
>> +static void __queued_spin_lock_slowpath_queue(struct qspinlock *lock);
>> +
>>   /**
>>    * queued_spin_lock_slowpath - acquire the queued spinlock
>>    * @lock: Pointer to queued spinlock structure
>> @@ -314,12 +318,6 @@ static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
>>    */
>>   void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
>>   {
>> -	struct mcs_spinlock *prev, *next, *node;
>> -	u32 old, tail;
>> -	int idx;
>> -
>> -	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
>> -
>>   	if (pv_enabled())
>>   		goto pv_queue;
>>   
>> @@ -397,6 +395,26 @@ void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
>>   queue:
>>   	lockevent_inc(lock_slowpath);
>>   pv_queue:
>> +	__queued_spin_lock_slowpath_queue(lock);
>> +}
>> +EXPORT_SYMBOL(queued_spin_lock_slowpath);
>> +
>> +void queued_spin_lock_slowpath_queue(struct qspinlock *lock)
>> +{
>> +	lockevent_inc(lock_slowpath);
>> +	__queued_spin_lock_slowpath_queue(lock);
>> +}
>> +EXPORT_SYMBOL(queued_spin_lock_slowpath_queue);
>> +
>> +static void __queued_spin_lock_slowpath_queue(struct qspinlock *lock)
>> +{
>> +	struct mcs_spinlock *prev, *next, *node;
>> +	u32 old, tail;
>> +	u32 val;
>> +	int idx;
>> +
>> +	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
>> +
>>   	node = this_cpu_ptr(&qnodes[0].mcs);
>>   	idx = node->count++;
>>   	tail = encode_tail(smp_processor_id(), idx);
>> @@ -559,7 +577,6 @@ void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
>>   	 */
>>   	__this_cpu_dec(qnodes[0].mcs.count);
>>   }
>> -EXPORT_SYMBOL(queued_spin_lock_slowpath);
>>   
>>   /*
>>    * Generate the paravirt code for queued_spin_unlock_slowpath().
>>
> I would prefer to extract out the pending bit handling code out into a 
> separate helper function which can be overridden by the arch code 
> instead of breaking the slowpath into 2 pieces.

You mean have the arch provide a queued_spin_lock_slowpath_pending 
function that the slow path calls?

I would actually prefer the pending handling can be made inline in
the queued_spin_lock function, especially with out-of-line locks it 
makes sense to put it there.

We could ifdef out queued_spin_lock_slowpath_queue if it's not used,
then __queued_spin_lock_slowpath_queue would be inlined into the
caller so there would be no split?

Thanks,
Nick
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
