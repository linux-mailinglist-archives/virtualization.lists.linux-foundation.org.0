Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 811A221BB54
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 18:52:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2F550884DC;
	Fri, 10 Jul 2020 16:52:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0p5ilZ7PT5t2; Fri, 10 Jul 2020 16:52:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 73811884D6;
	Fri, 10 Jul 2020 16:52:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57EC5C016F;
	Fri, 10 Jul 2020 16:52:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D09E2C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B827E872DC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kx1yYvik3-JE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:52:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 11CC485FD6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:52:16 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 971D2207BB;
 Fri, 10 Jul 2020 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594399935;
 bh=ywSwLeB8+9JlN7dFMnrx1nBTlfQXT0bNlfg5jfyoHR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K6+mvWAuHYBD9EQOfbrVCnBXyUKADom5uxLA0XAZj634c/JLz1rMQvYgsWgLq9Q8R
 eKal9rHQ4ZWI1MUEHU1vt7Bd0DBnir6bosbFJcZpKU2c4tYpRlLpzC96wK+KJvYkO/
 YAqMGiQwatY6vybt44z+KcEMoS+djRMpoZwc+DIg=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/19] tools: bpf: Use local copy of headers including
 uapi/linux/filter.h
Date: Fri, 10 Jul 2020 17:51:45 +0100
Message-Id: <20200710165203.31284-2-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200710165203.31284-1-will@kernel.org>
References: <20200710165203.31284-1-will@kernel.org>
MIME-Version: 1.0
Cc: Joel Fernandes <joelaf@google.com>, Mark Rutland <mark.rutland@arm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Xiao Yang <ice_yangxiao@163.com>,
 Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Alan Stern <stern@rowland.harvard.edu>,
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

Pulling header files directly out of the kernel sources for inclusion in
userspace programs is highly error prone, not least because it bypasses
the kbuild infrastructure entirely and so may end up referencing other
header files that have not been generated.

Subsequent patches will cause compiler.h to pull in the ungenerated
asm/rwonce.h file via filter.h, breaking the build for tools/bpf:

  | $ make -C tools/bpf
  | make: Entering directory '/linux/tools/bpf'
  |   CC       bpf_jit_disasm.o
  |   LINK     bpf_jit_disasm
  |   CC       bpf_dbg.o
  | In file included from /linux/include/uapi/linux/filter.h:9,
  |                  from /linux/tools/bpf/bpf_dbg.c:41:
  | /linux/include/linux/compiler.h:247:10: fatal error: asm/rwonce.h: No such file or directory
  |  #include <asm/rwonce.h>
  |           ^~~~~~~~~~~~~~
  | compilation terminated.
  | make: *** [Makefile:61: bpf_dbg.o] Error 1
  | make: Leaving directory '/linux/tools/bpf'

Take a copy of the installed version of linux/filter.h  (i.e. the one
created by the 'headers_install' target) into tools/include/uapi/linux/
and adjust the BPF tool Makefile to reference the local include
directories instead of those in the main source tree.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Alexei Starovoitov <ast@kernel.org>
Suggested-by: Daniel Borkmann <daniel@iogearbox.net>
Reported-by: Xiao Yang <ice_yangxiao@163.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 tools/bpf/Makefile                |  3 +-
 tools/include/uapi/linux/filter.h | 90 +++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 tools/include/uapi/linux/filter.h

diff --git a/tools/bpf/Makefile b/tools/bpf/Makefile
index 6df1850f8353..8a69258fd8aa 100644
--- a/tools/bpf/Makefile
+++ b/tools/bpf/Makefile
@@ -9,7 +9,8 @@ MAKE = make
 INSTALL ?= install
 
 CFLAGS += -Wall -O2
-CFLAGS += -D__EXPORTED_HEADERS__ -I$(srctree)/include/uapi -I$(srctree)/include
+CFLAGS += -D__EXPORTED_HEADERS__ -I$(srctree)/tools/include/uapi \
+	  -I$(srctree)/tools/include
 
 # This will work when bpf is built in tools env. where srctree
 # isn't set and when invoked from selftests build, where srctree
diff --git a/tools/include/uapi/linux/filter.h b/tools/include/uapi/linux/filter.h
new file mode 100644
index 000000000000..eaef459e7bd4
--- /dev/null
+++ b/tools/include/uapi/linux/filter.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Linux Socket Filter Data Structures
+ */
+
+#ifndef __LINUX_FILTER_H__
+#define __LINUX_FILTER_H__
+
+
+#include <linux/types.h>
+#include <linux/bpf_common.h>
+
+/*
+ * Current version of the filter code architecture.
+ */
+#define BPF_MAJOR_VERSION 1
+#define BPF_MINOR_VERSION 1
+
+/*
+ *	Try and keep these values and structures similar to BSD, especially
+ *	the BPF code definitions which need to match so you can share filters
+ */
+ 
+struct sock_filter {	/* Filter block */
+	__u16	code;   /* Actual filter code */
+	__u8	jt;	/* Jump true */
+	__u8	jf;	/* Jump false */
+	__u32	k;      /* Generic multiuse field */
+};
+
+struct sock_fprog {	/* Required for SO_ATTACH_FILTER. */
+	unsigned short		len;	/* Number of filter blocks */
+	struct sock_filter *filter;
+};
+
+/* ret - BPF_K and BPF_X also apply */
+#define BPF_RVAL(code)  ((code) & 0x18)
+#define         BPF_A           0x10
+
+/* misc */
+#define BPF_MISCOP(code) ((code) & 0xf8)
+#define         BPF_TAX         0x00
+#define         BPF_TXA         0x80
+
+/*
+ * Macros for filter block array initializers.
+ */
+#ifndef BPF_STMT
+#define BPF_STMT(code, k) { (unsigned short)(code), 0, 0, k }
+#endif
+#ifndef BPF_JUMP
+#define BPF_JUMP(code, k, jt, jf) { (unsigned short)(code), jt, jf, k }
+#endif
+
+/*
+ * Number of scratch memory words for: BPF_ST and BPF_STX
+ */
+#define BPF_MEMWORDS 16
+
+/* RATIONALE. Negative offsets are invalid in BPF.
+   We use them to reference ancillary data.
+   Unlike introduction new instructions, it does not break
+   existing compilers/optimizers.
+ */
+#define SKF_AD_OFF    (-0x1000)
+#define SKF_AD_PROTOCOL 0
+#define SKF_AD_PKTTYPE 	4
+#define SKF_AD_IFINDEX 	8
+#define SKF_AD_NLATTR	12
+#define SKF_AD_NLATTR_NEST	16
+#define SKF_AD_MARK 	20
+#define SKF_AD_QUEUE	24
+#define SKF_AD_HATYPE	28
+#define SKF_AD_RXHASH	32
+#define SKF_AD_CPU	36
+#define SKF_AD_ALU_XOR_X	40
+#define SKF_AD_VLAN_TAG	44
+#define SKF_AD_VLAN_TAG_PRESENT 48
+#define SKF_AD_PAY_OFFSET	52
+#define SKF_AD_RANDOM	56
+#define SKF_AD_VLAN_TPID	60
+#define SKF_AD_MAX	64
+
+#define SKF_NET_OFF	(-0x100000)
+#define SKF_LL_OFF	(-0x200000)
+
+#define BPF_NET_OFF	SKF_NET_OFF
+#define BPF_LL_OFF	SKF_LL_OFF
+
+#endif /* __LINUX_FILTER_H__ */
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
