Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0CB18B001
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:23:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B8F7C86427;
	Thu, 19 Mar 2020 09:23:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftUs5gK53NJo; Thu, 19 Mar 2020 09:23:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF38186365;
	Thu, 19 Mar 2020 09:23:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C84E3C07FF;
	Thu, 19 Mar 2020 09:23:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91364C1D8A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6EE8186257
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1iUJUWqG_xmR
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BC90385F11
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:46 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A9D92EC7; Thu, 19 Mar 2020 10:14:27 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 61/70] x86/paravirt: Allow hypervisor specific VMMCALL
 handling under SEV-ES
Date: Thu, 19 Mar 2020 10:13:58 +0100
Message-Id: <20200319091407.1481-62-joro@8bytes.org>
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

Add two new paravirt callbacks to provide hypervisor specific processor
state in the GHCB and to copy state from the hypervisor back to the
processor.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/x86_init.h | 16 +++++++++++++++-
 arch/x86/kernel/sev-es.c        | 12 ++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
index 96d9cd208610..c4790ec279cc 100644
--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -4,8 +4,10 @@
 
 #include <asm/bootparam.h>
 
+struct ghcb;
 struct mpc_bus;
 struct mpc_cpu;
+struct pt_regs;
 struct mpc_table;
 struct cpuinfo_x86;
 
@@ -238,10 +240,22 @@ struct x86_legacy_features {
 /**
  * struct x86_hyper_runtime - x86 hypervisor specific runtime callbacks
  *
- * @pin_vcpu:		pin current vcpu to specified physical cpu (run rarely)
+ * @pin_vcpu:			pin current vcpu to specified physical
+ *				cpu (run rarely)
+ * @sev_es_hcall_prepare:	Load additional hypervisor-specific
+ *				state into the GHCB when doing a VMMCALL under
+ *				SEV-ES. Called from the #VC exception handler.
+ * @sev_es_hcall_finish:	Copies state from the GHCB back into the
+ *				processor (or pt_regs). Also runs checks on the
+ *				state returned from the hypervisor after a
+ *				VMMCALL under SEV-ES.  Needs to return 'false'
+ *				if the checks fail.  Called from the #VC
+ *				exception handler.
  */
 struct x86_hyper_runtime {
 	void (*pin_vcpu)(int cpu);
+	void (*sev_es_hcall_prepare)(struct ghcb *ghcb, struct pt_regs *regs);
+	bool (*sev_es_hcall_finish)(struct ghcb *ghcb, struct pt_regs *regs);
 };
 
 /**
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index bc553aae31d2..635e7fc90d01 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -740,6 +740,9 @@ static enum es_result vc_handle_vmmcall(struct ghcb *ghcb,
 	ghcb_set_rax(ghcb, ctxt->regs->ax);
 	ghcb_set_cpl(ghcb, user_mode(ctxt->regs) ? 3 : 0);
 
+	if (x86_platform.hyper.sev_es_hcall_prepare)
+		x86_platform.hyper.sev_es_hcall_prepare(ghcb, ctxt->regs);
+
 	ret = sev_es_ghcb_hv_call(ghcb, ctxt, SVM_EXIT_VMMCALL, 0, 0);
 	if (ret != ES_OK)
 		return ret;
@@ -749,6 +752,15 @@ static enum es_result vc_handle_vmmcall(struct ghcb *ghcb,
 
 	ctxt->regs->ax = ghcb->save.rax;
 
+	/*
+	 * Call sev_es_hcall_finish() after regs->ax is already set.
+	 * This allows the hypervisor handler to overwrite it again if
+	 * necessary.
+	 */
+	if (x86_platform.hyper.sev_es_hcall_finish &&
+	    !x86_platform.hyper.sev_es_hcall_finish(ghcb, ctxt->regs))
+		return ES_VMM_ERROR;
+
 	return ES_OK;
 }
 
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
