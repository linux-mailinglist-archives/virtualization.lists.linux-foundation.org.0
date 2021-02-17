Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3E431D96A
	for <lists.virtualization@lfdr.de>; Wed, 17 Feb 2021 13:32:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 00A39860B2;
	Wed, 17 Feb 2021 12:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e5Krs9Z9KYk7; Wed, 17 Feb 2021 12:32:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DBB2185FC9;
	Wed, 17 Feb 2021 12:32:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC372C0FA7;
	Wed, 17 Feb 2021 12:32:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E8C6C1E6F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4900286FF2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:32:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bekA5niDm+4A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:32:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AF65E8664E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613565143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkbHki2PMYLFL2cRz29gHONNJudDLcvz1aHNYDtz2X0=;
 b=F6hvWusEmHfcRVY7fHqahBzdeuWp7BBTzo2zzIDW82ks4hTbnn59wHOM6bpgBUVWg8oSPW
 9S9P2JQgY4ygu43MMMSeqenSgykyT/ZMmoiIcnC2Gszl/RVG0q3xG/EliP3ACI2usP3G/s
 ub/728UI55YIehDioN+PSJlpMTR0fmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-v4qDDeh4PYmdhvNEk_cdTQ-1; Wed, 17 Feb 2021 07:32:19 -0500
X-MC-Unique: v4qDDeh4PYmdhvNEk_cdTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32CBA801975;
 Wed, 17 Feb 2021 12:32:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AA935D746;
 Wed, 17 Feb 2021 12:32:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F0E961800398; Wed, 17 Feb 2021 13:32:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/11] drm/qxl: use ttm bo priorities
Date: Wed, 17 Feb 2021 13:32:05 +0100
Message-Id: <20210217123213.2199186-4-kraxel@redhat.com>
In-Reply-To: <20210217123213.2199186-1-kraxel@redhat.com>
References: <20210217123213.2199186-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
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

Allow to set priorities for buffer objects.  Use priority 1 for surface
and cursor command releases.  Use priority 0 for drawing command
releases.  That way the short-living drawing commands are first in line
when it comes to eviction, making it *much* less likely that
ttm_bo_mem_force_space() picks something which can't be evicted and
throws an error after waiting a while without success.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_object.h  |  1 +
 drivers/gpu/drm/qxl/qxl_cmd.c     |  2 +-
 drivers/gpu/drm/qxl/qxl_display.c |  4 ++--
 drivers/gpu/drm/qxl/qxl_gem.c     |  2 +-
 drivers/gpu/drm/qxl/qxl_object.c  |  5 +++--
 drivers/gpu/drm/qxl/qxl_release.c | 18 ++++++++++++------
 6 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index e60a8f88e226..dc1659e717f1 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -61,6 +61,7 @@ static inline u64 qxl_bo_mmap_offset(struct qxl_bo *bo)
 extern int qxl_bo_create(struct qxl_device *qdev,
 			 unsigned long size,
 			 bool kernel, bool pinned, u32 domain,
+			 u32 priority,
 			 struct qxl_surface *surf,
 			 struct qxl_bo **bo_ptr);
 extern int qxl_bo_kmap(struct qxl_bo *bo, struct dma_buf_map *map);
diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index 7e22a81bfb36..7b00c955cd82 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -269,7 +269,7 @@ int qxl_alloc_bo_reserved(struct qxl_device *qdev,
 	int ret;
 
 	ret = qxl_bo_create(qdev, size, false /* not kernel - device */,
-			    false, QXL_GEM_DOMAIN_VRAM, NULL, &bo);
+			    false, QXL_GEM_DOMAIN_VRAM, 0, NULL, &bo);
 	if (ret) {
 		DRM_ERROR("failed to allocate VRAM BO\n");
 		return ret;
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index ec50d2cfd4e1..a1b5cc5918bc 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -799,8 +799,8 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 				qdev->dumb_shadow_bo = NULL;
 			}
 			qxl_bo_create(qdev, surf.height * surf.stride,
-				      true, true, QXL_GEM_DOMAIN_SURFACE, &surf,
-				      &qdev->dumb_shadow_bo);
+				      true, true, QXL_GEM_DOMAIN_SURFACE, 0,
+				      &surf, &qdev->dumb_shadow_bo);
 		}
 		if (user_bo->shadow != qdev->dumb_shadow_bo) {
 			if (user_bo->shadow) {
diff --git a/drivers/gpu/drm/qxl/qxl_gem.c b/drivers/gpu/drm/qxl/qxl_gem.c
index 48e096285b4c..a08da0bd9098 100644
--- a/drivers/gpu/drm/qxl/qxl_gem.c
+++ b/drivers/gpu/drm/qxl/qxl_gem.c
@@ -55,7 +55,7 @@ int qxl_gem_object_create(struct qxl_device *qdev, int size,
 	/* At least align on page size */
 	if (alignment < PAGE_SIZE)
 		alignment = PAGE_SIZE;
-	r = qxl_bo_create(qdev, size, kernel, false, initial_domain, surf, &qbo);
+	r = qxl_bo_create(qdev, size, kernel, false, initial_domain, 0, surf, &qbo);
 	if (r) {
 		if (r != -ERESTARTSYS)
 			DRM_ERROR(
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 705b51535492..7eada4ad217b 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -103,8 +103,8 @@ static const struct drm_gem_object_funcs qxl_object_funcs = {
 	.print_info = drm_gem_ttm_print_info,
 };
 
-int qxl_bo_create(struct qxl_device *qdev,
-		  unsigned long size, bool kernel, bool pinned, u32 domain,
+int qxl_bo_create(struct qxl_device *qdev, unsigned long size,
+		  bool kernel, bool pinned, u32 domain, u32 priority,
 		  struct qxl_surface *surf,
 		  struct qxl_bo **bo_ptr)
 {
@@ -137,6 +137,7 @@ int qxl_bo_create(struct qxl_device *qdev,
 
 	qxl_ttm_placement_from_domain(bo, domain);
 
+	bo->tbo.priority = priority;
 	r = ttm_bo_init_reserved(&qdev->mman.bdev, &bo->tbo, size, type,
 				 &bo->placement, 0, &ctx, NULL, NULL,
 				 &qxl_ttm_bo_destroy);
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 579c6de10c8e..716d706ca7f0 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -160,11 +160,12 @@ qxl_release_free(struct qxl_device *qdev,
 }
 
 static int qxl_release_bo_alloc(struct qxl_device *qdev,
-				struct qxl_bo **bo)
+				struct qxl_bo **bo,
+				u32 priority)
 {
 	/* pin releases bo's they are too messy to evict */
 	return qxl_bo_create(qdev, PAGE_SIZE, false, true,
-			     QXL_GEM_DOMAIN_VRAM, NULL, bo);
+			     QXL_GEM_DOMAIN_VRAM, priority, NULL, bo);
 }
 
 int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *bo)
@@ -287,13 +288,18 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 	int ret = 0;
 	union qxl_release_info *info;
 	int cur_idx;
+	u32 priority;
 
-	if (type == QXL_RELEASE_DRAWABLE)
+	if (type == QXL_RELEASE_DRAWABLE) {
 		cur_idx = 0;
-	else if (type == QXL_RELEASE_SURFACE_CMD)
+		priority = 0;
+	} else if (type == QXL_RELEASE_SURFACE_CMD) {
 		cur_idx = 1;
-	else if (type == QXL_RELEASE_CURSOR_CMD)
+		priority = 1;
+	} else if (type == QXL_RELEASE_CURSOR_CMD) {
 		cur_idx = 2;
+		priority = 1;
+	}
 	else {
 		DRM_ERROR("got illegal type: %d\n", type);
 		return -EINVAL;
@@ -315,7 +321,7 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 		qdev->current_release_bo[cur_idx] = NULL;
 	}
 	if (!qdev->current_release_bo[cur_idx]) {
-		ret = qxl_release_bo_alloc(qdev, &qdev->current_release_bo[cur_idx]);
+		ret = qxl_release_bo_alloc(qdev, &qdev->current_release_bo[cur_idx], priority);
 		if (ret) {
 			mutex_unlock(&qdev->release_mutex);
 			qxl_release_free(qdev, *release);
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
