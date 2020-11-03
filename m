Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E942A422E
	for <lists.virtualization@lfdr.de>; Tue,  3 Nov 2020 11:34:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 83EDF868C2;
	Tue,  3 Nov 2020 10:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j5HorGorDOek; Tue,  3 Nov 2020 10:34:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E08F85C10;
	Tue,  3 Nov 2020 10:34:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66DC2C0051;
	Tue,  3 Nov 2020 10:34:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E817CC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D9D4286EBB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DnvaypIk7jrk
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1B5E0870E8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 10:33:57 +0000 (UTC)
Message-Id: <20201103095858.928160966@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=Sj7ujMQG8Pikgi1SaAA6FKKi3J+PrOgKR0lWBRPpqX0=;
 b=1VOEfDVFZmx2aRF7NIXJWbldvpbKmvKykyskU6rtkXPPBe5nnNLskI8lCCnqQNLk1P1c91
 566zbE5metNSU87SvaJqZdO2LL+dj1GNHv5VXLRmIMhdOUP3rj4Dx8qV0B13wmRK1bFNxQ
 4PLxmsGJ9vvRmK4Uu88EHppz5O8hwHizE5bXQlmqSNqaoNPB1luLQDZpvqOg9BqxoBPr/5
 K47wWQw+mNgWsMEn8ZxOVqc5BZXlwl6iZ6HvsxgxfqP3zKGi811pnavdbB0LYfzRw8LVQR
 1EhOmQs8gjK34B0JgnnXR1HkV23Xx7Jf4rfwhSI5drdF0IeiHwORw9Crw3R5Ng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=Sj7ujMQG8Pikgi1SaAA6FKKi3J+PrOgKR0lWBRPpqX0=;
 b=k835MHfI+zh7GQNJZBNkAIxMhS3d2ArgKIVieRXtccdpV7cLYn2RAMdfkD3wEmSj1touvr
 5EH/hsWNFwf+bWAw==
Date: Tue, 03 Nov 2020 10:27:35 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 23/37] sched: Make migrate_disable/enable() independent of
 RT
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Benjamin LaHaise <bcrl@kvack.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org,
 Greentime Hu <green.hu@gmail.com>
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

Now that the scheduler can deal with migrate disable properly, there is no
real compelling reason to make it only available for RT.

There are quite some code pathes which needlessly disable preemption in
order to prevent migration and some constructs like kmap_atomic() enforce
it implicitly.

Making it available independent of RT allows to provide a preemptible
variant of kmap_atomic() and makes the code more consistent in general.

FIXME: Rework the comment in preempt.h

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Daniel Bristot de Oliveira <bristot@redhat.com>
---
 include/linux/kernel.h  |   21 ++++++++++++++-------
 include/linux/preempt.h |   38 +++-----------------------------------
 include/linux/sched.h   |    2 +-
 kernel/sched/core.c     |   45 +++++++++++++++++++++++++++++++++++----------
 kernel/sched/sched.h    |    4 ++--
 lib/smp_processor_id.c  |    2 +-
 6 files changed, 56 insertions(+), 56 deletions(-)

--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -204,6 +204,7 @@ extern int _cond_resched(void);
 extern void ___might_sleep(const char *file, int line, int preempt_offset);
 extern void __might_sleep(const char *file, int line, int preempt_offset);
 extern void __cant_sleep(const char *file, int line, int preempt_offset);
