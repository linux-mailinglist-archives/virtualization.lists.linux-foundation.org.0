Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 567BD4C735
	for <lists.virtualization@lfdr.de>; Thu, 20 Jun 2019 08:08:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BA51ABE4;
	Thu, 20 Jun 2019 06:07:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7164CBE4
	for <virtualization@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 06:07:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1404EE6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 06:07:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0DACD30872C3;
	Thu, 20 Jun 2019 06:07:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
	[10.36.116.212])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B50BD60FAB;
	Thu, 20 Jun 2019 06:07:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 092E01753A; Thu, 20 Jun 2019 08:07:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 07/12] drm/virtio: add virtio_gpu_object_array & helpers
Date: Thu, 20 Jun 2019 08:07:21 +0200
Message-Id: <20190620060726.926-8-kraxel@redhat.com>
In-Reply-To: <20190620060726.926-1-kraxel@redhat.com>
References: <20190620060726.926-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 20 Jun 2019 06:07:37 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>, "open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>
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

v4: make them virtio-private instead of generic helpers.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 10 ++++++
 drivers/gpu/drm/virtio/virtgpu_gem.c | 50 ++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 07f6001ea91e..98d646789d23 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -84,6 +84,11 @@ struct virtio_gpu_object {
 #define gem_to_virtio_gpu_obj(gobj) \
 	container_of((gobj), struct virtio_gpu_object, gem_base)
 
+struct virtio_gpu_object_array {
+	u32 nents;
+	struct drm_gem_object *objs[];
+};
+
 struct virtio_gpu_vbuffer;
 struct virtio_gpu_device;
 
@@ -251,6 +256,11 @@ int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
 			      struct drm_device *dev,
 			      uint32_t handle, uint64_t *offset_p);
 
+struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents);
+struct virtio_gpu_object_array*
+virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents);
+void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
+
 /* virtio vg */
 int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
 void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 9c9ad3b14080..456cc382ce68 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -169,3 +169,53 @@ void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
 						qobj->hw_res_handle);
 	virtio_gpu_object_unreserve(qobj);
 }
+
+struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents)
+{
+	struct virtio_gpu_object_array *objs;
+	size_t size = sizeof(*objs) + sizeof(objs->objs[0]) * nents;
+
+	objs = kzalloc(size, GFP_KERNEL);
+	if (!objs)
+		return NULL;
+
+	objs->nents = nents;
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
+			virtio_gpu_array_put_free(objs);
+			return NULL;
+		}
+	}
+	return objs;
+}
+
+void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs)
+{
+	u32 i;
+
+	for (i = 0; i < objs->nents; i++) {
+		if (!objs->objs[i])
+			continue;
+		drm_gem_object_put_unlocked(objs->objs[i]);
+	}
+	virtio_gpu_array_free(objs);
+}
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
