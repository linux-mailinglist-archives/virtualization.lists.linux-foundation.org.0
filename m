Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FBF308A7
	for <lists.virtualization@lfdr.de>; Fri, 31 May 2019 08:38:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6B6E2DF2;
	Fri, 31 May 2019 06:37:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EC51CDC9
	for <virtualization@lists.linux-foundation.org>;
	Fri, 31 May 2019 06:37:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C07A76C5
	for <virtualization@lists.linux-foundation.org>;
	Fri, 31 May 2019 06:37:04 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t1so3481636pgc.2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 23:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a2Mx1/vUAD+hUjRBQ0rljEO+u5VAVjEGIXV2xv53BGI=;
	b=YPn9Ow48GtzFNUvUe7z+NvPz6fg7WmUNQBR5HOCETipS9wD0miGnjKeve2CH/fCFSS
	doEfRFlYolkrCbaN4tBP0koUQ/gxIoIKuHlKeaTTBkku42U9LRS+Rp7hhO/AHwtUd10a
	G1zTfNLNN77Q7zkdOGVFitTrjG0DK5z/uGOUipRsIFyyqonr9gfbJ4yFVjpuW3U1evcw
	R82TiqVk0qwsnxnoDDW+BQToF+MEFWez9t06Lne6STa3Qavyls0kGIPOjZ10esmRp56x
	IC3koBB9ngKcQo519SVELiwDrjUaEcY4rohYODV/SgRIu++rgN2l74LEpykOVC4RDbLd
	6wlA==
X-Gm-Message-State: APjAAAXLdx/6qPjomKZg8xUrymxeBBGSfyyxRLWLMycVx0v+AzneYO//
	VJ8ECskFbMrMpXkCnZPYlb0=
X-Google-Smtp-Source: APXvYqz9GhmxhqTntyg3gGdbuyeRsmz9SE9oNH3Wo5RyTBt3cFNm7lf7sT2aHuNRkNsPjjq/Xi4Niw==
X-Received: by 2002:a17:90a:ac04:: with SMTP id
	o4mr7290720pjq.134.1559284623987; 
	Thu, 30 May 2019 23:37:03 -0700 (PDT)
Received: from htb-2n-eng-dhcp405.eng.vmware.com ([66.170.99.1])
	by smtp.gmail.com with ESMTPSA id
	g17sm9256429pfk.55.2019.05.30.23.37.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 23:37:03 -0700 (PDT)
To: Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>
Subject: [RFC PATCH v2 04/12] x86/mm/tlb: Flush remote and local TLBs
	concurrently
Date: Thu, 30 May 2019 23:36:37 -0700
Message-Id: <20190531063645.4697-5-namit@vmware.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531063645.4697-1-namit@vmware.com>
References: <20190531063645.4697-1-namit@vmware.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
	linux-hyperv@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Haiyang Zhang <haiyangz@microsoft.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Dave Hansen <dave.hansen@intel.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Paolo Bonzini <pbonzini@redhat.com>, Nadav Amit <namit@vmware.com>,
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
concurrently. Introduce flush_tlb_multi() that does so. The current
flush_tlb_others() interface is kept, since paravirtual interfaces need
to be adapted first before it can be removed. This is left for future
work. In such PV environments, TLB flushes are not performed, at this
time, concurrently.

Add a static key to tell whether this new interface is supported.

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
 arch/x86/hyperv/mmu.c                 |  2 +
 arch/x86/include/asm/paravirt.h       |  8 +++
 arch/x86/include/asm/paravirt_types.h |  6 ++
 arch/x86/include/asm/tlbflush.h       |  6 ++
 arch/x86/kernel/kvm.c                 |  1 +
 arch/x86/kernel/paravirt.c            |  3 +
 arch/x86/mm/tlb.c                     | 80 +++++++++++++++++++++++----
 arch/x86/xen/mmu_pv.c                 |  2 +
 8 files changed, 96 insertions(+), 12 deletions(-)

diff --git a/arch/x86/hyperv/mmu.c b/arch/x86/hyperv/mmu.c
index e65d7fe6489f..ca28b400c87c 100644
--- a/arch/x86/hyperv/mmu.c
+++ b/arch/x86/hyperv/mmu.c
@@ -233,4 +233,6 @@ void hyperv_setup_mmu_ops(void)
 	pr_info("Using hypercall for remote TLB flush\n");
 	pv_ops.mmu.flush_tlb_others = hyperv_flush_tlb_others;
 	pv_ops.mmu.tlb_remove_table = tlb_remove_table;
+
+	static_key_disable(&flush_tlb_multi_enabled.key);
 }
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index c25c38a05c1c..192be7254457 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -47,6 +47,8 @@ static inline void slow_down_io(void)
 #endif
 }
 
+DECLARE_STATIC_KEY_TRUE(flush_tlb_multi_enabled);
+
 static inline void __flush_tlb(void)
 {
 	PVOP_VCALL0(mmu.flush_tlb_user);
@@ -62,6 +64,12 @@ static inline void __flush_tlb_one_user(unsigned long addr)
 	PVOP_VCALL1(mmu.flush_tlb_one_user, addr);
 }
 
