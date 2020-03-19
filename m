Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BEC18B015
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:24:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8798F88350;
	Thu, 19 Mar 2020 09:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RGdEtnyOT1Rk; Thu, 19 Mar 2020 09:24:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 581B98838C;
	Thu, 19 Mar 2020 09:24:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5027EC07FF;
	Thu, 19 Mar 2020 09:24:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 629DDC1D8A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 596B187B82
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bshvg8Kkuzp2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BD63387B4B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:46 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 2D159C11; Thu, 19 Mar 2020 10:14:25 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 47/70] x86/sev-es: Handle MMIO events
Date: Thu, 19 Mar 2020 10:13:44 +0100
Message-Id: <20200319091407.1481-48-joro@8bytes.org>
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

From: Tom Lendacky <thomas.lendacky@amd.com>

Add handler for VC exceptions caused by MMIO intercepts. These
intercepts come along as nested page faults on pages with reserved
bits set.

TODO:
	- Add return values of helper functions
	- Check permissions on page-table walks
	- Check data segments
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
[ jroedel@suse.de: Adapt to VC handling framework ]
Co-developed-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/sev-es.c |   5 +
 arch/x86/include/uapi/asm/svm.h   |   5 +
 arch/x86/kernel/sev-es.c          | 188 ++++++++++++++++++++++++++++++
 3 files changed, 198 insertions(+)

diff --git a/arch/x86/boot/compressed/sev-es.c b/arch/x86/boot/compressed/sev-es.c
index 40eaf24db641..53c65fc09341 100644
--- a/arch/x86/boot/compressed/sev-es.c
+++ b/arch/x86/boot/compressed/sev-es.c
@@ -100,6 +100,11 @@ static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
 	return ES_OK;
 }
 
+static phys_addr_t vc_slow_virt_to_phys(struct ghcb *ghcb, long vaddr)
+{
+	return (phys_addr_t)vaddr;
+}
+
 #undef __init
 #undef __pa
 #define __init
diff --git a/arch/x86/include/uapi/asm/svm.h b/arch/x86/include/uapi/asm/svm.h
index c68d1618c9b0..8f36ae021a7f 100644
--- a/arch/x86/include/uapi/asm/svm.h
+++ b/arch/x86/include/uapi/asm/svm.h
@@ -81,6 +81,11 @@
 #define SVM_EXIT_AVIC_INCOMPLETE_IPI		0x401
 #define SVM_EXIT_AVIC_UNACCELERATED_ACCESS	0x402
 
+/* SEV-ES software-defined VMGEXIT events */
+#define SVM_VMGEXIT_MMIO_READ			0x80000001
+#define SVM_VMGEXIT_MMIO_WRITE			0x80000002
+#define SVM_VMGEXIT_UNSUPPORTED_EVENT		0x8000ffff
+
 #define SVM_EXIT_ERR           -1
 
 #define SVM_EXIT_REASONS \
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 6d45a2499460..6b0f82f81229 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -240,6 +240,25 @@ static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
 	return ES_EXCEPTION;
 }
 
+static phys_addr_t vc_slow_virt_to_phys(struct ghcb *ghcb, long vaddr)
+{
+	unsigned long va = (unsigned long)vaddr;
+	unsigned int level;
+	phys_addr_t pa;
+	pgd_t *pgd;
+	pte_t *pte;
+
+	pgd = pgd_offset(current->active_mm, va);
+	pte = lookup_address_in_pgd(pgd, va, &level);
+	if (!pte)
+		return 0;
+
+	pa = (phys_addr_t)pte_pfn(*pte) << PAGE_SHIFT;
+	pa |= va & ~page_level_mask(level);
+
+	return pa;
+}
+
 /* Include code shared with pre-decompression boot stage */
 #include "sev-es-shared.c"
 
@@ -295,6 +314,172 @@ static void __init vc_early_vc_forward_exception(struct es_em_ctxt *ctxt)
 	early_exception(ctxt->regs, trapnr);
 }
 
