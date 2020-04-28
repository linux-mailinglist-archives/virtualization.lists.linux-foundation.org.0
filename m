Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ED81BC375
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 17:26:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79B17849CD;
	Tue, 28 Apr 2020 15:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8jY8bytWUUeD; Tue, 28 Apr 2020 15:26:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B2D8384B62;
	Tue, 28 Apr 2020 15:26:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3F37C0172;
	Tue, 28 Apr 2020 15:26:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB740C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D06BC20442
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQVPPBlQFRcA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 7E0BD20400
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:36 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 944B6F43; Tue, 28 Apr 2020 17:17:54 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 64/75] x86/sev-es: Cache CPUID results for improved
 performance
Date: Tue, 28 Apr 2020 17:17:14 +0200
Message-Id: <20200428151725.31091-65-joro@8bytes.org>
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

From: Mike Stunes <mstunes@vmware.com>

To avoid a future VMEXIT for a subsequent CPUID function, cache the
results returned by CPUID into an xarray.

 [tl: coding standard changes, register zero extension]

Signed-off-by: Mike Stunes <mstunes@vmware.com>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
[ jroedel@suse.de: - Wrapped cache handling into vc_handle_cpuid_cached()
                   - Used lower_32_bits() where applicable
		   - Moved cache_index out of struct es_em_ctxt ]
Co-developed-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-es-shared.c |  12 ++--
 arch/x86/kernel/sev-es.c        | 119 +++++++++++++++++++++++++++++++-
 2 files changed, 124 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/sev-es-shared.c b/arch/x86/kernel/sev-es-shared.c
index 5bfc1f3030d4..cfdafe12da4f 100644
--- a/arch/x86/kernel/sev-es-shared.c
+++ b/arch/x86/kernel/sev-es-shared.c
@@ -427,8 +427,8 @@ static enum es_result vc_handle_cpuid(struct ghcb *ghcb,
 	u32 cr4 = native_read_cr4();
 	enum es_result ret;
 
-	ghcb_set_rax(ghcb, regs->ax);
-	ghcb_set_rcx(ghcb, regs->cx);
+	ghcb_set_rax(ghcb, lower_32_bits(regs->ax));
+	ghcb_set_rcx(ghcb, lower_32_bits(regs->cx));
 
 	if (cr4 & X86_CR4_OSXSAVE)
 		/* Safe to read xcr0 */
@@ -447,10 +447,10 @@ static enum es_result vc_handle_cpuid(struct ghcb *ghcb,
 	      ghcb_is_valid_rdx(ghcb)))
 		return ES_VMM_ERROR;
 
-	regs->ax = ghcb->save.rax;
-	regs->bx = ghcb->save.rbx;
-	regs->cx = ghcb->save.rcx;
-	regs->dx = ghcb->save.rdx;
+	regs->ax = lower_32_bits(ghcb->save.rax);
+	regs->bx = lower_32_bits(ghcb->save.rbx);
+	regs->cx = lower_32_bits(ghcb->save.rcx);
+	regs->dx = lower_32_bits(ghcb->save.rdx);
 
 	return ES_OK;
 }
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 03095bc7b563..0303834d4811 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -19,6 +19,7 @@
 #include <linux/memblock.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/xarray.h>
 
 #include <generated/asm-offsets.h>
 #include <asm/cpu_entry_area.h>
@@ -33,6 +34,16 @@
 
 #define DR7_RESET_VALUE        0x400
 
+struct sev_es_cpuid_cache_entry {
+	unsigned long eax;
+	unsigned long ebx;
+	unsigned long ecx;
+	unsigned long edx;
+};
+
+static struct xarray sev_es_cpuid_cache;
+static bool __ro_after_init sev_es_cpuid_cache_initialized;
+
 /* For early boot hypervisor communication in SEV-ES enabled guests */
 static struct ghcb boot_ghcb_page __bss_decrypted __aligned(PAGE_SIZE);
 
@@ -463,6 +474,9 @@ void __init sev_es_init_vc_handling(void)
 		sev_es_setup_vc_stack(cpu);
 	}
 
+	xa_init_flags(&sev_es_cpuid_cache, XA_FLAGS_LOCK_IRQ);
+	sev_es_cpuid_cache_initialized = true;
+
 	init_vc_stack_names();
 }
 