+static inline void flush_tlb_multi(const struct cpumask *cpumask,
+				   const struct flush_tlb_info *info)
+{
+	PVOP_VCALL2(mmu.flush_tlb_multi, cpumask, info);
+}
+
 static inline void flush_tlb_others(const struct cpumask *cpumask,
 				    const struct flush_tlb_info *info)
 {
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 946f8f1f1efc..3a156e63c57d 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -211,6 +211,12 @@ struct pv_mmu_ops {
 	void (*flush_tlb_user)(void);
 	void (*flush_tlb_kernel)(void);
 	void (*flush_tlb_one_user)(unsigned long addr);
+	/*
+	 * flush_tlb_multi() is the preferred interface. When it is used,
+	 * flush_tlb_others() should return false.
+	 */
+	void (*flush_tlb_multi)(const struct cpumask *cpus,
+				const struct flush_tlb_info *info);
 	void (*flush_tlb_others)(const struct cpumask *cpus,
 				 const struct flush_tlb_info *info);
 
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index dee375831962..79272938cf79 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -569,6 +569,9 @@ static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long a)
 	flush_tlb_mm_range(vma->vm_mm, a, a + PAGE_SIZE, PAGE_SHIFT, false);
 }
 
+void native_flush_tlb_multi(const struct cpumask *cpumask,
+			     const struct flush_tlb_info *info);
+
 void native_flush_tlb_others(const struct cpumask *cpumask,
 			     const struct flush_tlb_info *info);
 
@@ -593,6 +596,9 @@ static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
 extern void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
 
 #ifndef CONFIG_PARAVIRT
+#define flush_tlb_multi(mask, info)	\
+	native_flush_tlb_multi(mask, info)
+
 #define flush_tlb_others(mask, info)	\
 	native_flush_tlb_others(mask, info)
 
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 3f0cc828cc36..c1c2b88ea3f1 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -643,6 +643,7 @@ static void __init kvm_guest_init(void)
 	    kvm_para_has_feature(KVM_FEATURE_STEAL_TIME)) {
 		pv_ops.mmu.flush_tlb_others = kvm_flush_tlb_others;
 		pv_ops.mmu.tlb_remove_table = tlb_remove_table;
+		static_key_disable(&flush_tlb_multi_enabled.key);
 	}
 
 	if (kvm_para_has_feature(KVM_FEATURE_PV_EOI))
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 5492a669f658..1314f89304a8 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -171,6 +171,8 @@ unsigned paravirt_patch_insns(void *insn_buff, unsigned len,
 	return insn_len;
 }
 
