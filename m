Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA61398183
	for <lists.virtualization@lfdr.de>; Wed,  2 Jun 2021 08:54:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34F92402BE;
	Wed,  2 Jun 2021 06:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BqaWmH34MH4C; Wed,  2 Jun 2021 06:54:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id A232F40249;
	Wed,  2 Jun 2021 06:54:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87E3DC0001;
	Wed,  2 Jun 2021 06:54:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A925C0024
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36A9E82CEA
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vd1zFkuZaPPc
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:54:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97C7182BF5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9pvQ9WWixoN79V+IFrwZ0yGtfnJdYnRvQElOajEUx4E=; b=gnk1MFf6oC2iDvM0lQExGF55IT
 Fu4WEOCNNJ9mVEtVcIDrtrwvLS92XEx/Y9jJNPlMZzP3mxVH717a4VCLxOLSslRLKspq6OAA9D5yw
 EQDkVL09aPuAvCsSUDM3ZFzSxHOeCU6gBkEfhYQCCehrU9uW68j9GkCyo7Ds0V43zhcXAh05TNWGS
 LhXZW/q9HT26Y7QKqOeqywIxRBtkOI49AYNNeXwG3akyX15CxDIe0h/fq/1eJkZhMao+G/fiRrulm
 dyrb+u0WyEaL8vr4wMg0Ys8BKcowBJnF+Zn2V2osWkSUWM27u+JhH6YkPr+2yh9LuvxLx7wgsnTfO
 l9Bduvjw==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKlW-0025KS-9M; Wed, 02 Jun 2021 06:54:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 04/30] virtio-blk: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:19 +0300
Message-Id: <20210602065345.355274-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Justin Sanders <justin@coraid.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mike Snitzer <snitzer@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jack Wang <jinpu.wang@ionos.com>,
 Tim Waugh <tim@cyberelk.net>, linux-s390@vger.kernel.org,
 Alex Dubov <oakad@yahoo.com>, Richard Weinberger <richard@nod.at>,
 Christian Borntraeger <borntraeger@de.ibm.com>, xen-devel@lists.xenproject.org,
 Ilya Dryomov <idryomov@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Heiko Carstens <hca@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
 Denis Efremov <efremov@linux.com>, nbd@other.debian.org,
 linux-block@vger.kernel.org, ceph-devel@vger.kernel.org,
 Maxim Levitsky <maximlevitsky@gmail.com>, Geoff Levand <geoff@infradead.org>,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
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

Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/virtio_blk.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index b9fa3ef5b57c..e4bd3b1fc3c2 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -749,13 +749,6 @@ static int virtblk_probe(struct virtio_device *vdev)
 	if (err)
 		goto out_free_vblk;
 
-	/* FIXME: How many partitions?  How long is a piece of string? */
-	vblk->disk = alloc_disk(1 << PART_BITS);
-	if (!vblk->disk) {
-		err = -ENOMEM;
-		goto out_free_vq;
-	}
-
 	/* Default queue sizing is to fill the ring. */
 	if (likely(!virtblk_queue_depth)) {
 		queue_depth = vblk->vqs[0].vq->num_free;
@@ -779,21 +772,20 @@ static int virtblk_probe(struct virtio_device *vdev)
 
 	err = blk_mq_alloc_tag_set(&vblk->tag_set);
 	if (err)
-		goto out_put_disk;
+		goto out_free_vq;
 
-	q = blk_mq_init_queue(&vblk->tag_set);
-	if (IS_ERR(q)) {
-		err = -ENOMEM;
+	vblk->disk = blk_mq_alloc_disk(&vblk->tag_set, vblk);
+	if (IS_ERR(vblk->disk)) {
+		err = PTR_ERR(vblk->disk);
 		goto out_free_tags;
 	}
-	vblk->disk->queue = q;
-
-	q->queuedata = vblk;
+	q = vblk->disk->queue;
 
 	virtblk_name_format("vd", index, vblk->disk->disk_name, DISK_NAME_LEN);
 
 	vblk->disk->major = major;
 	vblk->disk->first_minor = index_to_minor(index);
+	vblk->disk->minors = 1 << PART_BITS;
 	vblk->disk->private_data = vblk;
 	vblk->disk->fops = &virtblk_fops;
 	vblk->disk->flags |= GENHD_FL_EXT_DEVT;
@@ -892,8 +884,6 @@ static int virtblk_probe(struct virtio_device *vdev)
 
 out_free_tags:
 	blk_mq_free_tag_set(&vblk->tag_set);
-out_put_disk:
-	put_disk(vblk->disk);
 out_free_vq:
 	vdev->config->del_vqs(vdev);
 	kfree(vblk->vqs);
@@ -913,8 +903,7 @@ static void virtblk_remove(struct virtio_device *vdev)
 	flush_work(&vblk->config_work);
 
 	del_gendisk(vblk->disk);
-	blk_cleanup_queue(vblk->disk->queue);
-
+	blk_cleanup_disk(vblk->disk);
 	blk_mq_free_tag_set(&vblk->tag_set);
 
 	mutex_lock(&vblk->vdev_mutex);
@@ -925,7 +914,6 @@ static void virtblk_remove(struct virtio_device *vdev)
 	/* Virtqueues are stopped, nothing can use vblk->vdev anymore. */
 	vblk->vdev = NULL;
 
-	put_disk(vblk->disk);
 	vdev->config->del_vqs(vdev);
 	kfree(vblk->vqs);
 
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
