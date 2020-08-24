Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CD84624F602
	for <lists.virtualization@lfdr.de>; Mon, 24 Aug 2020 10:56:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CC4C688167;
	Mon, 24 Aug 2020 08:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lx6iN39Wq7at; Mon, 24 Aug 2020 08:56:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DD4F88815C;
	Mon, 24 Aug 2020 08:55:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC799C0051;
	Mon, 24 Aug 2020 08:55:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96B1BC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7D14087798
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdROhRdZRjJo
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:55:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9F7F187747
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:55:54 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2bb8d.dip0.t-ipconnect.de
 [79.242.187.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 5FB1C664;
 Mon, 24 Aug 2020 10:55:51 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v6 10/76] x86/insn: Add insn_get_modrm_reg_off()
Date: Mon, 24 Aug 2020 10:54:05 +0200
Message-Id: <20200824085511.7553-11-joro@8bytes.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824085511.7553-1-joro@8bytes.org>
References: <20200824085511.7553-1-joro@8bytes.org>
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

Add a function to the instruction decoder which returns the pt_regs
offset of the register specified in the reg field of the modrm byte.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
Link: https://lore.kernel.org/r/20200724160336.5435-10-joro@8bytes.org
---
 arch/x86/include/asm/insn-eval.h |  1 +
 arch/x86/lib/insn-eval.c         | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/x86/include/asm/insn-eval.h b/arch/x86/include/asm/insn-eval.h
index 392b4fe377f9..f748f57f1491 100644
--- a/arch/x86/include/asm/insn-eval.h
+++ b/arch/x86/include/asm/insn-eval.h
@@ -17,6 +17,7 @@
 
 void __user *insn_get_addr_ref(struct insn *insn, struct pt_regs *regs);
 int insn_get_modrm_rm_off(struct insn *insn, struct pt_regs *regs);
+int insn_get_modrm_reg_off(struct insn *insn, struct pt_regs *regs);
 unsigned long insn_get_seg_base(struct pt_regs *regs, int seg_reg_idx);
 int insn_get_code_seg_params(struct pt_regs *regs);
 int insn_fetch_from_user(struct pt_regs *regs,
diff --git a/arch/x86/lib/insn-eval.c b/arch/x86/lib/insn-eval.c
index f52046f90dd3..a8ac5c5e94f0 100644
--- a/arch/x86/lib/insn-eval.c
+++ b/arch/x86/lib/insn-eval.c
@@ -20,6 +20,7 @@
 
 enum reg_type {
 	REG_TYPE_RM = 0,
+	REG_TYPE_REG,
 	REG_TYPE_INDEX,
 	REG_TYPE_BASE,
 };
@@ -441,6 +442,13 @@ static int get_reg_offset(struct insn *insn, struct pt_regs *regs,
 			regno += 8;
 		break;
 
+	case REG_TYPE_REG:
+		regno = X86_MODRM_REG(insn->modrm.value);
+
+		if (X86_REX_R(insn->rex_prefix.value))
+			regno += 8;
+		break;
+
 	case REG_TYPE_INDEX:
 		regno = X86_SIB_INDEX(insn->sib.value);
 		if (X86_REX_X(insn->rex_prefix.value))
@@ -809,6 +817,21 @@ int insn_get_modrm_rm_off(struct insn *insn, struct pt_regs *regs)
 	return get_reg_offset(insn, regs, REG_TYPE_RM);
 }
 
+/**
+ * insn_get_modrm_reg_off() - Obtain register in reg part of the ModRM byte
+ * @insn:	Instruction containing the ModRM byte
+ * @regs:	Register values as seen when entering kernel mode
+ *
+ * Returns:
+ *
+ * The register indicated by the reg part of the ModRM byte. The
+ * register is obtained as an offset from the base of pt_regs.
+ */
+int insn_get_modrm_reg_off(struct insn *insn, struct pt_regs *regs)
+{
+	return get_reg_offset(insn, regs, REG_TYPE_REG);
+}
+
 /**
  * get_seg_base_limit() - obtain base address and limit of a segment
  * @insn:	Instruction. Must be valid.
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
