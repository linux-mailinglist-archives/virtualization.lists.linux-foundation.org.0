Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BA08C227E3F
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 13:09:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6B60887446;
	Tue, 21 Jul 2020 11:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A_y8YUPYZmQG; Tue, 21 Jul 2020 11:09:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BD757874DC;
	Tue, 21 Jul 2020 11:09:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E7FDC016F;
	Tue, 21 Jul 2020 11:09:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 593B4C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 11:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 43345229A3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 11:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id llVQRJe3As4N
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 11:08:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 9E9C922882
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 11:08:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z15so20757397wrl.8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 04:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=XunMdMvkWzPxzceSO8589OZZNxbcZ0jXERe3FDXc4Go=;
 b=FqYmz9UBE4PDn0hc2i03AxdNbgdQuWC26CHX+LTmpFPMyc3D5Tdwionxj0V9wAv1rX
 5R1AZXE6ZKQqXTLvZE9IUPRBZDoLgY1Is9uxLpNFrqG6R8tVYU0s+m9hm6WfNPpZF0BI
 dp3WqItm2fG6M+4OcZjfj2YSlRy0vbZlt418Pt2xXWP5O8D85Gc4xtIQPlRvlCu0o7nB
 v7b5+223qylm20s3dIAnXRQ7ZuLzJgZU0zGf8k3rVd13tB0HUxwPPSd6CpLqkBOjwI/L
 6IkkN4GJGEdPfpBjb4gnmkC4tHt3tPOlup3nvOf2M/0yA1pX0lRqrPCd6mt8s4ZARSdu
 KZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=XunMdMvkWzPxzceSO8589OZZNxbcZ0jXERe3FDXc4Go=;
 b=gzYoltPfyBNCKjmOUnwKrj1v7S6YeOzgZsIOSYwYGSGO1W66lsYoVhx9oKuf+sAqUe
 SGhycWyFnkSBF/PNmPCXN5MY9Or6Z1c4fwVzOKhEIYSyx4Hvr5ERhYpFsTbrubB+orrL
 m/VCVFRGcbD67umBoBvvQgMDmuywIMQpVgDzS2YxHDM0NafN2QhOqa/mcU6QBPzPu+KX
 Go4o9eU6mm8on+uWNTXj6aU3KgwL0IVyWs+3YHC4hWDhjE5XLE0ICRrdzszC2+/Hw5ZM
 YWnmSNNnodfdn8QQcK1hZioPGRka6O+xidkg3GGDqaojh8dh/uFAS7Sh4+Xymx7M8QWh
 +6NA==
X-Gm-Message-State: AOAM531vcVsEUqoKZ5ZhJPjSCQby0CHIjKx/AFa3iSlQJaZY8BDCAeIh
 iBCnBkHxLNdUtfV8I8RV7PU=
X-Google-Smtp-Source: ABdhPJxb6Obroh8Tbl1JjXl1VQrrbHCwwmkBeiHvK1odJZa3Wx4Vfqy2xFxD9h9aE7o5NRR8+xd/Fw==
X-Received: by 2002:a5d:458a:: with SMTP id p10mr25848278wrq.184.1595329734966; 
 Tue, 21 Jul 2020 04:08:54 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id k131sm3138401wmb.36.2020.07.21.04.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 04:08:54 -0700 (PDT)
Date: Tue, 21 Jul 2020 21:08:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
To: Peter Zijlstra <peterz@infradead.org>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <20200708084106.GE597537@hirez.programming.kicks-ass.net>
In-Reply-To: <20200708084106.GE597537@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1595327263.lk78cqolxm.astroid@bobo.none>
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Anton Blanchard <anton@ozlabs.org>, linuxppc-dev@lists.ozlabs.org
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

Excerpts from Peter Zijlstra's message of July 8, 2020 6:41 pm:
> On Tue, Jul 07, 2020 at 03:57:06PM +1000, Nicholas Piggin wrote:
>> Yes, powerpc could certainly get more performance out of the slow
>> paths, and then there are a few parameters to tune.
> 

