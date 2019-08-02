Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A49317F844
	for <lists.virtualization@lfdr.de>; Fri,  2 Aug 2019 15:15:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6CCAE1306;
	Fri,  2 Aug 2019 13:13:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 50FE51306
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 13:12:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id C68271DE87
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 13:12:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30F9C793C9;
	Fri,  2 Aug 2019 13:12:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
	[10.36.116.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4FE3319D70;
	Fri,  2 Aug 2019 13:12:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id C1DB09D7F; Fri,  2 Aug 2019 15:12:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 07/18] drm/virtio: add virtio_gpu_object_array & helpers
Date: Fri,  2 Aug 2019 15:12:14 +0200
Message-Id: <20190802131225.17760-8-kraxel@redhat.com>
In-Reply-To: <20190802131225.17760-1-kraxel@redhat.com>
References: <20190802131225.17760-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 02 Aug 2019 13:12:37 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp2.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, gurchetansingh@chromium.org,
	olvaffe@gmail.com
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

Some helper functions to manage an array of gem objects.

v6:
 - add ticket to struct virtio_gpu_object_array.
 - add virtio_gpu_array_{lock,unlock}_resv helpers.
 - add virtio_gpu_array_add_fence helper.
v5: some small optimizations (Chia-I Wu).
v4: make them virtio-private instead of generic helpers.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 17 +++++
 drivers/gpu/drm/virtio/virtgpu_gem.c | 94 ++++++++++++++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 3473b602ec35..bafa06e69032 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -84,6 +84,12 @@ struct virtio_gpu_object {
 #define gem_to_virtio_gpu_obj(gobj) \
 	container_of((gobj), struct virtio_gpu_object, gem_base)
 
+struct virtio_gpu_object_array {
+	struct ww_acquire_ctx ticket;
+	u32 nents, total;
+	struct drm_gem_object *objs[];
+};
+
 struct virtio_gpu_vbuffer;
 struct virtio_gpu_device;
 
@@ -251,6 +257,17 @@ int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
 			      struct drm_device *dev,
 			      uint32_t handle, uint64_t *offset_p);
 
+struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents);
+struct virtio_gpu_object_array*
+virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents);
+void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
+			      struct drm_gem_object *obj);
+int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs);
+void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs);
+void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
+				struct dma_fence *fence);
+void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
+
 /* virtio vg */
 int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
 void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 6fe6f72f64d1..f3c9419858b7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -171,3 +171,97 @@ void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
 						qobj->hw_res_handle);
 	virtio_gpu_object_unreserve(qobj);
 }
+
+struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents)
+{
+	struct virtio_gpu_object_array *objs;
+	size_t size = sizeof(*objs) + sizeof(objs->objs[0]) * nents;
+
+	objs = kmalloc(size, GFP_KERNEL);
+	if (!objs)
+		return NULL;
+
+	objs->nents = 0;
+	objs->total = nents;
+	return objs;
+}
+
+static void virtio_gpu_array_free(struct virtio_gpu_object_array *objs)
+{
+	kfree(objs);
+}
+
+struct virtio_gpu_object_array*
+virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents)
+{
+	struct virtio_gpu_object_array *objs;
+	u32 i;
+
+	objs = virtio_gpu_array_alloc(nents);
+	if (!objs)
+		return NULL;
+
+	for (i = 0; i < nents; i++) {
+		objs->objs[i] = drm_gem_object_lookup(drm_file, handles[i]);
+		if (!objs->objs[i]) {
+			objs->nents = i;
+			virtio_gpu_array_put_free(objs);
+			return NULL;
+		}
+	}
+	objs->nents = i;
+	return objs;
+}
+
+void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
+			      struct drm_gem_object *obj)
+{
+	if (WARN_ON_ONCE(objs->nents == objs->total))
+		return;
+
+	drm_gem_object_get(obj);
+	objs->objs[objs->nents] = obj;
+	objs->nents++;
+}
+
+int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
+{
+	int ret;
+
+	if (objs->nents == 1) {
+		ret = reservation_object_lock(objs->objs[0]->resv, NULL);
+	} else {
+		ret = drm_gem_lock_reservations(objs->objs, objs->nents,
+						&objs->ticket);
+	}
+	return ret;
+}
+
+void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs)
+{
+	if (objs->nents == 1) {
+		reservation_object_unlock(objs->objs[0]->resv);
+	} else {
+		drm_gem_unlock_reservations(objs->objs, objs->nents,
+					    &objs->ticket);
+	}
+}
+
+void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
+				struct dma_fence *fence)
+{
+	int i;
+
+	for (i = 0; i < objs->nents; i++)
+		reservation_object_add_excl_fence(objs->objs[i]->resv,
+						  fence);
+}
+
+void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs)
+{
+	u32 i;
+
+	for (i = 0; i < objs->nents; i++)
+		drm_gem_object_put_unlocked(objs->objs[i]);
+	virtio_gpu_array_free(objs);
+}
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
