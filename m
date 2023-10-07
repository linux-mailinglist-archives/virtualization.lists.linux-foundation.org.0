Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC7F7BC22C
	for <lists.virtualization@lfdr.de>; Sat,  7 Oct 2023 00:20:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA2D46FAC5;
	Fri,  6 Oct 2023 22:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA2D46FAC5
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GtY6ChTd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ubg2HRt73-Lp; Fri,  6 Oct 2023 22:20:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6921260F6C;
	Fri,  6 Oct 2023 22:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6921260F6C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78207C008C;
	Fri,  6 Oct 2023 22:20:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C40A5C0032
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Oct 2023 22:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9406460E4A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Oct 2023 22:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9406460E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8S41hs1oPMNa
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Oct 2023 22:20:00 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21D1660C15
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Oct 2023 22:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21D1660C15
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1014FB82A7C;
 Fri,  6 Oct 2023 22:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E9EC433C8;
 Fri,  6 Oct 2023 22:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696630797;
 bh=WGyqp51USRKGjf5xzGkqKPciBO+afTjUzN5NoFsInhk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=GtY6ChTdMyFPhMz7PFi1cYgRvcMxAesQx7AC9iOKiRU3OyJ1078UhZ+GkOeibMFDE
 p/ue0rDkC/tnITau1VzILI/K4r8vM/0hG00cOggq8MtI8140P/B7Bwwg7jr1iAyS4/
 RMyfAWj2i3q9ZKgxRluy9KE48o9ggeStHXdhxTJUwRS3EGZy9zH0Sr/4GsD5IeiahR
 khbiWHZ9erTlCZtDttupbkRtlAYyxeevyOssKHbm5yBqXFPbd9HAANFlXIBsCI8VX2
 Liz/sxBBe8sRs1smRcUB1l+3qK2sOuYjvtN7E1RYMlj8cfwYgTxncYLpug4otRJjL0
 LbLv8g5IkGAmg==
Date: Fri, 6 Oct 2023 17:19:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [-next 0/5] Add the pci_is_vga() helper and use it
Message-ID: <20231006221955.GA874670@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830111532.444535-1-sui.jingfeng@linux.dev>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 Chia-I Wu <olvaffe@gmail.com>
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

On Wed, Aug 30, 2023 at 07:15:27PM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> The PCI code and ID assignment specification defined four types of
> display controllers for the display base class(03h), and the devices
> with 0x00h sub-class code are VGA devices. VGA devices with programming
> interface 0x00 is VGA-compatible, VGA devices with programming interface
> 0x01 are 8514-compatible controllers. Besides, PCI_CLASS_NOT_DEFINED_VGA
> is defined to provide backward compatibility for devices that were built
> before the class code field was defined. Thus, PCI(e) device with the
> PCI_CLASS_NOT_DEFINED_VGA class code should also be handled as the normal
> VGA-compatible devices.
> 
> Compared with the "if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)" code,
> the newly implemented pci_is_vga() is shorter and straightforward. So it
> is more easy to use. It is designed as a inline function, the more common
> case "if ((pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA))" is put before the
> less common case "if ((pdev->class >> 8) == PCI_CLASS_NOT_DEFINED_VGA)",
> so there should no performance penalty.
> 
> Sui Jingfeng (5):
>   PCI: Add the pci_is_vga() helper
>   PCI/VGA: Deal with VGA devices
>   PCI/sysfs: Use pci_is_vga() helper
>   drm/virgpu: Switch to pci_is_vga()
>   drm/qxl: Switch to pci_is_vga()
> 
>  drivers/gpu/drm/qxl/qxl_drv.c        | 11 +++--------
>  drivers/gpu/drm/virtio/virtgpu_drv.c |  2 +-
>  drivers/pci/pci-sysfs.c              |  6 +++---
>  drivers/pci/vgaarb.c                 | 19 +++++++++----------
>  include/linux/pci.h                  | 27 +++++++++++++++++++++++++++
>  5 files changed, 43 insertions(+), 22 deletions(-)

I applied these on pci/vga for v6.7, thanks!

Please take a look at
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=vga
and let me know if I broke anything because I changed a few things;
interdiff below:

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 522708938563..252ee29fd697 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1551,9 +1551,8 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct pci_dev *pdev = to_pci_dev(dev);
 
-	if (a == &dev_attr_boot_vga.attr)
-		if (pci_is_vga(pdev))
-			return a->mode;
+	if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
+		return a->mode;
 
 	return 0;
 }
diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index ef8fe685de67..feca96fc4255 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -1499,6 +1499,7 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
 
 	vgaarb_dbg(dev, "%s\n", __func__);
 
+	/* Only deal with VGA class devices */
 	if (!pci_is_vga(pdev))
 		return 0;
 
@@ -1536,8 +1537,8 @@ static struct miscdevice vga_arb_device = {
 
 static int __init vga_arb_device_init(void)
 {
-	struct pci_dev *pdev = NULL;
 	int rc;
+	struct pci_dev *pdev;
 
 	rc = misc_register(&vga_arb_device);
 	if (rc < 0)
@@ -1546,11 +1547,13 @@ static int __init vga_arb_device_init(void)
 	bus_register_notifier(&pci_bus_type, &pci_notifier);
 
 	/* Add all VGA class PCI devices by default */
-	do {
-		pdev = pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID, pdev);
+	pdev = NULL;
+	while ((pdev =
+		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
+			       PCI_ANY_ID, pdev)) != NULL) {
 		if (pci_is_vga(pdev))
 			vga_arbiter_add_pci_device(pdev);
-	} while (pdev);
+	}
 
 	pr_info("loaded\n");
 	return rc;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 53e24e31c27e..7bab234391cb 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -714,23 +714,20 @@ static inline bool pci_is_bridge(struct pci_dev *dev)
 }
 
 /**
- * The PCI code and ID assignment specification defined four types of
- * display controllers for the display base class(03h), and the devices
- * with 0x00h sub-class code are VGA devices. VGA devices with programming
- * interface 0x00 is VGA-compatible, VGA devices with programming interface
- * 0x01 are 8514-compatible controllers. Besides, PCI_CLASS_NOT_DEFINED_VGA
- * is defined to provide backward compatibility for devices that were built
- * before the class code field was defined. This means that it belong to the
- * VGA devices category also.
+ * pci_is_vga - check if the PCI device is a VGA device
  *
- * Returns:
- * true if the PCI device is a VGA device, false otherwise.
+ * The PCI Code and ID Assignment spec, r1.15, secs 1.4 and 1.1, define
+ * VGA Base Class and Sub-Classes:
+ *
+ *   03 00  PCI_CLASS_DISPLAY_VGA      VGA-compatible or 8514-compatible
+ *   00 01  PCI_CLASS_NOT_DEFINED_VGA  VGA-compatible (before Class Code)
+ *
+ * Return true if the PCI device is a VGA device and uses the legacy VGA
+ * resources ([mem 0xa0000-0xbffff], [io 0x3b0-0x3bb], [io 0x3c0-0x3df] and
+ * aliases).
  */
 static inline bool pci_is_vga(struct pci_dev *pdev)
 {
-	if (!pdev)
-		return false;
-
 	if ((pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
 		return true;
 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
