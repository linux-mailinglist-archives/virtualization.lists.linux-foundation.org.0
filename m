Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8BA4E4B55
	for <lists.virtualization@lfdr.de>; Wed, 23 Mar 2022 04:15:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42E4C612D1;
	Wed, 23 Mar 2022 03:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZKToq9NZEOLl; Wed, 23 Mar 2022 03:15:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DFDBD612C9;
	Wed, 23 Mar 2022 03:15:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D068C0073;
	Wed, 23 Mar 2022 03:15:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98377C000B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Mar 2022 03:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8434440CA6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Mar 2022 03:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aQj9Tx8Z_jWs
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Mar 2022 03:15:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AB4440C98
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Mar 2022 03:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648005338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVrjcP1lrBTCbvCHht5yAGBOLG7SBcbqKikxAiB9SAI=;
 b=JMYu/pZXOlUDEYnOt6+aSJzbqGEQoPEoToaZzxP4Y6PWl5u/TME7ymV/hdBEuRh7Oop1Xq
 mrHHVQrWv9tggJWK7S1U0/gFQ3StPrHUnwL6UdoRYn/peTgoiHmg4fWQUElOg7bWxTKSu7
 8M/FpWv+0LwCwz0sEnRYICRmDCIo8U0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-riB5se-NO0e12lAtJj5Xiw-1; Tue, 22 Mar 2022 23:15:34 -0400
X-MC-Unique: riB5se-NO0e12lAtJj5Xiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C31685A5BC;
 Wed, 23 Mar 2022 03:15:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-49.pek2.redhat.com [10.72.12.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C1EA1427AF5;
 Wed, 23 Mar 2022 03:15:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Revert "virtio_pci: harden MSI-X interrupts"
Date: Wed, 23 Mar 2022 11:15:24 +0800
Message-Id: <20220323031524.6555-2-jasowang@redhat.com>
In-Reply-To: <20220323031524.6555-1-jasowang@redhat.com>
References: <20220323031524.6555-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Cc: peterz@infradead.org, Marc Zyngier <maz@kernel.org>, tglx@linutronix.de
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

This reverts commit 9e35276a5344f74d4a3600fc4100b3dd251d5c56. Issue
were reported for the drivers that are using affinity managed IRQ
where manually toggling IRQ status is not expected. And we forget to
enable the interrupts in the restore path as well.

In the future, we will rework on the interrupt hardening.

Fixes: 9e35276a5344 ("virtio_pci: harden MSI-X interrupts")
Reported-by: Marc Zyngier <maz@kernel.org>
Reported-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_pci_common.c | 27 ++++++---------------------
 drivers/virtio/virtio_pci_common.h |  6 ++----
 drivers/virtio/virtio_pci_legacy.c |  5 ++---
 drivers/virtio/virtio_pci_modern.c |  6 ++----
 4 files changed, 12 insertions(+), 32 deletions(-)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index 3f51fdb7be45..d724f676608b 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -24,8 +24,8 @@ MODULE_PARM_DESC(force_legacy,
 		 "Force legacy mode for transitional virtio 1 devices");
 #endif
 
-/* disable irq handlers */
-void vp_disable_cbs(struct virtio_device *vdev)
+/* wait for pending irq handlers */
+void vp_synchronize_vectors(struct virtio_device *vdev)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
 	int i;
@@ -34,20 +34,7 @@ void vp_disable_cbs(struct virtio_device *vdev)
 		synchronize_irq(vp_dev->pci_dev->irq);
 
 	for (i = 0; i < vp_dev->msix_vectors; ++i)
-		disable_irq(pci_irq_vector(vp_dev->pci_dev, i));
-}
-
-/* enable irq handlers */
-void vp_enable_cbs(struct virtio_device *vdev)
-{
-	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
-	int i;
-
-	if (vp_dev->intx_enabled)
-		return;
-
-	for (i = 0; i < vp_dev->msix_vectors; ++i)
-		enable_irq(pci_irq_vector(vp_dev->pci_dev, i));
+		synchronize_irq(pci_irq_vector(vp_dev->pci_dev, i));
 }
 
 /* the notify function used when creating a virt queue */
