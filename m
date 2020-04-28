Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B161BC389
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 17:27:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 785F422886;
	Tue, 28 Apr 2020 15:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eHTzxRr0FTgX; Tue, 28 Apr 2020 15:26:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 83F98228E7;
	Tue, 28 Apr 2020 15:26:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D162C0172;
	Tue, 28 Apr 2020 15:26:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10563C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E47CD22855
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVJEO8NF6r2R
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 5D0C6203F6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:38 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B5E5DF31; Tue, 28 Apr 2020 17:17:51 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 50/75] x86/sev-es: Do not crash on #VC exceptions from
 user-space
Date: Tue, 28 Apr 2020 17:17:00 +0200
Message-Id: <20200428151725.31091-51-joro@8bytes.org>
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

From: Joerg Roedel <jroedel@suse.de>

Send SIGBUS to the user-space process that caused the #VC exception
instead of killing the machine. Also ratelimit the error messages so
that user-space can't flood the kernel log and add a prefix the the
messages printed for SEV-ES.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index c2223c2a28c2..f4ce3b475464 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -7,6 +7,8 @@
  * Author: Joerg Roedel <jroedel@suse.de>
  */
 
+#define pr_fmt(fmt)	"SEV-ES: " fmt
+
 #include <linux/sched/debug.h>	/* For show_regs() */
 #include <linux/percpu-defs.h>
 #include <linux/mem_encrypt.h>
@@ -468,7 +470,7 @@ static void vc_forward_exception(struct es_em_ctxt *ctxt)
 		do_invalid_op(ctxt->regs, 0);
 		break;
 	default:
-		pr_emerg("ERROR: Unsupported exception in #VC instruction emulation - can't continue\n");
+		pr_emerg("Unsupported exception in #VC instruction emulation - can't continue\n");
 		BUG();
 	}
 }
@@ -516,16 +518,16 @@ dotraplinkage void do_vmm_communication(struct pt_regs *regs,
 		vc_finish_insn(&ctxt);
 		break;
 	case ES_UNSUPPORTED:
-		pr_emerg("PANIC: Unsupported exit-code 0x%02lx in early #VC exception (IP: 0x%lx)\n",
-			 exit_code, regs->ip);
+		pr_err_ratelimited("Unsupported exit-code 0x%02lx in early #VC exception (IP: 0x%lx)\n",
+				   exit_code, regs->ip);
 		goto fail;
 	case ES_VMM_ERROR:
-		pr_emerg("PANIC: Failure in communication with VMM (exit-code 0x%02lx IP: 0x%lx)\n",
-			 exit_code, regs->ip);
+		pr_err_ratelimited("Failure in communication with VMM (exit-code 0x%02lx IP: 0x%lx)\n",
+				   exit_code, regs->ip);
 		goto fail;
 	case ES_DECODE_FAILED:
-		pr_emerg("PANIC: Failed to decode instruction (exit-code 0x%02lx IP: 0x%lx)\n",
-			 exit_code, regs->ip);
+		pr_err_ratelimited("Failed to decode instruction (exit-code 0x%02lx IP: 0x%lx)\n",
+				   exit_code, regs->ip);
 		goto fail;
 	case ES_EXCEPTION:
 		vc_forward_exception(&ctxt);
@@ -534,7 +536,7 @@ dotraplinkage void do_vmm_communication(struct pt_regs *regs,
 		/* Nothing to do */
 		break;
 	default:
-		pr_emerg("PANIC: Unknown result in %s():%d\n", __func__, result);
+		pr_emerg("Unknown result in %s():%d\n", __func__, result);
 		/*
 		 * Emulating the instruction which caused the #VC exception
 		 * failed - can't continue so print debug information
@@ -545,10 +547,26 @@ dotraplinkage void do_vmm_communication(struct pt_regs *regs,
 	return;
 
 fail:
-	show_regs(regs);
+	if (user_mode(regs)) {
+		/*
+		 * Do not kill the machine if user-space triggered the
+		 * exception. Send SIGBUS instead and let user-space deal with
+		 * it.
+		 */
+		force_sig_fault(SIGBUS, BUS_OBJERR, (void __user *)0);
+	} else {
+		pr_emerg("PANIC: Unhandled #VC exception in kernel space (result=%d)\n",
+			 result);
 
-	while (true)
-		halt();
+		/* Show some debug info */
+		show_regs(regs);
+
+		/* Ask hypervisor to sev_es_terminate */
+		sev_es_terminate(GHCB_SEV_ES_REASON_GENERAL_REQUEST);
+
+		/* If that fails and we get here - just panic */
+		panic("Returned from Terminate-Request to Hypervisor\n");
+	}
 }
 
 bool __init vc_boot_ghcb(struct pt_regs *regs)
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
