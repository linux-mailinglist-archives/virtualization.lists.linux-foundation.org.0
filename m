Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 12656408432
	for <lists.virtualization@lfdr.de>; Mon, 13 Sep 2021 07:54:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A23A6608B6;
	Mon, 13 Sep 2021 05:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G23lsDpR13rd; Mon, 13 Sep 2021 05:54:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 54A59608A2;
	Mon, 13 Sep 2021 05:54:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBD32C000D;
	Mon, 13 Sep 2021 05:54:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95721C000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 05:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 782F3608A2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 05:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sG45Yhnn0Kei
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 05:54:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0BA460849
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 05:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631512490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J289FhGEIVLXNYP/g9ScWAC9TdBI3SjEeFEwrPpHTIg=;
 b=STI7y5A/iUFnRJk7+ktrIg38hOdjKXz/kdStZU0k4uvPF9PIcLz5TEA0GK1GmP7v6xfaBh
 fsDvd9ZnNll6EqR1Mj+Gi8LGnEEK9EKJudpmj2zXlqa5oNZZg2b3+dJ5O2ZlwVmIlie1JZ
 i3z9sXS4CAW1N8gXl1TxeJoSA8hviq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-uX4mrOuINzO6t4LbmldzyA-1; Mon, 13 Sep 2021 01:54:49 -0400
X-MC-Unique: uX4mrOuINzO6t4LbmldzyA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2837380196C;
 Mon, 13 Sep 2021 05:54:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-146.pek2.redhat.com
 [10.72.13.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA5A15C23A;
 Mon, 13 Sep 2021 05:54:42 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 6/9] virtio_pci: harden MSI-X interrupts
Date: Mon, 13 Sep 2021 13:53:50 +0800
Message-Id: <20210913055353.35219-7-jasowang@redhat.com>
In-Reply-To: <20210913055353.35219-1-jasowang@redhat.com>
References: <20210913055353.35219-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: konrad.wilk@oracle.com, f.hetzelt@tu-berlin.de,
 linux-kernel@vger.kernel.org, david.kaplan@amd.com,
 virtualization@lists.linux-foundation.org
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

We used to synchronize pending MSI-X irq handlers via
synchronize_irq(), this may not work for the untrusted device which
may keep sending interrupts after reset which may lead unexpected
results. Similarly, we should not enable MSI-X interrupt until the
device is ready. So this patch fixes those two issues by:

1) switching to use disable_irq() to prevent the virtio interrupt
   handlers to be called after the device is reset.
2) using IRQF_NO_AUTOEN and enable the MSI-X irq during .ready()

This can make sure the virtio interrupt handler won't be called before
virtio_device_ready() and after reset.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_pci_common.c | 27 +++++++++++++++++++++------
 drivers/virtio/virtio_pci_common.h |  6 ++++--
 drivers/virtio/virtio_pci_legacy.c |  5 +++--
 drivers/virtio/virtio_pci_modern.c |  6 ++++--
 4 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index b35bb2d57f62..0b9523e6dd39 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -24,8 +24,8 @@ MODULE_PARM_DESC(force_legacy,
 		 "Force legacy mode for transitional virtio 1 devices");
 #endif
 
-/* wait for pending irq handlers */
-void vp_synchronize_vectors(struct virtio_device *vdev)
+/* disable irq handlers */
+void vp_disable_vectors(struct virtio_device *vdev)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
 	int i;
@@ -34,7 +34,20 @@ void vp_synchronize_vectors(struct virtio_device *vdev)
 		synchronize_irq(vp_dev->pci_dev->irq);
 
 	for (i = 0; i < vp_dev->msix_vectors; ++i)
-		synchronize_irq(pci_irq_vector(vp_dev->pci_dev, i));
+		disable_irq(pci_irq_vector(vp_dev->pci_dev, i));
+}
+
+/* enable irq handlers */
+void vp_enable_vectors(struct virtio_device *vdev)
+{
+	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	int i;
+
+	if (vp_dev->intx_enabled)
+		return;
+
+	for (i = 0; i < vp_dev->msix_vectors; ++i)
+		enable_irq(pci_irq_vector(vp_dev->pci_dev, i));
 }
 
 /* the notify function used when creating a virt queue */
