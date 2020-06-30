Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F75E20FAB1
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 19:37:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 412D6884D9;
	Tue, 30 Jun 2020 17:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hYHCFSsHWcuD; Tue, 30 Jun 2020 17:37:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 793A28853D;
	Tue, 30 Jun 2020 17:37:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45711C0865;
	Tue, 30 Jun 2020 17:37:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7219C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 924C18853D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jVgbwKEH-YAr
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:37:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C43C2884D9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 17:37:53 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDBBA207FB;
 Tue, 30 Jun 2020 17:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593538673;
 bh=84SXcF4oIb3/rXxDMEtP86ZlEr6gq844EJ4We62Q7is=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZHG5P3xoGuxlynaWyREiqXA29TS0oxVxBHNfubFC7MOKvh5laB415rvLgRFI6Uo5q
 QcSf7tvxXkuAbYFDQ+8ZexFRAiQK8uP273GQczMucwu37vbXs5zCpIYy+kVNB0iLl3
 Lzykp1iAOnNM4xenF65A+uWChUQxaI+HAhcvCbkM=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 02/18] compiler.h: Split {READ,
 WRITE}_ONCE definitions out into rwonce.h
Date: Tue, 30 Jun 2020 18:37:18 +0100
Message-Id: <20200630173734.14057-3-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200630173734.14057-1-will@kernel.org>
References: <20200630173734.14057-1-will@kernel.org>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 virtualization@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>,
 Sami Tolvanen <samitolvanen@google.com>, Matt Turner <mattst88@gmail.com>,
 kernel-team@android.com, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
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

In preparation for allowing architectures to define their own
implementation of the READ_ONCE() macro, move the generic
{READ,WRITE}_ONCE() definitions out of the unwieldy 'linux/compiler.h'
file and into a new 'rwonce.h' header under 'asm-generic'.

Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 include/asm-generic/Kbuild   |  1 +
 include/asm-generic/rwonce.h | 91 ++++++++++++++++++++++++++++++++++++
 include/linux/compiler.h     | 83 +-------------------------------
 3 files changed, 94 insertions(+), 81 deletions(-)
 create mode 100644 include/asm-generic/rwonce.h

diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 44ec80e70518..74b0612601dd 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -45,6 +45,7 @@ mandatory-y += pci.h
 mandatory-y += percpu.h
 mandatory-y += pgalloc.h
 mandatory-y += preempt.h
+mandatory-y += rwonce.h
 mandatory-y += sections.h
 mandatory-y += serial.h
 mandatory-y += shmparam.h
diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
new file mode 100644
index 000000000000..92cc2f223cb3
--- /dev/null
+++ b/include/asm-generic/rwonce.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Prevent the compiler from merging or refetching reads or writes. The
+ * compiler is also forbidden from reordering successive instances of
+ * READ_ONCE and WRITE_ONCE, but only when the compiler is aware of some
+ * particular ordering. One way to make the compiler aware of ordering is to
+ * put the two invocations of READ_ONCE or WRITE_ONCE in different C
+ * statements.
+ *
+ * These two macros will also work on aggregate data types like structs or
+ * unions.
+ *
+ * Their two major use cases are: (1) Mediating communication between
+ * process-level code and irq/NMI handlers, all running on the same CPU,
+ * and (2) Ensuring that the compiler does not fold, spindle, or otherwise
+ * mutilate accesses that either do not require ordering or that interact
+ * with an explicit memory barrier or atomic instruction that provides the
+ * required ordering.
+ */
+#ifndef __ASM_GENERIC_RWONCE_H
+#define __ASM_GENERIC_RWONCE_H
+
+#ifndef __ASSEMBLY__
+
+#include <linux/compiler_types.h>
+#include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
+
+#include <asm/barrier.h>
+
+/*
+ * Use __READ_ONCE() instead of READ_ONCE() if you do not require any
+ * atomicity or dependency ordering guarantees. Note that this may result
+ * in tears!
+ */
+#define __READ_ONCE(x)	(*(const volatile __unqual_scalar_typeof(x) *)&(x))
+
+#define __READ_ONCE_SCALAR(x)						\
+({									\
+	__unqual_scalar_typeof(x) __x = __READ_ONCE(x);			\
+	smp_read_barrier_depends();					\
+	(typeof(x))__x;							\
+})
+
+#define READ_ONCE(x)							\
+({									\
+	compiletime_assert_rwonce_type(x);				\
+	__READ_ONCE_SCALAR(x);						\
+})
+
+#define __WRITE_ONCE(x, val)						\
+do {									\
+	*(volatile typeof(x) *)&(x) = (val);				\
+} while (0)
+
+#define WRITE_ONCE(x, val)						\
+do {									\
+	compiletime_assert_rwonce_type(x);				\
+	__WRITE_ONCE(x, val);						\
+} while (0)
+
+static __no_sanitize_or_inline
+unsigned long __read_once_word_nocheck(const void *addr)
+{
+	return __READ_ONCE(*(unsigned long *)addr);
+}
+
+/*
+ * Use READ_ONCE_NOCHECK() instead of READ_ONCE() if you need to load a
+ * word from memory atomically but without telling KASAN/KCSAN. This is
+ * usually used by unwinding code when walking the stack of a running process.
+ */
+#define READ_ONCE_NOCHECK(x)						\
+({									\
+	unsigned long __x;						\
+	compiletime_assert(sizeof(x) == sizeof(__x),			\
+		"Unsupported access size for READ_ONCE_NOCHECK().");	\
+	__x = __read_once_word_nocheck(&(x));				\
+	smp_read_barrier_depends();					\
+	(typeof(x))__x;							\
+})
+
+static __no_kasan_or_inline
+unsigned long read_word_at_a_time(const void *addr)
+{
+	kasan_check_read(addr, 1);
+	return *(unsigned long *)addr;
+}
+
+#endif /* __ASSEMBLY__ */
+#endif	/* __ASM_GENERIC_RWONCE_H */
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 204e76856435..718b4357af32 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -230,28 +230,6 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 # define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __LINE__)
 #endif
 
