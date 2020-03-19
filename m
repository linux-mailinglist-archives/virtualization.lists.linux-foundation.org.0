Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FAA18AF40
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:15:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EC61487C6B;
	Thu, 19 Mar 2020 09:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F1dRIx54XXfB; Thu, 19 Mar 2020 09:15:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 640DB87E0A;
	Thu, 19 Mar 2020 09:14:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4738DC07FF;
	Thu, 19 Mar 2020 09:14:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 611A7C1830
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4EC9E87D98
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ASprwcp4UAVX
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 319BC87C52
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:33 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 072A046A; Thu, 19 Mar 2020 10:14:19 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 21/70] x86/boot/compressed/64: Add function to map a page
 unencrypted
Date: Thu, 19 Mar 2020 10:13:18 +0100
Message-Id: <20200319091407.1481-22-joro@8bytes.org>
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

From: Joerg Roedel <jroedel@suse.de>

This function is needed to map the GHCB for SEV-ES guests. The GHCB is
used for communication with the hypervisor, so its content must not be
encrypted.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/ident_map_64.c | 125 ++++++++++++++++++++++++
 arch/x86/boot/compressed/misc.h         |   1 +
 2 files changed, 126 insertions(+)

diff --git a/arch/x86/boot/compressed/ident_map_64.c b/arch/x86/boot/compressed/ident_map_64.c
index feb180cced28..04a5ff4bda66 100644
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
@@ -157,6 +158,130 @@ void initialize_identity_maps(void)
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
+static int __set_page_decrypted(struct x86_mapping_info *info,
+				unsigned long address)
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
+	/* Clear encryption flag and write new pte */
+	pte = pte_clear_flags(*ptep, _PAGE_ENC);
+	set_pte(ptep, pte);
+
+	/* Flush TLB to map the page unencrypted */
+	write_cr3(top_level_pgt);
+
+	/*
+	 * Changing encryption attributes of a page requires to flush it from
+	 * the caches.
+	 */
+	clflush_page(address);
+
+	return 0;
+}
+
+int set_page_decrypted(unsigned long address)
+{
+	return __set_page_decrypted(&mapping_info, address);
+}
+
 static void pf_error(unsigned long error_code, unsigned long address,
 		     struct pt_regs *regs)
 {
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 0e3508c5c15c..42f68a858a35 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -98,6 +98,7 @@ static inline void choose_random_location(unsigned long input,
 #endif
 
 #ifdef CONFIG_X86_64
+extern int set_page_decrypted(unsigned long address);
 extern unsigned char _pgtable[];
 #endif
 
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
