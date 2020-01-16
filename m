Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 667EA13DA66
	for <lists.virtualization@lfdr.de>; Thu, 16 Jan 2020 13:47:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1EF0385787;
	Thu, 16 Jan 2020 12:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hw5rtDleuRun; Thu, 16 Jan 2020 12:47:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AB79585829;
	Thu, 16 Jan 2020 12:47:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 975DAC077D;
	Thu, 16 Jan 2020 12:47:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36360C077D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 307E1869E6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4+94Z963EOcO
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:47:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 14F8086959
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:47:02 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B4799E76B3DB9F8CD895;
 Thu, 16 Jan 2020 20:46:59 +0800 (CST)
Received: from DESKTOP-1NISPDV.china.huawei.com (10.173.221.248) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Thu, 16 Jan 2020 20:46:51 +0800
From: Zengruan Ye <yezengruan@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <virtualization@lists.linux-foundation.org>
Subject: [PATCH v3 8/8] KVM: arm64: Support the vCPU preemption check
Date: Thu, 16 Jan 2020 20:46:26 +0800
Message-ID: <20200116124626.1155-9-yezengruan@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
In-Reply-To: <20200116124626.1155-1-yezengruan@huawei.com>
References: <20200116124626.1155-1-yezengruan@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.173.221.248]
X-CFilter-Loop: Reflected
Cc: mark.rutland@arm.com, suzuki.poulose@arm.com, peterz@infradead.org,
 maz@kernel.org, daniel.lezcano@linaro.org, linux@armlinux.org.uk,
 steven.price@arm.com, yezengruan@huawei.com, james.morse@arm.com,
 longman@redhat.com, catalin.marinas@arm.com, wanghaibin.wang@huawei.com,
 will@kernel.org, julien.thierry.kdev@gmail.com
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

Support the vcpu_is_preempted() functionality under KVM/arm64. This will
enhance lock performance on overcommitted hosts (more runnable vCPUs
than physical CPUs in the system) as doing busy waits for preempted
vCPUs will hurt system performance far worse than early yielding.

unix benchmark result:
  host:  kernel 5.5.0-rc5, HiSilicon Kunpeng920, 8 CPUs
  guest: kernel 5.5.0-rc5, 16 vCPUs

               test-case                |    after-patch    |   before-patch
----------------------------------------+-------------------+------------------
 Dhrystone 2 using register variables   | 334600751.0 lps   | 335319028.3 lps
 Double-Precision Whetstone             |     32856.1 MWIPS |     32849.6 MWIPS
 Execl Throughput                       |      3662.1 lps   |      2718.0 lps
 File Copy 1024 bufsize 2000 maxblocks  |    432906.4 KBps  |    158011.8 KBps
 File Copy 256 bufsize 500 maxblocks    |    116023.0 KBps  |     37664.0 KBps
 File Copy 4096 bufsize 8000 maxblocks  |   1432769.8 KBps  |    441108.8 KBps
 Pipe Throughput                        |   6405029.6 lps   |   6021457.6 lps
 Pipe-based Context Switching           |    185872.7 lps   |    184255.3 lps
 Process Creation                       |      4025.7 lps   |      3706.6 lps
 Shell Scripts (1 concurrent)           |      6745.6 lpm   |      6436.1 lpm
 Shell Scripts (8 concurrent)           |       998.7 lpm   |       931.1 lpm
 System Call Overhead                   |   3913363.1 lps   |   3883287.8 lps
----------------------------------------+-------------------+------------------
 System Benchmarks Index Score          |      1835.1       |      1327.6

Signed-off-by: Zengruan Ye <yezengruan@huawei.com>
---
 arch/arm64/include/asm/paravirt.h |   3 +
 arch/arm64/kernel/paravirt.c      | 125 ++++++++++++++++++++++++++++++
 arch/arm64/kernel/setup.c         |   2 +
 include/linux/cpuhotplug.h        |   1 +
 4 files changed, 131 insertions(+)

diff --git a/arch/arm64/include/asm/paravirt.h b/arch/arm64/include/asm/paravirt.h
index 7b1c81b544bb..ca3a2c7881f3 100644
--- a/arch/arm64/include/asm/paravirt.h
+++ b/arch/arm64/include/asm/paravirt.h
@@ -29,6 +29,8 @@ static inline u64 paravirt_steal_clock(int cpu)
 
 int __init pv_time_init(void);
 
+int __init pv_lock_init(void);
+
 __visible bool __native_vcpu_is_preempted(int cpu);
 
 static inline bool pv_vcpu_is_preempted(int cpu)
@@ -39,6 +41,7 @@ static inline bool pv_vcpu_is_preempted(int cpu)
 #else
 
 #define pv_time_init() do {} while (0)
+#define pv_lock_init() do {} while (0)
 
 #endif // CONFIG_PARAVIRT
 
diff --git a/arch/arm64/kernel/paravirt.c b/arch/arm64/kernel/paravirt.c
index d8f1ba8c22ce..39c6c35e59c6 100644
--- a/arch/arm64/kernel/paravirt.c
+++ b/arch/arm64/kernel/paravirt.c
@@ -22,6 +22,8 @@
 #include <asm/paravirt.h>
 #include <asm/pvclock-abi.h>
 #include <asm/smp_plat.h>
