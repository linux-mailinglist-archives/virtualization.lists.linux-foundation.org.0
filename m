Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 599A415909C
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 14:53:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 020FB865C4;
	Tue, 11 Feb 2020 13:53:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GtG8-qorUjC; Tue, 11 Feb 2020 13:53:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 815F6863B7;
	Tue, 11 Feb 2020 13:53:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65C2BC07FE;
	Tue, 11 Feb 2020 13:53:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3CB8C1D8F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C8A4C8742F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lhDhxRZpvW1c
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:53:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1F11B8733F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:53:25 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id AB53BE51; Tue, 11 Feb 2020 14:53:12 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 31/62] x86/sev-es: Add SEV-ES Feature Detection
Date: Tue, 11 Feb 2020 14:52:25 +0100
Message-Id: <20200211135256.24617-32-joro@8bytes.org>
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

From: Joerg Roedel <jroedel@suse.de>

Add the sev_es_active function for checking whether SEV-ES is enabled.
Also cache the value of MSR_AMD64_SEV at boot to speed up the feature
checking in the running code.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/mem_encrypt.h |  3 +++
 arch/x86/include/asm/msr-index.h   |  2 ++
 arch/x86/mm/mem_encrypt.c          | 11 ++++++++++-
 arch/x86/mm/mem_encrypt_identity.c |  3 +++
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/mem_encrypt.h b/arch/x86/include/asm/mem_encrypt.h
index 848ce43b9040..6f61bb93366a 100644
--- a/arch/x86/include/asm/mem_encrypt.h
+++ b/arch/x86/include/asm/mem_encrypt.h
@@ -19,6 +19,7 @@
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 
 extern u64 sme_me_mask;
+extern u64 sev_status;
 extern bool sev_enabled;
 
 void sme_encrypt_execute(unsigned long encrypted_kernel_vaddr,
@@ -49,6 +50,7 @@ void __init mem_encrypt_free_decrypted_mem(void);
 
 bool sme_active(void);
 bool sev_active(void);
+bool sev_es_active(void);
 
 #define __bss_decrypted __attribute__((__section__(".bss..decrypted")))
 
@@ -71,6 +73,7 @@ static inline void __init sme_enable(struct boot_params *bp) { }
 
 static inline bool sme_active(void) { return false; }
 static inline bool sev_active(void) { return false; }
+static inline bool sev_es_active(void) { return false; }
 
 static inline int __init
 early_set_memory_decrypted(unsigned long vaddr, unsigned long size) { return 0; }
diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index b6139b70db54..1411c37b6cd9 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -435,7 +435,9 @@
 #define MSR_AMD64_SEV_ES_GHCB		0xc0010130
 #define MSR_AMD64_SEV			0xc0010131
 #define MSR_AMD64_SEV_ENABLED_BIT	0
+#define MSR_AMD64_SEV_ES_ENABLED_BIT	1
 #define MSR_AMD64_SEV_ENABLED		BIT_ULL(MSR_AMD64_SEV_ENABLED_BIT)
+#define MSR_AMD64_SEV_ES_ENABLED	BIT_ULL(MSR_AMD64_SEV_ES_ENABLED_BIT)
 
 #define MSR_AMD64_VIRT_SPEC_CTRL	0xc001011f
 
diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index a03614bd3e1a..a35fcba24866 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -38,7 +38,9 @@
  * section is later cleared.
  */
 u64 sme_me_mask __section(.data) = 0;
+u64 sev_status __section(.data) = 0;
 EXPORT_SYMBOL(sme_me_mask);
+EXPORT_SYMBOL(sev_status);
 DEFINE_STATIC_KEY_FALSE(sev_enable_key);
 EXPORT_SYMBOL_GPL(sev_enable_key);
 
@@ -347,9 +349,16 @@ bool sme_active(void)
 
 bool sev_active(void)
 {
-	return sme_me_mask && sev_enabled;
+	return !!(sev_status & MSR_AMD64_SEV_ENABLED);
 }
 
+bool sev_es_active(void)
+{
+	return !!(sev_status & MSR_AMD64_SEV_ES_ENABLED);
+}
+EXPORT_SYMBOL_GPL(sev_es_active);
+
+
 /* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_UNENCRYPTED */
 bool force_dma_unencrypted(struct device *dev)
 {
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
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
