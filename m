Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E055721BB7A
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 18:53:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E622889FB;
	Fri, 10 Jul 2020 16:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uGmnIRehVCx0; Fri, 10 Jul 2020 16:53:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D080E88A13;
	Fri, 10 Jul 2020 16:53:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9D3BC016F;
	Fri, 10 Jul 2020 16:53:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9B87C077B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4A0382044E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kW9DX2Oc8LpM
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:53:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 5201220447
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:53:13 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 435E4207DF;
 Fri, 10 Jul 2020 16:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594399993;
 bh=b8jfDLa4RwhU2Cs/gVDBUVo//ZLKs8+iyGolUjrRfxo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZmYryPeckiXtS50JNNGE+K8CXJETPc1/cy7VXmLRS5n1V90lIgctsAimII2grJqgE
 sVbkOjNGp8OO7L95JQ6zB8+sFCH8yE6bTl9kBKlSUmMXuegNVcsirJzuFgTS5sOlks
 bsqdtW+TWjnPtf8XZHt4qXhtzmEmsCmybSVF9a7g=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/19] arm64: Reduce the number of header files pulled into
 vmlinux.lds.S
Date: Fri, 10 Jul 2020 17:51:59 +0100
Message-Id: <20200710165203.31284-16-will@kernel.org>
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

Although vmlinux.lds.S smells like an assembly file and is compiled
with __ASSEMBLY__ defined, it's actually just fed to the preprocessor to
create our linker script. This means that any assembly macros defined
by headers that it includes will result in a helpful link error:

| aarch64-linux-gnu-ld:./arch/arm64/kernel/vmlinux.lds:1: syntax error

In preparation for an arm64-private asm/rwonce.h implementation, which
will end up pulling assembly macros into linux/compiler.h, reduce the
number of headers we include directly and transitively in vmlinux.lds.S

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kernel-pgtable.h |  2 +-
 arch/arm64/include/asm/memory.h         | 11 ++++++-----
 arch/arm64/include/asm/uaccess.h        |  1 +
 arch/arm64/kernel/entry.S               |  1 +
 arch/arm64/kernel/vmlinux.lds.S         |  1 -
 arch/arm64/kvm/hyp-init.S               |  1 +
 6 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kernel-pgtable.h b/arch/arm64/include/asm/kernel-pgtable.h
index 3bf626f6fe0c..329fb15f6bac 100644
--- a/arch/arm64/include/asm/kernel-pgtable.h
+++ b/arch/arm64/include/asm/kernel-pgtable.h
@@ -8,7 +8,7 @@
 #ifndef __ASM_KERNEL_PGTABLE_H
 #define __ASM_KERNEL_PGTABLE_H
 
-#include <linux/pgtable.h>
+#include <asm/pgtable-hwdef.h>
 #include <asm/sparsemem.h>
 
 /*
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index a1871bb32bb1..9d4bf58cf7b3 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -10,11 +10,8 @@
 #ifndef __ASM_MEMORY_H
 #define __ASM_MEMORY_H
 
-#include <linux/compiler.h>
 #include <linux/const.h>
 #include <linux/sizes.h>
-#include <linux/types.h>
-#include <asm/bug.h>
 #include <asm/page-def.h>
 
 /*
@@ -157,11 +154,15 @@
 #endif
 
 #ifndef __ASSEMBLY__
-extern u64			vabits_actual;
-#define PAGE_END		(_PAGE_END(vabits_actual))
 
 #include <linux/bitops.h>
+#include <linux/compiler.h>
 #include <linux/mmdebug.h>
+#include <linux/types.h>
+#include <asm/bug.h>
+
+extern u64			vabits_actual;
+#define PAGE_END		(_PAGE_END(vabits_actual))
 
 extern s64			physvirt_offset;
 extern s64			memstart_addr;
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index bc5c7b091152..8d7c466f809b 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -19,6 +19,7 @@
 #include <linux/string.h>
 
 #include <asm/cpufeature.h>
+#include <asm/mmu.h>
 #include <asm/ptrace.h>
 #include <asm/memory.h>
 #include <asm/extable.h>
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 5304d193c79d..b668aad3b762 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -15,6 +15,7 @@
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/asm_pointer_auth.h>
+#include <asm/bug.h>
 #include <asm/cpufeature.h>
 #include <asm/errno.h>
 #include <asm/esr.h>
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 5423ffe0a987..ec8e894684a7 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -10,7 +10,6 @@
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/cache.h>
 #include <asm/kernel-pgtable.h>
-#include <asm/thread_info.h>
 #include <asm/memory.h>
 #include <asm/page.h>
 
diff --git a/arch/arm64/kvm/hyp-init.S b/arch/arm64/kvm/hyp-init.S
index 6e6ed5581eed..076544393c3c 100644
--- a/arch/arm64/kvm/hyp-init.S
+++ b/arch/arm64/kvm/hyp-init.S
@@ -6,6 +6,7 @@
 
 #include <linux/linkage.h>
 
+#include <asm/alternative.h>
 #include <asm/assembler.h>
 #include <asm/kvm_arm.h>
 #include <asm/kvm_mmu.h>
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