@@ -744,6 +758,91 @@ static enum es_result vc_handle_mmio(struct ghcb *ghcb,
 	return ret;
 }
 
+static unsigned long sev_es_get_cpuid_cache_index(struct es_em_ctxt *ctxt)
+{
+	unsigned long hi, lo;
+
+	/* Don't attempt to cache until the xarray is initialized */
+	if (!sev_es_cpuid_cache_initialized)
+		return ULONG_MAX;
+
+	lo = lower_32_bits(ctxt->regs->ax);
+
+	/*
+	 * CPUID 0x0000000d requires both RCX and XCR0, so it can't be
+	 * cached.
+	 */
+	if (lo == 0x0000000d)
+		return ULONG_MAX;
+
+	/*
+	 * Some callers of CPUID don't always set RCX to zero for CPUID
+	 * functions that don't require RCX, which can result in excessive
+	 * cached values, so RCX needs to be manually zeroed for use as part
+	 * of the cache index. Future CPUID values may need RCX, but since
+	 * they can't be known, they must not be cached.
+	 */
+	if (lo > 0x80000020)
+		return ULONG_MAX;
+
+	switch (lo) {
+	case 0x00000007:
+	case 0x0000000b:
+	case 0x0000000f:
+	case 0x00000010:
+	case 0x8000001d:
+	case 0x80000020:
+		hi = ctxt->regs->cx << 32;
+		break;
+	default:
+		hi = 0;
+	}
+
+	return hi | lo;
+}
+
+static bool sev_es_check_cpuid_cache(struct es_em_ctxt *ctxt,
+				     unsigned long cache_index)
+{
+	struct sev_es_cpuid_cache_entry *cache_entry;
+
+	if (cache_index == ULONG_MAX)
+		return false;
+
+	cache_entry = xa_load(&sev_es_cpuid_cache, cache_index);
+	if (!cache_entry)
+		return false;
+
+	ctxt->regs->ax = cache_entry->eax;
+	ctxt->regs->bx = cache_entry->ebx;
+	ctxt->regs->cx = cache_entry->ecx;
+	ctxt->regs->dx = cache_entry->edx;
+
+	return true;
+}
+
+static void sev_es_add_cpuid_cache(struct es_em_ctxt *ctxt,
+				   unsigned long cache_index)
+{
+	struct sev_es_cpuid_cache_entry *cache_entry;
+	int ret;
+
+	if (cache_index == ULONG_MAX)
+		return;
+
+	cache_entry = kzalloc(sizeof(*cache_entry), GFP_ATOMIC);
+	if (cache_entry) {
+		cache_entry->eax = ctxt->regs->ax;
+		cache_entry->ebx = ctxt->regs->bx;
+		cache_entry->ecx = ctxt->regs->cx;
+		cache_entry->edx = ctxt->regs->dx;
+
+		/* Ignore insertion errors */
+		ret = xa_insert(&sev_es_cpuid_cache, cache_index,
+				cache_entry, GFP_ATOMIC);
+	}
+}
+
 static enum es_result vc_handle_dr7_write(struct ghcb *ghcb,
 					  struct es_em_ctxt *ctxt)
 {
@@ -895,6 +994,24 @@ static enum es_result vc_handle_trap_db(struct ghcb *ghcb,
 	return ES_EXCEPTION;
 }
 
+static enum es_result vc_handle_cpuid_cached(struct ghcb *ghcb,
+					     struct es_em_ctxt *ctxt)
+{
+	unsigned long cache_index;
+	enum es_result result;
+
+	cache_index = sev_es_get_cpuid_cache_index(ctxt);
+
+	if (sev_es_check_cpuid_cache(ctxt, cache_index))
+		return ES_OK;
+
+	result = vc_handle_cpuid(ghcb, ctxt);
+	if (result == ES_OK)
+		sev_es_add_cpuid_cache(ctxt, cache_index);
+
+	return result;
+}
+
 static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
 					 struct ghcb *ghcb,
 					 unsigned long exit_code)
@@ -926,7 +1043,7 @@ static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
 		result = ES_UNSUPPORTED;
 		break;
 	case SVM_EXIT_CPUID:
-		result = vc_handle_cpuid(ghcb, ctxt);
+		result = vc_handle_cpuid_cached(ghcb, ctxt);
 		break;
 	case SVM_EXIT_IOIO:
 		result = vc_handle_ioio(ghcb, ctxt);
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
