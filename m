Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D9B13DA60
	for <lists.virtualization@lfdr.de>; Thu, 16 Jan 2020 13:47:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 585B4214D2;
	Thu, 16 Jan 2020 12:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jiFtYJeehjvN; Thu, 16 Jan 2020 12:47:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A378921539;
	Thu, 16 Jan 2020 12:47:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96B73C077D;
	Thu, 16 Jan 2020 12:47:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2440C077D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BEDDD8695C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XuTHShdTUTAa
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:46:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 55F3586879
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:46:58 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C0D6D10B7A71FDDEFD05;
 Thu, 16 Jan 2020 20:46:54 +0800 (CST)
Received: from DESKTOP-1NISPDV.china.huawei.com (10.173.221.248) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Thu, 16 Jan 2020 20:46:46 +0800
From: Zengruan Ye <yezengruan@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <virtualization@lists.linux-foundation.org>
Subject: [PATCH v3 2/8] arm64: Probe for the presence of KVM hypervisor
 services during boot
Date: Thu, 16 Jan 2020 20:46:20 +0800
Message-ID: <20200116124626.1155-3-yezengruan@huawei.com>
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

From: Will Deacon <will@kernel.org>

Although the SMCCC specification provides some limited functionality for
describing the presence of hypervisor and firmware services, this is
generally applicable only to functions designated as "Arm Architecture
Service Functions" and no portable discovery mechanism is provided for
standard hypervisor services, despite having a designated range of
function identifiers reserved by the specification.

In an attempt to avoid the need for additional firmware changes every
time a new function is added, introduce a UID to identify the service
provider as being compatible with KVM. Once this has been established,
additional services can be discovered via a feature bitmap.

Signed-off-by: Will Deacon <will@kernel.org>
[yezengruan@huawei.com: rebased]
---
 arch/arm64/include/asm/hypervisor.h | 11 +++++++++
 arch/arm64/kernel/setup.c           | 35 +++++++++++++++++++++++++++++
 include/linux/arm-smccc.h           | 26 +++++++++++++++++++++
 3 files changed, 72 insertions(+)

diff --git a/arch/arm64/include/asm/hypervisor.h b/arch/arm64/include/asm/hypervisor.h
index f9cc1d021791..91e4bd890819 100644
--- a/arch/arm64/include/asm/hypervisor.h
+++ b/arch/arm64/include/asm/hypervisor.h
@@ -2,6 +2,17 @@
 #ifndef _ASM_ARM64_HYPERVISOR_H
 #define _ASM_ARM64_HYPERVISOR_H
 
+#include <linux/arm-smccc.h>
 #include <asm/xen/hypervisor.h>
 
+static inline bool kvm_arm_hyp_service_available(u32 func_id)
+{
+	extern DECLARE_BITMAP(__kvm_arm_hyp_services, ARM_SMCCC_KVM_NUM_FUNCS);
+
+	if (func_id >= ARM_SMCCC_KVM_NUM_FUNCS)
+		return -EINVAL;
+
+	return test_bit(func_id, __kvm_arm_hyp_services);
+}
+
 #endif
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 56f664561754..ad595c30ded0 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/arm-smccc.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/stddef.h>
@@ -275,6 +276,39 @@ static int __init reserve_memblock_reserved_regions(void)
 arch_initcall(reserve_memblock_reserved_regions);
 
 u64 __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = INVALID_HWID };
+DECLARE_BITMAP(__kvm_arm_hyp_services, ARM_SMCCC_KVM_NUM_FUNCS) = { };
+
+static void __init kvm_init_hyp_services(void)
+{
+	int i;
+	struct arm_smccc_res res;
+
+	if (psci_ops.smccc_version == SMCCC_VERSION_1_0)
+		return;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
+	if (res.a0 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0 ||
+	    res.a1 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1 ||
+	    res.a2 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2 ||
+	    res.a3 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3)
+		return;
+
+	memset(&res, 0, sizeof(res));
+	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID, &res);
+	for (i = 0; i < 32; ++i) {
+		if (res.a0 & (i))
+			set_bit(i + (32 * 0), __kvm_arm_hyp_services);
+		if (res.a1 & (i))
+			set_bit(i + (32 * 1), __kvm_arm_hyp_services);
+		if (res.a2 & (i))
+			set_bit(i + (32 * 2), __kvm_arm_hyp_services);
+		if (res.a3 & (i))
+			set_bit(i + (32 * 3), __kvm_arm_hyp_services);
+	}
+
+	pr_info("KVM hypervisor services detected (0x%08lx 0x%08lx 0x%08lx 0x%08lx)\n",
+		res.a3, res.a2, res.a1, res.a0);
+}
 
 void __init setup_arch(char **cmdline_p)
 {
@@ -337,6 +371,7 @@ void __init setup_arch(char **cmdline_p)
 	else
 		psci_acpi_init();
 
+	kvm_init_hyp_services();
 	cpu_read_bootcpu_ops();
 	smp_init_cpus();
 	smp_build_mpidr_hash();
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 59494df0f55b..2b2c295c9109 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -46,11 +46,14 @@
 #define ARM_SMCCC_OWNER_OEM		3
 #define ARM_SMCCC_OWNER_STANDARD	4
 #define ARM_SMCCC_OWNER_STANDARD_HYP	5
+#define ARM_SMCCC_OWNER_VENDOR_HYP	6
 #define ARM_SMCCC_OWNER_TRUSTED_APP	48
 #define ARM_SMCCC_OWNER_TRUSTED_APP_END	49
 #define ARM_SMCCC_OWNER_TRUSTED_OS	50
 #define ARM_SMCCC_OWNER_TRUSTED_OS_END	63
 
+#define ARM_SMCCC_FUNC_QUERY_CALL_UID	0xff01
+
 #define ARM_SMCCC_QUIRK_NONE		0
 #define ARM_SMCCC_QUIRK_QCOM_A6		1 /* Save/restore register a6 */
 
@@ -377,5 +380,28 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
 			   ARM_SMCCC_OWNER_STANDARD_HYP,	\
 			   0x21)
 
+#define ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID				\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_32,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_FUNC_QUERY_CALL_UID)
+
+/* KVM UID value: 28b46fb6-2ec5-11e9-a9ca-4b564d003a74 */
+#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0	0xb66fb428U
+#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1	0xe911c52eU
+#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2	0x564bcaa9U
+#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3	0x743a004dU
+
+/* KVM "vendor specific" services */
+#define ARM_SMCCC_KVM_FUNC_FEATURES		0
+#define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
+#define ARM_SMCCC_KVM_NUM_FUNCS			128
+
+#define ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_32,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_KVM_FUNC_FEATURES)
+
 #endif /*__ASSEMBLY__*/
 #endif /*__LINUX_ARM_SMCCC_H*/
-- 
2.19.1


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
