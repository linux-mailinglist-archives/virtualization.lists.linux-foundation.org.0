Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4879F15916B
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 15:04:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C511587A72;
	Tue, 11 Feb 2020 14:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jklovF3q3fYZ; Tue, 11 Feb 2020 14:04:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4FF7887852;
	Tue, 11 Feb 2020 14:04:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47158C1D89;
	Tue, 11 Feb 2020 14:04:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98456C1D80
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 94772204E8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nIqEMSz5vzJJ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 4C682204E4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:57 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B804CE88; Tue, 11 Feb 2020 14:53:14 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 42/62] x86/sev-es: Handle DR7 read/write events
Date: Tue, 11 Feb 2020 14:52:36 +0100
Message-Id: <20200211135256.24617-43-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211135256.24617-1-joro@8bytes.org>
References: <20200211135256.24617-1-joro@8bytes.org>
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
 arch/x86/kernel/sev-es.c | 69 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index b27d5b0a8ae1..fcd67ab04d2d 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -22,6 +22,8 @@
 #include <asm/traps.h>
 #include <asm/svm.h>
 
+#define DR7_RESET_VALUE        0x400
+
 /* For early boot hypervisor communication in SEV-ES enabled guests */
 struct ghcb boot_ghcb_page __bss_decrypted __aligned(PAGE_SIZE);
 
@@ -30,6 +32,9 @@ struct ghcb boot_ghcb_page __bss_decrypted __aligned(PAGE_SIZE);
  * cleared
  */
 struct ghcb __initdata *boot_ghcb;
+static DEFINE_PER_CPU(unsigned long, cached_dr7) = DR7_RESET_VALUE;
+/* Needed before per-cpu access is set up */
+static unsigned long early_dr7 = DR7_RESET_VALUE;
 
 /* Runtime GHCBs */
 static DEFINE_PER_CPU_DECRYPTED(struct ghcb, ghcb_page) __aligned(PAGE_SIZE);
@@ -212,13 +217,69 @@ static void __init early_forward_exception(struct es_em_ctxt *ctxt)
 	early_exception(ctxt->regs, trapnr);
 }
 
+static enum es_result handle_dr7_write(struct ghcb *ghcb,
+				       struct es_em_ctxt *ctxt,
+				       bool early)
+{
+	u8 rm = X86_MODRM_RM(ctxt->insn.modrm.value);
+	unsigned long *reg;
+	enum es_result ret;
+
+	if (ctxt->insn.rex_prefix.nbytes &&
+	    X86_REX_B(ctxt->insn.rex_prefix.value))
+		rm |= 0x8;
+
+	reg = register_from_idx(ctxt->regs, rm);
+
+	/* Using a value of 0 for ExitInfo1 means RAX holds the value */
+	ghcb_set_rax(ghcb, *reg);
+	ret = ghcb_hv_call(ghcb, ctxt, SVM_EXIT_WRITE_DR7, 0, 0);
+	if (ret != ES_OK)
+		return ret;
+
+	if (early)
+		early_dr7 = *reg;
+	else
+		this_cpu_write(cached_dr7, *reg);
+
+	return ES_OK;
+}
+
+static enum es_result handle_dr7_read(struct ghcb *ghcb,
+				      struct es_em_ctxt *ctxt,
+				      bool early)
+{
+	u8 rm = X86_MODRM_RM(ctxt->insn.modrm.value);
+	unsigned long *reg;
+
+	if (ctxt->insn.rex_prefix.nbytes &&
+	    X86_REX_B(ctxt->insn.rex_prefix.value))
+		rm |= 0x8;
+
+	reg = register_from_idx(ctxt->regs, rm);
+
+	if (early)
+		*reg = early_dr7;
+	else
+		*reg = this_cpu_read(cached_dr7);
+
+	return ES_OK;
+}
+
 static enum es_result handle_vc_exception(struct es_em_ctxt *ctxt,
-		struct ghcb *ghcb,
-		unsigned long exit_code)
+					  struct ghcb *ghcb,
+					  unsigned long exit_code,
+					  bool early)
 {
 	enum es_result result;
 
 	switch (exit_code) {
+	case SVM_EXIT_READ_DR7:
+		result = handle_dr7_read(ghcb, ctxt, early);
+		break;
+	case SVM_EXIT_WRITE_DR7:
+		result = handle_dr7_write(ghcb, ctxt, early);
+		break;
 	case SVM_EXIT_CPUID:
 		result = handle_cpuid(ghcb, ctxt);
 		break;
@@ -302,7 +363,7 @@ dotraplinkage void do_vmm_communication(struct pt_regs *regs, unsigned long exit
 		result = context_filter(regs, exit_code);
 
 	if (result == ES_OK)
-		result = handle_vc_exception(&ctxt, ghcb, exit_code);
+		result = handle_vc_exception(&ctxt, ghcb, exit_code, false);
 
 	/* Done - now check the result */
 	switch (result) {
@@ -368,7 +429,7 @@ int __init boot_vc_exception(struct pt_regs *regs)
 	result = init_em_ctxt(&ctxt, regs, exit_code);
 
 	if (result == ES_OK)
-		result = handle_vc_exception(&ctxt, boot_ghcb, exit_code);
+		result = handle_vc_exception(&ctxt, boot_ghcb, exit_code, true);
 
 	/* Done - now check the result */
 	switch (result) {
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