@@ -141,7 +154,8 @@ static int vp_request_msix_vectors(struct virtio_device *vdev, int nvectors,
 	snprintf(vp_dev->msix_names[v], sizeof *vp_dev->msix_names,
 		 "%s-config", name);
 	err = request_irq(pci_irq_vector(vp_dev->pci_dev, v),
-			  vp_config_changed, 0, vp_dev->msix_names[v],
+			  vp_config_changed, IRQF_NO_AUTOEN,
+			  vp_dev->msix_names[v],
 			  vp_dev);
 	if (err)
 		goto error;
@@ -160,7 +174,8 @@ static int vp_request_msix_vectors(struct virtio_device *vdev, int nvectors,
 		snprintf(vp_dev->msix_names[v], sizeof *vp_dev->msix_names,
 			 "%s-virtqueues", name);
 		err = request_irq(pci_irq_vector(vp_dev->pci_dev, v),
-				  vp_vring_interrupt, 0, vp_dev->msix_names[v],
+				  vp_vring_interrupt, IRQF_NO_AUTOEN,
+				  vp_dev->msix_names[v],
 				  vp_dev);
 		if (err)
 			goto error;
@@ -337,7 +352,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned nvqs,
 			 "%s-%s",
 			 dev_name(&vp_dev->vdev.dev), names[i]);
 		err = request_irq(pci_irq_vector(vp_dev->pci_dev, msix_vec),
-				  vring_interrupt, 0,
+				  vring_interrupt, IRQF_NO_AUTOEN,
 				  vp_dev->msix_names[msix_vec],
 				  vqs[i]);
 		if (err)
diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
index beec047a8f8d..a235ce9ff6a5 100644
--- a/drivers/virtio/virtio_pci_common.h
+++ b/drivers/virtio/virtio_pci_common.h
@@ -102,8 +102,10 @@ static struct virtio_pci_device *to_vp_device(struct virtio_device *vdev)
 	return container_of(vdev, struct virtio_pci_device, vdev);
 }
 
-/* wait for pending irq handlers */
-void vp_synchronize_vectors(struct virtio_device *vdev);
+/* disable irq handlers */
+void vp_disable_vectors(struct virtio_device *vdev);
+/* enable irq handlers */
+void vp_enable_vectors(struct virtio_device *vdev);
 /* the notify function used when creating a virt queue */
 bool vp_notify(struct virtqueue *vq);
 /* the config->del_vqs() implementation */
diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
index d62e9835aeec..bdf6bc667ab5 100644
--- a/drivers/virtio/virtio_pci_legacy.c
+++ b/drivers/virtio/virtio_pci_legacy.c
@@ -97,8 +97,8 @@ static void vp_reset(struct virtio_device *vdev)
 	/* Flush out the status write, and flush in device writes,
 	 * including MSi-X interrupts, if any. */
 	ioread8(vp_dev->ioaddr + VIRTIO_PCI_STATUS);
-	/* Flush pending VQ/configuration callbacks. */
-	vp_synchronize_vectors(vdev);
+	/* Disable VQ/configuration callbacks. */
+	vp_disable_vectors(vdev);
 }
 
 static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
@@ -194,6 +194,7 @@ static void del_vq(struct virtio_pci_vq_info *info)
 }
 
 static const struct virtio_config_ops virtio_pci_config_ops = {
+	.ready		= vp_enable_vectors,
 	.get		= vp_get,
 	.set		= vp_set,
 	.get_status	= vp_get_status,
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 30654d3a0b41..acf0f6b6381d 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -172,8 +172,8 @@ static void vp_reset(struct virtio_device *vdev)
 	 */
 	while (vp_modern_get_status(mdev))
 		msleep(1);
-	/* Flush pending VQ/configuration callbacks. */
-	vp_synchronize_vectors(vdev);
+	/* Disable VQ/configuration callbacks. */
+	vp_disable_vectors(vdev);
 }
 
 static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
@@ -380,6 +380,7 @@ static bool vp_get_shm_region(struct virtio_device *vdev,
 }
 
 static const struct virtio_config_ops virtio_pci_config_nodev_ops = {
+	.ready		= vp_enable_vectors,
 	.get		= NULL,
 	.set		= NULL,
 	.generation	= vp_generation,
@@ -397,6 +398,7 @@ static const struct virtio_config_ops virtio_pci_config_nodev_ops = {
 };
 
 static const struct virtio_config_ops virtio_pci_config_ops = {
+	.ready		= vp_enable_vectors,
 	.get		= vp_get,
 	.set		= vp_set,
 	.generation	= vp_generation,
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
