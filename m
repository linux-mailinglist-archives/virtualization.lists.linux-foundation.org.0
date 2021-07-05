Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 912863BB917
	for <lists.virtualization@lfdr.de>; Mon,  5 Jul 2021 10:26:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 043A383A88;
	Mon,  5 Jul 2021 08:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PXkV8q9NigJ; Mon,  5 Jul 2021 08:26:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 87B1483A71;
	Mon,  5 Jul 2021 08:26:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8078BC002D;
	Mon,  5 Jul 2021 08:26:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8BE1C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 08:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A34004047E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 08:26:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iJ_CGfZ91MRc
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 08:26:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4FE54047D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 08:26:17 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006775.dip0.t-ipconnect.de
 [91.0.103.117])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id EB77253F;
 Mon,  5 Jul 2021 10:26:13 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [RFC PATCH 03/12] x86/sev: Save and print negotiated GHCB protocol
 version
Date: Mon,  5 Jul 2021 10:24:34 +0200
Message-Id: <20210705082443.14721-4-joro@8bytes.org>
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

Save the results of the GHCB protocol negotiation into a data structure
and print information about versions supported and used to the kernel
log.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/sev.c |  2 +-
 arch/x86/kernel/sev-shared.c   | 22 +++++++++++++++++++++-
 arch/x86/kernel/sev.c          | 13 ++++++++++++-
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 670e998fe930..1a2e49730f8b 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -121,7 +121,7 @@ static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
 
 static bool early_setup_sev_es(void)
 {
-	if (!sev_es_negotiate_protocol())
+	if (!sev_es_negotiate_protocol(NULL))
 		sev_es_terminate(GHCB_SEV_ES_REASON_PROTOCOL_UNSUPPORTED);
 
 	if (set_page_decrypted((unsigned long)&boot_ghcb_page))
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index 9f90f460a28c..73eeb5897d16 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -14,6 +14,20 @@
 #define has_cpuflag(f)	boot_cpu_has(f)
 #endif
 
+/*
+ * struct sev_ghcb_protocol_info - Used to return GHCB protocol
+ *				   negotiation details.
+ *
+ * @hv_proto_min:	Minimum GHCB protocol version supported by Hypervisor
+ * @hv_proto_max:	Maximum GHCB protocol version supported by Hypervisor
+ * @vm_proto:		Protocol version the VM (this kernel) will use
+ */
+struct sev_ghcb_protocol_info {
+	unsigned int hv_proto_min;
+	unsigned int hv_proto_max;
+	unsigned int vm_proto;
+};
+
 static bool __init sev_es_check_cpu_features(void)
 {
 	if (!has_cpuflag(X86_FEATURE_RDRAND)) {
@@ -42,7 +56,7 @@ static void __noreturn sev_es_terminate(unsigned int reason)
 		asm volatile("hlt\n" : : : "memory");
 }
 
-static bool sev_es_negotiate_protocol(void)
+static bool sev_es_negotiate_protocol(struct sev_ghcb_protocol_info *info)
 {
 	u64 val;
 
@@ -58,6 +72,12 @@ static bool sev_es_negotiate_protocol(void)
 	    GHCB_MSR_PROTO_MIN(val) > GHCB_PROTO_OUR)
 		return false;
 
+	if (info) {
+		info->hv_proto_min = GHCB_MSR_PROTO_MIN(val);
+		info->hv_proto_max = GHCB_MSR_PROTO_MAX(val);
+		info->vm_proto	   = GHCB_PROTO_OUR;
+	}
+
 	return true;
 }
 
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index a6895e440bc3..8084bfd7cce1 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -495,6 +495,9 @@ static enum es_result vc_slow_virt_to_phys(struct ghcb *ghcb, struct es_em_ctxt
 /* Include code shared with pre-decompression boot stage */
 #include "sev-shared.c"
 
+/* Negotiated GHCB protocol version */
+static struct sev_ghcb_protocol_info ghcb_protocol_info __ro_after_init;
+
 static noinstr void __sev_put_ghcb(struct ghcb_state *state)
 {
 	struct sev_es_runtime_data *data;
@@ -665,7 +668,7 @@ static enum es_result vc_handle_msr(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 static bool __init sev_es_setup_ghcb(void)
 {
 	/* First make sure the hypervisor talks a supported protocol. */
-	if (!sev_es_negotiate_protocol())
+	if (!sev_es_negotiate_protocol(&ghcb_protocol_info))
 		return false;
 
 	/*
@@ -794,6 +797,14 @@ void __init sev_es_init_vc_handling(void)
 
 	/* Secondary CPUs use the runtime #VC handler */
 	initial_vc_handler = (unsigned long)kernel_exc_vmm_communication;
+
+	/*
+	 * Print information about supported and negotiated GHCB protocol
+	 * versions.
+	 */
+	pr_info("Hypervisor GHCB protocol version support: min=%u max=%u\n",
+		ghcb_protocol_info.hv_proto_min, ghcb_protocol_info.hv_proto_max);
+	pr_info("Using GHCB protocol version %u\n", ghcb_protocol_info.vm_proto);
 }
 
 static void __init vc_early_forward_exception(struct es_em_ctxt *ctxt)
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
