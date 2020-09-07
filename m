Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E572625FB3C
	for <lists.virtualization@lfdr.de>; Mon,  7 Sep 2020 15:18:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 779A621511;
	Mon,  7 Sep 2020 13:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t+jiP5+uBGhX; Mon,  7 Sep 2020 13:18:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DC55D20532;
	Mon,  7 Sep 2020 13:17:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC953C0051;
	Mon,  7 Sep 2020 13:17:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60CC3C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 49555214EB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JTsb4tKuVxZx
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:17:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 142AE2151F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:16:58 +0000 (UTC)
Received: from cap.home.8bytes.org (p549add56.dip0.t-ipconnect.de
 [84.154.221.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 6B709FC8;
 Mon,  7 Sep 2020 15:16:55 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v7 26/72] x86/fpu: Move xgetbv()/xsetbv() into separate header
Date: Mon,  7 Sep 2020 15:15:27 +0200
Message-Id: <20200907131613.12703-27-joro@8bytes.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907131613.12703-1-joro@8bytes.org>
References: <20200907131613.12703-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Joerg Roedel <jroedel@suse.de>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

From: Joerg Roedel <jroedel@suse.de>

The xgetbv() function is needed in pre-decompression boot code, but
asm/fpu/internal.h can't be included there directly. Doing so opens
the door to include-hell due to various include-magic in
boot/compressed/misc.h.

Avoid that by moving xgetbv()/xsetbv() to a separate header file and
include this instead.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/fpu/internal.h | 30 +------------------------
 arch/x86/include/asm/fpu/xcr.h      | 34 +++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 29 deletions(-)
 create mode 100644 arch/x86/include/asm/fpu/xcr.h

diff --git a/arch/x86/include/asm/fpu/internal.h b/arch/x86/include/asm/fpu/internal.h
index 21a8b5259477..ceeba9f63172 100644
--- a/arch/x86/include/asm/fpu/internal.h
+++ b/arch/x86/include/asm/fpu/internal.h
@@ -19,6 +19,7 @@
 #include <asm/user.h>
 #include <asm/fpu/api.h>
 #include <asm/fpu/xstate.h>
+#include <asm/fpu/xcr.h>
 #include <asm/cpufeature.h>
 #include <asm/trace/fpu.h>
 
@@ -585,33 +586,4 @@ static inline void switch_fpu_finish(struct fpu *new_fpu)
 	__write_pkru(pkru_val);
 }
 
-/*
- * MXCSR and XCR definitions:
- */
-
-static inline void ldmxcsr(u32 mxcsr)
-{
-	asm volatile("ldmxcsr %0" :: "m" (mxcsr));
-}
-
-extern unsigned int mxcsr_feature_mask;
-
-#define XCR_XFEATURE_ENABLED_MASK	0x00000000
-
-static inline u64 xgetbv(u32 index)
-{
-	u32 eax, edx;
-
-	asm volatile("xgetbv" : "=a" (eax), "=d" (edx) : "c" (index));
-	return eax + ((u64)edx << 32);
-}
-
-static inline void xsetbv(u32 index, u64 value)
-{
-	u32 eax = value;
-	u32 edx = value >> 32;
-
-	asm volatile("xsetbv" :: "a" (eax), "d" (edx), "c" (index));
-}
-
 #endif /* _ASM_X86_FPU_INTERNAL_H */
diff --git a/arch/x86/include/asm/fpu/xcr.h b/arch/x86/include/asm/fpu/xcr.h
new file mode 100644
index 000000000000..1c7ab8d95da5
--- /dev/null
+++ b/arch/x86/include/asm/fpu/xcr.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_FPU_XCR_H
+#define _ASM_X86_FPU_XCR_H
+
+/*
+ * MXCSR and XCR definitions:
+ */
+
+static inline void ldmxcsr(u32 mxcsr)
+{
+	asm volatile("ldmxcsr %0" :: "m" (mxcsr));
+}
+
+extern unsigned int mxcsr_feature_mask;
+
+#define XCR_XFEATURE_ENABLED_MASK	0x00000000
+
+static inline u64 xgetbv(u32 index)
+{
+	u32 eax, edx;
+
+	asm volatile("xgetbv" : "=a" (eax), "=d" (edx) : "c" (index));
+	return eax + ((u64)edx << 32);
+}
+
+static inline void xsetbv(u32 index, u64 value)
+{
+	u32 eax = value;
+	u32 edx = value >> 32;
+
+	asm volatile("xsetbv" :: "a" (eax), "d" (edx), "c" (index));
+}
+
+#endif /* _ASM_X86_FPU_XCR_H */
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
