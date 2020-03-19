Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D1918B016
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:24:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A00D287C5C;
	Thu, 19 Mar 2020 09:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3zMpNuFlWgl; Thu, 19 Mar 2020 09:23:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8555C87C49;
	Thu, 19 Mar 2020 09:23:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70116C07FF;
	Thu, 19 Mar 2020 09:23:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00587C1D91
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E5DA785F11
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2bhC247iHJC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9F5F285F5A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 351FD982; Thu, 19 Mar 2020 10:14:24 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 42/70] x86/sev-es: Support nested #VC exceptions
Date: Thu, 19 Mar 2020 10:13:39 +0100
Message-Id: <20200319091407.1481-43-joro@8bytes.org>
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

Handle #VC exceptions that happen while the GHCB is in use. This can
happen when an NMI happens in the #VC exception handler and the NMI
handler causes a #VC exception itself. Save the contents of the GHCB
when nesting is detected and restore it when the GHCB is no longer
used.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es.c | 63 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 97241d2f0f70..3b7bbc8d841e 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -32,9 +32,57 @@ struct ghcb boot_ghcb_page __bss_decrypted __aligned(PAGE_SIZE);
  */
 struct ghcb __initdata *boot_ghcb;
 
+struct ghcb_state {
+	struct ghcb *ghcb;
+};
+
 /* Runtime GHCB pointers */
 static struct ghcb __percpu *ghcb_page;
 
+/*
+ * Mark the per-cpu GHCB as in-use to detect nested #VC exceptions.
+ * There is no need for it to be atomic, because nothing is written to the GHCB
+ * between the read and the write of ghcb_active. So it is safe to use it when a
+ * nested #VC exception happens before the write.
+ */
+static DEFINE_PER_CPU(bool, ghcb_active);
+
+static struct ghcb *sev_es_get_ghcb(struct ghcb_state *state)
+{
+	struct ghcb *ghcb = (struct ghcb *)this_cpu_ptr(ghcb_page);
+	bool *active = this_cpu_ptr(&ghcb_active);
+
+	if (unlikely(*active)) {
+		/* GHCB is already in use - save its contents */
+
+		state->ghcb = kzalloc(sizeof(struct ghcb), GFP_ATOMIC);
+		if (!state->ghcb)
+			return NULL;
+
+		*state->ghcb = *ghcb;
+	} else {
+		state->ghcb = NULL;
+		*active = true;
+	}
+
+	return ghcb;
+}
+
+static void sev_es_put_ghcb(struct ghcb_state *state)
+{
+	bool *active = this_cpu_ptr(&ghcb_active);
+	struct ghcb *ghcb = (struct ghcb *)this_cpu_ptr(ghcb_page);
+
+	if (state->ghcb) {
+		/* Restore saved state and free backup memory */
+		*ghcb = *state->ghcb;
+		kfree(state->ghcb);
+		state->ghcb = NULL;
+	} else {
+		*active = false;
+	}
+}
+
 /* Needed in vc_early_vc_forward_exception */
 extern void early_exception(struct pt_regs *regs, int trapnr);
 
@@ -272,6 +320,7 @@ static void vc_forward_exception(struct es_em_ctxt *ctxt)
 
 dotraplinkage void do_vmm_communication(struct pt_regs *regs, unsigned long exit_code)
 {
+	struct ghcb_state state;
 	struct es_em_ctxt ctxt;
 	enum es_result result;
 	struct ghcb *ghcb;
@@ -282,14 +331,20 @@ dotraplinkage void do_vmm_communication(struct pt_regs *regs, unsigned long exit
 	 * keep the IRQs disabled to protect us against concurrent TLB flushes.
 	 */
 
-	ghcb = (struct ghcb *)this_cpu_ptr(ghcb_page);
-
-	vc_ghcb_invalidate(ghcb);
-	result = vc_init_em_ctxt(&ctxt, regs, exit_code);
+	ghcb = sev_es_get_ghcb(&state);
+	if (!ghcb) {
+		/* This can only fail on an allocation error, so just retry */
+		result = ES_RETRY;
+	} else {
+		vc_ghcb_invalidate(ghcb);
+		result = vc_init_em_ctxt(&ctxt, regs, exit_code);
+	}
 
 	if (result == ES_OK)
 		result = vc_handle_exitcode(&ctxt, ghcb, exit_code);
 
+	sev_es_put_ghcb(&state);
+
 	/* Done - now check the result */
 	switch (result) {
 	case ES_OK:
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
