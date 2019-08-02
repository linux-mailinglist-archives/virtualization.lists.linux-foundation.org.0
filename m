Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4817F83D
	for <lists.virtualization@lfdr.de>; Fri,  2 Aug 2019 15:14:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3AA42137C;
	Fri,  2 Aug 2019 13:12:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DF2711306
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 13:12:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 07DA3832
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 13:12:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C258882F2;
	Fri,  2 Aug 2019 13:12:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
	[10.36.116.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 585416012D;
	Fri,  2 Aug 2019 13:12:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 422C39D1E; Fri,  2 Aug 2019 15:12:28 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 14/18] drm/virtio: switch from ttm to gem shmem helpers
Date: Fri,  2 Aug 2019 15:12:21 +0200
Message-Id: <20190802131225.17760-15-kraxel@redhat.com>
In-Reply-To: <20190802131225.17760-1-kraxel@redhat.com>
References: <20190802131225.17760-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 02 Aug 2019 13:12:34 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	gurchetansingh@chromium.org, Daniel Vetter <daniel@ffwll.ch>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, olvaffe@gmail.com
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

virtio-gpu basically needs a sg_table for the bo, to tell the host where
the backing pages for the object are.  So the gem shmem helpers are a
perfect fit.  Some drm_gem_object_funcs need thin wrappers to update the
host state, but otherwise the helpers handle everything just fine.

Once the fencing was sorted the switch was surprisingly easy and for the
most part just removing the ttm code.

v4: fix drm_gem_object_funcs name.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  52 +---
 drivers/gpu/drm/virtio/virtgpu_drv.c    |  20 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c    |  16 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  |   5 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c    |   9 -
 drivers/gpu/drm/virtio/virtgpu_object.c | 146 ++++--------
 drivers/gpu/drm/virtio/virtgpu_prime.c  |  37 ---
 drivers/gpu/drm/virtio/virtgpu_ttm.c    | 305 ------------------------
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  24 +-
 drivers/gpu/drm/virtio/Kconfig          |   2 +-
 drivers/gpu/drm/virtio/Makefile         |   2 +-
 11 files changed, 80 insertions(+), 538 deletions(-)
 delete mode 100644 drivers/gpu/drm/virtio/virtgpu_ttm.c

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index e5f1b20b6f14..1d6e4ffee7d1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -35,12 +35,9 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
-#include <drm/ttm/ttm_module.h>
-#include <drm/ttm/ttm_placement.h>
 
 #define DRIVER_NAME "virtio_gpu"
 #define DRIVER_DESC "virtio GPU"
@@ -68,21 +65,16 @@ struct virtio_gpu_object_params {
 };
 
 struct virtio_gpu_object {
-	struct drm_gem_object gem_base;
+	struct drm_gem_shmem_object base;
 	uint32_t hw_res_handle;
 
 	struct sg_table *pages;
 	uint32_t mapped;
-	void *vmap;
 	bool dumb;
-	struct ttm_place                placement_code;
-	struct ttm_placement		placement;
-	struct ttm_buffer_object	tbo;
-	struct ttm_bo_kmap_obj		kmap;
 	bool created;
 };
 #define gem_to_virtio_gpu_obj(gobj) \
-	container_of((gobj), struct virtio_gpu_object, gem_base)
+	container_of((gobj), struct virtio_gpu_object, base.base)
 
 struct virtio_gpu_object_array {
 	struct ww_acquire_ctx ticket;
@@ -153,10 +145,6 @@ struct virtio_gpu_framebuffer {
 #define to_virtio_gpu_framebuffer(x) \
 	container_of(x, struct virtio_gpu_framebuffer, base)
 
-struct virtio_gpu_mman {
-	struct ttm_bo_device		bdev;
-};
-
 struct virtio_gpu_queue {
 	struct virtqueue *vq;
 	spinlock_t qlock;
@@ -185,8 +173,6 @@ struct virtio_gpu_device {
 
 	struct virtio_device *vdev;
 
-	struct virtio_gpu_mman mman;
-
 	struct virtio_gpu_output outputs[VIRTIO_GPU_MAX_SCANOUTS];
 	uint32_t num_scanouts;
 
@@ -358,11 +344,6 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
 					enum drm_plane_type type,
 					int index);
 
-/* virtio_gpu_ttm.c */
-int virtio_gpu_ttm_init(struct virtio_gpu_device *vgdev);
-void virtio_gpu_ttm_fini(struct virtio_gpu_device *vgdev);
-int virtio_gpu_mmap(struct file *filp, struct vm_area_struct *vma);
-
 /* virtio_gpu_fence.c */
 bool virtio_fence_signaled(struct dma_fence *f);
 struct virtio_gpu_fence *virtio_gpu_fence_alloc(
@@ -374,58 +355,47 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
 				    u64 last_seq);
 
 /* virtio_gpu_object */
+struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
+						size_t size);
 int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object_params *params,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence);
-void virtio_gpu_object_kunmap(struct virtio_gpu_object *bo);
-int virtio_gpu_object_kmap(struct virtio_gpu_object *bo);
-int virtio_gpu_object_get_sg_table(struct virtio_gpu_device *qdev,
-				   struct virtio_gpu_object *bo);
-void virtio_gpu_object_free_sg_table(struct virtio_gpu_object *bo);
 
 /* virtgpu_prime.c */
-struct sg_table *virtgpu_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
 	struct sg_table *sgt);
