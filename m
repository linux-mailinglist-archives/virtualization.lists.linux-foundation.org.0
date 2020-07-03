Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F58213511
	for <lists.virtualization@lfdr.de>; Fri,  3 Jul 2020 09:35:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8D90E87D70;
	Fri,  3 Jul 2020 07:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2mn8i2AQ8mS; Fri,  3 Jul 2020 07:35:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B2BED87D6F;
	Fri,  3 Jul 2020 07:35:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 871EFC0733;
	Fri,  3 Jul 2020 07:35:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA844C0733
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B715887D70
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6m7y1k_VfI1k
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:35:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 27ED887D6F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 07:35:39 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z5so14714538pgb.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Jul 2020 00:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c7no+9nj4ki/bMOC81yoyKciU109ZEB92uhR/9nSW+8=;
 b=vRY66vm5FUDJEsoGFGavRJYjEmtgpHX1dXQAAwctS12/ThOZ3C43SojkqpLZMdIBeU
 yJOG6e8GkbPpoFk+cp2MyDTxkAS0wBV/op1dm0KXvl4hvlb9CRK70mRasL0ApGy8d32M
 L1k0ms5+dYiDN+n7C+ToTaEBJD560EG/e3VQ1vV14W7dLSDpsbNc7WCoHm45EtgOyV++
 ZVolDBVx+Zh06Rnsl3LltBhr4/DW7vZbLKdgmlJ0NkfzSJHmiw2tCgPuOm1mCQ7Pifta
 gcoyHA0qONEU3V3uF6BnP0nLJbEF2dpLVAL+pVMwyXcbqoNDePIk7twc0ImapzJ62zjP
 XU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c7no+9nj4ki/bMOC81yoyKciU109ZEB92uhR/9nSW+8=;
 b=nYCGr995EiaiddgMJ3A2wjd7Odi9f7QH4DTD+8LT8sC6pTY+mtn5Gpasm9zEa+USVx
 msusgHjJdeomUxfkRiKxG88ZKd82sQuFOeVb4oDErWIoDNYTRD4KBV3OXT0q6wIC+SMe
 hd7xurN6yhteFRA3ZqClan01D8anVlIeUszaGOFNmIKDYCrE9lkA4l2ou0crd3Upq8I1
 7cuzp4GU5eqjjlmghe3BQlWV18NjMdEus8ALATouUI3FDtfM5nGHshazefrosxaA/KTo
 JN18UHLblZ7c3Ack9wUb9KP6ZeYYBzO4H7hffwJqFdne+yJ4vJct9Odf/np9zl9kG8o7
 fGHw==
X-Gm-Message-State: AOAM533dVmj9gBpRVz4OgCpEUk0ohVnpTSXnIIY9U92oKthXTI8L5Bez
 NpbnF63JY3bkaNRZIDEWIQA=
X-Google-Smtp-Source: ABdhPJx2xxNwxRVsH+jvqrol9Go/a3kXU8z8PyOlzC5MYZAoajDNq2y4DQYDm+PXAElKBlllmfz+5w==
X-Received: by 2002:a62:79cd:: with SMTP id
 u196mr22270293pfc.152.1593761738795; 
 Fri, 03 Jul 2020 00:35:38 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id y7sm10218499pgk.93.2020.07.03.00.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 00:35:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH v2 2/6] powerpc/pseries: move some PAPR paravirt functions to
 their own file
