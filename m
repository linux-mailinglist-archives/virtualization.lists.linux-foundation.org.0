Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8292E1BC145
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 16:30:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3709E22731;
	Tue, 28 Apr 2020 14:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tx6u8SJ11uhV; Tue, 28 Apr 2020 14:30:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B56282277A;
	Tue, 28 Apr 2020 14:30:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96EC3C0172;
	Tue, 28 Apr 2020 14:30:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61AE4C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 14:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5D00F87469
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 14:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDxulrQ165tS
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 14:30:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 222368745D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588084220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LJYJOxQhIE1fE/bXXB2iJgsNhh+MEvSLEyy2mGQqHm4=;
 b=IYzh5KIYzjqKcO90s0hJ3ODb8ylnzYGiop+X6MqmuagioX/HB5myXRWMm4HgcG5G4dfEq+
 74qexznDIZZCRLd8x3ABZp4FDy6+1ifAGO+PfwYWZDipiUJG/Nyyg7qfaRsPH9jNi9MGig
 TzcKfdCmRk/Zw0rZYphUr3hyoW5chhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-YWug8AwhN2qI8cWogNqfqg-1; Tue, 28 Apr 2020 10:30:17 -0400
X-MC-Unique: YWug8AwhN2qI8cWogNqfqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 277D81005510;
 Tue, 28 Apr 2020 14:30:16 +0000 (UTC)
Received: from localhost (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 319AB60CD3;
 Tue, 28 Apr 2020 14:30:09 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v2] virtio-blk: handle block_device_operations callbacks after
 hot unplug
Date: Tue, 28 Apr 2020 15:30:09 +0100
Message-Id: <20200428143009.107645-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, Lance Digby <ldigby@redhat.com>,
 linux-block@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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

A userspace process holding a file descriptor to a virtio_blk device can
still invoke block_device_operations after hot unplug.  For example, a
program that has /dev/vdb open can call ioctl(HDIO_GETGEO) after hot
unplug to invoke virtblk_getgeo().

Introduce a reference count in struct virtio_blk so that its lifetime
covers both virtio_driver probe/remove and block_device_operations
open/release users.  This ensures that block_device_operations functions
like virtblk_getgeo() can safely access struct virtio_blk.

Add remove_mutex to prevent block_device_operations functions from
accessing vblk->vdev during virtblk_remove() and let the safely check
for !vblk->vdev after virtblk_remove() returns.

Switching to a reference count also solves the vd_index_ida leak where
vda, vdb, vdc, etc indices were lost when the device was hot unplugged
while the block device was still open.

