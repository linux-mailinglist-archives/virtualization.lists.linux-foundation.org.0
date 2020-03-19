Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E6B18B014
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:24:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E24FC87B4B;
	Thu, 19 Mar 2020 09:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVAAuptyqRC8; Thu, 19 Mar 2020 09:24:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F226A87D4B;
	Thu, 19 Mar 2020 09:23:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE78FC07FF;
	Thu, 19 Mar 2020 09:23:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47D17C1D85
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2F76A88309
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K67UaPHKLCI5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1D0E1882AC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:23:49 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CB7747D3; Thu, 19 Mar 2020 10:14:23 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 40/70] x86/sev-es: Setup per-cpu GHCBs for the runtime handler
Date: Thu, 19 Mar 2020 10:13:37 +0100
Message-Id: <20200319091407.1481-41-joro@8bytes.org>
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

From: Tom Lendacky <thomas.lendacky@amd.com>

The runtime handler needs a GHCB per CPU. Set them up and map them
unencrypted.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/mem_encrypt.h |  2 ++
 arch/x86/kernel/sev-es.c           | 28 +++++++++++++++++++++++++++-
 arch/x86/kernel/traps.c            |  3 +++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/mem_encrypt.h b/arch/x86/include/asm/mem_encrypt.h
index 6f61bb93366a..8b69b389688f 100644
--- a/arch/x86/include/asm/mem_encrypt.h
+++ b/arch/x86/include/asm/mem_encrypt.h
@@ -48,6 +48,7 @@ int __init early_set_memory_encrypted(unsigned long vaddr, unsigned long size);
 void __init mem_encrypt_init(void);
 void __init mem_encrypt_free_decrypted_mem(void);
 
+void __init sev_es_init_ghcbs(void);
 bool sme_active(void);
 bool sev_active(void);
 bool sev_es_active(void);
@@ -71,6 +72,7 @@ static inline void __init sme_early_init(void) { }
 static inline void __init sme_encrypt_kernel(struct boot_params *bp) { }
 static inline void __init sme_enable(struct boot_params *bp) { }
 
+static inline void sev_es_init_ghcbs(void) { }
 static inline bool sme_active(void) { return false; }
 static inline bool sev_active(void) { return false; }
 static inline bool sev_es_active(void) { return false; }
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index c17980e8db78..4bf5286310a0 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -8,8 +8,11 @@
  */
 
 #include <linux/sched/debug.h>	/* For show_regs() */
-#include <linux/kernel.h>
+#include <linux/percpu-defs.h>
+#include <linux/mem_encrypt.h>
 #include <linux/printk.h>
+#include <linux/set_memory.h>
+#include <linux/kernel.h>
 #include <linux/mm.h>
 
 #include <asm/trap_defs.h>
@@ -29,6 +32,9 @@ struct ghcb boot_ghcb_page __bss_decrypted __aligned(PAGE_SIZE);
  */
 struct ghcb __initdata *boot_ghcb;
 
+/* Runtime GHCB pointers */
+static struct ghcb __percpu *ghcb_page;
+
 /* Needed in vc_early_vc_forward_exception */
 extern void early_exception(struct pt_regs *regs, int trapnr);
 
@@ -197,6 +203,26 @@ static bool __init sev_es_setup_ghcb(void)
 	return true;
 }
 
+void sev_es_init_ghcbs(void)
+{
+	int cpu;
+
+	if (!sev_es_active())
+		return;
+
+	/* Allocate GHCB pages */
+	ghcb_page = __alloc_percpu(sizeof(struct ghcb), PAGE_SIZE);
+
+	/* Initialize per-cpu GHCB pages */
+	for_each_possible_cpu(cpu) {
+		struct ghcb *ghcb = (struct ghcb *)per_cpu_ptr(ghcb_page, cpu);
+
+		set_memory_decrypted((unsigned long)ghcb,
+				     sizeof(*ghcb) >> PAGE_SHIFT);
+		memset(ghcb, 0, sizeof(*ghcb));
+	}
+}
+
 static void __init vc_early_vc_forward_exception(struct es_em_ctxt *ctxt)
 {
 	int trapnr = ctxt->fi.vector;
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 6ef00eb6fbb9..09bebda9b053 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -918,6 +918,9 @@ void __init trap_init(void)
 	/* Init cpu_entry_area before IST entries are set up */
 	setup_cpu_entry_areas();
 
+	/* Init GHCB memory pages when running as an SEV-ES guest */
+	sev_es_init_ghcbs();
+
 	idt_setup_traps();
 
 	/*
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
