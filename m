Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A411B4C73D
	for <lists.virtualization@lfdr.de>; Thu, 20 Jun 2019 08:09:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 417F3CB2;
	Thu, 20 Jun 2019 06:07:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6F24AC7A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 06:07:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F1C07822
	for <virtualization@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 06:07:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C8C481127;
	Thu, 20 Jun 2019 06:07:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
	[10.36.116.212])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C218B601A5;
	Thu, 20 Jun 2019 06:07:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 7A5691753D; Thu, 20 Jun 2019 08:07:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 10/12] drm/virtio: drop
	virtio_gpu_object_list_validate/virtio_gpu_unref_list
Date: Thu, 20 Jun 2019 08:07:24 +0200
Message-Id: <20190620060726.926-11-kraxel@redhat.com>
In-Reply-To: <20190620060726.926-1-kraxel@redhat.com>
References: <20190620060726.926-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
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

No users left.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 --
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 39 --------------------------
 2 files changed, 42 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 5213d7f499eb..c23f4016df39 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -222,9 +222,6 @@ struct virtio_gpu_fpriv {
 /* virtio_ioctl.c */
 #define DRM_VIRTIO_NUM_IOCTLS 10
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
-int virtio_gpu_object_list_validate(struct ww_acquire_ctx *ticket,
-				    struct list_head *head);
-void virtio_gpu_unref_list(struct list_head *head);
 
 /* virtio_kms.c */
 int virtio_gpu_init(struct drm_device *dev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index c3901c397b8a..54e1cf84097a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -54,45 +54,6 @@ static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
 					 &virtio_gpu_map->offset);
 }
 
-int virtio_gpu_object_list_validate(struct ww_acquire_ctx *ticket,
-				    struct list_head *head)
-{
-	struct ttm_operation_ctx ctx = { false, false };
-	struct ttm_validate_buffer *buf;
-	struct ttm_buffer_object *bo;
-	struct virtio_gpu_object *qobj;
-	int ret;
-
-	ret = ttm_eu_reserve_buffers(ticket, head, true, NULL, true);
-	if (ret != 0)
-		return ret;
-
-	list_for_each_entry(buf, head, head) {
-		bo = buf->bo;
-		qobj = container_of(bo, struct virtio_gpu_object, tbo);
-		ret = ttm_bo_validate(bo, &qobj->placement, &ctx);
-		if (ret) {
-			ttm_eu_backoff_reservation(ticket, head);
-			return ret;
-		}
-	}
-	return 0;
-}
-
-void virtio_gpu_unref_list(struct list_head *head)
-{
-	struct ttm_validate_buffer *buf;
-	struct ttm_buffer_object *bo;
-	struct virtio_gpu_object *qobj;
-
-	list_for_each_entry(buf, head, head) {
-		bo = buf->bo;
-		qobj = container_of(bo, struct virtio_gpu_object, tbo);
-
-		drm_gem_object_put_unlocked(&qobj->gem_base);
-	}
-}
-
 /*
  * Usage of execbuffer:
  * Relocations need to take into account the full VIRTIO_GPUDrawable size.
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