-void *virtgpu_gem_prime_vmap(struct drm_gem_object *obj);
-void virtgpu_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
-int virtgpu_gem_prime_mmap(struct drm_gem_object *obj,
-			   struct vm_area_struct *vma);
 
 static inline struct virtio_gpu_object*
 virtio_gpu_object_ref(struct virtio_gpu_object *bo)
 {
-	ttm_bo_get(&bo->tbo);
+	drm_gem_object_get(&bo->base.base);
 	return bo;
 }
 
 static inline void virtio_gpu_object_unref(struct virtio_gpu_object **bo)
 {
-	struct ttm_buffer_object *tbo;
-
 	if ((*bo) == NULL)
 		return;
-	tbo = &((*bo)->tbo);
-	ttm_bo_put(tbo);
+	drm_gem_object_put(&(*bo)->base.base);
 	*bo = NULL;
 }
 
 static inline u64 virtio_gpu_object_mmap_offset(struct virtio_gpu_object *bo)
 {
-	return drm_vma_node_offset_addr(&bo->tbo.vma_node);
+	return drm_vma_node_offset_addr(&bo->base.base.vma_node);
 }
 
 static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo)
 {
 	int r;
 
-	r = reservation_object_lock_interruptible(bo->gem_base.resv, NULL);
+	r = reservation_object_lock_interruptible(bo->base.base.resv, NULL);
 	if (unlikely(r != 0)) {
 		if (r != -EINTR) {
 			struct virtio_gpu_device *qdev =
-				bo->gem_base.dev->dev_private;
+				bo->base.base.dev->dev_private;
 			dev_err(qdev->dev, "%p reserve failed\n", bo);
 		}
 		return r;
@@ -435,7 +405,7 @@ static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo)
 
 static inline void virtio_gpu_object_unreserve(struct virtio_gpu_object *bo)
 {
-	reservation_object_unlock(bo->gem_base.resv);
+	reservation_object_unlock(bo->base.base.resv);
 }
 
 /* virgl debufs */
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 0fc32fa0b3c0..2dc41fc64002 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -185,17 +185,7 @@ MODULE_AUTHOR("Dave Airlie <airlied@redhat.com>");
 MODULE_AUTHOR("Gerd Hoffmann <kraxel@redhat.com>");
 MODULE_AUTHOR("Alon Levy");
 
-static const struct file_operations virtio_gpu_driver_fops = {
-	.owner = THIS_MODULE,
-	.open = drm_open,
-	.mmap = virtio_gpu_mmap,
-	.poll = drm_poll,
-	.read = drm_read,
-	.unlocked_ioctl	= drm_ioctl,
-	.release = drm_release,
-	.compat_ioctl = drm_compat_ioctl,
-	.llseek = noop_llseek,
-};
+DEFINE_DRM_GEM_SHMEM_FOPS(virtio_gpu_driver_fops);
 
 static struct drm_driver driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC,
@@ -210,15 +200,9 @@ static struct drm_driver driver = {
 #endif
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_get_sg_table = virtgpu_gem_prime_get_sg_table,
 	.gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
-	.gem_prime_vmap = virtgpu_gem_prime_vmap,
-	.gem_prime_vunmap = virtgpu_gem_prime_vunmap,
-	.gem_prime_mmap = virtgpu_gem_prime_mmap,
 
-	.gem_free_object_unlocked = virtio_gpu_gem_free_object,
-	.gem_open_object = virtio_gpu_gem_object_open,
-	.gem_close_object = virtio_gpu_gem_object_close,
+	.gem_create_object = virtio_gpu_create_object,
 	.fops = &virtio_gpu_driver_fops,
 
 	.ioctls = virtio_gpu_ioctls,
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 80736add8ffa..0cba78bcf39c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -28,14 +28,6 @@
 
 #include "virtgpu_drv.h"
 
-void virtio_gpu_gem_free_object(struct drm_gem_object *gem_obj)
-{
-	struct virtio_gpu_object *obj = gem_to_virtio_gpu_obj(gem_obj);
-
-	if (obj)
-		virtio_gpu_object_unref(&obj);
-}
-
 struct virtio_gpu_object*
 virtio_gpu_alloc_object(struct drm_device *dev,
 			struct virtio_gpu_object_params *params,
@@ -66,16 +58,16 @@ int virtio_gpu_gem_create(struct drm_file *file,
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
-	ret = drm_gem_handle_create(file, &obj->gem_base, &handle);
+	ret = drm_gem_handle_create(file, &obj->base.base, &handle);
 	if (ret) {
-		drm_gem_object_release(&obj->gem_base);
+		drm_gem_object_release(&obj->base.base);
 		return ret;
 	}
 
-	*obj_p = &obj->gem_base;
+	*obj_p = &obj->base.base;
 
 	/* drop reference from allocate - handle holds it now */
-	drm_gem_object_put_unlocked(&obj->gem_base);
+	drm_gem_object_put_unlocked(&obj->base.base);
 
 	*handle_p = handle;
 	return 0;
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 123ac28f498a..865b3b8400ed 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -29,7 +29,6 @@
 #include <linux/sync_file.h>
 
 #include <drm/drm_file.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/virtgpu_drm.h>
 
 #include "virtgpu_drv.h"
@@ -261,7 +260,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 	dma_fence_put(&fence->f);
 	if (IS_ERR(qobj))
 		return PTR_ERR(qobj);
-	obj = &qobj->gem_base;
+	obj = &qobj->base.base;
 
 	ret = drm_gem_handle_create(file_priv, obj, &handle);
 	if (ret) {
@@ -288,7 +287,7 @@ static int virtio_gpu_resource_info_ioctl(struct drm_device *dev, void *data,
 
 	qobj = gem_to_virtio_gpu_obj(gobj);
 
-	ri->size = qobj->gem_base.size;
+	ri->size = qobj->base.base.size;
 	ri->res_handle = qobj->hw_res_handle;
 	drm_gem_object_put_unlocked(gobj);
 	return 0;
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index c190702fab72..231c4e27b3b3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -173,12 +173,6 @@ int virtio_gpu_init(struct drm_device *dev)
 		goto err_vbufs;
 	}
 
-	ret = virtio_gpu_ttm_init(vgdev);
-	if (ret) {
-		DRM_ERROR("failed to init ttm %d\n", ret);
-		goto err_ttm;
-	}
-
 	/* get display info */
 	virtio_cread(vgdev->vdev, struct virtio_gpu_config,
 		     num_scanouts, &num_scanouts);
@@ -210,8 +204,6 @@ int virtio_gpu_init(struct drm_device *dev)
 	return 0;
 
 err_scanouts:
-	virtio_gpu_ttm_fini(vgdev);
-err_ttm:
 	virtio_gpu_free_vbufs(vgdev);
 err_vbufs:
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
@@ -242,7 +234,6 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 
 	virtio_gpu_modeset_fini(vgdev);
-	virtio_gpu_ttm_fini(vgdev);
 	virtio_gpu_free_vbufs(vgdev);
 	virtio_gpu_cleanup_cap_cache(vgdev);
 	kfree(vgdev->capsets);
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 2902487f051a..fb9d05a68f4c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -23,8 +23,6 @@
  * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include <drm/ttm/ttm_execbuf_util.h>
-
 #include "virtgpu_drv.h"
 
 static int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
@@ -57,39 +55,45 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
 #endif
 }
 
-static void virtio_gpu_ttm_bo_destroy(struct ttm_buffer_object *tbo)
+static void virtio_gpu_free_object(struct drm_gem_object *obj)
 {
-	struct virtio_gpu_object *bo;
-	struct virtio_gpu_device *vgdev;
-
-	bo = container_of(tbo, struct virtio_gpu_object, tbo);
-	vgdev = (struct virtio_gpu_device *)bo->gem_base.dev->dev_private;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
 
+	if (bo->pages)
+		virtio_gpu_object_detach(vgdev, bo);
 	if (bo->created)
 		virtio_gpu_cmd_unref_resource(vgdev, bo->hw_res_handle);
-	if (bo->pages)
-		virtio_gpu_object_free_sg_table(bo);
-	if (bo->vmap)
-		virtio_gpu_object_kunmap(bo);
-	drm_gem_object_release(&bo->gem_base);
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
-	kfree(bo);
+
+	drm_gem_shmem_free_object(obj);
 }
 
-static void virtio_gpu_init_ttm_placement(struct virtio_gpu_object *vgbo)
+static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
+	.free = virtio_gpu_free_object,
+	.open = virtio_gpu_gem_object_open,
+	.close = virtio_gpu_gem_object_close,
+
+	.print_info = drm_gem_shmem_print_info,
+	.pin = drm_gem_shmem_pin,
+	.unpin = drm_gem_shmem_unpin,
+	.get_sg_table = drm_gem_shmem_get_sg_table,
+	.vmap = drm_gem_shmem_vmap,
+	.vunmap = drm_gem_shmem_vunmap,
+	.vm_ops = &drm_gem_shmem_vm_ops,
+};
+
+struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
+						size_t size)
 {
-	u32 c = 1;
+	struct virtio_gpu_object *bo;
 
-	vgbo->placement.placement = &vgbo->placement_code;
-	vgbo->placement.busy_placement = &vgbo->placement_code;
-	vgbo->placement_code.fpfn = 0;
-	vgbo->placement_code.lpfn = 0;
-	vgbo->placement_code.flags =
-		TTM_PL_MASK_CACHING | TTM_PL_FLAG_TT |
-		TTM_PL_FLAG_NO_EVICT;
-	vgbo->placement.num_placement = c;
-	vgbo->placement.num_busy_placement = c;
+	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
+	if (!bo)
+		return NULL;
 
+	bo->base.base.funcs = &virtio_gpu_gem_funcs;
+	return &bo->base.base;
 }
 
 int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
@@ -98,27 +102,22 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_fence *fence)
 {
 	struct virtio_gpu_object_array *objs = NULL;
+	struct drm_gem_shmem_object *shmem_obj;
 	struct virtio_gpu_object *bo;
-	size_t acc_size;
 	int ret;
 
 	*bo_ptr = NULL;
 
-	acc_size = ttm_bo_dma_acc_size(&vgdev->mman.bdev, params->size,
-				       sizeof(struct virtio_gpu_object));
+	params->size = roundup(params->size, PAGE_SIZE);
+	shmem_obj = drm_gem_shmem_create(vgdev->ddev, params->size);
+	if (IS_ERR(shmem_obj))
+		return PTR_ERR(shmem_obj);
+	bo = gem_to_virtio_gpu_obj(&shmem_obj->base);
 
-	bo = kzalloc(sizeof(struct virtio_gpu_object), GFP_KERNEL);
-	if (bo == NULL)
-		return -ENOMEM;
 	ret = virtio_gpu_resource_id_get(vgdev, &bo->hw_res_handle);
 	if (ret < 0)
 		goto err_free_gem;
 
-	params->size = roundup(params->size, PAGE_SIZE);
-	ret = drm_gem_object_init(vgdev->ddev, &bo->gem_base, params->size);
-	if (ret != 0)
-		goto err_put_id;
-
 	bo->dumb = params->dumb;
 
 	if (fence) {
@@ -126,7 +125,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		objs = virtio_gpu_array_alloc(1);
 		if (!objs)
 			goto err_put_id;
-		virtio_gpu_array_add_obj(objs, &bo->gem_base);
+		virtio_gpu_array_add_obj(objs, &bo->base.base);
 
 		ret = virtio_gpu_array_lock_resv(objs);
 		if (ret != 0)
@@ -141,15 +140,11 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 					       objs, fence);
 	}
 
-	virtio_gpu_init_ttm_placement(bo);
-	ret = ttm_bo_init(&vgdev->mman.bdev, &bo->tbo, params->size,
-			  ttm_bo_type_device, &bo->placement, 0,
-			  true, acc_size, NULL,
-			  bo->gem_base.resv,
-			  &virtio_gpu_ttm_bo_destroy);
-	/* ttm_bo_init failure will call the destroy */
-	if (ret != 0)
+	ret = virtio_gpu_object_attach(vgdev, bo, NULL);
+	if (ret != 0) {
+		virtio_gpu_free_object(&shmem_obj->base);
 		return ret;
+	}
 
 	*bo_ptr = bo;
 	return 0;
@@ -159,65 +154,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 err_put_id:
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 err_free_gem:
-	kfree(bo);
+	drm_gem_shmem_free_object(&shmem_obj->base);
 	return ret;
 }
