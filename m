Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E536504E
	for <lists.virtualization@lfdr.de>; Thu, 11 Jul 2019 04:48:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CD0414B26;
	Thu, 11 Jul 2019 02:48:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7A8DE4B20
	for <virtualization@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 02:40:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 33DDF87C
	for <virtualization@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 02:40:08 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y15so2004611pfn.5
	for <virtualization@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 19:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=C8E8H/QOJPMLUX+Dl+OKCeAuU0VWHZNPc5/1qNNCS3A=;
	b=LFssXHlc4NksAYAhzFzgi8xTRTyRMliELywQFv9VUJVWjf2PiU9RiGZ3zV9OaXaJfz
	91HAomEa81By0LAwwOEB9poOe8UtZyfG9My4IBU8GlmxOBGbsRXNWGH0/bts96LbnjnA
	NGQkIli+cQ/8qTzQXXfwnhF7U17UASCTKYqTMo/zn/0sP6m9Z0jHm9AixzwV084y/nqx
	8y2vGNX0GfKDQ+2gYrulCSBkZ9ssbkmBgG1bxloiWpKTGlMfoHhs298oR6oIMlTW4bk4
	B98fphK+vEl3DSmUmjhZgVDft0yE5G+Vh5F41jeQl5ag1xxzkRi75cZkX6ek98V4UOHK
	PCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C8E8H/QOJPMLUX+Dl+OKCeAuU0VWHZNPc5/1qNNCS3A=;
	b=tYTCxR1lrpB+pUN05FLqPWRzRuJ0S0Z3H42jQcG3/oCkXJiMu95GQUhRX4dDPyAtaN
	9zxMtWYrH1QHCR85kf67XpQPtaA16TeFZzjIX5uwvxoVBJdb6hFcPx1x9tBwlJ61kFxD
	+xLwvn7ieT646nM4m6hShM4C1zCwiNSCEaqbfPZxgkzcem8EMq1L6G0NILgJiEAYjEOU
	0W22Za8GQ+2fUUjcka1fOVBdEmMlN0q0q9uEeVff844xS44pj+CnH0qb2nRqixYwQwLS
	+RgrN9XTqFRX4fkLs4lUpsGuNdqt+nvgjhG1v1WNSo3ZhVDUWEeykx0c6cfFpwAJn8SK
	l1ag==
X-Gm-Message-State: APjAAAVolpNwLUrSJD0mbXI0h+7gjQ1JxdZPMun13JOebFFucWyVvFhB
	x0SUu5HCvSkLZkkXn/1mX3s=
X-Google-Smtp-Source: APXvYqxPMPQEVTxxbc9UReUqfnmxUCvYxChCFWNedtCSJGKTOwJRfV39HBtupRw4ZTPjT4QYQz/DMQ==
X-Received: by 2002:a63:7b4d:: with SMTP id k13mr1686080pgn.182.1562812807406; 
	Wed, 10 Jul 2019 19:40:07 -0700 (PDT)
Received: from olv0.mtv.corp.google.com
	([2620:15c:202:201:9649:82d6:f889:b307])
	by smtp.gmail.com with ESMTPSA id
	bo20sm2877077pjb.23.2019.07.10.19.40.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Jul 2019 19:40:06 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: kick vq outside of the vq lock
Date: Wed, 10 Jul 2019 19:39:59 -0700
Message-Id: <20190711023959.170158-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190711022937.166015-1-olvaffe@gmail.com>
References: <20190711022937.166015-1-olvaffe@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
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

Replace virtqueue_kick by virtqueue_kick_prepare, which requires
serialization, and virtqueue_notify, which does not.  Repurpose the
return values to indicate whether the vq should be notified.

This fixes a bad spinlock contention when the host is qemu.  When
the guest calls virtqueue_notify, the qemu vcpu thread exits the
guest and waits for the qemu iothread to perform the MMIO.  If the
qemu iothread is still processing the prior buffer, and if the prior
buffer is cheap to GPU, the iothread will go ahead and generate an
IRQ.  A worker thread in the guest might start running
virtio_gpu_dequeue_ctrl_func.  If virtqueue_notify was called with
the vq lock held, the worker thread would have to busy wait inside
virtio_gpu_dequeue_ctrl_func.

v2: fix scrambled commit message

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 6c1a90717535..e96f88fe5c83 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -291,11 +291,9 @@ static int virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
 		trace_virtio_gpu_cmd_queue(vq,
 			(struct virtio_gpu_ctrl_hdr *)vbuf->buf);
 
-		virtqueue_kick(vq);
+		ret = virtqueue_kick_prepare(vq);
 	}
 
-	if (!ret)
-		ret = vq->num_free;
 	return ret;
 }
 
@@ -307,6 +305,10 @@ static int virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	spin_lock(&vgdev->ctrlq.qlock);
 	rc = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
 	spin_unlock(&vgdev->ctrlq.qlock);
+
+	if (rc > 0)
+		virtqueue_notify(vgdev->ctrlq.vq);
+
 	return rc;
 }
 
@@ -339,6 +341,10 @@ static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 		virtio_gpu_fence_emit(vgdev, hdr, fence);
 	rc = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
 	spin_unlock(&vgdev->ctrlq.qlock);
+
+	if (rc > 0)
+		virtqueue_notify(vgdev->ctrlq.vq);
+
 	return rc;
 }
 
@@ -369,13 +375,14 @@ static int virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 		trace_virtio_gpu_cmd_queue(vq,
 			(struct virtio_gpu_ctrl_hdr *)vbuf->buf);
 
-		virtqueue_kick(vq);
+		ret = virtqueue_kick_prepare(vq);
 	}
 
 	spin_unlock(&vgdev->cursorq.qlock);
 
-	if (!ret)
-		ret = vq->num_free;
+	if (ret > 0)
+		virtqueue_notify(vq);
+
 	return ret;
 }
 
-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
