Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 814211BC2B9
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 17:18:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 24B1722882;
	Tue, 28 Apr 2020 15:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EzwgGrxg8XWM; Tue, 28 Apr 2020 15:18:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A56F822803;
	Tue, 28 Apr 2020 15:18:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B819C0889;
	Tue, 28 Apr 2020 15:18:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B32EC0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4A930875F0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZM4rFBGajE4U
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0039B875B6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:00 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 31A1FEF0; Tue, 28 Apr 2020 17:17:46 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 22/75] x86/boot/compressed/64: Add set_page_en/decrypted()
 helpers
Date: Tue, 28 Apr 2020 17:16:32 +0200
Message-Id: <20200428151725.31091-23-joro@8bytes.org>
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

From: Joerg Roedel <jroedel@suse.de>

The functions are needed to map the GHCB for SEV-ES guests. The GHCB is
used for communication with the hypervisor, so its content must not be
encrypted. After the GHCB is not needed anymore it must be mapped
encrypted again so that the running kernel image can safely re-use the
memory.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/ident_map_64.c | 134 ++++++++++++++++++++++++
 arch/x86/boot/compressed/misc.h         |   2 +
 2 files changed, 136 insertions(+)

diff --git a/arch/x86/boot/compressed/ident_map_64.c b/arch/x86/boot/compressed/ident_map_64.c
index 5d8b0bffe421..bb68e9c9d87a 100644
--- a/arch/x86/boot/compressed/ident_map_64.c
+++ b/arch/x86/boot/compressed/ident_map_64.c
@@ -26,6 +26,7 @@
 #include <asm/init.h>
 #include <asm/pgtable.h>
 #include <asm/trap_defs.h>
+#include <asm/cmpxchg.h>
 /* Use the static base for this part of the boot process */
 #undef __PAGE_OFFSET
 #define __PAGE_OFFSET __PAGE_OFFSET_BASE
@@ -157,6 +158,139 @@ void initialize_identity_maps(void)
 	write_cr3(top_level_pgt);
 }
 
+static pte_t *split_large_pmd(struct x86_mapping_info *info,
+			      pmd_t *pmdp, unsigned long __address)
+{
+	unsigned long page_flags;
+	unsigned long address;
+	pte_t *pte;
+	pmd_t pmd;
+	int i;
+
+	pte = (pte_t *)info->alloc_pgt_page(info->context);
+	if (!pte)
+		return NULL;
+
+	address     = __address & PMD_MASK;
+	/* No large page - clear PSE flag */
+	page_flags  = info->page_flag & ~_PAGE_PSE;
+
+	/* Populate the PTEs */
+	for (i = 0; i < PTRS_PER_PMD; i++) {
+		set_pte(&pte[i], __pte(address | page_flags));
+		address += PAGE_SIZE;
+	}
+
+	/*
+	 * Ideally we need to clear the large PMD first and do a TLB
+	 * flush before we write the new PMD. But the 2M range of the
+	 * PMD might contain the code we execute and/or the stack
+	 * we are on, so we can't do that. But that should be safe here
+	 * because we are going from large to small mappings and we are
+	 * also the only user of the page-table, so there is no chance
+	 * of a TLB multihit.
+	 */
+	pmd = __pmd((unsigned long)pte | info->kernpg_flag);
+	set_pmd(pmdp, pmd);
+	/* Flush TLB to establish the new PMD */
+	write_cr3(top_level_pgt);
+
+	return pte + pte_index(__address);
+}
+
+static void clflush_page(unsigned long address)
+{
+	unsigned int flush_size;
+	char *cl, *start, *end;
+
+	/*
+	 * Hardcode cl-size to 64 - CPUID can't be used here because that might
+	 * cause another #VC exception and the GHCB is not ready to use yet.
+	 */
+	flush_size = 64;
+	start      = (char *)(address & PAGE_MASK);
+	end        = start + PAGE_SIZE;
+
+	/*
+	 * First make sure there are no pending writes on the cache-lines to
+	 * flush.
+	 */
+	asm volatile("mfence" : : : "memory");
+
+	for (cl = start; cl != end; cl += flush_size)
+		clflush(cl);
+}
+
+static int set_clr_page_flags(struct x86_mapping_info *info,
+			      unsigned long address,
+			      pteval_t set, pteval_t clr)
+{
+	unsigned long scratch, *target;
+	pgd_t *pgdp = (pgd_t *)top_level_pgt;
+	p4d_t *p4dp;
+	pud_t *pudp;
+	pmd_t *pmdp;
+	pte_t *ptep, pte;
+
+	/*
+	 * First make sure there is a PMD mapping for 'address'.
+	 * It should already exist, but keep things generic.
+	 *
+	 * To map the page just read from it and fault it in if there is no
+	 * mapping yet. add_identity_map() can't be called here because that
+	 * would unconditionally map the address on PMD level, destroying any
+	 * PTE-level mappings that might already exist.  Also do something
+	 * useless with 'scratch' so the access won't be optimized away.
+	 */
+	target = (unsigned long *)address;
+	scratch = *target;
+	arch_cmpxchg(target, scratch, scratch);
+
+	/*
+	 * The page is mapped at least with PMD size - so skip checks and walk
+	 * directly to the PMD.
+	 */
+	p4dp = p4d_offset(pgdp, address);
+	pudp = pud_offset(p4dp, address);
+	pmdp = pmd_offset(pudp, address);
+
+	if (pmd_large(*pmdp))
+		ptep = split_large_pmd(info, pmdp, address);
+	else
+		ptep = pte_offset_kernel(pmdp, address);
+
+	if (!ptep)
+		return -ENOMEM;
+
+	/*
+	 * Changing encryption attributes of a page requires to flush it from
+	 * the caches.
+	 */
+	if ((set | clr) & _PAGE_ENC)
+		clflush_page(address);
+
+	/* Update PTE */
+	pte = *ptep;
+	pte = pte_set_flags(pte, set);
+	pte = pte_clear_flags(pte, clr);
+	set_pte(ptep, pte);
+
+	/* Flush TLB after changing encryption attribute */
+	write_cr3(top_level_pgt);
+
+	return 0;
+}
+
+int set_page_decrypted(unsigned long address)
+{
+	return set_clr_page_flags(&mapping_info, address, 0, _PAGE_ENC);
+}
+
+int set_page_encrypted(unsigned long address)
+{
+	return set_clr_page_flags(&mapping_info, address, _PAGE_ENC, 0);
+}
+
 void do_boot_page_fault(struct pt_regs *regs, unsigned long error_code)
 {
 	unsigned long address = native_read_cr2() & PMD_MASK;
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 65da40777bc1..5e569e8a7d75 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -98,6 +98,8 @@ static inline void choose_random_location(unsigned long input,
 #endif
 
 #ifdef CONFIG_X86_64
+extern int set_page_decrypted(unsigned long address);
+extern int set_page_encrypted(unsigned long address);
 extern unsigned char _pgtable[];
 #endif
 
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
