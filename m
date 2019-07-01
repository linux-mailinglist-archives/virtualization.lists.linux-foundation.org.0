Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2974E775
	for <lists.virtualization@lfdr.de>; Fri, 21 Jun 2019 13:58:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E5F70EA2;
	Fri, 21 Jun 2019 11:58:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5E9F9AD0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 11:58:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 90DB07ED
	for <virtualization@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 11:58:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03B50308218D;
	Fri, 21 Jun 2019 11:58:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
	[10.36.116.212])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 017135C221;
	Fri, 21 Jun 2019 11:57:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 5707417474; Fri, 21 Jun 2019 13:57:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/18] drm/qxl: use embedded gem object
Date: Fri, 21 Jun 2019 13:57:40 +0200
Message-Id: <20190621115755.8481-4-kraxel@redhat.com>
In-Reply-To: <20190621115755.8481-1-kraxel@redhat.com>
References: <20190621115755.8481-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 21 Jun 2019 11:58:00 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, ckoenig.leichtzumerken@gmail.com,
	open list <linux-kernel@vger.kernel.org>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
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

Drop drm_gem_object from qxl_bo, use the
ttm_buffer_object.base instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_drv.h     |  6 +++---
 drivers/gpu/drm/qxl/qxl_object.h  |  4 ++--
 drivers/gpu/drm/qxl/qxl_cmd.c     |  4 ++--
 drivers/gpu/drm/qxl/qxl_debugfs.c |  2 +-
 drivers/gpu/drm/qxl/qxl_display.c |  8 ++++----
 drivers/gpu/drm/qxl/qxl_gem.c     |  2 +-
 drivers/gpu/drm/qxl/qxl_object.c  | 20 ++++++++++----------
 drivers/gpu/drm/qxl/qxl_release.c |  2 +-
 drivers/gpu/drm/qxl/qxl_ttm.c     |  4 ++--
 9 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 2896bb6fdbf4..b80d4a4361cd 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -72,12 +72,13 @@ extern int qxl_max_ioctls;
 	QXL_INTERRUPT_CLIENT_MONITORS_CONFIG)
 
 struct qxl_bo {
+	struct ttm_buffer_object	tbo;
+
 	/* Protected by gem.mutex */
 	struct list_head		list;
 	/* Protected by tbo.reserved */
 	struct ttm_place		placements[3];
 	struct ttm_placement		placement;
-	struct ttm_buffer_object	tbo;
 	struct ttm_bo_kmap_obj		kmap;
 	unsigned int pin_count;
 	void				*kptr;
@@ -85,7 +86,6 @@ struct qxl_bo {
 	int                             type;
 
 	/* Constant after initialization */
-	struct drm_gem_object		gem_base;
 	unsigned int is_primary:1; /* is this now a primary surface */
 	unsigned int is_dumb:1;
 	struct qxl_bo *shadow;
@@ -94,7 +94,7 @@ struct qxl_bo {
 	uint32_t surface_id;
 	struct qxl_release *surf_create;
 };
-#define gem_to_qxl_bo(gobj) container_of((gobj), struct qxl_bo, gem_base)
+#define gem_to_qxl_bo(gobj) container_of((gobj), struct qxl_bo, tbo.base)
 #define to_qxl_bo(tobj) container_of((tobj), struct qxl_bo, tbo)
 
 struct qxl_gem {
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index 255b914e2a7b..b812d4ae9d0d 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -34,7 +34,7 @@ static inline int qxl_bo_reserve(struct qxl_bo *bo, bool no_wait)
 	r = ttm_bo_reserve(&bo->tbo, true, no_wait, NULL);
 	if (unlikely(r != 0)) {
 		if (r != -ERESTARTSYS) {
-			struct drm_device *ddev = bo->gem_base.dev;
+			struct drm_device *ddev = bo->tbo.base.dev;
 
 			dev_err(ddev->dev, "%p reserve failed\n", bo);
 		}
@@ -71,7 +71,7 @@ static inline int qxl_bo_wait(struct qxl_bo *bo, u32 *mem_type,
 	r = ttm_bo_reserve(&bo->tbo, true, no_wait, NULL);
 	if (unlikely(r != 0)) {
 		if (r != -ERESTARTSYS) {
-			struct drm_device *ddev = bo->gem_base.dev;
+			struct drm_device *ddev = bo->tbo.base.dev;
 
 			dev_err(ddev->dev, "%p reserve failed for wait\n",
 				bo);
diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index 0a2e51af1230..498000899bfd 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -375,7 +375,7 @@ void qxl_io_destroy_primary(struct qxl_device *qdev)
 {
 	wait_for_io_cmd(qdev, 0, QXL_IO_DESTROY_PRIMARY_ASYNC);
 	qdev->primary_bo->is_primary = false;
-	drm_gem_object_put_unlocked(&qdev->primary_bo->gem_base);
+	drm_gem_object_put_unlocked(&qdev->primary_bo->tbo.base);
 	qdev->primary_bo = NULL;
 }
 
@@ -402,7 +402,7 @@ void qxl_io_create_primary(struct qxl_device *qdev, struct qxl_bo *bo)
 	wait_for_io_cmd(qdev, 0, QXL_IO_CREATE_PRIMARY_ASYNC);
 	qdev->primary_bo = bo;
 	qdev->primary_bo->is_primary = true;
-	drm_gem_object_get(&qdev->primary_bo->gem_base);
+	drm_gem_object_get(&qdev->primary_bo->tbo.base);
 }
 
 void qxl_io_memslot_add(struct qxl_device *qdev, uint8_t id)
diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 118422549828..013b938986c7 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -66,7 +66,7 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 		rcu_read_unlock();
 
 		seq_printf(m, "size %ld, pc %d, num releases %d\n",
-			   (unsigned long)bo->gem_base.size,
+			   (unsigned long)bo->tbo.base.size,
 			   bo->pin_count, rel);
 	}
 	return 0;
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 8b319ebbb0fb..93e31d062854 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -794,7 +794,7 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 		    qdev->dumb_shadow_bo->surf.height != surf.height) {
 			if (qdev->dumb_shadow_bo) {
 				drm_gem_object_put_unlocked
-					(&qdev->dumb_shadow_bo->gem_base);
+					(&qdev->dumb_shadow_bo->tbo.base);
 				qdev->dumb_shadow_bo = NULL;
 			}
 			qxl_bo_create(qdev, surf.height * surf.stride,
@@ -804,10 +804,10 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 		if (user_bo->shadow != qdev->dumb_shadow_bo) {
 			if (user_bo->shadow) {
 				drm_gem_object_put_unlocked
-					(&user_bo->shadow->gem_base);
+					(&user_bo->shadow->tbo.base);
 				user_bo->shadow = NULL;
 			}
-			drm_gem_object_get(&qdev->dumb_shadow_bo->gem_base);
+			drm_gem_object_get(&qdev->dumb_shadow_bo->tbo.base);
 			user_bo->shadow = qdev->dumb_shadow_bo;
 		}
 	}
@@ -838,7 +838,7 @@ static void qxl_plane_cleanup_fb(struct drm_plane *plane,
 	qxl_bo_unpin(user_bo);
 
 	if (old_state->fb != plane->state->fb && user_bo->shadow) {
-		drm_gem_object_put_unlocked(&user_bo->shadow->gem_base);
+		drm_gem_object_put_unlocked(&user_bo->shadow->tbo.base);
 		user_bo->shadow = NULL;
 	}
 }
diff --git a/drivers/gpu/drm/qxl/qxl_gem.c b/drivers/gpu/drm/qxl/qxl_gem.c
index 89606c819d82..002dc5a7c44b 100644
--- a/drivers/gpu/drm/qxl/qxl_gem.c
+++ b/drivers/gpu/drm/qxl/qxl_gem.c
@@ -64,7 +64,7 @@ int qxl_gem_object_create(struct qxl_device *qdev, int size,
 				  size, initial_domain, alignment, r);
 		return r;
 	}
-	*obj = &qbo->gem_base;
+	*obj = &qbo->tbo.base;
 
 	mutex_lock(&qdev->gem.mutex);
 	list_add_tail(&qbo->list, &qdev->gem.objects);
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 4928fa602944..548dfe6f3b26 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -33,14 +33,14 @@ static void qxl_ttm_bo_destroy(struct ttm_buffer_object *tbo)
 	struct qxl_device *qdev;
 
 	bo = to_qxl_bo(tbo);
-	qdev = (struct qxl_device *)bo->gem_base.dev->dev_private;
+	qdev = (struct qxl_device *)bo->tbo.base.dev->dev_private;
 
 	qxl_surface_evict(qdev, bo, false);
 	WARN_ON_ONCE(bo->map_count > 0);
 	mutex_lock(&qdev->gem.mutex);
 	list_del_init(&bo->list);
 	mutex_unlock(&qdev->gem.mutex);
-	drm_gem_object_release(&bo->gem_base);
+	drm_gem_object_release(&bo->tbo.base);
 	kfree(bo);
 }
 
@@ -95,7 +95,7 @@ int qxl_bo_create(struct qxl_device *qdev,
 	if (bo == NULL)
 		return -ENOMEM;
 	size = roundup(size, PAGE_SIZE);
-	r = drm_gem_object_init(&qdev->ddev, &bo->gem_base, size);
+	r = drm_gem_object_init(&qdev->ddev, &bo->tbo.base, size);
 	if (unlikely(r)) {
 		kfree(bo);
 		return r;
@@ -214,20 +214,20 @@ void qxl_bo_unref(struct qxl_bo **bo)
 	if ((*bo) == NULL)
 		return;
 
-	drm_gem_object_put_unlocked(&(*bo)->gem_base);
+	drm_gem_object_put_unlocked(&(*bo)->tbo.base);
 	*bo = NULL;
 }
 
 struct qxl_bo *qxl_bo_ref(struct qxl_bo *bo)
 {
-	drm_gem_object_get(&bo->gem_base);
+	drm_gem_object_get(&bo->tbo.base);
 	return bo;
 }
 
 static int __qxl_bo_pin(struct qxl_bo *bo)
 {
 	struct ttm_operation_ctx ctx = { false, false };
-	struct drm_device *ddev = bo->gem_base.dev;
+	struct drm_device *ddev = bo->tbo.base.dev;
 	int r;
 
 	if (bo->pin_count) {
@@ -247,7 +247,7 @@ static int __qxl_bo_pin(struct qxl_bo *bo)
 static int __qxl_bo_unpin(struct qxl_bo *bo)
 {
 	struct ttm_operation_ctx ctx = { false, false };
-	struct drm_device *ddev = bo->gem_base.dev;
+	struct drm_device *ddev = bo->tbo.base.dev;
 	int r, i;
 
 	if (!bo->pin_count) {
@@ -310,13 +310,13 @@ void qxl_bo_force_delete(struct qxl_device *qdev)
 	dev_err(qdev->ddev.dev, "Userspace still has active objects !\n");
 	list_for_each_entry_safe(bo, n, &qdev->gem.objects, list) {
 		dev_err(qdev->ddev.dev, "%p %p %lu %lu force free\n",
-			&bo->gem_base, bo, (unsigned long)bo->gem_base.size,
-			*((unsigned long *)&bo->gem_base.refcount));
+			&bo->tbo.base, bo, (unsigned long)bo->tbo.base.size,
+			*((unsigned long *)&bo->tbo.base.refcount));
 		mutex_lock(&qdev->gem.mutex);
 		list_del_init(&bo->list);
 		mutex_unlock(&qdev->gem.mutex);
 		/* this should unref the ttm bo */
-		drm_gem_object_put_unlocked(&bo->gem_base);
+		drm_gem_object_put_unlocked(&bo->tbo.base);
 	}
 }
 
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 49f9a9385393..32126e8836b3 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -239,7 +239,7 @@ static int qxl_release_validate_bo(struct qxl_bo *bo)
 		return ret;
 
 	/* allocate a surface for reserved + validated buffers */
-	ret = qxl_bo_check_id(bo->gem_base.dev->dev_private, bo);
+	ret = qxl_bo_check_id(bo->tbo.base.dev->dev_private, bo);
 	if (ret)
 		return ret;
 	return 0;
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 0234f8556ada..2a574cc4d95f 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -153,7 +153,7 @@ static int qxl_verify_access(struct ttm_buffer_object *bo, struct file *filp)
 {
 	struct qxl_bo *qbo = to_qxl_bo(bo);
 
-	return drm_vma_node_verify_access(&qbo->gem_base.vma_node,
+	return drm_vma_node_verify_access(&qbo->tbo.base.vma_node,
 					  filp->private_data);
 }
 
@@ -295,7 +295,7 @@ static void qxl_bo_move_notify(struct ttm_buffer_object *bo,
 	if (!qxl_ttm_bo_is_qxl_bo(bo))
 		return;
 	qbo = to_qxl_bo(bo);
-	qdev = qbo->gem_base.dev->dev_private;
+	qdev = qbo->tbo.base.dev->dev_private;
 
 	if (bo->mem.mem_type == TTM_PL_PRIV && qbo->surface_id)
 		qxl_surface_evict(qdev, qbo, new_mem ? true : false);
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
