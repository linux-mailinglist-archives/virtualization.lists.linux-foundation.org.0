Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C77A7ADF
	for <lists.virtualization@lfdr.de>; Wed,  4 Sep 2019 07:47:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5B80F1027;
	Wed,  4 Sep 2019 05:47:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1E757101A
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 05:47:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BB1F4709
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 05:47:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DFB57BDA5;
	Wed,  4 Sep 2019 05:47:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
	[10.36.117.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE8795D9C9;
	Wed,  4 Sep 2019 05:47:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 931AB31ECC; Wed,  4 Sep 2019 07:47:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/7] drm/qxl: use drm_gem_object_funcs callbacks
Date: Wed,  4 Sep 2019 07:47:38 +0200
Message-Id: <20190904054740.20817-6-kraxel@redhat.com>
In-Reply-To: <20190904054740.20817-1-kraxel@redhat.com>
References: <20190904054740.20817-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 04 Sep 2019 05:47:46 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
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

Switch qxl to use drm_gem_object_funcs callbacks
instead of drm_driver callbacks.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_drv.c    |  8 --------
 drivers/gpu/drm/qxl/qxl_object.c | 12 ++++++++++++
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 2b726a51a302..996d428fa7e6 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -258,16 +258,8 @@ static struct drm_driver qxl_driver = {
 #endif
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_pin = qxl_gem_prime_pin,
-	.gem_prime_unpin = qxl_gem_prime_unpin,
-	.gem_prime_get_sg_table = qxl_gem_prime_get_sg_table,
 	.gem_prime_import_sg_table = qxl_gem_prime_import_sg_table,
-	.gem_prime_vmap = qxl_gem_prime_vmap,
-	.gem_prime_vunmap = qxl_gem_prime_vunmap,
 	.gem_prime_mmap = qxl_gem_prime_mmap,
-	.gem_free_object_unlocked = qxl_gem_object_free,
-	.gem_open_object = qxl_gem_object_open,
-	.gem_close_object = qxl_gem_object_close,
 	.fops = &qxl_fops,
 	.ioctls = qxl_ioctls,
 	.irq_handler = qxl_irq_handler,
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 548dfe6f3b26..29aab7b14513 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -77,6 +77,17 @@ void qxl_ttm_placement_from_domain(struct qxl_bo *qbo, u32 domain, bool pinned)
 	}
 }
 
+static const struct drm_gem_object_funcs qxl_object_funcs = {
+	.free = qxl_gem_object_free,
+	.open = qxl_gem_object_open,
+	.close = qxl_gem_object_close,
+	.pin = qxl_gem_prime_pin,
+	.unpin = qxl_gem_prime_unpin,
+	.get_sg_table = qxl_gem_prime_get_sg_table,
+	.vmap = qxl_gem_prime_vmap,
+	.vunmap = qxl_gem_prime_vunmap,
+};
+
 int qxl_bo_create(struct qxl_device *qdev,
 		  unsigned long size, bool kernel, bool pinned, u32 domain,
 		  struct qxl_surface *surf,
@@ -100,6 +111,7 @@ int qxl_bo_create(struct qxl_device *qdev,
 		kfree(bo);
 		return r;
 	}
+	bo->tbo.base.funcs = &qxl_object_funcs;
 	bo->type = domain;
 	bo->pin_count = pinned ? 1 : 0;
 	bo->surface_id = 0;
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
