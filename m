Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A868C247F58
	for <lists.virtualization@lfdr.de>; Tue, 18 Aug 2020 09:25:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A0DAF86BA1;
	Tue, 18 Aug 2020 07:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M7oRXB5Aekwf; Tue, 18 Aug 2020 07:25:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D0EE68749A;
	Tue, 18 Aug 2020 07:25:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4E44C0051;
	Tue, 18 Aug 2020 07:25:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D9DCC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 07:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 256998660A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 07:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5L3q73InYRJ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 07:25:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3326A8608F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 07:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597735519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=0vv+u3cMyAAlZzp0oz83EPljxFFgUqvzBIrtYyl8jSU=;
 b=IItI9WWA/QZlE6kxDzgUjFa9zYiNtK20Pm+4gNoW+wk8RFiJwJSbhy2oTN8/Ht7E2C+dqy
 IWJaOnwQ9gu4hf7rAD8OMdQ9lwc6UeJxdYHaT0+OTBWc2f+ja2DqjDuiMPS/jceQYogH9U
 xJOexB60XKdIG3RAN/AXr0tedP2gxxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-U_VBu19XPyyANcL089bpwA-1; Tue, 18 Aug 2020 03:25:17 -0400
X-MC-Unique: U_VBu19XPyyANcL089bpwA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51CAF100CF74;
 Tue, 18 Aug 2020 07:25:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 222A8BA63;
 Tue, 18 Aug 2020 07:25:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5B5819D74; Tue, 18 Aug 2020 09:25:12 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/virtio: drop virtio_gpu_output->enabled
Date: Tue, 18 Aug 2020 09:25:11 +0200
Message-Id: <20200818072511.6745-3-kraxel@redhat.com>
In-Reply-To: <20200818072511.6745-1-kraxel@redhat.com>
References: <20200818072511.6745-1-kraxel@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Not needed, already tracked by drm_crtc_state->active.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 1 -
 drivers/gpu/drm/virtio/virtgpu_display.c | 4 ----
 drivers/gpu/drm/virtio/virtgpu_plane.c   | 2 +-
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 4ab1b0ba2925..fbc04272db4f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -137,7 +137,6 @@ struct virtio_gpu_output {
 	struct edid *edid;
 	int cur_x;
 	int cur_y;
-	bool enabled;
 	bool needs_modeset;
 };
 #define drm_crtc_to_virtio_gpu_output(x) \
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 6c26b41f4e0d..86a3a800d12e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -97,9 +97,6 @@ static void virtio_gpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
 					  struct drm_crtc_state *old_state)
 {
-	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
-
-	output->enabled = true;
 }
 
 static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -111,7 +108,6 @@ static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	virtio_gpu_cmd_set_scanout(vgdev, output->index, 0, 0, 0, 0, 0);
 	virtio_gpu_notify(vgdev);
-	output->enabled = false;
 }
 
 static int virtio_gpu_crtc_atomic_check(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 65757409d9ed..6a311cd93440 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -142,7 +142,7 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	if (WARN_ON(!output))
 		return;
 
-	if (!plane->state->fb || !output->enabled) {
+	if (!plane->state->fb || !output->crtc.state->active) {
 		DRM_DEBUG("nofb\n");
 		virtio_gpu_cmd_set_scanout(vgdev, output->index, 0,
 					   plane->state->src_w >> 16,
-- 
2.18.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
