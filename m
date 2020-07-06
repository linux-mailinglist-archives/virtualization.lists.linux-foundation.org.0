Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 294772151B6
	for <lists.virtualization@lfdr.de>; Mon,  6 Jul 2020 06:36:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C7F9A2039A;
	Mon,  6 Jul 2020 04:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2zJyNjGuQpwq; Mon,  6 Jul 2020 04:36:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 980C1203A7;
	Mon,  6 Jul 2020 04:36:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87791C0893;
	Mon,  6 Jul 2020 04:36:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3F8EC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D9B528765A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kyHIjALK7S62
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:36:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1EA9587601
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 04:36:12 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 17so40373470wmo.1
 for <virtualization@lists.linux-foundation.org>;
 Sun, 05 Jul 2020 21:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xjWMms9hqssB2L3Uqzup8R5/c6eD/F4/doDU2/0geL4=;
 b=Ctv2LBHpi05DYQhd625nEbMh7jHkAJJPHQG/NiH0dPj/+FZr5hafC4kMCAB+6OFSuW
 Fdvvukv7P4rH6xrLn4B+YMNSYzHYNKPYOB5Y1gAyLSwA8CTNZ1FpXcVUC4IXKVLDiQK1
 22UK6CDHKOdLAZ3EY5MTzGTid0MW4KokIZ5pvPUJOjOZkZQChKF1PjjYoN8sHdariJNS
 d5nKczqrRuFLxCU1gI+EGiXcCL93qDnqhprKW1KQsesaHNzkolsvz0f/671dbdh7k3LQ
 8K7FjTTCe6e+uYA/JOHNsJYg40fxzpIxFm4Wh+2aJpmeiptF1gpQOv0joBkZtfboK8//
 ceFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xjWMms9hqssB2L3Uqzup8R5/c6eD/F4/doDU2/0geL4=;
 b=S2mNJh3hy67nr2N6NEJLXn3BI0ALtg3aiJFstMom/nsulwsDKvqfU+Tk7NuL1kUtmS
 0tHFp4BOAz6QOuWJ19qUva9i04u0CTPDGt+JJGWTIwLAAJ8Biq7e675+EU1nOaSUF94i
 RzueDhLxWqqTJ9Lc4HPp/MPG1ba2jpCuma59qZFqwys5wxidvY9OLumXWBpZOxAX9nj8
 mQV6srgnftk3a2k10j+nHxkBHA7bFwLFFqp7FXY+M5j1VYKsnLYcI9ldvXL/cx9AQxkA
 gX5n4IJ1FJYJD9kU5ieJjJNSWlkbNKzVOEfvCgx9PbmtCOcCjRoiy8UkyWRsotRy8cwL
 VHsQ==
X-Gm-Message-State: AOAM533sQt56ZNIoZNO1kb7cCpw321AR643Dm6toBVGjwCgWzSc4YISY
 NWNnUl5mBbocUPNMAFkYm2I=
X-Google-Smtp-Source: ABdhPJzcIttoqOn7cqOAD1IMiPA4RpCdM1pvA18rmM0HvLHHJbruKYlLyRnrO9atUQzWu+juzXDkhw==
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr46989940wmk.39.1594010170256; 
 Sun, 05 Jul 2020 21:36:10 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id r10sm22202309wrm.17.2020.07.05.21.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 21:36:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/6] powerpc: move spinlock implementation to
 simple_spinlock
Date: Mon,  6 Jul 2020 14:35:37 +1000
Message-Id: <20200706043540.1563616-4-npiggin@gmail.com>
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

To prepare for queued spinlocks. This is a simple rename except to update
preprocessor guard name and a file reference.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/simple_spinlock.h    | 292 ++++++++++++++++++
 .../include/asm/simple_spinlock_types.h       |  21 ++
 arch/powerpc/include/asm/spinlock.h           | 285 +----------------
 arch/powerpc/include/asm/spinlock_types.h     |  12 +-
 4 files changed, 315 insertions(+), 295 deletions(-)
 create mode 100644 arch/powerpc/include/asm/simple_spinlock.h
 create mode 100644 arch/powerpc/include/asm/simple_spinlock_types.h

