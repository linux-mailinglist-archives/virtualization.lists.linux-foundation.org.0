Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C751BC2CA
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 17:18:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4FEAE87594;
	Tue, 28 Apr 2020 15:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c2HBg7rgOhTz; Tue, 28 Apr 2020 15:18:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6394F87657;
	Tue, 28 Apr 2020 15:18:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 496C1C0172;
	Tue, 28 Apr 2020 15:18:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3E4CC0863
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E1C3A875F0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gu78H4iRUUrp
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C97778761E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:18:01 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 93203F02; Tue, 28 Apr 2020 17:17:46 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 24/75] x86/boot/compressed/64: Unmap GHCB page before
 booting the kernel
Date: Tue, 28 Apr 2020 17:16:34 +0200
Message-Id: <20200428151725.31091-25-joro@8bytes.org>
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

Force a page-fault on any further accesses to the GHCB page when they
shouldn't happen anymore. This will catch the bugs where a #VC exception
is raised when no one is expected anymore.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/ident_map_64.c | 23 +++++++++++++++++++----
 arch/x86/boot/compressed/misc.h         |  6 ++++++
 arch/x86/boot/compressed/sev-es.c       | 14 ++++++++++++++
 3 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/arch/x86/boot/compressed/ident_map_64.c b/arch/x86/boot/compressed/ident_map_64.c
index bb68e9c9d87a..d3771d455249 100644
--- a/arch/x86/boot/compressed/ident_map_64.c
+++ b/arch/x86/boot/compressed/ident_map_64.c
@@ -291,10 +291,21 @@ int set_page_encrypted(unsigned long address)
 	return set_clr_page_flags(&mapping_info, address, _PAGE_ENC, 0);
 }
 
+int set_page_non_present(unsigned long address)
+{
+	return set_clr_page_flags(&mapping_info, address, 0, _PAGE_PRESENT);
+}
+
 void do_boot_page_fault(struct pt_regs *regs, unsigned long error_code)
 {
-	unsigned long address = native_read_cr2() & PMD_MASK;
-	unsigned long end = address + PMD_SIZE;
+	unsigned long address = native_read_cr2();
+	unsigned long end;
+	bool ghcb_fault;
+
+	ghcb_fault = sev_es_check_ghcb_fault(address);
+
+	address   &= PMD_MASK;
+	end        = address + PMD_SIZE;
 
 	/*
 	 * Check for unexpected error codes. Unexpected are:
@@ -302,9 +313,13 @@ void do_boot_page_fault(struct pt_regs *regs, unsigned long error_code)
 	 *	- User faults
 	 *	- Reserved bits set
 	 */
-	if (error_code & (X86_PF_PROT | X86_PF_USER | X86_PF_RSVD)) {
+	if (ghcb_fault ||
+	    error_code & (X86_PF_PROT | X86_PF_USER | X86_PF_RSVD)) {
 		/* Print some information for debugging */
-		error_putstr("Unexpected page-fault:");
+		if (ghcb_fault)
+			error_putstr("Page-fault on GHCB page:");
+		else
+			error_putstr("Unexpected page-fault:");
 		error_putstr("\nError Code: ");
 		error_puthex(error_code);
 		error_putstr("\nCR2: 0x");
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 4d37a28370ed..2e5f82acc122 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -100,6 +100,7 @@ static inline void choose_random_location(unsigned long input,
 #ifdef CONFIG_X86_64
 extern int set_page_decrypted(unsigned long address);
 extern int set_page_encrypted(unsigned long address);
+extern int set_page_non_present(unsigned long address);
 extern unsigned char _pgtable[];
 #endif
 
@@ -117,8 +118,13 @@ void set_sev_encryption_mask(void);
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 void sev_es_shutdown_ghcb(void);
+extern bool sev_es_check_ghcb_fault(unsigned long address);
 #else
 static inline void sev_es_shutdown_ghcb(void) { }
+static inline bool sev_es_check_ghcb_fault(unsigned long address)
+{
+	return false;
+}
 #endif
 
 /* acpi.c */
diff --git a/arch/x86/boot/compressed/sev-es.c b/arch/x86/boot/compressed/sev-es.c
index 940d72571fc9..1241697dd156 100644
--- a/arch/x86/boot/compressed/sev-es.c
+++ b/arch/x86/boot/compressed/sev-es.c
@@ -120,6 +120,20 @@ void sev_es_shutdown_ghcb(void)
 	 */
 	if (set_page_encrypted((unsigned long)&boot_ghcb_page))
 		error("Can't map GHCB page encrypted");
+
+	/*
+	 * GHCB page is mapped encrypted again and flushed from the cache.
+	 * Mark it non-present now to catch bugs when #VC exceptions trigger
+	 * after this point.
+	 */
+	if (set_page_non_present((unsigned long)&boot_ghcb_page))
+		error("Can't unmap GHCB page");
+}
+
+bool sev_es_check_ghcb_fault(unsigned long address)
+{
+	/* Check whether the fault was on the GHCB page */
+	return ((address & PAGE_MASK) == (unsigned long)&boot_ghcb_page);
 }
 
 void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
