Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A311A910C
	for <lists.virtualization@lfdr.de>; Wed, 15 Apr 2020 04:44:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 79AB38435A;
	Wed, 15 Apr 2020 02:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sMp0g4yV6ATx; Wed, 15 Apr 2020 02:44:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2E858863CE;
	Wed, 15 Apr 2020 02:44:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E285C0172;
	Wed, 15 Apr 2020 02:44:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30C34C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 02:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1A47487E79
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 02:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CEvjbzkH1t6T
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 02:44:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 689B587E6E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 02:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586918650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FTv5AkLYQ+5KJ9sSK50BNsriwFY0NMNF1swhxtvNcFc=;
 b=JS/LjGe9aDi/50oN3rvU/WqguHt2shehJeBu1Qg9mwTA4peBuQDtZmHeR4btvVLv0kfcy9
 8FDwgN/M627iKU3SVDSzp0CDp4EoCMd0MLlMIEJieEAoOmWvLxt/T9LDYjrVLVn2QCnYjk
 ImmpvQUpmXAno2yprBs6SFA9LX3F4OM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-4zcwoXPfPQaXvOe1_HQyAA-1; Tue, 14 Apr 2020 22:44:08 -0400
X-MC-Unique: 4zcwoXPfPQaXvOe1_HQyAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0981800D53;
 Wed, 15 Apr 2020 02:44:06 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-184.pek2.redhat.com [10.72.12.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48DDF12656E;
 Wed, 15 Apr 2020 02:43:57 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH V2] vhost: do not enable VHOST_MENU by default
Date: Wed, 15 Apr 2020 10:43:56 +0800
Message-Id: <20200415024356.23751-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: linux-s390@vger.kernel.org, tsbogend@alpha.franken.de,
 benh@kernel.crashing.org, gor@linux.ibm.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, heiko.carstens@de.ibm.com,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, geert@linux-m68k.org,
 Michael Ellerman <mpe@ellerman.id.au>, netdev@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
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

We try to keep the defconfig untouched after decoupling CONFIG_VHOST
out of CONFIG_VIRTUALIZATION in commit 20c384f1ea1a
("vhost: refine vhost and vringh kconfig") by enabling VHOST_MENU by
default. Then the defconfigs can keep enabling CONFIG_VHOST_NET
without the caring of CONFIG_VHOST.

But this will leave a "CONFIG_VHOST_MENU=y" in all defconfigs and even
for the ones that doesn't want vhost. So it actually shifts the
burdens to the maintainers of all other to add "CONFIG_VHOST_MENU is
not set". So this patch tries to enable CONFIG_VHOST explicitly in
defconfigs that enables CONFIG_VHOST_NET and CONFIG_VHOST_VSOCK.

Acked-by: Christian Borntraeger <borntraeger@de.ibm.com> (s390)
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
Change since V1:
- depends on EVENTFD for VHOST
---
 arch/mips/configs/malta_kvm_defconfig  |  1 +
 arch/powerpc/configs/powernv_defconfig |  1 +
 arch/powerpc/configs/ppc64_defconfig   |  1 +
 arch/powerpc/configs/pseries_defconfig |  1 +
 arch/s390/configs/debug_defconfig      |  1 +
 arch/s390/configs/defconfig            |  1 +
 drivers/vhost/Kconfig                  | 26 +++++++++-----------------
 7 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index 8ef612552a19..06f0c7a0ca87 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -18,6 +18,7 @@ CONFIG_PCI=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
 CONFIG_KVM_MIPS_DEBUG_COP0_COUNTERS=y
+CONFIG_VHOST=m
 CONFIG_VHOST_NET=m
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index 71749377d164..404245b4594d 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -346,5 +346,6 @@ CONFIG_CRYPTO_DEV_VMX=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
 CONFIG_KVM_BOOK3S_64_HV=m