diff --git a/arch/powerpc/include/asm/simple_spinlock.h b/arch/powerpc/include/asm/simple_spinlock.h
new file mode 100644
index 000000000000..e048c041c4a9
--- /dev/null
+++ b/arch/powerpc/include/asm/simple_spinlock.h
@@ -0,0 +1,292 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __ASM_SIMPLE_SPINLOCK_H
+#define __ASM_SIMPLE_SPINLOCK_H
+#ifdef __KERNEL__
+
+/*
+ * Simple spin lock operations.  
+ *
+ * Copyright (C) 2001-2004 Paul Mackerras <paulus@au.ibm.com>, IBM
+ * Copyright (C) 2001 Anton Blanchard <anton@au.ibm.com>, IBM
+ * Copyright (C) 2002 Dave Engebretsen <engebret@us.ibm.com>, IBM
+ *	Rework to support virtual processors
+ *
+ * Type of int is used as a full 64b word is not necessary.
+ *
+ * (the type definitions are in asm/simple_spinlock_types.h)
+ */
+#include <linux/irqflags.h>
+#include <asm/paravirt.h>
+#ifdef CONFIG_PPC64
+#include <asm/paca.h>
+#endif
+#include <asm/synch.h>
+#include <asm/ppc-opcode.h>
+
+#ifdef CONFIG_PPC64
+/* use 0x800000yy when locked, where yy == CPU number */
+#ifdef __BIG_ENDIAN__
+#define LOCK_TOKEN	(*(u32 *)(&get_paca()->lock_token))
+#else
+#define LOCK_TOKEN	(*(u32 *)(&get_paca()->paca_index))
+#endif
+#else
+#define LOCK_TOKEN	1
+#endif
+
+static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
+{
+	return lock.slock == 0;
+}
+
+static inline int arch_spin_is_locked(arch_spinlock_t *lock)
+{
+	smp_mb();
+	return !arch_spin_value_unlocked(*lock);
+}
+
+/*
+ * This returns the old value in the lock, so we succeeded
+ * in getting the lock if the return value is 0.
+ */
+static inline unsigned long __arch_spin_trylock(arch_spinlock_t *lock)
+{
+	unsigned long tmp, token;
+
+	token = LOCK_TOKEN;
+	__asm__ __volatile__(
+"1:	" PPC_LWARX(%0,0,%2,1) "\n\
+	cmpwi		0,%0,0\n\
+	bne-		2f\n\
+	stwcx.		%1,0,%2\n\
+	bne-		1b\n"
+	PPC_ACQUIRE_BARRIER
+"2:"
+	: "=&r" (tmp)
+	: "r" (token), "r" (&lock->slock)
+	: "cr0", "memory");
+
+	return tmp;
+}
+
+static inline int arch_spin_trylock(arch_spinlock_t *lock)
+{
+	return __arch_spin_trylock(lock) == 0;
+}
+
+/*
+ * On a system with shared processors (that is, where a physical
+ * processor is multiplexed between several virtual processors),
+ * there is no point spinning on a lock if the holder of the lock
+ * isn't currently scheduled on a physical processor.  Instead
+ * we detect this situation and ask the hypervisor to give the
+ * rest of our timeslice to the lock holder.
+ *
+ * So that we can tell which virtual processor is holding a lock,
+ * we put 0x80000000 | smp_processor_id() in the lock when it is
+ * held.  Conveniently, we have a word in the paca that holds this
+ * value.
+ */
+
+#if defined(CONFIG_PPC_SPLPAR)
+/* We only yield to the hypervisor if we are in shared processor mode */
+void splpar_spin_yield(arch_spinlock_t *lock);
+void splpar_rw_yield(arch_rwlock_t *lock);
+#else /* SPLPAR */
+static inline void splpar_spin_yield(arch_spinlock_t *lock) {};
+static inline void splpar_rw_yield(arch_rwlock_t *lock) {};
+#endif
+
+static inline void spin_yield(arch_spinlock_t *lock)
+{
+	if (is_shared_processor())
+		splpar_spin_yield(lock);
+	else
+		barrier();
+}
+
+static inline void rw_yield(arch_rwlock_t *lock)
+{
+	if (is_shared_processor())
+		splpar_rw_yield(lock);
+	else
+		barrier();
+}
+
+static inline void arch_spin_lock(arch_spinlock_t *lock)
+{
+	while (1) {
+		if (likely(__arch_spin_trylock(lock) == 0))
+			break;
+		do {
+			HMT_low();
+			if (is_shared_processor())
+				splpar_spin_yield(lock);
+		} while (unlikely(lock->slock != 0));
+		HMT_medium();
+	}
+}
+
+static inline
+void arch_spin_lock_flags(arch_spinlock_t *lock, unsigned long flags)
+{
+	unsigned long flags_dis;
+
+	while (1) {
+		if (likely(__arch_spin_trylock(lock) == 0))
+			break;
+		local_save_flags(flags_dis);
+		local_irq_restore(flags);
+		do {
+			HMT_low();
+			if (is_shared_processor())
+				splpar_spin_yield(lock);
+		} while (unlikely(lock->slock != 0));
+		HMT_medium();
+		local_irq_restore(flags_dis);
+	}
+}
+#define arch_spin_lock_flags arch_spin_lock_flags
+
+static inline void arch_spin_unlock(arch_spinlock_t *lock)
+{
+	__asm__ __volatile__("# arch_spin_unlock\n\t"
+				PPC_RELEASE_BARRIER: : :"memory");
+	lock->slock = 0;
+}
+
+/*
+ * Read-write spinlocks, allowing multiple readers
+ * but only one writer.
+ *
+ * NOTE! it is quite common to have readers in interrupts
+ * but no interrupt writers. For those circumstances we
+ * can "mix" irq-safe locks - any writer needs to get a
+ * irq-safe write-lock, but readers can get non-irqsafe
+ * read-locks.
+ */
+
+#ifdef CONFIG_PPC64
+#define __DO_SIGN_EXTEND	"extsw	%0,%0\n"
+#define WRLOCK_TOKEN		LOCK_TOKEN	/* it's negative */
+#else
+#define __DO_SIGN_EXTEND
+#define WRLOCK_TOKEN		(-1)
+#endif
+
+/*
+ * This returns the old value in the lock + 1,
+ * so we got a read lock if the return value is > 0.
+ */
+static inline long __arch_read_trylock(arch_rwlock_t *rw)
+{
+	long tmp;
+
+	__asm__ __volatile__(
+"1:	" PPC_LWARX(%0,0,%1,1) "\n"
+	__DO_SIGN_EXTEND
+"	addic.		%0,%0,1\n\
+	ble-		2f\n"
+"	stwcx.		%0,0,%1\n\
+	bne-		1b\n"
+	PPC_ACQUIRE_BARRIER
+"2:"	: "=&r" (tmp)
+	: "r" (&rw->lock)
+	: "cr0", "xer", "memory");
+
+	return tmp;
+}
+
+/*
+ * This returns the old value in the lock,
+ * so we got the write lock if the return value is 0.
+ */
+static inline long __arch_write_trylock(arch_rwlock_t *rw)
+{
+	long tmp, token;
+
+	token = WRLOCK_TOKEN;
+	__asm__ __volatile__(
+"1:	" PPC_LWARX(%0,0,%2,1) "\n\
+	cmpwi		0,%0,0\n\
+	bne-		2f\n"
+"	stwcx.		%1,0,%2\n\
+	bne-		1b\n"
+	PPC_ACQUIRE_BARRIER
+"2:"	: "=&r" (tmp)
+	: "r" (token), "r" (&rw->lock)
+	: "cr0", "memory");
+
+	return tmp;
+}
+
+static inline void arch_read_lock(arch_rwlock_t *rw)
+{
+	while (1) {
+		if (likely(__arch_read_trylock(rw) > 0))
+			break;
+		do {
+			HMT_low();
+			if (is_shared_processor())
+				splpar_rw_yield(rw);
+		} while (unlikely(rw->lock < 0));
+		HMT_medium();
+	}
+}
+
+static inline void arch_write_lock(arch_rwlock_t *rw)
+{
+	while (1) {
+		if (likely(__arch_write_trylock(rw) == 0))
+			break;
+		do {
+			HMT_low();
+			if (is_shared_processor())
+				splpar_rw_yield(rw);
+		} while (unlikely(rw->lock != 0));
+		HMT_medium();
+	}
+}
+
+static inline int arch_read_trylock(arch_rwlock_t *rw)
+{
+	return __arch_read_trylock(rw) > 0;
+}
+
+static inline int arch_write_trylock(arch_rwlock_t *rw)
+{
+	return __arch_write_trylock(rw) == 0;
+}
+
+static inline void arch_read_unlock(arch_rwlock_t *rw)
+{
+	long tmp;
+
+	__asm__ __volatile__(
+	"# read_unlock\n\t"
+	PPC_RELEASE_BARRIER
+"1:	lwarx		%0,0,%1\n\
+	addic		%0,%0,-1\n"
+"	stwcx.		%0,0,%1\n\
+	bne-		1b"
+	: "=&r"(tmp)
+	: "r"(&rw->lock)
+	: "cr0", "xer", "memory");
+}
+
+static inline void arch_write_unlock(arch_rwlock_t *rw)
+{
+	__asm__ __volatile__("# write_unlock\n\t"
+				PPC_RELEASE_BARRIER: : :"memory");
+	rw->lock = 0;
+}
+
+#define arch_spin_relax(lock)	spin_yield(lock)
+#define arch_read_relax(lock)	rw_yield(lock)
+#define arch_write_relax(lock)	rw_yield(lock)
+
+/* See include/linux/spinlock.h */
+#define smp_mb__after_spinlock()   smp_mb()
+
+#endif /* __KERNEL__ */
+#endif /* __ASM_SIMPLE_SPINLOCK_H */
diff --git a/arch/powerpc/include/asm/simple_spinlock_types.h b/arch/powerpc/include/asm/simple_spinlock_types.h
new file mode 100644
index 000000000000..7c2b48ce62dc
--- /dev/null
+++ b/arch/powerpc/include/asm/simple_spinlock_types.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_SIMPLE_SPINLOCK_TYPES_H
+#define _ASM_POWERPC_SIMPLE_SPINLOCK_TYPES_H
+
+#ifndef __LINUX_SPINLOCK_TYPES_H
+# error "please don't include this file directly"
+#endif
+
+typedef struct {
+	volatile unsigned int slock;
+} arch_spinlock_t;
+
+#define __ARCH_SPIN_LOCK_UNLOCKED	{ 0 }
+
+typedef struct {
+	volatile signed int lock;
+} arch_rwlock_t;
+
+#define __ARCH_RW_LOCK_UNLOCKED		{ 0 }
+
+#endif
diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index 79be9bb10bbb..21357fe05fe0 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -3,290 +3,7 @@
 #define __ASM_SPINLOCK_H
 #ifdef __KERNEL__
 
