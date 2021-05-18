Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BF360386EC3
	for <lists.virtualization@lfdr.de>; Tue, 18 May 2021 03:09:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A4D60788;
	Tue, 18 May 2021 01:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzHMvznd0v98; Tue, 18 May 2021 01:09:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id D58C760758;
	Tue, 18 May 2021 01:09:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8420DC0001;
	Tue, 18 May 2021 01:09:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C08A4C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 May 2021 01:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A140640379
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 May 2021 01:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZuNBChwGuM2K
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 May 2021 01:09:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A4744036F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 May 2021 01:09:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7CF061396;
 Tue, 18 May 2021 01:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621300184;
 bh=i/k9sDwLtgjF9ZDK+tYLppWwTyek+Su3iUDSGJxFHZ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dp1s1+qxJEtxReLQX1dJ4SI41c308aoHtDa6o/C5VaFaoPf0MBEKOKJsZ2a0uzdaG
 PU3xc+jtlybyEHqmc/NdzHxY6l4Ef4q6B2ieyDjjzJCiVtqa9bg2ee8VBulgCY/0EB
 4IPmbQ/zf0P2lcZsEqhA1MdQJYGVc/hQJPG80ZD9V2JUpo9NPp8TMnSQj7asfOMbXn
 wDFYwEFqEb4yaQcqZiUU3PHZ3KMa4DEhwtW5jf+ryD+l0sd506xhiQkKG3Q94N33AK
 i+ff+cJmAKtCqOrLe2lxsiKHE5/kI8j8q9PhS2x/x2d+bC7C7/TbBZab97cBaXKdr7
 g8hcWLkvCsdVQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 2/5] powerpc/pseries: Fix hcall tracing recursion
 in pv queued spinlocks
Date: Mon, 17 May 2021 21:09:37 -0400
Message-Id: <20210518010940.1485417-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518010940.1485417-1-sashal@kernel.org>
References: <20210518010940.1485417-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
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

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 2c8c89b95831f46a2fb31a8d0fef4601694023ce ]

The paravit queued spinlock slow path adds itself to the queue then
calls pv_wait to wait for the lock to become free. This is implemented
by calling H_CONFER to donate cycles.

When hcall tracing is enabled, this H_CONFER call can lead to a spin
lock being taken in the tracing code, which will result in the lock to
be taken again, which will also go to the slow path because it queues
behind itself and so won't ever make progress.

An example trace of a deadlock:

  __pv_queued_spin_lock_slowpath
  trace_clock_global
  ring_buffer_lock_reserve
  trace_event_buffer_lock_reserve
  trace_event_buffer_reserve
  trace_event_raw_event_hcall_exit
  __trace_hcall_exit
  plpar_hcall_norets_trace
  __pv_queued_spin_lock_slowpath
  trace_clock_global
  ring_buffer_lock_reserve
  trace_event_buffer_lock_reserve
  trace_event_buffer_reserve
  trace_event_raw_event_rcu_dyntick
  rcu_irq_exit
  irq_exit
  __do_irq
  call_do_irq
  do_IRQ
  hardware_interrupt_common_virt

Fix this by introducing plpar_hcall_norets_notrace(), and using that to
make SPLPAR virtual processor dispatching hcalls by the paravirt
spinlock code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20210508101455.1578318-2-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/hvcall.h       |  3 +++
 arch/powerpc/include/asm/paravirt.h     | 22 +++++++++++++++++++---
 arch/powerpc/platforms/pseries/hvCall.S | 10 ++++++++++
 arch/powerpc/platforms/pseries/lpar.c   |  3 +--
 4 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index ed6086d57b22..0c92b01a3c3c 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -446,6 +446,9 @@
  */
 long plpar_hcall_norets(unsigned long opcode, ...);
 
+/* Variant which does not do hcall tracing */
+long plpar_hcall_norets_notrace(unsigned long opcode, ...);
+
 /**
  * plpar_hcall: - Make a pseries hypervisor call
  * @opcode: The hypervisor call to make.
diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index 5d1726bb28e7..bcb7b5f917be 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -28,19 +28,35 @@ static inline u32 yield_count_of(int cpu)
 	return be32_to_cpu(yield_count);
 }
 
+/*
+ * Spinlock code confers and prods, so don't trace the hcalls because the
+ * tracing code takes spinlocks which can cause recursion deadlocks.
+ *
+ * These calls are made while the lock is not held: the lock slowpath yields if
+ * it can not acquire the lock, and unlock slow path might prod if a waiter has
+ * yielded). So this may not be a problem for simple spin locks because the
+ * tracing does not technically recurse on the lock, but we avoid it anyway.
+ *
+ * However the queued spin lock contended path is more strictly ordered: the
+ * H_CONFER hcall is made after the task has queued itself on the lock, so then
+ * recursing on that lock will cause the task to then queue up again behind the
+ * first instance (or worse: queued spinlocks use tricks that assume a context
+ * never waits on more than one spinlock, so such recursion may cause random
+ * corruption in the lock code).
+ */
 static inline void yield_to_preempted(int cpu, u32 yield_count)
 {
-	plpar_hcall_norets(H_CONFER, get_hard_smp_processor_id(cpu), yield_count);
+	plpar_hcall_norets_notrace(H_CONFER, get_hard_smp_processor_id(cpu), yield_count);
 }
 
 static inline void prod_cpu(int cpu)
 {
-	plpar_hcall_norets(H_PROD, get_hard_smp_processor_id(cpu));
+	plpar_hcall_norets_notrace(H_PROD, get_hard_smp_processor_id(cpu));
 }
 
 static inline void yield_to_any(void)
 {
-	plpar_hcall_norets(H_CONFER, -1, 0);
+	plpar_hcall_norets_notrace(H_CONFER, -1, 0);
 }
 #else
 static inline bool is_shared_processor(void)
diff --git a/arch/powerpc/platforms/pseries/hvCall.S b/arch/powerpc/platforms/pseries/hvCall.S
index 2136e42833af..8a2b8d64265b 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -102,6 +102,16 @@ END_FTR_SECTION(0, 1);						\
 #define HCALL_BRANCH(LABEL)
 #endif
 
+_GLOBAL_TOC(plpar_hcall_norets_notrace)
+	HMT_MEDIUM
+
+	mfcr	r0
+	stw	r0,8(r1)
+	HVSC				/* invoke the hypervisor */
+	lwz	r0,8(r1)
+	mtcrf	0xff,r0
+	blr				/* return r3 = status */
+
 _GLOBAL_TOC(plpar_hcall_norets)
 	HMT_MEDIUM
 
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index cd38bd421f38..d4aa6a46e1fa 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1830,8 +1830,7 @@ void hcall_tracepoint_unregfunc(void)
 
 /*
  * Since the tracing code might execute hcalls we need to guard against
- * recursion. One example of this are spinlocks calling H_YIELD on
- * shared processor partitions.
+ * recursion.
  */
 static DEFINE_PER_CPU(unsigned int, hcall_trace_depth);
 
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
