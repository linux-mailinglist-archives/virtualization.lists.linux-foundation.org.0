Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7541622A1
	for <lists.virtualization@lfdr.de>; Tue, 18 Feb 2020 09:48:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 893FB87356;
	Tue, 18 Feb 2020 08:48:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMEhkJjIGBX3; Tue, 18 Feb 2020 08:48:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2B6E38733C;
	Tue, 18 Feb 2020 08:48:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B15FC013E;
	Tue, 18 Feb 2020 08:48:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CEFDC08A0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 08:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6C153858DA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 08:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id deJ7XsmU77uz
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 08:48:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7523A858C6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 08:48:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 523C8ADE3;
 Tue, 18 Feb 2020 08:48:20 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, alexander.deucher@amd.com, emil.velikov@collabora.com
Subject: [PATCH v2 1/4] drm/simple-kms: Add drm_simple_encoder_{init, create}()
Date: Tue, 18 Feb 2020 09:48:12 +0100
Message-Id: <20200218084815.2137-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218084815.2137-1-tzimmermann@suse.de>
References: <20200218084815.2137-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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

This patch makes the internal encoder implementation of the simple
KMS helpers available to drivers.

These simple-encoder helpers initialize an encoder with an empty
implementation. This covers the requirements of most of the existing
DRM drivers. A call to drm_simple_encoder_create() allocates and
initializes an encoder instance, a call to drm_simple_encoder_init()
initializes a pre-allocated instance.

v2:
	* move simple encoder to KMS helpers
	* remove name argument; simplifies implementation
	* don't allocate with devm_ interfaces; unsafe with DRM

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 83 ++++++++++++++++++++++++-
 include/drm/drm_simple_kms_helper.h     |  7 +++
 2 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 15fb516ae2d8..745c2f34c42b 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -26,12 +26,90 @@
  * entity. Some flexibility for code reuse is provided through a separately
  * allocated &drm_connector object and supporting optional &drm_bridge
  * encoder drivers.
+ *
+ * Many drivers use an encoder with an empty implementation. Such encoders
+ * fulfill the minimum requirements of the display pipeline, but don't add
+ * additional functionality. The simple-encoder functions
+ * drm_simple_encoder_init() and drm_simple_encoder_create() provide an
+ * appropriate implementation.
  */
 
-static const struct drm_encoder_funcs drm_simple_kms_encoder_funcs = {
+static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
 	.destroy = drm_encoder_cleanup,
 };
 
+/**
+ * drm_simple_encoder_init - Initialize a preallocated encoder
+ * @dev: drm device
+ * @funcs: callbacks for this encoder
+ * @encoder_type: user visible type of the encoder
+ *
+ * Initialises a preallocated encoder that has no further functionality. The
+ * encoder will be released automatically. Settings for possible CRTC and
+ * clones are left to their initial values. The encoder will be cleaned up
+ * automatically as part of the mode-setting cleanup.
+ *
+ * Also see drm_simple_encoder_create().
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_simple_encoder_init(struct drm_device *dev,
+			    struct drm_encoder *encoder,
+			    int encoder_type)
+{
+	return drm_encoder_init(dev, encoder,
+				&drm_simple_encoder_funcs_cleanup,
+				encoder_type, NULL);
+}
+EXPORT_SYMBOL(drm_simple_encoder_init);
+
+static void drm_encoder_destroy(struct drm_encoder *encoder)
+{
+	drm_encoder_cleanup(encoder);
+	kfree(encoder);
+}
+
+static const struct drm_encoder_funcs drm_simple_encoder_funcs_destroy = {
+	.destroy = drm_encoder_destroy,
+};
+
+/**
+ * drm_simple_encoder_create - Allocate and initialize an encoder
+ * @dev: drm device
+ * @encoder_type: user visible type of the encoder
+ *
+ * Allocates and initialises an encoder that has no further functionality. The
+ * encoder will be destroyed automatically as part of the mode-setting cleanup.
+ *
+ * See drm_simple_encoder_init() for more information.
+ *
+ * Returns:
+ * The encoder on success, a pointer-encoder error code on failure.
+ */
+struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,
+					      int encoder_type)
+{
+	struct drm_encoder *encoder;
+	int ret;
+
+	encoder = kzalloc(sizeof(*encoder), GFP_KERNEL);
+	if (!encoder)
+		return ERR_PTR(-ENOMEM);
+	ret = drm_encoder_init(dev, encoder,
+			       &drm_simple_encoder_funcs_destroy,
+			       encoder_type, NULL);
+	if (ret)
+		goto err_kfree;
+
+	return encoder;
+
+err_kfree:
+	kfree(encoder);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(drm_simple_encoder_create);
+
 static enum drm_mode_status
 drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
 			       const struct drm_display_mode *mode)
@@ -288,8 +366,7 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 		return ret;
 
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_encoder_init(dev, encoder, &drm_simple_kms_encoder_funcs,
-			       DRM_MODE_ENCODER_NONE, NULL);
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE);
 	if (ret || !connector)
 		return ret;
 
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index e253ba7bea9d..54d5066d90c7 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -181,4 +181,11 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 			const uint64_t *format_modifiers,
 			struct drm_connector *connector);
 
+int drm_simple_encoder_init(struct drm_device *dev,
+			    struct drm_encoder *encoder,
+			    int encoder_type);
+
+struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,
+					      int encoder_type);
+
 #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
