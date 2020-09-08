Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F41260B89
	for <lists.virtualization@lfdr.de>; Tue,  8 Sep 2020 09:07:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9ABCC871F0;
	Tue,  8 Sep 2020 07:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9VRiEJhQmQ5; Tue,  8 Sep 2020 07:07:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 20D93871DC;
	Tue,  8 Sep 2020 07:07:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BA29C0051;
	Tue,  8 Sep 2020 07:07:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABEB7C0890
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 07:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A1FAC864EC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 07:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w6ak24TD52RS
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 07:07:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8BC2F864C3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599548851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eYsGcUoiEvU+T2+5TumDUWl0H68AlLqE5jQUe9G2ZU=;
 b=TwH+NmygjEVkyEI6an/I4eZpvMi9jyopxpzsQLqDSnIOsxUG3+IWGhpwEMithBb9WdnxOW
 tTrvmy7Y/+pZ9rw8dr/CtcLrNopNU6ti9DNGtWfPw6+D2mtDI1Re11WS2eQWx8nCdVDSHv
 nG9JqA7SoFBkp6Nu36hUeoxMoG8PK3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-lWFDfZj7M-i8X0RP0S3-BA-1; Tue, 08 Sep 2020 03:07:29 -0400
X-MC-Unique: lWFDfZj7M-i8X0RP0S3-BA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D0DF1007466;
 Tue,  8 Sep 2020 07:07:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9973360C17;
 Tue,  8 Sep 2020 07:07:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D5EF51FCF5; Tue,  8 Sep 2020 09:07:23 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/virtio: add virtio_gpu_cmd_unref_resource error
 handling
Date: Tue,  8 Sep 2020 09:07:23 +0200
Message-Id: <20200908070723.6394-4-kraxel@redhat.com>
In-Reply-To: <20200908070723.6394-1-kraxel@redhat.com>
References: <20200908070723.6394-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
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

Usually we wait for the host to complete the unref request, then cleanup
the guest-side state of the object in the completion callback.  When
submitting the unref command failed the completion callback will not be
called though, so cleanup right away.

Fixes a WARN on stale mm entries on driver shutdown.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index b1884e6e242c..4d2325bf4aed 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -536,6 +536,7 @@ void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 {
 	struct virtio_gpu_resource_unref *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
+	int ret;
 
 	cmd_p = virtio_gpu_alloc_cmd_cb(vgdev, &vbuf, sizeof(*cmd_p),
 					virtio_gpu_cmd_unref_cb);
@@ -545,7 +546,9 @@ void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
 
 	vbuf->resp_cb_data = bo;
-	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	ret = virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	if (ret < 0)
+		virtio_gpu_cleanup_object(bo);
 }
 
 void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
