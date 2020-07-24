Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCA922C60B
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 15:15:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE6868700F;
	Fri, 24 Jul 2020 13:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2QwX21RCSW5t; Fri, 24 Jul 2020 13:15:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DC9398704F;
	Fri, 24 Jul 2020 13:15:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC97EC004C;
	Fri, 24 Jul 2020 13:15:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23F40C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 13:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1296320368
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 13:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kv6WUIxFX9CM
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 13:15:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id D3E7A233A6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 13:15:07 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id b9so4400558plx.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 06:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WiftbphxWXSIjSEt+dXbqpQmYX6qU7iPeGCFcxYtSQA=;
 b=g81IDF80xys7hUQAi+tyjSjNlCK2qfjl6DMDLGBqdXprJsL04R7sE+Ppf7O4NRtfC/
 XOS//mUthsddkAAPYDi+LuEet2/oqqhYQgoLAQh+Ep3WLc5cGnB4l66lgpOXZcgQjH/2
 THm3HuX15vW0lFTMuAkgNbj59CAbfANYE0Hc+Aj0wV1aAg/Ykj/AyBVMwiYQIazUkq9p
 lBF0c8mFla78lkA0QbHIOhKwQQ3bZagwfLEZMbPDeJMyNGvAdTbg1NyKQnDLjSfzOoZu
 bxN9uRPeTkkk/F+N4xTxoxctv3RbyMtZPX1+RB0q8g72P11W9020iBvl6qF2ZP1/2LM0
 rkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WiftbphxWXSIjSEt+dXbqpQmYX6qU7iPeGCFcxYtSQA=;
 b=IShRcX3k7Limzhepp67Hu+O79onsB+f/jAVDgWJ3l1ejevS9lhAozlSUgnB1Qux+EL
 A4KNMCErfKZhi7Ekdey8Osul28O8EuFVrk7i+TFC9netg58AZSF+HmhWmMSqRUfgIawk
 6ZE6f4KPSvuBSrpRbi0rLiJ8U8cjXthw+R/4Imnwcqa0QJ77TJ5ieVcGCxGMon7irwvX
 O1KHUIZyDszx1PuRsuMwxsffjVkqvtDaX+Av44kkwe6iqPGWWM3OgmwQkb1HmYe0fKd8
 wjx7xDqQqUcPUHKZXgFfIyRUPdMAHW/7E6v+HAWE5pNq6Erk1Ah9ClVOLGcBgUzH+2Xp
 erig==
X-Gm-Message-State: AOAM533t5PfCtdwzPOxmYQjicchCfczeBdKlmEM8rcyqORurDxIjKknl
 dkal8HXct62d2CJEoGL5TwY=
X-Google-Smtp-Source: ABdhPJxDcJ3WwNc4e4B4k3cRPIw3LT71Pqkt7tkQKz15RWI12iCrEbS600oMqbiMl4hmSoD4ESVGAw==
X-Received: by 2002:a17:90b:300a:: with SMTP id
 hg10mr5327031pjb.211.1595596507027; 
 Fri, 24 Jul 2020 06:15:07 -0700 (PDT)
Received: from bobo.ibm.com (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id az16sm5871998pjb.7.2020.07.24.06.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 06:15:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 5/6] powerpc/qspinlock: optimised atomic_try_cmpxchg_lock
 that adds the lock hint
Date: Fri, 24 Jul 2020 23:14:22 +1000
Message-Id: <20200724131423.1362108-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200724131423.1362108-1-npiggin@gmail.com>
References: <20200724131423.1362108-1-npiggin@gmail.com>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
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

This brings the behaviour of the uncontended fast path back to roughly
equivalent to simple spinlocks -- a single atomic op with lock hint.

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
