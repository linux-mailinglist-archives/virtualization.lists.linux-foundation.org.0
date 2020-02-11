Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6E2158C7D
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 11:16:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6DCD484482;
	Tue, 11 Feb 2020 10:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dOEZS1_vCF0e; Tue, 11 Feb 2020 10:16:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D678A8452E;
	Tue, 11 Feb 2020 10:16:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9FF3C07FE;
	Tue, 11 Feb 2020 10:16:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 140ACC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 10:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EF4F68749A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 10:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuuvQZpu2s+v
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 10:16:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6FFC58742F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 10:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581416189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=sda4jswTQqDClp+1BqO3sE4MRSxFm9X8kK4k52jxa60=;
 b=gHvGrgPYKHgOcXqfovrTPK4V336bChdSrTxTdr+V+z6bvALdTdymQDhA9NuVJ0R3lMlROE
 LOAERCxxwTOrQ+AGww52zhqLgjmGbBaxrtHrXbLWlatRakljt9E4y2P1IIASwZFNKXSPgR
 X6MMpfx8OyAIjK1fvrylHYYS4PtAZVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-CXHpP1NgOpKuenAxC4JNAA-1; Tue, 11 Feb 2020 05:16:21 -0500
X-MC-Unique: CXHpP1NgOpKuenAxC4JNAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8357E107ACC7;
 Tue, 11 Feb 2020 10:16:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12B6D10016DA;
 Tue, 11 Feb 2020 10:16:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0EFBE16E15; Tue, 11 Feb 2020 11:16:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/cirrus: add drm_driver.release callback.
Date: Tue, 11 Feb 2020 11:16:15 +0100
Message-Id: <20200211101616.16065-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Move final cleanups from cirrus_pci_remove() to the new callback.
Add drm_atomic_helper_shutdown() call to cirrus_pci_remove().

Use drm_dev_{enter,exit,unplug} to avoid touching hardware after
device removal.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/cirrus/cirrus.c | 43 ++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cirrus.c
index a91fb0d7282c..d2ff63ce8eaf 100644
--- a/drivers/gpu/drm/cirrus/cirrus.c
+++ b/drivers/gpu/drm/cirrus/cirrus.c
@@ -151,9 +151,13 @@ static int cirrus_pitch(struct drm_framebuffer *fb)
 
 static void cirrus_set_start_address(struct cirrus_device *cirrus, u32 offset)
 {
+	int idx;
 	u32 addr;
 	u8 tmp;
 
+	if (!drm_dev_enter(&cirrus->dev, &idx))
+		return;
+
 	addr = offset >> 2;
 	wreg_crt(cirrus, 0x0c, (u8)((addr >> 8) & 0xff));
 	wreg_crt(cirrus, 0x0d, (u8)(addr & 0xff));
@@ -168,6 +172,8 @@ static void cirrus_set_start_address(struct cirrus_device *cirrus, u32 offset)
 	tmp &= 0x7f;
 	tmp |= (addr >> 12) & 0x80;
 	wreg_crt(cirrus, 0x1d, tmp);
+
+	drm_dev_exit(idx);
 }
 
 static int cirrus_mode_set(struct cirrus_device *cirrus,
@@ -176,9 +182,12 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 {
 	int hsyncstart, hsyncend, htotal, hdispend;
 	int vtotal, vdispend;
-	int tmp;
+	int tmp, idx;
 	int sr07 = 0, hdr = 0;
 
+	if (!drm_dev_enter(&cirrus->dev, &idx))
+		return -1;
+
 	htotal = mode->htotal / 8;
 	hsyncend = mode->hsync_end / 8;
 	hsyncstart = mode->hsync_start / 8;
@@ -264,6 +273,7 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 		hdr = 0xc5;
 		break;
 	default:
+		drm_dev_exit(idx);
 		return -1;
 	}
 
@@ -292,6 +302,8 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 
 	/* Unblank (needed on S3 resume, vgabios doesn't do it then) */
 	outb(0x20, 0x3c0);
+
+	drm_dev_exit(idx);
 	return 0;
 }
 
@@ -300,10 +312,16 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 {
 	struct cirrus_device *cirrus = fb->dev->dev_private;
 	void *vmap;
+	int idx, ret;
 
+	ret = -ENODEV;
+	if (!drm_dev_enter(&cirrus->dev, &idx))
+		goto out;
+
+	ret = -ENOMEM;
 	vmap = drm_gem_shmem_vmap(fb->obj[0]);
 	if (!vmap)
-		return -ENOMEM;
+		goto out_dev_exit;
 
 	if (cirrus->cpp == fb->format->cpp[0])
 		drm_fb_memcpy_dstclip(cirrus->vram,
@@ -323,7 +341,12 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 		WARN_ON_ONCE("cpp mismatch");
 
 	drm_gem_shmem_vunmap(fb->obj[0], vmap);
-	return 0;
+	ret = 0;
+
+out_dev_exit:
+	drm_dev_exit(idx);
+out:
+	return ret;
 }
 
 static int cirrus_fb_blit_fullscreen(struct drm_framebuffer *fb)
@@ -502,6 +525,14 @@ static void cirrus_mode_config_init(struct cirrus_device *cirrus)
 
 /* ------------------------------------------------------------------ */
 
+static void cirrus_release(struct drm_device *dev)
+{
+	struct cirrus_device *cirrus = dev->dev_private;
+
+	drm_mode_config_cleanup(dev);
+	kfree(cirrus);
+}
+
 DEFINE_DRM_GEM_FOPS(cirrus_fops);
 
 static struct drm_driver cirrus_driver = {
@@ -515,6 +546,7 @@ static struct drm_driver cirrus_driver = {
 
 	.fops		 = &cirrus_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
+	.release         = cirrus_release,
 };
 
 static int cirrus_pci_probe(struct pci_dev *pdev,
@@ -598,12 +630,11 @@ static void cirrus_pci_remove(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 	struct cirrus_device *cirrus = dev->dev_private;
 
-	drm_dev_unregister(dev);
-	drm_mode_config_cleanup(dev);
+	drm_dev_unplug(dev);
+	drm_atomic_helper_shutdown(dev);
 	iounmap(cirrus->mmio);
 	iounmap(cirrus->vram);
 	drm_dev_put(dev);
-	kfree(cirrus);
 	pci_release_regions(pdev);
 }
 
-- 
2.18.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
