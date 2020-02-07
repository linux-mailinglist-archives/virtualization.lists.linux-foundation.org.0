Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1AC1553D8
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 09:41:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BFEF287DAF;
	Fri,  7 Feb 2020 08:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1QQTw6wHTvYR; Fri,  7 Feb 2020 08:41:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 449EF87D6C;
	Fri,  7 Feb 2020 08:41:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C7CAC013E;
	Fri,  7 Feb 2020 08:41:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B62CBC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A3EB5203BF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2lBDV2+WghQ3
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 4CBF920421
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 80922B05C;
 Fri,  7 Feb 2020 08:41:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, alexander.deucher@amd.com, emil.velikov@collabora.com
Subject: [PATCH 1/6] drm: Move initialization of encoder into an internal
 function
Date: Fri,  7 Feb 2020 09:41:30 +0100
Message-Id: <20200207084135.4524-2-tzimmermann@suse.de>
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

Moving encoder init code into an internal function, so it can be reused.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_encoder.c | 78 +++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index e555281f43d4..ffe691a1bf34 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -91,6 +91,47 @@ void drm_encoder_unregister_all(struct drm_device *dev)
 	}
 }
 
+static int __drm_encoder_init(struct drm_device *dev,
+			      struct drm_encoder *encoder,
+			      const struct drm_encoder_funcs *funcs,
+			      int encoder_type, char *name)
+{
+	int ret;
+
+	/* encoder index is used with 32-bit bitmasks */
+	if (WARN_ON(dev->mode_config.num_encoder >= 32))
+		return -EINVAL;
+
+	ret = drm_mode_object_add(dev, &encoder->base, DRM_MODE_OBJECT_ENCODER);
+	if (ret)
+		return ret;
+
+	encoder->dev = dev;
+	encoder->encoder_type = encoder_type;
+	encoder->funcs = funcs;
+	if (name) {
+		encoder->name = name;
+	} else {
+		encoder->name = kasprintf(GFP_KERNEL, "%s-%d",
+					  drm_encoder_enum_list[encoder_type].name,
+					  encoder->base.id);
+		if (!encoder->name) {
+			ret = -ENOMEM;
+			goto out_put;
+		}
+	}
+
+	INIT_LIST_HEAD(&encoder->bridge_chain);
+	list_add_tail(&encoder->head, &dev->mode_config.encoder_list);
+	encoder->index = dev->mode_config.num_encoder++;
+
+out_put:
+	if (ret)
+		drm_mode_object_unregister(dev, &encoder->base);
+
+	return ret;
+}
+
 /**
  * drm_encoder_init - Init a preallocated encoder
  * @dev: drm device
@@ -111,43 +152,28 @@ int drm_encoder_init(struct drm_device *dev,
 		     const struct drm_encoder_funcs *funcs,
 		     int encoder_type, const char *name, ...)
 {
+	char *namestr = NULL;
 	int ret;
 
-	/* encoder index is used with 32bit bitmasks */
-	if (WARN_ON(dev->mode_config.num_encoder >= 32))
-		return -EINVAL;
-
-	ret = drm_mode_object_add(dev, &encoder->base, DRM_MODE_OBJECT_ENCODER);
-	if (ret)
-		return ret;
-
-	encoder->dev = dev;
-	encoder->encoder_type = encoder_type;
-	encoder->funcs = funcs;
 	if (name) {
 		va_list ap;
 
 		va_start(ap, name);
-		encoder->name = kvasprintf(GFP_KERNEL, name, ap);
+		namestr = kvasprintf(GFP_KERNEL, name, ap);
 		va_end(ap);
-	} else {
-		encoder->name = kasprintf(GFP_KERNEL, "%s-%d",
-					  drm_encoder_enum_list[encoder_type].name,
-					  encoder->base.id);
-	}
-	if (!encoder->name) {
-		ret = -ENOMEM;
-		goto out_put;
+		if (!namestr)
+			return -ENOMEM;
 	}
 
-	INIT_LIST_HEAD(&encoder->bridge_chain);
-	list_add_tail(&encoder->head, &dev->mode_config.encoder_list);
-	encoder->index = dev->mode_config.num_encoder++;
-
-out_put:
+	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, namestr);
 	if (ret)
-		drm_mode_object_unregister(dev, &encoder->base);
+		goto err_kfree;
+
+	return 0;
 
+err_kfree:
+	if (name)
+		kfree(namestr);
 	return ret;
 }
 EXPORT_SYMBOL(drm_encoder_init);
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
