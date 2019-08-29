Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 498F6A1643
	for <lists.virtualization@lfdr.de>; Thu, 29 Aug 2019 12:35:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 866E646FE;
	Thu, 29 Aug 2019 10:33:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8771946CE
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 10:33:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id 2D64E1DD99
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 10:33:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9ADB1875221;
	Thu, 29 Aug 2019 10:33:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
	[10.36.116.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9753A60872;
	Thu, 29 Aug 2019 10:33:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 8EF5131E8F; Thu, 29 Aug 2019 12:33:02 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 05/18] drm/virtio: drop no_wait argument from
	virtio_gpu_object_reserve
Date: Thu, 29 Aug 2019 12:32:48 +0200
Message-Id: <20190829103301.3539-6-kraxel@redhat.com>
In-Reply-To: <20190829103301.3539-1-kraxel@redhat.com>
References: <20190829103301.3539-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Thu, 29 Aug 2019 10:33:09 +0000 (UTC)
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

All callers pass no_wait = false.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 5 ++---
 drivers/gpu/drm/virtio/virtgpu_gem.c   | 4 ++--
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 3e0a53309c5b..d886c0e3502a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -398,12 +398,11 @@ static inline u64 virtio_gpu_object_mmap_offset(struct virtio_gpu_object *bo)
 	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
 }
 
-static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo,
-					 bool no_wait)
+static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo)
 {
 	int r;
 
-	r = ttm_bo_reserve(&bo->tbo, true, no_wait, NULL);
+	r = ttm_bo_reserve(&bo->tbo, true, false, NULL);
 	if (unlikely(r != 0)) {
 		if (r != -ERESTARTSYS) {
 			struct virtio_gpu_device *qdev =
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 292566146814..6fe6f72f64d1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -142,7 +142,7 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 	if (!vgdev->has_virgl_3d)
 		return 0;
 
-	r = virtio_gpu_object_reserve(qobj, false);
+	r = virtio_gpu_object_reserve(qobj);
 	if (r)
 		return r;
 
@@ -163,7 +163,7 @@ void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
 	if (!vgdev->has_virgl_3d)
 		return;
 
-	r = virtio_gpu_object_reserve(qobj, false);
+	r = virtio_gpu_object_reserve(qobj);
 	if (r)
 		return;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index a662394f6892..7f1775b9449e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -377,7 +377,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 
 	qobj = gem_to_virtio_gpu_obj(gobj);
 
-	ret = virtio_gpu_object_reserve(qobj, false);
+	ret = virtio_gpu_object_reserve(qobj);
 	if (ret)
 		goto out;
 
@@ -427,7 +427,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 
 	qobj = gem_to_virtio_gpu_obj(gobj);
 
-	ret = virtio_gpu_object_reserve(qobj, false);
+	ret = virtio_gpu_object_reserve(qobj);
 	if (ret)
 		goto out;
 
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
