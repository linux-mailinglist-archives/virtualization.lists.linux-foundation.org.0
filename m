Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 404C8AF22A
	for <lists.virtualization@lfdr.de>; Tue, 10 Sep 2019 22:07:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 332CEC6C;
	Tue, 10 Sep 2019 20:07:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 000B9BE4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 20:07:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0C7F9832
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 20:06:59 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i1so3337741pfa.6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 13:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0QByh7nMUE4DnF1EZmnVCO0LesBewegKmGWKg2jdIyE=;
	b=nTUelCMWT/OF5pwZR9T+jGu510zTnmwud9l5EN0tgRovfWW3EYCEcVjRSwfD8F+hPw
	yAIdumgV1m7JRyUG7aabeXsBuJzUH71TonbwfImsqF5M8kj+jUqR8e83DIwTd/uGBLma
	/lCZB6Hq4zwK53E1k9KIQDRF0+VKGvwzIwlyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0QByh7nMUE4DnF1EZmnVCO0LesBewegKmGWKg2jdIyE=;
	b=jyXxg+Sg3ePBJhYwIIHmo3vQ8J6FP5zNAGQeWRq6cSNFmXIsbjnDSrYbY7B499Y8I/
	Xk/zfxQPxtJNc5DkK6JzTIS0n3oboIYE/678NO96IM6wMbYcBhYh4cCHMN6/8TXdCGM5
	TlfJNGXdgH+U2jzpFukQemZBCTAUJCMPeV12uxHT2P/8I/1AK+PlkJqqMPsAk1wJ7Joc
	39IenfuQhSzmSNX+Ed1TjIOv3IQsj+vmr95b1+xq56iz4UBqzusiVmlL2JPmX5e9XJvH
	yMhyGkDNBUddc37qZrJ0w3Zj8X5Hic9/i1vfD4qUlfM1k80hzRSnJznTxTkSTZlgqyNM
	QdbQ==
X-Gm-Message-State: APjAAAXvgXMSB1jajD6iRVLlQZgJxx+mf3ajFqduDeKdj172ctju+e88
	lg0hzzUhXzpEblrt/0DvfIjj0A==
X-Google-Smtp-Source: APXvYqwY8ZIVNVGdt/gxFNSdRhnyOwo46cUOwbhh5f13J3xXT4X/se8iTQ5/XLLxoCcy8JMm8lWmtg==
X-Received: by 2002:a63:1:: with SMTP id 1mr29256800pga.162.1568146018680;
	Tue, 10 Sep 2019 13:06:58 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id
	q20sm35751990pfg.85.2019.09.10.13.06.57
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 10 Sep 2019 13:06:58 -0700 (PDT)
From: David Riley <davidriley@chromium.org>
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH v3 1/2] drm/virtio: Rewrite virtio_gpu_queue_ctrl_buffer using
	fenced version.
Date: Tue, 10 Sep 2019 13:06:50 -0700
Message-Id: <20190910200651.118628-1-davidriley@chromium.org>
X-Mailer: git-send-email 2.23.0.162.g0b9fbb3734-goog
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
 drivers/gpu/drm/virtio/virtgpu_vq.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 981ee16e3ee9..bf5a4a50b002 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -299,17 +299,6 @@ static int virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
 	return ret;
 }
 
-static int virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
-					struct virtio_gpu_vbuffer *vbuf)
-{
-	int rc;
-
-	spin_lock(&vgdev->ctrlq.qlock);
-	rc = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
-	spin_unlock(&vgdev->ctrlq.qlock);
-	return rc;
-}
-
 static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 					       struct virtio_gpu_vbuffer *vbuf,
 					       struct virtio_gpu_ctrl_hdr *hdr,
@@ -335,13 +324,19 @@ static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 		goto again;
 	}
 
-	if (fence)
+	if (hdr && fence)
 		virtio_gpu_fence_emit(vgdev, hdr, fence);
 	rc = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
 	spin_unlock(&vgdev->ctrlq.qlock);
 	return rc;
 }
 
+static int virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
+					struct virtio_gpu_vbuffer *vbuf)
+{
+	return virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, NULL, NULL);
+}
+
 static int virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 				   struct virtio_gpu_vbuffer *vbuf)
 {
-- 
2.23.0.162.g0b9fbb3734-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
