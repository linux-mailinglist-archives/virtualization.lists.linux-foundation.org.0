Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EB344D9C4
	for <lists.virtualization@lfdr.de>; Thu, 11 Nov 2021 17:04:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D416068B;
	Thu, 11 Nov 2021 16:04:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O7lVRn1HsUB2; Thu, 11 Nov 2021 16:04:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CADBD60751;
	Thu, 11 Nov 2021 16:04:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57252C0036;
	Thu, 11 Nov 2021 16:04:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D33EC001E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 16:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B6AB4050B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 16:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=axis.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8kwo1wTJGvl4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 16:04:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8755403EF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 16:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1636646660;
 x=1668182660; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ewH1kGjLHxx6u24wLlQZv3p2b5h5AfAa9KIwPCRDzk=;
 b=NVW+rjAhNQ/eg3G24Twp89sQbxHJmR6F3RHOKfPB7Pv39lY6nURQz33m
 qpR6TqjmLgRv1x0lTYVDzbe0QOugkxP9NL0M3VLoDJWghUlPIXFT9hBIs
 4+aso1ZnAaesnOm/fe1eyiQDyNoALHN5XwR2c6sMEfWyQNp19fyw6uSom
 80Y3aJMEnvCKnOmWEiACdAkLFBgfJ0IzfMoCxyFdEZiUb0e7oxY9FHICr
 oWBAK4MXbj/5kHeupykf5b5SYKARRAXYLnfZjIsKpsOO0Aw2voLCdEuCc
 ECS9mkbac34QCGMVRs5na33MdKXPgK0VkMdfdy6mIX72kyFKtONqu1G7c Q==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <wsa@kernel.org>, <jie.deng@intel.com>, <viresh.kumar@linaro.org>
Subject: [PATCH v2 2/2] i2c: virtio: fix completion handling
Date: Thu, 11 Nov 2021 17:04:12 +0100
Message-ID: <20211111160412.11980-3-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211111160412.11980-1-vincent.whitchurch@axis.com>
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Cc: mst@redhat.com, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 kernel@axis.com, linux-i2c@vger.kernel.org, conghui.chen@intel.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

The driver currently assumes that the notify callback is only received
when the device is done with all the queued buffers.

However, this is not true, since the notify callback could be called
without any of the queued buffers being completed (for example, with
virtio-pci and shared interrupts) or with only some of the buffers being
completed (since the driver makes them available to the device in
multiple separate virtqueue_add_sgs() calls).

This can lead to incorrect data on the I2C bus or memory corruption in
the guest if the device operates on buffers which are have been freed by
the driver.  (The WARN_ON in the driver is also triggered.)

 BUG kmalloc-128 (Tainted: G        W        ): Poison overwritten
 First byte 0x0 instead of 0x6b
 Allocated in i2cdev_ioctl_rdwr+0x9d/0x1de age=243 cpu=0 pid=28
 	memdup_user+0x2e/0xbd
 	i2cdev_ioctl_rdwr+0x9d/0x1de
 	i2cdev_ioctl+0x247/0x2ed
 	vfs_ioctl+0x21/0x30
 	sys_ioctl+0xb18/0xb41
 Freed in i2cdev_ioctl_rdwr+0x1bb/0x1de age=68 cpu=0 pid=28
 	kfree+0x1bd/0x1cc
 	i2cdev_ioctl_rdwr+0x1bb/0x1de
 	i2cdev_ioctl+0x247/0x2ed
 	vfs_ioctl+0x21/0x30
 	sys_ioctl+0xb18/0xb41

Fix this by calling virtio_get_buf() from the notify handler like other
virtio drivers and by actually waiting for all the buffers to be
completed.

Fixes: 3cfc88380413d20f ("i2c: virtio: add a virtio i2c frontend driver")
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/i2c/busses/i2c-virtio.c | 34 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
index 7b2474e6876f..2d3ae8e238ec 100644
--- a/drivers/i2c/busses/i2c-virtio.c
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -22,24 +22,24 @@
 /**
  * struct virtio_i2c - virtio I2C data
  * @vdev: virtio device for this controller
- * @completion: completion of virtio I2C message
  * @adap: I2C adapter for this controller
  * @vq: the virtio virtqueue for communication
  */
 struct virtio_i2c {
 	struct virtio_device *vdev;
-	struct completion completion;
 	struct i2c_adapter adap;
 	struct virtqueue *vq;
 };
 
 /**
  * struct virtio_i2c_req - the virtio I2C request structure
+ * @completion: completion of virtio I2C message
  * @out_hdr: the OUT header of the virtio I2C message
  * @buf: the buffer into which data is read, or from which it's written
  * @in_hdr: the IN header of the virtio I2C message
  */
 struct virtio_i2c_req {
+	struct completion completion;
 	struct virtio_i2c_out_hdr out_hdr	____cacheline_aligned;
 	uint8_t *buf				____cacheline_aligned;
 	struct virtio_i2c_in_hdr in_hdr		____cacheline_aligned;
@@ -47,9 +47,11 @@ struct virtio_i2c_req {
 
 static void virtio_i2c_msg_done(struct virtqueue *vq)
 {
-	struct virtio_i2c *vi = vq->vdev->priv;
+	struct virtio_i2c_req *req;
+	unsigned int len;
 
-	complete(&vi->completion);
+	while ((req = virtqueue_get_buf(vq, &len)))
+		complete(&req->completion);
 }
 
 static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
@@ -69,6 +71,8 @@ static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
 		if (!msgs[i].len)
 			break;
 
+		init_completion(&reqs[i].completion);
+
 		/*
 		 * Only 7-bit mode supported for this moment. For the address
 		 * format, Please check the Virtio I2C Specification.
@@ -108,21 +112,13 @@ static int virtio_i2c_complete_reqs(struct virtqueue *vq,
 				    struct virtio_i2c_req *reqs,
 				    struct i2c_msg *msgs, int num)
 {
-	struct virtio_i2c_req *req;
 	bool failed = false;
-	unsigned int len;
 	int i, j = 0;
 
 	for (i = 0; i < num; i++) {
-		/* Detach the ith request from the vq */
-		req = virtqueue_get_buf(vq, &len);
+		struct virtio_i2c_req *req = &reqs[i];
 
-		/*
-		 * Condition req == &reqs[i] should always meet since we have
-		 * total num requests in the vq. reqs[i] can never be NULL here.
-		 */
-		if (!failed && (WARN_ON(req != &reqs[i]) ||
-				req->in_hdr.status != VIRTIO_I2C_MSG_OK))
+		if (!failed && req->in_hdr.status != VIRTIO_I2C_MSG_OK)
 			failed = true;
 
 		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
@@ -158,11 +154,13 @@ static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	 * remote here to clear the virtqueue, so we can try another set of
 	 * messages later on.
 	 */
-
-	reinit_completion(&vi->completion);
 	virtqueue_kick(vq);
 
-	wait_for_completion(&vi->completion);
+	/*
+	 * We only need to wait for the last one since the device is required
+	 * to complete requests in order.
+	 */
+	wait_for_completion(&reqs[count - 1].completion);
 
 	count = virtio_i2c_complete_reqs(vq, reqs, msgs, count);
 
@@ -211,8 +209,6 @@ static int virtio_i2c_probe(struct virtio_device *vdev)
 	vdev->priv = vi;
 	vi->vdev = vdev;
 
-	init_completion(&vi->completion);
-
 	ret = virtio_i2c_setup_vqs(vi);
 	if (ret)
 		return ret;
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
