Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F74A324
	for <lists.virtualization@lfdr.de>; Tue, 18 Jun 2019 15:59:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 47A7BDA1;
	Tue, 18 Jun 2019 13:58:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 38B26B4B
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 13:58:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CCCB682F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 13:58:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EEECB0AA6;
	Tue, 18 Jun 2019 13:58:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
	[10.36.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 246F81001DFF;
	Tue, 18 Jun 2019 13:58:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id A6CFB1753A; Tue, 18 Jun 2019 15:58:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/12] drm/virtio: rework virtio_gpu_object_create fencing
	even more.
Date: Tue, 18 Jun 2019 15:58:19 +0200
Message-Id: <20190618135821.8644-12-kraxel@redhat.com>
In-Reply-To: <20190618135821.8644-1-kraxel@redhat.com>
References: <20190618135821.8644-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 18 Jun 2019 13:58:31 +0000 (UTC)
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

Now with ttm initialization being out of the way we can simplify
virtio_gpu_object_create fencing even more.  No need to check whenever
the command is still running after ttm_bo_init() returned.  We have a
fully initialized gem bo before we kick off the resource creation
command, so we can simply add the fence to the bo's reservation object
beforehand.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 27 +++++++++----------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index d0e328db0a55..4301456f087f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -120,30 +120,21 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	}
 	bo->dumb = params->dumb;
 
-	if (params->virgl) {
-		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params, fence);
-	} else {
-		virtio_gpu_cmd_create_resource(vgdev, bo, params, fence);
-	}
-
 	if (fence) {
-		struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
 		struct drm_gem_object *obj = &bo->base.base;
 		struct ww_acquire_ctx ticket;
-		unsigned long irq_flags;
 
-		drm_gem_object_get(obj);
 		ret = drm_gem_lock_reservations(&obj, 1, &ticket);
-		if (ret == 0) {
-			spin_lock_irqsave(&drv->lock, irq_flags);
-			if (!virtio_fence_signaled(&fence->f))
-				/* virtio create command still in flight */
-				reservation_object_add_excl_fence(obj->resv,
-								  &fence->f);
-			spin_unlock_irqrestore(&drv->lock, irq_flags);
-		}
+		if (ret == 0)
+			reservation_object_add_excl_fence(obj->resv,
+							  &fence->f);
 		drm_gem_unlock_reservations(&obj, 1, &ticket);
-		drm_gem_object_put_unlocked(obj);
+	}
+
+	if (params->virgl) {
+		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params, fence);
+	} else {
+		virtio_gpu_cmd_create_resource(vgdev, bo, params, fence);
 	}
 
 	ret = virtio_gpu_object_attach(vgdev, bo, NULL);
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