+static long *vc_insn_get_reg(struct es_em_ctxt *ctxt)
+{
+	long *reg_array;
+	int offset;
+
+	reg_array = (long *)ctxt->regs;
+	offset    = insn_get_modrm_reg_off(&ctxt->insn, ctxt->regs);
+
+	if (offset < 0)
+		return NULL;
+
+	offset /= sizeof(long);
+
+	return reg_array + offset;
+}
+
+static enum es_result vc_do_mmio(struct ghcb *ghcb, struct es_em_ctxt *ctxt,
+				 unsigned int bytes, bool read)
+{
+	u64 exit_code, exit_info_1, exit_info_2;
+	unsigned long ghcb_pa = __pa(ghcb);
+	void __user *ref;
+
+	ref = insn_get_addr_ref(&ctxt->insn, ctxt->regs);
+	if (ref == (void __user *)-1L)
+		return ES_UNSUPPORTED;
+
+	exit_code = read ? SVM_VMGEXIT_MMIO_READ : SVM_VMGEXIT_MMIO_WRITE;
+
+	exit_info_1 = vc_slow_virt_to_phys(ghcb, (long)ref);
+	exit_info_2 = bytes;    /* Can never be greater than 8 */
+
+	ghcb->save.sw_scratch = ghcb_pa + offsetof(struct ghcb, shared_buffer);
+
+	return sev_es_ghcb_hv_call(ghcb, ctxt, exit_code, exit_info_1, exit_info_2);
+}
+
+static enum es_result vc_handle_mmio_twobyte_ops(struct ghcb *ghcb,
+						 struct es_em_ctxt *ctxt)
+{
+	struct insn *insn = &ctxt->insn;
+	unsigned int bytes = 0;
+	enum es_result ret;
+	int sign_byte;
+	long *reg_data;
+
+	switch (insn->opcode.bytes[1]) {
+		/* MMIO Read w/ zero-extension */
+	case 0xb6:
+		bytes = 1;
+		/* Fallthrough */
+	case 0xb7:
+		if (!bytes)
+			bytes = 2;
+
+		ret = vc_do_mmio(ghcb, ctxt, bytes, true);
+		if (ret)
+			break;
+
+		/* Zero extend based on operand size */
+		reg_data = vc_insn_get_reg(ctxt);
+		memset(reg_data, 0, insn->opnd_bytes);
+
+		memcpy(reg_data, ghcb->shared_buffer, bytes);
+		break;
+
+		/* MMIO Read w/ sign-extension */
+	case 0xbe:
+		bytes = 1;
+		/* Fallthrough */
+	case 0xbf:
+		if (!bytes)
+			bytes = 2;
+
+		ret = vc_do_mmio(ghcb, ctxt, bytes, true);
+		if (ret)
+			break;
+
+		/* Sign extend based on operand size */
+		reg_data = vc_insn_get_reg(ctxt);
+		if (bytes == 1) {
+			u8 *val = (u8 *)ghcb->shared_buffer;
+
+			sign_byte = (*val & 0x80) ? 0x00 : 0xff;
+		} else {
+			u16 *val = (u16 *)ghcb->shared_buffer;
+
+			sign_byte = (*val & 0x8000) ? 0x00 : 0xff;
+		}
+		memset(reg_data, sign_byte, insn->opnd_bytes);
+
+		memcpy(reg_data, ghcb->shared_buffer, bytes);
+		break;
+
+	default:
+		ret = ES_UNSUPPORTED;
+	}
+
+	return ret;
+}
+
+static enum es_result vc_handle_mmio(struct ghcb *ghcb,
+				     struct es_em_ctxt *ctxt)
+{
+	struct insn *insn = &ctxt->insn;
+	unsigned int bytes = 0;
+	enum es_result ret;
+	long *reg_data;
+
+	switch (insn->opcode.bytes[0]) {
+	/* MMIO Write */
+	case 0x88:
+		bytes = 1;
+		/* Fallthrough */
+	case 0x89:
+		if (!bytes)
+			bytes = insn->opnd_bytes;
+
+		reg_data = vc_insn_get_reg(ctxt);
+		memcpy(ghcb->shared_buffer, reg_data, bytes);
+
+		ret = vc_do_mmio(ghcb, ctxt, bytes, false);
+		break;
+
+	case 0xc6:
+		bytes = 1;
+		/* Fallthrough */
+	case 0xc7:
+		if (!bytes)
+			bytes = insn->opnd_bytes;
+
+		memcpy(ghcb->shared_buffer, insn->immediate1.bytes, bytes);
+
+		ret = vc_do_mmio(ghcb, ctxt, bytes, false);
+		break;
+
+		/* MMIO Read */
+	case 0x8a:
+		bytes = 1;
+		/* Fallthrough */
+	case 0x8b:
+		if (!bytes)
+			bytes = insn->opnd_bytes;
+
+		ret = vc_do_mmio(ghcb, ctxt, bytes, true);
+		if (ret)
+			break;
+
+		reg_data = vc_insn_get_reg(ctxt);
+		if (bytes == 4)
+			*reg_data = 0;  /* Zero-extend for 32-bit operation */
+
+		memcpy(reg_data, ghcb->shared_buffer, bytes);
+		break;
+
+		/* Two-Byte Opcodes */
+	case 0x0f:
+		ret = vc_handle_mmio_twobyte_ops(ghcb, ctxt);
+		break;
+	default:
+		ret = ES_UNSUPPORTED;
+	}
+
+	return ret;
+}
+
 static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
 		struct ghcb *ghcb,
 		unsigned long exit_code)
@@ -308,6 +493,9 @@ static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
 	case SVM_EXIT_IOIO:
 		result = vc_handle_ioio(ghcb, ctxt);
 		break;
+	case SVM_EXIT_NPF:
+		result = vc_handle_mmio(ghcb, ctxt);
+		break;
 	default:
 		/*
 		 * Unexpected #VC exception
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
