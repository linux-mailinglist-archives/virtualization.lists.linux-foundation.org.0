Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE7218AF12
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:14:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DCCDC86B45;
	Thu, 19 Mar 2020 09:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iHdiP-1aA4pG; Thu, 19 Mar 2020 09:14:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2138E86B70;
	Thu, 19 Mar 2020 09:14:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 160FAC1830;
	Thu, 19 Mar 2020 09:14:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8FE0C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9801A87CB1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdaGO6Ytgt83
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7724C881E9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:24 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 104A7217; Thu, 19 Mar 2020 10:14:16 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 07/70] x86/umip: Factor out instruction decoding
Date: Thu, 19 Mar 2020 10:13:04 +0100
Message-Id: <20200319091407.1481-8-joro@8bytes.org>
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

Factor out the code used to decode an instruction with the correct
address and operand sizes to a helper function.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/insn-eval.h |  2 ++
 arch/x86/kernel/umip.c           | 23 +---------------
 arch/x86/lib/insn-eval.c         | 45 ++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/insn-eval.h b/arch/x86/include/asm/insn-eval.h
index b8b9ef1bbd06..b4ff3e3316d1 100644
--- a/arch/x86/include/asm/insn-eval.h
+++ b/arch/x86/include/asm/insn-eval.h
@@ -21,5 +21,7 @@ unsigned long insn_get_seg_base(struct pt_regs *regs, int seg_reg_idx);
 int insn_get_code_seg_params(struct pt_regs *regs);
 int insn_fetch_from_user(struct pt_regs *regs,
 			 unsigned char buf[MAX_INSN_SIZE]);
+bool insn_decode(struct pt_regs *regs, struct insn *insn,
+		 unsigned char buf[MAX_INSN_SIZE], int buf_size);
 
 #endif /* _ASM_X86_INSN_EVAL_H */
diff --git a/arch/x86/kernel/umip.c b/arch/x86/kernel/umip.c
index 00cb157673b1..ff6d67242eee 100644
--- a/arch/x86/kernel/umip.c
+++ b/arch/x86/kernel/umip.c
@@ -324,7 +324,6 @@ bool fixup_umip_exception(struct pt_regs *regs)
 	unsigned long *reg_addr;
 	void __user *uaddr;
 	struct insn insn;
-	int seg_defs;
 
 	if (!regs)
 		return false;
@@ -339,27 +338,7 @@ bool fixup_umip_exception(struct pt_regs *regs)
 	if (!nr_copied)
 		return false;
 
-	insn_init(&insn, buf, nr_copied, user_64bit_mode(regs));
-
-	/*
-	 * Override the default operand and address sizes with what is specified
-	 * in the code segment descriptor. The instruction decoder only sets
-	 * the address size it to either 4 or 8 address bytes and does nothing
-	 * for the operand bytes. This OK for most of the cases, but we could
-	 * have special cases where, for instance, a 16-bit code segment
-	 * descriptor is used.
-	 * If there is an address override prefix, the instruction decoder
-	 * correctly updates these values, even for 16-bit defaults.
-	 */
-	seg_defs = insn_get_code_seg_params(regs);
-	if (seg_defs == -EINVAL)
-		return false;
-
-	insn.addr_bytes = INSN_CODE_SEG_ADDR_SZ(seg_defs);
-	insn.opnd_bytes = INSN_CODE_SEG_OPND_SZ(seg_defs);
-
-	insn_get_length(&insn);
-	if (nr_copied < insn.length)
+	if (!insn_decode(regs, &insn, buf, nr_copied))
 		return false;
 
 	umip_inst = identify_insn(&insn);
diff --git a/arch/x86/lib/insn-eval.c b/arch/x86/lib/insn-eval.c
index 95ae3953e2a2..1949f5258f9e 100644
--- a/arch/x86/lib/insn-eval.c
+++ b/arch/x86/lib/insn-eval.c
@@ -1407,3 +1407,48 @@ int insn_fetch_from_user(struct pt_regs *regs,
 
 	return MAX_INSN_SIZE - not_copied;
 }
+
+/**
+ * insn_decode() - Decode an instruction
+ * @regs:	Structure with register values as seen when entering kernel mode
+ * @insn:	Structure to store decoded instruction
+ * @buf:	Buffer containing the instruction bytes
+ * @buf_size:   Number of instruction bytes available in buf
+ *
+ * Decodes the instruction provided in buf and stores the decoding results in
+ * insn. Also determines the correct address and operand sizes.
+ *
+ * Returns:
+ *
+ * True if instruction was decoded, False otherwise.
+ */
+bool insn_decode(struct pt_regs *regs, struct insn *insn,
+		 unsigned char buf[MAX_INSN_SIZE], int buf_size)
+{
+	int seg_defs;
+
+	insn_init(insn, buf, buf_size, user_64bit_mode(regs));
+
+	/*
+	 * Override the default operand and address sizes with what is specified
+	 * in the code segment descriptor. The instruction decoder only sets
+	 * the address size it to either 4 or 8 address bytes and does nothing
+	 * for the operand bytes. This OK for most of the cases, but we could
+	 * have special cases where, for instance, a 16-bit code segment
+	 * descriptor is used.
+	 * If there is an address override prefix, the instruction decoder
+	 * correctly updates these values, even for 16-bit defaults.
+	 */
+	seg_defs = insn_get_code_seg_params(regs);
+	if (seg_defs == -EINVAL)
+		return false;
+
+	insn->addr_bytes = INSN_CODE_SEG_ADDR_SZ(seg_defs);
+	insn->opnd_bytes = INSN_CODE_SEG_OPND_SZ(seg_defs);
+
+	insn_get_length(insn);
+	if (buf_size < insn->length)
+		return false;
+
+	return true;
+}
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
