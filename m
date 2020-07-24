Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AF67A22CAA9
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 18:14:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 591C4884A8;
	Fri, 24 Jul 2020 16:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Si-+M-J-zOf4; Fri, 24 Jul 2020 16:14:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5041688736;
	Fri, 24 Jul 2020 16:14:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A441C004E;
	Fri, 24 Jul 2020 16:14:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C217C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 68DE58714E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lh8VR8vV76b8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 659DB87128
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:30 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 2E12EFEE;
 Fri, 24 Jul 2020 18:04:38 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v5 70/75] x86/head/64: Don't call verify_cpu() on starting APs
Date: Fri, 24 Jul 2020 18:03:31 +0200
Message-Id: <20200724160336.5435-71-joro@8bytes.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724160336.5435-1-joro@8bytes.org>
References: <20200724160336.5435-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Joerg Roedel <jroedel@suse.de>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Joerg Roedel <jroedel@suse.de>

The APs are not ready to handle exceptions when verify_cpu() is called
in secondary_startup_64.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/realmode.h |  1 +
 arch/x86/kernel/head_64.S       | 12 ++++++++++++
 arch/x86/realmode/init.c        |  6 ++++++
 3 files changed, 19 insertions(+)

diff --git a/arch/x86/include/asm/realmode.h b/arch/x86/include/asm/realmode.h
index 6590394af309..5c97807c38a4 100644
--- a/arch/x86/include/asm/realmode.h
+++ b/arch/x86/include/asm/realmode.h
@@ -69,6 +69,7 @@ extern unsigned char startup_32_smp[];
 extern unsigned char boot_gdt[];
 #else
 extern unsigned char secondary_startup_64[];
+extern unsigned char secondary_startup_64_no_verify[];
 #endif
 
 static inline size_t real_mode_size_needed(void)
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 8d5bf7c568a4..a708107688a2 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -140,6 +140,18 @@ SYM_CODE_START(secondary_startup_64)
 	/* Sanitize CPU configuration */
 	call verify_cpu
 
+	/*
+	 * The secondary_startup_64_no_verify entry point is only used by
+	 * SEV-ES guests. In those guests the call to verify_cpu() would cause
+	 * #VC exceptions which can not be handled at this stage of secondary
+	 * CPU bringup.
+	 *
+	 * All non SEV-ES systems, especially Intel systems, need to execute
+	 * verify_cpu() above to make sure NX is enabled.
+	 */
+SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
+	UNWIND_HINT_EMPTY
+
 	/*
 	 * Retrieve the modifier (SME encryption mask if SME is active) to be
 	 * added to the initial pgdir entry that will be programmed into CR3.
diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
index 61a52b925d15..df701f87ddef 100644
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -46,6 +46,12 @@ static void sme_sev_setup_real_mode(struct trampoline_header *th)
 		th->flags |= TH_FLAGS_SME_ACTIVE;
 
 	if (sev_es_active()) {
+		/*
+		 * Skip the call to verify_cpu() in secondary_startup_64 as it
+		 * will cause #VC exceptions when the AP can't handle them yet.
+		 */
+		th->start = (u64) secondary_startup_64_no_verify;
+
 		if (sev_es_setup_ap_jump_table(real_mode_header))
 			panic("Failed to update SEV-ES AP Jump Table");
 	}
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
