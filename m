Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C10E7155331
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 08:46:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EF2F686822;
	Fri,  7 Feb 2020 07:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8mIi1vhbnadI; Fri,  7 Feb 2020 07:46:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 40CCD86AE5;
	Fri,  7 Feb 2020 07:46:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30D2DC1796;
	Fri,  7 Feb 2020 07:46:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 564E0C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4595E86F1B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBmOUYTBXtb7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:46:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2D4B3878F1
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581061607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=BdkBv5/0TRWSpDs9BrTkTW1hCET7zpP+Fugca3yFB0g=;
 b=SUKgQu7zB1JYPiv3UpuLt0K5izz1eyz2Qoef3VOKa3fVkBlMjP++ZRy3UpMK5TyvCgGM2k
 3J2f522jXQXsJe8PABguXFf3UiADNkIY1xWIYisPJ9L+1rswsX1oranXCADmXOHWOA/Vrl
 dlxTDXob2xA2Xex+onesdghuUWhoHUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-HGFyYLufPUOtZP72T4XcvQ-1; Fri, 07 Feb 2020 02:46:44 -0500
X-MC-Unique: HGFyYLufPUOtZP72T4XcvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B1DB189F76D;
 Fri,  7 Feb 2020 07:46:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91CAF89F07;
 Fri,  7 Feb 2020 07:46:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E84AF31F5D; Fri,  7 Feb 2020 08:46:38 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/virtio: move virtio_gpu_mem_entry initialization
 to new function
Date: Fri,  7 Feb 2020 08:46:38 +0100
Message-Id: <20200207074638.26386-5-kraxel@redhat.com>
In-Reply-To: <20200207074638.26386-1-kraxel@redhat.com>
References: <20200207074638.26386-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  4 +-
 drivers/gpu/drm/virtio/virtgpu_object.c | 55 ++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 51 ++---------------------
 3 files changed, 60 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index d37ddd7644f6..6c78c77a2afc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -71,6 +71,7 @@ struct virtio_gpu_object {
 
 	struct sg_table *pages;
 	uint32_t mapped;
+
 	bool dumb;
 	bool created;
 };
@@ -280,7 +281,8 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 				uint32_t x, uint32_t y);
 int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object *obj,
-			     struct virtio_gpu_fence *fence);
+			     struct virtio_gpu_mem_entry *ents,
+			     unsigned int nents);
 int virtio_gpu_attach_status_page(struct virtio_gpu_device *vgdev);
 int virtio_gpu_detach_status_page(struct virtio_gpu_device *vgdev);
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index bce2b3d843fe..8870ee23ff2b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -121,6 +121,51 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 	return &bo->base.base;
 }
 
+static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
+					struct virtio_gpu_object *bo,
+					struct virtio_gpu_mem_entry **ents,
+					unsigned int *nents)
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
+	if (!bo->pages) {
+		drm_gem_shmem_unpin(&bo->base.base);
+		return -EINVAL;
+	}
+
+	if (use_dma_api) {
+		bo->mapped = dma_map_sg(vgdev->vdev->dev.parent,
+					bo->pages->sgl, bo->pages->nents,
+					DMA_TO_DEVICE);
+		*nents = bo->mapped;
+	} else {
+		*nents = bo->pages->nents;
+	}
+
+	*ents = kmalloc_array(*nents, sizeof(struct virtio_gpu_mem_entry),
+			      GFP_KERNEL);
+	if (!(*ents)) {
+		DRM_ERROR("failed to allocate ent list\n");
+		return -ENOMEM;
+	}
+
+	for_each_sg(bo->pages->sgl, sg, *nents, si) {
+		(*ents)[si].addr = cpu_to_le64(use_dma_api
+					       ? sg_dma_address(sg)
+					       : sg_phys(sg));
+		(*ents)[si].length = cpu_to_le32(sg->length);
+		(*ents)[si].padding = 0;
+	}
+	return 0;
+}
+
 int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object_params *params,
 			     struct virtio_gpu_object **bo_ptr,
@@ -129,6 +174,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_object_array *objs = NULL;
 	struct drm_gem_shmem_object *shmem_obj;
 	struct virtio_gpu_object *bo;
+	struct virtio_gpu_mem_entry *ents;
+	unsigned int nents;
 	int ret;
 
 	*bo_ptr = NULL;
@@ -165,7 +212,13 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 					       objs, fence);
 	}
 
-	ret = virtio_gpu_object_attach(vgdev, bo, NULL);
+	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+	if (ret != 0) {
+		virtio_gpu_free_object(&shmem_obj->base);
+		return ret;
+	}
+
+	ret = virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	if (ret != 0) {
 		virtio_gpu_free_object(&shmem_obj->base);
 		return ret;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 87c439156151..8360f7338209 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1086,56 +1086,11 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 
 int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object *obj,
-			     struct virtio_gpu_fence *fence)
+			     struct virtio_gpu_mem_entry *ents,
+			     unsigned int nents)
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
-					       fence);
+					       ents, nents, NULL);
 	return 0;
 }
 
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
