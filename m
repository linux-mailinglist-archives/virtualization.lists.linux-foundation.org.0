Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EB94213DA61
	for <lists.virtualization@lfdr.de>; Thu, 16 Jan 2020 13:47:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E95486969;
	Thu, 16 Jan 2020 12:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dqRDmJAGGQUU; Thu, 16 Jan 2020 12:47:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 28E568695C;
	Thu, 16 Jan 2020 12:47:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FAFDC077D;
	Thu, 16 Jan 2020 12:47:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8EFBC077D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C70308693D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LoBScBjAtpEG
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:46:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CD0DB81EE4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 12:46:57 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 9C97F30E39BD4543FFB2;
 Thu, 16 Jan 2020 20:46:54 +0800 (CST)
Received: from DESKTOP-1NISPDV.china.huawei.com (10.173.221.248) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Thu, 16 Jan 2020 20:46:44 +0800
From: Zengruan Ye <yezengruan@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <virtualization@lists.linux-foundation.org>
Subject: [PATCH v3 0/8] KVM: arm64: vCPU preempted check support
Date: Thu, 16 Jan 2020 20:46:18 +0800
Message-ID: <20200116124626.1155-1-yezengruan@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
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

This patch set aims to support the vcpu_is_preempted() functionality
under KVM/arm64, which allowing the guest to obtain the vCPU is
currently running or not. This will enhance lock performance on
overcommitted hosts (more runnable vCPUs than physical CPUs in the
system) as doing busy waits for preempted vCPUs will hurt system
performance far worse than early yielding.

We have observed some performace improvements in uninx benchmark tests.

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

Changes from v2:
https://lore.kernel.org/lkml/20191226135833.1052-1-yezengruan@huawei.com/
 * Post Will's patches as part of this series [1][2], and add the
   probing logic for checking whether the hypervisor is KVM or not
 * Clear PV-lock interface documentation
 * Remove preempted state field
 * Fix build error when CONFIG_PARAVIRT is not set
 * Bunch of typo fixes.

Changes from v1:
https://lore.kernel.org/lkml/20191217135549.3240-1-yezengruan@huawei.com/
 * Guest kernel no longer allocates the PV lock structure, instead it
   is allocated by user space to avoid lifetime issues about kexec.
 * Provide vCPU attributes for PV lock.
 * Update SMC number of PV lock features.
 * Report some basic validation when PV lock init.
 * Document preempted field.
 * Bunch of typo fixes.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=kvm/hvc&id=464f5a1741e5959c3e4d2be1966ae0093b4dce06

[2] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=kvm/hvc&id=6597490e005d0eeca8ed8c1c1d7b4318ee014681

Will Deacon (2):
  arm64: Probe for the presence of KVM hypervisor services during boot
  arm/arm64: KVM: Advertise KVM UID to guests via SMCCC

Zengruan Ye (6):
  KVM: arm64: Document PV-lock interface
  KVM: arm64: Add SMCCC paravirtualised lock calls
  KVM: arm64: Support pvlock preempted via shared structure
  KVM: arm64: Provide vCPU attributes for PV lock
  KVM: arm64: Add interface to support vCPU preempted check
  KVM: arm64: Support the vCPU preemption check

 Documentation/virt/kvm/arm/pvlock.rst   |  68 +++++++++++++
 Documentation/virt/kvm/devices/vcpu.txt |  14 +++
 arch/arm/include/asm/kvm_host.h         |  18 ++++
 arch/arm64/include/asm/hypervisor.h     |  11 ++
 arch/arm64/include/asm/kvm_host.h       |  27 +++++
 arch/arm64/include/asm/paravirt.h       |  15 +++
 arch/arm64/include/asm/pvlock-abi.h     |  16 +++
 arch/arm64/include/asm/spinlock.h       |   9 ++
 arch/arm64/include/uapi/asm/kvm.h       |   2 +
 arch/arm64/kernel/Makefile              |   2 +-
 arch/arm64/kernel/paravirt-spinlocks.c  |  13 +++
 arch/arm64/kernel/paravirt.c            | 129 +++++++++++++++++++++++-
 arch/arm64/kernel/setup.c               |  37 +++++++
 arch/arm64/kvm/Makefile                 |   1 +
 arch/arm64/kvm/guest.c                  |   9 ++
 include/linux/arm-smccc.h               |  36 +++++++
 include/linux/cpuhotplug.h              |   1 +
 include/uapi/linux/kvm.h                |   2 +
 virt/kvm/arm/arm.c                      |   8 ++
 virt/kvm/arm/hypercalls.c               |  54 +++++++---
 virt/kvm/arm/pvlock.c                   | 102 +++++++++++++++++++
 21 files changed, 559 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/virt/kvm/arm/pvlock.rst
 create mode 100644 arch/arm64/include/asm/pvlock-abi.h
 create mode 100644 arch/arm64/kernel/paravirt-spinlocks.c
 create mode 100644 virt/kvm/arm/pvlock.c

-- 
2.19.1


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
