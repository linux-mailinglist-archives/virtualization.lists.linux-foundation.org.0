Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E72926727
	for <lists.virtualization@lfdr.de>; Wed, 22 May 2019 17:48:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B8289E19;
	Wed, 22 May 2019 15:48:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 18186DDE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 22 May 2019 15:48:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0165281A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 22 May 2019 15:48:29 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d18so2877590wrs.5
	for <virtualization@lists.linux-foundation.org>;
	Wed, 22 May 2019 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9HdYLKK0O8zjOHfMRuMEVNbPOEm50SE48I5+273koG8=;
	b=ZKWtwQxWXNKG+BRGWu0z+IbLQtzSOqMDS65LRAExdT6WgmgSk84/yRn4ULVDS/nvYn
	zeFzFvXKb0+ct67BOLz9x6OjuGLDtOzNgfe3txW2K6e/snXiiKsek+S7QhBzUcQQnQ8O
	RQOMS0QZlsiSZdzpkEk6/6QddP96yQQ6jQEu9YdqpSprULL4ZQ9n0yAh6PeF+f30kG/4
	Mh99tBtzUACFKmWwjgk8c2g4qm6LqjpQJV/w7r+Z/rXtodHz5TvGZYbjjk9KAR/T8hta
	b0VdINsz9acDZpqI2PSVc+7kGLiusRW+DqYAV15H//0/vi97x2x/Q+duNWQTPLoBqSvD
	xXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9HdYLKK0O8zjOHfMRuMEVNbPOEm50SE48I5+273koG8=;
	b=BGdX4qP/CWB6aXMQUNgoVOyFdPu3WQ2YDxF9bt6naKx4J5S6+poHCZGmEGp35+W0Wk
	QnslzljPPo0aoW8H5S4V8ArFqtRVtKZDPQL7FruCER5AE+GSx0tFUWz06BxU9QdGHnYx
	MGHgwdugJgkAxN4eQuJTC23u/gora8q/4ItwPslDcnq/w3tJK/XeyV3lmVZUSqGNZ588
	pHNl3epbNzMPSmZe/A+IRwuqfFYDLviX6cf7k4fdfs8CcbRDSIUWMB7nV4MYs57LK1S8
	jVWT9/Fb4UAqxuBQIh5iAJSNJU3dkD1MYMfZZQgzfjmQA5ejRluOMnjzxsTse6vcbbuY
	4ZQw==
X-Gm-Message-State: APjAAAVi/bA50Ibf/WDFtfQGvxwGW2TZcPpgIeQTLJuKoumYGRLo9bPL
	vBVmZjKuua/s/ls8V6e31B4=
X-Google-Smtp-Source: APXvYqx+GEqSOJqjBnC9BXRRYx6UPpWcOzmT01LzSkVy5hVoMVJDeCL9b2emaAiGhtMaZis22UyUkg==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr3385668wrm.98.1558540108661; 
	Wed, 22 May 2019 08:48:28 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
	([2a00:5f00:102:0:9665:9cff:feee:aa4d])
	by smtp.gmail.com with ESMTPSA id
	t6sm12567117wmt.34.2019.05.22.08.48.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 08:48:28 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/virtio: remove irrelevant DRM_UNLOCKED flag
Date: Wed, 22 May 2019 16:47:00 +0100
Message-Id: <20190522154702.16269-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522154702.16269-1-emil.l.velikov@gmail.com>
References: <20190522154702.16269-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	UPPERCASE_50_75 autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, kernel@collabora.com,
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

DRM_UNLOCKED doesn't do anything for non-legacy drivers. Remove it.

Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 949a264985fc..b7f9dfe61d1c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -553,34 +553,34 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 
 struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 	DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_AUTH | DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_EXECBUFFER, virtio_gpu_execbuffer_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_AUTH | DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_GETPARAM, virtio_gpu_getparam_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_AUTH | DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_CREATE,
 			  virtio_gpu_resource_create_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_AUTH | DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_INFO, virtio_gpu_resource_info_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_AUTH | DRM_RENDER_ALLOW),
 
 	/* make transfer async to the main ring? - no sure, can we
 	 * thread these in the underlying GL
 	 */
 	DRM_IOCTL_DEF_DRV(VIRTGPU_TRANSFER_FROM_HOST,
 			  virtio_gpu_transfer_from_host_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_AUTH | DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(VIRTGPU_TRANSFER_TO_HOST,
 			  virtio_gpu_transfer_to_host_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_AUTH | DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_WAIT, virtio_gpu_wait_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_AUTH | DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_GET_CAPS, virtio_gpu_get_caps_ioctl,
-			  DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
+			  DRM_AUTH | DRM_RENDER_ALLOW),
 };
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
