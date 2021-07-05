Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D86183BB919
	for <lists.virtualization@lfdr.de>; Mon,  5 Jul 2021 10:26:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B19740485;
	Mon,  5 Jul 2021 08:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KY2Ln4C53eAH; Mon,  5 Jul 2021 08:26:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C620A403E0;
	Mon,  5 Jul 2021 08:26:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BB6EC002A;
	Mon,  5 Jul 2021 08:26:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9082FC002E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 08:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80CEC83A4D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 08:26:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tu4_uztyA0RM
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 08:26:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A807383A53
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 08:26:19 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006775.dip0.t-ipconnect.de
 [91.0.103.117])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 324D5694;
 Mon,  5 Jul 2021 10:26:15 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [RFC PATCH 05/12] x86/sev: Use GHCB protocol version 2 if supported
Date: Mon,  5 Jul 2021 10:24:36 +0200
Message-Id: <20210705082443.14721-6-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705082443.14721-1-joro@8bytes.org>
References: <20210705082443.14721-1-joro@8bytes.org>
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

Check whether the hypervisor supports GHCB version 2 and use it if
available.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/sev.c | 10 ++++++++--
 arch/x86/include/asm/sev.h     |  4 ++--
 arch/x86/kernel/sev-shared.c   | 17 ++++++++++++++---
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 101e08c67296..7f8416f76be7 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -119,16 +119,22 @@ static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
 /* Include code for early handlers */
 #include "../../kernel/sev-shared.c"
 
+static unsigned int ghcb_protocol;
+
 static u64 sev_get_ghcb_proto_ver(void)
 {
-	return GHCB_PROTOCOL_MAX;
+	return ghcb_protocol;
 }
 
 static bool early_setup_sev_es(void)
 {
-	if (!sev_es_negotiate_protocol(NULL))
+	struct sev_ghcb_protocol_info info;
+
+	if (!sev_es_negotiate_protocol(&info))
 		sev_es_terminate(GHCB_SEV_ES_REASON_PROTOCOL_UNSUPPORTED);
 
+	ghcb_protocol = info.vm_proto;
+
 	if (set_page_decrypted((unsigned long)&boot_ghcb_page))
 		return false;
 
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index fa5cd05d3b5b..134a7c9d91b6 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -12,8 +12,8 @@
 #include <asm/insn.h>
 #include <asm/sev-common.h>
 
-#define GHCB_PROTO_OUR		0x0001UL
-#define GHCB_PROTOCOL_MAX	1ULL
+#define GHCB_PROTOCOL_MIN	1ULL
+#define GHCB_PROTOCOL_MAX	2ULL
 #define GHCB_DEFAULT_USAGE	0ULL
 
 #define	VMGEXIT()			{ asm volatile("rep; vmmcall\n\r"); }
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index 36eaac2773ed..40a1ca81bdb8 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -61,6 +61,7 @@ static void __noreturn sev_es_terminate(unsigned int reason)
 
 static bool sev_es_negotiate_protocol(struct sev_ghcb_protocol_info *info)
 {
+	unsigned int protocol;
 	u64 val;
 
 	/* Do the GHCB protocol version negotiation */
@@ -71,14 +72,24 @@ static bool sev_es_negotiate_protocol(struct sev_ghcb_protocol_info *info)
 	if (GHCB_MSR_INFO(val) != GHCB_MSR_SEV_INFO_RESP)
 		return false;
 
-	if (GHCB_MSR_PROTO_MAX(val) < GHCB_PROTO_OUR ||
-	    GHCB_MSR_PROTO_MIN(val) > GHCB_PROTO_OUR)
+	/* Sanity check untrusted input */
+	if (GHCB_MSR_PROTO_MIN(val) > GHCB_MSR_PROTO_MAX(val))
+		return false;
+
+	/* Use maximum supported protocol version */
+	protocol = min_t(unsigned int, GHCB_MSR_PROTO_MAX(val), GHCB_PROTOCOL_MAX);
+
+	/*
+	 * Hypervisor does not support any protocol version required for this
+	 * kernel.
+	 */
+	if (protocol < GHCB_MSR_PROTO_MIN(val))
 		return false;
 
 	if (info) {
 		info->hv_proto_min = GHCB_MSR_PROTO_MIN(val);
 		info->hv_proto_max = GHCB_MSR_PROTO_MAX(val);
-		info->vm_proto	   = GHCB_PROTO_OUR;
+		info->vm_proto	   = protocol;
 	}
 
 	return true;
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
