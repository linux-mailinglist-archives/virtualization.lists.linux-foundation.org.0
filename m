Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A5C98BB0
	for <lists.virtualization@lfdr.de>; Thu, 22 Aug 2019 08:51:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B6C1DCDF;
	Thu, 22 Aug 2019 06:50:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 28606CD2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 06:50:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CEC2B67F
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 06:50:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 681C73082E57;
	Thu, 22 Aug 2019 06:50:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06203610C6;
	Thu, 22 Aug 2019 06:50:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 42AF197A1; Thu, 22 Aug 2019 08:50:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/4] drm/bochs: move bochs_hw_setformat() call
Date: Thu, 22 Aug 2019 08:50:41 +0200
Message-Id: <20190822065041.11941-5-kraxel@redhat.com>
In-Reply-To: <20190822065041.11941-1-kraxel@redhat.com>
References: <20190822065041.11941-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 22 Aug 2019 06:50:48 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Call it from bochs_hw_setfb().
This also allows to make bochs_hw_setformat static.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/bochs/bochs.h     | 2 --
 drivers/gpu/drm/bochs/bochs_hw.c  | 5 +++--
 drivers/gpu/drm/bochs/bochs_kms.c | 1 -
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
index fa36a358a5dc..50fda96444e1 100644
--- a/drivers/gpu/drm/bochs/bochs.h
+++ b/drivers/gpu/drm/bochs/bochs.h
@@ -78,8 +78,6 @@ void bochs_hw_fini(struct drm_device *dev);
 
 void bochs_hw_setmode(struct bochs_device *bochs,
 		      struct drm_display_mode *mode);
-void bochs_hw_setformat(struct bochs_device *bochs,
-			const struct drm_format_info *format);
 void bochs_hw_setfb(struct bochs_device *bochs,
 		    struct drm_framebuffer *fb,
 		    int x, int y);
diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
index 0749e9de1a4d..da68072be6ae 100644
--- a/drivers/gpu/drm/bochs/bochs_hw.c
+++ b/drivers/gpu/drm/bochs/bochs_hw.c
@@ -228,8 +228,8 @@ void bochs_hw_setmode(struct bochs_device *bochs,
 			  VBE_DISPI_ENABLED | VBE_DISPI_LFB_ENABLED);
 }
 
-void bochs_hw_setformat(struct bochs_device *bochs,
-			const struct drm_format_info *format)
+static void bochs_hw_setformat(struct bochs_device *bochs,
+			       const struct drm_format_info *format)
 {
 	DRM_DEBUG_DRIVER("format %c%c%c%c\n",
 			 (format->format >>  0) & 0xff,
@@ -269,4 +269,5 @@ void bochs_hw_setfb(struct bochs_device *bochs,
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_WIDTH, vwidth);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_X_OFFSET, vx);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_Y_OFFSET, vy);
+	bochs_hw_setformat(bochs, fb->format);
 }
diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 334e458cbc31..d02104fddf82 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -35,7 +35,6 @@ static void bochs_plane_update(struct bochs_device *bochs,
 	bochs_hw_setfb(bochs, state->fb,
 		       state->crtc_x,
 		       state->crtc_y);
-	bochs_hw_setformat(bochs, state->fb->format);
 }
 
 static void bochs_pipe_enable(struct drm_simple_display_pipe *pipe,
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
