Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE22159164
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 15:04:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D7C3387A12;
	Tue, 11 Feb 2020 14:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jiyDvNZDqtyF; Tue, 11 Feb 2020 14:04:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 28BB0879C3;
	Tue, 11 Feb 2020 14:04:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F034C1D80;
	Tue, 11 Feb 2020 14:04:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4FB0C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D215E85683
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mup6jNOiaC9E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 580ED85653
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:57 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 09D04E82; Tue, 11 Feb 2020 14:53:13 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 38/62] x86/sev-es: Handle instruction fetches from user-space
Date: Tue, 11 Feb 2020 14:52:32 +0100
Message-Id: <20200211135256.24617-39-joro@8bytes.org>
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

From: Joerg Roedel <jroedel@suse.de>

When a #VC exception is triggered by user-space the instruction
decoder needs to read the instruction bytes from user addresses.
Enhance es_fetch_insn_byte() to safely fetch kernel and user
instruction bytes.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 2a801919e7c0..f5bff4219f6f 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -61,13 +61,29 @@ static enum es_result es_fetch_insn_byte(struct es_em_ctxt *ctxt,
 					 unsigned int offset,
 					 char *buffer)
 {
-	char *rip = (char *)ctxt->regs->ip;
-
-	/* More checks are needed when we boot to user-space */
-	if (!check_kernel(ctxt->regs))
-		return ES_UNSUPPORTED;
-
-	buffer[offset] = rip[offset];
+	if (user_mode(ctxt->regs)) {
+		unsigned long addr = ctxt->regs->ip + offset;
+		char __user *rip = (char __user *)addr;
+
+		if (unlikely(addr >= TASK_SIZE_MAX))
+			return ES_UNSUPPORTED;
+
+		if (copy_from_user(buffer + offset, rip, 1)) {
+			ctxt->fi.vector     = X86_TRAP_PF;
+			ctxt->fi.cr2        = addr;
+			ctxt->fi.error_code = X86_PF_INSTR | X86_PF_USER;
+			return ES_EXCEPTION;
+		}
+	} else {
+		char *rip = (char *)ctxt->regs->ip + offset;
+
+		if (probe_kernel_read(buffer + offset, rip, 1) != 0) {
+			ctxt->fi.vector     = X86_TRAP_PF;
+			ctxt->fi.cr2        = (unsigned long)rip;
+			ctxt->fi.error_code = X86_PF_INSTR;
+			return ES_EXCEPTION;
+		}
+	}
 
 	return ES_OK;
 }
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
