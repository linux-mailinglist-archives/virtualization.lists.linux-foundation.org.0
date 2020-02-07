Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9F91553DB
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 09:41:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 054F187D0B;
	Fri,  7 Feb 2020 08:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0lzu2YAAxcW; Fri,  7 Feb 2020 08:41:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7290687E30;
	Fri,  7 Feb 2020 08:41:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60F0FC1D81;
	Fri,  7 Feb 2020 08:41:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE5E4C1D81
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B9102203BF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzDmU7FBovJ6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 4BB21203CA
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 91845B132;
 Fri,  7 Feb 2020 08:41:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, alexander.deucher@amd.com, emil.velikov@collabora.com
Subject: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
Date: Fri,  7 Feb 2020 09:41:31 +0100
Message-Id: <20200207084135.4524-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207084135.4524-1-tzimmermann@suse.de>
References: <20200207084135.4524-1-tzimmermann@suse.de>
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

The simple-encoder helpers initialize an encoder with an empty
implementation. This covers the requirements of most of the existing
DRM drivers. A call to drm_simple_encoder_create() allocates and
initializes an encoder instance, a call to drm_simple_encoder_init()
initializes a pre-allocated instance.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_encoder.c | 116 ++++++++++++++++++++++++++++++++++
 include/drm/drm_encoder.h     |  10 +++
 2 files changed, 126 insertions(+)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index ffe691a1bf34..1a65cab1f310 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -178,6 +178,122 @@ int drm_encoder_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_encoder_init);
 
+static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
+	.destroy = drm_encoder_cleanup,
+};
+
+/**
+ * drm_simple_encoder_init - Init a preallocated encoder
+ * @dev: drm device
+ * @funcs: callbacks for this encoder
+ * @encoder_type: user visible type of the encoder
+ * @name: printf style format string for the encoder name, or NULL
+ *        for default name
+ *
+ * Initialises a preallocated encoder that has no further functionality. The
+ * encoder will be released automatically.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_simple_encoder_init(struct drm_device *dev,
+			    struct drm_encoder *encoder,
+			    int encoder_type, const char *name, ...)
+{
+	char *namestr = NULL;
+	int ret;
+
+	if (name) {
+		va_list ap;
+
+		va_start(ap, name);
+		namestr = kvasprintf(GFP_KERNEL, name, ap);
+		va_end(ap);
+		if (!namestr)
+			return -ENOMEM;
+	}
+
+	ret = __drm_encoder_init(dev, encoder,
+				 &drm_simple_encoder_funcs_cleanup,
+				 encoder_type, namestr);
+	if (ret)
+		goto err_kfree;
+
+	return 0;
+
+err_kfree:
+	if (name)
+		kfree(namestr);
+	return ret;
+}
+EXPORT_SYMBOL(drm_simple_encoder_init);
+
+static void drm_encoder_destroy(struct drm_encoder *encoder)
+{
+	struct drm_device *dev = encoder->dev;
+
+	drm_encoder_cleanup(encoder);
+	devm_kfree(dev->dev, encoder);
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
+ * @name: printf style format string for the encoder name, or NULL for
+ *        default name
+ *
+ * Allocates and initialises an encoder that has no further functionality. The
+ * encoder will be released automatically.
+ *
+ * Returns:
+ * The encoder on success, a pointer-encoder error code on failure.
+ */
+struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,
+					      int encoder_type,
+					      const char *name, ...)
+{
+	char *namestr = NULL;
+	struct drm_encoder *encoder;
+	int ret;
+
+	encoder = devm_kzalloc(dev->dev, sizeof(*encoder), GFP_KERNEL);
+	if (!encoder)
+		return ERR_PTR(-ENOMEM);
+
+	if (name) {
+		va_list ap;
+
+		va_start(ap, name);
+		namestr = kvasprintf(GFP_KERNEL, name, ap);
+		va_end(ap);
+		if (!namestr) {
+			ret = -ENOMEM;
+			goto err_devm_kfree;
+		}
+	}
+
+	ret = __drm_encoder_init(dev, encoder,
+				 &drm_simple_encoder_funcs_destroy,
+				 encoder_type, namestr);
+	if (ret)
+		goto err_kfree;
+
+	return encoder;
+
+err_kfree:
+	if (name)
+		kfree(namestr);
+err_devm_kfree:
+	devm_kfree(dev->dev, encoder);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(drm_simple_encoder_create);
+
 /**
  * drm_encoder_cleanup - cleans up an initialised encoder
  * @encoder: encoder to cleanup
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 5623994b6e9e..0214f6cf9de6 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -190,6 +190,16 @@ int drm_encoder_init(struct drm_device *dev,
 		     const struct drm_encoder_funcs *funcs,
 		     int encoder_type, const char *name, ...);
 
+__printf(4, 5)
+int drm_simple_encoder_init(struct drm_device *dev,
+			    struct drm_encoder *encoder,
+			    int encoder_type, const char *name, ...);
+
+__printf(3, 4)
+struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,
+					      int encoder_type,
+					      const char *name, ...);
+
 /**
  * drm_encoder_index - find the index of a registered encoder
  * @encoder: encoder to find index for
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
