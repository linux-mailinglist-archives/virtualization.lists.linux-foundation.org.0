Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B905418B011
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:24:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7786886B8C;
	Thu, 19 Mar 2020 09:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZBWO26GEt2M; Thu, 19 Mar 2020 09:23:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B026B86BA3;
	Thu, 19 Mar 2020 09:23:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C048C18DA;
	Thu, 19 Mar 2020 09:23:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C586CC1D89
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AFFEC85F11
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BFSthuSU-x-u
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A91A78634C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 0435283F; Thu, 19 Mar 2020 10:14:24 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 46/70] x86/sev-es: Filter exceptions not supported from
 user-space
Date: Thu, 19 Mar 2020 10:13:43 +0100
Message-Id: <20200319091407.1481-47-joro@8bytes.org>
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

Currently only CPUID caused #VC exceptions are supported from
user-space. Filter the others out early.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 71eee7b3667d..6d45a2499460 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -318,6 +318,26 @@ static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
 	return result;
 }
 
+static enum es_result vc_context_filter(struct pt_regs *regs, long exit_code)
+{
+	enum es_result r = ES_OK;
+
+	if (user_mode(regs)) {
+		switch (exit_code) {
+		/* List of #VC exit-codes we support in user-space */
+		case SVM_EXIT_EXCP_BASE ... SVM_EXIT_LAST_EXCP:
+		case SVM_EXIT_CPUID:
+			r = ES_OK;
+			break;
+		default:
+			r = ES_UNSUPPORTED;
+			break;
+		}
+	}
+
+	return r;
+}
+
 static void vc_forward_exception(struct es_em_ctxt *ctxt)
 {
 	long error_code = ctxt->fi.error_code;
@@ -359,6 +379,10 @@ dotraplinkage void do_vmm_communication(struct pt_regs *regs, unsigned long exit
 		result = vc_init_em_ctxt(&ctxt, regs, exit_code);
 	}
 
+	/* Check if the exception is supported in the context we came from. */
+	if (result == ES_OK)
+		result = vc_context_filter(regs, exit_code);
+
 	if (result == ES_OK)
 		result = vc_handle_exitcode(&ctxt, ghcb, exit_code);
 
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
