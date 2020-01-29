Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D41314CA1C
	for <lists.virtualization@lfdr.de>; Wed, 29 Jan 2020 13:05:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C025C87E76;
	Wed, 29 Jan 2020 12:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzxR0bI8STk1; Wed, 29 Jan 2020 12:05:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B4D538816F;
	Wed, 29 Jan 2020 12:05:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AAE1C0881;
	Wed, 29 Jan 2020 12:05:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31DEAC0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 19A7888072
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jqctt5SaGGNV
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C0F4387E76
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B1235AE46;
 Wed, 29 Jan 2020 12:05:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v5 01/15] drm: Initialize struct drm_crtc_state.no_vblank from
 device settings
Date: Wed, 29 Jan 2020 13:05:17 +0100
Message-Id: <20200129120531.6891-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
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

At the end of a commit, atomic helpers can generate a fake VBLANK event
automatically. Originally implemented for writeback connectors, the
functionality can be used by any driver and/or hardware without proper
VBLANK interrupt.

The patch updates the documentation to make this behaviour official:
settings struct drm_crtc_state.no_vblank to true enables automatic
generation of fake VBLANK events.

The new interface drm_dev_has_vblank() returns true if vblanking has
been initialized for a device, or false otherwise. Atomic helpers use
this function when initializing no_vblank in the CRTC state in
drm_atomic_helper_check_modeset(). If vblanking has been initialized
for a device, no_blank is disabled. Otherwise it's enabled. Hence,
atomic helpers will automatically send out fake VBLANK events with any
driver that did not initialize vblanking.

v5:
	* more precise documentation and commit message
v4:
	* replace drm_crtc_has_vblank() with drm_dev_has_vblank()
	* add drm_dev_has_vblank() in this patch
	* move driver changes into separate patches
v3:
	* squash all related changes patches into this patch

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_atomic_helper.c | 10 ++++++++-
 drivers/gpu/drm/drm_vblank.c        | 28 ++++++++++++++++++++++++
 include/drm/drm_crtc.h              | 34 +++++++++++++++++++++++------
 include/drm/drm_simple_kms_helper.h |  7 ++++--
 include/drm/drm_vblank.h            |  1 +
 5 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 4511c2e07bb9..d7b73cd89b79 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -583,6 +583,7 @@ mode_valid(struct drm_atomic_state *state)
  * &drm_crtc_state.connectors_changed is set when a connector is added or
  * removed from the CRTC.  &drm_crtc_state.active_changed is set when
  * &drm_crtc_state.active changes, which is used for DPMS.
+ * &drm_crtc_state.no_vblank is set from the result of drm_dev_has_vblank().
  * See also: drm_atomic_crtc_needs_modeset()
  *
  * IMPORTANT:
@@ -649,6 +650,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 
 			return -EINVAL;
 		}
+
+		if (drm_dev_has_vblank(dev))
+			new_crtc_state->no_vblank = false;
+		else
+			new_crtc_state->no_vblank = true;
 	}
 
 	ret = handle_conflicting_encoders(state, false);
@@ -2215,7 +2221,9 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_dependencies);
  * when a job is queued, and any change to the pipeline that does not touch the
  * connector is leading to timeouts when calling
  * drm_atomic_helper_wait_for_vblanks() or
- * drm_atomic_helper_wait_for_flip_done().
+ * drm_atomic_helper_wait_for_flip_done(). In addition to writeback
+ * connectors, this function can also fake VBLANK events for CRTCs without
+ * VBLANK interrupt.
  *
  * This is part of the atomic helper support for nonblocking commits, see
  * drm_atomic_helper_setup_commit() for an overview.
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 1659b13b178c..27a99c486f02 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -69,6 +69,12 @@
  * &drm_driver.max_vblank_count. In that case the vblank core only disables the
  * vblanks after a timer has expired, which can be configured through the
  * ``vblankoffdelay`` module parameter.
