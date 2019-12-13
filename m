Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC9B11E926
	for <lists.virtualization@lfdr.de>; Fri, 13 Dec 2019 18:26:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1FF25878A6;
	Fri, 13 Dec 2019 17:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iMG4lwG2ByJ5; Fri, 13 Dec 2019 17:26:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4595F878A4;
	Fri, 13 Dec 2019 17:26:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E43CC0881;
	Fri, 13 Dec 2019 17:26:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46D92C0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 17:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 35A4287330
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 17:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUvkhx3hNy1b
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 17:26:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F100D87317
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 17:26:27 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q10so232717wrm.11
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 09:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v2QQo2XB7NXwvW9lnZFYF7ZZ3DNShcC4KCT5UdTmJbg=;
 b=IkTuiXLCwMl5X6aSrAX2aAlYlfwvvlp6WhvuBzrSHu5i5Pkjt2f+lE62nHWnM7GTxA
 4RwLuaP8Edc/XfXBIDUQ2J6v6ROM0WE2Aqfb7rqiyKjzlVq/hHBSaqTfgoYbmmE7jnbR
 M6bz0mx19JEEERFXSknFWQzeV5ly+mh9dbg6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v2QQo2XB7NXwvW9lnZFYF7ZZ3DNShcC4KCT5UdTmJbg=;
 b=KJmZwqwHOUlYksJdZvpUXbTMJiJoRzeJyBhyf4AfZBXJZgtt0435oMBCfuu4kzd5/a
 CI1YtddYK0sxQA2bk0Zx0MaYwEhjfAKeca6KmvxTjqK6iXCqHBrvd+0Mr+CyXv7hwyb3
 V3rYADpllIZAohbQnMgW+r2SxFxsmLK8fr7FmrfMafYx5CxiOQLEVkZzainMdYKeITKg
 mF79Pam6qEVOmumKZXMKxipsN2XfIe32ycvef7/d0Lah/K5SRo2bgM/6Wlsc99i7RABT
 LZTHclMptrhwta1MkRNB7xws/DosTqp9stiDeJHKcA187Uf4Aa2u/7whf65CM2VF+e2W
 8xiQ==
X-Gm-Message-State: APjAAAXhMEHfa+KoiBCAMl/Xj3Isn6EqG+BDNcR1tjNxHb5jBQ0M1VUj
 c1/WQXziiMvYrHsLVxC+95wjLg==
X-Google-Smtp-Source: APXvYqxbjJsIIrae6ucYxC8SHS+iLhc+EAdv+i5QRVToz5+KDdFk5pSV7I1tisG7+zyWPdF8ERx+SQ==
X-Received: by 2002:a5d:4d4a:: with SMTP id a10mr14211332wru.220.1576257986276; 
 Fri, 13 Dec 2019 09:26:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id q15sm10689669wrr.11.2019.12.13.09.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 09:26:25 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/10] drm/virtio: plane_state->fb iff plane_state->crtc
Date: Fri, 13 Dec 2019 18:26:10 +0100
Message-Id: <20191213172612.1514842-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 virtualization@lists.linux-foundation.org,
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

Checking both is one too much, so wrap a WARN_ON around it to stope
the copypasta.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index bc4bc4475a8c..947e65b51555 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -88,7 +88,7 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 	struct drm_crtc_state *crtc_state;
 	int ret;
 
-	if (!state->fb || !state->crtc)
+	if (!state->fb || WARN_ON(!state->crtc))
 		return 0;
 
 	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
-- 
2.24.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
