Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A72D16D815
	for <lists.virtualization@lfdr.de>; Fri, 19 Jul 2019 03:00:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8E4741F04;
	Fri, 19 Jul 2019 00:59:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1C0CF1C81
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 00:59:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E3CE089C
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 00:59:04 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id s1so7350848pgr.2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 17:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=z7W4PDkWeXaZPrNUK/c+i+vfjf2MjCOK5AU8zvB9S68=;
	b=CS8TnzD+Hi+Bjji0YtcbQKQU8uqdm8AuQOfZ550/+ggBQ3kb1fzWOW9W6dfypuoQaT
	uIjdlQ7OeTH8B+QQo2HiGNhA+AzCWYBBDjuEZsk7ib6fVo0RZz04l8E0LsEXFG2tdRv4
	cV5pljEnL0R6qtPA7j/hiyYqH1tCgHBZKBSJFiRDopYexpFx/LJ3uBZoPjRjEsKkfs1T
	1r1JOkOQchv4Gq/MOhKGbmKMg92gatZfM8MIK/uPgUxUo/JOBZkJdsTedbe0/uFnM3jI
	CH1Q9rDaba4HlfIQJsYZTjnY0vJQt8TvAXbpRzP9MrsaKLlTFHCLrvJR0YT6YEJuBiEt
	h8LQ==
X-Gm-Message-State: APjAAAWZOiYa1Y2SdsJ3bnURyjQ05CHh+pLR107mnLwCwESe0adk1m2u
	Blj4YJAS+bYh0e8ZS4sEmNA=
X-Google-Smtp-Source: APXvYqxNQ0/uVeaBzcrQoRXrm7ObjvZMyoE1Ndm/375Wyb17fCmZyR76u8EhnAcUCW/z5bktSF56tQ==
X-Received: by 2002:a63:bd0a:: with SMTP id a10mr50136769pgf.55.1563497944208; 
	Thu, 18 Jul 2019 17:59:04 -0700 (PDT)
Received: from htb-2n-eng-dhcp405.eng.vmware.com ([66.170.99.1])
	by smtp.gmail.com with ESMTPSA id
	j128sm14025166pfg.28.2019.07.18.17.59.02
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 17:59:03 -0700 (PDT)
To: Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH v3 4/9] x86/mm/tlb: Flush remote and local TLBs concurrently
Date: Thu, 18 Jul 2019 17:58:32 -0700
Message-Id: <20190719005837.4150-5-namit@vmware.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719005837.4150-1-namit@vmware.com>
References: <20190719005837.4150-1-namit@vmware.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
	linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Haiyang Zhang <haiyangz@microsoft.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Ingo Molnar <mingo@redhat.com>, Nadav Amit <namit@vmware.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: Nadav Amit via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Nadav Amit <namit@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

To improve TLB shootdown performance, flush the remote and local TLBs
concurrently. Introduce flush_tlb_multi() that does so. Introduce
paravirtual versions of flush_tlb_multi() for KVM, Xen and hyper-v (Xen
and hyper-v are only compile-tested).

While the updated smp infrastructure is capable of running a function on
a single local core, it is not optimized for this case. The multiple
function calls and the indirect branch introduce some overhead, and
might make local TLB flushes slower than they were before the recent
changes.

Before calling the SMP infrastructure, check if only a local TLB flush
is needed to restore the lost performance in this common case. This
requires to check mm_cpumask() one more time, but unless this mask is
updated very frequently, this should impact performance negatively.

Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Sasha Levin <sashal@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: linux-hyperv@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org
Cc: kvm@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Nadav Amit <namit@vmware.com>
---
 arch/x86/hyperv/mmu.c                 | 10 +++---
 arch/x86/include/asm/paravirt.h       |  6 ++--
 arch/x86/include/asm/paravirt_types.h |  4 +--
 arch/x86/include/asm/tlbflush.h       |  8 ++---
 arch/x86/include/asm/trace/hyperv.h   |  2 +-
 arch/x86/kernel/kvm.c                 | 11 +++++--
 arch/x86/kernel/paravirt.c            |  2 +-
 arch/x86/mm/tlb.c                     | 47 ++++++++++++++++++---------
 arch/x86/xen/mmu_pv.c                 | 11 +++----
 include/trace/events/xen.h            |  2 +-
 10 files changed, 62 insertions(+), 41 deletions(-)