-/*
- * Simple spin lock operations.  
- *
- * Copyright (C) 2001-2004 Paul Mackerras <paulus@au.ibm.com>, IBM
- * Copyright (C) 2001 Anton Blanchard <anton@au.ibm.com>, IBM
- * Copyright (C) 2002 Dave Engebretsen <engebret@us.ibm.com>, IBM
- *	Rework to support virtual processors
- *
- * Type of int is used as a full 64b word is not necessary.
- *
- * (the type definitions are in asm/spinlock_types.h)
- */
-#include <linux/irqflags.h>
-#include <asm/paravirt.h>
-#ifdef CONFIG_PPC64
-#include <asm/paca.h>
-#endif
-#include <asm/synch.h>
-#include <asm/ppc-opcode.h>
-
-#ifdef CONFIG_PPC64
-/* use 0x800000yy when locked, where yy == CPU number */
-#ifdef __BIG_ENDIAN__
-#define LOCK_TOKEN	(*(u32 *)(&get_paca()->lock_token))
-#else
-#define LOCK_TOKEN	(*(u32 *)(&get_paca()->paca_index))
-#endif
-#else
-#define LOCK_TOKEN	1
-#endif
-
-static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
-{
-	return lock.slock == 0;
-}
-
-static inline int arch_spin_is_locked(arch_spinlock_t *lock)
-{
-	smp_mb();
-	return !arch_spin_value_unlocked(*lock);
-}
-
-/*
- * This returns the old value in the lock, so we succeeded
- * in getting the lock if the return value is 0.
- */
-static inline unsigned long __arch_spin_trylock(arch_spinlock_t *lock)
-{
-	unsigned long tmp, token;
-
-	token = LOCK_TOKEN;
-	__asm__ __volatile__(
-"1:	" PPC_LWARX(%0,0,%2,1) "\n\
-	cmpwi		0,%0,0\n\
-	bne-		2f\n\
-	stwcx.		%1,0,%2\n\
-	bne-		1b\n"
-	PPC_ACQUIRE_BARRIER
-"2:"
-	: "=&r" (tmp)
-	: "r" (token), "r" (&lock->slock)
-	: "cr0", "memory");
-
-	return tmp;
-}
-
-static inline int arch_spin_trylock(arch_spinlock_t *lock)
-{
-	return __arch_spin_trylock(lock) == 0;
-}
-
-/*
- * On a system with shared processors (that is, where a physical
- * processor is multiplexed between several virtual processors),
- * there is no point spinning on a lock if the holder of the lock
- * isn't currently scheduled on a physical processor.  Instead
- * we detect this situation and ask the hypervisor to give the
- * rest of our timeslice to the lock holder.
- *
- * So that we can tell which virtual processor is holding a lock,
- * we put 0x80000000 | smp_processor_id() in the lock when it is
- * held.  Conveniently, we have a word in the paca that holds this
- * value.
- */
-
-#if defined(CONFIG_PPC_SPLPAR)
-/* We only yield to the hypervisor if we are in shared processor mode */
-void splpar_spin_yield(arch_spinlock_t *lock);
-void splpar_rw_yield(arch_rwlock_t *lock);
-#else /* SPLPAR */
-static inline void splpar_spin_yield(arch_spinlock_t *lock) {};
-static inline void splpar_rw_yield(arch_rwlock_t *lock) {};
-#endif
-
-static inline void spin_yield(arch_spinlock_t *lock)
-{
-	if (is_shared_processor())
-		splpar_spin_yield(lock);
-	else
-		barrier();
-}
-
-static inline void rw_yield(arch_rwlock_t *lock)
-{
-	if (is_shared_processor())
-		splpar_rw_yield(lock);
-	else
-		barrier();
-}
-
-static inline void arch_spin_lock(arch_spinlock_t *lock)
-{
-	while (1) {
-		if (likely(__arch_spin_trylock(lock) == 0))
-			break;
-		do {
-			HMT_low();
-			if (is_shared_processor())
-				splpar_spin_yield(lock);
-		} while (unlikely(lock->slock != 0));
-		HMT_medium();
-	}
-}
-
-static inline
-void arch_spin_lock_flags(arch_spinlock_t *lock, unsigned long flags)
-{
-	unsigned long flags_dis;
-
-	while (1) {
-		if (likely(__arch_spin_trylock(lock) == 0))
-			break;
-		local_save_flags(flags_dis);
-		local_irq_restore(flags);
-		do {
-			HMT_low();
-			if (is_shared_processor())
-				splpar_spin_yield(lock);
-		} while (unlikely(lock->slock != 0));
-		HMT_medium();
-		local_irq_restore(flags_dis);
-	}
-}
-#define arch_spin_lock_flags arch_spin_lock_flags
-
-static inline void arch_spin_unlock(arch_spinlock_t *lock)
-{
-	__asm__ __volatile__("# arch_spin_unlock\n\t"
-				PPC_RELEASE_BARRIER: : :"memory");
-	lock->slock = 0;
-}
-
-/*
- * Read-write spinlocks, allowing multiple readers
- * but only one writer.
- *
- * NOTE! it is quite common to have readers in interrupts
- * but no interrupt writers. For those circumstances we
- * can "mix" irq-safe locks - any writer needs to get a
- * irq-safe write-lock, but readers can get non-irqsafe
- * read-locks.
- */
-
-#ifdef CONFIG_PPC64
-#define __DO_SIGN_EXTEND	"extsw	%0,%0\n"
-#define WRLOCK_TOKEN		LOCK_TOKEN	/* it's negative */
-#else
-#define __DO_SIGN_EXTEND
-#define WRLOCK_TOKEN		(-1)
-#endif
-
-/*
- * This returns the old value in the lock + 1,
- * so we got a read lock if the return value is > 0.
- */
-static inline long __arch_read_trylock(arch_rwlock_t *rw)
-{
-	long tmp;
-
-	__asm__ __volatile__(
-"1:	" PPC_LWARX(%0,0,%1,1) "\n"
-	__DO_SIGN_EXTEND
-"	addic.		%0,%0,1\n\
-	ble-		2f\n"
-"	stwcx.		%0,0,%1\n\
-	bne-		1b\n"
-	PPC_ACQUIRE_BARRIER
-"2:"	: "=&r" (tmp)
-	: "r" (&rw->lock)
-	: "cr0", "xer", "memory");
-
-	return tmp;
-}
-
-/*
- * This returns the old value in the lock,
- * so we got the write lock if the return value is 0.
- */
-static inline long __arch_write_trylock(arch_rwlock_t *rw)
-{
-	long tmp, token;
-
-	token = WRLOCK_TOKEN;
-	__asm__ __volatile__(
-"1:	" PPC_LWARX(%0,0,%2,1) "\n\
-	cmpwi		0,%0,0\n\
-	bne-		2f\n"
-"	stwcx.		%1,0,%2\n\
-	bne-		1b\n"
-	PPC_ACQUIRE_BARRIER
-"2:"	: "=&r" (tmp)
-	: "r" (token), "r" (&rw->lock)
-	: "cr0", "memory");
-
-	return tmp;
-}
-
-static inline void arch_read_lock(arch_rwlock_t *rw)
-{
-	while (1) {
-		if (likely(__arch_read_trylock(rw) > 0))
-			break;
-		do {
-			HMT_low();
-			if (is_shared_processor())
-				splpar_rw_yield(rw);
-		} while (unlikely(rw->lock < 0));
-		HMT_medium();
-	}
-}
-
-static inline void arch_write_lock(arch_rwlock_t *rw)
-{
-	while (1) {
-		if (likely(__arch_write_trylock(rw) == 0))
-			break;
-		do {
-			HMT_low();
-			if (is_shared_processor())
-				splpar_rw_yield(rw);
-		} while (unlikely(rw->lock != 0));
-		HMT_medium();
-	}
-}
-
-static inline int arch_read_trylock(arch_rwlock_t *rw)
-{
-	return __arch_read_trylock(rw) > 0;
-}
-
-static inline int arch_write_trylock(arch_rwlock_t *rw)
-{
-	return __arch_write_trylock(rw) == 0;
-}
-
-static inline void arch_read_unlock(arch_rwlock_t *rw)
-{
-	long tmp;
-
-	__asm__ __volatile__(
-	"# read_unlock\n\t"
-	PPC_RELEASE_BARRIER
-"1:	lwarx		%0,0,%1\n\
-	addic		%0,%0,-1\n"
-"	stwcx.		%0,0,%1\n\
-	bne-		1b"
-	: "=&r"(tmp)
-	: "r"(&rw->lock)
-	: "cr0", "xer", "memory");
-}
-
-static inline void arch_write_unlock(arch_rwlock_t *rw)
-{
-	__asm__ __volatile__("# write_unlock\n\t"
-				PPC_RELEASE_BARRIER: : :"memory");
-	rw->lock = 0;
-}
-
-#define arch_spin_relax(lock)	spin_yield(lock)
-#define arch_read_relax(lock)	rw_yield(lock)
-#define arch_write_relax(lock)	rw_yield(lock)
-
-/* See include/linux/spinlock.h */
-#define smp_mb__after_spinlock()   smp_mb()
+#include <asm/simple_spinlock.h>
 
 #endif /* __KERNEL__ */
 #endif /* __ASM_SPINLOCK_H */
diff --git a/arch/powerpc/include/asm/spinlock_types.h b/arch/powerpc/include/asm/spinlock_types.h
index 87adaf13b7e8..3906f52dae65 100644
--- a/arch/powerpc/include/asm/spinlock_types.h
+++ b/arch/powerpc/include/asm/spinlock_types.h
@@ -6,16 +6,6 @@
 # error "please don't include this file directly"
 #endif
 
-typedef struct {
-	volatile unsigned int slock;
-} arch_spinlock_t;
-
-#define __ARCH_SPIN_LOCK_UNLOCKED	{ 0 }
-
-typedef struct {
-	volatile signed int lock;
-} arch_rwlock_t;
-
-#define __ARCH_RW_LOCK_UNLOCKED		{ 0 }
+#include <asm/simple_spinlock_types.h>
 
 #endif
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
