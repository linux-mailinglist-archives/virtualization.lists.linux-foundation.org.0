Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE71B1288
	for <lists.virtualization@lfdr.de>; Thu, 12 Sep 2019 18:01:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 94E74E21;
	Thu, 12 Sep 2019 16:00:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DB4C8DD2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 16:00:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 78ADC89C
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 16:00:52 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n9so13739308pgc.1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fZDNqEnv4EmFhQfK0XZBrV/jYzvQOHibAKE2NrjIUg0=;
	b=n9ZAP1ukn//d7pJMbvivuEhJH9dW8ljZ3TQSume+cAb44Ay5une9clipJXr+osOEVJ
	UmnNf68fglbomW2DPCZpTYraLXqQifTF+Ka9DIkPOtu2DnS8xS/cbfpahKe80ek4KW/F
	D1gSaIhFJjokLkMezGrZ1q7xVooMDYgUZZ6yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fZDNqEnv4EmFhQfK0XZBrV/jYzvQOHibAKE2NrjIUg0=;
	b=ClUcghbXnfVvGEkJ/Vks6HywU8393bHK7dvaN9+Px7UWyceU3rhmMMqO7UgUKFIK/m
	SWtmEePBnH2Byk64rLbOzUv4bZ9F4ZM3yXR6RY29pBS0bWMV2vpQ0ZvhG2eThaSH0Tv/
	HeWsvsccYfXZ7TxRw3goqujR6varEtxCt0/Cgc7IMxJexJHa4UnINTPlmmeUh0+QmZTq
	JKUrMZuEipTejl9sUjIgmZ0wl7bguRXC4Y5wOA7XGu+i1mYT4yMAsfAZRFABSTdwGzSR
	s836pxVKIqMZ9bH6AP0ubZIimfbwJlJFvKQr5InSjG21Xk/Iu+RVzaEpzxkA/rA9G7do
	Latw==
X-Gm-Message-State: APjAAAXXfcjBZgKYKlyXwT2aautx1MoaPZH9tg5B9qAu6WWNBQZ05oqC
	s9TzgVB25vxff/uJoYNshI7yVw==
X-Google-Smtp-Source: APXvYqw/ay5iAGudFoue/juWTHwzUaTUPAvaaep73lKG3ftykR072bfY4K+CVgDD8Hjs5ekI18e+zA==
X-Received: by 2002:a62:5583:: with SMTP id j125mr5989380pfb.257.1568304052145;
	Thu, 12 Sep 2019 09:00:52 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id
	v18sm20573654pgl.87.2019.09.12.09.00.51
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 12 Sep 2019 09:00:51 -0700 (PDT)
From: David Riley <davidriley@chromium.org>
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH] drm/virtio: Fix warning in
	virtio_gpu_queue_fenced_ctrl_buffer.
Date: Thu, 12 Sep 2019 09:00:48 -0700
Message-Id: <20190912160048.212495-1-davidriley@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org
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

Fix warning introduced with commit e1218b8c0cc1
("drm/virtio: Use vmalloc for command buffer allocations.")
from drm-misc-next.

Signed-off-by: David Riley <davidriley@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 9f9b782dd332..80176f379ad5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -358,7 +358,7 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 			sgt = vmalloc_to_sgt(vbuf->data_buf, vbuf->data_size,
 					     &outcnt);
 			if (!sgt)
-				return -ENOMEM;
+				return;
 			vout = sgt->sgl;
 		} else {
 			sg_init_one(&sg, vbuf->data_buf, vbuf->data_size);
-- 
2.23.0.162.g0b9fbb3734-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
