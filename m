Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 59390213520
	for <lists.virtualization@lfdr.de>; Fri,  3 Jul 2020 09:36:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0ECE387D70;
	Fri,  3 Jul 2020 07:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8MZaCtJTKcg2; Fri,  3 Jul 2020 07:36:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9A6CF87D88;
	Fri,  3 Jul 2020 07:36:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 813A0C0733;
	Fri,  3 Jul 2020 07:36:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D88D6C088E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D4CB689848
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ikBev7GJB-91
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:35:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BA692897E1
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:35:59 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 207so13458427pfu.3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Jul 2020 00:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kvRCd9PLGVjMWPK2r0TpbnS9leKQS2B3nkKMRCX0GBc=;
 b=tUMVPFF4vP2G4/hgBKCTYJMF+Rw+SPYAjVXhxPe0fKu026bXGY5X+I5s+FA04mZq6a
 Et0nP5rO88tHymCo1NOQQ/W/kJDXtP6UaLNrJgLJXf8JIfg9yGsu8i0ZSFQwVqPFYkBX
 Wb6Vj1fQ2w43tn7SzVOKglgLx7emY1FiLNKNQIKSKfEbs73HUANA4nkFZ70EQNdNBHgB
 kLu3aQQ0XiLbZOQRXQm1V4GyCEOvfFXXsND1+pAzYPksxSg2lNgJiEO8xDchGcWp3HaT
 604/CxpVjNs6i0Fkg797X4y1Q+H9nLZnDzhhVAcrw64zCjA8NYJr7L1Gl1Wek4A7IMtT
 ackg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kvRCd9PLGVjMWPK2r0TpbnS9leKQS2B3nkKMRCX0GBc=;
 b=kBB4By2k15k1aJJ7muzZm9iPgaXxQmJEg3dLrQMuf83UF0WJso13X9vFXcZRaDg9wY
 f2iA3VXymZPF0VsLCAreds0sFqnj6TtQ+bU2zcmQ/ooNBjjzqrQjgwBOnz8eoTZdGARn
 mptWmaOjYGP4rfAxuWqu04DEeGG6KuVFGkA2Okuov2NRcIAhLY1KVPQw4cs9I8yMu7yV
 GpYIZinUBGQqA7b+gQMAbPAArhHcBgQq1rp+/qAb8WkAdVpaZMP7qtbLrRf/KHLKQ/Ax
 wT8+zsqS4euPhzRmXmrE5g5WFx4brmirRPOmzOwgKnCrsiVPRxIFsVkfDfTUiPxhqtXW
 Slfw==
X-Gm-Message-State: AOAM532zxgrZSTzYJ0++BUf5D4qna11CB643z7VoaHR29W41IY1nF8No
 bMPHFE/6jJQYJZMoFEc7ECJYAtSD
X-Google-Smtp-Source: ABdhPJwRaPz9pu4t64jQMYoToKXv30O7t7kk9YVbA5y1a5jnOvLY5hddEayNHp5CZ6Ie32+ngdqn2w==
X-Received: by 2002:a62:1c13:: with SMTP id c19mr17009102pfc.52.1593761759369; 
 Fri, 03 Jul 2020 00:35:59 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id y7sm10218499pgk.93.2020.07.03.00.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 00:35:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH v2 6/6] powerpc/qspinlock: optimised atomic_try_cmpxchg_lock
 that adds the lock hint
Date: Fri,  3 Jul 2020 17:35:16 +1000
Message-Id: <20200703073516.1354108-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200703073516.1354108-1-npiggin@gmail.com>
References: <20200703073516.1354108-1-npiggin@gmail.com>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, Waiman Long <longman@redhat.com>,
 Anton Blanchard <anton@ozlabs.org>, Will Deacon <will@kernel.org>
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
index 0960a0de2467..beb6aa4628e7 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -26,7 +26,7 @@ static __always_inline void queued_spin_lock(struct qspinlock *lock)
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
