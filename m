Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBB618B00F
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:24:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 36F7786B90;
	Thu, 19 Mar 2020 09:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20fSCDumcNJQ; Thu, 19 Mar 2020 09:23:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 295F186637;
	Thu, 19 Mar 2020 09:23:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18E14C18DA;
	Thu, 19 Mar 2020 09:23:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94AC2C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8CAE5862FB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V4xuAm72iq4U
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9726485F11
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 50FEAA6A; Thu, 19 Mar 2020 10:14:24 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 43/70] x86/sev-es: Wire up existing #VC exit-code handlers
Date: Thu, 19 Mar 2020 10:13:40 +0100
Message-Id: <20200319091407.1481-44-joro@8bytes.org>
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

Re-use the handlers for CPUID and IOIO caused #VC exceptions in the
early boot handler.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es-shared.c | 7 +++----
 arch/x86/kernel/sev-es.c        | 6 ++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/sev-es-shared.c b/arch/x86/kernel/sev-es-shared.c
index b178a2db61a7..a632b8f041ec 100644
--- a/arch/x86/kernel/sev-es-shared.c
+++ b/arch/x86/kernel/sev-es-shared.c
@@ -312,8 +312,7 @@ static enum es_result vc_ioio_exitinfo(struct es_em_ctxt *ctxt, u64 *exitinfo)
 	return ES_OK;
 }
 
-static enum es_result __maybe_unused
-vc_handle_ioio(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
+static enum es_result vc_handle_ioio(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 {
 	struct pt_regs *regs = ctxt->regs;
 	u64 exit_info_1, exit_info_2;
@@ -409,8 +408,8 @@ vc_handle_ioio(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 	return ret;
 }
 
-static enum es_result __maybe_unused vc_handle_cpuid(struct ghcb *ghcb,
-						     struct es_em_ctxt *ctxt)
+static enum es_result vc_handle_cpuid(struct ghcb *ghcb,
+				      struct es_em_ctxt *ctxt)
 {
 	struct pt_regs *regs = ctxt->regs;
 	u32 cr4 = native_read_cr4();
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 3b7bbc8d841e..226ab0c57a09 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -289,6 +289,12 @@ static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
 	enum es_result result;
 
 	switch (exit_code) {
+	case SVM_EXIT_CPUID:
+		result = vc_handle_cpuid(ghcb, ctxt);
+		break;
+	case SVM_EXIT_IOIO:
+		result = vc_handle_ioio(ghcb, ctxt);
+		break;
 	default:
 		/*
 		 * Unexpected #VC exception
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
