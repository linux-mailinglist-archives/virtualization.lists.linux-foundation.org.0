Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6491A21F0F3
	for <lists.virtualization@lfdr.de>; Tue, 14 Jul 2020 14:18:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D9DE188E79;
	Tue, 14 Jul 2020 12:18:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZsOvGYcKaEV8; Tue, 14 Jul 2020 12:18:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4D63988D66;
	Tue, 14 Jul 2020 12:18:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 303DDC0733;
	Tue, 14 Jul 2020 12:18:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EACF9C0733
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D47E02E8EF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-+BRpJdFVKE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 800C926C8C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:18:33 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 26D7FFF3;
 Tue, 14 Jul 2020 14:11:14 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v4 74/75] x86/efi: Add GHCB mappings when SEV-ES is active
Date: Tue, 14 Jul 2020 14:09:16 +0200
Message-Id: <20200714120917.11253-75-joro@8bytes.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714120917.11253-1-joro@8bytes.org>
References: <20200714120917.11253-1-joro@8bytes.org>
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
 arch/x86/include/asm/sev-es.h     |  2 ++
 arch/x86/kernel/sev-es.c          | 30 ++++++++++++++++++++++++++++++
 arch/x86/platform/efi/efi_64.c    | 10 ++++++++++
 4 files changed, 43 insertions(+)

diff --git a/arch/x86/boot/compressed/sev-es.c b/arch/x86/boot/compressed/sev-es.c
index 1ce144e0ddc3..b522c18c0588 100644
--- a/arch/x86/boot/compressed/sev-es.c
+++ b/arch/x86/boot/compressed/sev-es.c
@@ -12,6 +12,7 @@
  */
 #include "misc.h"
 
+#include <asm/pgtable_types.h>
 #include <asm/sev-es.h>
 #include <asm/trapnr.h>
 #include <asm/trap_pf.h>
diff --git a/arch/x86/include/asm/sev-es.h b/arch/x86/include/asm/sev-es.h
index de4d3f63fdf8..03e114c727c8 100644
--- a/arch/x86/include/asm/sev-es.h
+++ b/arch/x86/include/asm/sev-es.h
@@ -85,11 +85,13 @@ extern void sev_es_ist_enter(struct pt_regs *regs);
 extern void sev_es_ist_exit(void);
 extern int sev_es_setup_ap_jump_table(struct real_mode_header *rmh);
 extern void sev_es_nmi_complete(void);
+extern int __init sev_es_efi_map_ghcbs(pgd_t *pgd);
 #else
 static inline void sev_es_ist_enter(struct pt_regs *regs) { }
 static inline void sev_es_ist_exit(void) { }
 static inline int sev_es_setup_ap_jump_table(struct real_mode_header *rmh) { return 0; }
 static inline void sev_es_nmi_complete(void) { }
+static inline int sev_es_efi_map_ghcbs(pgd_t *pgd) { return 0; }
 #endif
 
 #endif
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index ff440b6e5e78..61308f9c8138 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -507,6 +507,36 @@ int sev_es_setup_ap_jump_table(struct real_mode_header *rmh)
 	return 0;
 }
 
+/*
+ * This is needed by the OVMF UEFI firmware which will use whatever it finds in
+ * the GHCB MSR as its GHCB to talk to the hypervisor. So make sure the per-cpu
+ * runtime GHCBs used by the kernel are also mapped in the EFI page-table.
+ */
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
index 8e364c4c6768..42e0628c45ca 100644
--- a/arch/x86/platform/efi/efi_64.c
+++ b/arch/x86/platform/efi/efi_64.c
@@ -47,6 +47,7 @@
 #include <asm/realmode.h>
 #include <asm/time.h>
 #include <asm/pgalloc.h>
+#include <asm/sev-es.h>
 
 /*
  * We allocate runtime services regions top-down, starting from -4G, i.e.
@@ -238,6 +239,15 @@ int __init efi_setup_page_tables(unsigned long pa_memmap, unsigned num_pages)
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
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
