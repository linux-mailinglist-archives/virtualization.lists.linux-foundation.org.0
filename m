Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7889924F5FF
	for <lists.virtualization@lfdr.de>; Mon, 24 Aug 2020 10:56:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 272E585DE1;
	Mon, 24 Aug 2020 08:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eyvr8WwyhmwX; Mon, 24 Aug 2020 08:56:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8DC1985F4D;
	Mon, 24 Aug 2020 08:55:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74CEAC0895;
	Mon, 24 Aug 2020 08:55:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48B71C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 384EC87E57
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2wREwnjMK1w
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:55:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9E4E687DFE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:55:54 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2bb8d.dip0.t-ipconnect.de
 [79.242.187.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id E71546D8;
 Mon, 24 Aug 2020 10:55:51 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v6 11/76] x86/insn: Add insn_has_rep_prefix() helper
Date: Mon, 24 Aug 2020 10:54:06 +0200
Message-Id: <20200824085511.7553-12-joro@8bytes.org>
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

Add a function to check whether an instruction has a REP prefix.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
Link: https://lore.kernel.org/r/20200724160336.5435-11-joro@8bytes.org
---
 arch/x86/include/asm/insn-eval.h |  1 +
 arch/x86/lib/insn-eval.c         | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/x86/include/asm/insn-eval.h b/arch/x86/include/asm/insn-eval.h
index f748f57f1491..a0f839aa144d 100644
--- a/arch/x86/include/asm/insn-eval.h
+++ b/arch/x86/include/asm/insn-eval.h
@@ -15,6 +15,7 @@
 #define INSN_CODE_SEG_OPND_SZ(params) (params & 0xf)
 #define INSN_CODE_SEG_PARAMS(oper_sz, addr_sz) (oper_sz | (addr_sz << 4))
 
+bool insn_has_rep_prefix(struct insn *insn);
 void __user *insn_get_addr_ref(struct insn *insn, struct pt_regs *regs);
 int insn_get_modrm_rm_off(struct insn *insn, struct pt_regs *regs);
 int insn_get_modrm_reg_off(struct insn *insn, struct pt_regs *regs);
diff --git a/arch/x86/lib/insn-eval.c b/arch/x86/lib/insn-eval.c
index a8ac5c5e94f0..8ed9d645259c 100644
--- a/arch/x86/lib/insn-eval.c
+++ b/arch/x86/lib/insn-eval.c
@@ -53,6 +53,30 @@ static bool is_string_insn(struct insn *insn)
 	}
 }
 
+/**
+ * insn_has_rep_prefix() - Determine if instruction has a REP prefix
+ * @insn:	Instruction containing the prefix to inspect
+ *
+ * Returns:
+ *
+ * true if the instruction has a REP prefix, false if not.
+ */
+bool insn_has_rep_prefix(struct insn *insn)
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
 /**
  * get_seg_reg_override_idx() - obtain segment register override index
  * @insn:	Valid instruction with segment override prefixes
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
