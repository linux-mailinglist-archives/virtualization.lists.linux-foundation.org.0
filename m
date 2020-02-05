Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E52D152981
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 12:00:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D537F85D70;
	Wed,  5 Feb 2020 11:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XczNp8f67ywR; Wed,  5 Feb 2020 11:00:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 167A385D44;
	Wed,  5 Feb 2020 11:00:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8AFAC0174;
	Wed,  5 Feb 2020 11:00:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ECAACC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 11:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DB60387877
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 11:00:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8BY-B0CK2dRV
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 11:00:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E54EB87884
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 11:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580900403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=BgAf28tr3sqHVEILT1FNGmbW4lhfnumj/1HGg/VPkDg=;
 b=TfFvYUEqfA1opS8jW1YAHkk+aXZs/3+xQRnv2Gwd3KZ3WVjPPEyuTrVyjWMBtxncU45B1b
 sP7uxRxWL1gMfua+ra0G4bvrYBJlYZRix/xENDqPVQL9ddNm7HQXJF002MbeFhLfuSiw9/
 NFXHu5eseXfLPlZAZ/ia9AIYTcB0Sts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-irqP3HoTMueL5ix49kOxrA-1; Wed, 05 Feb 2020 06:00:01 -0500
X-MC-Unique: irqP3HoTMueL5ix49kOxrA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE38D100FC40;
 Wed,  5 Feb 2020 10:59:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A895960BF7;
 Wed,  5 Feb 2020 10:59:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 02C75939C; Wed,  5 Feb 2020 11:59:56 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/virtio: move virtio_gpu_mem_entry initialization to
 new function
Date: Wed,  5 Feb 2020 11:59:55 +0100
Message-Id: <20200205105955.28143-5-kraxel@redhat.com>
In-Reply-To: <20200205105955.28143-1-kraxel@redhat.com>
References: <20200205105955.28143-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, gurchetansingh@chromium.org,
 olvaffe@gmail.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Introduce new virtio_gpu_object_shmem_init() helper function which will
create the virtio_gpu_mem_entry array, containing the backing storage
information for the host.  For the most path this just moves code from
virtio_gpu_object_attach().

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  4 ++
 drivers/gpu/drm/virtio/virtgpu_object.c | 49 +++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 49 ++-----------------------
 3 files changed, 56 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 15fb3c12f22f..be62a7469b04 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -71,6 +71,10 @@ struct virtio_gpu_object {
 
 	struct sg_table *pages;
 	uint32_t mapped;
+
+	struct virtio_gpu_mem_entry *ents;
+	unsigned int nents;
+
 	bool dumb;
 	bool created;
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index bce2b3d843fe..4e82e269a1f4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -121,6 +121,49 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 	return &bo->base.base;
 }
 
+static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
+					struct virtio_gpu_object *bo)
+{
+	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
+	struct scatterlist *sg;
+	int si, ret;
+
+	ret = drm_gem_shmem_pin(&bo->base.base);
+	if (ret < 0)
+		return -EINVAL;
+
+	bo->pages = drm_gem_shmem_get_sg_table(&bo->base.base);
+	if (bo->pages == NULL) {
+		drm_gem_shmem_unpin(&bo->base.base);
+		return -EINVAL;
+	}
+
+	if (use_dma_api) {
+		bo->mapped = dma_map_sg(vgdev->vdev->dev.parent,
+					 bo->pages->sgl, bo->pages->nents,
+					 DMA_TO_DEVICE);
+		bo->nents = bo->mapped;
+	} else {
+		bo->nents = bo->pages->nents;
+	}
+
+	bo->ents = kmalloc_array(bo->nents, sizeof(struct virtio_gpu_mem_entry),
+				 GFP_KERNEL);
+	if (!bo->ents) {
+		DRM_ERROR("failed to allocate ent list\n");
+		return -ENOMEM;
+	}
+
+	for_each_sg(bo->pages->sgl, sg, bo->nents, si) {
+		bo->ents[si].addr = cpu_to_le64(use_dma_api
+						? sg_dma_address(sg)
+						: sg_phys(sg));
+		bo->ents[si].length = cpu_to_le32(sg->length);
+		bo->ents[si].padding = 0;
+	}
+	return 0;
+}
+
 int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object_params *params,
 			     struct virtio_gpu_object **bo_ptr,
@@ -165,6 +208,12 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 					       objs, fence);
 	}
 
+	ret = virtio_gpu_object_shmem_init(vgdev, bo);
+	if (ret != 0) {
+		virtio_gpu_free_object(&shmem_obj->base);
+		return ret;
+	}
+
 	ret = virtio_gpu_object_attach(vgdev, bo, NULL);
 	if (ret != 0) {
 		virtio_gpu_free_object(&shmem_obj->base);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index e258186bedb2..7db91376f2f2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1081,54 +1081,11 @@ int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object *obj,
 			     struct virtio_gpu_fence *fence)
 {
-	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
-	struct virtio_gpu_mem_entry *ents;
-	struct scatterlist *sg;
-	int si, nents, ret;
-
-	if (WARN_ON_ONCE(!obj->created))
-		return -EINVAL;
-	if (WARN_ON_ONCE(obj->pages))
-		return -EINVAL;
-
-	ret = drm_gem_shmem_pin(&obj->base.base);
-	if (ret < 0)
-		return -EINVAL;
-
-	obj->pages = drm_gem_shmem_get_sg_table(&obj->base.base);
-	if (obj->pages == NULL) {
-		drm_gem_shmem_unpin(&obj->base.base);
-		return -EINVAL;
-	}
-
-	if (use_dma_api) {
-		obj->mapped = dma_map_sg(vgdev->vdev->dev.parent,
-					 obj->pages->sgl, obj->pages->nents,
-					 DMA_TO_DEVICE);
-		nents = obj->mapped;
-	} else {
-		nents = obj->pages->nents;
-	}
-
-	/* gets freed when the ring has consumed it */
-	ents = kmalloc_array(nents, sizeof(struct virtio_gpu_mem_entry),
-			     GFP_KERNEL);
-	if (!ents) {
-		DRM_ERROR("failed to allocate ent list\n");
-		return -ENOMEM;
-	}
-
-	for_each_sg(obj->pages->sgl, sg, nents, si) {
-		ents[si].addr = cpu_to_le64(use_dma_api
-					    ? sg_dma_address(sg)
-					    : sg_phys(sg));
-		ents[si].length = cpu_to_le32(sg->length);
-		ents[si].padding = 0;
-	}
-
 	virtio_gpu_cmd_resource_attach_backing(vgdev, obj->hw_res_handle,
-					       ents, nents,
+					       obj->ents, obj->nents,
 					       fence);
+	obj->ents = NULL;
+	obj->nents = 0;
 	return 0;
 }
 
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
