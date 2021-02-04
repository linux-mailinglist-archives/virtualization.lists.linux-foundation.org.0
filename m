Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D64630FD99
	for <lists.virtualization@lfdr.de>; Thu,  4 Feb 2021 21:03:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 895CA8655C;
	Thu,  4 Feb 2021 20:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_71DTRoS_NZ; Thu,  4 Feb 2021 20:03:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2106386640;
	Thu,  4 Feb 2021 20:03:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E83FDC1834;
	Thu,  4 Feb 2021 20:03:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58226C07FD
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 20:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4286787225
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 20:03:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QDqqmMvlh9Nk
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 20:03:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9CE9B871EC
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 20:03:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 227BAAD26;
 Thu,  4 Feb 2021 20:03:14 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, noralf@tronnes.org
Subject: [PATCH 2/6] drm: Add additional atomic helpers for shadow-buffered
 planes
Date: Thu,  4 Feb 2021 21:03:04 +0100
Message-Id: <20210204200308.24216-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204200308.24216-1-tzimmermann@suse.de>
References: <20210204200308.24216-1-tzimmermann@suse.de>
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

Several drivers use GEM buffer objects as shadow buffers for the actual
framebuffer memory. Right now, drivers do these vmap operations in their
commit tail, which is actually not allowed by the locking rules for
the dma-buf reservation lock. The involved BO has to be vmapped in the
plane's prepare_fb callback and vunmapped in cleanup_fb.

This patch introduces atomic helpers for such shadow planes. Plane
functions manage the plane state for shadow planes. The provided
implementations for prepare_fb and cleanup_fb vmap and vunmap all BOs of
struct drm_plane_state.fb. The mappings are afterwards available in the
plane's commit-tail functions.

For now, all rsp drivers use the simple KMS helpers, so we add the plane
callbacks and wrappers for simple KMS. The internal plane functions can
late rbe exported as needed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/drm-kms-helpers.rst   |  12 ++
 drivers/gpu/drm/Makefile                |   3 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c | 210 ++++++++++++++++++++++++
 include/drm/drm_gem_atomic_helper.h     |  75 +++++++++
 4 files changed, 299 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_gem_atomic_helper.c
 create mode 100644 include/drm/drm_gem_atomic_helper.h

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index b89ddd06dabb..389892f36185 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -80,6 +80,18 @@ Atomic State Helper Reference
 .. kernel-doc:: drivers/gpu/drm/drm_atomic_state_helper.c
    :export:
 
+GEM Atomic Helper Reference
+---------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_gem_atomic_helper.c
+   :doc: overview
+
+.. kernel-doc:: include/drm/drm_gem_atomic_helper.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_gem_atomic_helper.c
+   :export:
+
 Simple KMS Helper Reference
 ===========================
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 926adef289db..02c229392345 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -44,7 +44,8 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
 		drm_plane_helper.o drm_dp_mst_topology.o drm_atomic_helper.o \
 		drm_kms_helper_common.o drm_dp_dual_mode_helper.o \
 		drm_simple_kms_helper.o drm_modeset_helper.o \
-		drm_scdc_helper.o drm_gem_framebuffer_helper.o \
+		drm_scdc_helper.o drm_gem_atomic_helper.o \
+		drm_gem_framebuffer_helper.o \
 		drm_atomic_state_helper.o drm_damage_helper.o \
 		drm_format_helper.o drm_self_refresh_helper.o
 
diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
new file mode 100644
index 000000000000..b6ad2b91a011
--- /dev/null
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "drm_internal.h"
+
+/**
+ * DOC: overview
+ *
+ * The GEM atomic helpers library implements generic atomic-commit
+ * functions for drivers that use GEM objects. Currently, it provides
+ * plane state and framebuffer BO mappings for planes with shadow
+ * buffers.
+ */
+
+/*
+ * Shadow-buffered Planes
+ */
+
+static struct drm_plane_state *
+drm_gem_duplicate_shadow_plane_state(struct drm_plane *plane,
+				     struct drm_plane_state *plane_state)
+{
+	struct drm_shadow_plane_state *new_shadow_plane_state;
+
+	if (!plane_state)
+		return NULL;
+
+	new_shadow_plane_state = kzalloc(sizeof(*new_shadow_plane_state), GFP_KERNEL);
+	if (!new_shadow_plane_state)
+		return NULL;
+	__drm_atomic_helper_plane_duplicate_state(plane, &new_shadow_plane_state->base);
+
+	return &new_shadow_plane_state->base;
+}
+
+static void drm_gem_destroy_shadow_plane_state(struct drm_plane *plane,
+					       struct drm_plane_state *plane_state)
+{
+	struct drm_shadow_plane_state *shadow_plane_state =
+		to_drm_shadow_plane_state(plane_state);
+
+	__drm_atomic_helper_plane_destroy_state(&shadow_plane_state->base);
+	kfree(shadow_plane_state);
+}
+
+static void drm_gem_reset_shadow_plane(struct drm_plane *plane)
+{
+	struct drm_shadow_plane_state *shadow_plane_state;
+
+	if (plane->state) {
+		drm_gem_destroy_shadow_plane_state(plane, plane->state);
+		plane->state = NULL; /* must be set to NULL here */
+	}
+
+	shadow_plane_state = kzalloc(sizeof(*shadow_plane_state), GFP_KERNEL);
+	if (!shadow_plane_state)
+		return;
+	__drm_atomic_helper_plane_reset(plane, &shadow_plane_state->base);
+}
+
+static int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state)
+{
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_gem_object *obj;
+	struct dma_buf_map map;
+	int ret;
+	size_t i;
+
+	if (!fb)
+		return 0;
+
+	ret = drm_gem_fb_prepare_fb(plane, plane_state);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(shadow_plane_state->map); ++i) {
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj)
+			continue;
+		ret = drm_gem_vmap(obj, &map);
+		if (ret)
+			goto err_drm_gem_vunmap;
+		shadow_plane_state->map[i] = map;
+	}
+
+	return 0;
+
+err_drm_gem_vunmap:
+	while (i) {
+		--i;
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj)
+			continue;
+		drm_gem_vunmap(obj, &shadow_plane_state->map[i]);
+	}
+	return ret;
+}
+
+static void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state)
+{
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	size_t i = ARRAY_SIZE(shadow_plane_state->map);
+	struct drm_gem_object *obj;
+
+	if (!fb)
+		return;
+
+	while (i) {
+		--i;
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj)
+			continue;
+		drm_gem_vunmap(obj, &shadow_plane_state->map[i]);
+	}
+}
+
+/**
+ * drm_gem_simple_kms_prepare_shadow_fb - prepares shadow framebuffers
+ * @pipe: the simple display pipe
+ * @plane_state: the plane state of type struct drm_shadow_plane_state
+ *
+ * This function implements struct drm_simple_display_funcs.prepare_fb. It
+ * maps all buffer objects of the plane's framebuffer into kernel address
+ * space and stores them in struct drm_shadow_plane_state.map. The
+ * framebuffer will be synchronized as part of the atomic commit.
+ *
+ * See drm_gem_simple_kms_cleanup_shadow_fb() for cleanup.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int drm_gem_simple_kms_prepare_shadow_fb(struct drm_simple_display_pipe *pipe,
+					 struct drm_plane_state *plane_state)
+{
+	return drm_gem_prepare_shadow_fb(&pipe->plane, plane_state);
+}
+EXPORT_SYMBOL(drm_gem_simple_kms_prepare_shadow_fb);
+
+/**
+ * drm_gem_simple_kms_cleanup_shadow_fb - releases shadow framebuffers
+ * @pipe: the simple display pipe
+ * @plane_state: the plane state of type struct drm_shadow_plane_state
+ *
+ * This function implements struct drm_simple_display_funcs.prepare_fb.
+ * This function unmaps all buffer objects of the plane's framebuffer.
+ *
+ * See drm_gem_simple_kms_prepare_shadow_fb().
+ */
+void drm_gem_simple_kms_cleanup_shadow_fb(struct drm_simple_display_pipe *pipe,
+					  struct drm_plane_state *plane_state)
+{
+	drm_gem_cleanup_shadow_fb(&pipe->plane, plane_state);
+}
+EXPORT_SYMBOL(drm_gem_simple_kms_cleanup_shadow_fb);
+
+/**
+ * drm_gem_simple_kms_reset_shadow_plane - resets a shadow-buffered plane
+ * @pipe: the simple display pipe
+ *
+ * This function implements struct drm_simple_display_funcs.reset_plane
+ * for shadow-buffered planes.
+ */
+void drm_gem_simple_kms_reset_shadow_plane(struct drm_simple_display_pipe *pipe)
+{
+	drm_gem_reset_shadow_plane(&pipe->plane);
+}
+EXPORT_SYMBOL(drm_gem_simple_kms_reset_shadow_plane);
+
+/**
+ * drm_gem_simple_kms_duplicate_shadow_plane_state - duplicates shadow-buffered plane state
+ * @pipe: the simple display pipe
+ * @plane_state: the plane state of type struct drm_shadow_plane_state
+ *
+ * This function implements struct drm_simple_display_funcs.duplicate_plane_state
+ * for shadow-buffered planes. It does not duplicate existing mappings of the shadow
+ * buffers. Mappings are maintained during the atomic commit by the plane's prepare_fb
+ * and cleanup_fb helpers.
+ *
+ * Returns:
+ * A pointer to a new plane state on success, or NULL otherwise.
+ */
+struct drm_plane_state *
+drm_gem_simple_kms_duplicate_shadow_plane_state(struct drm_simple_display_pipe *pipe,
+						struct drm_plane_state *plane_state)
+{
+	return drm_gem_duplicate_shadow_plane_state(&pipe->plane, plane_state);
+}
+EXPORT_SYMBOL(drm_gem_simple_kms_duplicate_shadow_plane_state);
+
+/**
+ * drm_gem_simple_kms_cleanup_shadow_fb - resets shadow-buffered plane state
+ * @pipe: the simple display pipe
+ * @plane_state: the plane state of type struct drm_shadow_plane_state
+ *
+ * This function implements struct drm_simple_display_funcs.reset_plane
+ * for shadow-buffered planes. It expects that mappings of shadow buffers
+ * have been released already.
+ */
+void drm_gem_simple_kms_destroy_shadow_plane_state(struct drm_simple_display_pipe *pipe,
+						   struct drm_plane_state *plane_state)
+{
+	drm_gem_destroy_shadow_plane_state(&pipe->plane, plane_state);
+}
+EXPORT_SYMBOL(drm_gem_simple_kms_destroy_shadow_plane_state);
diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
new file mode 100644
index 000000000000..a5923983acaf
--- /dev/null
+++ b/include/drm/drm_gem_atomic_helper.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __DRM_GEM_ATOMIC_HELPER_H__
+#define __DRM_GEM_ATOMIC_HELPER_H__
+
+#include <linux/dma-buf-map.h>
+
+#include <drm/drm_plane.h>
+
+struct drm_simple_display_pipe;
+
+/*
+ * Helpers for planes with shadow buffers
+ */
+
+/**
+ * struct drm_shadow_plane_state - plane state for planes with shadow buffers
+ *
+ * For planes that use a shadow buffer, struct drm_shadow_plane_state
+ * provides the regular plane state plus mappings of the shadow buffer
+ * into kernel address space.
+ */
+struct drm_shadow_plane_state {
+	/** @base: plane state */
+	struct drm_plane_state base;
+
+	/* Transitional state - do not export or duplicate */
+
+	/**
+	 * @map: Mappings of the plane's framebuffer BOs in to kernel address space
+	 *
+	 * The memory mappings stored in map should be established in the plane's
+	 * prepare_fb callback and removed in the cleanup_fb callback.
+	 */
+	struct dma_buf_map map[4];
+};
+
+/**
+ * to_drm_shadow_plane_state - upcasts from struct drm_plane_state
+ * @state: the plane state
+ */
+static inline struct drm_shadow_plane_state *
+to_drm_shadow_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct drm_shadow_plane_state, base);
+}
+
+int drm_gem_simple_kms_prepare_shadow_fb(struct drm_simple_display_pipe *pipe,
+						  struct drm_plane_state *plane_state);
+void drm_gem_simple_kms_cleanup_shadow_fb(struct drm_simple_display_pipe *pipe,
+						   struct drm_plane_state *plane_state);
+void drm_gem_simple_kms_reset_shadow_plane(struct drm_simple_display_pipe *pipe);
+struct drm_plane_state *
+drm_gem_simple_kms_duplicate_shadow_plane_state(struct drm_simple_display_pipe *pipe,
+							 struct drm_plane_state *plane_state);
+void
+drm_gem_simple_kms_destroy_shadow_plane_state(struct drm_simple_display_pipe *pipe,
+						       struct drm_plane_state *plane_state);
+
+/**
+ * DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS -
+ *	Initializes struct drm_simple_display_pipe_funcs for shadow-buffered planes
+ *
+ * Drivers may use GEM BOs as shadow buffers over the framebuffer memory. This
+ * macro initializes struct drm_simple_display_pipe_funcs to use the rsp helper
+ * functions.
+ */
+#define DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS \
+	.prepare_fb = drm_gem_simple_kms_prepare_shadow_fb, \
+	.cleanup_fb = drm_gem_simple_kms_cleanup_shadow_fb, \
+	.reset_plane = drm_gem_simple_kms_reset_shadow_plane, \
+	.duplicate_plane_state = drm_gem_simple_kms_duplicate_shadow_plane_state, \
+	.destroy_plane_state = drm_gem_simple_kms_destroy_shadow_plane_state
+
+#endif /* __DRM_GEM_ATOMIC_HELPER_H__ */
-- 
2.30.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
