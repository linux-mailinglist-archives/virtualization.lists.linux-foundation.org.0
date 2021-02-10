Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A1431639E
	for <lists.virtualization@lfdr.de>; Wed, 10 Feb 2021 11:22:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D32D386090;
	Wed, 10 Feb 2021 10:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oIHBDh_FObuJ; Wed, 10 Feb 2021 10:22:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C2E1285E98;
	Wed, 10 Feb 2021 10:22:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E15BC013A;
	Wed, 10 Feb 2021 10:22:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3258C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 10:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B1F9D8554A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 10:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tp4MsH_AkIMC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 10:22:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1253A85550
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 10:22:00 +0000 (UTC)
Received: from cap.home.8bytes.org (p549adcf6.dip0.t-ipconnect.de
 [84.154.220.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 720283A7;
 Wed, 10 Feb 2021 11:21:55 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 1/7] x86/boot/compressed/64: Cleanup exception handling before
 booting kernel
Date: Wed, 10 Feb 2021 11:21:29 +0100
Message-Id: <20210210102135.30667-2-joro@8bytes.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210210102135.30667-1-joro@8bytes.org>
References: <20210210102135.30667-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

Disable the exception handling before booting the kernel to make sure
any exceptions that happen during early kernel boot are not directed to
the pre-decompression code.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/boot/compressed/idt_64.c | 14 ++++++++++++++
 arch/x86/boot/compressed/misc.c   |  7 ++-----
 arch/x86/boot/compressed/misc.h   |  6 ++++++
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/x86/boot/compressed/idt_64.c b/arch/x86/boot/compressed/idt_64.c
index 804a502ee0d2..9b93567d663a 100644
--- a/arch/x86/boot/compressed/idt_64.c
+++ b/arch/x86/boot/compressed/idt_64.c
@@ -52,3 +52,17 @@ void load_stage2_idt(void)
 
 	load_boot_idt(&boot_idt_desc);
 }
+
+void cleanup_exception_handling(void)
+{
+	/*
+	 * Flush GHCB from cache and map it encrypted again when running as
+	 * SEV-ES guest.
+	 */
+	sev_es_shutdown_ghcb();
+
+	/* Set a null-idt, disabling #PF and #VC handling */
+	boot_idt_desc.size    = 0;
+	boot_idt_desc.address = 0;
+	load_boot_idt(&boot_idt_desc);
+}
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index 267e7f93050e..cc9fd0e8766a 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -443,11 +443,8 @@ asmlinkage __visible void *extract_kernel(void *rmode, memptr heap,
 	handle_relocations(output, output_len, virt_addr);
 	debug_putstr("done.\nBooting the kernel.\n");
 
-	/*
-	 * Flush GHCB from cache and map it encrypted again when running as
-	 * SEV-ES guest.
-	 */
-	sev_es_shutdown_ghcb();
+	/* Disable exception handling before booting the kernel */
+	cleanup_exception_handling();
 
 	return output;
 }
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 901ea5ebec22..e5612f035498 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -155,6 +155,12 @@ extern pteval_t __default_kernel_pte_mask;
 extern gate_desc boot_idt[BOOT_IDT_ENTRIES];
 extern struct desc_ptr boot_idt_desc;
 
+#ifdef CONFIG_X86_64
+void cleanup_exception_handling(void);
+#else
+static inline void cleanup_exception_handling(void) { }
+#endif
+
 /* IDT Entry Points */
 void boot_page_fault(void);
 void boot_stage1_vc(void);
-- 
2.30.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