-
-void virtio_gpu_object_kunmap(struct virtio_gpu_object *bo)
-{
-	bo->vmap = NULL;
-	ttm_bo_kunmap(&bo->kmap);
-}
-
-int virtio_gpu_object_kmap(struct virtio_gpu_object *bo)
-{
-	bool is_iomem;
-	int r;
-
-	WARN_ON(bo->vmap);
-
-	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages, &bo->kmap);
-	if (r)
-		return r;
-	bo->vmap = ttm_kmap_obj_virtual(&bo->kmap, &is_iomem);
-	return 0;
-}
-
-int virtio_gpu_object_get_sg_table(struct virtio_gpu_device *qdev,
-				   struct virtio_gpu_object *bo)
-{
-	int ret;
-	struct page **pages = bo->tbo.ttm->pages;
-	int nr_pages = bo->tbo.num_pages;
-	struct ttm_operation_ctx ctx = {
-		.interruptible = false,
-		.no_wait_gpu = false
-	};
-
-	/* wtf swapping */
-	if (bo->pages)
-		return 0;
-
-	if (bo->tbo.ttm->state == tt_unpopulated)
-		bo->tbo.ttm->bdev->driver->ttm_tt_populate(bo->tbo.ttm, &ctx);
-	bo->pages = kmalloc(sizeof(struct sg_table), GFP_KERNEL);
-	if (!bo->pages)
-		goto out;
-
-	ret = sg_alloc_table_from_pages(bo->pages, pages, nr_pages, 0,
-					nr_pages << PAGE_SHIFT, GFP_KERNEL);
-	if (ret)
-		goto out;
-	return 0;
-out:
-	kfree(bo->pages);
-	bo->pages = NULL;
-	return -ENOMEM;
-}
-
-void virtio_gpu_object_free_sg_table(struct virtio_gpu_object *bo)
-{
-	sg_free_table(bo->pages);
-	kfree(bo->pages);
-	bo->pages = NULL;
-}
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 8b3b2caf3364..050d24c39a8f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -30,46 +30,9 @@
  * device that might share buffers with virtgpu
  */
 
