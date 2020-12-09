Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E16512D441D
	for <lists.virtualization@lfdr.de>; Wed,  9 Dec 2020 15:25:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 28F7987A3A;
	Wed,  9 Dec 2020 14:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0PTw1jCUzli; Wed,  9 Dec 2020 14:25:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A792087A16;
	Wed,  9 Dec 2020 14:25:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A925C0FA7;
	Wed,  9 Dec 2020 14:25:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30338C013B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 14:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1E88187A17
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 14:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U1b3oi0Ne1JV
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 14:25:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 36460872D0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 14:25:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31844AD5C;
 Wed,  9 Dec 2020 14:25:31 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
 sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, eric@anholt.net, sam@ravnborg.org
Subject: [PATCH v3 1/8] drm/ast: Don't pin cursor source BO explicitly during
 update
Date: Wed,  9 Dec 2020 15:25:20 +0100
Message-Id: <20201209142527.26415-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209142527.26415-1-tzimmermann@suse.de>
References: <20201209142527.26415-1-tzimmermann@suse.de>
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

Vmapping the cursor source BO contains an implicit pin operation,
so there's no need to do this manually.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 742d43a7edf4..68bf3d33f1ed 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -180,12 +180,9 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 
 	gbo = drm_gem_vram_of_gem(fb->obj[0]);
 
-	ret = drm_gem_vram_pin(gbo, 0);
-	if (ret)
-		return ret;
 	ret = drm_gem_vram_vmap(gbo, &map);
 	if (ret)
-		goto err_drm_gem_vram_unpin;
+		return ret;
 	src = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	dst = ast->cursor.map[ast->cursor.next_index].vaddr_iomem;
@@ -194,13 +191,8 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 	update_cursor_image(dst, src, fb->width, fb->height);
 
 	drm_gem_vram_vunmap(gbo, &map);
-	drm_gem_vram_unpin(gbo);
 
 	return 0;
-
-err_drm_gem_vram_unpin:
-	drm_gem_vram_unpin(gbo);
-	return ret;
 }
 
 static void ast_cursor_set_base(struct ast_private *ast, u64 address)
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
