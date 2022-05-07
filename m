Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1DF51E522
	for <lists.virtualization@lfdr.de>; Sat,  7 May 2022 09:20:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFAFB415F5;
	Sat,  7 May 2022 07:20:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_lLoF5aPAAp; Sat,  7 May 2022 07:20:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 66E9741695;
	Sat,  7 May 2022 07:20:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD311C0081;
	Sat,  7 May 2022 07:20:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08CF2C002D
 for <virtualization@lists.linux-foundation.org>;
 Sat,  7 May 2022 07:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05E3460E07
 for <virtualization@lists.linux-foundation.org>;
 Sat,  7 May 2022 07:20:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OCg_a6BGgJyy
 for <virtualization@lists.linux-foundation.org>;
 Sat,  7 May 2022 07:20:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4580460E05
 for <virtualization@lists.linux-foundation.org>;
 Sat,  7 May 2022 07:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651908046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDgaAf3/oNUdYP8g35CyI/0NY/4N1F9pVHY/Ce1UtT8=;
 b=grHvqdouSiAKFNBfK0zqEm+g5Ne9mqlBvv96E+Qqy6acnfKwCe8WAwiuZmlf0dmNkqMbkS
 ONn7BZ02qaaU31fz+swk5QdY4Y4jKme28Qox/NlDeuIPRKxWeq+zZ4oBaed7X7oEJpzUwX
 0kit+n4VEwuZewVaZSfB+sH/orisFD4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-IaJ3OGDGOEak0lwLiNNFQA-1; Sat, 07 May 2022 03:20:42 -0400
X-MC-Unique: IaJ3OGDGOEak0lwLiNNFQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DEF6801210;
 Sat,  7 May 2022 07:20:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-216.pek2.redhat.com
 [10.72.13.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57D6240D2971;
 Sat,  7 May 2022 07:20:36 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: jasowang@redhat.com, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH V4 6/9] virtio-ccw: implement synchronize_cbs()
Date: Sat,  7 May 2022 15:19:51 +0800
Message-Id: <20220507071954.14455-7-jasowang@redhat.com>
In-Reply-To: <20220507071954.14455-1-jasowang@redhat.com>
References: <20220507071954.14455-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Cc: lulu@redhat.com, paulmck@kernel.org, peterz@infradead.org, maz@kernel.org,
 cohuck@redhat.com, pasic@linux.ibm.com, eperezma@redhat.com,
 tglx@linutronix.de
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

This patch tries to implement the synchronize_cbs() for ccw. For the
vring_interrupt() that is called via virtio_airq_handler(), the
synchronization is simply done via the airq_info's lock. For the
vring_interrupt() that is called via virtio_ccw_int_handler(), a per
device spinlock for irq is introduced ans used in the synchronization
method.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/s390/virtio/virtio_ccw.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index d35e7a3f7067..001e1f0e6037 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -62,6 +62,7 @@ struct virtio_ccw_device {
 	unsigned int revision; /* Transport revision */
 	wait_queue_head_t wait_q;
 	spinlock_t lock;
+	rwlock_t irq_lock;
 	struct mutex io_lock; /* Serializes I/O requests */
 	struct list_head virtqueues;
 	bool is_thinint;
@@ -984,6 +985,27 @@ static const char *virtio_ccw_bus_name(struct virtio_device *vdev)
 	return dev_name(&vcdev->cdev->dev);
 }
 
+static void virtio_ccw_synchronize_cbs(struct virtio_device *vdev)
+{
+	struct virtio_ccw_device *vcdev = to_vc_device(vdev);
+	struct airq_info *info = vcdev->airq_info;
+
+	if (info) {
+		/*
+		 * Synchronize with the vring_interrupt() with airq indicator
+		 */
+		write_lock(&info->lock);
+		write_unlock(&info->lock);
+	} else {
+		/*
+		 * Synchronize with the vring_interrupt() called by
+		 * virtio_ccw_int_handler().
+		 */
+		write_lock(&vcdev->irq_lock);
+		write_unlock(&vcdev->irq_lock);
+	}
+}
+
 static const struct virtio_config_ops virtio_ccw_config_ops = {
 	.get_features = virtio_ccw_get_features,
 	.finalize_features = virtio_ccw_finalize_features,
@@ -995,6 +1017,7 @@ static const struct virtio_config_ops virtio_ccw_config_ops = {
 	.find_vqs = virtio_ccw_find_vqs,
 	.del_vqs = virtio_ccw_del_vqs,
 	.bus_name = virtio_ccw_bus_name,
+	.synchronize_cbs = virtio_ccw_synchronize_cbs,
 };
 
 
@@ -1079,6 +1102,7 @@ static void virtio_ccw_int_handler(struct ccw_device *cdev,
 {
 	__u32 activity = intparm & VIRTIO_CCW_INTPARM_MASK;
 	struct virtio_ccw_device *vcdev = dev_get_drvdata(&cdev->dev);
+	unsigned long flags;
 	int i;
 	struct virtqueue *vq;
 
@@ -1106,6 +1130,7 @@ static void virtio_ccw_int_handler(struct ccw_device *cdev,
 			vcdev->err = -EIO;
 	}
 	virtio_ccw_check_activity(vcdev, activity);
+	read_lock_irqsave(&vcdev->irq_lock, flags);
 	for_each_set_bit(i, indicators(vcdev),
 			 sizeof(*indicators(vcdev)) * BITS_PER_BYTE) {
 		/* The bit clear must happen before the vring kick. */
@@ -1114,6 +1139,7 @@ static void virtio_ccw_int_handler(struct ccw_device *cdev,
 		vq = virtio_ccw_vq_by_ind(vcdev, i);
 		vring_interrupt(0, vq);
 	}
+	read_unlock_irqrestore(&vcdev->irq_lock, flags);
 	if (test_bit(0, indicators2(vcdev))) {
 		virtio_config_changed(&vcdev->vdev);
 		clear_bit(0, indicators2(vcdev));
@@ -1284,6 +1310,7 @@ static int virtio_ccw_online(struct ccw_device *cdev)
 	init_waitqueue_head(&vcdev->wait_q);
 	INIT_LIST_HEAD(&vcdev->virtqueues);
 	spin_lock_init(&vcdev->lock);
+	rwlock_init(&vcdev->irq_lock);
 	mutex_init(&vcdev->io_lock);
 
 	spin_lock_irqsave(get_ccwdev_lock(cdev), flags);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
