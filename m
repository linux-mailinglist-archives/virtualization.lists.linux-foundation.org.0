Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 92958159056
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 14:51:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 63261204C5;
	Tue, 11 Feb 2020 13:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7J4ohmCpUqZS; Tue, 11 Feb 2020 13:51:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 238DC204C7;
	Tue, 11 Feb 2020 13:51:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B62DC07FE;
	Tue, 11 Feb 2020 13:51:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E000FC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CA74787111
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Hh5CHWHQZ9Y
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:50:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2C99E870AD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581429057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=S+mwJdJVy8UUeEbXPovOpoMig4tdZvTNhvh0a+GkyOI=;
 b=e5Hu8ndvdrhGe8NLgTqwnF80H//ZdHXHvfX+jefvg/aJuqGZOfCa5sXRrmamja33cUo+kN
 Yqs9XfUqOxLAGopVWrQLY/mYwKb4eNX19zxmKgMjyHb0Bw/PGNmr07HgDJ7PkFfUlNV3s4
 EovTnal0483ehK5qTqRjWH+vTDz+Iu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-u1_3pVzhMP65uv71nLedkg-1; Tue, 11 Feb 2020 08:50:53 -0500
X-MC-Unique: u1_3pVzhMP65uv71nLedkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1E7418CA241;
 Tue, 11 Feb 2020 13:50:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C11EE5C1D6;
 Tue, 11 Feb 2020 13:50:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0856717448; Tue, 11 Feb 2020 14:50:48 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/virtio: fix virtio_gpu_execbuffer_ioctl locking
Date: Tue, 11 Feb 2020 14:50:46 +0100
Message-Id: <20200211135047.22261-2-kraxel@redhat.com>
In-Reply-To: <20200211135047.22261-1-kraxel@redhat.com>
References: <20200211135047.22261-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, gurchetansingh@chromium.org,
 olvaffe@gmail.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Lockdep says we can't call vmemdup() while having objects reserved
because it needs the mmap semaphore.  So reorder the calls reserve
the objects later.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 205ec4abae2b..0477d1250f2d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -126,22 +126,22 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		bo_handles = NULL;
 	}
 
-	if (buflist) {
-		ret = virtio_gpu_array_lock_resv(buflist);
-		if (ret)
-			goto out_unused_fd;
-	}
-
 	buf = vmemdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
 	if (IS_ERR(buf)) {
 		ret = PTR_ERR(buf);
-		goto out_unresv;
+		goto out_unused_fd;
+	}
+
+	if (buflist) {
+		ret = virtio_gpu_array_lock_resv(buflist);
+		if (ret)
+			goto out_memdup;
 	}
 
 	out_fence = virtio_gpu_fence_alloc(vgdev);
 	if(!out_fence) {
 		ret = -ENOMEM;
-		goto out_memdup;
+		goto out_unresv;
 	}
 
 	if (out_fence_fd >= 0) {
@@ -160,11 +160,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 			      vfpriv->ctx_id, buflist, out_fence);
 	return 0;
 
-out_memdup:
-	kvfree(buf);
 out_unresv:
 	if (buflist)
 		virtio_gpu_array_unlock_resv(buflist);
+out_memdup:
+	kvfree(buf);
 out_unused_fd:
 	kvfree(bo_handles);
 	if (buflist)
-- 
2.18.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
