Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4751767CF91
	for <lists.virtualization@lfdr.de>; Thu, 26 Jan 2023 16:15:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3479082280;
	Thu, 26 Jan 2023 15:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3479082280
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=vx0yzVEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13Kzu9BYN70i; Thu, 26 Jan 2023 15:15:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C84E081B26;
	Thu, 26 Jan 2023 15:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C84E081B26
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2335AC002D;
	Thu, 26 Jan 2023 15:15:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81222C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Jan 2023 15:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B41481B26
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Jan 2023 15:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B41481B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQhaLcC_5gp1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Jan 2023 15:15:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FFA181B25
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FFA181B25
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Jan 2023 15:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=l0DzCOJq4iPL3KosVlP6zvOaIMnRWOgU4qXiR+sg9ls=; b=vx0yzVEBCZzmRcRsPn/H2gna9O
 LvAeJI8uoFar8HqBemiwvXrejXgtgwV4z+UmZfzTVhtlr//iJe71lbkexUn9i+umTWkjRgTBnopyT
 sWoxB93i1+RklzZSidY8m2MJTviacK+tjSxFCtLEpJILXssOV1ar+ITNIZBEWz6hBd0aYZG/EGoL9
 TNRwr3yG9DZ0NyE42Mc3tfn5PtoF3lCVGGz1FQG4W4pHeVUHX7i8AdAU1iTioeLECvcDSq7QHfkYY
 LDeDK8zB8jpiDfJ1Z5nm+x/z/G6UEbwuD9QAVzusi4Hq0nq9Z640wanoqrhYjUP3ouydeJfVEPQik
 NLl/l6zw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pL3xn-006qUD-F6; Thu, 26 Jan 2023 15:14:56 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2EAEA300ECD;
 Thu, 26 Jan 2023 16:14:53 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id 0DDD020138B1D; Thu, 26 Jan 2023 16:14:53 +0100 (CET)
Message-ID: <20230126151323.408156109@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 26 Jan 2023 16:08:31 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Subject: [PATCH v2 2/9] bug: Disable rcu_is_watching() during WARN/BUG
References: <20230126150829.087606759@infradead.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, juri.lelli@redhat.com, daniel.lezcano@linaro.org,
 wanpengli@tencent.com, kvm@vger.kernel.org, rafael@kernel.org,
 peterz@infradead.org, lpieralisi@kernel.org, dave.hansen@linux.intel.com,
 virtualization@lists.linux-foundation.org, bsegall@google.com,
 amakhalov@vmware.com, will@kernel.org, tglx@linutronix.de, vschneid@redhat.com,
 hpa@zytor.com, x86@kernel.org, pv-drivers@vmware.com, mingo@redhat.com,
 mgorman@suse.de, longman@redhat.com, frederic@kernel.org,
 linux-trace-kernel@vger.kernel.org, paulmck@kernel.org,
 linux-pm@vger.kernel.org, boqun.feng@gmail.com, rostedt@goodmis.org,
 bp@alien8.de, vincent.guittot@linaro.org, boris.ostrovsky@oracle.com,
 dietmar.eggemann@arm.com, jgross@suse.com, seanjc@google.com,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org, pbonzini@redhat.com,
 bristot@redhat.com
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

In order to avoid WARN/BUG from generating nested or even recursive
warnings, force rcu_is_watching() true during
WARN/lockdep_rcu_suspicious().

Notably things like unwinding the stack can trigger rcu_dereference()
warnings, which then triggers more unwinding which then triggers more
warnings etc..

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/context_tracking.h |   27 +++++++++++++++++++++++++++
 kernel/locking/lockdep.c         |    3 +++
 kernel/panic.c                   |    5 +++++
 lib/bug.c                        |   15 ++++++++++++++-
 4 files changed, 49 insertions(+), 1 deletion(-)

--- a/include/linux/context_tracking.h
+++ b/include/linux/context_tracking.h
@@ -130,9 +130,36 @@ static __always_inline unsigned long ct_
 	return arch_atomic_add_return(incby, this_cpu_ptr(&context_tracking.state));
 }
 
