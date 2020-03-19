Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F3518AF42
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:15:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7EC5987C5A;
	Thu, 19 Mar 2020 09:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKq7gPRl4pCD; Thu, 19 Mar 2020 09:15:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E1BAE87D05;
	Thu, 19 Mar 2020 09:14:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BEF9DC1830;
	Thu, 19 Mar 2020 09:14:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36DF4C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2457187BE0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U1Wu-skaRZ3C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 334FF87D44
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:38 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 464737A7; Thu, 19 Mar 2020 10:14:23 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 37/70] x86/sev-es: Compile early handler code into kernel image
Date: Thu, 19 Mar 2020 10:13:34 +0100
Message-Id: <20200319091407.1481-38-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319091407.1481-1-joro@8bytes.org>
References: <20200319091407.1481-1-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Joerg Roedel <jroedel@suse.de>

Setup sev-es.c and include the code from the
pre-decompression stage to also build it into the image of the running
kernel. Temporarily add __maybe_unused annotations to avoid build
warnings until the functions get used.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/Makefile        |   1 +
 arch/x86/kernel/sev-es-shared.c |  21 +++--
 arch/x86/kernel/sev-es.c        | 162 ++++++++++++++++++++++++++++++++
 3 files changed, 174 insertions(+), 10 deletions(-)
 create mode 100644 arch/x86/kernel/sev-es.c

diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 9b0ebcf4b9f3..28b4a2ebba25 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -147,6 +147,7 @@ obj-$(CONFIG_UNWINDER_ORC)		+= unwind_orc.o
 obj-$(CONFIG_UNWINDER_FRAME_POINTER)	+= unwind_frame.o
 obj-$(CONFIG_UNWINDER_GUESS)		+= unwind_guess.o
 
+obj-$(CONFIG_AMD_MEM_ENCRYPT)		+= sev-es.o
 ###
 # 64 bit specific files
 ifeq ($(CONFIG_X86_64),y)
diff --git a/arch/x86/kernel/sev-es-shared.c b/arch/x86/kernel/sev-es-shared.c
index a632b8f041ec..7a6e4db669f0 100644
--- a/arch/x86/kernel/sev-es-shared.c
+++ b/arch/x86/kernel/sev-es-shared.c
@@ -9,7 +9,7 @@
  * and is included directly into both code-bases.
  */
 
-static void sev_es_terminate(unsigned int reason)
+static void __maybe_unused sev_es_terminate(unsigned int reason)
 {
 	/* Request Guest Termination from Hypvervisor */
 	sev_es_wr_ghcb_msr(GHCB_SEV_TERMINATE);
@@ -19,7 +19,7 @@ static void sev_es_terminate(unsigned int reason)
 		asm volatile("hlt\n" : : : "memory");
 }
 
-static bool sev_es_negotiate_protocol(void)
+static bool __maybe_unused sev_es_negotiate_protocol(void)
 {
 	u64 val;
 
@@ -38,7 +38,7 @@ static bool sev_es_negotiate_protocol(void)
 	return true;
 }
 
-static void vc_ghcb_invalidate(struct ghcb *ghcb)
+static void __maybe_unused vc_ghcb_invalidate(struct ghcb *ghcb)
 {
 	memset(ghcb->save.valid_bitmap, 0, sizeof(ghcb->save.valid_bitmap));
 }
@@ -50,9 +50,9 @@ static bool vc_decoding_needed(unsigned long exit_code)
 		 exit_code <= SVM_EXIT_LAST_EXCP);
 }
 
-static enum es_result vc_init_em_ctxt(struct es_em_ctxt *ctxt,
-				      struct pt_regs *regs,
-				      unsigned long exit_code)
+static enum es_result __maybe_unused vc_init_em_ctxt(struct es_em_ctxt *ctxt,
+						     struct pt_regs *regs,
+						     unsigned long exit_code)
 {
 	enum es_result ret = ES_OK;
 
@@ -65,7 +65,7 @@ static enum es_result vc_init_em_ctxt(struct es_em_ctxt *ctxt,
 	return ret;
 }
 
-static void vc_finish_insn(struct es_em_ctxt *ctxt)
+static void __maybe_unused vc_finish_insn(struct es_em_ctxt *ctxt)
 {
 	ctxt->regs->ip += ctxt->insn.length;
 }
@@ -312,7 +312,8 @@ static enum es_result vc_ioio_exitinfo(struct es_em_ctxt *ctxt, u64 *exitinfo)
 	return ES_OK;
 }
 