+#include <asm/pvlock-abi.h>
+#include <asm/hypervisor.h>
 
 struct static_key paravirt_steal_enabled;
 struct static_key paravirt_steal_rq_enabled;
@@ -35,6 +37,10 @@ struct pv_time_stolen_time_region {
 	struct pvclock_vcpu_stolen_time *kaddr;
 };
 
+struct pv_lock_state_region {
+	struct pvlock_vcpu_state *kaddr;
+};
+
 static DEFINE_PER_CPU(struct pv_time_stolen_time_region, stolen_time_region);
 
 static bool steal_acc = true;
@@ -158,3 +164,122 @@ int __init pv_time_init(void)
 
 	return 0;
 }
+
+static DEFINE_PER_CPU(struct pv_lock_state_region, lock_state_region);
+
+static bool kvm_vcpu_is_preempted(int cpu)
+{
+	struct pv_lock_state_region *reg;
+	__le64 preempted_le;
+
+	reg = per_cpu_ptr(&lock_state_region, cpu);
+	if (!reg->kaddr) {
+		pr_warn_once("PV lock enabled but not configured for cpu %d\n",
+			     cpu);
+		return false;
+	}
+
+	preempted_le = le64_to_cpu(READ_ONCE(reg->kaddr->preempted));
+
+	return !!preempted_le;
+}
+
+static int pvlock_vcpu_state_dying_cpu(unsigned int cpu)
+{
+	struct pv_lock_state_region *reg;
+
+	reg = this_cpu_ptr(&lock_state_region);
+	if (!reg->kaddr)
+		return 0;
+
+	memunmap(reg->kaddr);
+	memset(reg, 0, sizeof(*reg));
+
+	return 0;
+}
+
+static int init_pvlock_vcpu_state(unsigned int cpu)
+{
+	struct pv_lock_state_region *reg;
+	struct arm_smccc_res res;
+
+	reg = this_cpu_ptr(&lock_state_region);
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_PV_LOCK_FUNC_ID,
+			     KVM_PV_LOCK_PREEMPTED, &res);
+
+	if (res.a0 == SMCCC_RET_NOT_SUPPORTED) {
+		pr_warn("Failed to init PV lock data structure\n");
+		return -EINVAL;
+	}
+
+	reg->kaddr = memremap(res.a0,
+			      sizeof(struct pvlock_vcpu_state),
+			      MEMREMAP_WB);
+
+	if (!reg->kaddr) {
+		pr_warn("Failed to map PV lock data structure\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int kvm_arm_init_pvlock(void)
+{
+	int ret;
+
+	ret = cpuhp_setup_state(CPUHP_AP_ARM_KVM_PVLOCK_STARTING,
+				"hypervisor/arm/pvlock:starting",
+				init_pvlock_vcpu_state,
+				pvlock_vcpu_state_dying_cpu);
+	if (ret < 0) {
+		pr_warn("PV lock init failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static bool has_kvm_pvlock(void)
+{
+	struct arm_smccc_res res;
+
+	/* To detect the presence of PV lock support we require SMCCC 1.1+ */
+	if (psci_ops.smccc_version < SMCCC_VERSION_1_1)
+		return false;
+
+	if (!kvm_arm_hyp_service_available(
+			ARM_SMCCC_VENDOR_HYP_KVM_PV_LOCK_FUNC_ID)) {
+		pr_warn("PV lock is not available\n");
+		return false;
+	}
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_PV_LOCK_FUNC_ID,
+			     KVM_PV_LOCK_FEATURES, &res);
+
+	if (res.a0 != SMCCC_RET_SUCCESS)
+		return false;
+
+	return true;
+}
+
+int __init pv_lock_init(void)
+{
+	int ret;
+
+	if (is_hyp_mode_available())
+		return 0;
+
+	if (!has_kvm_pvlock())
+		return 0;
+
+	ret = kvm_arm_init_pvlock();
+	if (ret)
+		return ret;
+
+	pv_ops.lock.vcpu_is_preempted = kvm_vcpu_is_preempted;
+	pr_info("using PV lock preempted\n");
+
+	return 0;
+}
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index ad595c30ded0..b2a6c2a435ba 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -376,6 +376,8 @@ void __init setup_arch(char **cmdline_p)
 	smp_init_cpus();
 	smp_build_mpidr_hash();
 
+	pv_lock_init();
+
 	/* Init percpu seeds for random tags after cpus are set up. */
 	kasan_init_tags();
 
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index e51ee772b9f5..f72ff95ab63a 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -138,6 +138,7 @@ enum cpuhp_state {
 	CPUHP_AP_DUMMY_TIMER_STARTING,
 	CPUHP_AP_ARM_XEN_STARTING,
 	CPUHP_AP_ARM_KVMPV_STARTING,
+	CPUHP_AP_ARM_KVM_PVLOCK_STARTING,
 	CPUHP_AP_ARM_CORESIGHT_STARTING,
 	CPUHP_AP_ARM64_ISNDEP_STARTING,
 	CPUHP_AP_SMPCFD_DYING,
-- 
2.19.1


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
