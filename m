Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D65DB2CE6C8
	for <lists.virtualization@lfdr.de>; Fri,  4 Dec 2020 05:04:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 78F8887432;
	Fri,  4 Dec 2020 04:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhYDz13MHX41; Fri,  4 Dec 2020 04:04:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ABD728748B;
	Fri,  4 Dec 2020 04:04:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92910C163C;
	Fri,  4 Dec 2020 04:04:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A0B1C0FA7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 04:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 76BA487432
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 04:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ho_TeiJHhJrf
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 04:04:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A7165871FB
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 04:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607054649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sx9CkeT49Y5v/fsgiCMvf06VGl1fCTjvDM6d0ED+Sx0=;
 b=blyewN+/EHsu0juzdE8rBEPIQ67uQkq6DNymsRqRnjFPW9BH1UIHDJRSVHDmo6TGE7pLCd
 0N889ftgFNfKHj7EcsKSVPRWmgHzx+Wt3v0L6v2MTsNZaid5hnpZA+i8WJgHq2Nw1GtsyQ
 ZMCX0QbAaICtlaosmxi/FsZrroarFG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-saaPgZWhOvSq_RnKGiPaOg-1; Thu, 03 Dec 2020 23:04:05 -0500
X-MC-Unique: saaPgZWhOvSq_RnKGiPaOg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 799A580EF80;
 Fri,  4 Dec 2020 04:04:04 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-116.pek2.redhat.com [10.72.12.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02E8E1A4D0;
 Fri,  4 Dec 2020 04:04:01 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 01/19] virtio-pci: do not access iomem via struct
 virtio_pci_device directly
Date: Fri,  4 Dec 2020 12:03:35 +0800
Message-Id: <20201204040353.21679-2-jasowang@redhat.com>
In-Reply-To: <20201204040353.21679-1-jasowang@redhat.com>
References: <20201204040353.21679-1-jasowang@redhat.com>
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

Instead of accessing iomem via struct virito_pci_device directly,
tweak to call the io accessors through the iomem structure. This will
ease the splitting of modern virtio device logic.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_pci_modern.c | 76 ++++++++++++++++++------------
 1 file changed, 46 insertions(+), 30 deletions(-)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 3d6ae5a5e252..df1481fd400c 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -141,12 +141,13 @@ static void __iomem *map_capability(struct pci_dev *dev, int off,
 static u64 vp_get_features(struct virtio_device *vdev)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	struct virtio_pci_common_cfg __iomem *cfg = vp_dev->common;
 	u64 features;
 
-	vp_iowrite32(0, &vp_dev->common->device_feature_select);
-	features = vp_ioread32(&vp_dev->common->device_feature);
-	vp_iowrite32(1, &vp_dev->common->device_feature_select);
-	features |= ((u64)vp_ioread32(&vp_dev->common->device_feature) << 32);
+	vp_iowrite32(0, &cfg->device_feature_select);
+	features = vp_ioread32(&cfg->device_feature);
+	vp_iowrite32(1, &cfg->device_feature_select);
+	features |= ((u64)vp_ioread32(&cfg->device_feature) << 32);
 
 	return features;
 }
@@ -165,6 +166,7 @@ static void vp_transport_features(struct virtio_device *vdev, u64 features)
 static int vp_finalize_features(struct virtio_device *vdev)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	struct virtio_pci_common_cfg __iomem *cfg = vp_dev->common;
 	u64 features = vdev->features;
 
 	/* Give virtio_ring a chance to accept features. */
@@ -179,10 +181,10 @@ static int vp_finalize_features(struct virtio_device *vdev)
 		return -EINVAL;
 	}
 
-	vp_iowrite32(0, &vp_dev->common->guest_feature_select);
-	vp_iowrite32((u32)vdev->features, &vp_dev->common->guest_feature);
-	vp_iowrite32(1, &vp_dev->common->guest_feature_select);
-	vp_iowrite32(vdev->features >> 32, &vp_dev->common->guest_feature);
+	vp_iowrite32(0, &cfg->guest_feature_select);
+	vp_iowrite32((u32)vdev->features, &cfg->guest_feature);
+	vp_iowrite32(1, &cfg->guest_feature_select);
+	vp_iowrite32(vdev->features >> 32, &cfg->guest_feature);
 
 	return 0;
 }
@@ -192,6 +194,7 @@ static void vp_get(struct virtio_device *vdev, unsigned offset,
 		   void *buf, unsigned len)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	void __iomem *device = vp_dev->device;
 	u8 b;
 	__le16 w;
 	__le32 l;
