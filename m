Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A93E1BC38B
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 17:27:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 314F3875A1;
	Tue, 28 Apr 2020 15:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XGuJMfoNVbdJ; Tue, 28 Apr 2020 15:27:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B89048760D;
	Tue, 28 Apr 2020 15:26:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B06BBC0889;
	Tue, 28 Apr 2020 15:26:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2365FC0888
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1404E228DB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UuifYEoPzDs3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id D484720400
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:41 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C5CCEF54; Tue, 28 Apr 2020 17:17:56 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 75/75] x86/efi: Add GHCB mappings when SEV-ES is active
Date: Tue, 28 Apr 2020 17:17:25 +0200
Message-Id: <20200428151725.31091-76-joro@8bytes.org>
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

Calling down to EFI runtime services can result in the firmware performing
VMGEXIT calls. The firmware is likely to use the GHCB of the OS (e.g., for
setting EFI variables), so each GHCB in the system needs to be identity
mapped in the EFI page tables, as unencrypted, to avoid page faults.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
[ jroedel@suse.de: Moved GHCB mapping loop to sev-es.c ]
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/sev-es.c |  1 +
 arch/x86/include/asm/sev-es.h     |  5 +++++
 arch/x86/kernel/sev-es.c          | 25 +++++++++++++++++++++++++
 arch/x86/platform/efi/efi_64.c    | 10 ++++++++++
 4 files changed, 41 insertions(+)

diff --git a/arch/x86/boot/compressed/sev-es.c b/arch/x86/boot/compressed/sev-es.c
index 12a5d918d837..30b2cebf5fed 100644
--- a/arch/x86/boot/compressed/sev-es.c
+++ b/arch/x86/boot/compressed/sev-es.c
@@ -12,6 +12,7 @@
  */
 #include "misc.h"
 
+#include <asm/pgtable_types.h>
 #include <asm/sev-es.h>
 #include <asm/trap_defs.h>
 #include <asm/msr-index.h>
diff --git a/arch/x86/include/asm/sev-es.h b/arch/x86/include/asm/sev-es.h
index a242d16727f1..ce9a197bf958 100644
--- a/arch/x86/include/asm/sev-es.h
+++ b/arch/x86/include/asm/sev-es.h
@@ -87,6 +87,7 @@ void sev_es_nmi_enter(void);
 void sev_es_nmi_exit(void);
 int sev_es_setup_ap_jump_table(struct real_mode_header *rmh);
 void sev_es_nmi_complete(void);
+int __init sev_es_efi_map_ghcbs(pgd_t *pgd);
 #else /* CONFIG_AMD_MEM_ENCRYPT */
 static inline const char *vc_stack_name(enum stack_type type)
 {
@@ -97,6 +98,10 @@ static inline int sev_es_setup_ap_jump_table(struct real_mode_header *rmh)
 	return 0;
 }
 static inline void sev_es_nmi_complete(void) { }
+static inline int sev_es_efi_map_ghcbs(pgd_t *pgd)
+{
+	return 0;
+}
 #endif /* CONFIG_AMD_MEM_ENCRYPT*/
 
 #endif
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index eef6e2196ef4..3b62714723b5 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -422,6 +422,31 @@ int sev_es_setup_ap_jump_table(struct real_mode_header *rmh)
 	return 0;
 }
 
+int __init sev_es_efi_map_ghcbs(pgd_t *pgd)
+{
+	struct sev_es_runtime_data *data;
+	unsigned long address, pflags;
+	int cpu;
+	u64 pfn;
+
+	if (!sev_es_active())
+		return 0;
+
+	pflags = _PAGE_NX | _PAGE_RW;
+
+	for_each_possible_cpu(cpu) {
+		data = per_cpu(runtime_data, cpu);
+
+		address = __pa(&data->ghcb_page);
+		pfn = address >> PAGE_SHIFT;
+
+		if (kernel_map_pages_in_pgd(pgd, pfn, address, 1, pflags))
+			return 1;
+	}
+
+	return 0;
+}
+
 static enum es_result vc_handle_msr(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 {
 	struct pt_regs *regs = ctxt->regs;
diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
index c5e393f8bb3f..004a18853dd3 100644
--- a/arch/x86/platform/efi/efi_64.c
+++ b/arch/x86/platform/efi/efi_64.c
@@ -48,6 +48,7 @@
 #include <asm/realmode.h>
 #include <asm/time.h>
 #include <asm/pgalloc.h>
+#include <asm/sev-es.h>
 
 /*
  * We allocate runtime services regions top-down, starting from -4G, i.e.
@@ -239,6 +240,15 @@ int __init efi_setup_page_tables(unsigned long pa_memmap, unsigned num_pages)
 		return 1;
 	}
 
+	/*
+	 * When SEV-ES is active, the GHCB as set by the kernel will be used
+	 * by firmware. Create a 1:1 unencrypted mapping for each GHCB.
+	 */
+	if (sev_es_efi_map_ghcbs(pgd)) {
+		pr_err("Failed to create 1:1 mapping for the GHCBs!\n");
+		return 1;
+	}
+
 	/*
 	 * When making calls to the firmware everything needs to be 1:1
 	 * mapped and addressable with 32-bit pointers. Map the kernel
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
