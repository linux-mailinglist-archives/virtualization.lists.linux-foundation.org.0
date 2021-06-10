Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FB13A27EC
	for <lists.virtualization@lfdr.de>; Thu, 10 Jun 2021 11:12:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C50D83D19;
	Thu, 10 Jun 2021 09:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8urqM3NbScQr; Thu, 10 Jun 2021 09:12:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3429883D25;
	Thu, 10 Jun 2021 09:12:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41A0FC002B;
	Thu, 10 Jun 2021 09:12:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E366C0022
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 09:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9823383D18
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 09:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GE94Y8oPsbO1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 09:11:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9707183CEA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 09:11:59 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2ba7c.dip0.t-ipconnect.de
 [79.242.186.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 0DBE936A;
 Thu, 10 Jun 2021 11:11:56 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v4 2/6] x86/sev-es: Disable IRQs while GHCB is active
Date: Thu, 10 Jun 2021 11:11:37 +0200
Message-Id: <20210610091141.30322-3-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610091141.30322-1-joro@8bytes.org>
References: <20210610091141.30322-1-joro@8bytes.org>
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

The #VC handler only cares about IRQs being disabled while the GHCB is
active, as it must not be interrupted by something which could cause
another #VC while it holds the GHCB (NMI is the exception for which the
backup GHCB is there).

Make sure nothing interrupts the code path while the GHCB is active by
disabling IRQs in sev_es_get_ghcb() and restoring the previous irq state
in sev_es_put_ghcb().

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 4fd997bbf059..2a922d1b03c8 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -192,14 +192,23 @@ void noinstr __sev_es_ist_exit(void)
 	this_cpu_write(cpu_tss_rw.x86_tss.ist[IST_INDEX_VC], *(unsigned long *)ist);
 }
 
-static __always_inline struct ghcb *sev_es_get_ghcb(struct ghcb_state *state)
+static __always_inline struct ghcb *sev_es_get_ghcb(struct ghcb_state *state,
+						    unsigned long *flags)
 {
 	struct sev_es_runtime_data *data;
 	struct ghcb *ghcb;
 
+	/*
+	 * Nothing shall interrupt this code path while holding the per-cpu
+	 * GHCB. The backup GHCB is only for NMIs interrupting this path.
+	 */
+	local_irq_save(*flags);
+
 	data = this_cpu_read(runtime_data);
 	ghcb = &data->ghcb_page;
 
+
+
 	if (unlikely(data->ghcb_active)) {
 		/* GHCB is already in use - save its contents */
 
@@ -479,7 +488,8 @@ static enum es_result vc_slow_virt_to_phys(struct ghcb *ghcb, struct es_em_ctxt
 /* Include code shared with pre-decompression boot stage */
 #include "sev-shared.c"
 
-static __always_inline void sev_es_put_ghcb(struct ghcb_state *state)
+static __always_inline void sev_es_put_ghcb(struct ghcb_state *state,
+					    unsigned long flags)
 {
 	struct sev_es_runtime_data *data;
 	struct ghcb *ghcb;
@@ -500,14 +510,17 @@ static __always_inline void sev_es_put_ghcb(struct ghcb_state *state)
 		vc_ghcb_invalidate(ghcb);
 		data->ghcb_active = false;
 	}
+
+	local_irq_restore(flags);
 }
 
 void noinstr __sev_es_nmi_complete(void)
 {
 	struct ghcb_state state;
+	unsigned long flags;
 	struct ghcb *ghcb;
 
-	ghcb = sev_es_get_ghcb(&state);
+	ghcb = sev_es_get_ghcb(&state, &flags);
 
 	vc_ghcb_invalidate(ghcb);
 	ghcb_set_sw_exit_code(ghcb, SVM_VMGEXIT_NMI_COMPLETE);
@@ -517,7 +530,7 @@ void noinstr __sev_es_nmi_complete(void)
 	sev_es_wr_ghcb_msr(__pa_nodebug(ghcb));
 	VMGEXIT();
 
-	sev_es_put_ghcb(&state);
+	sev_es_put_ghcb(&state, flags);
 }
 
 static u64 get_jump_table_addr(void)
@@ -527,9 +540,7 @@ static u64 get_jump_table_addr(void)
 	struct ghcb *ghcb;
 	u64 ret = 0;
 
-	local_irq_save(flags);
-
-	ghcb = sev_es_get_ghcb(&state);
+	ghcb = sev_es_get_ghcb(&state, &flags);
 
 	vc_ghcb_invalidate(ghcb);
 	ghcb_set_sw_exit_code(ghcb, SVM_VMGEXIT_AP_JUMP_TABLE);
@@ -543,9 +554,7 @@ static u64 get_jump_table_addr(void)
 	    ghcb_sw_exit_info_2_is_valid(ghcb))
 		ret = ghcb->save.sw_exit_info_2;
 
-	sev_es_put_ghcb(&state);
-
-	local_irq_restore(flags);
+	sev_es_put_ghcb(&state, flags);
 
 	return ret;
 }
@@ -666,9 +675,10 @@ static bool __init sev_es_setup_ghcb(void)
 static void sev_es_ap_hlt_loop(void)
 {
 	struct ghcb_state state;
+	unsigned long flags;
 	struct ghcb *ghcb;
 
-	ghcb = sev_es_get_ghcb(&state);
+	ghcb = sev_es_get_ghcb(&state, &flags);
 
 	while (true) {
 		vc_ghcb_invalidate(ghcb);
@@ -685,7 +695,7 @@ static void sev_es_ap_hlt_loop(void)
 			break;
 	}
 
-	sev_es_put_ghcb(&state);
+	sev_es_put_ghcb(&state, flags);
 }
 
 /*
@@ -1333,6 +1343,7 @@ DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
 	struct ghcb_state state;
 	struct es_em_ctxt ctxt;
 	enum es_result result;
+	unsigned long flags;
 	struct ghcb *ghcb;
 
 	/*
@@ -1353,7 +1364,7 @@ DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
 	 * keep the IRQs disabled to protect us against concurrent TLB flushes.
 	 */
 
-	ghcb = sev_es_get_ghcb(&state);
+	ghcb = sev_es_get_ghcb(&state, &flags);
 
 	vc_ghcb_invalidate(ghcb);
 	result = vc_init_em_ctxt(&ctxt, regs, error_code);
@@ -1361,7 +1372,7 @@ DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
 	if (result == ES_OK)
 		result = vc_handle_exitcode(&ctxt, ghcb, error_code);
 
-	sev_es_put_ghcb(&state);
+	sev_es_put_ghcb(&state, flags);
 
 	/* Done - now check the result */
 	switch (result) {
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
