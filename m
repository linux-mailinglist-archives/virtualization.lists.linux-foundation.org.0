Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BE222CAB1
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 18:14:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BF55488B2F;
	Fri, 24 Jul 2020 16:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1nZw1-SOtoR; Fri, 24 Jul 2020 16:14:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ACC1888B52;
	Fri, 24 Jul 2020 16:14:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94DE4C004C;
	Fri, 24 Jul 2020 16:14:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2073AC013C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1D3FB887B1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x14BZOCPsewT
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0CCC487C5F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:33 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id D33AFFF4;
 Fri, 24 Jul 2020 18:04:40 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v5 75/75] x86/sev-es: Check required CPU features for SEV-ES
Date: Fri, 24 Jul 2020 18:03:36 +0200
Message-Id: <20200724160336.5435-76-joro@8bytes.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724160336.5435-1-joro@8bytes.org>
References: <20200724160336.5435-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Juergen Gross <jgross@suse.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>, Kees Cook <keescook@chromium.org>
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

From: Martin Radev <martin.b.radev@gmail.com>

Make sure the machine supports RDRAND, otherwise there is no trusted
source of of randomness in the system.

To also check this in the pre-decompression stage, make has_cpuflag
not depend on CONFIG_RANDOMIZE_BASE anymore.

Signed-off-by: Martin Radev <martin.b.radev@gmail.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/cpuflags.c |  4 ----
 arch/x86/boot/compressed/misc.h     |  5 +++--
 arch/x86/boot/compressed/sev-es.c   |  3 +++
 arch/x86/kernel/sev-es-shared.c     | 15 +++++++++++++++
 arch/x86/kernel/sev-es.c            |  3 +++
 5 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/x86/boot/compressed/cpuflags.c b/arch/x86/boot/compressed/cpuflags.c
index 6448a8196d32..0cc1323896d1 100644
--- a/arch/x86/boot/compressed/cpuflags.c
+++ b/arch/x86/boot/compressed/cpuflags.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#ifdef CONFIG_RANDOMIZE_BASE
-
 #include "../cpuflags.c"
 
 bool has_cpuflag(int flag)
@@ -9,5 +7,3 @@ bool has_cpuflag(int flag)
 
 	return test_bit(flag, cpu.flags);
 }
-
-#endif
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 2e5f82acc122..a37e7d4b00e4 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -85,8 +85,6 @@ void choose_random_location(unsigned long input,
 			    unsigned long *output,
 			    unsigned long output_size,
 			    unsigned long *virt_addr);
-/* cpuflags.c */
-bool has_cpuflag(int flag);
 #else
 static inline void choose_random_location(unsigned long input,
 					  unsigned long input_size,
@@ -97,6 +95,9 @@ static inline void choose_random_location(unsigned long input,
 }
 #endif
 
+/* cpuflags.c */
+bool has_cpuflag(int flag);
+
 #ifdef CONFIG_X86_64
 extern int set_page_decrypted(unsigned long address);
 extern int set_page_encrypted(unsigned long address);
diff --git a/arch/x86/boot/compressed/sev-es.c b/arch/x86/boot/compressed/sev-es.c
index b522c18c0588..eb1a8b5cc753 100644
--- a/arch/x86/boot/compressed/sev-es.c
+++ b/arch/x86/boot/compressed/sev-es.c
@@ -145,6 +145,9 @@ void sev_es_shutdown_ghcb(void)
 	if (!boot_ghcb)
 		return;
 
+	if (!sev_es_check_cpu_features())
+		error("SEV-ES CPU Features missing.");
+
 	/*
 	 * GHCB Page must be flushed from the cache and mapped encrypted again.
 	 * Otherwise the running kernel will see strange cache effects when
diff --git a/arch/x86/kernel/sev-es-shared.c b/arch/x86/kernel/sev-es-shared.c
index 608f76d0d088..56de70cb80d8 100644
--- a/arch/x86/kernel/sev-es-shared.c
+++ b/arch/x86/kernel/sev-es-shared.c
@@ -9,6 +9,21 @@
  * and is included directly into both code-bases.
  */
 
+#ifndef __BOOT_COMPRESSED
+#define error(v)	pr_err(v)
+#define has_cpuflag(f)	boot_cpu_has(f)
+#endif
+
+static bool __init sev_es_check_cpu_features(void)
+{
+	if (!has_cpuflag(X86_FEATURE_RDRAND)) {
+		error("RDRAND instruction not supported - no trusted source of randomness available\n");
+		return false;
+	}
+
+	return true;
+}
+
 static void sev_es_terminate(unsigned int reason)
 {
 	u64 val = GHCB_SEV_TERMINATE;
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index c5e0ceb099c2..e1fea7a38019 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -670,6 +670,9 @@ void __init sev_es_init_vc_handling(void)
 	if (!sev_es_active())
 		return;
 
+	if (!sev_es_check_cpu_features())
+		panic("SEV-ES CPU Features missing");
+
 	/* Enable SEV-ES special handling */
 	static_branch_enable(&sev_es_enable_key);
 
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