+DEFINE_STATIC_KEY_TRUE(flush_tlb_multi_enabled);
+
 static void native_flush_tlb(void)
 {
 	__native_flush_tlb();
@@ -375,6 +377,7 @@ struct paravirt_patch_template pv_ops = {
 	.mmu.flush_tlb_user	= native_flush_tlb,
 	.mmu.flush_tlb_kernel	= native_flush_tlb_global,
 	.mmu.flush_tlb_one_user	= native_flush_tlb_one_user,
+	.mmu.flush_tlb_multi	= native_flush_tlb_multi,
 	.mmu.flush_tlb_others	= native_flush_tlb_others,
 	.mmu.tlb_remove_table	=
 			(void (*)(struct mmu_gather *, void *))tlb_remove_page,
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index ac98ad76f695..73d0d51b0f61 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -550,7 +550,7 @@ static void flush_tlb_func_common(const struct flush_tlb_info *f,
 		 * garbage into our TLB.  Since switching to init_mm is barely
 		 * slower than a minimal flush, just switch to init_mm.
 		 *
-		 * This should be rare, with native_flush_tlb_others skipping
+		 * This should be rare, with native_flush_tlb_multi skipping
 		 * IPIs to lazy TLB mode CPUs.
 		 */
 		switch_mm_irqs_off(NULL, &init_mm, NULL);
@@ -634,9 +634,12 @@ static void flush_tlb_func_common(const struct flush_tlb_info *f,
 	this_cpu_write(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_gen, mm_tlb_gen);
 }
 
-static void flush_tlb_func_local(const void *info, enum tlb_flush_reason reason)
+static void flush_tlb_func_local(void *info)
 {
 	const struct flush_tlb_info *f = info;
+	enum tlb_flush_reason reason;
+
+	reason = (f->mm == NULL) ? TLB_LOCAL_SHOOTDOWN : TLB_LOCAL_MM_SHOOTDOWN;
 
 	flush_tlb_func_common(f, true, reason);
 }
@@ -654,14 +657,30 @@ static void flush_tlb_func_remote(void *info)
 	flush_tlb_func_common(f, false, TLB_REMOTE_SHOOTDOWN);
 }
 
-static bool tlb_is_not_lazy(int cpu, void *data)
+static inline bool tlb_is_not_lazy(int cpu)
 {
 	return !per_cpu(cpu_tlbstate.is_lazy, cpu);
 }
 
-void native_flush_tlb_others(const struct cpumask *cpumask,
-			     const struct flush_tlb_info *info)
+static DEFINE_PER_CPU(cpumask_t, flush_tlb_mask);
+
+void native_flush_tlb_multi(const struct cpumask *cpumask,
+			    const struct flush_tlb_info *info)
 {
+	/*
+	 * native_flush_tlb_multi() can handle a single CPU, but it is
+	 * suboptimal if the local TLB should be flushed, and therefore should
+	 * not be used in such case. Check that it is not used in such case,
+	 * and use this assumption for tracing and accounting of remote TLB
+	 * flushes.
+	 */
+	VM_WARN_ON(!cpumask_any_but(cpumask, smp_processor_id()));
+
+	/*
+	 * Do accounting and tracing. Note that there are (and have always been)
+	 * cases in which a remote TLB flush will be traced, but eventually
+	 * would not happen.
+	 */
 	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
 	if (info->end == TLB_FLUSH_ALL)
 		trace_tlb_flush(TLB_REMOTE_SEND_IPI, TLB_FLUSH_ALL);
@@ -681,10 +700,14 @@ void native_flush_tlb_others(const struct cpumask *cpumask,
 		 * means that the percpu tlb_gen variables won't be updated
 		 * and we'll do pointless flushes on future context switches.
 		 *
-		 * Rather than hooking native_flush_tlb_others() here, I think
+		 * Rather than hooking native_flush_tlb_multi() here, I think
 		 * that UV should be updated so that smp_call_function_many(),
 		 * etc, are optimal on UV.
 		 */
+		local_irq_disable();
+		flush_tlb_func_local((__force void *)info);
+		local_irq_enable();
+
 		cpumask = uv_flush_tlb_others(cpumask, info);
 		if (cpumask)
 			smp_call_function_many(cpumask, flush_tlb_func_remote,
@@ -703,11 +726,39 @@ void native_flush_tlb_others(const struct cpumask *cpumask,
 	 * doing a speculative memory access.
 	 */
 	if (info->freed_tables)
-		smp_call_function_many(cpumask, flush_tlb_func_remote,
-			       (void *)info, 1);
-	else
-		on_each_cpu_cond_mask(tlb_is_not_lazy, flush_tlb_func_remote,
-				(void *)info, 1, GFP_ATOMIC, cpumask);
+		__smp_call_function_many(cpumask, flush_tlb_func_remote,
+					 flush_tlb_func_local, (void *)info, 1);
+	else {
+		/*
+		 * Although we could have used on_each_cpu_cond_mask(),
+		 * open-coding it has several performance advantages: (1) we can
+		 * use specialized functions for remote and local flushes; (2)
+		 * no need for indirect branch to test if TLB is lazy; (3) we
+		 * can use a designated cpumask for evaluating the condition
+		 * instead of allocating a new one.
+		 *
+		 * This works under the assumption that there are no nested TLB
+		 * flushes, an assumption that is already made in
+		 * flush_tlb_mm_range().
+		 */
+		struct cpumask *cond_cpumask = this_cpu_ptr(&flush_tlb_mask);
+		int cpu;
+
+		cpumask_clear(cond_cpumask);
+
+		for_each_cpu(cpu, cpumask) {
+			if (tlb_is_not_lazy(cpu))
+				__cpumask_set_cpu(cpu, cond_cpumask);
+		}
+		__smp_call_function_many(cond_cpumask, flush_tlb_func_remote,
+					 flush_tlb_func_local, (void *)info, 1);
+	}
+}
+
+void native_flush_tlb_others(const struct cpumask *cpumask,
+			     const struct flush_tlb_info *info)
+{
+	native_flush_tlb_multi(cpumask, info);
 }
 
 /*
@@ -773,10 +824,15 @@ static void flush_tlb_on_cpus(const cpumask_t *cpumask,
 {
 	int this_cpu = smp_processor_id();
 
+	if (static_branch_likely(&flush_tlb_multi_enabled)) {
+		flush_tlb_multi(cpumask, info);
+		return;
+	}
+
 	if (cpumask_test_cpu(this_cpu, cpumask)) {
 		lockdep_assert_irqs_enabled();
 		local_irq_disable();
-		flush_tlb_func_local(info, TLB_LOCAL_MM_SHOOTDOWN);
+		flush_tlb_func_local((__force void *)info);
 		local_irq_enable();
 	}
 
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index beb44e22afdf..0cb277848cb4 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2474,6 +2474,8 @@ void __init xen_init_mmu_ops(void)
 
 	pv_ops.mmu = xen_mmu_ops;
 
+	static_key_disable(&flush_tlb_multi_enabled.key);
+
 	memset(dummy_mapping, 0xff, PAGE_SIZE);
 }
 
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
