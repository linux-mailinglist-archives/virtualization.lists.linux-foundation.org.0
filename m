Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6A1313188
	for <lists.virtualization@lfdr.de>; Mon,  8 Feb 2021 12:56:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 83ABE8691D;
	Mon,  8 Feb 2021 11:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zEzO37dXE7yJ; Mon,  8 Feb 2021 11:55:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C9E3C86912;
	Mon,  8 Feb 2021 11:55:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0613C0174;
	Mon,  8 Feb 2021 11:55:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57450C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 11:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 72B5E20767
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 11:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o3Sepoz9X8uh
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 11:55:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 4FC0E204D8
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 11:55:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DC752AC6E;
 Mon,  8 Feb 2021 11:55:44 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, noralf@tronnes.org
Subject: [PATCH v3 7/7] drm/udl: Move vmap out of commit tail
Date: Mon,  8 Feb 2021 12:55:38 +0100
Message-Id: <20210208115538.6430-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208115538.6430-1-tzimmermann@suse.de>
References: <20210208115538.6430-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
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

Vmap operations may acquire the dmabuf reservation lock, which is not
allowed within atomic commit-tail functions. Therefore move vmap and
vunmap from the damage handler into prepare_fb and cleanup_fb callbacks.

The mapping is provided as GEM shadow-buffered plane. The functions in
the commit tail use the pre-established mapping for damage handling.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/udl/udl_modeset.c | 34 ++++++++++++-------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 9d34ec9d03f6..8d98bf69d075 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -15,6 +15,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
@@ -266,18 +267,17 @@ static int udl_aligned_damage_clip(struct drm_rect *clip, int x, int y,
 	return 0;
 }
 
-static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
-			     int width, int height)
+static int udl_handle_damage(struct drm_framebuffer *fb, const struct dma_buf_map *map,
+			     int x, int y, int width, int height)
 {
 	struct drm_device *dev = fb->dev;
 	struct dma_buf_attachment *import_attach = fb->obj[0]->import_attach;
+	void *vaddr = map->vaddr; /* TODO: Use mapping abstraction properly */
 	int i, ret, tmp_ret;
 	char *cmd;
 	struct urb *urb;
 	struct drm_rect clip;
 	int log_bpp;
-	struct dma_buf_map map;
-	void *vaddr;
 
 	ret = udl_log_cpp(fb->format->cpp[0]);
 	if (ret < 0)
@@ -297,17 +297,10 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 			return ret;
 	}
 
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
-	if (ret) {
-		DRM_ERROR("failed to vmap fb\n");
-		goto out_dma_buf_end_cpu_access;
-	}
-	vaddr = map.vaddr; /* TODO: Use mapping abstraction properly */
-
 	urb = udl_get_urb(dev);
 	if (!urb) {
 		ret = -ENOMEM;
-		goto out_drm_gem_shmem_vunmap;
+		goto out_dma_buf_end_cpu_access;
 	}
 	cmd = urb->transfer_buffer;
 
@@ -320,7 +313,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 				       &cmd, byte_offset, dev_byte_offset,
 				       byte_width);
 		if (ret)
-			goto out_drm_gem_shmem_vunmap;
+			goto out_dma_buf_end_cpu_access;
 	}
 
 	if (cmd > (char *)urb->transfer_buffer) {
@@ -336,8 +329,6 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 
 	ret = 0;
 
-out_drm_gem_shmem_vunmap:
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
 out_dma_buf_end_cpu_access:
 	if (import_attach) {
 		tmp_ret = dma_buf_end_cpu_access(import_attach->dmabuf,
@@ -375,6 +366,7 @@ udl_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct udl_device *udl = to_udl(dev);
 	struct drm_display_mode *mode = &crtc_state->mode;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	char *buf;
 	char *wrptr;
 	int color_depth = UDL_COLOR_DEPTH_16BPP;
@@ -400,7 +392,7 @@ udl_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	udl->mode_buf_len = wrptr - buf;
 
-	udl_handle_damage(fb, 0, 0, fb->width, fb->height);
+	udl_handle_damage(fb, &shadow_plane_state->map[0], 0, 0, fb->width, fb->height);
 
 	if (!crtc_state->mode_changed)
 		return;
@@ -435,6 +427,7 @@ udl_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *old_plane_state)
 {
 	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_rect rect;
 
@@ -442,17 +435,16 @@ udl_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_plane_state, state, &rect))
-		udl_handle_damage(fb, rect.x1, rect.y1, rect.x2 - rect.x1,
-				  rect.y2 - rect.y1);
+		udl_handle_damage(fb, &shadow_plane_state->map[0], rect.x1, rect.y1,
+				  rect.x2 - rect.x1, rect.y2 - rect.y1);
 }
 
-static const
-struct drm_simple_display_pipe_funcs udl_simple_display_pipe_funcs = {
+static const struct drm_simple_display_pipe_funcs udl_simple_display_pipe_funcs = {
 	.mode_valid = udl_simple_display_pipe_mode_valid,
 	.enable = udl_simple_display_pipe_enable,
 	.disable = udl_simple_display_pipe_disable,
 	.update = udl_simple_display_pipe_update,
-	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
+	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
 };
 
 /*
-- 
2.30.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
