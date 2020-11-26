Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BEC2C5113
	for <lists.virtualization@lfdr.de>; Thu, 26 Nov 2020 10:26:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ADF378724A;
	Thu, 26 Nov 2020 09:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vhx_Ht-pppwa; Thu, 26 Nov 2020 09:26:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 47D2587257;
	Thu, 26 Nov 2020 09:26:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B0A7C0891;
	Thu, 26 Nov 2020 09:26:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58069C0052
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 09:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 445792E1F4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 09:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JH1emU-FISSB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 09:26:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 9CB812E1F0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 09:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606382790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8sE1xeuz6dSZOY7Y1iWTvc0WPQjDNBKr5YtZhz7GgcQ=;
 b=ECx2mbtMXWtIVDMgP6AQ6/6lo2O1mWDk35KhYUiScUPZYExP824V6ovt2RnqbSFTCocu2j
 mNFcPyggZWjC/MCNo9uG6Wsx1B8eby2U18H1dTR2E9HV1+hrvKTAvEqc3/gm3B+XGyJJaO
 hSGM3o3czKhGrxiJA/uN7JbS37iuN0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-qpIXKCq8Moi2uU1I083ccQ-1; Thu, 26 Nov 2020 04:26:28 -0500
X-MC-Unique: qpIXKCq8Moi2uU1I083ccQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B502803F48;
 Thu, 26 Nov 2020 09:26:27 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-213.pek2.redhat.com [10.72.13.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A8FC19C71;
 Thu, 26 Nov 2020 09:26:24 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 06/14] virtio-pci-modern: introduce
 vp_modern_queue_address()
Date: Thu, 26 Nov 2020 17:25:56 +0800
Message-Id: <20201126092604.208033-7-jasowang@redhat.com>
In-Reply-To: <20201126092604.208033-1-jasowang@redhat.com>
References: <20201126092604.208033-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: shahafs@mellanox.com
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

This patch introduce a helper to set virtqueue address for modern address.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_pci_modern.c | 33 ++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index bacc05cbc762..3125987973d3 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -174,6 +174,30 @@ static u16 vp_modern_queue_vector(struct virtio_pci_modern_device *mdev,
 	return vp_ioread16(&cfg->queue_msix_vector);
 }
 
+/*
+ * vp_modern_queue_address - set the virtqueue address
+ * @mdev: the modern virtio-pci device
+ * @index: the queue index
+ * @desc_addr: address of the descriptor area
+ * @driver_addr: address of the driver area
+ * @device_addr: address of the device area
+ */
+static void vp_modern_queue_address(struct virtio_pci_modern_device *mdev,
+				    u16 index, u64 desc_addr, u64 driver_addr,
+				    u64 device_addr)
+{
+	struct virtio_pci_common_cfg __iomem *cfg = mdev->common;
+
+	vp_iowrite16(index, &cfg->queue_select);
+
+	vp_iowrite64_twopart(desc_addr, &cfg->queue_desc_lo,
+			     &cfg->queue_desc_hi);
+	vp_iowrite64_twopart(driver_addr, &cfg->queue_avail_lo,
+			     &cfg->queue_avail_hi);
+	vp_iowrite64_twopart(device_addr, &cfg->queue_used_lo,
+			     &cfg->queue_used_hi);
+}
+
 /* virtio config->finalize_features() implementation */
 static int vp_finalize_features(struct virtio_device *vdev)
 {
@@ -396,12 +420,9 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 
 	/* activate the queue */
 	vp_iowrite16(virtqueue_get_vring_size(vq), &cfg->queue_size);
-	vp_iowrite64_twopart(virtqueue_get_desc_addr(vq),
-			     &cfg->queue_desc_lo, &cfg->queue_desc_hi);
-	vp_iowrite64_twopart(virtqueue_get_avail_addr(vq),
-			     &cfg->queue_avail_lo, &cfg->queue_avail_hi);
-	vp_iowrite64_twopart(virtqueue_get_used_addr(vq),
-			     &cfg->queue_used_lo, &cfg->queue_used_hi);
+	vp_modern_queue_address(mdev, index, virtqueue_get_desc_addr(vq),
+				virtqueue_get_avail_addr(vq),
+				virtqueue_get_used_addr(vq));
 
 	vq->priv = (void __force *)mdev->notify_base +
 		off * mdev->notify_offset_multiplier;
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