Sorry for the delay, got bogged down and distracted by other things :(

> Can you clarify? The slow path is already in use on ARM64 which is weak,
> so I doubt there's superfluous serialization present. And Will spend a
> fair amount of time on making that thing guarantee forward progressm, so
> there just isn't too much room to play.

Sure, the way the pending not-queued slowpath (which I guess is the
medium-path) is implemented is just poorly structured for LL/SC. It
has one more atomic than necessary (queued_fetch_set_pending_acquire),
and a lot of branches in suboptimal order.

Attached patch (completely untested just compiled and looked at asm
so far) is a way we can fix this on powerpc I think. It's actually
very little generic code change which is good, duplicated medium-path
logic unfortunately but that's no worse than something like x86
really.

>> We don't have a good alternate patching for function calls yet, but
>> that would be something to do for native vs pv.
> 
> Going by your jump_label implementation, support for static_call should
> be fairly straight forward too, no?
> 
>   https://lkml.kernel.org/r/20200624153024.794671356@infradead.org

Nice, yeah it should be. I've wanted this for ages!

powerpc is kind of annoying to implement that with limited call range,
Hmm, not sure if we'd need a new linker feature to support it. We'd
provide call site patch space for indirect branches for those out of
range of direct call, so that should work fine. The trick would be 
patching in the TOC lookup for the function... should be doable somehow.

Thanks,
Nick

---

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index b752d34517b3..26d8766a1106 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -31,16 +31,57 @@ static inline void queued_spin_unlock(struct qspinlock *lock)
 
 #else
 extern void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
+extern void queued_spin_lock_slowpath_queue(struct qspinlock *lock);
 #endif
 
 static __always_inline void queued_spin_lock(struct qspinlock *lock)
 {
-	u32 val = 0;
-
-	if (likely(atomic_try_cmpxchg_lock(&lock->val, &val, _Q_LOCKED_VAL)))
+	atomic_t *a = &lock->val;
+	u32 val;
+
+again:
+	asm volatile(
+"1:\t"	PPC_LWARX(%0,0,%1,1) "	# queued_spin_lock			\n"
+	: "=&r" (val)
+	: "r" (&a->counter)
+	: "memory");
+
+	if (likely(val == 0)) {
+		asm_volatile_goto(
+	"	stwcx.	%0,0,%1							\n"
+	"	bne-	%l[again]						\n"
+	"\t"	PPC_ACQUIRE_BARRIER "						\n"
+		:
+		: "r"(_Q_LOCKED_VAL), "r" (&a->counter)
+		: "cr0", "memory"
+		: again );
 		return;
-
-	queued_spin_lock_slowpath(lock, val);
+	}
+
+	if (likely(val == _Q_LOCKED_VAL)) {
+		asm_volatile_goto(
+	"	stwcx.	%0,0,%1							\n"
+	"	bne-	%l[again]						\n"
+		:
+		: "r"(_Q_LOCKED_VAL | _Q_PENDING_VAL), "r" (&a->counter)
+		: "cr0", "memory"
+		: again );
+
+		atomic_cond_read_acquire(a, !(VAL & _Q_LOCKED_MASK));
+//		clear_pending_set_locked(lock);
+		WRITE_ONCE(lock->locked_pending, _Q_LOCKED_VAL);
+//		lockevent_inc(lock_pending);
+		return;
+	}
+
+	if (val == _Q_PENDING_VAL) {
+		int cnt = _Q_PENDING_LOOPS;
+		val = atomic_cond_read_relaxed(a,
+					       (VAL != _Q_PENDING_VAL) || !cnt--);
+		if (!(val & ~_Q_LOCKED_MASK))
+			goto again;
+        }
+	queued_spin_lock_slowpath_queue(lock);
 }
 #define queued_spin_lock queued_spin_lock
 
diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
index b9515fcc9b29..ebcc6f5d99d5 100644
--- a/kernel/locking/qspinlock.c
+++ b/kernel/locking/qspinlock.c
@@ -287,10 +287,14 @@ static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
 
 #ifdef CONFIG_PARAVIRT_SPINLOCKS
 #define queued_spin_lock_slowpath	native_queued_spin_lock_slowpath
+#define queued_spin_lock_slowpath_queue	native_queued_spin_lock_slowpath_queue
 #endif
 
 #endif /* _GEN_PV_LOCK_SLOWPATH */
 
+void queued_spin_lock_slowpath_queue(struct qspinlock *lock);
+static void __queued_spin_lock_slowpath_queue(struct qspinlock *lock);
+
 /**
  * queued_spin_lock_slowpath - acquire the queued spinlock
  * @lock: Pointer to queued spinlock structure
@@ -314,12 +318,6 @@ static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
  */
 void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
 {
-	struct mcs_spinlock *prev, *next, *node;
-	u32 old, tail;
-	int idx;
-
-	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
-
 	if (pv_enabled())
 		goto pv_queue;
 
@@ -397,6 +395,26 @@ void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
 queue:
 	lockevent_inc(lock_slowpath);
 pv_queue:
+	__queued_spin_lock_slowpath_queue(lock);
+}
+EXPORT_SYMBOL(queued_spin_lock_slowpath);
+
+void queued_spin_lock_slowpath_queue(struct qspinlock *lock)
+{
+	lockevent_inc(lock_slowpath);
+	__queued_spin_lock_slowpath_queue(lock);
+}
+EXPORT_SYMBOL(queued_spin_lock_slowpath_queue);
+
+static void __queued_spin_lock_slowpath_queue(struct qspinlock *lock)
+{
+	struct mcs_spinlock *prev, *next, *node;
+	u32 old, tail;
+	u32 val;
+	int idx;
+
+	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
+
 	node = this_cpu_ptr(&qnodes[0].mcs);
 	idx = node->count++;
 	tail = encode_tail(smp_processor_id(), idx);
@@ -559,7 +577,6 @@ void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
 	 */
 	__this_cpu_dec(qnodes[0].mcs.count);
 }
-EXPORT_SYMBOL(queued_spin_lock_slowpath);
 
 /*
  * Generate the paravirt code for queued_spin_unlock_slowpath().
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
