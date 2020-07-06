Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 938822151C4
	for <lists.virtualization@lfdr.de>; Mon,  6 Jul 2020 06:36:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3839D203D5;
	Mon,  6 Jul 2020 04:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lbODb30uVJQR; Mon,  6 Jul 2020 04:36:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 65D42203E2;
	Mon,  6 Jul 2020 04:36:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43B21C016F;
	Mon,  6 Jul 2020 04:36:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F59BC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2B9A986F23
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8OUY_4zqHLJJ
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:36:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6860086EA1
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:36:28 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id l17so37806468wmj.0
 for <virtualization@lists.linux-foundation.org>;
 Sun, 05 Jul 2020 21:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cAuLxDL8CkBp1tpBnhqClilHhcD0O782TDI+bdg1kNU=;
 b=XOdg5H2E4lNGYFhYc0/rxP9u8/fuTv6VeFja8Noz+koduO9ASBPQiUJIZhJUoe3FZ1
 5j6pJEMPoDcUJa4a693ePzR0S0bWCuP+okHF201wWOQJPeFXc19q1Wjad8zvFortsca4
 BAU2cWVym6HmdO3WF6QoeaegeTIDsaaabWgHbqVLzx2BEzkwec86jclgPu2E2A4yUupb
 d2wbC887pQ79Xz0sn+vujqemnZPZJNUPEuhO9Ih5S3OuA12J314AIXAeIrWLtZfjUxBp
 DPfOl5ls1Z513+Q9hqkmMlLQbBDtAUtP8bHoauVyDliR6Voin8q9hhSW7niY5xE76rE4
 BlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cAuLxDL8CkBp1tpBnhqClilHhcD0O782TDI+bdg1kNU=;
 b=gdu7gIxVbOl+1a5RWcZXCWA4LtdWFzj599pqz53gyuK/NNF3oZkQ/EdB0q33DqMS2f
 C6+PmdvDVWZDJMKO6PKrBPrp7x9n1/ypasFJeN+LAXLgZE0qt5LDlLjpiOrm/c/R4be3
 nJ1srC3sJtj9lww6ODq2JTfCQ9/D8KCwrm5oEWE2IeSfbssUnKGDUY5QuhT+fYrHL5+T
 KLYPW350VhreWM2VHkgqBw24dcvoojtu9CY5ae9FPzjeWT78BudbkxiD8wMpOmG9y/dS
 Eu5ZSf02Ht+NqIM7mQmPkO6SqgIgG1Xh1a41Qf9JpIxFlUSCWjZl7QVdQmweGV5UUxlb
 kPZw==
X-Gm-Message-State: AOAM5302wMQibtD9X2dGPkOmrgmXO7i2R3cq1v37Klv5JSirWCoQl4bt
 sxI/0nsO8EMg397HgVXcqvM=
X-Google-Smtp-Source: ABdhPJw3xwCHjl66IDwjNwnrVaS+sYKKRxEjT29tJBVhRnVy0iHX8mmwPpg7n6zCTYEyHFzW18ALwQ==
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr49403893wmi.66.1594010186996; 
 Sun, 05 Jul 2020 21:36:26 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id r10sm22202309wrm.17.2020.07.05.21.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 21:36:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 6/6] powerpc/qspinlock: optimised atomic_try_cmpxchg_lock
 that adds the lock hint
Date: Mon,  6 Jul 2020 14:35:40 +1000
Message-Id: <20200706043540.1563616-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200706043540.1563616-1-npiggin@gmail.com>
References: <20200706043540.1563616-1-npiggin@gmail.com>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Anton Blanchard <anton@ozlabs.org>,
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

This brings the behaviour of the uncontended fast path back to
roughly equivalent to simple spinlocks -- a single atomic op with
lock hint.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/atomic.h    | 28 ++++++++++++++++++++++++++++
 arch/powerpc/include/asm/qspinlock.h |  2 +-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index 498785ffc25f..f6a3d145ffb7 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -193,6 +193,34 @@ static __inline__ int atomic_dec_return_relaxed(atomic_t *v)
 #define atomic_xchg(v, new) (xchg(&((v)->counter), new))
 #define atomic_xchg_relaxed(v, new) xchg_relaxed(&((v)->counter), (new))
 
+/*
+ * Don't want to override the generic atomic_try_cmpxchg_acquire, because
+ * we add a lock hint to the lwarx, which may not be wanted for the
+ * _acquire case (and is not used by the other _acquire variants so it
+ * would be a surprise).
+ */
+static __always_inline bool
+atomic_try_cmpxchg_lock(atomic_t *v, int *old, int new)
+{
+	int r, o = *old;
+
+	__asm__ __volatile__ (
+"1:\t"	PPC_LWARX(%0,0,%2,1) "	# atomic_try_cmpxchg_acquire	\n"
+"	cmpw	0,%0,%3							\n"
+"	bne-	2f							\n"
+"	stwcx.	%4,0,%2							\n"
+"	bne-	1b							\n"
+"\t"	PPC_ACQUIRE_BARRIER "						\n"
+"2:									\n"
+	: "=&r" (r), "+m" (v->counter)
+	: "r" (&v->counter), "r" (o), "r" (new)
+	: "cr0", "memory");
+
+	if (unlikely(r != o))
+		*old = r;
+	return likely(r == o);
+}
+
 /**
  * atomic_fetch_add_unless - add unless the number is a given value
  * @v: pointer of type atomic_t
diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index f5066f00a08c..b752d34517b3 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -37,7 +37,7 @@ static __always_inline void queued_spin_lock(struct qspinlock *lock)
 {
 	u32 val = 0;
 
-	if (likely(atomic_try_cmpxchg_acquire(&lock->val, &val, _Q_LOCKED_VAL)))
+	if (likely(atomic_try_cmpxchg_lock(&lock->val, &val, _Q_LOCKED_VAL)))
 		return;
 
 	queued_spin_lock_slowpath(lock, val);
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
