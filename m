Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F27C82B000
	for <lists.virtualization@lfdr.de>; Mon, 27 May 2019 10:19:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B114E15AF;
	Mon, 27 May 2019 08:19:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A5C4215AF
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:19:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DB0D77D2
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:19:26 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 15so14853596wmg.5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 01:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bGo+wmfdMFNtr1n5PzMjqu4298v/kiu+NsJd7STGsfY=;
	b=DEgdxNrKgBZYo//4TQnq9pRScePESu2k3EUK0vCL8OX9uFkHxxyLMmFWVrm5bp+dMw
	O1id/TRhkXrvWY9eieCmsrcQkuIuxx5KtNLxBUb4Efgm9x1UJPxxg1eldOHI/FD862L/
	x5fnlCAsHz67w8TCF7oh/AL0cTIrGSTkvu/yuOJwoHQC0wfaiSTQ1vgGOFXt5/DJTaoD
	C+p5teDn921KesiinoYqauVHXG3ehpt6KyMDd6vAU6LzXM9Hot1nNAGq6lgdyBEPSPbn
	par945U0E6VLbpvKpdDSmg4HckQbpRd+ailTV0zvlVSkVTPqk5aN2rGz0zKrg5VNPfbs
	BZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bGo+wmfdMFNtr1n5PzMjqu4298v/kiu+NsJd7STGsfY=;
	b=fpy5D+DT3wbcLiFmbUFRqunUK5J336y5Da2ERnzz8BWQbFWvTT3wExS3xORzhh/x7c
	pSA5tSi4scNw+8IZaE6aj8lBoF4rA5YC/iyOXGAXtvLgrO5MZvqJxW/XxRxrMeE/relk
	cN6o39yGcSS51XMFTh8fUcABb8sr/WYfKYJCrXaiLvsh1Gp9x9ssmBFKWbcQ346/+1R+
	cBEV1DethUBctJFCUCNQJbodEXT5Y7dtM2+d3P7sMD6JZhL4n73sMHA2vgbgwN5GgAl3
	TNpz9rXDJfvSIBGeqDoteaFOkzzzCkSIv81JGkik6PEOfPTvDi7B/qF7fTEXOU+rmziz
	bqbQ==
X-Gm-Message-State: APjAAAVar6l0hMoPgrtCtUkioCzTeCqQOx8RBsgVqdIRCGAa5mkdYu9h
	srx/3Bi/hNnxxzGKE1t/Myo=
X-Google-Smtp-Source: APXvYqyZVD1u2Fprbi2Z46JCYije7AL8+ij7toiPDQdPSpMZTCv+CcxCCjDpsyk8zbY545OC02G0Vg==
X-Received: by 2002:a05:600c:114f:: with SMTP id
	z15mr9265708wmz.104.1558945165520; 
	Mon, 27 May 2019 01:19:25 -0700 (PDT)
Received: from localhost.localdomain
	(cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
	by smtp.gmail.com with ESMTPSA id
	a124sm7511876wmh.3.2019.05.27.01.19.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 01:19:25 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/13] drm/virtio: drop DRM_AUTH usage from the driver
Date: Mon, 27 May 2019 09:17:40 +0100
Message-Id: <20190527081741.14235-12-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527081741.14235-1-emil.l.velikov@gmail.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com,
	Daniel Vetter <daniel@ffwll.ch>, virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

From: Emil Velikov <emil.velikov@collabora.com>

The authentication can be circumvented, by design, by using the render
node.

From the driver POV there is no distinction between primary and render
nodes, thus we can drop the token.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 949a264985fc..e72626faba52 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -553,34 +553,34 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 
 struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 	DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_EXECBUFFER, virtio_gpu_execbuffer_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_GETPARAM, virtio_gpu_getparam_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_CREATE,
 			  virtio_gpu_resource_create_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_INFO, virtio_gpu_resource_info_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
 
 	/* make transfer async to the main ring? - no sure, can we
 	 * thread these in the underlying GL
 	 */
 	DRM_IOCTL_DEF_DRV(VIRTGPU_TRANSFER_FROM_HOST,
 			  virtio_gpu_transfer_from_host_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(VIRTGPU_TRANSFER_TO_HOST,
 			  virtio_gpu_transfer_to_host_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_WAIT, virtio_gpu_wait_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_GET_CAPS, virtio_gpu_get_caps_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_UNLOCKED | DRM_RENDER_ALLOW),
 };
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
