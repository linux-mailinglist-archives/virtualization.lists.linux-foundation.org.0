Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD382E907F
	for <lists.virtualization@lfdr.de>; Mon,  4 Jan 2021 07:55:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2DD3985E51;
	Mon,  4 Jan 2021 06:55:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C80qOuGqp2pM; Mon,  4 Jan 2021 06:55:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A81FF85F0A;
	Mon,  4 Jan 2021 06:55:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FD91C0893;
	Mon,  4 Jan 2021 06:55:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D67CC013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7801D86F3F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dCDGLQSez5m0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9C33D86ECC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609743339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ZZSlKtIwk5R5NiqAz/H9oLoM6u9d/BSImkhnwLknNw=;
 b=CMNTWTzdVaiNQnjW04LPSS9lE4XdGaAfQczOBr0scx7RwdCWILII8xu5r9uvk54+4O80Kf
 NW5VoI6C0zsn3hQyuXb9nFyNtSh58DeZRizt2HHAD2U3b/MGZbf07tnEoqW9mV+O7VfJfm
 lCKcPLYl4Dvp0Zp9JpJamwqpKuw6Zg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-gUC3Te_NN4Wpup6_EPcY0A-1; Mon, 04 Jan 2021 01:55:35 -0500
X-MC-Unique: gUC3Te_NN4Wpup6_EPcY0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B38CE107ACE3;
 Mon,  4 Jan 2021 06:55:34 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-91.pek2.redhat.com [10.72.13.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11D8F10016FA;
 Mon,  4 Jan 2021 06:55:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V3 06/19] virtio-pci-modern: introduce helpers for setting and
 getting status
Date: Mon,  4 Jan 2021 14:54:50 +0800
Message-Id: <20210104065503.199631-7-jasowang@redhat.com>
In-Reply-To: <20210104065503.199631-1-jasowang@redhat.com>
References: <20210104065503.199631-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: shahafs@mellanox.com, rdunlap@infradead.org, lulu@redhat.com
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

This patch introduces helpers to allow set and get device status.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_pci_modern.c | 37 +++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 2e37bfc89655..ccde0a41209a 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -275,41 +275,62 @@ static u32 vp_generation(struct virtio_device *vdev)
 	return vp_ioread8(&cfg->config_generation);
 }
 
+/*
+ * vp_modern_get_status - get the device status
+ * @mdev: the modern virtio-pci device
+ *
+ * Returns the status read from device
+ */
+static u8 vp_modern_get_status(struct virtio_pci_modern_device *mdev)
+{
+	struct virtio_pci_common_cfg __iomem *cfg = mdev->common;
+
+	return vp_ioread8(&cfg->device_status);
+}
+
 /* config->{get,set}_status() implementations */
 static u8 vp_get_status(struct virtio_device *vdev)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
-	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
+
+	return vp_modern_get_status(&vp_dev->mdev);
+}
+
+/*
+ * vp_modern_set_status - set status to device
+ * @mdev: the modern virtio-pci device
+ * @status: the status set to device
+ */
+static void vp_modern_set_status(struct virtio_pci_modern_device *mdev,
+				 u8 status)
+{
 	struct virtio_pci_common_cfg __iomem *cfg = mdev->common;
 
-	return vp_ioread8(&cfg->device_status);
+	vp_iowrite8(status, &cfg->device_status);
 }
 
 static void vp_set_status(struct virtio_device *vdev, u8 status)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
-	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
-	struct virtio_pci_common_cfg __iomem *cfg = mdev->common;
 
 	/* We should never be setting status to 0. */
 	BUG_ON(status == 0);
-	vp_iowrite8(status, &cfg->device_status);
+	vp_modern_set_status(&vp_dev->mdev, status);
 }
 
 static void vp_reset(struct virtio_device *vdev)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
 	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
-	struct virtio_pci_common_cfg __iomem *cfg = mdev->common;
 
 	/* 0 status means a reset. */
-	vp_iowrite8(0, &cfg->device_status);
+	vp_modern_set_status(mdev, 0);
 	/* After writing 0 to device_status, the driver MUST wait for a read of
 	 * device_status to return 0 before reinitializing the device.
 	 * This will flush out the status write, and flush in device writes,
 	 * including MSI-X interrupts, if any.
 	 */
-	while (vp_ioread8(&cfg->device_status))
+	while (vp_modern_get_status(mdev))
 		msleep(1);
 	/* Flush pending VQ/configuration callbacks. */
 	vp_synchronize_vectors(vdev);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
