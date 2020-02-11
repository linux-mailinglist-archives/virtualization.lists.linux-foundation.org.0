Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A17E015915E
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 15:04:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5EB13857CB;
	Tue, 11 Feb 2020 14:04:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QmeSJjaYk5wo; Tue, 11 Feb 2020 14:04:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 29A6E85683;
	Tue, 11 Feb 2020 14:04:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBBEFC1D80;
	Tue, 11 Feb 2020 14:03:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E37A7C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CF6C786443
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgBE1hrIKiS6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 729368643F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:55 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A49F8E93; Tue, 11 Feb 2020 14:53:15 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 47/62] x86/sev-es: Handle RDTSCP Events
Date: Tue, 11 Feb 2020 14:52:41 +0100
Message-Id: <20200211135256.24617-48-joro@8bytes.org>
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

Extend the RDTSC handler to also handle RDTSCP events.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 485f5a14c3b4..d5a14f277adb 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -272,19 +272,24 @@ static enum es_result handle_wbinvd(struct ghcb *ghcb,
 	return ghcb_hv_call(ghcb, ctxt, SVM_EXIT_WBINVD, 0, 0);
 }
 
-static enum es_result handle_rdtsc(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
+static enum es_result handle_rdtsc(struct ghcb *ghcb, struct es_em_ctxt *ctxt,
+				   unsigned long exit_code)
 {
+	bool rdtscp = (exit_code == SVM_EXIT_RDTSCP);
 	enum es_result ret;
 
-	ret = ghcb_hv_call(ghcb, ctxt, SVM_EXIT_RDTSC, 0, 0);
+	ret = ghcb_hv_call(ghcb, ctxt, exit_code, 0, 0);
 	if (ret != ES_OK)
 		return ret;
 
-	if (!(ghcb_is_valid_rax(ghcb) && ghcb_is_valid_rdx(ghcb)))
+	if (!(ghcb_is_valid_rax(ghcb) && ghcb_is_valid_rdx(ghcb) &&
+	     (!rdtscp || ghcb_is_valid_rcx(ghcb))))
 		return ES_VMM_ERROR;
 
 	ctxt->regs->ax = ghcb->save.rax;
 	ctxt->regs->dx = ghcb->save.rdx;
+	if (rdtscp)
+		ctxt->regs->cx = ghcb->save.rcx;
 
 	return ES_OK;
 }
@@ -328,7 +333,8 @@ static enum es_result handle_vc_exception(struct es_em_ctxt *ctxt,
 		result = handle_dr7_write(ghcb, ctxt, early);
 		break;
 	case SVM_EXIT_RDTSC:
-		result = handle_rdtsc(ghcb, ctxt);
+	case SVM_EXIT_RDTSCP:
+		result = handle_rdtsc(ghcb, ctxt, exit_code);
 		break;
 	case SVM_EXIT_RDPMC:
 		result = handle_rdpmc(ghcb, ctxt);
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
