Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D9B22094E
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 11:55:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C2E558AB90;
	Wed, 15 Jul 2020 09:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1wFNIKRSpfI4; Wed, 15 Jul 2020 09:55:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 54DB88AB8A;
	Wed, 15 Jul 2020 09:55:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2585FC0733;
	Wed, 15 Jul 2020 09:55:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F509C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7EABE8AB88
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DunCUerydC2K
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:55:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EC1B58AB87
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594806934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bgMe+PJv6EbNNW+M57oHn+BOmr98gpSCFa9M9x7OmkA=;
 b=E5LQHSL2vUj/AqIoxOtlP/PXfPdkNABlIbwClFEKCnAchbPsNXJ/F+/XCJ3/aJeYvjaXqU
 hDD2l4b8sbiCysfpPG7mpUcJlhVGVxtNFbAZmaraUYTFX4k9JSB2jsP9TJmzoF5UqJgTv8
 Us5BHBiH+ZKzBnLFzrvqz4RpG5EYXFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-bKF6v7lJM_29bnIZfmmQqg-1; Wed, 15 Jul 2020 05:55:30 -0400
X-MC-Unique: bKF6v7lJM_29bnIZfmmQqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E05911083E83;
 Wed, 15 Jul 2020 09:55:28 +0000 (UTC)
Received: from starship.f32vm (unknown [10.35.206.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C98EB710A0;
 Wed, 15 Jul 2020 09:55:19 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio-blk: check host supplied logical block size
Date: Wed, 15 Jul 2020 12:55:18 +0300
Message-Id: <20200715095518.3724-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Jens Axboe <axboe@kernel.dk>, "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:VIRTIO CORE AND NET DRIVERS"
 <virtualization@lists.linux-foundation.org>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
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

Linux kernel only supports logical block sizes which are power of two,
at least 512 bytes and no more that PAGE_SIZE.

Check this instead of crashing later on.

Note that there is no need to check physical block size since it is
only a hint, and virtio-blk already only supports power of two values.

Bugzilla link: https://bugzilla.redhat.com/show_bug.cgi?id=1664619

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 drivers/block/virtio_blk.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 980df853ee497..36dda31cc4e96 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -681,6 +681,12 @@ static const struct blk_mq_ops virtio_mq_ops = {
 static unsigned int virtblk_queue_depth;
 module_param_named(queue_depth, virtblk_queue_depth, uint, 0444);
 
+
+static bool virtblk_valid_block_size(unsigned int blksize)
+{
+	return blksize >= 512 && blksize <= PAGE_SIZE && is_power_of_2(blksize);
+}
+
 static int virtblk_probe(struct virtio_device *vdev)
 {
 	struct virtio_blk *vblk;
@@ -809,9 +815,16 @@ static int virtblk_probe(struct virtio_device *vdev)
 	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
 				   struct virtio_blk_config, blk_size,
 				   &blk_size);
-	if (!err)
+	if (!err) {
+		if (!virtblk_valid_block_size(blk_size)) {
+			dev_err(&vdev->dev,
+				"%s failure: unsupported logical block size %d\n",
+				__func__, blk_size);
+			err = -EINVAL;
+			goto out_cleanup_queue;
+		}
 		blk_queue_logical_block_size(q, blk_size);
-	else
+	} else
 		blk_size = queue_logical_block_size(q);
 
 	/* Use topology information if available */
@@ -872,6 +885,9 @@ static int virtblk_probe(struct virtio_device *vdev)
 	device_add_disk(&vdev->dev, vblk->disk, virtblk_attr_groups);
 	return 0;
 
+out_cleanup_queue:
+	blk_cleanup_queue(vblk->disk->queue);
+	vblk->disk->queue = NULL;
 out_free_tags:
 	blk_mq_free_tag_set(&vblk->tag_set);
 out_put_disk:
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
