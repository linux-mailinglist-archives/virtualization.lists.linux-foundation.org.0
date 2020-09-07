Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C3925FB52
	for <lists.virtualization@lfdr.de>; Mon,  7 Sep 2020 15:27:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9345E871C1;
	Mon,  7 Sep 2020 13:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4J7+G0402r6T; Mon,  7 Sep 2020 13:27:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D6B23871C9;
	Mon,  7 Sep 2020 13:27:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B925BC0051;
	Mon,  7 Sep 2020 13:27:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81789C0893
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 622EB87196
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ap+ivsjKH0b9
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:27:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5EE5587198
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 13:27:49 +0000 (UTC)
Received: from cap.home.8bytes.org (p549add56.dip0.t-ipconnect.de
 [84.154.221.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id C481812AA;
 Mon,  7 Sep 2020 15:17:06 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v7 48/72] x86/sev-es: Handle instruction fetches from
 user-space
Date: Mon,  7 Sep 2020 15:15:49 +0200
Message-Id: <20200907131613.12703-49-joro@8bytes.org>
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

When a #VC exception is triggered by user-space the instruction decoder
needs to read the instruction bytes from user addresses.  Enhance
vc_decode_insn() to safely fetch kernel and user instructions.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 42c84b9b6b4f..bc2854b81a51 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -232,17 +232,30 @@ static enum es_result vc_decode_insn(struct es_em_ctxt *ctxt)
 	enum es_result ret;
 	int res;
 
-	res = vc_fetch_insn_kernel(ctxt, buffer);
-	if (unlikely(res == -EFAULT)) {
-		ctxt->fi.vector     = X86_TRAP_PF;
-		ctxt->fi.error_code = 0;
-		ctxt->fi.cr2        = ctxt->regs->ip;
-		return ES_EXCEPTION;
+	if (user_mode(ctxt->regs)) {
+		res = insn_fetch_from_user(ctxt->regs, buffer);
+		if (!res) {
+			ctxt->fi.vector     = X86_TRAP_PF;
+			ctxt->fi.error_code = X86_PF_INSTR | X86_PF_USER;
+			ctxt->fi.cr2        = ctxt->regs->ip;
+			return ES_EXCEPTION;
+		}
+
+		if (!insn_decode(&ctxt->insn, ctxt->regs, buffer, res))
+			return ES_DECODE_FAILED;
+	} else {
+		res = vc_fetch_insn_kernel(ctxt, buffer);
+		if (res) {
+			ctxt->fi.vector     = X86_TRAP_PF;
+			ctxt->fi.error_code = X86_PF_INSTR;
+			ctxt->fi.cr2        = ctxt->regs->ip;
+			return ES_EXCEPTION;
+		}
+
+		insn_init(&ctxt->insn, buffer, MAX_INSN_SIZE - res, 1);
+		insn_get_length(&ctxt->insn);
 	}
 
-	insn_init(&ctxt->insn, buffer, MAX_INSN_SIZE - res, 1);
-	insn_get_length(&ctxt->insn);
-
 	ret = ctxt->insn.immediate.got ? ES_OK : ES_DECODE_FAILED;
 
 	return ret;
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
