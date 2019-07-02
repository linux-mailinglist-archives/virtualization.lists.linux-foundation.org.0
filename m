Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 598CD5D1AF
	for <lists.virtualization@lfdr.de>; Tue,  2 Jul 2019 16:24:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6FDA719A3;
	Tue,  2 Jul 2019 14:22:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EA8FD1835
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 14:19:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id 9A5E41DDC8
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 14:19:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6743D3082E53;
	Tue,  2 Jul 2019 14:19:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
	[10.36.116.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 688AC3781;
	Tue,  2 Jul 2019 14:19:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 55F429D7F; Tue,  2 Jul 2019 16:19:06 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 17/18] drm/virtio: drop virtio_gpu_object_{reserve,
	unreserve}
Date: Tue,  2 Jul 2019 16:19:02 +0200
Message-Id: <20190702141903.1131-18-kraxel@redhat.com>
In-Reply-To: <20190702141903.1131-1-kraxel@redhat.com>
References: <20190702141903.1131-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 02 Jul 2019 14:19:20 +0000 (UTC)
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

No users left.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index d99c54abd090..23670109d167 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -368,27 +368,6 @@ static inline u64 virtio_gpu_object_mmap_offset(struct virtio_gpu_object *bo)
 	return drm_vma_node_offset_addr(&bo->base.base.vma_node);
 }
 
-static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo)
-{
-	int r;
-
-	r = reservation_object_lock_interruptible(bo->base.base.resv, NULL);
-	if (unlikely(r != 0)) {
-		if (r != -EINTR) {
-			struct virtio_gpu_device *qdev =
-				bo->base.base.dev->dev_private;
-			dev_err(qdev->dev, "%p reserve failed\n", bo);
-		}
-		return r;
-	}
-	return 0;
-}
-
-static inline void virtio_gpu_object_unreserve(struct virtio_gpu_object *bo)
-{
-	reservation_object_unlock(bo->base.base.resv);
-}
-
 /* virgl debufs */
 int virtio_gpu_debugfs_init(struct drm_minor *minor);
 
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
