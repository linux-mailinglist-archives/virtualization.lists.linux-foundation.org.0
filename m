Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD8230D42D
	for <lists.virtualization@lfdr.de>; Wed,  3 Feb 2021 08:45:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 33BF08709D;
	Wed,  3 Feb 2021 07:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DcA8FluWd9qi; Wed,  3 Feb 2021 07:45:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 29AD0870A7;
	Wed,  3 Feb 2021 07:45:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C974C013A;
	Wed,  3 Feb 2021 07:45:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13B3CC0FA7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 07:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 02A2985B95
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 07:45:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BU8C0sJonioB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 07:45:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 26568866B1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 07:45:44 +0000 (UTC)
IronPort-SDR: 8qQ9KRPkK2Ki9zOLpKzcqlOUJQ2oQqd4PzxCnP9wvqOO02yKFZsSFNQRlYwxaFDWlU3u/FDsUX
 bFTJl8LcLfhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="180225887"
X-IronPort-AV: E=Sophos;i="5.79,397,1602572400"; d="scan'208";a="180225887"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 23:45:42 -0800
IronPort-SDR: fF5rkfoPZ3vH4cAOnZJ93QU6teDZbRms7Gt+k1nvmnpa++aDyxq6/NwE96jfVzVUQztYdFwicu
 7WyTItDCs/3w==
X-IronPort-AV: E=Sophos;i="5.79,397,1602572400"; d="scan'208";a="433280695"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 23:45:41 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org
Subject: [RFC v3 1/3] kvm: Add a notifier for create and destroy VM events
Date: Tue,  2 Feb 2021 23:35:15 -0800
Message-Id: <20210203073517.1908882-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Cc: dongwon.kim@intel.com, daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
 daniel.vetter@intel.com, christian.koenig@amd.com, linux-media@vger.kernel.org
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

After registering with this notifier, other drivers that are dependent
on KVM can get notified whenever a VM is created or destroyed. This
also provides a way for sharing the KVM instance pointer with other
drivers.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/linux/kvm_host.h |  5 +++++
 virt/kvm/kvm_main.c      | 20 ++++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f3b1013fb22c..fc1a688301a0 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -88,6 +88,9 @@
 #define KVM_PFN_ERR_HWPOISON	(KVM_PFN_ERR_MASK + 1)
 #define KVM_PFN_ERR_RO_FAULT	(KVM_PFN_ERR_MASK + 2)
 
+#define KVM_EVENT_CREATE_VM 0
+#define KVM_EVENT_DESTROY_VM 1
+
 /*
  * error pfns indicate that the gfn is in slot but faild to
  * translate it to pfn on host.
@@ -1494,5 +1497,7 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
 
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
+int kvm_vm_register_notifier(struct notifier_block *nb);
+int kvm_vm_unregister_notifier(struct notifier_block *nb);
 
 #endif
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 5f260488e999..8a0e8bb02a5f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -101,6 +101,8 @@ DEFINE_MUTEX(kvm_lock);
 static DEFINE_RAW_SPINLOCK(kvm_count_lock);
 LIST_HEAD(vm_list);
 
+static struct blocking_notifier_head kvm_vm_notifier;
+
 static cpumask_var_t cpus_hardware_enabled;
 static int kvm_usage_count;
 static atomic_t hardware_enable_failed;
@@ -148,12 +150,20 @@ static void kvm_io_bus_destroy(struct kvm_io_bus *bus);
 __visible bool kvm_rebooting;
 EXPORT_SYMBOL_GPL(kvm_rebooting);
 
-#define KVM_EVENT_CREATE_VM 0
-#define KVM_EVENT_DESTROY_VM 1
 static void kvm_uevent_notify_change(unsigned int type, struct kvm *kvm);
 static unsigned long long kvm_createvm_count;
 static unsigned long long kvm_active_vms;
 
+inline int kvm_vm_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&kvm_vm_notifier, nb);
+}
+
+inline int kvm_vm_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&kvm_vm_notifier, nb);
+}
+
 __weak void kvm_arch_mmu_notifier_invalidate_range(struct kvm *kvm,
 						   unsigned long start, unsigned long end)
 {
@@ -808,6 +818,8 @@ static struct kvm *kvm_create_vm(unsigned long type)
 
 	preempt_notifier_inc();
 
+	blocking_notifier_call_chain(&kvm_vm_notifier,
+				     KVM_EVENT_CREATE_VM, kvm);
 	return kvm;
 
 out_err:
@@ -886,6 +898,8 @@ static void kvm_destroy_vm(struct kvm *kvm)
 	preempt_notifier_dec();
 	hardware_disable_all();
 	mmdrop(mm);
+	blocking_notifier_call_chain(&kvm_vm_notifier,
+				     KVM_EVENT_DESTROY_VM, kvm);
 }
 
 void kvm_get_kvm(struct kvm *kvm)
@@ -4968,6 +4982,8 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	r = kvm_vfio_ops_init();
 	WARN_ON(r);
 
+	BLOCKING_INIT_NOTIFIER_HEAD(&kvm_vm_notifier);
+
 	return 0;
 
 out_unreg:
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
