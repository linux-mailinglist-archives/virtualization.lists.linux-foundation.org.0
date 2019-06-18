Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4D54A31D
	for <lists.virtualization@lfdr.de>; Tue, 18 Jun 2019 15:59:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 52A47B4B;
	Tue, 18 Jun 2019 13:58:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 77ADDB4B
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 13:58:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2D6537DB
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 13:58:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C24AF30872C5;
	Tue, 18 Jun 2019 13:58:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
	[10.36.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78C801001DE7;
	Tue, 18 Jun 2019 13:58:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id E8DDF17474; Tue, 18 Jun 2019 15:58:21 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/12] drm/virtio: rework virtio_gpu_object_create fencing
Date: Tue, 18 Jun 2019 15:58:16 +0200
Message-Id: <20190618135821.8644-9-kraxel@redhat.com>
In-Reply-To: <20190618135821.8644-1-kraxel@redhat.com>
References: <20190618135821.8644-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 18 Jun 2019 13:58:30 +0000 (UTC)
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

Use gem reservation helpers and direct reservation_object_* calls
instead of ttm.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 28 +++++++------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 82bfbf983fd2..461f15f26517 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -141,34 +141,22 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 	if (fence) {
 		struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
-		struct list_head validate_list;
-		struct ttm_validate_buffer mainbuf;
+		struct drm_gem_object *obj = &bo->gem_base;
 		struct ww_acquire_ctx ticket;
 		unsigned long irq_flags;
-		bool signaled;
 
-		INIT_LIST_HEAD(&validate_list);
-		memset(&mainbuf, 0, sizeof(struct ttm_validate_buffer));
-
-		/* use a gem reference since unref list undoes them */
-		drm_gem_object_get(&bo->gem_base);
-		mainbuf.bo = &bo->tbo;
-		list_add(&mainbuf.head, &validate_list);
-
-		ret = virtio_gpu_object_list_validate(&ticket, &validate_list);
+		drm_gem_object_get(obj);
+		ret = drm_gem_lock_reservations(&obj, 1, &ticket);
 		if (ret == 0) {
 			spin_lock_irqsave(&drv->lock, irq_flags);
-			signaled = virtio_fence_signaled(&fence->f);
-			if (!signaled)
+			if (!virtio_fence_signaled(&fence->f))
 				/* virtio create command still in flight */
-				ttm_eu_fence_buffer_objects(&ticket, &validate_list,
-							    &fence->f);
+				reservation_object_add_excl_fence(obj->resv,
+								  &fence->f);
 			spin_unlock_irqrestore(&drv->lock, irq_flags);
-			if (signaled)
-				/* virtio create command finished */
-				ttm_eu_backoff_reservation(&ticket, &validate_list);
 		}
-		virtio_gpu_unref_list(&validate_list);
+		drm_gem_unlock_reservations(&obj, 1, &ticket);
+		drm_gem_object_put_unlocked(obj);
 	}
 
 	*bo_ptr = bo;
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
