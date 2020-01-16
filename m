Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C8813DA63
	for <lists.virtualization@lfdr.de>; Thu, 16 Jan 2020 13:47:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 39B35861B2;
	Thu, 16 Jan 2020 12:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9nQi7ZzMRUU; Thu, 16 Jan 2020 12:47:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6547D861E3;
	Thu, 16 Jan 2020 12:47:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53E5CC1D8D;
	Thu, 16 Jan 2020 12:47:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 973A0C077D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8402081EE4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id duf8Dg3QRKpH
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:47:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 01EE586938
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:47:02 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id AA29BC0B62D0F3F8873D;
 Thu, 16 Jan 2020 20:46:59 +0800 (CST)
Received: from DESKTOP-1NISPDV.china.huawei.com (10.173.221.248) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Thu, 16 Jan 2020 20:46:50 +0800
From: Zengruan Ye <yezengruan@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <virtualization@lists.linux-foundation.org>
Subject: [PATCH v3 7/8] KVM: arm64: Add interface to support vCPU preempted
 check
Date: Thu, 16 Jan 2020 20:46:25 +0800
Message-ID: <20200116124626.1155-8-yezengruan@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
In-Reply-To: <20200116124626.1155-1-yezengruan@huawei.com>
References: <20200116124626.1155-1-yezengruan@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.173.221.248]
X-CFilter-Loop: Reflected
Cc: mark.rutland@arm.com, kbuild test robot <lkp@intel.com>,
 suzuki.poulose@arm.com, peterz@infradead.org, maz@kernel.org,
 daniel.lezcano@linaro.org, linux@armlinux.org.uk, steven.price@arm.com,
 yezengruan@huawei.com, james.morse@arm.com, longman@redhat.com,
 catalin.marinas@arm.com, wanghaibin.wang@huawei.com, will@kernel.org,
 julien.thierry.kdev@gmail.com
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

This is to fix some lock holder preemption issues. Some other locks
implementation do a spin loop before acquiring the lock itself.
Currently kernel has an interface of bool vcpu_is_preempted(int cpu). It
takes the CPU as parameter and return true if the CPU is preempted.
Then kernel can break the spin loops upon the retval of vcpu_is_preempted.

As kernel has used this interface, So lets support it.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Zengruan Ye <yezengruan@huawei.com>
---
 arch/arm64/include/asm/paravirt.h      | 12 ++++++++++++
 arch/arm64/include/asm/spinlock.h      |  9 +++++++++
 arch/arm64/kernel/Makefile             |  2 +-
 arch/arm64/kernel/paravirt-spinlocks.c | 13 +++++++++++++
 arch/arm64/kernel/paravirt.c           |  4 +++-
 5 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/kernel/paravirt-spinlocks.c

diff --git a/arch/arm64/include/asm/paravirt.h b/arch/arm64/include/asm/paravirt.h
index cf3a0fd7c1a7..7b1c81b544bb 100644
--- a/arch/arm64/include/asm/paravirt.h
+++ b/arch/arm64/include/asm/paravirt.h
@@ -11,8 +11,13 @@ struct pv_time_ops {
 	unsigned long long (*steal_clock)(int cpu);
 };
 
+struct pv_lock_ops {
+	bool (*vcpu_is_preempted)(int cpu);
+};
+
 struct paravirt_patch_template {
 	struct pv_time_ops time;
+	struct pv_lock_ops lock;
 };
 
 extern struct paravirt_patch_template pv_ops;
@@ -24,6 +29,13 @@ static inline u64 paravirt_steal_clock(int cpu)
 
 int __init pv_time_init(void);
 
+__visible bool __native_vcpu_is_preempted(int cpu);
+
+static inline bool pv_vcpu_is_preempted(int cpu)
+{
+	return pv_ops.lock.vcpu_is_preempted(cpu);
+}
+
 #else
 
 #define pv_time_init() do {} while (0)
diff --git a/arch/arm64/include/asm/spinlock.h b/arch/arm64/include/asm/spinlock.h
index b093b287babf..b5d1982414c5 100644
--- a/arch/arm64/include/asm/spinlock.h
+++ b/arch/arm64/include/asm/spinlock.h
@@ -7,8 +7,17 @@
 
 #include <asm/qrwlock.h>
 #include <asm/qspinlock.h>
+#include <asm/paravirt.h>
 
 /* See include/linux/spinlock.h */
 #define smp_mb__after_spinlock()	smp_mb()
 
+#ifdef CONFIG_PARAVIRT
+#define vcpu_is_preempted vcpu_is_preempted
+static inline bool vcpu_is_preempted(long cpu)
+{
+	return pv_vcpu_is_preempted(cpu);
+}
+#endif // CONFIG_PARAVIRT
+
 #endif /* __ASM_SPINLOCK_H */
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index fc6488660f64..b23cdae433a4 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -50,7 +50,7 @@ obj-$(CONFIG_ARMV8_DEPRECATED)		+= armv8_deprecated.o
 obj-$(CONFIG_ACPI)			+= acpi.o
 obj-$(CONFIG_ACPI_NUMA)			+= acpi_numa.o
 obj-$(CONFIG_ARM64_ACPI_PARKING_PROTOCOL)	+= acpi_parking_protocol.o
-obj-$(CONFIG_PARAVIRT)			+= paravirt.o
+obj-$(CONFIG_PARAVIRT)			+= paravirt.o paravirt-spinlocks.o
 obj-$(CONFIG_RANDOMIZE_BASE)		+= kaslr.o
 obj-$(CONFIG_HIBERNATION)		+= hibernate.o hibernate-asm.o
 obj-$(CONFIG_KEXEC_CORE)		+= machine_kexec.o relocate_kernel.o	\
diff --git a/arch/arm64/kernel/paravirt-spinlocks.c b/arch/arm64/kernel/paravirt-spinlocks.c
new file mode 100644
index 000000000000..718aa773d45c
--- /dev/null
+++ b/arch/arm64/kernel/paravirt-spinlocks.c
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2019 Huawei Technologies Co., Ltd
+ * Author: Zengruan Ye <yezengruan@huawei.com>
+ */
+
+#include <linux/spinlock.h>
+#include <asm/paravirt.h>
+
+__visible bool __native_vcpu_is_preempted(int cpu)
+{
+	return false;
+}
diff --git a/arch/arm64/kernel/paravirt.c b/arch/arm64/kernel/paravirt.c
index 1ef702b0be2d..d8f1ba8c22ce 100644
--- a/arch/arm64/kernel/paravirt.c
+++ b/arch/arm64/kernel/paravirt.c
@@ -26,7 +26,9 @@
 struct static_key paravirt_steal_enabled;
 struct static_key paravirt_steal_rq_enabled;
 
-struct paravirt_patch_template pv_ops;
+struct paravirt_patch_template pv_ops = {
+	.lock.vcpu_is_preempted		= __native_vcpu_is_preempted,
+};
 EXPORT_SYMBOL_GPL(pv_ops);
 
 struct pv_time_stolen_time_region {
-- 
2.19.1


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
