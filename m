Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4844565034
	for <lists.virtualization@lfdr.de>; Thu, 11 Jul 2019 04:38:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2C8754B28;
	Thu, 11 Jul 2019 02:38:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AF3EA49D8
	for <virtualization@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 02:29:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 356CADF
	for <virtualization@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 02:29:51 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id i2so2198022plt.1
	for <virtualization@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 19:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qPWrGW+mHyz/zxrmAaiQeG6b1c+y5yhmMgQ1hyiaZR0=;
	b=qBE3eLC4RA4F+HzzOw79/Ge4/+ES1SdQUKnZaGPTDpEUF8lt0KVkrqVWOAH8gpMusV
	SG2+KBYLVfOn5pgk4W6rG1t7np0qKA+oz0CdjwjzL6gSCe9eQoYjvZZIVdVUNXG+OVVr
	D5wKYCee+xGjkEvfLuvpHpwo0W0H6JMlD2Xu1zRBuyaZOZV+gR0FFXFoSMXagudf/RdK
	uuZK4pJg5lx4taqE1//t+jWtdifCnAgF6B/cKysKRztKwrbLOjmXuxE5eZ4Ls7fV6ZIr
	GJ+N2Xakvkqq0zyfzswiAJvrKiGDfMQBsRjsuQmPA+Wk9uROukpiddb2+mkaWJHCkFKL
	6PGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qPWrGW+mHyz/zxrmAaiQeG6b1c+y5yhmMgQ1hyiaZR0=;
	b=N+SI/MI4gA3bHP+u6qeno1htRNRb+Y08sxLvCiggaaYutnwMrvshf/Yi8vzYDjIafJ
	coZh6EoMeBlmPBwMoyUQgpCNOEP/gFtz7Pozei0Tl0UEYfijEPIP5ztJqN8iPfNa6kZl
	MFwTemyN+l2cEXNJ5RZJV7DM9015B2Zwjsz9eW91XaZGSjdZHfQe3Up0f5cgPkrqrpOz
	BikgXz0R5NgpX/o9/vJYWP9XK5ZKek53bo4Tcf6DRhPIFR4YZ3/pwZD4Hk6boOAp5Dv1
	2kMh/sJ3oiHRBxjYuXYQqadE5Qz/HeHBq5SOIGcG6M3AvWX7BRp+8BoO2k96v4mEXqkq
	I7qQ==
X-Gm-Message-State: APjAAAWhqtEMPoLIb2UTNnvrNWjzyp1x6DaipxXSMF+Pev1/Y4tOL4Vs
	s+zEAY+wvDL6Imprc7pPPo0=
X-Google-Smtp-Source: APXvYqxN90cLc00cYdWJNjcMcmyHeBOPnCRonXFxzLH+4vQTsAuClh9uNnBz+kEzScj2/zJk48u0Mw==
X-Received: by 2002:a17:902:2ec5:: with SMTP id
	r63mr1710517plb.21.1562812190534; 
	Wed, 10 Jul 2019 19:29:50 -0700 (PDT)
Received: from olv0.mtv.corp.google.com
	([2620:15c:202:201:9649:82d6:f889:b307])
	by smtp.gmail.com with ESMTPSA id
	x25sm1929986pfa.90.2019.07.10.19.29.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Jul 2019 19:29:49 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: kick vq outside of the vq lock
Date: Wed, 10 Jul 2019 19:29:37 -0700
Message-Id: <20190711022937.166015-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
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

This fixes a lock contention with qemu host.  When the guest calls
vibad rtqueue_notify, the qemu vcpu thread exits the guest and waits
for the qemu iothread to perform the MMIO.  If the qemu iothread is
still processing the prior buffer, and if the prior buffer is cheap
to GPU, the iothread will go ahead and generate an IRQ for the
guest.  A worker thread in the guest will call
virtio_gpu_dequeue_ctrl_func.  If virtqueue_notify was called with
the vq lock held, the worker thread would busy wait inside
virtio_gpu_dequeue_ctrl_func.

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
