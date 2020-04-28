Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 257211BC2AE
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 17:18:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F21CA8830D;
	Tue, 28 Apr 2020 15:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XP1QQEYx9BHD; Tue, 28 Apr 2020 15:18:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2D891882F3;
	Tue, 28 Apr 2020 15:18:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17838C0172;
	Tue, 28 Apr 2020 15:18:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C38BCC0888
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A93A0882F0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFm1EJxRrD57
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 349A5882DB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:11 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 52043F28; Tue, 28 Apr 2020 17:17:50 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 43/75] x86/sev-es: Setup per-cpu GHCBs for the runtime
 handler
Date: Tue, 28 Apr 2020 17:16:53 +0200
Message-Id: <20200428151725.31091-44-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428151725.31091-1-joro@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
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
 arch/x86/kernel/sev-es.c           | 56 +++++++++++++++++++++++++++++-
 arch/x86/kernel/traps.c            |  3 ++
 3 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/mem_encrypt.h b/arch/x86/include/asm/mem_encrypt.h
index 6f61bb93366a..af3e58aa1603 100644
--- a/arch/x86/include/asm/mem_encrypt.h
+++ b/arch/x86/include/asm/mem_encrypt.h
@@ -48,6 +48,7 @@ int __init early_set_memory_encrypted(unsigned long vaddr, unsigned long size);
 void __init mem_encrypt_init(void);
 void __init mem_encrypt_free_decrypted_mem(void);
 
+void __init sev_es_init_vc_handling(void);
 bool sme_active(void);
 bool sev_active(void);
 bool sev_es_active(void);
@@ -71,6 +72,7 @@ static inline void __init sme_early_init(void) { }
 static inline void __init sme_encrypt_kernel(struct boot_params *bp) { }
 static inline void __init sme_enable(struct boot_params *bp) { }
 
+static inline void sev_es_init_vc_handling(void) { }
 static inline bool sme_active(void) { return false; }
 static inline bool sev_active(void) { return false; }
 static inline bool sev_es_active(void) { return false; }
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 9de5bb23cb0a..a43d80d5e50e 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -8,8 +8,13 @@
  */
 
 #include <linux/sched/debug.h>	/* For show_regs() */
-#include <linux/kernel.h>
+#include <linux/percpu-defs.h>
+#include <linux/mem_encrypt.h>
 #include <linux/printk.h>
+#include <linux/mm_types.h>
+#include <linux/set_memory.h>
+#include <linux/memblock.h>
+#include <linux/kernel.h>
 #include <linux/mm.h>
 
 #include <asm/trap_defs.h>
@@ -29,6 +34,13 @@ static struct ghcb boot_ghcb_page __bss_decrypted __aligned(PAGE_SIZE);
  */
 static struct ghcb __initdata *boot_ghcb;
 
+/* #VC handler runtime per-cpu data */
+struct sev_es_runtime_data {
+	struct ghcb ghcb_page;
+};
+
+static DEFINE_PER_CPU(struct sev_es_runtime_data*, runtime_data);
+
 /* Needed in vc_early_vc_forward_exception */
 void do_early_exception(struct pt_regs *regs, int trapnr);
 
@@ -198,6 +210,48 @@ static bool __init sev_es_setup_ghcb(void)
 	return true;
 }
 
+static void __init sev_es_alloc_runtime_data(int cpu)
+{
+	struct sev_es_runtime_data *data;
+
+	data = memblock_alloc(sizeof(*data), PAGE_SIZE);
+	if (!data)
+		panic("Can't allocate SEV-ES runtime data");
+
+	per_cpu(runtime_data, cpu) = data;
+}
+
+static void __init sev_es_init_ghcb(int cpu)
+{
+	struct sev_es_runtime_data *data;
+	int err;
+
+	data = per_cpu(runtime_data, cpu);
+
+	err = early_set_memory_decrypted((unsigned long)&data->ghcb_page,
+					 sizeof(data->ghcb_page));
+	if (err)
+		panic("Can not map GHCBs unencrypted");
+
+	memset(&data->ghcb_page, 0, sizeof(data->ghcb_page));
+}
+
+void __init sev_es_init_vc_handling(void)
+{
+	int cpu;
+
+	BUILD_BUG_ON((offsetof(struct sev_es_runtime_data, ghcb_page) % PAGE_SIZE) != 0);
+
+	if (!sev_es_active())
+		return;
+
+	/* Initialize per-cpu GHCB pages */
+	for_each_possible_cpu(cpu) {
+		sev_es_alloc_runtime_data(cpu);
+		sev_es_init_ghcb(cpu);
+	}
+}
+
 static void __init vc_early_vc_forward_exception(struct es_em_ctxt *ctxt)
 {
 	int trapnr = ctxt->fi.vector;
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index d54cffdc7cac..411928c38cd7 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -965,6 +965,9 @@ void __init trap_init(void)
 	/* Init cpu_entry_area before IST entries are set up */
 	setup_cpu_entry_areas();
 
+	/* Init GHCB memory pages when running as an SEV-ES guest */
+	sev_es_init_vc_handling();
+
 	idt_setup_traps();
 
 	/*
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