-static enum es_result vc_handle_ioio(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
+static enum es_result __maybe_unused
+vc_handle_ioio(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 {
 	struct pt_regs *regs = ctxt->regs;
 	u64 exit_info_1, exit_info_2;
@@ -408,8 +409,8 @@ static enum es_result vc_handle_ioio(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 	return ret;
 }
 
-static enum es_result vc_handle_cpuid(struct ghcb *ghcb,
-				      struct es_em_ctxt *ctxt)
+static enum es_result __maybe_unused vc_handle_cpuid(struct ghcb *ghcb,
+						     struct es_em_ctxt *ctxt)
 {
 	struct pt_regs *regs = ctxt->regs;
 	u32 cr4 = native_read_cr4();
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
new file mode 100644
index 000000000000..27fdef6b3700
--- /dev/null
+++ b/arch/x86/kernel/sev-es.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * AMD Memory Encryption Support
+ *
+ * Copyright (C) 2019 SUSE
+ *
+ * Author: Joerg Roedel <jroedel@suse.de>
+ */
+
+#include <linux/kernel.h>
+#include <linux/mm.h>
+
+#include <asm/trap_defs.h>
+#include <asm/sev-es.h>
+#include <asm/insn-eval.h>
+#include <asm/fpu/internal.h>
+#include <asm/processor.h>
+#include <asm/svm.h>
+
+static inline u64 sev_es_rd_ghcb_msr(void)
+{
+	return native_read_msr(MSR_AMD64_SEV_ES_GHCB);
+}
+
+static inline void sev_es_wr_ghcb_msr(u64 val)
+{
+	u32 low, high;
+
+	low  = (u32)(val);
+	high = (u32)(val >> 32);
+
+	native_write_msr(MSR_AMD64_SEV_ES_GHCB, low, high);
+}
+
+static int vc_fetch_insn_kernel(struct es_em_ctxt *ctxt,
+				unsigned char *buffer)
+{
+	return probe_kernel_read(buffer, (unsigned char *)ctxt->regs->ip,
+				 MAX_INSN_SIZE);
+}
+
+static enum es_result vc_decode_insn(struct es_em_ctxt *ctxt)
+{
+	char buffer[MAX_INSN_SIZE];
+	enum es_result ret;
+	int res;
+
+	res = vc_fetch_insn_kernel(ctxt, buffer);
+	if (unlikely(res == -EFAULT)) {
+		ctxt->fi.vector     = X86_TRAP_PF;
+		ctxt->fi.error_code = 0;
+		ctxt->fi.cr2        = ctxt->regs->ip;
+		return ES_EXCEPTION;
+	}
+
+	insn_init(&ctxt->insn, buffer, MAX_INSN_SIZE - res, 1);
+	insn_get_length(&ctxt->insn);
+
+	ret = ctxt->insn.immediate.got ? ES_OK : ES_DECODE_FAILED;
+
+	return ret;
+}
+
+static enum es_result vc_write_mem(struct es_em_ctxt *ctxt,
+				   char *dst, char *buf, size_t size)
+{
+	unsigned long error_code = X86_PF_PROT | X86_PF_WRITE;
+	unsigned char *target = dst;
+	u64 d8;
+	u32 d4;
+	u16 d2;
+	u8  d1;
+
+	switch (size) {
+	case 1:
+		memcpy(&d1, buf, 1);
+		if (put_user(d1, target))
+			goto fault;
+		break;
+	case 2:
+		memcpy(&d2, buf, 2);
+		if (put_user(d2, target))
+			goto fault;
+		break;
+	case 4:
+		memcpy(&d4, buf, 4);
+		if (put_user(d4, target))
+			goto fault;
+		break;
+	case 8:
+		memcpy(&d8, buf, 8);
+		if (put_user(d8, target))
+			goto fault;
+		break;
+	default:
+		WARN_ONCE(1, "%s: Invalid size: %zu\n", __func__, size);
+		return ES_UNSUPPORTED;
+	}
+
+	return ES_OK;
+
+fault:
+	if (user_mode(ctxt->regs))
+		error_code |= X86_PF_USER;
+
+	ctxt->fi.vector = X86_TRAP_PF;
+	ctxt->fi.error_code = error_code;
+	ctxt->fi.cr2 = (unsigned long)dst;
+
+	return ES_EXCEPTION;
+}
+
+static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
+				  char *src, char *buf, size_t size)
+{
+	unsigned long error_code = X86_PF_PROT;
+	u64 d8;
+	u32 d4;
+	u16 d2;
+	u8  d1;
+
+	switch (size) {
+	case 1:
+		if (get_user(d1, src))
+			goto fault;
+		memcpy(buf, &d1, 1);
+		break;
+	case 2:
+		if (get_user(d2, src))
+			goto fault;
+		memcpy(buf, &d2, 2);
+		break;
+	case 4:
+		if (get_user(d4, src))
+			goto fault;
+		memcpy(buf, &d4, 4);
+		break;
+	case 8:
+		if (get_user(d8, src))
+			goto fault;
+		memcpy(buf, &d8, 8);
+		break;
+	default:
+		WARN_ONCE(1, "%s: Invalid size: %zu\n", __func__, size);
+		return ES_UNSUPPORTED;
+	}
+
+	return ES_OK;
+
+fault:
+	if (user_mode(ctxt->regs))
+		error_code |= X86_PF_USER;
+
+	ctxt->fi.vector = X86_TRAP_PF;
+	ctxt->fi.error_code = error_code;
+	ctxt->fi.cr2 = (unsigned long)src;
+
+	return ES_EXCEPTION;
+}
+
+/* Include code shared with pre-decompression boot stage */
+#include "sev-es-shared.c"
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
