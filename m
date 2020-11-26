Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 354D62C5760
	for <lists.virtualization@lfdr.de>; Thu, 26 Nov 2020 15:51:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CC65A2E242;
	Thu, 26 Nov 2020 14:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Q77QazTDCKY; Thu, 26 Nov 2020 14:51:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C71D92E243;
	Thu, 26 Nov 2020 14:51:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97621C0052;
	Thu, 26 Nov 2020 14:51:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84F18C0052
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 71CD7877A7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wKpsaTqvTT9A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:51:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 81C5087750
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606402278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dH6n/GdNtcnum2IpoutZhaAiAJayIlOrm3N8eaGrvw=;
 b=AdsCAt8EiaZJR8L2qVyoc9cGpCXUuiRtyzPTa1bhd+wYHEdo8NI1wk1yHIHpYVR2b5I6+9
 crBZDovl3BN/Kf8QZlCl+XqAhMOb2jc8hOUCzOdXKTXa22Q+7IyyOOg+XqI6R2/03/1EXz
 AvyxPFGAgUvOlcSagimHtKkdQz2+AVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-XZuzXYR3NCWeVptuIF51Hw-1; Thu, 26 Nov 2020 09:51:16 -0500
X-MC-Unique: XZuzXYR3NCWeVptuIF51Hw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A23881CBEF;
 Thu, 26 Nov 2020 14:51:15 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-252.ams2.redhat.com
 [10.36.113.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FEAD189A4;
 Thu, 26 Nov 2020 14:51:03 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v2 08/17] vdpa_sim: add supported_features field in
 vdpasim_dev_attr
Date: Thu, 26 Nov 2020 15:49:41 +0100
Message-Id: <20201126144950.92850-9-sgarzare@redhat.com>
In-Reply-To: <20201126144950.92850-1-sgarzare@redhat.com>
References: <20201126144950.92850-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <elic@nvidia.com>
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

Introduce a new VDPASIM_FEATURES macro with the generic features
supported by the vDPA simulator, and VDPASIM_NET_FEATURES macro with
vDPA-net features.

Add 'supported_features' field in vdpasim_dev_attr, to allow devices
to specify their features.

Co-developed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 393b54a9f0e4..36677fc3631b 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -49,12 +49,15 @@ struct vdpasim_virtqueue {
 #define VDPASIM_VQ_NUM 0x2
 #define VDPASIM_NAME "vdpasim-netdev"
 
-static u64 vdpasim_features = (1ULL << VIRTIO_F_ANY_LAYOUT) |
-			      (1ULL << VIRTIO_F_VERSION_1)  |
-			      (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
-			      (1ULL << VIRTIO_NET_F_MAC);
+#define VDPASIM_FEATURES	((1ULL << VIRTIO_F_ANY_LAYOUT) | \
+				 (1ULL << VIRTIO_F_VERSION_1)  | \
+				 (1ULL << VIRTIO_F_ACCESS_PLATFORM))
+
+#define VDPASIM_NET_FEATURES	(VDPASIM_FEATURES | \
+				 (1ULL << VIRTIO_NET_F_MAC))
 
 struct vdpasim_dev_attr {
+	u64 supported_features;
 	int nvqs;
 	u32 id;
 };
@@ -112,7 +115,7 @@ static void vdpasim_queue_ready(struct vdpasim *vdpasim, unsigned int idx)
 {
 	struct vdpasim_virtqueue *vq = &vdpasim->vqs[idx];
 
-	vringh_init_iotlb(&vq->vring, vdpasim_features,
+	vringh_init_iotlb(&vq->vring, vdpasim->dev_attr.supported_features,
 			  VDPASIM_QUEUE_MAX, false,
 			  (struct vring_desc *)(uintptr_t)vq->desc_addr,
 			  (struct vring_avail *)
@@ -121,7 +124,8 @@ static void vdpasim_queue_ready(struct vdpasim *vdpasim, unsigned int idx)
 			  (uintptr_t)vq->device_addr);
 }
 
-static void vdpasim_vq_reset(struct vdpasim_virtqueue *vq)
+static void vdpasim_vq_reset(struct vdpasim *vdpasim,
+			     struct vdpasim_virtqueue *vq)
 {
 	vq->ready = false;
 	vq->desc_addr = 0;
@@ -129,8 +133,8 @@ static void vdpasim_vq_reset(struct vdpasim_virtqueue *vq)
 	vq->device_addr = 0;
 	vq->cb = NULL;
 	vq->private = NULL;
-	vringh_init_iotlb(&vq->vring, vdpasim_features, VDPASIM_QUEUE_MAX,
-			  false, NULL, NULL, NULL);
+	vringh_init_iotlb(&vq->vring, vdpasim->dev_attr.supported_features,
+			  VDPASIM_QUEUE_MAX, false, NULL, NULL, NULL);
 }
 
 static void vdpasim_reset(struct vdpasim *vdpasim)
@@ -138,7 +142,7 @@ static void vdpasim_reset(struct vdpasim *vdpasim)
 	int i;
 
 	for (i = 0; i < vdpasim->dev_attr.nvqs; i++)
-		vdpasim_vq_reset(&vdpasim->vqs[i]);
+		vdpasim_vq_reset(vdpasim, &vdpasim->vqs[i]);
 
 	spin_lock(&vdpasim->iommu_lock);
 	vhost_iotlb_reset(vdpasim->iommu);
@@ -498,7 +502,9 @@ static u32 vdpasim_get_vq_align(struct vdpa_device *vdpa)
 
 static u64 vdpasim_get_features(struct vdpa_device *vdpa)
 {
-	return vdpasim_features;
+	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
+
+	return vdpasim->dev_attr.supported_features;
 }
 
 static int vdpasim_set_features(struct vdpa_device *vdpa, u64 features)
@@ -510,7 +516,7 @@ static int vdpasim_set_features(struct vdpa_device *vdpa, u64 features)
 	if (!(features & (1ULL << VIRTIO_F_ACCESS_PLATFORM)))
 		return -EINVAL;
 
-	vdpasim->features = features & vdpasim_features;
+	vdpasim->features = features & vdpasim->dev_attr.supported_features;
 
 	/* We generally only know whether guest is using the legacy interface
 	 * here, so generally that's the earliest we can set config fields.
@@ -722,6 +728,7 @@ static int __init vdpasim_dev_init(void)
 	struct vdpasim_dev_attr dev_attr = {};
 
 	dev_attr.id = VIRTIO_ID_NET;
+	dev_attr.supported_features = VDPASIM_NET_FEATURES;
 	dev_attr.nvqs = VDPASIM_VQ_NUM;
 
 	vdpasim_dev = vdpasim_create(&dev_attr);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
