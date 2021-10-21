Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B0860435C4F
	for <lists.virtualization@lfdr.de>; Thu, 21 Oct 2021 09:45:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D3F160E99;
	Thu, 21 Oct 2021 07:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r62JJ0M2L_0i; Thu, 21 Oct 2021 07:45:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F237A60E7F;
	Thu, 21 Oct 2021 07:45:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9893C0036;
	Thu, 21 Oct 2021 07:45:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E377C0011
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 07:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A13F404FA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 07:45:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NeO4iEOTlXrg
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 07:45:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E2E7404E9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 07:45:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: mwezdeck) with ESMTPSA id 611891F41B17
From: Maksym Wezdecki <maksym.wezdecki@collabora.com>
To: David Airlie <airlied@linux.ie>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: drm/virtio: not pin pages on demand
Date: Thu, 21 Oct 2021 09:44:45 +0200
Message-Id: <20211021074445.452309-1-maksym.wezdecki@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: mwezdeck <maksym.wezdecki@collabora.co.uk>, dri-devel@lists.freedesktop.org,
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

From: mwezdeck <maksym.wezdecki@collabora.co.uk>

The idea behind the commit:
  1. when resource is created, let user space decide
     if resource should be pinned or not
  2. transfer_*_host needs pinned memory. If it is not
     pinned, then pin it.
  3. during execbuffer, decide which bo handles should
     be pinned based on the list provided by user space

This change has no impact on user space.
If user space driver would like not to pin pages,
for example, for textures only, it can notify guest
kernel about that. Then it can use staging buffer for
texture uploads from guest to host. Staging buffer is always
pinned.

Signed-off-by: mwezdeck <maksym.wezdecki@collabora.co.uk>

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index d4e610a44e12..f429b0f48243 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -434,6 +434,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence);
 
+int virtio_gpu_object_pin(struct virtio_gpu_device *vgdev,
+			  struct virtio_gpu_object_array *objs,
+			  int num_gem_objects);
+
 bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 5c1ad1596889..c468f71b47d7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -83,8 +83,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	struct virtio_gpu_fence *out_fence;
 	int ret;
 	uint32_t *bo_handles = NULL;
+	uint32_t *accessed_bo_handles = NULL;
 	void __user *user_bo_handles = NULL;
+	void __user *user_accessed_bo_handles = NULL;
 	struct virtio_gpu_object_array *buflist = NULL;
+	struct virtio_gpu_object_array *acc_buflist = NULL;
 	struct sync_file *sync_file;
 	int in_fence_fd = exbuf->fence_fd;
 	int out_fence_fd = -1;
@@ -149,6 +152,44 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		}
 		kvfree(bo_handles);
 		bo_handles = NULL;
+
+		if (exbuf->flags & VIRTGPU_EXECBUF_ACC_BO_PRESENT &&
+		    exbuf->num_acc_bo_handles != 0) {
+			accessed_bo_handles =
+				kvmalloc_array(exbuf->num_acc_bo_handles,
+					       sizeof(uint32_t), GFP_KERNEL);
+			if (!accessed_bo_handles) {
+				ret = -ENOMEM;
+				goto out_unused_fd;
+			}
+
+			user_accessed_bo_handles =
+				u64_to_user_ptr(exbuf->accessed_bo_handles);
+			if (copy_from_user(accessed_bo_handles,
+					   user_accessed_bo_handles,
+					   exbuf->num_acc_bo_handles *
+						   sizeof(uint32_t))) {
+				ret = -EFAULT;
+				goto out_unused_fd;
+			}
+
+			acc_buflist = virtio_gpu_array_from_handles(
+				file, accessed_bo_handles,
+				exbuf->num_acc_bo_handles);
+			if (!buflist) {
+				ret = -ENOENT;
+				goto out_unused_fd;
+			}
+
+			ret = virtio_gpu_object_pin(vgdev, acc_buflist,
+						    exbuf->num_acc_bo_handles);
+			if (ret < 0) {
+				goto out_unused_fd;
+			}
+
+			kvfree(accessed_bo_handles);
+			accessed_bo_handles = NULL;
+		}
 	}
 
 	buf = vmemdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
@@ -226,6 +267,9 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 	case VIRTGPU_PARAM_CROSS_DEVICE:
 		value = vgdev->has_resource_assign_uuid ? 1 : 0;
 		break;
+	case VIRTGPU_PARAM_PIN_ON_DEMAND:
+		value = 1;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -331,6 +375,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	struct virtio_gpu_object *bo;
 	struct virtio_gpu_object_array *objs;
 	struct virtio_gpu_fence *fence;
+	struct virtio_gpu_object_shmem *shmem;
 	int ret;
 	u32 offset = args->offset;
 
@@ -348,6 +393,11 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 		goto err_put_free;
 	}
 
+	shmem = to_virtio_gpu_shmem(bo);
+	if (!shmem->pages) {
+		virtio_gpu_object_pin(vgdev, objs, 1);
+	}
+
 	if (!bo->host3d_blob && (args->stride || args->layer_stride)) {
 		ret = -EINVAL;
 		goto err_put_free;
@@ -385,6 +435,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 	struct drm_virtgpu_3d_transfer_to_host *args = data;
 	struct virtio_gpu_object *bo;
 	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_object_shmem *shmem;
 	struct virtio_gpu_fence *fence;
 	int ret;
 	u32 offset = args->offset;
@@ -399,6 +450,11 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 		goto err_put_free;
 	}
 