+static __always_inline bool warn_rcu_enter(void)
+{
+	bool ret = false;
+
+	/*
+	 * Horrible hack to shut up recursive RCU isn't watching fail since
+	 * lots of the actual reporting also relies on RCU.
+	 */
+	preempt_disable_notrace();
+	if (rcu_dynticks_curr_cpu_in_eqs()) {
+		ret = true;
+		ct_state_inc(RCU_DYNTICKS_IDX);
+	}
+
+	return ret;
+}
+
+static __always_inline void warn_rcu_exit(bool rcu)
+{
+	if (rcu)
+		ct_state_inc(RCU_DYNTICKS_IDX);
+	preempt_enable_notrace();
+}
+
 #else
 static inline void ct_idle_enter(void) { }
 static inline void ct_idle_exit(void) { }
+
+static __always_inline bool warn_rcu_enter(void) { return false; }
+static __always_inline void warn_rcu_exit(bool rcu) { }
 #endif /* !CONFIG_CONTEXT_TRACKING_IDLE */
 
 #endif
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -55,6 +55,7 @@
 #include <linux/rcupdate.h>
 #include <linux/kprobes.h>
 #include <linux/lockdep.h>
+#include <linux/context_tracking.h>
 
 #include <asm/sections.h>
 
@@ -6555,6 +6556,7 @@ void lockdep_rcu_suspicious(const char *
 {
 	struct task_struct *curr = current;
 	int dl = READ_ONCE(debug_locks);
+	bool rcu = warn_rcu_enter();
 
 	/* Note: the following can be executed concurrently, so be careful. */
 	pr_warn("\n");
@@ -6595,5 +6597,6 @@ void lockdep_rcu_suspicious(const char *
 	lockdep_print_held_locks(curr);
 	pr_warn("\nstack backtrace:\n");
 	dump_stack();
+	warn_rcu_exit(rcu);
 }
 EXPORT_SYMBOL_GPL(lockdep_rcu_suspicious);
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -34,6 +34,7 @@
 #include <linux/ratelimit.h>
 #include <linux/debugfs.h>
 #include <linux/sysfs.h>
+#include <linux/context_tracking.h>
 #include <trace/events/error_report.h>
 #include <asm/sections.h>
 
@@ -679,6 +680,7 @@ void __warn(const char *file, int line,
 void warn_slowpath_fmt(const char *file, int line, unsigned taint,
 		       const char *fmt, ...)
 {
+	bool rcu = warn_rcu_enter();
 	struct warn_args args;
 
 	pr_warn(CUT_HERE);
@@ -693,11 +695,13 @@ void warn_slowpath_fmt(const char *file,
 	va_start(args.args, fmt);
 	__warn(file, line, __builtin_return_address(0), taint, NULL, &args);
 	va_end(args.args);
+	warn_rcu_exit(rcu);
 }
 EXPORT_SYMBOL(warn_slowpath_fmt);
 #else
 void __warn_printk(const char *fmt, ...)
 {
+	bool rcu = warn_rcu_enter();
 	va_list args;
 
 	pr_warn(CUT_HERE);
@@ -705,6 +709,7 @@ void __warn_printk(const char *fmt, ...)
 	va_start(args, fmt);
 	vprintk(fmt, args);
 	va_end(args);
+	warn_rcu_exit(rcu);
 }
 EXPORT_SYMBOL(__warn_printk);
 #endif
--- a/lib/bug.c
+++ b/lib/bug.c
@@ -47,6 +47,7 @@
 #include <linux/sched.h>
 #include <linux/rculist.h>
 #include <linux/ftrace.h>
+#include <linux/context_tracking.h>
 
 extern struct bug_entry __start___bug_table[], __stop___bug_table[];
 
@@ -153,7 +154,7 @@ struct bug_entry *find_bug(unsigned long
 	return module_find_bug(bugaddr);
 }
 
-enum bug_trap_type report_bug(unsigned long bugaddr, struct pt_regs *regs)
+static enum bug_trap_type __report_bug(unsigned long bugaddr, struct pt_regs *regs)
 {
 	struct bug_entry *bug;
 	const char *file;
@@ -209,6 +210,18 @@ enum bug_trap_type report_bug(unsigned l
 	return BUG_TRAP_TYPE_BUG;
 }
 
+enum bug_trap_type report_bug(unsigned long bugaddr, struct pt_regs *regs)
+{
+	enum bug_trap_type ret;
+	bool rcu = false;
+
+	rcu = warn_rcu_enter();
+	ret = __report_bug(bugaddr, regs);
+	warn_rcu_exit(rcu);
+
+	return ret;
+}
+
 static void clear_once_table(struct bug_entry *start, struct bug_entry *end)
 {
 	struct bug_entry *bug;


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
