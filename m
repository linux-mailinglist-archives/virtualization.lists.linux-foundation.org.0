Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB9B211D73
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 09:49:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2C726267EB;
	Thu,  2 Jul 2020 07:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1+tRRYGsiuc; Thu,  2 Jul 2020 07:49:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9BEF82661B;
	Thu,  2 Jul 2020 07:49:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92947C0733;
	Thu,  2 Jul 2020 07:49:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DE8DC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7D19789078
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aGSCNag3UKAV
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:49:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0E70C89066
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 07:49:30 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id b16so12159566pfi.13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 00:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9NJ1Ulnd8FUmc15smZh6pt0VA5vxUSOm2TGGwsdqYoM=;
 b=h1o1LcgG1xlbxsTXx56FrrXDQFQguL0GPMYYSt5jqmcQS9iaN8toSEHNjvoLQHl5g2
 kzDzzyNXxq0XYbgxtm1X7QREncpnWLB1Eu58VIUB0QuwN2jXCVFxKvOCnuLd0vhkqZNf
 7XS8ybdePQ/GGeEP9XrvMzir35iJR2SgXnl9wB7NtEhEMpbdkvDZCh2jdW5ci9ZxZRVq
 wmMJGIH33PvOU3axKN/hDYhkKBb8CGOyBYeL0lG2SXjANW5pAr9EBa8AmAoEI2P0z2df
 pwJwVQQ+KNZdfS632ULuiUJ7WUxOD2vhmhwGdR20X/XaNBtIygo3+0MK/U7nnju8pVc8
 vPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9NJ1Ulnd8FUmc15smZh6pt0VA5vxUSOm2TGGwsdqYoM=;
 b=KqR4FL6a2KtBoeIVPssjioLGOQCPvkjGVCLmacNBspBTGiiXVfn8R1PwYsVgYKVCRN
 rveUQaYt6RuuQ6lr4g6Is5OrgfttMIBhbPwoobCS4mjKd+qjtHO9fbTEphGDQFHZCH5n
 vIY1V+en+a2I+O9ZB1c360jBkcvlgnKXSO5tUciKsxARyjLifhZMpq6ZjaPCmzU2UEnY
 F+vr63O6HkuRKYnvXjjS4VYorUoMPx2aU5+WMxRRRw0NTmHtHiXe9+NhXEGXoCUzBxP0
 GU9dLiTpZk4Z16+LwyDeS4y71sqLtoKCpgBLLLyB6zcvMoEyA3teX+5Z/DLPgq0J0nco
 FyNg==
X-Gm-Message-State: AOAM5329oMfJY/0XWsXPus7Xg2+k6O5lWAHeW3BJ3rbgsfkVOX3xe54Q
 P50mM9FagJTPQp/ZI52fZrwGWwzj
X-Google-Smtp-Source: ABdhPJzwYFeDE0Zesg+dB6oDlHyvbtGF9QEI6LdVjc/BuBvcwXIzeNCPUJRMFXKCpdtG6Hbd1Ttt8g==
X-Received: by 2002:a63:7741:: with SMTP id s62mr22972293pgc.332.1593676169702; 
 Thu, 02 Jul 2020 00:49:29 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id 17sm6001953pfv.16.2020.07.02.00.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 00:49:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 7/8] powerpc/qspinlock: optimised atomic_try_cmpxchg_lock that
 adds the lock hint
Date: Thu,  2 Jul 2020 17:48:38 +1000
Message-Id: <20200702074839.1057733-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200702074839.1057733-1-npiggin@gmail.com>
References: <20200702074839.1057733-1-npiggin@gmail.com>
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
index 997a9a32df77..7091f1ceec3d 100644
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
