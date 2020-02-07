Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5BE1553D9
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 09:41:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 25C4887D6C;
	Fri,  7 Feb 2020 08:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJETF3IGPej3; Fri,  7 Feb 2020 08:41:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CEC0087E37;
	Fri,  7 Feb 2020 08:41:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4AF0C1D85;
	Fri,  7 Feb 2020 08:41:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B793C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3AD73203B5
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 04df0dYVc4u4
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id A705E20462
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2C5EFB019;
 Fri,  7 Feb 2020 08:41:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, alexander.deucher@amd.com, emil.velikov@collabora.com
Subject: [PATCH 6/6] drm/simple-pipe: Use simple encoder
Date: Fri,  7 Feb 2020 09:41:35 +0100
Message-Id: <20200207084135.4524-7-tzimmermann@suse.de>
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

The simple-pipe helpers use an empty implementation for the encoder.
Replace the code with the generic simple encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 15fb516ae2d8..e16606b3ee20 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -28,10 +28,6 @@
  * encoder drivers.
  */
 
-static const struct drm_encoder_funcs drm_simple_kms_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static enum drm_mode_status
 drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
 			       const struct drm_display_mode *mode)
@@ -288,8 +284,8 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 		return ret;
 
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_encoder_init(dev, encoder, &drm_simple_kms_encoder_funcs,
-			       DRM_MODE_ENCODER_NONE, NULL);
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE,
+				      NULL);
 	if (ret || !connector)
 		return ret;
 
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