Date: Fri,  3 Jul 2020 17:35:12 +1000
Message-Id: <20200703073516.1354108-3-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/paravirt.h | 61 +++++++++++++++++++++++++++++
 arch/powerpc/include/asm/spinlock.h | 24 +-----------
 arch/powerpc/lib/locks.c            | 12 +++---
 3 files changed, 68 insertions(+), 29 deletions(-)
 create mode 100644 arch/powerpc/include/asm/paravirt.h

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
new file mode 100644
index 000000000000..7a8546660a63
--- /dev/null
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __ASM_PARAVIRT_H
+#define __ASM_PARAVIRT_H
+#ifdef __KERNEL__
+
+#include <linux/jump_label.h>
+#include <asm/smp.h>
+#ifdef CONFIG_PPC64
+#include <asm/paca.h>
+#include <asm/hvcall.h>
+#endif
+
+#ifdef CONFIG_PPC_SPLPAR
+DECLARE_STATIC_KEY_FALSE(shared_processor);
+
+static inline bool is_shared_processor(void)
+{
+	return static_branch_unlikely(&shared_processor);
+}
+
+/* If bit 0 is set, the cpu has been preempted */
+static inline u32 yield_count_of(int cpu)
+{
+	__be32 yield_count = READ_ONCE(lppaca_of(cpu).yield_count);
+	return be32_to_cpu(yield_count);
+}
+
+static inline void yield_to_preempted(int cpu, u32 yield_count)
+{
+	plpar_hcall_norets(H_CONFER, get_hard_smp_processor_id(cpu), yield_count);
+}
+#else
+static inline bool is_shared_processor(void)
+{
+	return false;
+}
+
+static inline u32 yield_count_of(int cpu)
+{
+	return 0;
+}
+
+extern void ___bad_yield_to_preempted(void);
+static inline void yield_to_preempted(int cpu, u32 yield_count)
+{
+	___bad_yield_to_preempted(); /* This would be a bug */
+}
+#endif
+
+#define vcpu_is_preempted vcpu_is_preempted
+static inline bool vcpu_is_preempted(int cpu)
+{
+	if (!is_shared_processor())
+		return false;
+	if (yield_count_of(cpu) & 1)
+		return true;
+	return false;
+}
+
+#endif /* __KERNEL__ */
+#endif /* __ASM_PARAVIRT_H */
diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index 2d620896cdae..79be9bb10bbb 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -15,11 +15,10 @@
  *
  * (the type definitions are in asm/spinlock_types.h)
  */
-#include <linux/jump_label.h>
 #include <linux/irqflags.h>
+#include <asm/paravirt.h>
 #ifdef CONFIG_PPC64
 #include <asm/paca.h>
-#include <asm/hvcall.h>
 #endif
 #include <asm/synch.h>
 #include <asm/ppc-opcode.h>
@@ -35,18 +34,6 @@
 #define LOCK_TOKEN	1
 #endif
 
-#ifdef CONFIG_PPC_PSERIES
-DECLARE_STATIC_KEY_FALSE(shared_processor);
-
-#define vcpu_is_preempted vcpu_is_preempted
-static inline bool vcpu_is_preempted(int cpu)
-{
-	if (!static_branch_unlikely(&shared_processor))
-		return false;
-	return !!(be32_to_cpu(lppaca_of(cpu).yield_count) & 1);
-}
-#endif
-
 static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
 {
 	return lock.slock == 0;
@@ -110,15 +97,6 @@ static inline void splpar_spin_yield(arch_spinlock_t *lock) {};
 static inline void splpar_rw_yield(arch_rwlock_t *lock) {};
 #endif
 
-static inline bool is_shared_processor(void)
-{
-#ifdef CONFIG_PPC_SPLPAR
-	return static_branch_unlikely(&shared_processor);
-#else
-	return false;
-#endif
-}
-
 static inline void spin_yield(arch_spinlock_t *lock)
 {
 	if (is_shared_processor())
diff --git a/arch/powerpc/lib/locks.c b/arch/powerpc/lib/locks.c
index 6440d5943c00..04165b7a163f 100644
--- a/arch/powerpc/lib/locks.c
+++ b/arch/powerpc/lib/locks.c
@@ -27,14 +27,14 @@ void splpar_spin_yield(arch_spinlock_t *lock)
 		return;
 	holder_cpu = lock_value & 0xffff;
 	BUG_ON(holder_cpu >= NR_CPUS);
-	yield_count = be32_to_cpu(lppaca_of(holder_cpu).yield_count);
+
+	yield_count = yield_count_of(holder_cpu);
 	if ((yield_count & 1) == 0)
 		return;		/* virtual cpu is currently running */
 	rmb();
 	if (lock->slock != lock_value)
 		return;		/* something has changed */
-	plpar_hcall_norets(H_CONFER,
-		get_hard_smp_processor_id(holder_cpu), yield_count);
+	yield_to_preempted(holder_cpu, yield_count);
 }
 EXPORT_SYMBOL_GPL(splpar_spin_yield);
 
@@ -53,13 +53,13 @@ void splpar_rw_yield(arch_rwlock_t *rw)
 		return;		/* no write lock at present */
 	holder_cpu = lock_value & 0xffff;
 	BUG_ON(holder_cpu >= NR_CPUS);
-	yield_count = be32_to_cpu(lppaca_of(holder_cpu).yield_count);
+
+	yield_count = yield_count_of(holder_cpu);
 	if ((yield_count & 1) == 0)
 		return;		/* virtual cpu is currently running */
 	rmb();
 	if (rw->lock != lock_value)
 		return;		/* something has changed */
-	plpar_hcall_norets(H_CONFER,
-		get_hard_smp_processor_id(holder_cpu), yield_count);
+	yield_to_preempted(holder_cpu, yield_count);
 }
 #endif
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
