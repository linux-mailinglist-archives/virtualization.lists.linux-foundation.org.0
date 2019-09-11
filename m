Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C917B036B
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 20:14:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7C689E8C;
	Wed, 11 Sep 2019 18:14:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0B39EE8C
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 18:14:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B2ADE81A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 18:14:12 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id b10so10548817plr.4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 11:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=L9IbDqUTGBygNy+oR2XxFsB0ml5gSNHNj1uTpRYIros=;
	b=MhC7MN/apPQSoFA8X1UHoVchEHf+GZPkz3MgJqtM2HORK887vTnLMk7NLBjfOXS+VN
	sKTuF7MuJbbC6Oxd3wYiwhBVVhjsvZB+aIaJp2v5itq3fmCByv2MaptiY/SQkI00Q8Pa
	fBeFLKUkPcVMdadxPYSsrybRpDuaP6qLeH7/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=L9IbDqUTGBygNy+oR2XxFsB0ml5gSNHNj1uTpRYIros=;
	b=c850LJtjfu9ECNhLCu6i9tEvQGvluwwU2fZXENEMvgZOvOkKd8Jg/GihwuebXYYzrD
	Fo65Neap2zntaJnuyZAD/epytexJlwNjcG9At1vXKt9tulH0ILfFbI5X7qc+8FkSYB0g
	3kRBtpX71JxK9uSm0t5X32u1X9BKRukdtDSzJ1OJBxhmwHOoUFoDlkaAtfDXc99etAH7
	aSNc4UMO2QLnbwJhQ6pLdc4S2XM1TMDi1RIt1uumadSym/VS4Anz/oq1Gd3m12mHrVYq
	v+KdJ/PPsBEPGogqVSQrZY3B+xJDPAUSDXDktVYlBbJZfiJrYBw+CCOEj35zjDe7uhfS
	5L1A==
X-Gm-Message-State: APjAAAXsU2UQ8p5VIMkS4AvPQDJ1eT0zsWLGa1mT9FqygENkCBxfmvdG
	KEM6vcNqBmw8l2F89PxDvX3Zxg==
X-Google-Smtp-Source: APXvYqwrk8BaEtJFsri5kEZloNqGAXR5GggYYG0Cm6osA9TNijyLnXfzXL/Z4rcUfYAySwW+8Rlo8A==
X-Received: by 2002:a17:902:5ac3:: with SMTP id
	g3mr40522769plm.25.1568225652289; 
	Wed, 11 Sep 2019 11:14:12 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id
	s18sm29288578pfh.0.2019.09.11.11.14.11
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Sep 2019 11:14:11 -0700 (PDT)
From: David Riley <davidriley@chromium.org>
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH v4 1/2] drm/virtio: Rewrite virtio_gpu_queue_ctrl_buffer using
	fenced version.
Date: Wed, 11 Sep 2019 11:14:02 -0700
Message-Id: <20190911181403.40909-2-davidriley@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190829212417.257397-1-davidriley@chromium.org>
References: <20190829212417.257397-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>
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

Factor function in preparation to generating scatterlist prior to locking.

Signed-off-by: David Riley <davidriley@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 7fd2851f7b97..5a64c776138d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -302,18 +302,6 @@ static bool virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
 	return notify;
 }
 
-static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
-					 struct virtio_gpu_vbuffer *vbuf)
-{
-	bool notify;
-
-	spin_lock(&vgdev->ctrlq.qlock);
-	notify = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
-	spin_unlock(&vgdev->ctrlq.qlock);
-	if (notify)
-		virtqueue_notify(vgdev->ctrlq.vq);
-}
-
 static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 						struct virtio_gpu_vbuffer *vbuf,
 						struct virtio_gpu_ctrl_hdr *hdr,
@@ -339,7 +327,7 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 		goto again;
 	}
 
-	if (fence) {
+	if (hdr && fence) {
 		virtio_gpu_fence_emit(vgdev, hdr, fence);
 		if (vbuf->objs) {
 			virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
@@ -352,6 +340,12 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 		virtqueue_notify(vgdev->ctrlq.vq);
 }
 
+static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
+					 struct virtio_gpu_vbuffer *vbuf)
+{
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, NULL, NULL);
+}
+
 static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_vbuffer *vbuf)
 {
-- 
2.23.0.162.g0b9fbb3734-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
