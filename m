Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DCA990B0
	for <lists.virtualization@lfdr.de>; Thu, 22 Aug 2019 12:26:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 915ADFAC;
	Thu, 22 Aug 2019 10:26:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9B2C4EA6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 10:26:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 42A2F67F
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 10:26:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B9607F75C;
	Thu, 22 Aug 2019 10:26:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A15426012C;
	Thu, 22 Aug 2019 10:26:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id C817516E32; Thu, 22 Aug 2019 12:26:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/virtio: make resource id workaround runtime switchable.
Date: Thu, 22 Aug 2019 12:26:14 +0200
Message-Id: <20190822102614.18164-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.71]);
	Thu, 22 Aug 2019 10:26:18 +0000 (UTC)
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

Also update the comment with a reference to the virglrenderer fix.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 44 ++++++++++++++-----------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index b2da31310d24..e98aaa00578d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -27,34 +27,38 @@
 
 #include "virtgpu_drv.h"
 
+static int virtio_gpu_virglrenderer_workaround = 1;
+module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 0400);
+
 static int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
 				       uint32_t *resid)
 {
-#if 0
-	int handle = ida_alloc(&vgdev->resource_ida, GFP_KERNEL);
-
-	if (handle < 0)
-		return handle;
-#else
-	static int handle;
-
-	/*
-	 * FIXME: dirty hack to avoid re-using IDs, virglrenderer
-	 * can't deal with that.  Needs fixing in virglrenderer, also
-	 * should figure a better way to handle that in the guest.
-	 */
-	handle++;
-#endif
-
-	*resid = handle + 1;
+	if (virtio_gpu_virglrenderer_workaround) {
+		/*
+		 * Hack to avoid re-using resource IDs.
+		 *
+		 * virglrenderer versions up to (and including) 0.7.0
+		 * can't deal with that.  virglrenderer commit
+		 * "f91a9dd35715 Fix unlinking resources from hash
+		 * table." (Feb 2019) fixes the bug.
+		 */
+		static int handle;
+		handle++;
+		*resid = handle + 1;
+	} else {
+		int handle = ida_alloc(&vgdev->resource_ida, GFP_KERNEL);
+		if (handle < 0)
+			return handle;
+		*resid = handle + 1;
+	}
 	return 0;
 }
 
 static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t id)
 {
-#if 0
-	ida_free(&vgdev->resource_ida, id - 1);
-#endif
+	if (!virtio_gpu_virglrenderer_workaround) {
+		ida_free(&vgdev->resource_ida, id - 1);
+	}
 }
 
 static void virtio_gpu_ttm_bo_destroy(struct ttm_buffer_object *tbo)
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