diff --git a/arch/x86/hyperv/mmu.c b/arch/x86/hyperv/mmu.c
index e65d7fe6489f..8740d8b21db3 100644
--- a/arch/x86/hyperv/mmu.c
+++ b/arch/x86/hyperv/mmu.c
@@ -50,8 +50,8 @@ static inline int fill_gva_list(u64 gva_list[], int offset,
 	return gva_n - offset;
 }
 
-static void hyperv_flush_tlb_others(const struct cpumask *cpus,
-				    const struct flush_tlb_info *info)
+static void hyperv_flush_tlb_multi(const struct cpumask *cpus,
+				   const struct flush_tlb_info *info)
 {
 	int cpu, vcpu, gva_n, max_gvas;
 	struct hv_tlb_flush **flush_pcpu;
@@ -59,7 +59,7 @@ static void hyperv_flush_tlb_others(const struct cpumask *cpus,
 	u64 status = U64_MAX;
 	unsigned long flags;
 
-	trace_hyperv_mmu_flush_tlb_others(cpus, info);
+	trace_hyperv_mmu_flush_tlb_multi(cpus, info);
 
 	if (!hv_hypercall_pg)
 		goto do_native;
@@ -156,7 +156,7 @@ static void hyperv_flush_tlb_others(const struct cpumask *cpus,
 	if (!(status & HV_HYPERCALL_RESULT_MASK))
 		return;
 do_native:
-	native_flush_tlb_others(cpus, info);
+	native_flush_tlb_multi(cpus, info);
 }
 
 static u64 hyperv_flush_tlb_others_ex(const struct cpumask *cpus,
@@ -231,6 +231,6 @@ void hyperv_setup_mmu_ops(void)
 		return;
 
 	pr_info("Using hypercall for remote TLB flush\n");
-	pv_ops.mmu.flush_tlb_others = hyperv_flush_tlb_others;
+	pv_ops.mmu.flush_tlb_multi = hyperv_flush_tlb_multi;
 	pv_ops.mmu.tlb_remove_table = tlb_remove_table;
 }
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index dce26f1d13e1..8c6c2394393b 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -62,10 +62,10 @@ static inline void __flush_tlb_one_user(unsigned long addr)
 	PVOP_VCALL1(mmu.flush_tlb_one_user, addr);
 }
 
-static inline void flush_tlb_others(const struct cpumask *cpumask,
-				    const struct flush_tlb_info *info)
+static inline void flush_tlb_multi(const struct cpumask *cpumask,
+				   const struct flush_tlb_info *info)
 {
-	PVOP_VCALL2(mmu.flush_tlb_others, cpumask, info);
+	PVOP_VCALL2(mmu.flush_tlb_multi, cpumask, info);
 }
 
 static inline void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 639b2df445ee..c82969f38845 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -211,8 +211,8 @@ struct pv_mmu_ops {
 	void (*flush_tlb_user)(void);
 	void (*flush_tlb_kernel)(void);
 	void (*flush_tlb_one_user)(unsigned long addr);
-	void (*flush_tlb_others)(const struct cpumask *cpus,
-				 const struct flush_tlb_info *info);
+	void (*flush_tlb_multi)(const struct cpumask *cpus,
+				const struct flush_tlb_info *info);
 
 	void (*tlb_remove_table)(struct mmu_gather *tlb, void *table);
 
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index dee375831962..610e47dc66ef 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -517,7 +517,7 @@ static inline void __flush_tlb_one_kernel(unsigned long addr)
  *  - flush_tlb_page(vma, vmaddr) flushes one page
  *  - flush_tlb_range(vma, start, end) flushes a range of pages
  *  - flush_tlb_kernel_range(start, end) flushes a range of kernel pages
- *  - flush_tlb_others(cpumask, info) flushes TLBs on other cpus
+ *  - flush_tlb_multi(cpumask, info) flushes TLBs on multiple cpus
  *
  * ..but the i386 has somewhat limited tlb flushing capabilities,
  * and page-granular flushes are available only on i486 and up.
@@ -569,7 +569,7 @@ static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long a)
 	flush_tlb_mm_range(vma->vm_mm, a, a + PAGE_SIZE, PAGE_SHIFT, false);
 }
 
