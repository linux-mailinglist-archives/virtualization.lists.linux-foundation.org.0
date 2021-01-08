Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC772EEFDC
	for <lists.virtualization@lfdr.de>; Fri,  8 Jan 2021 10:44:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B64F286D47;
	Fri,  8 Jan 2021 09:43:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G9hjYnwnhImV; Fri,  8 Jan 2021 09:43:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7FBF286D56;
	Fri,  8 Jan 2021 09:43:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B5BEC013A;
	Fri,  8 Jan 2021 09:43:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC75EC013A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 09:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B4272204F6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 09:43:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Fm76Km+1XMx
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 09:43:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 434132E11B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 09:43:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB9D9AFAC;
 Fri,  8 Jan 2021 09:43:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, airlied@redhat.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 sam@ravnborg.org
Subject: [PATCH v4 06/13] drm/cirrus: Use drm_gem_shmem_vmap_local() in damage
 handling
Date: Fri,  8 Jan 2021 10:43:33 +0100
Message-Id: <20210108094340.15290-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108094340.15290-1-tzimmermann@suse.de>
References: <20210108094340.15290-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: linaro-mm-sig@lists.linaro.org, virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
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

Damage handling in cirrus requires a short-term mapping of the source
BO. Use drm_gem_shmem_vmap_local().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index a043e602199e..21cd7056d45f 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -315,6 +315,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 			       struct drm_rect *rect)
 {
 	struct cirrus_device *cirrus = to_cirrus(fb->dev);
+	struct drm_gem_object *obj = fb->obj[0];
 	struct dma_buf_map map;
 	void *vmap;
 	int idx, ret;
@@ -323,9 +324,12 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	if (!drm_dev_enter(&cirrus->dev, &idx))
 		goto out;
 
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	ret = dma_resv_lock(obj->resv, NULL);
 	if (ret)
 		goto out_dev_exit;
+	ret = drm_gem_shmem_vmap_local(fb->obj[0], &map);
+	if (ret)
+		goto out_dma_resv_unlock;
 	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	if (cirrus->cpp == fb->format->cpp[0])
@@ -345,9 +349,11 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	else
 		WARN_ON_ONCE("cpp mismatch");
 
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
 	ret = 0;
 
+	drm_gem_shmem_vunmap_local(obj, &map);
+out_dma_resv_unlock:
+	dma_resv_unlock(obj->resv);
 out_dev_exit:
 	drm_dev_exit(idx);
 out:
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
