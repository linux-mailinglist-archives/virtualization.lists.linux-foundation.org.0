Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D49332783
	for <lists.virtualization@lfdr.de>; Tue,  9 Mar 2021 14:48:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 415216F5A9;
	Tue,  9 Mar 2021 13:48:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQXUBZ_x-m95; Tue,  9 Mar 2021 13:48:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 937C26F521;
	Tue,  9 Mar 2021 13:48:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5D81C0012;
	Tue,  9 Mar 2021 13:48:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA7A0C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 13:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83C896F5AF
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 13:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xooVFpHH0343
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 13:48:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79BCC605C9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 13:48:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1615297700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Xwm5mh2li/8IRrBrCYwfe2NBOuXxsvyUigtTvOh1lo=;
 b=t4cPsAYbcckAYG/qiEk71LYZZ8Z3aeLZ1K8c2a6Ypz+5ltsQALBFHjrtDmGkDMRxE+fnob
 xAUKcKfDsCQuOARcLh5vW9lYi1hCT4dD1/wK09AMrCsaOH3QVFXgF70djb8lWp4k7kSoJZ
 uG+aNmsB1Al+tic7UL1KXzx5itZCuzY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC7ADAC8C;
 Tue,  9 Mar 2021 13:48:19 +0000 (UTC)
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, kvm@vger.kernel.org
Subject: [PATCH v6 02/12] x86/paravirt: switch time pvops functions to use
 static_call()
Date: Tue,  9 Mar 2021 14:48:03 +0100
Message-Id: <20210309134813.23912-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309134813.23912-1-jgross@suse.com>
References: <20210309134813.23912-1-jgross@suse.com>
MIME-Version: 1.0
Cc: Wanpeng Li <wanpengli@tencent.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 Catalin Marinas <catalin.marinas@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Joerg Roedel <joro@8bytes.org>,
 Russell King <linux@armlinux.org.uk>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Borislav Petkov <bp@alien8.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jim Mattson <jmattson@google.com>, Juergen Gross <jgross@suse.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
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
From: Juergen Gross via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

The time pvops functions are the only ones left which might be
used in 32-bit mode and which return a 64-bit value.

Switch them to use the static_call() mechanism instead of pvops, as
this allows quite some simplification of the pvops implementation.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
V4:
- drop paravirt_time.h again
- don't move Hyper-V code (Michael Kelley)
V5:
- drop no longer needed Hyper-V modification (Michael Kelley)
- switch Arm and Arm64 to static_call(), too (kernel test robot)
V6:
- factor out common parts in Xen pv/pvh initialization (Boris Petkov)
---
 arch/arm/include/asm/paravirt.h       | 14 +++++---------
 arch/arm/kernel/paravirt.c            |  9 +++++++--
 arch/arm64/include/asm/paravirt.h     | 14 +++++---------
 arch/arm64/kernel/paravirt.c          | 13 +++++++++----
 arch/x86/Kconfig                      |  1 +
 arch/x86/include/asm/mshyperv.h       |  2 +-
 arch/x86/include/asm/paravirt.h       | 17 ++++++++++++++---
 arch/x86/include/asm/paravirt_types.h |  6 ------
 arch/x86/kernel/cpu/vmware.c          |  5 +++--
 arch/x86/kernel/kvm.c                 |  2 +-
 arch/x86/kernel/kvmclock.c            |  2 +-
 arch/x86/kernel/paravirt.c            | 16 ++++++++++++----
 arch/x86/kernel/tsc.c                 |  2 +-
 arch/x86/xen/time.c                   | 26 +++++++++++++-------------
 drivers/xen/time.c                    |  3 ++-
 15 files changed, 75 insertions(+), 57 deletions(-)

diff --git a/arch/arm/include/asm/paravirt.h b/arch/arm/include/asm/paravirt.h
index cdbf02d9c1d4..95d5b0d625cd 100644
--- a/arch/arm/include/asm/paravirt.h
+++ b/arch/arm/include/asm/paravirt.h
@@ -3,23 +3,19 @@
 #define _ASM_ARM_PARAVIRT_H
 
 #ifdef CONFIG_PARAVIRT
+#include <linux/static_call_types.h>
+
 struct static_key;
 extern struct static_key paravirt_steal_enabled;
 extern struct static_key paravirt_steal_rq_enabled;
 
-struct pv_time_ops {
-	unsigned long long (*steal_clock)(int cpu);
-};
-
-struct paravirt_patch_template {
-	struct pv_time_ops time;
-};
+u64 dummy_steal_clock(int cpu);
 
