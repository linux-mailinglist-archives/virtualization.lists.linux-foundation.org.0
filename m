Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AB82E9089
	for <lists.virtualization@lfdr.de>; Mon,  4 Jan 2021 07:56:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E60F086849;
	Mon,  4 Jan 2021 06:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCia6ndi19vg; Mon,  4 Jan 2021 06:56:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 74E5086847;
	Mon,  4 Jan 2021 06:56:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61CE4C013A;
	Mon,  4 Jan 2021 06:56:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 824E4C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6FC2086847
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ij4R0Wj0wQIc
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:56:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B79F786842
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609743366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gdm0UB4on1QPgytzzFxIDva39FIn9LEMmAgWsGGDne4=;
 b=GzwxRnC7VmKfw9cKX4dApDSYcaY2fsoz5SBrBBKH8iFQTE8zL5Mui1mk2Hq7nnQZPT8XlM
 XpUrjcqKJwG7BddUqjoque+rZzNbTTCc0w4yjXBHbyPFBWEG57LE2nj/z7DjUm1LxTWlG0
 nQg1MzEt5s26mua2+TfqThINKnPh7qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-EXJiTV6vOpypAyDm6AO38g-1; Mon, 04 Jan 2021 01:56:04 -0500
X-MC-Unique: EXJiTV6vOpypAyDm6AO38g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1A0A107ACE3;
 Mon,  4 Jan 2021 06:56:03 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-91.pek2.redhat.com [10.72.13.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 110D51002388;
 Mon,  4 Jan 2021 06:56:00 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V3 14/19] virtio-pci-modern: introduce helper to get
 notification offset
Date: Mon,  4 Jan 2021 14:54:58 +0800
Message-Id: <20210104065503.199631-15-jasowang@redhat.com>
In-Reply-To: <20210104065503.199631-1-jasowang@redhat.com>
References: <20210104065503.199631-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: shahafs@mellanox.com, rdunlap@infradead.org, lulu@redhat.com
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

This patch introduces help to get notification offset of modern device.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_pci_modern.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index bccad1329871..217573f2588d 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -303,6 +303,21 @@ static u16 vp_modern_get_num_queues(struct virtio_pci_modern_device *mdev)
 	return vp_ioread16(&mdev->common->num_queues);
 }
 
+/*
+ * vp_modern_get_queue_notify_off - get notification offset for a virtqueue
+ * @mdev: the modern virtio-pci device
+ * @index: the queue index
+ *
+ * Returns the notification offset for a virtqueue
+ */
+static u16 vp_modern_get_queue_notify_off(struct virtio_pci_modern_device *mdev,
+					  u16 index)
+{
+	vp_iowrite16(index, &mdev->common->queue_select);
+
+	return vp_ioread16(&mdev->common->queue_notify_off);
+}
+
 /* virtio config->finalize_features() implementation */
 static int vp_finalize_features(struct virtio_device *vdev)
 {
@@ -516,7 +531,6 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 {
 
 	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
-	struct virtio_pci_common_cfg __iomem *cfg = mdev->common;
 	struct virtqueue *vq;
 	u16 num, off;
 	int err;
@@ -524,9 +538,6 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 	if (index >= vp_modern_get_num_queues(mdev))
 		return ERR_PTR(-ENOENT);
 
-	/* Select the queue we're interested in */
-	vp_iowrite16(index, &cfg->queue_select);
-
 	/* Check if queue is either not available or already active. */
 	num = vp_modern_get_queue_size(mdev, index);
 	if (!num || vp_modern_get_queue_enable(mdev, index))
@@ -538,7 +549,7 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 	}
 
 	/* get offset of notification word for this vq */
-	off = vp_ioread16(&cfg->queue_notify_off);
+	off = vp_modern_get_queue_notify_off(mdev, index);
 
 	info->msix_vector = msix_vec;
 
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
