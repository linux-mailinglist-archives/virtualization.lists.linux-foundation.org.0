Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1881BC2A1
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 17:18:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D6AE8882C4;
	Tue, 28 Apr 2020 15:18:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CfYgGOrL5NFr; Tue, 28 Apr 2020 15:18:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88DD2882DB;
	Tue, 28 Apr 2020 15:18:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7502CC0172;
	Tue, 28 Apr 2020 15:18:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96792C0863
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 860D78648C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmgwUpj6ZfAN
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 051A08644F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:02 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id BFA58F04; Tue, 28 Apr 2020 17:17:46 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 25/75] x86/sev-es: Add support for handling IOIO exceptions
Date: Tue, 28 Apr 2020 17:16:35 +0200
Message-Id: <20200428151725.31091-26-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428151725.31091-1-joro@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Tom Lendacky <thomas.lendacky@amd.com>

Add support for decoding and handling #VC exceptions for IOIO events.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
[ jroedel@suse.de: Adapted code to #VC handling framework ]
Co-developed-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/sev-es.c |  32 +++++
 arch/x86/kernel/sev-es-shared.c   | 202 ++++++++++++++++++++++++++++++
 2 files changed, 234 insertions(+)

diff --git a/arch/x86/boot/compressed/sev-es.c b/arch/x86/boot/compressed/sev-es.c
index 1241697dd156..17765e471e28 100644
--- a/arch/x86/boot/compressed/sev-es.c
+++ b/arch/x86/boot/compressed/sev-es.c
@@ -23,6 +23,35 @@
 struct ghcb boot_ghcb_page __aligned(PAGE_SIZE);
 struct ghcb *boot_ghcb;
 
+/*
+ * Copy a version of this function here - insn-eval.c can't be used in
+ * pre-decompression code.
+ */
+static bool insn_has_rep_prefix(struct insn *insn)
+{
+	int i;
+
+	insn_get_prefixes(insn);
+
+	for (i = 0; i < insn->prefixes.nbytes; i++) {
+		insn_byte_t p = insn->prefixes.bytes[i];
+
+		if (p == 0xf2 || p == 0xf3)
+			return true;
+	}
+
+	return false;
+}
+
+/*
+ * Only a dummy for insn_get_seg_base() - Early boot-code is 64bit only and
+ * doesn't use segments.
+ */
+static unsigned long insn_get_seg_base(struct pt_regs *regs, int seg_reg_idx)
+{
+	return 0UL;
+}
+
 static inline u64 sev_es_rd_ghcb_msr(void)
 {
 	unsigned long low, high;
@@ -150,6 +179,9 @@ void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
 		goto finish;
 
 	switch (exit_code) {
+	case SVM_EXIT_IOIO:
+		result = vc_handle_ioio(boot_ghcb, &ctxt);
+		break;
 	default:
 		result = ES_UNSUPPORTED;
 		break;
diff --git a/arch/x86/kernel/sev-es-shared.c b/arch/x86/kernel/sev-es-shared.c
index 22eb3ed89186..5d4d0e2b7777 100644
--- a/arch/x86/kernel/sev-es-shared.c
+++ b/arch/x86/kernel/sev-es-shared.c
@@ -217,3 +217,205 @@ static enum es_result vc_insn_string_write(struct es_em_ctxt *ctxt,
 
 	return ret;
 }
+
+#define IOIO_TYPE_STR  BIT(2)
+#define IOIO_TYPE_IN   1
+#define IOIO_TYPE_INS  (IOIO_TYPE_IN | IOIO_TYPE_STR)
+#define IOIO_TYPE_OUT  0
+#define IOIO_TYPE_OUTS (IOIO_TYPE_OUT | IOIO_TYPE_STR)
+
+#define IOIO_REP       BIT(3)
+
+#define IOIO_ADDR_64   BIT(9)
+#define IOIO_ADDR_32   BIT(8)
+#define IOIO_ADDR_16   BIT(7)
+
+#define IOIO_DATA_32   BIT(6)
+#define IOIO_DATA_16   BIT(5)
+#define IOIO_DATA_8    BIT(4)
+
+#define IOIO_SEG_ES    (0 << 10)
+#define IOIO_SEG_DS    (3 << 10)
+
+static enum es_result vc_ioio_exitinfo(struct es_em_ctxt *ctxt, u64 *exitinfo)
+{
+	struct insn *insn = &ctxt->insn;
+	*exitinfo = 0;
+
+	switch (insn->opcode.bytes[0]) {
+	/* INS opcodes */
+	case 0x6c:
+	case 0x6d:
+		*exitinfo |= IOIO_TYPE_INS;
+		*exitinfo |= IOIO_SEG_ES;
+		*exitinfo |= (ctxt->regs->dx & 0xffff) << 16;
+		break;
+
+	/* OUTS opcodes */
+	case 0x6e:
+	case 0x6f:
+		*exitinfo |= IOIO_TYPE_OUTS;
+		*exitinfo |= IOIO_SEG_DS;
+		*exitinfo |= (ctxt->regs->dx & 0xffff) << 16;
+		break;
+
+	/* IN immediate opcodes */
+	case 0xe4:
+	case 0xe5:
+		*exitinfo |= IOIO_TYPE_IN;
+		*exitinfo |= insn->immediate.value << 16;
+		break;
+
+	/* OUT immediate opcodes */
+	case 0xe6:
+	case 0xe7:
+		*exitinfo |= IOIO_TYPE_OUT;
+		*exitinfo |= insn->immediate.value << 16;
+		break;
+
+	/* IN register opcodes */
+	case 0xec:
+	case 0xed:
+		*exitinfo |= IOIO_TYPE_IN;
+		*exitinfo |= (ctxt->regs->dx & 0xffff) << 16;
+		break;
+
+	/* OUT register opcodes */
+	case 0xee:
+	case 0xef:
+		*exitinfo |= IOIO_TYPE_OUT;
+		*exitinfo |= (ctxt->regs->dx & 0xffff) << 16;
+		break;
+
+	default:
+		return ES_DECODE_FAILED;
+	}
+
+	switch (insn->opcode.bytes[0]) {
+	case 0x6c:
+	case 0x6e:
+	case 0xe4:
+	case 0xe6:
+	case 0xec:
+	case 0xee:
+		/* Single byte opcodes */
+		*exitinfo |= IOIO_DATA_8;
+		break;
+	default:
+		/* Length determined by instruction parsing */
+		*exitinfo |= (insn->opnd_bytes == 2) ? IOIO_DATA_16
+						     : IOIO_DATA_32;
+	}
+	switch (insn->addr_bytes) {
+	case 2:
+		*exitinfo |= IOIO_ADDR_16;
+		break;
+	case 4:
+		*exitinfo |= IOIO_ADDR_32;
+		break;
+	case 8:
+		*exitinfo |= IOIO_ADDR_64;
+		break;
+	}
+
+	if (insn_has_rep_prefix(insn))
+		*exitinfo |= IOIO_REP;
+
+	return ES_OK;
+}
+
+static enum es_result vc_handle_ioio(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
+{
+	struct pt_regs *regs = ctxt->regs;
+	u64 exit_info_1, exit_info_2;
+	enum es_result ret;
+
+	ret = vc_ioio_exitinfo(ctxt, &exit_info_1);
+	if (ret != ES_OK)
+		return ret;
+
+	if (exit_info_1 & IOIO_TYPE_STR) {
+		int df = (regs->flags & X86_EFLAGS_DF) ? -1 : 1;
+		unsigned int io_bytes, exit_bytes;
+		unsigned int ghcb_count, op_count;
+		unsigned long es_base;
+		u64 sw_scratch;
+
+		/*
+		 * For the string variants with rep prefix the amount of in/out
+		 * operations per #VC exception is limited so that the kernel
+		 * has a chance to take interrupts an re-schedule while the
+		 * instruction is emulated.
+		 */
+		io_bytes   = (exit_info_1 >> 4) & 0x7;
+		ghcb_count = sizeof(ghcb->shared_buffer) / io_bytes;
+
+		op_count    = (exit_info_1 & IOIO_REP) ? regs->cx : 1;
+		exit_info_2 = min(op_count, ghcb_count);
+		exit_bytes  = exit_info_2 * io_bytes;
+
+		es_base = insn_get_seg_base(ctxt->regs, INAT_SEG_REG_ES);
+
+		if (!(exit_info_1 & IOIO_TYPE_IN)) {
+			ret = vc_insn_string_read(ctxt,
+					       (void *)(es_base + regs->si),
+					       ghcb->shared_buffer, io_bytes,
+					       exit_info_2, df);
+			if (ret)
+				return ret;
+		}
+
+		sw_scratch = __pa(ghcb) + offsetof(struct ghcb, shared_buffer);
+		ghcb_set_sw_scratch(ghcb, sw_scratch);
+		ret = sev_es_ghcb_hv_call(ghcb, ctxt, SVM_EXIT_IOIO,
+				   exit_info_1, exit_info_2);
+		if (ret != ES_OK)
+			return ret;
+
+		/* Everything went well, write back results */
+		if (exit_info_1 & IOIO_TYPE_IN) {
+			ret = vc_insn_string_write(ctxt,
+						(void *)(es_base + regs->di),
+						ghcb->shared_buffer, io_bytes,
+						exit_info_2, df);
+			if (ret)
+				return ret;
+
+			if (df)
+				regs->di -= exit_bytes;
+			else
+				regs->di += exit_bytes;
+		} else {
+			if (df)
+				regs->si -= exit_bytes;
+			else
+				regs->si += exit_bytes;
+		}
+
+		if (exit_info_1 & IOIO_REP)
+			regs->cx -= exit_info_2;
+
+		ret = regs->cx ? ES_RETRY : ES_OK;
+
+	} else {
+		int bits = (exit_info_1 & 0x70) >> 1;
+		u64 rax = 0;
+
+		if (!(exit_info_1 & IOIO_TYPE_IN))
+			rax = lower_bits(regs->ax, bits);
+
+		ghcb_set_rax(ghcb, rax);
+
+		ret = sev_es_ghcb_hv_call(ghcb, ctxt, SVM_EXIT_IOIO, exit_info_1, 0);
+		if (ret != ES_OK)
+			return ret;
+
+		if (exit_info_1 & IOIO_TYPE_IN) {
+			if (!ghcb_is_valid_rax(ghcb))
+				return ES_VMM_ERROR;
+			regs->ax = lower_bits(ghcb->save.rax, bits);
+		}
+	}
+
+	return ret;
+}
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