-/*
- * Prevent the compiler from merging or refetching reads or writes. The
- * compiler is also forbidden from reordering successive instances of
- * READ_ONCE and WRITE_ONCE, but only when the compiler is aware of some
- * particular ordering. One way to make the compiler aware of ordering is to
- * put the two invocations of READ_ONCE or WRITE_ONCE in different C
- * statements.
- *
- * These two macros will also work on aggregate data types like structs or
- * unions.
- *
- * Their two major use cases are: (1) Mediating communication between
- * process-level code and irq/NMI handlers, all running on the same CPU,
- * and (2) Ensuring that the compiler does not fold, spindle, or otherwise
- * mutilate accesses that either do not require ordering or that interact
- * with an explicit memory barrier or atomic instruction that provides the
- * required ordering.
- */
-#include <asm/barrier.h>
-#include <linux/kasan-checks.h>
-#include <linux/kcsan-checks.h>
-
 /**
  * data_race - mark an expression as containing intentional data races
  *
@@ -272,65 +250,6 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 	__v;								\
 })
 
-/*
- * Use __READ_ONCE() instead of READ_ONCE() if you do not require any
- * atomicity or dependency ordering guarantees. Note that this may result
- * in tears!
- */
-#define __READ_ONCE(x)	(*(const volatile __unqual_scalar_typeof(x) *)&(x))
-
-#define __READ_ONCE_SCALAR(x)						\
-({									\
-	__unqual_scalar_typeof(x) __x = __READ_ONCE(x);			\
-	smp_read_barrier_depends();					\
-	(typeof(x))__x;							\
-})
-
-#define READ_ONCE(x)							\
-({									\
-	compiletime_assert_rwonce_type(x);				\
-	__READ_ONCE_SCALAR(x);						\
-})
-
-#define __WRITE_ONCE(x, val)						\
-do {									\
-	*(volatile typeof(x) *)&(x) = (val);				\
-} while (0)
-
-#define WRITE_ONCE(x, val)						\
-do {									\
-	compiletime_assert_rwonce_type(x);				\
-	__WRITE_ONCE(x, val);						\
-} while (0)
-
-static __no_sanitize_or_inline
-unsigned long __read_once_word_nocheck(const void *addr)
-{
-	return __READ_ONCE(*(unsigned long *)addr);
-}
-
-/*
- * Use READ_ONCE_NOCHECK() instead of READ_ONCE() if you need to load a
- * word from memory atomically but without telling KASAN/KCSAN. This is
- * usually used by unwinding code when walking the stack of a running process.
- */
-#define READ_ONCE_NOCHECK(x)						\
-({									\
-	unsigned long __x;						\
-	compiletime_assert(sizeof(x) == sizeof(__x),			\
-		"Unsupported access size for READ_ONCE_NOCHECK().");	\
-	__x = __read_once_word_nocheck(&(x));				\
-	smp_read_barrier_depends();					\
-	(typeof(x))__x;							\
-})
-
-static __no_kasan_or_inline
-unsigned long read_word_at_a_time(const void *addr)
-{
-	kasan_check_read(addr, 1);
-	return *(unsigned long *)addr;
-}
-
 #endif /* __KERNEL__ */
 
 /*
@@ -414,4 +333,6 @@ static inline void *offset_to_ptr(const int *off)
  */
 #define prevent_tail_call_optimization()	mb()
 
+#include <asm/rwonce.h>
+
 #endif /* __LINUX_COMPILER_H */
-- 
2.27.0.212.ge8ba1cc988-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
