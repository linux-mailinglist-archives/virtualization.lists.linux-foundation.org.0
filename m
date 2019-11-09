Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7F0F5DE7
	for <lists.virtualization@lfdr.de>; Sat,  9 Nov 2019 08:54:37 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 052DDCD2;
	Sat,  9 Nov 2019 07:54:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D232DCA4
	for <virtualization@lists.linux-foundation.org>;
	Sat,  9 Nov 2019 07:54:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9DB20102
	for <virtualization@lists.linux-foundation.org>;
	Sat,  9 Nov 2019 07:54:28 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id ay6so5357700plb.0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 08 Nov 2019 23:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=veiAcMlIgcLHjJxd0QNhUHza9s431ffRaEJpWcEHXlA=;
	b=ZrcVhD0E25ufPrmCCfZ8MdFHm7QQe97Zw1uyYMICsTUBdeTTZku7sXrCkCp00Y8WTj
	ssQNLd0wY4j5kVeBQOlyt+J8HxJQUV2+ZycfVCAFWt7NyqBsvWB60WV5wR8rfkQ2VY2N
	0K8O05POwFRF8UJTOljz9j40NxSX5E+k/TK+lMU7/7BG+Vfszm9WfoA7Kd13lSB/6FiK
	lOOu0ERBepCRgVwSyr/vXyegHkDjSp5ve0mC23B5Ju5n21ilfXQILL7E5RNlxV5IHaoC
	y95+fHo5YQQJQAT9NgMuHZ3tNSjwcx/qcRUnusSjy3QvTQpKL3rs+v2rC60U/EZI5Ozg
	4njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=veiAcMlIgcLHjJxd0QNhUHza9s431ffRaEJpWcEHXlA=;
	b=AJ9OhO3JDysiILcNkx10xJw7T2F9b1BRkoUGdUOEpqJU7sUSMq9nDuxjrkHE+HUspr
	5TUfpVvkhY5rW0pqVyY9OvtBrJpQbYdfSwB3x6se0IGhF0nmIjxDLPkACTwEr/3Nxing
	1gMuGOM2pQHyd7nv35IbMq8TjicwSSlcinBwej4qSGKt81pHtGYZeXndj6NU4GZZIlEl
	kEX0haQhy0c3jEnTwzJRRQzdy6BXta4YdNcC+Yfheyfxpuor04RG6pLG7e8L9WPohklJ
	65knq3T32ftBkokr/wuw1NZJM7joe0Eu3XZa4/I8e8Rq/+Ns4bRpq1CuN3KVR/wgIe9p
	gGHQ==
X-Gm-Message-State: APjAAAWiE13idVWuWP/nl5DiaumZNGYZvzddIihP9RW6oaExCDnPYKyW
	JVlOAPignC9Tfggx5RSwHSM=
X-Google-Smtp-Source: APXvYqxvItN9OnqheTvov4hpS8eX99Ly+f08T42CJNk7Az9Z5y+C87MbZqWmuka9RwkjJGMYYz+pvw==
X-Received: by 2002:a17:902:6802:: with SMTP id
	h2mr14901704plk.135.1573286068169; 
	Fri, 08 Nov 2019 23:54:28 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
	by smtp.gmail.com with ESMTPSA id
	y1sm9578671pfq.138.2019.11.08.23.54.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 08 Nov 2019 23:54:27 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/virtgpu: fix double unregistration
Date: Sat,  9 Nov 2019 15:54:17 +0800
Message-Id: <20191109075417.29808-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, Chuhong Yuan <hslester96@gmail.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>
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

drm_put_dev also calls drm_dev_unregister, so dev will be unregistered
twice.
Replace it with drm_dev_put to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 0fc32fa0b3c0..fccc24e21af8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -138,7 +138,7 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
 
 	drm_dev_unregister(dev);
 	virtio_gpu_deinit(dev);
-	drm_put_dev(dev);
+	drm_dev_put(dev);
 }
 
 static void virtio_gpu_config_changed(struct virtio_device *vdev)
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