+	shmem = to_virtio_gpu_shmem(bo);
+	if (!shmem->pages) {
+		virtio_gpu_object_pin(vgdev, objs, 1);
+	}
+
 	if (!vgdev->has_virgl_3d) {
 		virtio_gpu_cmd_transfer_to_host_2d
 			(vgdev, offset,
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index f648b0e24447..ff2e891d7973 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -80,9 +80,9 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 			kfree(shmem->pages);
 			shmem->pages = NULL;
 			drm_gem_shmem_unpin(&bo->base.base);
+			drm_gem_shmem_free_object(&bo->base.base);
 		}
 
-		drm_gem_shmem_free_object(&bo->base.base);
 	} else if (virtio_gpu_is_vram(bo)) {
 		struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
 
@@ -219,6 +219,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_mem_entry *ents;
 	unsigned int nents;
 	int ret;
+	uint32_t backup_flags = params->flags;
 
 	*bo_ptr = NULL;
 
@@ -246,11 +247,16 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			goto err_put_objs;
 	}
 
-	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
-	if (ret != 0) {
-		virtio_gpu_array_put_free(objs);
-		virtio_gpu_free_object(&shmem_obj->base);
-		return ret;
+	// turn off these bits, as renderer doesn't support such bits
+	params->flags &= ~(VIRTGPU_NOT_PIN_FLAG);
+
+	if (!(backup_flags & VIRTGPU_NOT_PIN_FLAG)) {
+		ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+		if (ret != 0) {
+			virtio_gpu_array_put_free(objs);
+			virtio_gpu_free_object(&shmem_obj->base);
+			return ret;
+		}
 	}
 
 	if (params->blob) {
@@ -262,11 +268,15 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	} else if (params->virgl) {
 		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
 						  objs, fence);
-		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+		if (!(backup_flags & VIRTGPU_NOT_PIN_FLAG)) {
+			virtio_gpu_object_attach(vgdev, bo, ents, nents);
+		}
 	} else {
 		virtio_gpu_cmd_create_resource(vgdev, bo, params,
 					       objs, fence);
-		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+		if (!(backup_flags & VIRTGPU_NOT_PIN_FLAG)) {
+			virtio_gpu_object_attach(vgdev, bo, ents, nents);
+		}
 	}
 
 	*bo_ptr = bo;
@@ -280,3 +290,29 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	drm_gem_shmem_free_object(&shmem_obj->base);
 	return ret;
 }
+
+int virtio_gpu_object_pin(struct virtio_gpu_device *vgdev,
+			  struct virtio_gpu_object_array *objs,
+			  int num_gem_objects)
+{
+	int i, ret;
+
+	for (i = 0; i < num_gem_objects; i++) {
+		struct virtio_gpu_mem_entry *ents;
+		unsigned int nents;
+
+		struct virtio_gpu_object *bo =
+			gem_to_virtio_gpu_obj(objs->objs[i]);
+		if (!bo) {
+			return -EFAULT;
+		}
+
+		ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+		if (ret != 0) {
+			return -EFAULT;
+		}
+
+		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+	}
+	return 0;
+}
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index b9ec26e9c646..6ae9af4aadea 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -50,10 +50,17 @@ extern "C" {
 
 #define VIRTGPU_EXECBUF_FENCE_FD_IN	0x01
 #define VIRTGPU_EXECBUF_FENCE_FD_OUT	0x02
-#define VIRTGPU_EXECBUF_FLAGS  (\
-		VIRTGPU_EXECBUF_FENCE_FD_IN |\
-		VIRTGPU_EXECBUF_FENCE_FD_OUT |\
-		0)
+#define VIRTGPU_EXECBUF_ACC_BO_PRESENT 0x04
+#define VIRTGPU_EXECBUF_FLAGS                                                  \
+	(VIRTGPU_EXECBUF_FENCE_FD_IN | VIRTGPU_EXECBUF_FENCE_FD_OUT |          \
+	 VIRTGPU_EXECBUF_ACC_BO_PRESENT | 0)
+
+/* it is used in resource_create_ioctl as resource
+ * flag.
+ * First 8 bits of uint32_t and 24th bit 
+ * are reserved for user space driver.
+ */
+#define VIRTGPU_NOT_PIN_FLAG (1 << 9)
 
 struct drm_virtgpu_map {
 	__u64 offset; /* use for mmap system call */
@@ -68,6 +75,8 @@ struct drm_virtgpu_execbuffer {
 	__u64 bo_handles;
 	__u32 num_bo_handles;
 	__s32 fence_fd; /* in/out fence fd (see VIRTGPU_EXECBUF_FENCE_FD_IN/OUT) */
+	__u64 accessed_bo_handles;
+	__u32 num_acc_bo_handles;
 };
 
 #define VIRTGPU_PARAM_3D_FEATURES 1 /* do we have 3D features in the hw */
@@ -75,6 +84,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_RESOURCE_BLOB 3 /* DRM_VIRTGPU_RESOURCE_CREATE_BLOB */
 #define VIRTGPU_PARAM_HOST_VISIBLE 4 /* Host blob resources are mappable */
 #define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
+#define VIRTGPU_PARAM_PIN_ON_DEMAND 6 /* is pinning on demand available? */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
