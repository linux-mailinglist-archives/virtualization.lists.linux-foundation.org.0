Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E2C15916E
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 15:04:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2BBEE2050B;
	Tue, 11 Feb 2020 14:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W5DSqZZ+7+Ez; Tue, 11 Feb 2020 14:04:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3C24B20505;
	Tue, 11 Feb 2020 14:04:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34B16C1D80;
	Tue, 11 Feb 2020 14:04:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8385C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8FF3D85797
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 84jCp3490c7Y
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 21CAC85629
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:59 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C936BE95; Tue, 11 Feb 2020 14:53:15 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 48/62] x86/sev-es: Handle MONITOR/MONITORX Events
Date: Tue, 11 Feb 2020 14:52:42 +0100
Message-Id: <20200211135256.24617-49-joro@8bytes.org>
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

From: Tom Lendacky <thomas.lendacky@amd.com>

Implement a handler for #VC exceptions caused by MONITOR and MONITORX
instructions.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
[ jroedel@suse.de: Adapt to #VC handling infrastructure ]
Co-developed-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index d5a14f277adb..865f510d11ba 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -318,6 +318,21 @@ static enum es_result handle_invd(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 	return ghcb_hv_call(ghcb, ctxt, SVM_EXIT_INVD, 0, 0);
 }
 
+static enum es_result handle_monitor(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
+{
+	phys_addr_t monitor_pa;
+	pgd_t *pgd;
+
+	pgd = __va(read_cr3_pa());
+	monitor_pa = es_slow_virt_to_phys(ghcb, ctxt->regs->ax);
+
+	ghcb_set_rax(ghcb, monitor_pa);
+	ghcb_set_rcx(ghcb, ctxt->regs->cx);
+	ghcb_set_rdx(ghcb, ctxt->regs->dx);
+
+	return ghcb_hv_call(ghcb, ctxt, SVM_EXIT_MONITOR, 0, 0);
+}
+
 static enum es_result handle_vc_exception(struct es_em_ctxt *ctxt,
 					  struct ghcb *ghcb,
 					  unsigned long exit_code,
@@ -354,6 +369,9 @@ static enum es_result handle_vc_exception(struct es_em_ctxt *ctxt,
 	case SVM_EXIT_WBINVD:
 		result = handle_wbinvd(ghcb, ctxt);
 		break;
+	case SVM_EXIT_MONITOR:
+		result = handle_monitor(ghcb, ctxt);
+		break;
 	case SVM_EXIT_NPF:
 		result = handle_mmio(ghcb, ctxt);
 		break;
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
