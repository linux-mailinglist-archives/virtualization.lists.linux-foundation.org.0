Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 095871B5B93
	for <lists.virtualization@lfdr.de>; Thu, 23 Apr 2020 14:37:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B918B87E94;
	Thu, 23 Apr 2020 12:37:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUVW2a2K+Eaa; Thu, 23 Apr 2020 12:37:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 212AB87E93;
	Thu, 23 Apr 2020 12:37:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06B54C0175;
	Thu, 23 Apr 2020 12:37:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE39CC0175
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 12:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F12ED885B9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 12:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ObndcpSRMJw7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 12:37:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2853C8859D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 12:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587645447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+XlBFNq2TljiIz7UMQVRidAnnXkCvE8Tn9pzuRMdxJE=;
 b=KGETPAGZxzZWjKfc9ds35wzFNfCghTI9gsRYfEmHKVPhA8jEOfZz7uHGjxusjElANNaswf
 3c3QNiFUvHjai6xTFBzDYL1btpbFd5sN+V57r+j+rRo8+udZHW7We48yKnC9xgEWjhnOm4
 QiS0ZzdwwcshliVDScCzf1Er38c56+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-RqunHNMFNlqYJD41EtgEXw-1; Thu, 23 Apr 2020 08:37:26 -0400
X-MC-Unique: RqunHNMFNlqYJD41EtgEXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F0F61800D51;
 Thu, 23 Apr 2020 12:37:25 +0000 (UTC)
Received: from localhost (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FA8B5D70A;
 Thu, 23 Apr 2020 12:37:18 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH] virtio-blk: handle block_device_operations callbacks after
 hot unplug
Date: Thu, 23 Apr 2020 13:37:17 +0100
Message-Id: <20200423123717.139141-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Jens Axboe <axboe@kernel.dk>, "Michael S. Tsirkin" <mst@redhat.com>,
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

A virtio_blk block device can still be referenced after hot unplug by
userspace processes that hold the file descriptor.  In this case
virtblk_getgeo() can be invoked after virtblk_remove() was called.  For
example, a program that has /dev/vdb open can call ioctl(HDIO_GETGEO)
after hot unplug.

Fix this by clearing vblk->disk->private_data and checking that the
virtio_blk driver instance is still around in virtblk_getgeo().

Note that the virtblk_getgeo() function itself is guaranteed to remain
in memory after hot unplug because the virtio_blk module refcount is
still held while a block device reference exists.

Originally-by: Lance Digby <ldigby@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 drivers/block/virtio_blk.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 93468b7c6701..b50cdf37a6f7 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -300,6 +300,10 @@ static int virtblk_getgeo(struct block_device *bd, struct hd_geometry *geo)
 {
 	struct virtio_blk *vblk = bd->bd_disk->private_data;
 
+	/* Driver instance has been removed */
+	if (!vblk)
+		return -ENOTTY;
+
 	/* see if the host passed in geometry config */
 	if (virtio_has_feature(vblk->vdev, VIRTIO_BLK_F_GEOMETRY)) {
 		virtio_cread(vblk->vdev, struct virtio_blk_config,
@@ -835,6 +839,7 @@ static void virtblk_remove(struct virtio_device *vdev)
 	vdev->config->reset(vdev);
 
 	refc = kref_read(&disk_to_dev(vblk->disk)->kobj.kref);
+	vblk->disk->private_data = NULL;
 	put_disk(vblk->disk);
 	vdev->config->del_vqs(vdev);
 	kfree(vblk->vqs);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
