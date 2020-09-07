Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BA525FB25
	for <lists.virtualization@lfdr.de>; Mon,  7 Sep 2020 15:17:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D418B2746F;
	Mon,  7 Sep 2020 13:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ptNLrvcr8KNn; Mon,  7 Sep 2020 13:16:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 584A520531;
	Mon,  7 Sep 2020 13:16:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44821C0891;
	Mon,  7 Sep 2020 13:16:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1136C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AFB7E87079
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yqwdex+Ebno
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:16:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 03573870B1
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:16:49 +0000 (UTC)
Received: from cap.home.8bytes.org (p549add56.dip0.t-ipconnect.de
 [84.154.221.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 4CE9DCAC;
 Mon,  7 Sep 2020 15:16:46 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v7 08/72] x86/umip: Factor out instruction fetch
Date: Mon,  7 Sep 2020 15:15:09 +0200
Message-Id: <20200907131613.12703-9-joro@8bytes.org>
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

Factor out the code to fetch the instruction from user-space to a helper
function.

No functional changes.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/insn-eval.h |  2 ++
 arch/x86/kernel/umip.c           | 26 +++++-----------------
 arch/x86/lib/insn-eval.c         | 38 ++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/insn-eval.h b/arch/x86/include/asm/insn-eval.h
index 2b6ccf2c49f1..b8b9ef1bbd06 100644
--- a/arch/x86/include/asm/insn-eval.h
+++ b/arch/x86/include/asm/insn-eval.h
@@ -19,5 +19,7 @@ void __user *insn_get_addr_ref(struct insn *insn, struct pt_regs *regs);
 int insn_get_modrm_rm_off(struct insn *insn, struct pt_regs *regs);
 unsigned long insn_get_seg_base(struct pt_regs *regs, int seg_reg_idx);
 int insn_get_code_seg_params(struct pt_regs *regs);
+int insn_fetch_from_user(struct pt_regs *regs,
+			 unsigned char buf[MAX_INSN_SIZE]);
 
 #endif /* _ASM_X86_INSN_EVAL_H */
diff --git a/arch/x86/kernel/umip.c b/arch/x86/kernel/umip.c
index 2c304fd0bb1a..ad135be4f1f0 100644
--- a/arch/x86/kernel/umip.c
+++ b/arch/x86/kernel/umip.c
@@ -335,11 +335,11 @@ static void force_sig_info_umip_fault(void __user *addr, struct pt_regs *regs)
  */
 bool fixup_umip_exception(struct pt_regs *regs)
 {
-	int not_copied, nr_copied, reg_offset, dummy_data_size, umip_inst;
-	unsigned long seg_base = 0, *reg_addr;
+	int nr_copied, reg_offset, dummy_data_size, umip_inst;
 	/* 10 bytes is the maximum size of the result of UMIP instructions */
 	unsigned char dummy_data[10] = { 0 };
 	unsigned char buf[MAX_INSN_SIZE];
+	unsigned long *reg_addr;
 	void __user *uaddr;
 	struct insn insn;
 	int seg_defs;
@@ -347,26 +347,12 @@ bool fixup_umip_exception(struct pt_regs *regs)
 	if (!regs)
 		return false;
 
-	/*
-	 * If not in user-space long mode, a custom code segment could be in
-	 * use. This is true in protected mode (if the process defined a local
-	 * descriptor table), or virtual-8086 mode. In most of the cases
-	 * seg_base will be zero as in USER_CS.
-	 */
-	if (!user_64bit_mode(regs))
-		seg_base = insn_get_seg_base(regs, INAT_SEG_REG_CS);
-
-	if (seg_base == -1L)
-		return false;
-
-	not_copied = copy_from_user(buf, (void __user *)(seg_base + regs->ip),
-				    sizeof(buf));
-	nr_copied = sizeof(buf) - not_copied;
+	nr_copied = insn_fetch_from_user(regs, buf);
 
 	/*
-	 * The copy_from_user above could have failed if user code is protected
-	 * by a memory protection key. Give up on emulation in such a case.
-	 * Should we issue a page fault?
+	 * The insn_fetch_from_user above could have failed if user code
+	 * is protected by a memory protection key. Give up on emulation
+	 * in such a case.  Should we issue a page fault?
 	 */
 	if (!nr_copied)
 		return false;
diff --git a/arch/x86/lib/insn-eval.c b/arch/x86/lib/insn-eval.c
index 5e69603ff63f..947b7f1a0042 100644
--- a/arch/x86/lib/insn-eval.c
+++ b/arch/x86/lib/insn-eval.c
@@ -1367,3 +1367,41 @@ void __user *insn_get_addr_ref(struct insn *insn, struct pt_regs *regs)
 		return (void __user *)-1L;
 	}
 }
+
+/**
+ * insn_fetch_from_user() - Copy instruction bytes from user-space memory
+ * @regs:	Structure with register values as seen when entering kernel mode
+ * @buf:	Array to store the fetched instruction
+ *
+ * Gets the linear address of the instruction and copies the instruction bytes
+ * to the buf.
+ *
+ * Returns:
+ *
+ * Number of instruction bytes copied.
+ *
+ * 0 if nothing was copied.
+ */
+int insn_fetch_from_user(struct pt_regs *regs, unsigned char buf[MAX_INSN_SIZE])
+{
+	unsigned long seg_base = 0;
+	int not_copied;
+
+	/*
+	 * If not in user-space long mode, a custom code segment could be in
+	 * use. This is true in protected mode (if the process defined a local
+	 * descriptor table), or virtual-8086 mode. In most of the cases
+	 * seg_base will be zero as in USER_CS.
+	 */
+	if (!user_64bit_mode(regs)) {
+		seg_base = insn_get_seg_base(regs, INAT_SEG_REG_CS);
+		if (seg_base == -1L)
+			return 0;
+	}
+
+
+	not_copied = copy_from_user(buf, (void __user *)(seg_base + regs->ip),
+				    MAX_INSN_SIZE);
+
+	return MAX_INSN_SIZE - not_copied;
+}
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
