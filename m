Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 694C924F61B
	for <lists.virtualization@lfdr.de>; Mon, 24 Aug 2020 10:56:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1822085F9C;
	Mon, 24 Aug 2020 08:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HsVbWbZIPKtW; Mon, 24 Aug 2020 08:56:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8319985F93;
	Mon, 24 Aug 2020 08:56:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AF81C016F;
	Mon, 24 Aug 2020 08:56:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46464C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2A66085F32
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYPCrzybehE6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7AED885F6C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:56:20 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2bb8d.dip0.t-ipconnect.de
 [79.242.187.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 2D4B185;
 Mon, 24 Aug 2020 10:56:10 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v6 39/76] x86/sev-es: Add SEV-ES Feature Detection
Date: Mon, 24 Aug 2020 10:54:34 +0200
Message-Id: <20200824085511.7553-40-joro@8bytes.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824085511.7553-1-joro@8bytes.org>
References: <20200824085511.7553-1-joro@8bytes.org>
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

Add the sev_es_active function for checking whether SEV-ES is enabled.
Also cache the value of MSR_AMD64_SEV at boot to speed up the feature
checking in the running code.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Reviewed-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20200724160336.5435-39-joro@8bytes.org
---
 arch/x86/include/asm/mem_encrypt.h | 3 +++
 arch/x86/include/asm/msr-index.h   | 2 ++
 arch/x86/mm/mem_encrypt.c          | 9 ++++++++-
 arch/x86/mm/mem_encrypt_identity.c | 3 +++
 4 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/mem_encrypt.h b/arch/x86/include/asm/mem_encrypt.h
index 5049f6c22683..4e72b73a9cb5 100644
--- a/arch/x86/include/asm/mem_encrypt.h
+++ b/arch/x86/include/asm/mem_encrypt.h
@@ -19,6 +19,7 @@
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 
 extern u64 sme_me_mask;
+extern u64 sev_status;
 extern bool sev_enabled;
 
 void sme_encrypt_execute(unsigned long encrypted_kernel_vaddr,
@@ -50,6 +51,7 @@ void __init mem_encrypt_init(void);
 
 bool sme_active(void);
 bool sev_active(void);
+bool sev_es_active(void);
 
 #define __bss_decrypted __attribute__((__section__(".bss..decrypted")))
 
@@ -72,6 +74,7 @@ static inline void __init sme_enable(struct boot_params *bp) { }
 
 static inline bool sme_active(void) { return false; }
 static inline bool sev_active(void) { return false; }
+static inline bool sev_es_active(void) { return false; }
 
 static inline int __init
 early_set_memory_decrypted(unsigned long vaddr, unsigned long size) { return 0; }
diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index cd6d651ff730..95871defba91 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -469,7 +469,9 @@
 #define MSR_AMD64_SEV_ES_GHCB		0xc0010130
 #define MSR_AMD64_SEV			0xc0010131
 #define MSR_AMD64_SEV_ENABLED_BIT	0
+#define MSR_AMD64_SEV_ES_ENABLED_BIT	1
 #define MSR_AMD64_SEV_ENABLED		BIT_ULL(MSR_AMD64_SEV_ENABLED_BIT)
+#define MSR_AMD64_SEV_ES_ENABLED	BIT_ULL(MSR_AMD64_SEV_ES_ENABLED_BIT)
 
 #define MSR_AMD64_VIRT_SPEC_CTRL	0xc001011f
 
diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index 9f1177edc2e7..232d6e1bcfc6 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -38,6 +38,7 @@
  * section is later cleared.
  */
 u64 sme_me_mask __section(.data) = 0;
+u64 sev_status __section(.data) = 0;
 EXPORT_SYMBOL(sme_me_mask);
 DEFINE_STATIC_KEY_FALSE(sev_enable_key);
 EXPORT_SYMBOL_GPL(sev_enable_key);
@@ -347,7 +348,13 @@ bool sme_active(void)
 
 bool sev_active(void)
 {
-	return sme_me_mask && sev_enabled;
+	return !!(sev_status & MSR_AMD64_SEV_ENABLED);
+}
+
+/* Needs to be called from non-instrumentable code */
+bool noinstr sev_es_active(void)
+{
+	return !!(sev_status & MSR_AMD64_SEV_ES_ENABLED);
 }
 
 /* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_UNENCRYPTED */
diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
index e2b0e2ac07bb..68d75379e06a 100644
--- a/arch/x86/mm/mem_encrypt_identity.c
+++ b/arch/x86/mm/mem_encrypt_identity.c
@@ -540,6 +540,9 @@ void __init sme_enable(struct boot_params *bp)
 		if (!(msr & MSR_AMD64_SEV_ENABLED))
 			return;
 
+		/* Save SEV_STATUS to avoid reading MSR again */
+		sev_status = msr;
+
 		/* SEV state cannot be controlled by a command line option */
 		sme_me_mask = me_mask;
 		sev_enabled = true;
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
