Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 70929A7D06
	for <lists.virtualization@lfdr.de>; Wed,  4 Sep 2019 09:48:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1F27D109E;
	Wed,  4 Sep 2019 07:48:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B3D011096
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 07:48:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 712F4756
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 07:48:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C67FC83F3B;
	Wed,  4 Sep 2019 07:48:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
	[10.36.117.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D888219C4F;
	Wed,  4 Sep 2019 07:48:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id EBBCA93E3; Wed,  4 Sep 2019 09:48:28 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: fix command submission with objects but without
	fence.
Date: Wed,  4 Sep 2019 09:48:28 +0200
Message-Id: <20190904074828.32502-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 04 Sep 2019 07:48:32 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, olvaffe@gmail.com
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

Only call virtio_gpu_array_add_fence if we actually have a fence.

Fixes: da758d51968a ("drm/virtio: rework virtio_gpu_execbuffer_ioctl fencing")
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 595fa6ec2d58..7fd2851f7b97 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -339,11 +339,12 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 		goto again;
 	}
 
-	if (fence)
+	if (fence) {
 		virtio_gpu_fence_emit(vgdev, hdr, fence);
-	if (vbuf->objs) {
-		virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
-		virtio_gpu_array_unlock_resv(vbuf->objs);
+		if (vbuf->objs) {
+			virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
+			virtio_gpu_array_unlock_resv(vbuf->objs);
+		}
 	}
 	notify = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
 	spin_unlock(&vgdev->ctrlq.qlock);
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