-extern struct paravirt_patch_template pv_ops;
+DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
 
 static inline u64 paravirt_steal_clock(int cpu)
 {
-	return pv_ops.time.steal_clock(cpu);
+	return static_call(pv_steal_clock)(cpu);
 }
 #endif
 
diff --git a/arch/arm/kernel/paravirt.c b/arch/arm/kernel/paravirt.c
index 4cfed91fe256..7dd9806369fb 100644
--- a/arch/arm/kernel/paravirt.c
+++ b/arch/arm/kernel/paravirt.c
@@ -9,10 +9,15 @@
 #include <linux/export.h>
 #include <linux/jump_label.h>
 #include <linux/types.h>
+#include <linux/static_call.h>
 #include <asm/paravirt.h>
 
 struct static_key paravirt_steal_enabled;
 struct static_key paravirt_steal_rq_enabled;
 
-struct paravirt_patch_template pv_ops;
-EXPORT_SYMBOL_GPL(pv_ops);
+static u64 native_steal_clock(int cpu)
+{
+	return 0;
+}
+
+DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
diff --git a/arch/arm64/include/asm/paravirt.h b/arch/arm64/include/asm/paravirt.h
index cf3a0fd7c1a7..9aa193e0e8f2 100644
--- a/arch/arm64/include/asm/paravirt.h
+++ b/arch/arm64/include/asm/paravirt.h
@@ -3,23 +3,19 @@
 #define _ASM_ARM64_PARAVIRT_H
 
 #ifdef CONFIG_PARAVIRT
+#include <linux/static_call_types.h>
+
 struct static_key;
 extern struct static_key paravirt_steal_enabled;
 extern struct static_key paravirt_steal_rq_enabled;
 
-struct pv_time_ops {
-	unsigned long long (*steal_clock)(int cpu);
-};
-
-struct paravirt_patch_template {
-	struct pv_time_ops time;
-};
+u64 dummy_steal_clock(int cpu);
 
-extern struct paravirt_patch_template pv_ops;
+DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
 
 static inline u64 paravirt_steal_clock(int cpu)
 {
-	return pv_ops.time.steal_clock(cpu);
+	return static_call(pv_steal_clock)(cpu);
 }
 
 int __init pv_time_init(void);
diff --git a/arch/arm64/kernel/paravirt.c b/arch/arm64/kernel/paravirt.c
index c07d7a034941..75fed4460407 100644
--- a/arch/arm64/kernel/paravirt.c
+++ b/arch/arm64/kernel/paravirt.c
@@ -18,6 +18,7 @@
 #include <linux/reboot.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/static_call.h>
 
 #include <asm/paravirt.h>
 #include <asm/pvclock-abi.h>
@@ -26,8 +27,12 @@
 struct static_key paravirt_steal_enabled;
 struct static_key paravirt_steal_rq_enabled;
 
