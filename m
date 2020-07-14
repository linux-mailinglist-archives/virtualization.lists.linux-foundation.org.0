Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF4A21F103
	for <lists.virtualization@lfdr.de>; Tue, 14 Jul 2020 14:18:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 39EDD2EAFE;
	Tue, 14 Jul 2020 12:18:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id piUtKrFPrM2Y; Tue, 14 Jul 2020 12:18:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6C1372EA9C;
	Tue, 14 Jul 2020 12:18:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54732C08A0;
	Tue, 14 Jul 2020 12:18:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24E7CC0888
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 01B7D2EAEA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id euMX-I5nFFOM
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id A33C726E9E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:35 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 4263CFDC;
 Tue, 14 Jul 2020 14:11:07 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v4 62/75] x86/sev-es: Handle #AC Events
Date: Tue, 14 Jul 2020 14:09:04 +0200
Message-Id: <20200714120917.11253-63-joro@8bytes.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714120917.11253-1-joro@8bytes.org>
References: <20200714120917.11253-1-joro@8bytes.org>
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

Implement a handler for #VC exceptions caused by #AC exceptions. The #AC
exception is just forwarded to do_alignment_check() and not pushed down
to the hypervisor, as requested by the SEV-ES GHCB Standardization
Specification.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 013dcdfeb613..8f275e5d1ce7 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -915,6 +915,19 @@ static enum es_result vc_handle_vmmcall(struct ghcb *ghcb,
 	return ES_OK;
 }
 
+static enum es_result vc_handle_trap_ac(struct ghcb *ghcb,
+					struct es_em_ctxt *ctxt)
+{
+	/*
+	 * Calling ecx_alignment_check() directly does not work, because it
+	 * enables IRQs and the GHCB is active. Forward the exception and call
+	 * it later from vc_forward_exception().
+	 */
+	ctxt->fi.vector = X86_TRAP_AC;
+	ctxt->fi.error_code = 0;
+	return ES_EXCEPTION;
+}
+
 static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
 					 struct ghcb *ghcb,
 					 unsigned long exit_code)
@@ -928,6 +941,9 @@ static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
 	case SVM_EXIT_WRITE_DR7:
 		result = vc_handle_dr7_write(ghcb, ctxt);
 		break;
+	case SVM_EXIT_EXCP_BASE + X86_TRAP_AC:
+		result = vc_handle_trap_ac(ghcb, ctxt);
+		break;
 	case SVM_EXIT_RDTSC:
 	case SVM_EXIT_RDTSCP:
 		result = vc_handle_rdtsc(ghcb, ctxt, exit_code);
@@ -987,6 +1003,9 @@ static __always_inline void vc_forward_exception(struct es_em_ctxt *ctxt)
 	case X86_TRAP_UD:
 		exc_invalid_op(ctxt->regs);
 		break;
+	case X86_TRAP_AC:
+		exc_alignment_check(ctxt->regs, error_code);
+		break;
 	default:
 		pr_emerg("Unsupported exception in #VC instruction emulation - can't continue\n");
 		BUG();
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