+ *
+ * Drivers for hardware without support for vertical-blanking interrupts
+ * must not call drm_vblank_init(). For such drivers, atomic helpers will
+ * automatically generate fake vblank events as part of the display update.
+ * This functionality also can be controlled by the driver by enabling and
+ * disabling struct drm_crtc_state.no_vblank.
  */
 
 /* Retry timestamp calculation up to 3 times to satisfy
@@ -501,6 +507,28 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 }
 EXPORT_SYMBOL(drm_vblank_init);
 
+/**
+ * drm_dev_has_vblank - test if vblanking has been initialized for
+ *                      a device
+ * @dev: the device
+ *
+ * Drivers may call this function to test if vblank support is
+ * initialized for a device. For most hardware this means that vblanking
+ * can also be enabled.
+ *
+ * Atomic helpers use this function to initialize
+ * &drm_crtc_state.no_vblank. See also drm_atomic_helper_check_modeset().
+ *
+ * Returns:
+ * True if vblanking has been initialized for the given device, false
+ * otherwise.
+ */
+bool drm_dev_has_vblank(const struct drm_device *dev)
+{
+	return dev->num_crtcs != 0;
+}
+EXPORT_SYMBOL(drm_dev_has_vblank);
+
 /**
  * drm_crtc_vblank_waitqueue - get vblank waitqueue for the CRTC
  * @crtc: which CRTC's vblank waitqueue to retrieve
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 5e9b15a0e8c5..6bef2f41d4d7 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -174,12 +174,25 @@ struct drm_crtc_state {
 	 * @no_vblank:
 	 *
 	 * Reflects the ability of a CRTC to send VBLANK events. This state
-	 * usually depends on the pipeline configuration, and the main usuage
-	 * is CRTCs feeding a writeback connector operating in oneshot mode.
-	 * In this case the VBLANK event is only generated when a job is queued
-	 * to the writeback connector, and we want the core to fake VBLANK
-	 * events when this part of the pipeline hasn't changed but others had
-	 * or when the CRTC and connectors are being disabled.
+	 * usually depends on the pipeline configuration. If set to true, DRM
+	 * atomic helpers will send out a fake VBLANK event during display
+	 * updates after all hardware changes have been committed. This is
+	 * implemented in drm_atomic_helper_fake_vblank().
+	 *
+	 * One usage is for drivers and/or hardware without support for VBLANK
+	 * interrupts. Such drivers typically do not initialize vblanking
+	 * (i.e., call drm_vblank_init() with the number of CRTCs). For CRTCs
+	 * without initialized vblanking, this field is set to true in
+	 * drm_atomic_helper_check_modeset(), and a fake VBLANK event will be
+	 * send out on each update of the display pipeline by
+	 * drm_atomic_helper_fake_vblank().
+	 *
+	 * Another usage is CRTCs feeding a writeback connector operating in
+	 * oneshot mode. In this case the fake VBLANK event is only generated
+	 * when a job is queued to the writeback connector, and we want the
+	 * core to fake VBLANK events when this part of the pipeline hasn't
+	 * changed but others had or when the CRTC and connectors are being
+	 * disabled.
 	 *
 	 * __drm_atomic_helper_crtc_duplicate_state() will not reset the value
 	 * from the current state, the CRTC driver is then responsible for
@@ -335,7 +348,14 @@ struct drm_crtc_state {
 	 *  - Events for disabled CRTCs are not allowed, and drivers can ignore
 	 *    that case.
 	 *
-	 * This can be handled by the drm_crtc_send_vblank_event() function,
+	 * For very simple hardware without VBLANK interrupt, enabling
+	 * &struct drm_crtc_state.no_vblank makes DRM's atomic commit helpers
+	 * send a fake VBLANK event at the end of the display update after all
+	 * hardware changes have been applied. See
+	 * drm_atomic_helper_fake_vblank().
+	 *
+	 * For more complex hardware this
+	 * can be handled by the drm_crtc_send_vblank_event() function,
 	 * which the driver should call on the provided event upon completion of
 	 * the atomic commit. Note that if the driver supports vblank signalling
 	 * and timestamping the vblank counters and timestamps must agree with
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index 15afee9cf049..e253ba7bea9d 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -100,8 +100,11 @@ struct drm_simple_display_pipe_funcs {
 	 * This is the function drivers should submit the
 	 * &drm_pending_vblank_event from. Using either
 	 * drm_crtc_arm_vblank_event(), when the driver supports vblank
-	 * interrupt handling, or drm_crtc_send_vblank_event() directly in case
-	 * the hardware lacks vblank support entirely.
+	 * interrupt handling, or drm_crtc_send_vblank_event() for more
+	 * complex case. In case the hardware lacks vblank support entirely,
+	 * drivers can set &struct drm_crtc_state.no_vblank in
+	 * &struct drm_simple_display_pipe_funcs.check and let DRM's
+	 * atomic helper fake a vblank event.
 	 */
 	void (*update)(struct drm_simple_display_pipe *pipe,
 		       struct drm_plane_state *old_plane_state);
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index c16c44052b3d..94275e93fd27 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -206,6 +206,7 @@ struct drm_vblank_crtc {
 };
 
 int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs);
+bool drm_dev_has_vblank(const struct drm_device *dev);
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
 u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 				   ktime_t *vblanktime);
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
