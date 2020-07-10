Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCFF21BB73
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 18:53:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0C97588A03;
	Fri, 10 Jul 2020 16:53:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4dlXWZyOg9cu; Fri, 10 Jul 2020 16:53:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4660C88A05;
	Fri, 10 Jul 2020 16:53:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29625C016F;
	Fri, 10 Jul 2020 16:53:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 783A0C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A40552E5DE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2N2XK3KGyDzs
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:52:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id EFF4A26EF7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:52:27 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48A7A207FC;
 Fri, 10 Jul 2020 16:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594399947;
 bh=d0j8xTVNaWzbdalED8evYOHQSCzMCpX3VtGAAmbbWA0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B+7j4w0T7dCr6eH6S9BAocvfzG6/Tjc0v3yKs9qc1Zjaooz79j6aYr2jAVRzbOl0K
 WBnOPFM1MT/8ZC20VDG6kYtmeGDVy2jwvBrptx3+G/2AyI1MnsSh/EleWzmiDfP6hU
 phbkIC5Yr2bdnu87psM7ERyhP9gqpIZgEDJewmlg=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/19] alpha: Override READ_ONCE() with barriered
 implementation
Date: Fri, 10 Jul 2020 17:51:48 +0100
Message-Id: <20200710165203.31284-5-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200710165203.31284-1-will@kernel.org>
References: <20200710165203.31284-1-will@kernel.org>
MIME-Version: 1.0
Cc: Joel Fernandes <joelaf@google.com>, Mark Rutland <mark.rutland@arm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 virtualization@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>,
 Sami Tolvanen <samitolvanen@google.com>, Matt Turner <mattst88@gmail.com>,
 kernel-team@android.com, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-alpha@vger.kernel.org
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

Rather then relying on the core code to use smp_read_barrier_depends()
as part of the READ_ONCE() definition, instead override __READ_ONCE()
in the Alpha code so that it generates the required mb() and then
implement smp_load_acquire() using the new macro to avoid redundant
back-to-back barriers from the generic implementation.

Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/alpha/include/asm/barrier.h | 59 +++-----------------------------
 arch/alpha/include/asm/rwonce.h  | 35 +++++++++++++++++++
 2 files changed, 40 insertions(+), 54 deletions(-)
 create mode 100644 arch/alpha/include/asm/rwonce.h

diff --git a/arch/alpha/include/asm/barrier.h b/arch/alpha/include/asm/barrier.h
index 92ec486a4f9e..c56bfffc9918 100644
--- a/arch/alpha/include/asm/barrier.h
+++ b/arch/alpha/include/asm/barrier.h
@@ -2,64 +2,15 @@
 #ifndef __BARRIER_H
 #define __BARRIER_H
 
-#include <asm/compiler.h>
-
 #define mb()	__asm__ __volatile__("mb": : :"memory")
 #define rmb()	__asm__ __volatile__("mb": : :"memory")
 #define wmb()	__asm__ __volatile__("wmb": : :"memory")
 
-/**
- * read_barrier_depends - Flush all pending reads that subsequents reads
- * depend on.
- *
- * No data-dependent reads from memory-like regions are ever reordered
- * over this barrier.  All reads preceding this primitive are guaranteed
- * to access memory (but not necessarily other CPUs' caches) before any
- * reads following this primitive that depend on the data return by
- * any of the preceding reads.  This primitive is much lighter weight than
- * rmb() on most CPUs, and is never heavier weight than is
- * rmb().
- *
- * These ordering constraints are respected by both the local CPU
- * and the compiler.
- *
- * Ordering is not guaranteed by anything other than these primitives,
- * not even by data dependencies.  See the documentation for
- * memory_barrier() for examples and URLs to more information.
- *
- * For example, the following code would force ordering (the initial
- * value of "a" is zero, "b" is one, and "p" is "&a"):
- *
- * <programlisting>
- *	CPU 0				CPU 1
- *
- *	b = 2;
- *	memory_barrier();
- *	p = &b;				q = p;
- *					read_barrier_depends();
- *					d = *q;
- * </programlisting>
- *
- * because the read of "*q" depends on the read of "p" and these
- * two reads are separated by a read_barrier_depends().  However,
- * the following code, with the same initial values for "a" and "b":
- *
- * <programlisting>
- *	CPU 0				CPU 1
- *
- *	a = 2;
- *	memory_barrier();
- *	b = 3;				y = b;
- *					read_barrier_depends();
- *					x = a;
- * </programlisting>
- *
- * does not enforce ordering, since there is no data dependency between
- * the read of "a" and the read of "b".  Therefore, on some CPUs, such
- * as Alpha, "y" could be set to 3 and "x" to 0.  Use rmb()
- * in cases like this where there are no data dependencies.
- */
-#define read_barrier_depends() __asm__ __volatile__("mb": : :"memory")
+#define __smp_load_acquire(p)						\
+({									\
+	compiletime_assert_atomic_type(*p);				\
+	__READ_ONCE(*p);						\
+})
 
 #ifdef CONFIG_SMP
 #define __ASM_SMP_MB	"\tmb\n"
diff --git a/arch/alpha/include/asm/rwonce.h b/arch/alpha/include/asm/rwonce.h
new file mode 100644
index 000000000000..35542bcf92b3
--- /dev/null
+++ b/arch/alpha/include/asm/rwonce.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Google LLC.
+ */
+#ifndef __ASM_RWONCE_H
+#define __ASM_RWONCE_H
+
+#ifdef CONFIG_SMP
+
+#include <asm/barrier.h>
+
+/*
+ * Alpha is apparently daft enough to reorder address-dependent loads
+ * on some CPU implementations. Knock some common sense into it with
+ * a memory barrier in READ_ONCE().
+ *
+ * For the curious, more information about this unusual reordering is
+ * available in chapter 15 of the "perfbook":
+ *
+ *  https://kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html
+ *
+ */
+#define __READ_ONCE(x)							\
+({									\
+	__unqual_scalar_typeof(x) __x =					\
+		(*(volatile typeof(__x) *)(&(x)));			\
+	mb();								\
+	(typeof(x))__x;							\
+})
+
+#endif /* CONFIG_SMP */
+
+#include <asm-generic/rwonce.h>
+
+#endif /* __ASM_RWONCE_H */
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
