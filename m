Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C88EC2E907B
	for <lists.virtualization@lfdr.de>; Mon,  4 Jan 2021 07:55:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6966A86F3F;
	Mon,  4 Jan 2021 06:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPMXioSb4eDO; Mon,  4 Jan 2021 06:55:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A9AFE8709D;
	Mon,  4 Jan 2021 06:55:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99274C013A;
	Mon,  4 Jan 2021 06:55:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3606AC013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 21F2E85DF4
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nDnGu8MWumuK
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7E39B85BB8
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609743324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WjwOvxc/H63/yuRAiv4FstjGXxdKxusKOd3E2oWbPlQ=;
 b=Mz15krE5Cds1xjjvKA/QVU7nqPRMfy88OKuIKxosTW9DgsOi45HZfPsBDlfFTDgigx/doM
 aygsgIfN7gmMscEXpSfn/w0nOkkftB7UWcVUgE++KRn82PXZxI4o7yH5hhSsqnv324oER0
 HqLTqGdcQIjTIeoOeXnFyorMTeRWNOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-2nmVdTQTOdGeoXFSFSKlrQ-1; Mon, 04 Jan 2021 01:55:22 -0500
X-MC-Unique: 2nmVdTQTOdGeoXFSFSKlrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E9CD180A089;
 Mon,  4 Jan 2021 06:55:21 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-91.pek2.redhat.com [10.72.13.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 837821002388;
 Mon,  4 Jan 2021 06:55:18 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V3 03/19] virtio-pci-modern: factor out modern device
 initialization logic
Date: Mon,  4 Jan 2021 14:54:47 +0800
Message-Id: <20210104065503.199631-4-jasowang@redhat.com>
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

This patch factors out the modern device initialization logic into a
helper. Note that it still depends on the caller to enable pci device
which allows the caller to use e.g devres.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_pci_modern.c | 50 +++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 524490a94ca4..5d2d2ae0dfdb 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -703,11 +703,16 @@ static inline void check_offsets(void)
 		     offsetof(struct virtio_pci_common_cfg, queue_used_hi));
 }
 
-/* the PCI probing function */
-int virtio_pci_modern_probe(struct virtio_pci_device *vp_dev)
+/*
+ * vp_modern_probe: probe the modern virtio pci device, note that the
+ * caller is required to enable PCI device before calling this function.
+ * @mdev: the modern virtio-pci device
+ *
+ * Return 0 on succeed otherwise fail
+ */
+static int vp_modern_probe(struct virtio_pci_modern_device *mdev)
 {
-	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
-	struct pci_dev *pci_dev = vp_dev->pci_dev;
+	struct pci_dev *pci_dev = mdev->pci_dev;
 	int err, common, isr, notify, device;
 	u32 notify_length;
 	u32 notify_offset;
@@ -826,18 +831,8 @@ int virtio_pci_modern_probe(struct virtio_pci_device *vp_dev)
 					      &mdev->device_len);
 		if (!mdev->device)
 			goto err_map_device;
-
-		vp_dev->vdev.config = &virtio_pci_config_ops;
-	} else {
-		vp_dev->vdev.config = &virtio_pci_config_nodev_ops;
 	}
 
-	vp_dev->config_vector = vp_config_vector;
-	vp_dev->setup_vq = setup_vq;
-	vp_dev->del_vq = del_vq;
-	vp_dev->isr = mdev->isr;
-	vp_dev->vdev.id = mdev->id;
-
 	return 0;
 
 err_map_device:
@@ -851,6 +846,33 @@ int virtio_pci_modern_probe(struct virtio_pci_device *vp_dev)
 	return err;
 }
 
+/* the PCI probing function */
+int virtio_pci_modern_probe(struct virtio_pci_device *vp_dev)
+{
+	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
+	struct pci_dev *pci_dev = vp_dev->pci_dev;
+	int err;
+
+	mdev->pci_dev = pci_dev;
+
+	err = vp_modern_probe(mdev);
+	if (err)
+		return err;
+
+	if (mdev->device)
+		vp_dev->vdev.config = &virtio_pci_config_ops;
+	else
+		vp_dev->vdev.config = &virtio_pci_config_nodev_ops;
+
+	vp_dev->config_vector = vp_config_vector;
+	vp_dev->setup_vq = setup_vq;
+	vp_dev->del_vq = del_vq;
+	vp_dev->isr = mdev->isr;
+	vp_dev->vdev.id = mdev->id;
+
+	return 0;
+}
+
 void virtio_pci_modern_remove(struct virtio_pci_device *vp_dev)
 {
 	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
