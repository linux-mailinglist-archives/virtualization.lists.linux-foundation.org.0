Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6BD20A06B
	for <lists.virtualization@lfdr.de>; Thu, 25 Jun 2020 15:58:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 88E8A23115;
	Thu, 25 Jun 2020 13:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzExT7ZINre6; Thu, 25 Jun 2020 13:58:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 702C22326C;
	Thu, 25 Jun 2020 13:58:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52B51C016F;
	Thu, 25 Jun 2020 13:58:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 102FDC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DD0E7861D7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v75FH_OC1U1I
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3795A84E49
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593093492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HP9THfq0e57aimyJmnA5TRP+h5ylmLpPTeTOZs2TrL8=;
 b=TGA8QPs1CLc/mZaLSCExffKxwkck00FCcBzwTxgWfdbIHMbPs1JjUBcxPDW7yGLeUXLNU6
 5nyM0aTgl6hro70k9ZWq7NFbCsYxpuUPH1dTDuag6EbUg7lX/gWWTQAolpnotin37Chrad
 zGaNrRq3hcVAarw3jpngMJVcVzJRFx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-qAq2OK1TOByuX1mhSoJ6uQ-1; Thu, 25 Jun 2020 09:58:10 -0400
X-MC-Unique: qAq2OK1TOByuX1mhSoJ6uQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EBC7464;
 Thu, 25 Jun 2020 13:58:09 +0000 (UTC)
Received: from localhost (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D98C860C1D;
 Thu, 25 Jun 2020 13:58:08 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC 3/3] virtio-blk: use NUMA-aware memory allocation in probe
Date: Thu, 25 Jun 2020 14:57:52 +0100
Message-Id: <20200625135752.227293-4-stefanha@redhat.com>
In-Reply-To: <20200625135752.227293-1-stefanha@redhat.com>
References: <20200625135752.227293-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
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

Allocate frequently-accessed data structures from the NUMA node
associated with this device to avoid slow cross-NUMA node memory
accesses.

Only the following memory allocations are made NUMA-aware:

1. Called during probe. If called in the data path then hopefully we're
   executing on a CPU in the same NUMA node as the device. If the CPU is
   not in the right NUMA node then it's unclear whether forcing memory
   allocations to use the device's NUMA node will increase or decrease
   performance.

2. Memory will be frequently accessed from the data path. There is no
   need to worry about data that is not accessed from
   performance-critical code paths.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 drivers/block/virtio_blk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 9d21bf0f155e..40845e9ad3b1 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -482,6 +482,7 @@ static int init_vq(struct virtio_blk *vblk)
 	unsigned short num_vqs;
 	struct virtio_device *vdev = vblk->vdev;
 	struct irq_affinity desc = { 0, };
+	int node = dev_to_node(&vdev->dev);
 
 	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_MQ,
 				   struct virtio_blk_config, num_queues,
@@ -491,7 +492,8 @@ static int init_vq(struct virtio_blk *vblk)
 
 	num_vqs = min_t(unsigned int, nr_cpu_ids, num_vqs);
 
-	vblk->vqs = kmalloc_array(num_vqs, sizeof(*vblk->vqs), GFP_KERNEL);
+	vblk->vqs = kmalloc_array_node(num_vqs, sizeof(*vblk->vqs),
+				       GFP_KERNEL, node);
 	if (!vblk->vqs)
 		return -ENOMEM;
 
@@ -683,6 +685,7 @@ module_param_named(queue_depth, virtblk_queue_depth, uint, 0444);
 
 static int virtblk_probe(struct virtio_device *vdev)
 {
+	int node = dev_to_node(&vdev->dev);
 	struct virtio_blk *vblk;
 	struct request_queue *q;
 	int err, index;
@@ -714,7 +717,7 @@ static int virtblk_probe(struct virtio_device *vdev)
 
 	/* We need an extra sg elements at head and tail. */
 	sg_elems += 2;
-	vdev->priv = vblk = kmalloc(sizeof(*vblk), GFP_KERNEL);
+	vdev->priv = vblk = kmalloc_node(sizeof(*vblk), GFP_KERNEL, node);
 	if (!vblk) {
 		err = -ENOMEM;
 		goto out_free_index;
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