@@ -200,21 +203,21 @@ static void vp_get(struct virtio_device *vdev, unsigned offset,
 
 	switch (len) {
 	case 1:
-		b = ioread8(vp_dev->device + offset);
+		b = ioread8(device + offset);
 		memcpy(buf, &b, sizeof b);
 		break;
 	case 2:
-		w = cpu_to_le16(ioread16(vp_dev->device + offset));
+		w = cpu_to_le16(ioread16(device + offset));
 		memcpy(buf, &w, sizeof w);
 		break;
 	case 4:
-		l = cpu_to_le32(ioread32(vp_dev->device + offset));
+		l = cpu_to_le32(ioread32(device + offset));
 		memcpy(buf, &l, sizeof l);
 		break;
 	case 8:
-		l = cpu_to_le32(ioread32(vp_dev->device + offset));
+		l = cpu_to_le32(ioread32(device + offset));
 		memcpy(buf, &l, sizeof l);
-		l = cpu_to_le32(ioread32(vp_dev->device + offset + sizeof l));
+		l = cpu_to_le32(ioread32(device + offset + sizeof l));
 		memcpy(buf + sizeof l, &l, sizeof l);
 		break;
 	default:
@@ -228,6 +231,7 @@ static void vp_set(struct virtio_device *vdev, unsigned offset,
 		   const void *buf, unsigned len)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	void __iomem *device = vp_dev->device;
 	u8 b;
 	__le16 w;
 	__le32 l;
@@ -237,21 +241,21 @@ static void vp_set(struct virtio_device *vdev, unsigned offset,
 	switch (len) {
 	case 1:
 		memcpy(&b, buf, sizeof b);
-		iowrite8(b, vp_dev->device + offset);
+		iowrite8(b, device + offset);
 		break;
 	case 2:
 		memcpy(&w, buf, sizeof w);
-		iowrite16(le16_to_cpu(w), vp_dev->device + offset);
+		iowrite16(le16_to_cpu(w), device + offset);
 		break;
 	case 4:
 		memcpy(&l, buf, sizeof l);
-		iowrite32(le32_to_cpu(l), vp_dev->device + offset);
+		iowrite32(le32_to_cpu(l), device + offset);
 		break;
 	case 8:
 		memcpy(&l, buf, sizeof l);
-		iowrite32(le32_to_cpu(l), vp_dev->device + offset);
+		iowrite32(le32_to_cpu(l), device + offset);
 		memcpy(&l, buf + sizeof l, sizeof l);
-		iowrite32(le32_to_cpu(l), vp_dev->device + offset + sizeof l);
+		iowrite32(le32_to_cpu(l), device + offset + sizeof l);
 		break;
 	default:
 		BUG();
@@ -261,35 +265,43 @@ static void vp_set(struct virtio_device *vdev, unsigned offset,
 static u32 vp_generation(struct virtio_device *vdev)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
-	return vp_ioread8(&vp_dev->common->config_generation);
+	struct virtio_pci_common_cfg __iomem *cfg = vp_dev->common;
+
+	return vp_ioread8(&cfg->config_generation);
 }
 
 /* config->{get,set}_status() implementations */
 static u8 vp_get_status(struct virtio_device *vdev)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
-	return vp_ioread8(&vp_dev->common->device_status);
+	struct virtio_pci_common_cfg __iomem *cfg = vp_dev->common;
+
+	return vp_ioread8(&cfg->device_status);
 }
 
 static void vp_set_status(struct virtio_device *vdev, u8 status)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	struct virtio_pci_common_cfg __iomem *cfg = vp_dev->common;
+
 	/* We should never be setting status to 0. */
 	BUG_ON(status == 0);
-	vp_iowrite8(status, &vp_dev->common->device_status);
+	vp_iowrite8(status, &cfg->device_status);
 }
 
 static void vp_reset(struct virtio_device *vdev)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	struct virtio_pci_common_cfg __iomem *cfg = vp_dev->common;
+
 	/* 0 status means a reset. */
-	vp_iowrite8(0, &vp_dev->common->device_status);
+	vp_iowrite8(0, &cfg->device_status);
 	/* After writing 0 to device_status, the driver MUST wait for a read of
 	 * device_status to return 0 before reinitializing the device.
 	 * This will flush out the status write, and flush in device writes,
 	 * including MSI-X interrupts, if any.
 	 */
-	while (vp_ioread8(&vp_dev->common->device_status))
+	while (vp_ioread8(&cfg->device_status))
 		msleep(1);
 	/* Flush pending VQ/configuration callbacks. */
 	vp_synchronize_vectors(vdev);
@@ -297,11 +309,13 @@ static void vp_reset(struct virtio_device *vdev)
 
 static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
 {
+	struct virtio_pci_common_cfg __iomem *cfg = vp_dev->common;
+
 	/* Setup the vector used for configuration events */
-	vp_iowrite16(vector, &vp_dev->common->msix_config);
+	vp_iowrite16(vector, &cfg->msix_config);
 	/* Verify we had enough resources to assign the vector */
 	/* Will also flush the write out to device */
-	return vp_ioread16(&vp_dev->common->msix_config);
+	return vp_ioread16(&cfg->msix_config);
 }
 
 static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
@@ -407,6 +421,7 @@ static int vp_modern_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 			      struct irq_affinity *desc)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	struct virtio_pci_common_cfg __iomem *cfg = vp_dev->common;
 	struct virtqueue *vq;
 	int rc = vp_find_vqs(vdev, nvqs, vqs, callbacks, names, ctx, desc);
 
@@ -417,8 +432,8 @@ static int vp_modern_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 	 * this, there's no way to go back except reset.
 	 */
 	list_for_each_entry(vq, &vdev->vqs, list) {
-		vp_iowrite16(vq->index, &vp_dev->common->queue_select);
-		vp_iowrite16(1, &vp_dev->common->queue_enable);
+		vp_iowrite16(vq->index, &cfg->queue_select);
+		vp_iowrite16(1, &cfg->queue_enable);
 	}
 
 	return 0;
@@ -428,14 +443,15 @@ static void del_vq(struct virtio_pci_vq_info *info)
 {
 	struct virtqueue *vq = info->vq;
 	struct virtio_pci_device *vp_dev = to_vp_device(vq->vdev);
+	struct virtio_pci_common_cfg __iomem *cfg = vp_dev->common;
 
-	vp_iowrite16(vq->index, &vp_dev->common->queue_select);
+	vp_iowrite16(vq->index, &cfg->queue_select);
 
 	if (vp_dev->msix_enabled) {
 		vp_iowrite16(VIRTIO_MSI_NO_VECTOR,
-			     &vp_dev->common->queue_msix_vector);
+			     &cfg->queue_msix_vector);
 		/* Flush the write out to device */
-		vp_ioread16(&vp_dev->common->queue_msix_vector);
+		vp_ioread16(&cfg->queue_msix_vector);
 	}
 
 	if (!vp_dev->notify_base)
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