-void native_flush_tlb_others(const struct cpumask *cpumask,
+void native_flush_tlb_multi(const struct cpumask *cpumask,
 			     const struct flush_tlb_info *info);
 
 static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
@@ -593,8 +593,8 @@ static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
 extern void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
 
 #ifndef CONFIG_PARAVIRT
-#define flush_tlb_others(mask, info)	\
-	native_flush_tlb_others(mask, info)
+#define flush_tlb_multi(mask, info)	\
+	native_flush_tlb_multi(mask, info)
 
 #define paravirt_tlb_remove_table(tlb, page) \
 	tlb_remove_page(tlb, (void *)(page))
diff --git a/arch/x86/include/asm/trace/hyperv.h b/arch/x86/include/asm/trace/hyperv.h
index ace464f09681..85ca8560c7f9 100644
--- a/arch/x86/include/asm/trace/hyperv.h
+++ b/arch/x86/include/asm/trace/hyperv.h
@@ -8,7 +8,7 @@
 
 #if IS_ENABLED(CONFIG_HYPERV)
 
-TRACE_EVENT(hyperv_mmu_flush_tlb_others,
+TRACE_EVENT(hyperv_mmu_flush_tlb_multi,
 	    TP_PROTO(const struct cpumask *cpus,
 		     const struct flush_tlb_info *info),
 	    TP_ARGS(cpus, info),
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index b7f34fe2171e..de40657d9025 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -595,7 +595,7 @@ static void __init kvm_apf_trap_init(void)
 
 static DEFINE_PER_CPU(cpumask_var_t, __pv_tlb_mask);
 
-static void kvm_flush_tlb_others(const struct cpumask *cpumask,
+static void kvm_flush_tlb_multi(const struct cpumask *cpumask,
 			const struct flush_tlb_info *info)
 {
 	u8 state;
@@ -609,6 +609,11 @@ static void kvm_flush_tlb_others(const struct cpumask *cpumask,
 	 * queue flush_on_enter for pre-empted vCPUs
 	 */
 	for_each_cpu(cpu, flushmask) {
+		/*
+		 * The local vCPU is never preempted, so we do not explicitly
+		 * skip check for local vCPU - it will never be cleared from
+		 * flushmask.
+		 */
 		src = &per_cpu(steal_time, cpu);
 		state = READ_ONCE(src->preempted);
 		if ((state & KVM_VCPU_PREEMPTED)) {
@@ -618,7 +623,7 @@ static void kvm_flush_tlb_others(const struct cpumask *cpumask,
 		}
 	}
 
-	native_flush_tlb_others(flushmask, info);
+	native_flush_tlb_multi(flushmask, info);
 }
 
 static void __init kvm_guest_init(void)
@@ -643,7 +648,7 @@ static void __init kvm_guest_init(void)
 	if (kvm_para_has_feature(KVM_FEATURE_PV_TLB_FLUSH) &&
 	    !kvm_para_has_hint(KVM_HINTS_REALTIME) &&
 	    kvm_para_has_feature(KVM_FEATURE_STEAL_TIME)) {
-		pv_ops.mmu.flush_tlb_others = kvm_flush_tlb_others;
+		pv_ops.mmu.flush_tlb_multi = kvm_flush_tlb_multi;
 		pv_ops.mmu.tlb_remove_table = tlb_remove_table;
 	}
 
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 0aa6256eedd8..6af40844a730 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -363,7 +363,7 @@ struct paravirt_patch_template pv_ops = {
 	.mmu.flush_tlb_user	= native_flush_tlb,
 	.mmu.flush_tlb_kernel	= native_flush_tlb_global,
 	.mmu.flush_tlb_one_user	= native_flush_tlb_one_user,
-	.mmu.flush_tlb_others	= native_flush_tlb_others,
+	.mmu.flush_tlb_multi	= native_flush_tlb_multi,
 	.mmu.tlb_remove_table	=
 			(void (*)(struct mmu_gather *, void *))tlb_remove_page,
 
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index abbf55fa8b81..63c00908bdd9 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -551,7 +551,7 @@ static void flush_tlb_func_common(const struct flush_tlb_info *f,
 		 * garbage into our TLB.  Since switching to init_mm is barely
 		 * slower than a minimal flush, just switch to init_mm.
 		 *
-		 * This should be rare, with native_flush_tlb_others skipping
+		 * This should be rare, with native_flush_tlb_multi() skipping
 		 * IPIs to lazy TLB mode CPUs.
 		 */
 		switch_mm_irqs_off(NULL, &init_mm, NULL);
@@ -665,9 +665,14 @@ static bool tlb_is_not_lazy(int cpu)
 
 static DEFINE_PER_CPU(cpumask_t, flush_tlb_mask);
 
-void native_flush_tlb_others(const struct cpumask *cpumask,
-			     const struct flush_tlb_info *info)
+void native_flush_tlb_multi(const struct cpumask *cpumask,
+			    const struct flush_tlb_info *info)
 {
+	/*
+	 * Do accounting and tracing. Note that there are (and have always been)
+	 * cases in which a remote TLB flush will be traced, but eventually
+	 * would not happen.
+	 */
 	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
 	if (info->end == TLB_FLUSH_ALL)
 		trace_tlb_flush(TLB_REMOTE_SEND_IPI, TLB_FLUSH_ALL);
@@ -687,10 +692,12 @@ void native_flush_tlb_others(const struct cpumask *cpumask,
 		 * means that the percpu tlb_gen variables won't be updated
 		 * and we'll do pointless flushes on future context switches.
 		 *
-		 * Rather than hooking native_flush_tlb_others() here, I think
+		 * Rather than hooking native_flush_tlb_multi() here, I think
 		 * that UV should be updated so that smp_call_function_many(),
 		 * etc, are optimal on UV.
 		 */
+		flush_tlb_func_local((void *)info);
+
 		cpumask = uv_flush_tlb_others(cpumask, info);
 		if (cpumask)
 			smp_call_function_many(cpumask, flush_tlb_func_remote,
@@ -709,8 +716,9 @@ void native_flush_tlb_others(const struct cpumask *cpumask,
 	 * doing a speculative memory access.
 	 */
 	if (info->freed_tables) {
-		smp_call_function_many(cpumask, flush_tlb_func_remote,
-			       (void *)info, 1);
+		__smp_call_function_many(cpumask, flush_tlb_func_remote,
+					 flush_tlb_func_local,
+					 (void *)info, 1);
 	} else {
 		/*
 		 * Although we could have used on_each_cpu_cond_mask(),
@@ -737,7 +745,8 @@ void native_flush_tlb_others(const struct cpumask *cpumask,
 			if (tlb_is_not_lazy(cpu))
 				__cpumask_set_cpu(cpu, cond_cpumask);
 		}
-		smp_call_function_many(cond_cpumask, flush_tlb_func_remote,
+		__smp_call_function_many(cond_cpumask, flush_tlb_func_remote,
+					 flush_tlb_func_local,
 					 (void *)info, 1);
 	}
 }
@@ -818,16 +827,20 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 	info = get_flush_tlb_info(mm, start, end, stride_shift, freed_tables,
 				  new_tlb_gen);
 
-	if (mm == this_cpu_read(cpu_tlbstate.loaded_mm)) {
+	/*
+	 * flush_tlb_multi() is not optimized for the common case in which only
+	 * a local TLB flush is needed. Optimize this use-case by calling
+	 * flush_tlb_func_local() directly in this case.
+	 */
+	if (cpumask_any_but(mm_cpumask(mm), cpu) < nr_cpu_ids) {
+		flush_tlb_multi(mm_cpumask(mm), info);
+	} else if (mm == this_cpu_read(cpu_tlbstate.loaded_mm)) {
 		lockdep_assert_irqs_enabled();
 		local_irq_disable();
 		flush_tlb_func_local(info);
 		local_irq_enable();
 	}
 
-	if (cpumask_any_but(mm_cpumask(mm), cpu) < nr_cpu_ids)
-		flush_tlb_others(mm_cpumask(mm), info);
-
 	put_flush_tlb_info();
 	put_cpu();
 }
@@ -890,16 +903,20 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
 	int cpu = get_cpu();
 
-	if (cpumask_test_cpu(cpu, &batch->cpumask)) {
+	/*
+	 * flush_tlb_multi() is not optimized for the common case in which only
+	 * a local TLB flush is needed. Optimize this use-case by calling
+	 * flush_tlb_func_local() directly in this case.
+	 */
+	if (cpumask_any_but(&batch->cpumask, cpu) < nr_cpu_ids) {
+		flush_tlb_multi(&batch->cpumask, &full_flush_tlb_info);
+	} else if (cpumask_test_cpu(cpu, &batch->cpumask)) {
 		lockdep_assert_irqs_enabled();
 		local_irq_disable();
 		flush_tlb_func_local((void *)&full_flush_tlb_info);
 		local_irq_enable();
 	}
 
-	if (cpumask_any_but(&batch->cpumask, cpu) < nr_cpu_ids)
-		flush_tlb_others(&batch->cpumask, &full_flush_tlb_info);
-
 	cpumask_clear(&batch->cpumask);
 
 	put_cpu();
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 26e8b326966d..48f7c7eb4dbc 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -1345,8 +1345,8 @@ static void xen_flush_tlb_one_user(unsigned long addr)
 	preempt_enable();
 }
 
-static void xen_flush_tlb_others(const struct cpumask *cpus,
-				 const struct flush_tlb_info *info)
+static void xen_flush_tlb_multi(const struct cpumask *cpus,
+				const struct flush_tlb_info *info)
 {
 	struct {
 		struct mmuext_op op;
@@ -1356,7 +1356,7 @@ static void xen_flush_tlb_others(const struct cpumask *cpus,
 	const size_t mc_entry_size = sizeof(args->op) +
 		sizeof(args->mask[0]) * BITS_TO_LONGS(num_possible_cpus());
 
-	trace_xen_mmu_flush_tlb_others(cpus, info->mm, info->start, info->end);
+	trace_xen_mmu_flush_tlb_multi(cpus, info->mm, info->start, info->end);
 
 	if (cpumask_empty(cpus))
 		return;		/* nothing to do */
@@ -1365,9 +1365,8 @@ static void xen_flush_tlb_others(const struct cpumask *cpus,
 	args = mcs.args;
 	args->op.arg2.vcpumask = to_cpumask(args->mask);
 
-	/* Remove us, and any offline CPUS. */
+	/* Remove any offline CPUs */
 	cpumask_and(to_cpumask(args->mask), cpus, cpu_online_mask);
-	cpumask_clear_cpu(smp_processor_id(), to_cpumask(args->mask));
 
 	args->op.cmd = MMUEXT_TLB_FLUSH_MULTI;
 	if (info->end != TLB_FLUSH_ALL &&
@@ -2396,7 +2395,7 @@ static const struct pv_mmu_ops xen_mmu_ops __initconst = {
 	.flush_tlb_user = xen_flush_tlb,
 	.flush_tlb_kernel = xen_flush_tlb,
 	.flush_tlb_one_user = xen_flush_tlb_one_user,
-	.flush_tlb_others = xen_flush_tlb_others,
+	.flush_tlb_multi = xen_flush_tlb_multi,
 	.tlb_remove_table = tlb_remove_table,
 
 	.pgd_alloc = xen_pgd_alloc,
diff --git a/include/trace/events/xen.h b/include/trace/events/xen.h
index 9a0e8af21310..546022acf160 100644
--- a/include/trace/events/xen.h
+++ b/include/trace/events/xen.h
@@ -362,7 +362,7 @@ TRACE_EVENT(xen_mmu_flush_tlb_one_user,
 	    TP_printk("addr %lx", __entry->addr)
 	);
 
-TRACE_EVENT(xen_mmu_flush_tlb_others,
+TRACE_EVENT(xen_mmu_flush_tlb_multi,
 	    TP_PROTO(const struct cpumask *cpus, struct mm_struct *mm,
 		     unsigned long addr, unsigned long end),
 	    TP_ARGS(cpus, mm, addr, end),
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
