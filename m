Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8C14A30A
	for <lists.virtualization@lfdr.de>; Tue, 18 Jun 2019 15:58:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6525EAE7;
	Tue, 18 Jun 2019 13:58:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 25F3BAE7
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 13:58:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D12B47DB
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 13:58:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA12E3003B36;
	Tue, 18 Jun 2019 13:58:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
	[10.36.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E69C317B73;
	Tue, 18 Jun 2019 13:58:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 4454716E1A; Tue, 18 Jun 2019 15:58:21 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/12] drm/virtio: switch virtio_gpu_wait_ioctl() to gem
	helper.
Date: Tue, 18 Jun 2019 15:58:10 +0200
Message-Id: <20190618135821.8644-3-kraxel@redhat.com>
In-Reply-To: <20190618135821.8644-1-kraxel@redhat.com>
References: <20190618135821.8644-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 18 Jun 2019 13:58:24 +0000 (UTC)
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

Use drm_gem_reservation_object_wait() in virtio_gpu_wait_ioctl().
This also makes the ioctl run lockless.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index ac60be9b5c19..313c770ea2c5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -464,23 +464,19 @@ static int virtio_gpu_wait_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file)
 {
 	struct drm_virtgpu_3d_wait *args = data;
-	struct drm_gem_object *gobj = NULL;
-	struct virtio_gpu_object *qobj = NULL;
+	struct drm_gem_object *obj;
+	long timeout = 15 * HZ;
 	int ret;
-	bool nowait = false;
 
-	gobj = drm_gem_object_lookup(file, args->handle);
-	if (gobj == NULL)
-		return -ENOENT;
+	if (args->flags & VIRTGPU_WAIT_NOWAIT) {
+		obj = drm_gem_object_lookup(file, args->handle);
+		ret = reservation_object_test_signaled_rcu(obj->resv, true);
+		drm_gem_object_put_unlocked(obj);
+		return ret ? 0 : -EBUSY;
+	}
 
-	qobj = gem_to_virtio_gpu_obj(gobj);
-
-	if (args->flags & VIRTGPU_WAIT_NOWAIT)
-		nowait = true;
-	ret = virtio_gpu_object_wait(qobj, nowait);
-
-	drm_gem_object_put_unlocked(gobj);
-	return ret;
+	return drm_gem_reservation_object_wait(file, args->handle,
+					       true, timeout);
 }
 
 static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