-struct paravirt_patch_template pv_ops;
-EXPORT_SYMBOL_GPL(pv_ops);
+static u64 native_steal_clock(int cpu)
+{
+	return 0;
+}
+
+DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
 
 struct pv_time_stolen_time_region {
 	struct pvclock_vcpu_stolen_time *kaddr;
@@ -45,7 +50,7 @@ static int __init parse_no_stealacc(char *arg)
 early_param("no-steal-acc", parse_no_stealacc);
 
 /* return stolen time in ns by asking the hypervisor */
-static u64 pv_steal_clock(int cpu)
+static u64 para_steal_clock(int cpu)
 {
 	struct pv_time_stolen_time_region *reg;
 
@@ -150,7 +155,7 @@ int __init pv_time_init(void)
 	if (ret)
 		return ret;
 
-	pv_ops.time.steal_clock = pv_steal_clock;
+	static_call_update(pv_steal_clock, para_steal_clock);
 
 	static_key_slow_inc(&paravirt_steal_enabled);
 	if (steal_acc)
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2792879d398e..107acc403b3b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -777,6 +777,7 @@ if HYPERVISOR_GUEST
 
 config PARAVIRT
 	bool "Enable paravirtualization code"
+	depends on HAVE_STATIC_CALL
 	help
 	  This changes the kernel so it can modify itself when it is run
 	  under a hypervisor, potentially improving performance significantly
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index ccf60a809a17..e7be720062a8 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -63,7 +63,7 @@ typedef int (*hyperv_fill_flush_list_func)(
 static __always_inline void hv_setup_sched_clock(void *sched_clock)
 {
 #ifdef CONFIG_PARAVIRT
-	pv_ops.time.sched_clock = sched_clock;
+	paravirt_set_sched_clock(sched_clock);
 #endif
 }
 
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 4abf110e2243..1e45b46fae84 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -15,11 +15,22 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/cpumask.h>
+#include <linux/static_call_types.h>
 #include <asm/frame.h>
 
-static inline unsigned long long paravirt_sched_clock(void)
+u64 dummy_steal_clock(int cpu);
+u64 dummy_sched_clock(void);
+
+DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
+DECLARE_STATIC_CALL(pv_sched_clock, dummy_sched_clock);
+
+extern bool paravirt_using_native_sched_clock;
+
+void paravirt_set_sched_clock(u64 (*func)(void));
+
+static inline u64 paravirt_sched_clock(void)
 {
-	return PVOP_CALL0(unsigned long long, time.sched_clock);
+	return static_call(pv_sched_clock)();
 }
 
 struct static_key;
@@ -33,7 +44,7 @@ bool pv_is_native_vcpu_is_preempted(void);
 
 static inline u64 paravirt_steal_clock(int cpu)
 {
-	return PVOP_CALL1(u64, time.steal_clock, cpu);
+	return static_call(pv_steal_clock)(cpu);
 }
 
 /* The paravirtualized I/O functions */
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index de87087d3bde..1fff349e4792 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -95,11 +95,6 @@ struct pv_lazy_ops {
 } __no_randomize_layout;
 #endif
 
-struct pv_time_ops {
-	unsigned long long (*sched_clock)(void);
-	unsigned long long (*steal_clock)(int cpu);
-} __no_randomize_layout;
-
 struct pv_cpu_ops {
 	/* hooks for various privileged instructions */
 	void (*io_delay)(void);
@@ -291,7 +286,6 @@ struct pv_lock_ops {
  * what to patch. */
 struct paravirt_patch_template {
 	struct pv_init_ops	init;
-	struct pv_time_ops	time;
 	struct pv_cpu_ops	cpu;
 	struct pv_irq_ops	irq;
 	struct pv_mmu_ops	mmu;
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index c6ede3b3d302..84fb8e3f3d1b 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -27,6 +27,7 @@
 #include <linux/clocksource.h>
 #include <linux/cpu.h>
 #include <linux/reboot.h>
+#include <linux/static_call.h>
 #include <asm/div64.h>
 #include <asm/x86_init.h>
 #include <asm/hypervisor.h>
@@ -336,11 +337,11 @@ static void __init vmware_paravirt_ops_setup(void)
 	vmware_cyc2ns_setup();
 
 	if (vmw_sched_clock)
-		pv_ops.time.sched_clock = vmware_sched_clock;
+		paravirt_set_sched_clock(vmware_sched_clock);
 
 	if (vmware_is_stealclock_available()) {
 		has_steal_clock = true;
-		pv_ops.time.steal_clock = vmware_steal_clock;
+		static_call_update(pv_steal_clock, vmware_steal_clock);
 
 		/* We use reboot notifier only to disable steal clock */
 		register_reboot_notifier(&vmware_pv_reboot_nb);
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 5e78e01ca3b4..351ba99f6009 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -650,7 +650,7 @@ static void __init kvm_guest_init(void)
 
 	if (kvm_para_has_feature(KVM_FEATURE_STEAL_TIME)) {
 		has_steal_clock = 1;
-		pv_ops.time.steal_clock = kvm_steal_clock;
+		static_call_update(pv_steal_clock, kvm_steal_clock);
 	}
 
 	if (pv_tlb_flush_supported()) {
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index aa593743acf6..01e7c1839ace 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -106,7 +106,7 @@ static inline void kvm_sched_clock_init(bool stable)
 	if (!stable)
 		clear_sched_clock_stable();
 	kvm_sched_clock_offset = kvm_clock_read();
-	pv_ops.time.sched_clock = kvm_sched_clock_read;
+	paravirt_set_sched_clock(kvm_sched_clock_read);
 
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index c60222ab8ab9..44e5b0fe28cb 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -14,6 +14,7 @@
 #include <linux/highmem.h>
 #include <linux/kprobes.h>
 #include <linux/pgtable.h>
+#include <linux/static_call.h>
 
 #include <asm/bug.h>
 #include <asm/paravirt.h>
@@ -167,6 +168,17 @@ static u64 native_steal_clock(int cpu)
 	return 0;
 }
 
+DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
+DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
+
+bool paravirt_using_native_sched_clock = true;
+
+void paravirt_set_sched_clock(u64 (*func)(void))
+{
+	static_call_update(pv_sched_clock, func);
+	paravirt_using_native_sched_clock = (func == native_sched_clock);
+}
+
 /* These are in entry.S */
 extern void native_iret(void);
 
@@ -272,10 +284,6 @@ struct paravirt_patch_template pv_ops = {
 	/* Init ops. */
 	.init.patch		= native_patch,
 
-	/* Time ops. */
-	.time.sched_clock	= native_sched_clock,
-	.time.steal_clock	= native_steal_clock,
-
 	/* Cpu ops. */
 	.cpu.io_delay		= native_io_delay,
 
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index f70dffc2771f..b6f7853d8077 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -254,7 +254,7 @@ unsigned long long sched_clock(void)
 
 bool using_native_sched_clock(void)
 {
-	return pv_ops.time.sched_clock == native_sched_clock;
+	return paravirt_using_native_sched_clock;
 }
 #else
 unsigned long long
diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 91f5b330dcc6..d9c945ee1100 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -379,11 +379,6 @@ void xen_timer_resume(void)
 	}
 }
 
-static const struct pv_time_ops xen_time_ops __initconst = {
-	.sched_clock = xen_sched_clock,
-	.steal_clock = xen_steal_clock,
-};
-
 static struct pvclock_vsyscall_time_info *xen_clock __read_mostly;
 static u64 xen_clock_value_saved;
 
@@ -525,17 +520,24 @@ static void __init xen_time_init(void)
 		pvclock_gtod_register_notifier(&xen_pvclock_gtod_notifier);
 }
 
-void __init xen_init_time_ops(void)
+static void __init xen_init_time_common(void)
 {
 	xen_sched_clock_offset = xen_clocksource_read();
-	pv_ops.time = xen_time_ops;
+	static_call_update(pv_steal_clock, xen_steal_clock);
+	paravirt_set_sched_clock(xen_sched_clock);
+
+	x86_platform.calibrate_tsc = xen_tsc_khz;
+	x86_platform.get_wallclock = xen_get_wallclock;
+}
+
+void __init xen_init_time_ops(void)
+{
+	xen_init_time_common();
 
 	x86_init.timers.timer_init = xen_time_init;
 	x86_init.timers.setup_percpu_clockev = x86_init_noop;
 	x86_cpuinit.setup_percpu_clockev = x86_init_noop;
 
-	x86_platform.calibrate_tsc = xen_tsc_khz;
-	x86_platform.get_wallclock = xen_get_wallclock;
 	/* Dom0 uses the native method to set the hardware RTC. */
 	if (!xen_initial_domain())
 		x86_platform.set_wallclock = xen_set_wallclock;
@@ -569,13 +571,11 @@ void __init xen_hvm_init_time_ops(void)
 		return;
 	}
 
-	xen_sched_clock_offset = xen_clocksource_read();
-	pv_ops.time = xen_time_ops;
+	xen_init_time_common();
+
 	x86_init.timers.setup_percpu_clockev = xen_time_init;
 	x86_cpuinit.setup_percpu_clockev = xen_hvm_setup_cpu_clockevents;
 
-	x86_platform.calibrate_tsc = xen_tsc_khz;
-	x86_platform.get_wallclock = xen_get_wallclock;
 	x86_platform.set_wallclock = xen_set_wallclock;
 }
 #endif
diff --git a/drivers/xen/time.c b/drivers/xen/time.c
index 108edbcbc040..152dd33bb223 100644
--- a/drivers/xen/time.c
+++ b/drivers/xen/time.c
@@ -7,6 +7,7 @@
 #include <linux/math64.h>
 #include <linux/gfp.h>
 #include <linux/slab.h>
+#include <linux/static_call.h>
 
 #include <asm/paravirt.h>
 #include <asm/xen/hypervisor.h>
@@ -175,7 +176,7 @@ void __init xen_time_setup_guest(void)
 	xen_runstate_remote = !HYPERVISOR_vm_assist(VMASST_CMD_enable,
 					VMASST_TYPE_runstate_update_flag);
 
-	pv_ops.time.steal_clock = xen_steal_clock;
+	static_call_update(pv_steal_clock, xen_steal_clock);
 
 	static_key_slow_inc(&paravirt_steal_enabled);
 	if (xen_runstate_remote)
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
