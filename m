Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA24C895
	for <lists.virtualization@lfdr.de>; Thu, 20 Jun 2019 09:44:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 234ECC58;
	Thu, 20 Jun 2019 07:44:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E2BBBBA9
	for <virtualization@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 07:44:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 261107ED
	for <virtualization@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 07:44:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C81B13060486;
	Thu, 20 Jun 2019 07:44:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
	[10.36.116.212])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B6E760FAB;
	Thu, 20 Jun 2019 07:44:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 60AFE17536; Thu, 20 Jun 2019 09:44:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/ttm: use gem vma_node
Date: Thu, 20 Jun 2019 09:44:23 +0200
Message-Id: <20190620074424.1677-6-kraxel@redhat.com>
In-Reply-To: <20190620074424.1677-1-kraxel@redhat.com>
References: <20190620074424.1677-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 20 Jun 2019 07:44:37 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
	David Airlie <airlied@linux.ie>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	Huang Rui <ray.huang@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Drop vma_node from ttm_buffer_object, use the gem struct
(base.vma_node) instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 2 +-
 drivers/gpu/drm/qxl/qxl_object.h           | 2 +-
 drivers/gpu/drm/radeon/radeon_object.h     | 2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h       | 2 +-
 include/drm/ttm/ttm_bo_api.h               | 5 +----
 drivers/gpu/drm/drm_gem_vram_helper.c      | 5 +----
 drivers/gpu/drm/ttm/ttm_bo.c               | 8 ++++----
 drivers/gpu/drm/ttm/ttm_bo_util.c          | 2 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c            | 9 +++++----
 drivers/gpu/drm/virtio/virtgpu_prime.c     | 3 ---
 10 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index c430e8259038..002fd1450ec7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -192,7 +192,7 @@ static inline unsigned amdgpu_bo_gpu_page_alignment(struct amdgpu_bo *bo)
  */
 static inline u64 amdgpu_bo_mmap_offset(struct amdgpu_bo *bo)
 {
-	return drm_vma_node_offset_addr(&bo->tbo.vma_node);
+	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
 }
 
 /**
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index b812d4ae9d0d..8ae54ba7857c 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -60,7 +60,7 @@ static inline unsigned long qxl_bo_size(struct qxl_bo *bo)
 
 static inline u64 qxl_bo_mmap_offset(struct qxl_bo *bo)
 {
-	return drm_vma_node_offset_addr(&bo->tbo.vma_node);
+	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
 }
 
 static inline int qxl_bo_wait(struct qxl_bo *bo, u32 *mem_type,
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index 9ffd8215d38a..e5554bf9140e 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -116,7 +116,7 @@ static inline unsigned radeon_bo_gpu_page_alignment(struct radeon_bo *bo)
  */
 static inline u64 radeon_bo_mmap_offset(struct radeon_bo *bo)
 {
-	return drm_vma_node_offset_addr(&bo->tbo.vma_node);
+	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
 }
 
 extern int radeon_bo_wait(struct radeon_bo *bo, u32 *mem_type,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 9e2d3062b01d..7146ba00fd5b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -396,7 +396,7 @@ static inline void virtio_gpu_object_unref(struct virtio_gpu_object **bo)
 
 static inline u64 virtio_gpu_object_mmap_offset(struct virtio_gpu_object *bo)
 {
-	return drm_vma_node_offset_addr(&bo->tbo.vma_node);
+	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
 }
 
 static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo,
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 88aa7bf1b18a..77bd420a147a 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -152,7 +152,6 @@ struct ttm_tt;
  * @ddestroy: List head for the delayed destroy list.
  * @swap: List head for swap LRU list.
  * @moving: Fence set when BO is moving
- * @vma_node: Address space manager node.
  * @offset: The current GPU offset, which can have different meanings
  * depending on the memory type. For SYSTEM type memory, it should be 0.
  * @cur_placement: Hint of current placement.
@@ -219,9 +218,7 @@ struct ttm_buffer_object {
 	 */
 
 	struct dma_fence *moving;
-
-	struct drm_vma_offset_node vma_node;
-
+	/* base.vma_node */
 	unsigned priority;
 
 	/**
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 61d9520cc15f..2e474dee30df 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -163,7 +163,7 @@ EXPORT_SYMBOL(drm_gem_vram_put);
  */
 u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
 {
-	return drm_vma_node_offset_addr(&gbo->bo.vma_node);
+	return drm_vma_node_offset_addr(&gbo->bo.base.vma_node);
 }
 EXPORT_SYMBOL(drm_gem_vram_mmap_offset);
 
@@ -633,9 +633,6 @@ EXPORT_SYMBOL(drm_gem_vram_driver_gem_prime_vunmap);
 int drm_gem_vram_driver_gem_prime_mmap(struct drm_gem_object *gem,
 				       struct vm_area_struct *vma)
 {
-	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
-
-	gbo->bo.base.vma_node.vm_node.start = gbo->bo.vma_node.vm_node.start;
 	return drm_gem_prime_mmap(gem, vma);
 }
 EXPORT_SYMBOL(drm_gem_vram_driver_gem_prime_mmap);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 516eef3b76d5..1d91da85f399 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -672,7 +672,7 @@ static void ttm_bo_release(struct kref *kref)
 	struct ttm_bo_device *bdev = bo->bdev;
 	struct ttm_mem_type_manager *man = &bdev->man[bo->mem.mem_type];
 
-	drm_vma_offset_remove(&bdev->vma_manager, &bo->vma_node);
+	drm_vma_offset_remove(&bdev->vma_manager, &bo->base.vma_node);
 	ttm_mem_io_lock(man, false);
 	ttm_mem_io_free_vm(bo);
 	ttm_mem_io_unlock(man);
@@ -1342,9 +1342,9 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
 		 * away once all users are switched over.
 		 */
 		reservation_object_init(&bo->base._resv);
+		drm_vma_node_reset(&bo->base.vma_node);
 	}
 	atomic_inc(&bo->bdev->glob->bo_count);
-	drm_vma_node_reset(&bo->vma_node);
 
 	/*
 	 * For ttm_bo_type_device buffers, allocate
@@ -1352,7 +1352,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
 	 */
 	if (bo->type == ttm_bo_type_device ||
 	    bo->type == ttm_bo_type_sg)
-		ret = drm_vma_offset_add(&bdev->vma_manager, &bo->vma_node,
+		ret = drm_vma_offset_add(&bdev->vma_manager, &bo->base.vma_node,
 					 bo->mem.num_pages);
 
 	/* passed reservation objects should already be locked,
@@ -1780,7 +1780,7 @@ void ttm_bo_unmap_virtual_locked(struct ttm_buffer_object *bo)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
 
-	drm_vma_node_unmap(&bo->vma_node, bdev->dev_mapping);
+	drm_vma_node_unmap(&bo->base.vma_node, bdev->dev_mapping);
 	ttm_mem_io_free_vm(bo);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 3d2617dd63e3..59f1b979b0da 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -510,7 +510,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	INIT_LIST_HEAD(&fbo->base.io_reserve_lru);
 	mutex_init(&fbo->base.wu_mutex);
 	fbo->base.moving = NULL;
-	drm_vma_node_reset(&fbo->base.vma_node);
+	drm_vma_node_reset(&fbo->base.base.vma_node);
 	atomic_set(&fbo->base.cpu_writers, 0);
 
 	kref_init(&fbo->base.list_kref);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 6dacff49c1cc..fb6875a789b7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -211,9 +211,9 @@ static vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 	}
 
 	page_offset = ((address - vma->vm_start) >> PAGE_SHIFT) +
-		vma->vm_pgoff - drm_vma_node_start(&bo->vma_node);
+		vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node);
 	page_last = vma_pages(vma) + vma->vm_pgoff -
-		drm_vma_node_start(&bo->vma_node);
+		drm_vma_node_start(&bo->base.vma_node);
 
 	if (unlikely(page_offset >= bo->num_pages)) {
 		ret = VM_FAULT_SIGBUS;
@@ -267,7 +267,7 @@ static vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 			} else if (unlikely(!page)) {
 				break;
 			}
-			page->index = drm_vma_node_start(&bo->vma_node) +
+			page->index = drm_vma_node_start(&bo->base.vma_node) +
 				page_offset;
 			pfn = page_to_pfn(page);
 		}
@@ -413,7 +413,8 @@ static struct ttm_buffer_object *ttm_bo_vm_lookup(struct ttm_bo_device *bdev,
 
 	node = drm_vma_offset_lookup_locked(&bdev->vma_manager, offset, pages);
 	if (likely(node)) {
-		bo = container_of(node, struct ttm_buffer_object, vma_node);
+		bo = container_of(node, struct ttm_buffer_object,
+				  base.vma_node);
 		bo = ttm_bo_get_unless_zero(bo);
 	}
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 8fbf71bd0c5e..fed86f3b099e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -66,8 +66,5 @@ void virtgpu_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
 int virtgpu_gem_prime_mmap(struct drm_gem_object *obj,
 			   struct vm_area_struct *vma)
 {
-	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
-
-	bo->gem_base.vma_node.vm_node.start = bo->tbo.vma_node.vm_node.start;
 	return drm_gem_prime_mmap(obj, vma);
 }
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
