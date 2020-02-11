Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 33903159163
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 15:04:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D5BF8204E4;
	Tue, 11 Feb 2020 14:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nUJkcwJGt7oH; Tue, 11 Feb 2020 14:04:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8DBA1204F1;
	Tue, 11 Feb 2020 14:04:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73A0BC1D80;
	Tue, 11 Feb 2020 14:04:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03A8AC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D19A5857DC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ExBFvxaVXFXg
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5D8E88731A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:03:57 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 657A4EA7; Tue, 11 Feb 2020 14:53:17 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 57/62] x86/realmode: Setup AP jump table
Date: Tue, 11 Feb 2020 14:52:51 +0100
Message-Id: <20200211135256.24617-58-joro@8bytes.org>
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

From: Tom Lendacky <thomas.lendacky@amd.com>

Setup the AP jump table to point to the SEV-ES trampoline code so that
the APs can boot.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
[ jroedel@suse.de: - Adapted to different code base
                   - Moved AP table setup from SIPI sending path to
		     real-mode setup code ]
Co-developed-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/sev-es.h   | 11 ++++++
 arch/x86/include/uapi/asm/svm.h |  3 ++
 arch/x86/kernel/sev-es.c        | 63 +++++++++++++++++++++++++++++++++
 arch/x86/realmode/init.c        |  6 ++++
 4 files changed, 83 insertions(+)

diff --git a/arch/x86/include/asm/sev-es.h b/arch/x86/include/asm/sev-es.h
index a2d0c77dabc3..a4d7574c5c6a 100644
--- a/arch/x86/include/asm/sev-es.h
+++ b/arch/x86/include/asm/sev-es.h
@@ -78,4 +78,15 @@ static inline u64 copy_lower_bits(u64 out, u64 in, unsigned int bits)
 extern void early_vc_handler(void);
 extern int boot_vc_exception(struct pt_regs *regs);
 
+struct real_mode_header;
+
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+int sev_es_setup_ap_jump_table(struct real_mode_header *rmh);
+#else /* CONFIG_AMD_MEM_ENCRYPT */
+static inline int sev_es_setup_ap_jump_table(struct real_mode_header *rmh)
+{
+	return 0;
+}
+#endif /* CONFIG_AMD_MEM_ENCRYPT*/
+
 #endif
diff --git a/arch/x86/include/uapi/asm/svm.h b/arch/x86/include/uapi/asm/svm.h
index 8f36ae021a7f..a19ce9681ec2 100644
--- a/arch/x86/include/uapi/asm/svm.h
+++ b/arch/x86/include/uapi/asm/svm.h
@@ -84,6 +84,9 @@
 /* SEV-ES software-defined VMGEXIT events */
 #define SVM_VMGEXIT_MMIO_READ			0x80000001
 #define SVM_VMGEXIT_MMIO_WRITE			0x80000002
+#define SVM_VMGEXIT_AP_JUMP_TABLE		0x80000005
+#define		SVM_VMGEXIT_SET_AP_JUMP_TABLE			0
+#define		SVM_VMGEXIT_GET_AP_JUMP_TABLE			1
 #define SVM_VMGEXIT_UNSUPPORTED_EVENT		0x8000ffff
 
 #define SVM_EXIT_ERR           -1
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 6924bb1ad8b2..d8193d37ed2b 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 
 #include <asm/trap_defs.h>
+#include <asm/realmode.h>
 #include <asm/sev-es.h>
 #include <asm/fpu/internal.h>
 #include <asm/processor.h>
@@ -42,6 +43,8 @@ static DEFINE_PER_CPU_DECRYPTED(struct ghcb, ghcb_page) __aligned(PAGE_SIZE);
 /* Needed in early_forward_exception */
 extern void early_exception(struct pt_regs *regs, int trapnr);
 
+static inline u64 read_ghcb_msr(void);
+
 static inline u64 read_ghcb_msr(void)
 {
 	return native_read_msr(MSR_AMD64_SEV_ES_GHCB);
@@ -139,6 +142,66 @@ static phys_addr_t es_slow_virt_to_phys(struct ghcb *ghcb, long vaddr)
 /* Include code shared with pre-decompression boot stage */
 #include "sev-es-shared.c"
 
+static u64 sev_es_get_jump_table_addr(void)
+{
+	unsigned long flags;
+	struct ghcb *ghcb;
+	u64 ret;
+
+	local_irq_save(flags);
+
+	ghcb = this_cpu_ptr(&ghcb_page);
+	ghcb_invalidate(ghcb);
+
+	ghcb_set_sw_exit_code(ghcb, SVM_VMGEXIT_AP_JUMP_TABLE);
+	ghcb_set_sw_exit_info_1(ghcb, SVM_VMGEXIT_GET_AP_JUMP_TABLE);
+	ghcb_set_sw_exit_info_2(ghcb, 0);
+
+	write_ghcb_msr(__pa(ghcb));
+	VMGEXIT();
+
+	if (!ghcb_is_valid_sw_exit_info_1(ghcb) ||
+	    !ghcb_is_valid_sw_exit_info_2(ghcb))
+		ret = 0;
+
+	ret = ghcb->save.sw_exit_info_2;
+
+	local_irq_restore(flags);
+
+	return ret;
+}
+
+int sev_es_setup_ap_jump_table(struct real_mode_header *rmh)
+{
+	u16 startup_cs, startup_ip;
+	phys_addr_t jump_table_pa;
+	u64 jump_table_addr;
+	u16 *jump_table;
+
+	jump_table_addr = sev_es_get_jump_table_addr();
+
+	/* Check if AP Jump Table is non-zero and page-aligned */
+	if (!jump_table_addr || jump_table_addr & ~PAGE_MASK)
+		return 0;
+
+	jump_table_pa = jump_table_addr & PAGE_MASK;
+
+	startup_cs = (u16)(rmh->trampoline_start >> 4);
+	startup_ip = (u16)(rmh->sev_es_trampoline_start -
+			   rmh->trampoline_start);
+
+	jump_table = ioremap_encrypted(jump_table_pa, PAGE_SIZE);
+	if (!jump_table)
+		return -EIO;
+
+	jump_table[0] = startup_ip;
+	jump_table[1] = startup_cs;
+
+	iounmap(jump_table);
+
+	return 0;
+}
+
 static enum es_result handle_msr(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 {
 	struct pt_regs *regs = ctxt->regs;
diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
index 262f83cad355..1c5cbfd102d5 100644
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -9,6 +9,7 @@
 #include <asm/realmode.h>
 #include <asm/tlbflush.h>
 #include <asm/crash.h>
+#include <asm/sev-es.h>
 
 struct real_mode_header *real_mode_header;
 u32 *trampoline_cr4_features;
@@ -107,6 +108,11 @@ static void __init setup_real_mode(void)
 	if (sme_active())
 		trampoline_header->flags |= TH_FLAGS_SME_ACTIVE;
 
+	if (sev_es_active()) {
+		if (sev_es_setup_ap_jump_table(real_mode_header))
+			panic("Failed to update SEV-ES AP Jump Table");
+	}
+
 	trampoline_pgd = (u64 *) __va(real_mode_header->trampoline_pgd);
 	trampoline_pgd[0] = trampoline_pgd_entry.pgd;
 	trampoline_pgd[511] = init_top_pgt[511].pgd;
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