Reported-by: Lance Digby <ldigby@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
If someone has a simpler solution please let me know.  I looked at
various approaches including reusing device_lock(&vblk->vdev.dev) but
they were more complex and extending the lifetime of virtio_device after
remove() has been called seems questionable.
---
 drivers/block/virtio_blk.c | 85 ++++++++++++++++++++++++++++++++++----
 1 file changed, 77 insertions(+), 8 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 93468b7c6701..3dd53b445cc1 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -44,6 +44,13 @@ struct virtio_blk {
 	/* Process context for config space updates */
 	struct work_struct config_work;
 
+	/*
+	 * Tracks references from block_device_operations open/release and
+	 * virtio_driver probe/remove so this object can be freed once no
+	 * longer in use.
+	 */
+	refcount_t refs;
+
 	/* What host tells us, plus 2 for header & tailer. */
 	unsigned int sg_elems;
 
@@ -53,6 +60,9 @@ struct virtio_blk {
 	/* num of vqs */
 	int num_vqs;
 	struct virtio_blk_vq *vqs;
+
+	/* Provides mutual exclusion with virtblk_remove(). */
+	struct mutex remove_mutex;
 };
 
 struct virtblk_req {
@@ -295,10 +305,54 @@ static int virtblk_get_id(struct gendisk *disk, char *id_str)
 	return err;
 }
 
+static void virtblk_get(struct virtio_blk *vblk)
+{
+	refcount_inc(&vblk->refs);
+}
+
+static void virtblk_put(struct virtio_blk *vblk)
+{
+	if (refcount_dec_and_test(&vblk->refs)) {
+		ida_simple_remove(&vd_index_ida, vblk->index);
+		mutex_destroy(&vblk->remove_mutex);
+		kfree(vblk);
+	}
+}
+
+static int virtblk_open(struct block_device *bd, fmode_t mode)
+{
+	struct virtio_blk *vblk = bd->bd_disk->private_data;
+	int ret = -ENXIO;
+
+	mutex_lock(&vblk->remove_mutex);
+
+	if (vblk->vdev) {
+		virtblk_get(vblk);
+		ret = 0;
+	}
+
+	mutex_unlock(&vblk->remove_mutex);
+	return ret;
+}
+
+static void virtblk_release(struct gendisk *disk, fmode_t mode)
+{
+	struct virtio_blk *vblk = disk->private_data;
+
+	virtblk_put(vblk);
+}
+
 /* We provide getgeo only to please some old bootloader/partitioning tools */
 static int virtblk_getgeo(struct block_device *bd, struct hd_geometry *geo)
 {
 	struct virtio_blk *vblk = bd->bd_disk->private_data;
+	int ret = -ENXIO;
+
+	mutex_lock(&vblk->remove_mutex);
+
+	if (!vblk->vdev) {
+		goto out;
+	}
 
 	/* see if the host passed in geometry config */
 	if (virtio_has_feature(vblk->vdev, VIRTIO_BLK_F_GEOMETRY)) {
@@ -314,11 +368,17 @@ static int virtblk_getgeo(struct block_device *bd, struct hd_geometry *geo)
 		geo->sectors = 1 << 5;
 		geo->cylinders = get_capacity(bd->bd_disk) >> 11;
 	}
-	return 0;
+
+	ret = 0;
+out:
+	mutex_unlock(&vblk->remove_mutex);
+	return ret;
 }
 
 static const struct block_device_operations virtblk_fops = {
 	.owner  = THIS_MODULE,
+	.open = virtblk_open,
+	.release = virtblk_release,
 	.getgeo = virtblk_getgeo,
 };
 
@@ -655,6 +715,10 @@ static int virtblk_probe(struct virtio_device *vdev)
 		goto out_free_index;
 	}
 
+	/* This reference is dropped in virtblk_remove(). */
+	refcount_set(&vblk->refs, 1);
+	mutex_init(&vblk->remove_mutex);
+
 	vblk->vdev = vdev;
 	vblk->sg_elems = sg_elems;
 
@@ -820,8 +884,12 @@ static int virtblk_probe(struct virtio_device *vdev)
 static void virtblk_remove(struct virtio_device *vdev)
 {
 	struct virtio_blk *vblk = vdev->priv;
-	int index = vblk->index;
-	int refc;
+
+	/*
+	 * Virtqueue processing is stopped safely here but mutual exclusion is
+	 * needed for block_device_operations.
+	 */
+	mutex_lock(&vblk->remove_mutex);
 
 	/* Make sure no work handler is accessing the device. */
 	flush_work(&vblk->config_work);
@@ -834,15 +902,16 @@ static void virtblk_remove(struct virtio_device *vdev)
 	/* Stop all the virtqueues. */
 	vdev->config->reset(vdev);
 
-	refc = kref_read(&disk_to_dev(vblk->disk)->kobj.kref);
+	/* Virtqueue are stopped, nothing can use vblk->vdev anymore. */
+	vblk->vdev = NULL;
+
 	put_disk(vblk->disk);
 	vdev->config->del_vqs(vdev);
 	kfree(vblk->vqs);
-	kfree(vblk);
 
-	/* Only free device id if we don't have any users */
-	if (refc == 1)
-		ida_simple_remove(&vd_index_ida, index);
+	mutex_unlock(&vblk->remove_mutex);
+
+	virtblk_put(vblk);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