+CONFIG_VHOST=m
 CONFIG_VHOST_NET=m
 CONFIG_PRINTK_TIME=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 7e68cb222c7b..4599fc7be285 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -61,6 +61,7 @@ CONFIG_ELECTRA_CF=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
 CONFIG_KVM_BOOK3S_64_HV=m
+CONFIG_VHOST=m
 CONFIG_VHOST_NET=m
 CONFIG_OPROFILE=m
 CONFIG_KPROBES=y
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index 6b68109e248f..4cad3901b5de 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -321,5 +321,6 @@ CONFIG_CRYPTO_DEV_VMX=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
 CONFIG_KVM_BOOK3S_64_HV=m
+CONFIG_VHOST=m
 CONFIG_VHOST_NET=m
 CONFIG_PRINTK_TIME=y
diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index 0c86ba19fa2b..6ec6e69630d1 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -57,6 +57,7 @@ CONFIG_PROTECTED_VIRTUALIZATION_GUEST=y
 CONFIG_CMM=m
 CONFIG_APPLDATA_BASE=y
 CONFIG_KVM=m
+CONFIG_VHOST=m
 CONFIG_VHOST_NET=m
 CONFIG_VHOST_VSOCK=m
 CONFIG_OPROFILE=m
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index 6b27d861a9a3..d1b3bf83d687 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -57,6 +57,7 @@ CONFIG_PROTECTED_VIRTUALIZATION_GUEST=y
 CONFIG_CMM=m
 CONFIG_APPLDATA_BASE=y
 CONFIG_KVM=m
+CONFIG_VHOST=m
 CONFIG_VHOST_NET=m
 CONFIG_VHOST_VSOCK=m
 CONFIG_OPROFILE=m
diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
index e79cbbdfea45..29f171a53d8a 100644
--- a/drivers/vhost/Kconfig
+++ b/drivers/vhost/Kconfig
@@ -12,23 +12,19 @@ config VHOST_RING
 	  This option is selected by any driver which needs to access
 	  the host side of a virtio ring.
 
-config VHOST
-	tristate
+menuconfig VHOST
+	tristate "Vhost Devices"
+	depends on EVENTFD
 	select VHOST_IOTLB
 	help
-	  This option is selected by any driver which needs to access
-	  the core of vhost.
+	  Enable option to support host kernel or hardware accelerator
+	  for virtio device.
 
-menuconfig VHOST_MENU
-	bool "VHOST drivers"
-	default y
-
-if VHOST_MENU
+if VHOST
 
 config VHOST_NET
 	tristate "Host kernel accelerator for virtio net"
-	depends on NET && EVENTFD && (TUN || !TUN) && (TAP || !TAP)
-	select VHOST
+	depends on NET && (TUN || !TUN) && (TAP || !TAP)
 	---help---
 	  This kernel module can be loaded in host kernel to accelerate
 	  guest networking with virtio_net. Not to be confused with virtio_net
@@ -39,8 +35,7 @@ config VHOST_NET
 
 config VHOST_SCSI
 	tristate "VHOST_SCSI TCM fabric driver"
-	depends on TARGET_CORE && EVENTFD
-	select VHOST
+	depends on TARGET_CORE
 	default n
 	---help---
 	Say M here to enable the vhost_scsi TCM fabric module
@@ -48,8 +43,7 @@ config VHOST_SCSI
 
 config VHOST_VSOCK
 	tristate "vhost virtio-vsock driver"
-	depends on VSOCKETS && EVENTFD
-	select VHOST
+	depends on VSOCKETS
 	select VIRTIO_VSOCKETS_COMMON
 	default n
 	---help---
@@ -62,8 +56,6 @@ config VHOST_VSOCK
 
 config VHOST_VDPA
 	tristate "Vhost driver for vDPA-based backend"
-	depends on EVENTFD
-	select VHOST
 	depends on VDPA
 	help
 	  This kernel module can be loaded in host kernel to accelerate
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
