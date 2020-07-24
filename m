Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5347922CAB6
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 18:15:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F387A887A8;
	Fri, 24 Jul 2020 16:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J6xYJJJFiFcs; Fri, 24 Jul 2020 16:14:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AF0B4887DF;
	Fri, 24 Jul 2020 16:14:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8609FC004C;
	Fri, 24 Jul 2020 16:14:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2201DC004E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0D14288B2F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZfTFF7+MDTy
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3102C88B52
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:14:32 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 08C20FC7;
 Fri, 24 Jul 2020 18:04:25 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v5 46/75] x86/dumpstack/64: Add noinstr version of
 get_stack_info()
Date: Fri, 24 Jul 2020 18:03:07 +0200
Message-Id: <20200724160336.5435-47-joro@8bytes.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724160336.5435-1-joro@8bytes.org>
References: <20200724160336.5435-1-joro@8bytes.org>
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

The get_stack_info functionality is needed in the entry code for the #VC
exception handler. Provide a version of it in the .text.noinstr
section which can be called safely from there.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/stacktrace.h |  2 ++
 arch/x86/kernel/dumpstack.c       |  7 +++---
 arch/x86/kernel/dumpstack_64.c    | 39 ++++++++++++++++++-------------
 arch/x86/mm/cpu_entry_area.c      |  3 ++-
 4 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/stacktrace.h b/arch/x86/include/asm/stacktrace.h
index 5ae5a68e469d..49600643faba 100644
--- a/arch/x86/include/asm/stacktrace.h
+++ b/arch/x86/include/asm/stacktrace.h
@@ -35,6 +35,8 @@ bool in_entry_stack(unsigned long *stack, struct stack_info *info);
 
 int get_stack_info(unsigned long *stack, struct task_struct *task,
 		   struct stack_info *info, unsigned long *visit_mask);
+bool get_stack_info_noinstr(unsigned long *stack, struct task_struct *task,
+			    struct stack_info *info);
 
 const char *stack_type_name(enum stack_type type);
 
diff --git a/arch/x86/kernel/dumpstack.c b/arch/x86/kernel/dumpstack.c
index 48ce44576947..74147f7b3d82 100644
--- a/arch/x86/kernel/dumpstack.c
+++ b/arch/x86/kernel/dumpstack.c
@@ -29,8 +29,8 @@ static int die_counter;
 
 static struct pt_regs exec_summary_regs;
 
-bool in_task_stack(unsigned long *stack, struct task_struct *task,
-		   struct stack_info *info)
+bool noinstr in_task_stack(unsigned long *stack, struct task_struct *task,
+			   struct stack_info *info)
 {
 	unsigned long *begin = task_stack_page(task);
 	unsigned long *end   = task_stack_page(task) + THREAD_SIZE;
@@ -46,7 +46,8 @@ bool in_task_stack(unsigned long *stack, struct task_struct *task,
 	return true;
 }
 
-bool in_entry_stack(unsigned long *stack, struct stack_info *info)
+/* Called from get_stack_info_noinstr - so must be noinstr too */
+bool noinstr in_entry_stack(unsigned long *stack, struct stack_info *info)
 {
 	struct entry_stack *ss = cpu_entry_stack(smp_processor_id());
 
diff --git a/arch/x86/kernel/dumpstack_64.c b/arch/x86/kernel/dumpstack_64.c
index c49cf594714b..5a85730eb0ca 100644
--- a/arch/x86/kernel/dumpstack_64.c
+++ b/arch/x86/kernel/dumpstack_64.c
@@ -85,7 +85,7 @@ struct estack_pages estack_pages[CEA_ESTACK_PAGES] ____cacheline_aligned = {
 	EPAGERANGE(VC2),
 };
 
-static bool in_exception_stack(unsigned long *stack, struct stack_info *info)
+static bool __always_inline in_exception_stack(unsigned long *stack, struct stack_info *info)
 {
 	unsigned long begin, end, stk = (unsigned long)stack;
 	const struct estack_pages *ep;
@@ -126,7 +126,7 @@ static bool in_exception_stack(unsigned long *stack, struct stack_info *info)
 	return true;
 }
 
-static bool in_irq_stack(unsigned long *stack, struct stack_info *info)
+static bool __always_inline in_irq_stack(unsigned long *stack, struct stack_info *info)
 {
 	unsigned long *end   = (unsigned long *)this_cpu_read(hardirq_stack_ptr);
 	unsigned long *begin = end - (IRQ_STACK_SIZE / sizeof(long));
@@ -151,32 +151,38 @@ static bool in_irq_stack(unsigned long *stack, struct stack_info *info)
 	return true;
 }
 
-int get_stack_info(unsigned long *stack, struct task_struct *task,
-		   struct stack_info *info, unsigned long *visit_mask)
+bool noinstr get_stack_info_noinstr(unsigned long *stack, struct task_struct *task,
+				    struct stack_info *info)
 {
-	if (!stack)
-		goto unknown;
-
-	task = task ? : current;
-
 	if (in_task_stack(stack, task, info))
-		goto recursion_check;
+		return true;
 
 	if (task != current)
-		goto unknown;
+		return false;
 
 	if (in_exception_stack(stack, info))
-		goto recursion_check;
+		return true;
 
 	if (in_irq_stack(stack, info))
-		goto recursion_check;
+		return true;
 
 	if (in_entry_stack(stack, info))
-		goto recursion_check;
+		return true;
 
-	goto unknown;
+	return false;
+}
+
+int get_stack_info(unsigned long *stack, struct task_struct *task,
+		   struct stack_info *info, unsigned long *visit_mask)
+{
+	task = task ? : current;
+
+	if (!stack)
+		goto unknown;
+
+	if (!get_stack_info_noinstr(stack, task, info))
+		goto unknown;
 
-recursion_check:
 	/*
 	 * Make sure we don't iterate through any given stack more than once.
 	 * If it comes up a second time then there's something wrong going on:
@@ -196,4 +202,5 @@ int get_stack_info(unsigned long *stack, struct task_struct *task,
 unknown:
 	info->type = STACK_TYPE_UNKNOWN;
 	return -EINVAL;
+
 }
diff --git a/arch/x86/mm/cpu_entry_area.c b/arch/x86/mm/cpu_entry_area.c
index 770b613790b3..f5e1e60c9095 100644
--- a/arch/x86/mm/cpu_entry_area.c
+++ b/arch/x86/mm/cpu_entry_area.c
@@ -21,7 +21,8 @@ DEFINE_PER_CPU(struct cea_exception_stacks*, cea_exception_stacks);
 DECLARE_PER_CPU_PAGE_ALIGNED(struct doublefault_stack, doublefault_stack);
 #endif
 
-struct cpu_entry_area *get_cpu_entry_area(int cpu)
+/* Is called from entry code, so must be noinstr */
+noinstr struct cpu_entry_area *get_cpu_entry_area(int cpu)
 {
 	unsigned long va = CPU_ENTRY_AREA_PER_CPU + cpu * CPU_ENTRY_AREA_SIZE;
 	BUILD_BUG_ON(sizeof(struct cpu_entry_area) % PAGE_SIZE != 0);
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
