Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB641BC378
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 17:26:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 931F9849DF;
	Tue, 28 Apr 2020 15:26:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ijz3e4NawxjU; Tue, 28 Apr 2020 15:26:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5C63C85450;
	Tue, 28 Apr 2020 15:26:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4658CC0863;
	Tue, 28 Apr 2020 15:26:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 477E9C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2E6ED22803
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XJ16Y30Gw4Eo
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id CDC1E203F6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:26:37 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id AD077F22; Tue, 28 Apr 2020 17:17:50 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 45/75] x86/dumpstack/64: Handle #VC exception stacks
Date: Tue, 28 Apr 2020 17:16:55 +0200
Message-Id: <20200428151725.31091-46-joro@8bytes.org>
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

Make the stack unwinder aware of the IST stacks for the #VC exception
handler.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/cpu_entry_area.h |  1 +
 arch/x86/include/asm/sev-es.h         | 13 ++++++++
 arch/x86/include/asm/stacktrace.h     |  4 +++
 arch/x86/kernel/dumpstack_64.c        | 47 +++++++++++++++++++++++++++
 arch/x86/kernel/sev-es.c              | 26 +++++++++++++++
 5 files changed, 91 insertions(+)

diff --git a/arch/x86/include/asm/cpu_entry_area.h b/arch/x86/include/asm/cpu_entry_area.h
index 85aac6c63653..e4216caad01a 100644
--- a/arch/x86/include/asm/cpu_entry_area.h
+++ b/arch/x86/include/asm/cpu_entry_area.h
@@ -192,6 +192,7 @@ struct cpu_entry_area {
 
 DECLARE_PER_CPU(struct cpu_entry_area *, cpu_entry_area);
 DECLARE_PER_CPU(struct cea_exception_stacks *, cea_exception_stacks);
+DECLARE_PER_CPU(struct cea_vmm_exception_stacks *, cea_vmm_exception_stacks);
 
 extern void setup_cpu_entry_areas(void);
 extern void cea_set_pte(void *cea_vaddr, phys_addr_t pa, pgprot_t flags);
diff --git a/arch/x86/include/asm/sev-es.h b/arch/x86/include/asm/sev-es.h
index e1ed963a57ec..265da8351475 100644
--- a/arch/x86/include/asm/sev-es.h
+++ b/arch/x86/include/asm/sev-es.h
@@ -9,6 +9,8 @@
 #define __ASM_ENCRYPTED_STATE_H
 
 #include <linux/types.h>
+
+#include <asm/stacktrace.h>
 #include <asm/insn.h>
 
 #define GHCB_SEV_INFO		0x001UL
@@ -76,4 +78,15 @@ static inline u64 lower_bits(u64 val, unsigned int bits)
 extern void vc_no_ghcb(void);
 extern bool vc_boot_ghcb(struct pt_regs *regs);
 
+enum stack_type;
+
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+const char *vc_stack_name(enum stack_type type);
+#else /* CONFIG_AMD_MEM_ENCRYPT */
+static inline const char *vc_stack_name(enum stack_type type)
+{
+	return NULL;
+}
+#endif /* CONFIG_AMD_MEM_ENCRYPT*/
+
 #endif
diff --git a/arch/x86/include/asm/stacktrace.h b/arch/x86/include/asm/stacktrace.h
index 14db05086bbf..2f3534ef4b5f 100644
--- a/arch/x86/include/asm/stacktrace.h
+++ b/arch/x86/include/asm/stacktrace.h
@@ -21,6 +21,10 @@ enum stack_type {
 	STACK_TYPE_ENTRY,
 	STACK_TYPE_EXCEPTION,
 	STACK_TYPE_EXCEPTION_LAST = STACK_TYPE_EXCEPTION + N_EXCEPTION_STACKS-1,
+#ifdef CONFIG_X86_64
+	STACK_TYPE_VC,
+	STACK_TYPE_VC_LAST = STACK_TYPE_VC + N_VC_STACKS - 1,
+#endif
 };
 
 struct stack_info {
diff --git a/arch/x86/kernel/dumpstack_64.c b/arch/x86/kernel/dumpstack_64.c
index 87b97897a881..2468963c1424 100644
--- a/arch/x86/kernel/dumpstack_64.c
+++ b/arch/x86/kernel/dumpstack_64.c
@@ -18,6 +18,7 @@
 
 #include <asm/cpu_entry_area.h>
 #include <asm/stacktrace.h>
+#include <asm/sev-es.h>
 
 static const char * const exception_stack_names[] = {
 		[ ESTACK_DF	]	= "#DF",
@@ -47,6 +48,9 @@ const char *stack_type_name(enum stack_type type)
 	if (type >= STACK_TYPE_EXCEPTION && type <= STACK_TYPE_EXCEPTION_LAST)
 		return exception_stack_names[type - STACK_TYPE_EXCEPTION];
 
+	if (type >= STACK_TYPE_VC && type <= STACK_TYPE_VC_LAST)
+		return vc_stack_name(type);
+
 	return NULL;
 }
 
@@ -84,6 +88,46 @@ struct estack_pages estack_pages[CEA_ESTACK_PAGES] ____cacheline_aligned = {
 	EPAGERANGE(MCE),
 };
 
+static bool in_vc_exception_stack(unsigned long *stack, struct stack_info *info)
+{
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+	unsigned long begin, end, stk = (unsigned long)stack;
+	struct cea_vmm_exception_stacks *vc_stacks;
+	struct pt_regs *regs;
+	enum stack_type type;
+	int i;
+
+	vc_stacks = __this_cpu_read(cea_vmm_exception_stacks);
+
+	/* Already initialized? */
+	if (!vc_stacks)
+		return false;
+
+	for (i = 0; i < N_VC_STACKS; i++) {
+		type  = STACK_TYPE_VC_LAST - i;
+		begin = (unsigned long)vc_stacks->stacks[i].stack;
+		end   = begin + sizeof(vc_stacks->stacks[i].stack);
+
+		if (stk >= begin && stk < end)
+			goto found;
+	}
+
+	return false;
+
+found:
+
+	regs		= (struct pt_regs *)end - 1;
+	info->type	= type;
+	info->begin	= (unsigned long *)begin;
+	info->end	= (unsigned long *)end;
+	info->next_sp	= (unsigned long *)regs->sp;
+
+	return true;
+#else
+	return false;
+#endif
+}
+
 static bool in_exception_stack(unsigned long *stack, struct stack_info *info)
 {
 	unsigned long begin, end, stk = (unsigned long)stack;
@@ -173,6 +217,9 @@ int get_stack_info(unsigned long *stack, struct task_struct *task,
 	if (in_entry_stack(stack, info))
 		goto recursion_check;
 
+	if (in_vc_exception_stack(stack, info))
+		goto recursion_check;
+
 	goto unknown;
 
 recursion_check:
diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index e5d87f2af357..dd60d24db3d0 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -18,6 +18,7 @@
 #include <linux/mm.h>
 
 #include <asm/cpu_entry_area.h>
+#include <asm/stacktrace.h>
 #include <asm/trap_defs.h>
 #include <asm/sev-es.h>
 #include <asm/insn-eval.h>
@@ -34,6 +35,9 @@ static struct ghcb boot_ghcb_page __bss_decrypted __aligned(PAGE_SIZE);
  * cleared
  */
 static struct ghcb __initdata *boot_ghcb;
+DEFINE_PER_CPU(struct cea_vmm_exception_stacks *, cea_vmm_exception_stacks);
+
+static char vc_stack_names[N_VC_STACKS][8];
 
 /* #VC handler runtime per-cpu data */
 struct sev_es_runtime_data {
@@ -240,6 +244,16 @@ static void __init sev_es_init_ghcb(int cpu)
 	memset(&data->ghcb_page, 0, sizeof(data->ghcb_page));
 }
 
+static void __init init_vc_stack_names(void)
+{
+	int i;
+
+	for (i = 0; i < N_VC_STACKS; i++) {
+		snprintf(vc_stack_names[i], sizeof(vc_stack_names[i]),
+			 "#VC%d", i);
+	}
+}
+
 static void __init sev_es_setup_vc_stack(int cpu)
 {
 	struct vmm_exception_stacks *stack;
@@ -272,6 +286,8 @@ static void __init sev_es_setup_vc_stack(int cpu)
 	tss         = per_cpu_ptr(&cpu_tss_rw, cpu);
 
 	tss->x86_tss.ist[IST_INDEX_VC] = (unsigned long)first_stack + size;
+
+	per_cpu(cea_vmm_exception_stacks, cpu) = &cea->vc_stacks;
 }
 
 void __init sev_es_init_vc_handling(void)
@@ -290,6 +306,16 @@ void __init sev_es_init_vc_handling(void)
 		sev_es_init_ghcb(cpu);
 		sev_es_setup_vc_stack(cpu);
 	}
+
+	init_vc_stack_names();
+}
+
+const char *vc_stack_name(enum stack_type type)
+{
+	if (type < STACK_TYPE_VC || type > STACK_TYPE_VC_LAST)
+		return NULL;
+
+	return vc_stack_names[type - STACK_TYPE_VC];
 }
 
 static void __init vc_early_vc_forward_exception(struct es_em_ctxt *ctxt)
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
