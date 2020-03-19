Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A68C718B008
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:23:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 54E06882EB;
	Thu, 19 Mar 2020 09:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZM-+alI6NAin; Thu, 19 Mar 2020 09:23:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 33C7B88324;
	Thu, 19 Mar 2020 09:23:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18D67C07FF;
	Thu, 19 Mar 2020 09:23:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B72A1C1D89
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 96ADA87B72
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0GHA7tiinvNd
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C1BAC87B82
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:46 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id BE09EE7D; Thu, 19 Mar 2020 10:14:25 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 50/70] x86/sev-es: Handle DR7 read/write events
Date: Thu, 19 Mar 2020 10:13:47 +0100
Message-Id: <20200319091407.1481-51-joro@8bytes.org>
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

Add code to handle #VC exceptions on DR7 register reads and writes.
This is needed early because show_regs() reads DR7 to print it out.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
[ jroedel@suse.de: - Adapt to #VC handling framework
                   - Support early usage ]
Co-developed-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es.c | 87 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 163b8a7f98a4..7a9cdc660637 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -23,6 +23,8 @@
 #include <asm/traps.h>
 #include <asm/svm.h>
 
+#define DR7_RESET_VALUE        0x400
+
 /* For early boot hypervisor communication in SEV-ES enabled guests */
 struct ghcb boot_ghcb_page __bss_decrypted __aligned(PAGE_SIZE);
 
@@ -31,6 +33,7 @@ struct ghcb boot_ghcb_page __bss_decrypted __aligned(PAGE_SIZE);
  * cleared
  */
 struct ghcb __initdata *boot_ghcb;
+static DEFINE_PER_CPU(unsigned long, cached_dr7) = DR7_RESET_VALUE;
 
 struct ghcb_state {
 	struct ghcb *ghcb;
@@ -359,6 +362,21 @@ static long *vc_insn_get_reg(struct es_em_ctxt *ctxt)
 	return reg_array + offset;
 }
 
+static long *vc_insn_get_rm(struct es_em_ctxt *ctxt)
+{
+	long *reg_array;
+	int offset;
+
+	reg_array = (long *)ctxt->regs;
+	offset    = insn_get_modrm_rm_off(&ctxt->insn, ctxt->regs);
+
+	if (offset < 0)
+		return NULL;
+
+	offset /= sizeof(long);
+
+	return reg_array + offset;
+}
 static enum es_result vc_do_mmio(struct ghcb *ghcb, struct es_em_ctxt *ctxt,
 				 unsigned int bytes, bool read)
 {
@@ -587,13 +605,74 @@ static enum es_result vc_handle_mmio(struct ghcb *ghcb,
 	return ret;
 }
 
+static enum es_result vc_handle_dr7_write(struct ghcb *ghcb,
+					  struct es_em_ctxt *ctxt,
+					  bool early)
+{
+	long val, *reg = vc_insn_get_rm(ctxt);
+	enum es_result ret;
+
+	if (!reg)
+		return ES_DECODE_FAILED;
+
+	val = *reg;
+
+	/* Upper 32 bits must be written as zeroes */
+	if (val >> 32) {
+		ctxt->fi.vector = X86_TRAP_GP;
+		ctxt->fi.error_code = 0;
+		return ES_EXCEPTION;
+	}
+
+	/* Clear out other reservered bits and set bit 10 */
+	val = (val & 0xffff23ffL) | BIT(10);
+
+	/* Early non-zero writes to DR7 are not supported */
+	if (early && (val & ~DR7_RESET_VALUE))
+		return ES_UNSUPPORTED;
+
+	/* Using a value of 0 for ExitInfo1 means RAX holds the value */
+	ghcb_set_rax(ghcb, val);
+	ret = sev_es_ghcb_hv_call(ghcb, ctxt, SVM_EXIT_WRITE_DR7, 0, 0);
+	if (ret != ES_OK)
+		return ret;
+
+	this_cpu_write(cached_dr7, *reg);
+
+	return ES_OK;
+}
+
+static enum es_result vc_handle_dr7_read(struct ghcb *ghcb,
+					 struct es_em_ctxt *ctxt,
+					 bool early)
+{
+	long *reg = vc_insn_get_rm(ctxt);
+
+	if (!reg)
+		return ES_DECODE_FAILED;
+
+	if (early)
+		*reg = DR7_RESET_VALUE;
+	else
+		*reg = this_cpu_read(cached_dr7);
+
+	return ES_OK;
+}
+
 static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
-		struct ghcb *ghcb,
-		unsigned long exit_code)
+					 struct ghcb *ghcb,
+					 unsigned long exit_code,
+					 bool early)
 {
 	enum es_result result;
 
 	switch (exit_code) {
+	case SVM_EXIT_READ_DR7:
+		result = vc_handle_dr7_read(ghcb, ctxt, early);
+		break;
+	case SVM_EXIT_WRITE_DR7:
+		result = vc_handle_dr7_write(ghcb, ctxt, early);
+		break;
 	case SVM_EXIT_CPUID:
 		result = vc_handle_cpuid(ghcb, ctxt);
 		break;
@@ -682,7 +761,7 @@ dotraplinkage void do_vmm_communication(struct pt_regs *regs, unsigned long exit
 		result = vc_context_filter(regs, exit_code);
 
 	if (result == ES_OK)
-		result = vc_handle_exitcode(&ctxt, ghcb, exit_code);
+		result = vc_handle_exitcode(&ctxt, ghcb, exit_code, false);
 
 	sev_es_put_ghcb(&state);
 
@@ -750,7 +829,7 @@ bool __init boot_vc_exception(struct pt_regs *regs)
 	result = vc_init_em_ctxt(&ctxt, regs, exit_code);
 
 	if (result == ES_OK)
-		result = vc_handle_exitcode(&ctxt, boot_ghcb, exit_code);
+		result = vc_handle_exitcode(&ctxt, boot_ghcb, exit_code, true);
 
 	/* Done - now check the result */
 	switch (result) {
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
