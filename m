Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BE17218B002
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:23:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7DE3D88236;
	Thu, 19 Mar 2020 09:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1r1aiBNc2CH; Thu, 19 Mar 2020 09:23:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D4AAB88299;
	Thu, 19 Mar 2020 09:23:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E274C07FF;
	Thu, 19 Mar 2020 09:23:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 843ADC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7306188231
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Igi0+BH1TEd3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F094988236
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:44 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 95E19E97; Thu, 19 Mar 2020 10:14:26 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 55/70] x86/sev-es: Handle RDTSCP Events
Date: Thu, 19 Mar 2020 10:13:52 +0100
Message-Id: <20200319091407.1481-56-joro@8bytes.org>
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

Extend the RDTSC handler to also handle RDTSCP events.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index a4f136b2e149..11947b648b43 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -665,19 +665,25 @@ static enum es_result vc_handle_wbinvd(struct ghcb *ghcb,
 	return sev_es_ghcb_hv_call(ghcb, ctxt, SVM_EXIT_WBINVD, 0, 0);
 }
 
-static enum es_result vc_handle_rdtsc(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
+static enum es_result vc_handle_rdtsc(struct ghcb *ghcb,
+				      struct es_em_ctxt *ctxt,
+				      unsigned long exit_code)
 {
+	bool rdtscp = (exit_code == SVM_EXIT_RDTSCP);
 	enum es_result ret;
 
-	ret = sev_es_ghcb_hv_call(ghcb, ctxt, SVM_EXIT_RDTSC, 0, 0);
+	ret = sev_es_ghcb_hv_call(ghcb, ctxt, exit_code, 0, 0);
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
@@ -716,7 +722,8 @@ static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
 		result = vc_handle_dr7_write(ghcb, ctxt, early);
 		break;
 	case SVM_EXIT_RDTSC:
-		result = vc_handle_rdtsc(ghcb, ctxt);
+	case SVM_EXIT_RDTSCP:
+		result = vc_handle_rdtsc(ghcb, ctxt, exit_code);
 		break;
 	case SVM_EXIT_RDPMC:
 		result = vc_handle_rdpmc(ghcb, ctxt);
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
