Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0DA3337A2
	for <lists.virtualization@lfdr.de>; Wed, 10 Mar 2021 09:44:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D54546F6BA;
	Wed, 10 Mar 2021 08:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SXbyXI7ayE9v; Wed, 10 Mar 2021 08:44:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F2396F6ED;
	Wed, 10 Mar 2021 08:44:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69A34C001C;
	Wed, 10 Mar 2021 08:44:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF463C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 08:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC4B960707
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 08:43:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3moHSjZ6yUZr
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 08:43:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E0AD6ED68
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 08:43:58 +0000 (UTC)
Received: from cap.home.8bytes.org (p549adcf6.dip0.t-ipconnect.de
 [84.154.220.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id ACB6D638;
 Wed, 10 Mar 2021 09:43:55 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v2 7/7] x86/sev-es: Replace open-coded hlt-loops with
 sev_es_terminate()
Date: Wed, 10 Mar 2021 09:43:25 +0100
Message-Id: <20210310084325.12966-8-joro@8bytes.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310084325.12966-1-joro@8bytes.org>
References: <20210310084325.12966-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

There are a few places left in the SEV-ES C code where hlt loops and/or
terminate requests are implemented. Replace them all with calls to
sev_es_terminate().

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/sev-es.c | 12 +++---------
 arch/x86/kernel/sev-es-shared.c   | 10 +++-------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/arch/x86/boot/compressed/sev-es.c b/arch/x86/boot/compressed/sev-es.c
index 27826c265aab..d904bd56b3e3 100644
--- a/arch/x86/boot/compressed/sev-es.c
+++ b/arch/x86/boot/compressed/sev-es.c
@@ -200,14 +200,8 @@ void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
 	}
 
 finish:
-	if (result == ES_OK) {
+	if (result == ES_OK)
 		vc_finish_insn(&ctxt);
-	} else if (result != ES_RETRY) {
-		/*
-		 * For now, just halt the machine. That makes debugging easier,
-		 * later we just call sev_es_terminate() here.
-		 */
-		while (true)
-			asm volatile("hlt\n");
-	}
+	else if (result != ES_RETRY)
+		sev_es_terminate(GHCB_SEV_ES_REASON_GENERAL_REQUEST);
 }
diff --git a/arch/x86/kernel/sev-es-shared.c b/arch/x86/kernel/sev-es-shared.c
index cdc04d091242..7c34be61258e 100644
--- a/arch/x86/kernel/sev-es-shared.c
+++ b/arch/x86/kernel/sev-es-shared.c
@@ -24,7 +24,7 @@ static bool __init sev_es_check_cpu_features(void)
 	return true;
 }
 
-static void sev_es_terminate(unsigned int reason)
+static void __noreturn sev_es_terminate(unsigned int reason)
 {
 	u64 val = GHCB_SEV_TERMINATE;
 
@@ -210,12 +210,8 @@ void __init do_vc_no_ghcb(struct pt_regs *regs, unsigned long exit_code)
 	return;
 
 fail:
-	sev_es_wr_ghcb_msr(GHCB_SEV_TERMINATE);
-	VMGEXIT();
-
-	/* Shouldn't get here - if we do halt the machine */
-	while (true)
-		asm volatile("hlt\n");
+	/* Terminate the guest */
+	sev_es_terminate(GHCB_SEV_ES_REASON_GENERAL_REQUEST);
 }
 
 static enum es_result vc_insn_string_read(struct es_em_ctxt *ctxt,
-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