+extern void __cant_migrate(const char *file, int line);
 
 /**
  * might_sleep - annotation for functions that can sleep
@@ -227,6 +228,18 @@ extern void __cant_sleep(const char *fil
 # define cant_sleep() \
 	do { __cant_sleep(__FILE__, __LINE__, 0); } while (0)
 # define sched_annotate_sleep()	(current->task_state_change = 0)
+
+/**
+ * cant_migrate - annotation for functions that cannot migrate
+ *
+ * Will print a stack trace if executed in code which is migratable
+ */
+# define cant_migrate()							\
+	do {								\
+		if (IS_ENABLED(CONFIG_SMP))				\
+			__cant_migrate(__FILE__, __LINE__);		\
+	} while (0)
+
 /**
  * non_block_start - annotate the start of section where sleeping is prohibited
  *
@@ -251,6 +264,7 @@ extern void __cant_sleep(const char *fil
 				   int preempt_offset) { }
 # define might_sleep() do { might_resched(); } while (0)
 # define cant_sleep() do { } while (0)
+# define cant_migrate()		do { } while (0)
 # define sched_annotate_sleep() do { } while (0)
 # define non_block_start() do { } while (0)
 # define non_block_end() do { } while (0)
@@ -258,13 +272,6 @@ extern void __cant_sleep(const char *fil
 
 #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
 
-#ifndef CONFIG_PREEMPT_RT
-# define cant_migrate()		cant_sleep()
-#else
-  /* Placeholder for now */
-# define cant_migrate()		do { } while (0)
-#endif
-
 /**
  * abs - return absolute value of an argument
  * @x: the value.  If it is unsigned type, it is converted to signed type first.
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -322,7 +322,7 @@ static inline void preempt_notifier_init
 
 #endif
 
-#if defined(CONFIG_SMP) && defined(CONFIG_PREEMPT_RT)
+#ifdef CONFIG_SMP
 
 /*
  * Migrate-Disable and why it is undesired.
@@ -382,43 +382,11 @@ static inline void preempt_notifier_init
 extern void migrate_disable(void);
 extern void migrate_enable(void);
 
-#elif defined(CONFIG_PREEMPT_RT)
+#else
 
 static inline void migrate_disable(void) { }
 static inline void migrate_enable(void) { }
 
-#else /* !CONFIG_PREEMPT_RT */
-
-/**
- * migrate_disable - Prevent migration of the current task
- *
- * Maps to preempt_disable() which also disables preemption. Use
- * migrate_disable() to annotate that the intent is to prevent migration,
- * but not necessarily preemption.
- *
- * Can be invoked nested like preempt_disable() and needs the corresponding
- * number of migrate_enable() invocations.
- */
-static __always_inline void migrate_disable(void)
-{
-	preempt_disable();
-}
-
-/**
- * migrate_enable - Allow migration of the current task
- *
- * Counterpart to migrate_disable().
- *
- * As migrate_disable() can be invoked nested, only the outermost invocation
- * reenables migration.
- *
- * Currently mapped to preempt_enable().
- */
-static __always_inline void migrate_enable(void)
-{
-	preempt_enable();
-}
-
-#endif /* CONFIG_SMP && CONFIG_PREEMPT_RT */
+#endif /* CONFIG_SMP */
 
 #endif /* __LINUX_PREEMPT_H */
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -715,7 +715,7 @@ struct task_struct {
 	const cpumask_t			*cpus_ptr;
 	cpumask_t			cpus_mask;
 	void				*migration_pending;
-#if defined(CONFIG_SMP) && defined(CONFIG_PREEMPT_RT)
+#ifdef CONFIG_SMP
 	unsigned short			migration_disabled;
 #endif
 	unsigned short			migration_flags;
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1696,8 +1696,6 @@ void check_preempt_curr(struct rq *rq, s
 
 #ifdef CONFIG_SMP
 
-#ifdef CONFIG_PREEMPT_RT
-
 static void
 __do_set_cpus_allowed(struct task_struct *p, const struct cpumask *new_mask, u32 flags);
 
@@ -1772,8 +1770,6 @@ static inline bool rq_has_pinned_tasks(s
 	return rq->nr_pinned;
 }
 
-#endif
-
 /*
  * Per-CPU kthreads are allowed to run on !active && online CPUs, see
  * __set_cpus_allowed_ptr() and select_fallback_rq().
@@ -2841,7 +2837,7 @@ void sched_set_stop_task(int cpu, struct
 	}
 }
 
-#else
+#else /* CONFIG_SMP */
 
 static inline int __set_cpus_allowed_ptr(struct task_struct *p,
 					 const struct cpumask *new_mask,
@@ -2850,10 +2846,6 @@ static inline int __set_cpus_allowed_ptr
 	return set_cpus_allowed_ptr(p, new_mask);
 }
 
-#endif /* CONFIG_SMP */
-
-#if !defined(CONFIG_SMP) || !defined(CONFIG_PREEMPT_RT)
-
 static inline void migrate_disable_switch(struct rq *rq, struct task_struct *p) { }
 
 static inline bool rq_has_pinned_tasks(struct rq *rq)
@@ -2861,7 +2853,7 @@ static inline bool rq_has_pinned_tasks(s
 	return false;
 }
 
-#endif
+#endif /* !CONFIG_SMP */
 
 static void
 ttwu_stat(struct task_struct *p, int cpu, int wake_flags)
@@ -7883,6 +7875,39 @@ void __cant_sleep(const char *file, int
 	add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
 }
 EXPORT_SYMBOL_GPL(__cant_sleep);
+
+#ifdef CONFIG_SMP
+void __cant_migrate(const char *file, int line)
+{
+	static unsigned long prev_jiffy;
+
+	if (irqs_disabled())
+		return;
+
+	if (is_migration_disabled(current))
+		return;
+
+	if (!IS_ENABLED(CONFIG_PREEMPT_COUNT))
+		return;
+
+	if (preempt_count() > 0)
+		return;
+
+	if (time_before(jiffies, prev_jiffy + HZ) && prev_jiffy)
+		return;
+	prev_jiffy = jiffies;
+
+	pr_err("BUG: assuming non migratable context at %s:%d\n", file, line);
+	pr_err("in_atomic(): %d, irqs_disabled(): %d, migration_disabled() %u pid: %d, name: %s\n",
+	       in_atomic(), irqs_disabled(), is_migration_disabled(current),
+	       current->pid, current->comm);
+
+	debug_show_held_locks(current);
+	dump_stack();
+	add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
+}
+EXPORT_SYMBOL_GPL(__cant_migrate);
+#endif
 #endif
 
 #ifdef CONFIG_MAGIC_SYSRQ
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1056,7 +1056,7 @@ struct rq {
 	struct cpuidle_state	*idle_state;
 #endif
 
-#if defined(CONFIG_PREEMPT_RT) && defined(CONFIG_SMP)
+#ifdef CONFIG_SMP
 	unsigned int		nr_pinned;
 #endif
 	unsigned int		push_busy;
@@ -1092,7 +1092,7 @@ static inline int cpu_of(struct rq *rq)
 
 static inline bool is_migration_disabled(struct task_struct *p)
 {
-#if defined(CONFIG_SMP) && defined(CONFIG_PREEMPT_RT)
+#ifdef CONFIG_SMP
 	return p->migration_disabled;
 #else
 	return false;
--- a/lib/smp_processor_id.c
+++ b/lib/smp_processor_id.c
@@ -26,7 +26,7 @@ unsigned int check_preemption_disabled(c
 	if (current->nr_cpus_allowed == 1)
 		goto out;
 
-#if defined(CONFIG_SMP) && defined(CONFIG_PREEMPT_RT)
+#ifdef CONFIG_SMP
 	if (current->migration_disabled)
 		goto out;
 #endif

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
