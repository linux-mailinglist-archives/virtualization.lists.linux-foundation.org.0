Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E0615907D
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 14:53:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id ACAED204F3;
	Tue, 11 Feb 2020 13:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HAx1hvYrsNbX; Tue, 11 Feb 2020 13:53:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4B20B204E8;
	Tue, 11 Feb 2020 13:53:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4456DC07FE;
	Tue, 11 Feb 2020 13:53:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E57CC1D80
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4DDC08733F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m++kLeiRtbua
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:53:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8EC93878A0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:53:26 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CE3BEE7D; Tue, 11 Feb 2020 14:53:13 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 37/62] x86/sev-es: Wire up existing #VC exit-code handlers
Date: Tue, 11 Feb 2020 14:52:31 +0100
Message-Id: <20200211135256.24617-38-joro@8bytes.org>
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

Re-use the handlers for CPUID and IOIO caused #VC exceptions in the
early boot handler.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es-shared.c | 9 +++------
 arch/x86/kernel/sev-es.c        | 9 +++++++++
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/sev-es-shared.c b/arch/x86/kernel/sev-es-shared.c
index 57c29c91fe87..14693eff9614 100644
--- a/arch/x86/kernel/sev-es-shared.c
+++ b/arch/x86/kernel/sev-es-shared.c
@@ -358,8 +358,7 @@ static enum es_result ioio_exitinfo(struct es_em_ctxt *ctxt, u64 *exitinfo)
 	return ES_OK;
 }
 
-static enum es_result __maybe_unused
-handle_ioio(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
+static enum es_result handle_ioio(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 {
 	struct pt_regs *regs = ctxt->regs;
 	u64 exit_info_1, exit_info_2;
@@ -451,8 +450,7 @@ handle_ioio(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 	return ret;
 }
 
-static enum es_result __maybe_unused
-handle_cpuid(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
+static enum es_result handle_cpuid(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 {
 	struct pt_regs *regs = ctxt->regs;
 	u32 cr4 = native_read_cr4();
@@ -658,8 +656,7 @@ static enum es_result handle_mmio_twobyte_ops(struct ghcb *ghcb,
 	return ret;
 }
 
-static enum es_result __maybe_unused
-handle_mmio(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
+static enum es_result handle_mmio(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 {
 	struct insn *insn = &ctxt->insn;
 	unsigned int bytes = 0;
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 1fb7128ff386..2a801919e7c0 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -174,6 +174,15 @@ static enum es_result handle_vc_exception(struct es_em_ctxt *ctxt,
 	enum es_result result;
 
 	switch (exit_code) {
+	case SVM_EXIT_CPUID:
+		result = handle_cpuid(ghcb, ctxt);
+		break;
+	case SVM_EXIT_IOIO:
+		result = handle_ioio(ghcb, ctxt);
+		break;
+	case SVM_EXIT_NPF:
+		result = handle_mmio(ghcb, ctxt);
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
