Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3412B21A01E
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 14:33:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A93F088959;
	Thu,  9 Jul 2020 12:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZlxGQLywJyX; Thu,  9 Jul 2020 12:33:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 24875888CB;
	Thu,  9 Jul 2020 12:33:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 083D8C08A5;
	Thu,  9 Jul 2020 12:33:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71FF6C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 12:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 60F128888D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 12:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id irj5oc1lX09y
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 12:33:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 82F8688841
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 12:33:53 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g10so6175534wmc.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Jul 2020 05:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3e+2hfQAEno550QSTUaHwqumwSkwkBzuWx2HdwXt2vk=;
 b=dcBagqjPL5oaA17pl8tDkIKyeu12QXbFJrtQGGLySAvLDY4xiergC2IYR6E1fpmf4p
 1WACZV3CMOEQku9V/ZRJ4sZLASuV3NVXphsb30Q+GUjzDBa8TFvBnMO71pd02lVOROXU
 YPnb5OTAQoA0wAe6EW+/BDiI3Gr7pzCuT6Vuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3e+2hfQAEno550QSTUaHwqumwSkwkBzuWx2HdwXt2vk=;
 b=gin7xK+8rXMZg3gC++vLoZ8t93BpepiVN/uKwr9zgrS1AbcFXg5Y1CJ4AiGlLuDdKZ
 3c6ZIk1zCeSn2j9a/IeivtIFe5G9F1DT+e8rr9WJ5Z15LRvbUKrH3gKZ9FTczui113FO
 ca3EgcuPtthCuooFcqluEXlGbyRcRgGgnW84Sym5yWwTD35s+/w6TBsJwK/h23Nh8x5l
 v3jNe9+pbr+t8aUeCk77JwA71IZWLPIRs3bAR9jGaXfiLdwH4BhGeNDPnqMmzOFhQffN
 gxwzlcn3Sx2F3sPx6lpKWpXzy5S+boPAa9Gk0ge1YCXOZZ7ObLazsEMGFG9777CvP1vK
 quLw==
X-Gm-Message-State: AOAM530UvfGH0p7BhJJLYIMVfvFUZ2TMBLbNiAhxRzSkC7dPOyMml/IL
 tELyE05SnqUuaKSDqsyGV4tl0A==
X-Google-Smtp-Source: ABdhPJz0m548k8vvU6TSo8mQCX1rasisxK2aa1KJaJsuIt1AObEfDAw51itB4tLFY3QZ8k7xMQcj5w==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr13930700wmi.98.1594298032057; 
 Thu, 09 Jul 2020 05:33:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o205sm4925347wme.24.2020.07.09.05.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 05:33:51 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/virtio: Remove open-coded commit-tail function
Date: Thu,  9 Jul 2020 14:33:39 +0200
Message-Id: <20200709123339.547390-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200709123339.547390-1-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>
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

Exactly matches the one in the helpers.

This avoids me having to roll out dma-fence critical section
annotations to this copy.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index f3ce49c5a34c..af55b334be2f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -314,25 +314,6 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
 	return &virtio_gpu_fb->base;
 }
 
-static void vgdev_atomic_commit_tail(struct drm_atomic_state *state)
-{
-	struct drm_device *dev = state->dev;
-
-	drm_atomic_helper_commit_modeset_disables(dev, state);
-	drm_atomic_helper_commit_modeset_enables(dev, state);
-	drm_atomic_helper_commit_planes(dev, state, 0);
-
-	drm_atomic_helper_fake_vblank(state);
-	drm_atomic_helper_commit_hw_done(state);
-
-	drm_atomic_helper_wait_for_vblanks(dev, state);
-	drm_atomic_helper_cleanup_planes(dev, state);
-}
-
-static const struct drm_mode_config_helper_funcs virtio_mode_config_helpers = {
-	.atomic_commit_tail = vgdev_atomic_commit_tail,
-};
-
 static const struct drm_mode_config_funcs virtio_gpu_mode_funcs = {
 	.fb_create = virtio_gpu_user_framebuffer_create,
 	.atomic_check = drm_atomic_helper_check,
@@ -346,7 +327,6 @@ void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
 	drm_mode_config_init(vgdev->ddev);
 	vgdev->ddev->mode_config.quirk_addfb_prefer_host_byte_order = true;
 	vgdev->ddev->mode_config.funcs = &virtio_gpu_mode_funcs;
-	vgdev->ddev->mode_config.helper_private = &virtio_mode_config_helpers;
 
 	/* modes will be validated against the framebuffer size */
 	vgdev->ddev->mode_config.min_width = XRES_MIN;
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
