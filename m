Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA5B18B018
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:24:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E9B4888360;
	Thu, 19 Mar 2020 09:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qK9trIv-Tl-S; Thu, 19 Mar 2020 09:24:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E91E888378;
	Thu, 19 Mar 2020 09:24:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7393C18DA;
	Thu, 19 Mar 2020 09:24:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19828C18DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F0F7888252
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KY30A0KnKX+v
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AA21C882CC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C6A69BBB; Thu, 19 Mar 2020 10:14:24 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 45/70] x86/sev-es: Harden runtime #VC handler for exceptions
 from user-space
Date: Thu, 19 Mar 2020 10:13:42 +0100
Message-Id: <20200319091407.1481-46-joro@8bytes.org>
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

Send SIGBUS to the user-space process that caused the #VC exception
instead of killing the machine. Also ratelimit the error messages so
that user-space can't flood the kernel log.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 79a71d14a1fc..71eee7b3667d 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -370,16 +370,16 @@ dotraplinkage void do_vmm_communication(struct pt_regs *regs, unsigned long exit
 		vc_finish_insn(&ctxt);
 		break;
 	case ES_UNSUPPORTED:
-		pr_emerg("Unsupported exit-code 0x%02lx in early #VC exception (IP: 0x%lx)\n",
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
+		pr_err_ratelimited("PANIC: Failed to decode instruction (exit-code 0x%02lx IP: 0x%lx)\n",
+				   exit_code, regs->ip);
 		goto fail;
 	case ES_EXCEPTION:
 		vc_forward_exception(&ctxt);
@@ -394,10 +394,24 @@ dotraplinkage void do_vmm_communication(struct pt_regs *regs, unsigned long exit
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
+		/* Show some debug info */
+		show_regs(regs);
 
-	while (true)
-		halt();
+		/* Ask hypervisor to sev_es_terminate */
+		sev_es_terminate(GHCB_SEV_ES_REASON_GENERAL_REQUEST);
+
+		/* If that fails and we get here - just halt the machine */
+		while (true)
+			halt();
+	}
 }
 
 bool __init boot_vc_exception(struct pt_regs *regs)
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
