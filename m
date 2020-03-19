Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 672C118AF1D
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 10:14:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0AC5887E1D;
	Thu, 19 Mar 2020 09:14:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NythMIHEJ22; Thu, 19 Mar 2020 09:14:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EE07387C5A;
	Thu, 19 Mar 2020 09:14:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCEE9C1830;
	Thu, 19 Mar 2020 09:14:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BD76C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EDA9F87C49
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yhOYVbvzOhAT
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E93B887BF6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 09:14:30 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id BCC7B364; Thu, 19 Mar 2020 10:14:18 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 15/70] x86/boot/compressed/64: Always switch to own page-table
Date: Thu, 19 Mar 2020 10:13:12 +0100
Message-Id: <20200319091407.1481-16-joro@8bytes.org>
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

When booted through startup_64 the kernel keeps running on the EFI
page-table until the KASLR code sets up its own page-table. Without
KASLR the pre-decompression boot code never switches off the EFI
page-table. Change that by unconditionally switching to our own
page-table once the kernel is relocated.

This makes sure we can make changes to the mapping when necessary, for
example map pages unencrypted in SEV and SEV-ES guests.

Also remove the debug_putstr() calls in initialize_identity_maps()
because the function now runs before console_init() is called.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/head_64.S      |  3 +-
 arch/x86/boot/compressed/ident_map_64.c | 51 +++++++++++++++----------
 arch/x86/boot/compressed/kaslr.c        |  3 --
 3 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/arch/x86/boot/compressed/head_64.S b/arch/x86/boot/compressed/head_64.S
index d27a9ce1bcb0..5164d2e8631a 100644
--- a/arch/x86/boot/compressed/head_64.S
+++ b/arch/x86/boot/compressed/head_64.S
@@ -491,10 +491,11 @@ SYM_FUNC_START_LOCAL_NOALIGN(.Lrelocated)
 	rep	stosq
 
 /*
- * Load stage2 IDT
+ * Load stage2 IDT and switch to our own page-table
  */
 	pushq	%rsi
 	call	load_stage2_idt
+	call	initialize_identity_maps
 	popq	%rsi
 
 /*
diff --git a/arch/x86/boot/compressed/ident_map_64.c b/arch/x86/boot/compressed/ident_map_64.c
index 0865d181b85d..6a3890caaa19 100644
--- a/arch/x86/boot/compressed/ident_map_64.c
+++ b/arch/x86/boot/compressed/ident_map_64.c
@@ -88,9 +88,31 @@ phys_addr_t physical_mask = (1ULL << __PHYSICAL_MASK_SHIFT) - 1;
  */
 static struct x86_mapping_info mapping_info;
 
+/*
+ * Adds the specified range to what will become the new identity mappings.
+ * Once all ranges have been added, the new mapping is activated by calling
+ * finalize_identity_maps() below.
+ */
+void add_identity_map(unsigned long start, unsigned long size)
+{
+	unsigned long end = start + size;
+
+	/* Align boundary to 2M. */
+	start = round_down(start, PMD_SIZE);
+	end = round_up(end, PMD_SIZE);
+	if (start >= end)
+		return;
+
+	/* Build the mapping. */
+	kernel_ident_mapping_init(&mapping_info, (pgd_t *)top_level_pgt,
+				  start, end);
+}
+
 /* Locates and clears a region for a new top level page table. */
 void initialize_identity_maps(void)
 {
+	unsigned long start, size;
+
 	/* If running as an SEV guest, the encryption mask is required. */
 	set_sev_encryption_mask();
 
@@ -123,37 +145,24 @@ void initialize_identity_maps(void)
 	 */
 	top_level_pgt = read_cr3_pa();
 	if (p4d_offset((pgd_t *)top_level_pgt, 0) == (p4d_t *)_pgtable) {
-		debug_putstr("booted via startup_32()\n");
 		pgt_data.pgt_buf = _pgtable + BOOT_INIT_PGT_SIZE;
 		pgt_data.pgt_buf_size = BOOT_PGT_SIZE - BOOT_INIT_PGT_SIZE;
 		memset(pgt_data.pgt_buf, 0, pgt_data.pgt_buf_size);
 	} else {
-		debug_putstr("booted via startup_64()\n");
 		pgt_data.pgt_buf = _pgtable;
 		pgt_data.pgt_buf_size = BOOT_PGT_SIZE;
 		memset(pgt_data.pgt_buf, 0, pgt_data.pgt_buf_size);
 		top_level_pgt = (unsigned long)alloc_pgt_page(&pgt_data);
 	}
-}
 
-/*
- * Adds the specified range to what will become the new identity mappings.
- * Once all ranges have been added, the new mapping is activated by calling
- * finalize_identity_maps() below.
- */
-void add_identity_map(unsigned long start, unsigned long size)
-{
-	unsigned long end = start + size;
-
-	/* Align boundary to 2M. */
-	start = round_down(start, PMD_SIZE);
-	end = round_up(end, PMD_SIZE);
-	if (start >= end)
-		return;
-
-	/* Build the mapping. */
-	kernel_ident_mapping_init(&mapping_info, (pgd_t *)top_level_pgt,
-				  start, end);
+	/*
+	 * New page-table is set up - map the kernel image and load it
+	 * into cr3.
+	 */
+	start = (unsigned long)_head;
+	size  = _end - _head;
+	add_identity_map(start, size);
+	write_cr3(top_level_pgt);
 }
 
 /*
diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index 7c61a8c5b9cf..856dc1c9bb0d 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -903,9 +903,6 @@ void choose_random_location(unsigned long input,
 
 	boot_params->hdr.loadflags |= KASLR_FLAG;
 
-	/* Prepare to add new identity pagetables on demand. */
-	initialize_identity_maps();
-
 	/* Record the various known unsafe memory ranges. */
 	mem_avoid_init(input, input_size, *output);
 
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