-struct sg_table *virtgpu_gem_prime_get_sg_table(struct drm_gem_object *obj)
-{
-	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
-
-	if (!bo->tbo.ttm->pages || !bo->tbo.ttm->num_pages)
-		/* should not happen */
-		return ERR_PTR(-EINVAL);
-
-	return drm_prime_pages_to_sg(bo->tbo.ttm->pages,
-				     bo->tbo.ttm->num_pages);
-}
-
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
 	struct sg_table *table)
 {
 	return ERR_PTR(-ENODEV);
 }
-
-void *virtgpu_gem_prime_vmap(struct drm_gem_object *obj)
-{
-	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
-	int ret;
-
-	ret = virtio_gpu_object_kmap(bo);
-	if (ret)
-		return NULL;
-	return bo->vmap;
-}
-
-void virtgpu_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
-{
-	virtio_gpu_object_kunmap(gem_to_virtio_gpu_obj(obj));
-}
-
-int virtgpu_gem_prime_mmap(struct drm_gem_object *obj,
-			   struct vm_area_struct *vma)
-{
-	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
-
-	bo->gem_base.vma_node.vm_node.start = bo->tbo.vma_node.vm_node.start;
-	return drm_gem_prime_mmap(obj, vma);
-}
diff --git a/drivers/gpu/drm/virtio/virtgpu_ttm.c b/drivers/gpu/drm/virtio/virtgpu_ttm.c
deleted file mode 100644
index f87903641847..000000000000
--- a/drivers/gpu/drm/virtio/virtgpu_ttm.c
+++ /dev/null
@@ -1,305 +0,0 @@
-/*
- * Copyright (C) 2015 Red Hat, Inc.
- * All Rights Reserved.
- *
- * Authors:
- *    Dave Airlie
- *    Alon Levy
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#include <linux/delay.h>
-
-#include <drm/drm.h>
-#include <drm/drm_file.h>
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
-#include <drm/ttm/ttm_module.h>
-#include <drm/ttm/ttm_page_alloc.h>
-#include <drm/ttm/ttm_placement.h>
-#include <drm/virtgpu_drm.h>
-
-#include "virtgpu_drv.h"
-
-static struct
-virtio_gpu_device *virtio_gpu_get_vgdev(struct ttm_bo_device *bdev)
-{
-	struct virtio_gpu_mman *mman;
-	struct virtio_gpu_device *vgdev;
-
-	mman = container_of(bdev, struct virtio_gpu_mman, bdev);
-	vgdev = container_of(mman, struct virtio_gpu_device, mman);
-	return vgdev;
-}
-
-int virtio_gpu_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct drm_file *file_priv;
-	struct virtio_gpu_device *vgdev;
-	int r;
-
-	file_priv = filp->private_data;
-	vgdev = file_priv->minor->dev->dev_private;
-	if (vgdev == NULL) {
-		DRM_ERROR(
-		 "filp->private_data->minor->dev->dev_private == NULL\n");
-		return -EINVAL;
-	}
-	r = ttm_bo_mmap(filp, vma, &vgdev->mman.bdev);
-
-	return r;
-}
-
-static int virtio_gpu_invalidate_caches(struct ttm_bo_device *bdev,
-					uint32_t flags)
-{
-	return 0;
-}
-
-static int ttm_bo_man_get_node(struct ttm_mem_type_manager *man,
-			       struct ttm_buffer_object *bo,
-			       const struct ttm_place *place,
-			       struct ttm_mem_reg *mem)
-{
-	mem->mm_node = (void *)1;
-	return 0;
-}
-
-static void ttm_bo_man_put_node(struct ttm_mem_type_manager *man,
-				struct ttm_mem_reg *mem)
-{
-	mem->mm_node = (void *)NULL;
-}
-
-static int ttm_bo_man_init(struct ttm_mem_type_manager *man,
-			   unsigned long p_size)
-{
-	return 0;
-}
-
-static int ttm_bo_man_takedown(struct ttm_mem_type_manager *man)
-{
-	return 0;
-}
-
-static void ttm_bo_man_debug(struct ttm_mem_type_manager *man,
-			     struct drm_printer *printer)
-{
-}
-
-static const struct ttm_mem_type_manager_func virtio_gpu_bo_manager_func = {
-	.init = ttm_bo_man_init,
-	.takedown = ttm_bo_man_takedown,
-	.get_node = ttm_bo_man_get_node,
-	.put_node = ttm_bo_man_put_node,
-	.debug = ttm_bo_man_debug
-};
-
-static int virtio_gpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
-				    struct ttm_mem_type_manager *man)
-{
-	switch (type) {
-	case TTM_PL_SYSTEM:
-		/* System memory */
-		man->flags = TTM_MEMTYPE_FLAG_MAPPABLE;
-		man->available_caching = TTM_PL_MASK_CACHING;
-		man->default_caching = TTM_PL_FLAG_CACHED;
-		break;
-	case TTM_PL_TT:
-		man->func = &virtio_gpu_bo_manager_func;
-		man->flags = TTM_MEMTYPE_FLAG_MAPPABLE;
-		man->available_caching = TTM_PL_MASK_CACHING;
-		man->default_caching = TTM_PL_FLAG_CACHED;
-		break;
-	default:
-		DRM_ERROR("Unsupported memory type %u\n", (unsigned int)type);
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static void virtio_gpu_evict_flags(struct ttm_buffer_object *bo,
-				struct ttm_placement *placement)
-{
-	static const struct ttm_place placements = {
-		.fpfn  = 0,
-		.lpfn  = 0,
-		.flags = TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM,
-	};
-
-	placement->placement = &placements;
-	placement->busy_placement = &placements;
-	placement->num_placement = 1;
-	placement->num_busy_placement = 1;
-}
-
-static int virtio_gpu_verify_access(struct ttm_buffer_object *bo,
-				    struct file *filp)
-{
-	return 0;
-}
-
-static int virtio_gpu_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
-					 struct ttm_mem_reg *mem)
-{
-	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
-
-	mem->bus.addr = NULL;
-	mem->bus.offset = 0;
-	mem->bus.size = mem->num_pages << PAGE_SHIFT;
-	mem->bus.base = 0;
-	mem->bus.is_iomem = false;
-	if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
-		return -EINVAL;
-	switch (mem->mem_type) {
-	case TTM_PL_SYSTEM:
-	case TTM_PL_TT:
-		/* system memory */
-		return 0;
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static void virtio_gpu_ttm_io_mem_free(struct ttm_bo_device *bdev,
-				       struct ttm_mem_reg *mem)
-{
-}
-
-/*
- * TTM backend functions.
- */
-struct virtio_gpu_ttm_tt {
-	struct ttm_dma_tt		ttm;
-	struct virtio_gpu_object        *obj;
-};
-
-static int virtio_gpu_ttm_tt_bind(struct ttm_tt *ttm,
-				  struct ttm_mem_reg *bo_mem)
-{
-	struct virtio_gpu_ttm_tt *gtt =
-		container_of(ttm, struct virtio_gpu_ttm_tt, ttm.ttm);
-	struct virtio_gpu_device *vgdev =
-		virtio_gpu_get_vgdev(gtt->obj->tbo.bdev);
-
-	virtio_gpu_object_attach(vgdev, gtt->obj, NULL);
-	return 0;
-}
-
-static int virtio_gpu_ttm_tt_unbind(struct ttm_tt *ttm)
-{
-	struct virtio_gpu_ttm_tt *gtt =
-		container_of(ttm, struct virtio_gpu_ttm_tt, ttm.ttm);
-	struct virtio_gpu_device *vgdev =
-		virtio_gpu_get_vgdev(gtt->obj->tbo.bdev);
-
-	virtio_gpu_object_detach(vgdev, gtt->obj);
-	return 0;
-}
-
-static void virtio_gpu_ttm_tt_destroy(struct ttm_tt *ttm)
-{
-	struct virtio_gpu_ttm_tt *gtt =
-		container_of(ttm, struct virtio_gpu_ttm_tt, ttm.ttm);
-
-	ttm_dma_tt_fini(&gtt->ttm);
-	kfree(gtt);
-}
-
-static struct ttm_backend_func virtio_gpu_tt_func = {
-	.bind = &virtio_gpu_ttm_tt_bind,
-	.unbind = &virtio_gpu_ttm_tt_unbind,
-	.destroy = &virtio_gpu_ttm_tt_destroy,
-};
-
-static struct ttm_tt *virtio_gpu_ttm_tt_create(struct ttm_buffer_object *bo,
-					       uint32_t page_flags)
-{
-	struct virtio_gpu_device *vgdev;
-	struct virtio_gpu_ttm_tt *gtt;
-
-	vgdev = virtio_gpu_get_vgdev(bo->bdev);
-	gtt = kzalloc(sizeof(struct virtio_gpu_ttm_tt), GFP_KERNEL);
-	if (gtt == NULL)
-		return NULL;
-	gtt->ttm.ttm.func = &virtio_gpu_tt_func;
-	gtt->obj = container_of(bo, struct virtio_gpu_object, tbo);
-	if (ttm_dma_tt_init(&gtt->ttm, bo, page_flags)) {
-		kfree(gtt);
-		return NULL;
-	}
-	return &gtt->ttm.ttm;
-}
-
-static void virtio_gpu_bo_swap_notify(struct ttm_buffer_object *tbo)
-{
-	struct virtio_gpu_object *bo;
-
-	bo = container_of(tbo, struct virtio_gpu_object, tbo);
-
-	if (bo->pages)
-		virtio_gpu_object_free_sg_table(bo);
-}
-
-static struct ttm_bo_driver virtio_gpu_bo_driver = {
-	.ttm_tt_create = &virtio_gpu_ttm_tt_create,
-	.invalidate_caches = &virtio_gpu_invalidate_caches,
-	.init_mem_type = &virtio_gpu_init_mem_type,
-	.eviction_valuable = ttm_bo_eviction_valuable,
-	.evict_flags = &virtio_gpu_evict_flags,
-	.verify_access = &virtio_gpu_verify_access,
-	.io_mem_reserve = &virtio_gpu_ttm_io_mem_reserve,
-	.io_mem_free = &virtio_gpu_ttm_io_mem_free,
-	.swap_notify = &virtio_gpu_bo_swap_notify,
-};
-
-int virtio_gpu_ttm_init(struct virtio_gpu_device *vgdev)
-{
-	int r;
-
-	/* No others user of address space so set it to 0 */
-	r = ttm_bo_device_init(&vgdev->mman.bdev,
-			       &virtio_gpu_bo_driver,
-			       vgdev->ddev->anon_inode->i_mapping,
-			       false);
-	if (r) {
-		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
-		goto err_dev_init;
-	}
-
-	r = ttm_bo_init_mm(&vgdev->mman.bdev, TTM_PL_TT, 0);
-	if (r) {
-		DRM_ERROR("Failed initializing GTT heap.\n");
-		goto err_mm_init;
-	}
-	return 0;
-
-err_mm_init:
-	ttm_bo_device_release(&vgdev->mman.bdev);
-err_dev_init:
-	return r;
-}
-
-void virtio_gpu_ttm_fini(struct virtio_gpu_device *vgdev)
-{
-	ttm_bo_device_release(&vgdev->mman.bdev);
-	DRM_INFO("virtio_gpu: ttm finalized\n");
-}
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 7a316e92c783..4ecb376bd75c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -993,17 +993,21 @@ int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
 	struct virtio_gpu_mem_entry *ents;
 	struct scatterlist *sg;
-	int si, nents;
+	int si, nents, ret;
 
 	if (WARN_ON_ONCE(!obj->created))
 		return -EINVAL;
+	if (WARN_ON_ONCE(obj->pages))
+		return -EINVAL;
 
-	if (!obj->pages) {
-		int ret;
+	ret = drm_gem_shmem_pin(&obj->base.base);
+	if (ret < 0)
+		return -EINVAL;
 
-		ret = virtio_gpu_object_get_sg_table(vgdev, obj);
-		if (ret)
-			return ret;
+	obj->pages = drm_gem_shmem_get_sg_table(&obj->base.base);
+	if (obj->pages == NULL) {
+		drm_gem_shmem_unpin(&obj->base.base);
+		return -EINVAL;
 	}
 
 	if (use_dma_api) {
@@ -1042,6 +1046,9 @@ void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
 {
 	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
 
+	if (WARN_ON_ONCE(!obj->pages))
+		return;
+
 	if (use_dma_api && obj->mapped) {
 		struct virtio_gpu_fence *fence = virtio_gpu_fence_alloc(vgdev);
 		/* detach backing and wait for the host process it ... */
@@ -1057,6 +1064,11 @@ void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
 	} else {
 		virtio_gpu_cmd_resource_inval_backing(vgdev, obj->hw_res_handle, NULL);
 	}
+
+	sg_free_table(obj->pages);
+	obj->pages = NULL;
+
+	drm_gem_shmem_unpin(&obj->base.base);
 }
 
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
index ba36e933bb49..eff3047052d4 100644
--- a/drivers/gpu/drm/virtio/Kconfig
+++ b/drivers/gpu/drm/virtio/Kconfig
@@ -3,7 +3,7 @@ config DRM_VIRTIO_GPU
 	tristate "Virtio GPU driver"
 	depends on DRM && VIRTIO && MMU
 	select DRM_KMS_HELPER
-	select DRM_TTM
+	select DRM_GEM_SHMEM_HELPER
 	help
 	   This is the virtual GPU driver for virtio.  It can be used with
 	   QEMU based VMMs (like KVM or Xen).
diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Makefile
index 458e606a936f..92aa2b3d349d 100644
--- a/drivers/gpu/drm/virtio/Makefile
+++ b/drivers/gpu/drm/virtio/Makefile
@@ -4,7 +4,7 @@
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
 virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o \
-	virtgpu_display.o virtgpu_vq.o virtgpu_ttm.o \
+	virtgpu_display.o virtgpu_vq.o \
 	virtgpu_fence.o virtgpu_object.o virtgpu_debugfs.o virtgpu_plane.o \
 	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o
 
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
