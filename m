Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA3921BB7B
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 18:53:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D413A2E797;
	Fri, 10 Jul 2020 16:52:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zx3PcRJmJ2TS; Fri, 10 Jul 2020 16:52:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4AC3B2E78D;
	Fri, 10 Jul 2020 16:52:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21ED0C016F;
	Fri, 10 Jul 2020 16:52:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1EF8C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D1A4E89D59
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k3V5cqsJp-wS
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:52:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4443189C43
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:52:36 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96F9820874;
 Fri, 10 Jul 2020 16:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594399956;
 bh=0ddB4nB8xvkRzosqnCLtYbbkuDFtWWfHraJbh6SPJb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aNB0k5WKE8LUxXBlSBVjGZVKtO5lq8jeqkQ5MqWCSyjxry5pHBfrGHXuOMaxyF3Zj
 1PiYSOGjnGuKARE4F2MX3Iu7uVYAV4mF3SptJ7n4dSo7s4QnjeD3oyfIZ3gdLK48qY
 VFXaV0oJBiIGP8+ZjIEuoztf54X9JbzKht4crhzw=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/19] asm/rwonce: Don't pull <asm/barrier.h> into
 'asm-generic/rwonce.h'
Date: Fri, 10 Jul 2020 17:51:50 +0100
Message-Id: <20200710165203.31284-7-will@kernel.org>
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

Now that 'smp_read_barrier_depends()' has gone the way of the Norwegian
Blue, drop the inclusion of <asm/barrier.h> in 'asm-generic/rwonce.h'.

This requires fixups to some architecture vdso headers which were
previously relying on 'asm/barrier.h' coming in via 'linux/compiler.h'.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm/include/asm/vdso/gettimeofday.h          | 1 +
 arch/arm64/include/asm/vdso/compat_gettimeofday.h | 1 +
 arch/arm64/include/asm/vdso/gettimeofday.h        | 1 +
 arch/riscv/include/asm/vdso/gettimeofday.h        | 1 +
 include/asm-generic/rwonce.h                      | 2 --
 include/linux/nospec.h                            | 2 ++
 6 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/vdso/gettimeofday.h b/arch/arm/include/asm/vdso/gettimeofday.h
index 36dc18553ed8..1b207cf07697 100644
--- a/arch/arm/include/asm/vdso/gettimeofday.h
+++ b/arch/arm/include/asm/vdso/gettimeofday.h
@@ -7,6 +7,7 @@
 
 #ifndef __ASSEMBLY__
 
+#include <asm/barrier.h>
 #include <asm/errno.h>
 #include <asm/unistd.h>
 #include <asm/vdso/cp15.h>
diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
index b6907ae78e53..bcf7649999a4 100644
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@ -7,6 +7,7 @@
 
 #ifndef __ASSEMBLY__
 
+#include <asm/barrier.h>
 #include <asm/unistd.h>
 #include <asm/errno.h>
 
diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index afba6ba332f8..127fa63893e2 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -7,6 +7,7 @@
 
 #ifndef __ASSEMBLY__
 
+#include <asm/barrier.h>
 #include <asm/unistd.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1
diff --git a/arch/riscv/include/asm/vdso/gettimeofday.h b/arch/riscv/include/asm/vdso/gettimeofday.h
index c8e818688ec1..3099362d9f26 100644
--- a/arch/riscv/include/asm/vdso/gettimeofday.h
+++ b/arch/riscv/include/asm/vdso/gettimeofday.h
@@ -4,6 +4,7 @@
 
 #ifndef __ASSEMBLY__
 
+#include <asm/barrier.h>
 #include <asm/unistd.h>
 #include <asm/csr.h>
 #include <uapi/linux/time.h>
diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
index cc810f1f18ca..cd0302746fb4 100644
--- a/include/asm-generic/rwonce.h
+++ b/include/asm-generic/rwonce.h
@@ -26,8 +26,6 @@
 #include <linux/kasan-checks.h>
 #include <linux/kcsan-checks.h>
 
-#include <asm/barrier.h>
-
 /*
  * Use __READ_ONCE() instead of READ_ONCE() if you do not require any
  * atomicity. Note that this may result in tears!
diff --git a/include/linux/nospec.h b/include/linux/nospec.h
index 0c5ef54fd416..c1e79f72cd89 100644
--- a/include/linux/nospec.h
+++ b/include/linux/nospec.h
@@ -5,6 +5,8 @@
 
 #ifndef _LINUX_NOSPEC_H
 #define _LINUX_NOSPEC_H
+
+#include <linux/compiler.h>
 #include <asm/barrier.h>
 
 struct task_struct;
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
