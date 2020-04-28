Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F711BC396
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 17:27:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 138F522846;
	Tue, 28 Apr 2020 15:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkGwDz4TjBmC; Tue, 28 Apr 2020 15:27:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9DBBD22EE7;
	Tue, 28 Apr 2020 15:26:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94708C088B;
	Tue, 28 Apr 2020 15:26:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6747C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D015F88192
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ih6OIEwsAETb
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8A91F8829D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:41 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id DBEACF2C; Tue, 28 Apr 2020 17:17:50 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 46/75] x86/sev-es: Shift #VC IST Stack in
 nmi_enter()/nmi_exit()
Date: Tue, 28 Apr 2020 17:16:56 +0200
Message-Id: <20200428151725.31091-47-joro@8bytes.org>
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

When an NMI hits in the #VC handler entry code before it shifted its IST
entry, then any subsequent #VC exception in the NMI code-path will
overwrite the interrupted #VC handlers stack.

Make sure this doesn't happen by  explicitly shifting the #VC IST entry
in the NMI handler for the time in can cause #VC exceptions.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/hardirq.h   | 14 ++++++++++++++
 arch/x86/include/asm/sev-es.h    |  2 ++
 arch/x86/kernel/asm-offsets_64.c |  1 +
 arch/x86/kernel/nmi.c            |  1 +
 arch/x86/kernel/sev-es.c         | 21 +++++++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/arch/x86/include/asm/hardirq.h b/arch/x86/include/asm/hardirq.h
index 07533795b8d2..4920556dcbf8 100644
--- a/arch/x86/include/asm/hardirq.h
+++ b/arch/x86/include/asm/hardirq.h
@@ -80,4 +80,18 @@ static inline bool kvm_get_cpu_l1tf_flush_l1d(void)
 static inline void kvm_set_cpu_l1tf_flush_l1d(void) { }
 #endif /* IS_ENABLED(CONFIG_KVM_INTEL) */
 
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+
+#define arch_nmi_enter()		\
+	do {				\
+		sev_es_nmi_enter();	\
+	} while (0)
+
+#define arch_nmi_exit()			\
+	do {				\
+		sev_es_nmi_exit();	\
+	} while (0)
+
+#endif
+
 #endif /* _ASM_X86_HARDIRQ_H */
diff --git a/arch/x86/include/asm/sev-es.h b/arch/x86/include/asm/sev-es.h
index 265da8351475..ca0e12cb089c 100644
--- a/arch/x86/include/asm/sev-es.h
+++ b/arch/x86/include/asm/sev-es.h
@@ -82,6 +82,8 @@ enum stack_type;
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 const char *vc_stack_name(enum stack_type type);
+void sev_es_nmi_enter(void);
+void sev_es_nmi_exit(void);
 #else /* CONFIG_AMD_MEM_ENCRYPT */
 static inline const char *vc_stack_name(enum stack_type type)
 {
diff --git a/arch/x86/kernel/asm-offsets_64.c b/arch/x86/kernel/asm-offsets_64.c
index c2a47016f243..b8b57faed147 100644
--- a/arch/x86/kernel/asm-offsets_64.c
+++ b/arch/x86/kernel/asm-offsets_64.c
@@ -60,6 +60,7 @@ int main(void)
 	OFFSET(TSS_ist, tss_struct, x86_tss.ist);
 	DEFINE(DB_STACK_OFFSET, offsetof(struct cea_exception_stacks, DB_stack) -
 	       offsetof(struct cea_exception_stacks, DB1_stack));
+	DEFINE(VC_STACK_OFFSET, sizeof(((struct cea_vmm_exception_stacks *)0)->stacks[0]));
 	BLANK();
 
 #ifdef CONFIG_STACKPROTECTOR
diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 6407ea21fa1b..27d1016ec840 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -37,6 +37,7 @@
 #include <asm/reboot.h>
 #include <asm/cache.h>
 #include <asm/nospec-branch.h>
+#include <asm/sev-es.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/nmi.h>
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index dd60d24db3d0..a4fa7f351bf2 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/mm.h>
 
+#include <generated/asm-offsets.h>
 #include <asm/cpu_entry_area.h>
 #include <asm/stacktrace.h>
 #include <asm/trap_defs.h>
@@ -49,6 +50,26 @@ struct sev_es_runtime_data {
 
 static DEFINE_PER_CPU(struct sev_es_runtime_data*, runtime_data);
 
+/*
+ * Shift/Unshift the IST entry for the #VC handler during
+ * nmi_enter()/nmi_exit().  This is needed when an NMI hits in the #VC handlers
+ * entry code before it has shifted its IST entry. This way #VC exceptions
+ * caused by the NMI handler are guaranteed to use a new stack.
+ */
+void sev_es_nmi_enter(void)
+{
+	struct tss_struct *tss = this_cpu_ptr(&cpu_tss_rw);
+
+	tss->x86_tss.ist[IST_INDEX_VC] -= VC_STACK_OFFSET;
+}
+
+void sev_es_nmi_exit(void)
+{
+	struct tss_struct *tss = this_cpu_ptr(&cpu_tss_rw);
+
+	tss->x86_tss.ist[IST_INDEX_VC] += VC_STACK_OFFSET;
+}
+
 /* Needed in vc_early_vc_forward_exception */
 void do_early_exception(struct pt_regs *regs, int trapnr);
 
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
