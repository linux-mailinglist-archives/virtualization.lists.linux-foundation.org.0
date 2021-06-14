Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6623A687A
	for <lists.virtualization@lfdr.de>; Mon, 14 Jun 2021 15:53:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93CED40224;
	Mon, 14 Jun 2021 13:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHM6vxGiqVRj; Mon, 14 Jun 2021 13:53:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E932040217;
	Mon, 14 Jun 2021 13:53:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B862EC000F;
	Mon, 14 Jun 2021 13:53:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E773EC002E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 13:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C14C3608C5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 13:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iKydfLujVKMW
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 13:53:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F29A4605A3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 13:53:48 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2ba7c.dip0.t-ipconnect.de
 [79.242.186.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 64B87566;
 Mon, 14 Jun 2021 15:53:45 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v5 6/6] x86/sev-es: Propagate #GP if getting linear
 instruction address failed
Date: Mon, 14 Jun 2021 15:53:27 +0200
Message-Id: <20210614135327.9921-7-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614135327.9921-1-joro@8bytes.org>
References: <20210614135327.9921-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 linux-coco@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Juergen Gross <jgross@suse.com>,
 Mike Stunes <mstunes@vmware.com>, Sean Christopherson <seanjc@google.com>,
 linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Erdem Aktas <erdemaktas@google.com>
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

When an instruction is fetched from user-space, segmentation needs to
be taken into account. This means that getting the linear address of
an instruction can fail. Hardware would raise a #GP
exception in that case, but the #VC exception handler would emulate it
as a page-fault.

The insn_fetch_from_user*() functions now provide the relevant
information in case of an failure. Use that and propagate a #GP when
the linear address of an instruction to fetch could not be calculated.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 259f64be2611..2a7ddefc61a5 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -273,11 +273,18 @@ static enum es_result __vc_decode_user_insn(struct es_em_ctxt *ctxt)
 	int insn_bytes;
 
 	insn_bytes = insn_fetch_from_user_inatomic(ctxt->regs, buffer);
-	if (insn_bytes <= 0) {
+	if (insn_bytes == 0) {
+		/* Nothing could be copied */
 		ctxt->fi.vector     = X86_TRAP_PF;
 		ctxt->fi.error_code = X86_PF_INSTR | X86_PF_USER;
 		ctxt->fi.cr2        = ctxt->regs->ip;
 		return ES_EXCEPTION;
+	} else if (insn_bytes == -EINVAL) {
+		/* Effective RIP could not be calculated */
+		ctxt->fi.vector     = X86_TRAP_GP;
+		ctxt->fi.error_code = 0;
+		ctxt->fi.cr2        = 0;
+		return ES_EXCEPTION;
 	}
 
 	if (!insn_decode_from_regs(&ctxt->insn, ctxt->regs, buffer, insn_bytes))
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