@@ -154,8 +141,7 @@ static int vp_request_msix_vectors(struct virtio_device *vdev, int nvectors,
 	snprintf(vp_dev->msix_names[v], sizeof *vp_dev->msix_names,
 		 "%s-config", name);
 	err = request_irq(pci_irq_vector(vp_dev->pci_dev, v),
-			  vp_config_changed, IRQF_NO_AUTOEN,
-			  vp_dev->msix_names[v],
+			  vp_config_changed, 0, vp_dev->msix_names[v],
 			  vp_dev);
 	if (err)
 		goto error;
@@ -174,8 +160,7 @@ static int vp_request_msix_vectors(struct virtio_device *vdev, int nvectors,
 		snprintf(vp_dev->msix_names[v], sizeof *vp_dev->msix_names,
 			 "%s-virtqueues", name);
 		err = request_irq(pci_irq_vector(vp_dev->pci_dev, v),
-				  vp_vring_interrupt, IRQF_NO_AUTOEN,
-				  vp_dev->msix_names[v],
+				  vp_vring_interrupt, 0, vp_dev->msix_names[v],
 				  vp_dev);
 		if (err)
 			goto error;
@@ -352,7 +337,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned nvqs,
 			 "%s-%s",
 			 dev_name(&vp_dev->vdev.dev), names[i]);
 		err = request_irq(pci_irq_vector(vp_dev->pci_dev, msix_vec),
-				  vring_interrupt, IRQF_NO_AUTOEN,
+				  vring_interrupt, 0,
 				  vp_dev->msix_names[msix_vec],
 				  vqs[i]);
 		if (err)
diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
index d3c6f72c7390..eb17a29fc7ef 100644
--- a/drivers/virtio/virtio_pci_common.h
+++ b/drivers/virtio/virtio_pci_common.h
@@ -101,10 +101,8 @@ static struct virtio_pci_device *to_vp_device(struct virtio_device *vdev)
 	return container_of(vdev, struct virtio_pci_device, vdev);
 }
 
-/* disable irq handlers */
-void vp_disable_cbs(struct virtio_device *vdev);
-/* enable irq handlers */
-void vp_enable_cbs(struct virtio_device *vdev);
+/* wait for pending irq handlers */
+void vp_synchronize_vectors(struct virtio_device *vdev);
 /* the notify function used when creating a virt queue */
 bool vp_notify(struct virtqueue *vq);
 /* the config->del_vqs() implementation */
diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
index 34141b9abe27..6f4e34ce96b8 100644
--- a/drivers/virtio/virtio_pci_legacy.c
+++ b/drivers/virtio/virtio_pci_legacy.c
@@ -98,8 +98,8 @@ static void vp_reset(struct virtio_device *vdev)
 	/* Flush out the status write, and flush in device writes,
 	 * including MSi-X interrupts, if any. */
 	vp_legacy_get_status(&vp_dev->ldev);
-	/* Disable VQ/configuration callbacks. */
-	vp_disable_cbs(vdev);
+	/* Flush pending VQ/configuration callbacks. */
+	vp_synchronize_vectors(vdev);
 }
 
 static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
@@ -185,7 +185,6 @@ static void del_vq(struct virtio_pci_vq_info *info)
 }
 
 static const struct virtio_config_ops virtio_pci_config_ops = {
-	.enable_cbs	= vp_enable_cbs,
 	.get		= vp_get,
 	.set		= vp_set,
 	.get_status	= vp_get_status,
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 5455bc041fb6..30654d3a0b41 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -172,8 +172,8 @@ static void vp_reset(struct virtio_device *vdev)
 	 */
 	while (vp_modern_get_status(mdev))
 		msleep(1);
-	/* Disable VQ/configuration callbacks. */
-	vp_disable_cbs(vdev);
+	/* Flush pending VQ/configuration callbacks. */
+	vp_synchronize_vectors(vdev);
 }
 
 static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
@@ -380,7 +380,6 @@ static bool vp_get_shm_region(struct virtio_device *vdev,
 }
 
 static const struct virtio_config_ops virtio_pci_config_nodev_ops = {
-	.enable_cbs	= vp_enable_cbs,
 	.get		= NULL,
 	.set		= NULL,
 	.generation	= vp_generation,
@@ -398,7 +397,6 @@ static const struct virtio_config_ops virtio_pci_config_nodev_ops = {
 };
 
 static const struct virtio_config_ops virtio_pci_config_ops = {
-	.enable_cbs	= vp_enable_cbs,
 	.get		= vp_get,
 	.set		= vp_set,
 	.generation	= vp_generation,
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
