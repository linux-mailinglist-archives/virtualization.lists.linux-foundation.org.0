Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F49B21F038
	for <lists.virtualization@lfdr.de>; Tue, 14 Jul 2020 14:11:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B17F18A421;
	Tue, 14 Jul 2020 12:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PVi+kD-tjMe5; Tue, 14 Jul 2020 12:10:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AF9028A344;
	Tue, 14 Jul 2020 12:10:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0106C0733;
	Tue, 14 Jul 2020 12:10:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD670C0888
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 796908A305
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b6WgnX3WbMSh
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:10:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 915AE8A31F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:10:46 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 87F996B2;
 Tue, 14 Jul 2020 14:10:41 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v4 16/75] x86/boot/compressed/64: Don't pre-map memory in
 KASLR code
Date: Tue, 14 Jul 2020 14:08:18 +0200
Message-Id: <20200714120917.11253-17-joro@8bytes.org>
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

From: Joerg Roedel <jroedel@suse.de>

With the page-fault handler in place the identity mapping can be built
on-demand. So remove the code which manually creates the mappings and
unexport/remove the functions used for it.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/ident_map_64.c |  6 ++----
 arch/x86/boot/compressed/kaslr.c        | 24 +-----------------------
 arch/x86/boot/compressed/misc.h         | 10 ----------
 3 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/arch/x86/boot/compressed/ident_map_64.c b/arch/x86/boot/compressed/ident_map_64.c
index ecf9353b064d..c63257bf8373 100644
--- a/arch/x86/boot/compressed/ident_map_64.c
+++ b/arch/x86/boot/compressed/ident_map_64.c
@@ -87,11 +87,9 @@ phys_addr_t physical_mask = (1ULL << __PHYSICAL_MASK_SHIFT) - 1;
 static struct x86_mapping_info mapping_info;
 
 /*
- * Adds the specified range to what will become the new identity mappings.
- * Once all ranges have been added, the new mapping is activated by calling
- * finalize_identity_maps() below.
+ * Adds the specified range to the identity mappings.
  */
-void add_identity_map(unsigned long start, unsigned long size)
+static void add_identity_map(unsigned long start, unsigned long size)
 {
 	unsigned long end = start + size;
 
diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index 856dc1c9bb0d..c466fb738de0 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -399,8 +399,6 @@ static void mem_avoid_init(unsigned long input, unsigned long input_size,
 	 */
 	mem_avoid[MEM_AVOID_ZO_RANGE].start = input;
 	mem_avoid[MEM_AVOID_ZO_RANGE].size = (output + init_size) - input;
-	add_identity_map(mem_avoid[MEM_AVOID_ZO_RANGE].start,
-			 mem_avoid[MEM_AVOID_ZO_RANGE].size);
 
 	/* Avoid initrd. */
 	initrd_start  = (u64)boot_params->ext_ramdisk_image << 32;
@@ -420,14 +418,10 @@ static void mem_avoid_init(unsigned long input, unsigned long input_size,
 		;
 	mem_avoid[MEM_AVOID_CMDLINE].start = cmd_line;
 	mem_avoid[MEM_AVOID_CMDLINE].size = cmd_line_size;
-	add_identity_map(mem_avoid[MEM_AVOID_CMDLINE].start,
-			 mem_avoid[MEM_AVOID_CMDLINE].size);
 
 	/* Avoid boot parameters. */
 	mem_avoid[MEM_AVOID_BOOTPARAMS].start = (unsigned long)boot_params;
 	mem_avoid[MEM_AVOID_BOOTPARAMS].size = sizeof(*boot_params);
-	add_identity_map(mem_avoid[MEM_AVOID_BOOTPARAMS].start,
-			 mem_avoid[MEM_AVOID_BOOTPARAMS].size);
 
 	/* We don't need to set a mapping for setup_data. */
 
@@ -436,11 +430,6 @@ static void mem_avoid_init(unsigned long input, unsigned long input_size,
 
 	/* Enumerate the immovable memory regions */
 	num_immovable_mem = count_immovable_mem_regions();
-
-#ifdef CONFIG_X86_VERBOSE_BOOTUP
-	/* Make sure video RAM can be used. */
-	add_identity_map(0, PMD_SIZE);
-#endif
 }
 
 /*
@@ -919,19 +908,8 @@ void choose_random_location(unsigned long input,
 		warn("Physical KASLR disabled: no suitable memory region!");
 	} else {
 		/* Update the new physical address location. */
-		if (*output != random_addr) {
-			add_identity_map(random_addr, output_size);
+		if (*output != random_addr)
 			*output = random_addr;
-		}
-
-		/*
-		 * This loads the identity mapping page table.
-		 * This should only be done if a new physical address
-		 * is found for the kernel, otherwise we should keep
-		 * the old page table to make it be like the "nokaslr"
-		 * case.
-		 */
-		finalize_identity_maps();
 	}
 
 
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 345c90fbc500..ea6174bad699 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -98,17 +98,7 @@ static inline void choose_random_location(unsigned long input,
 #endif
 
 #ifdef CONFIG_X86_64
-void initialize_identity_maps(void);
-void add_identity_map(unsigned long start, unsigned long size);
-void finalize_identity_maps(void);
 extern unsigned char _pgtable[];
-#else
-static inline void initialize_identity_maps(void)
-{ }
-static inline void add_identity_map(unsigned long start, unsigned long size)
-{ }
-static inline void finalize_identity_maps(void)
-{ }
 #endif
 
 #ifdef CONFIG_EARLY_PRINTK
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
