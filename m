Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DC0307860
	for <lists.virtualization@lfdr.de>; Thu, 28 Jan 2021 15:43:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 61A2A86E20;
	Thu, 28 Jan 2021 14:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gRhKovIQCLKd; Thu, 28 Jan 2021 14:43:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 96A3D86E32;
	Thu, 28 Jan 2021 14:43:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C80FC08A1;
	Thu, 28 Jan 2021 14:43:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A89FC0FA8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 14:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3494786E3C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 14:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bmQx87r42aNS
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 14:43:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E416286E20
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 14:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611844988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3jmE6N8rPoESTgIJH4wKKCx1Af/7e/Avo5KLtNY0Vk=;
 b=G3ejKID0e+1pUMJzx1JMne6wUZLr3jssVvokT9/DnvvtpJB873Tv1TacHVDVHfbpDHfwcK
 ewm0MgIgph6PMVIsu73EFpPBrIWpRo0ij4kd90GGJfCF4Mi6mDGdWWZV1GsSjjtOEJuFWW
 77B6OB4eVjmL/OMpBbZUfvSfRFvsFA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-5X9q1AeKMCaCTL8PkALksQ-1; Thu, 28 Jan 2021 09:43:07 -0500
X-MC-Unique: 5X9q1AeKMCaCTL8PkALksQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DED5B8030A7;
 Thu, 28 Jan 2021 14:43:05 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-219.ams2.redhat.com
 [10.36.113.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE44E10027A5;
 Thu, 28 Jan 2021 14:43:03 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH RFC v2 09/10] vdpa_sim_blk: implement ramdisk behaviour
Date: Thu, 28 Jan 2021 15:41:26 +0100
Message-Id: <20210128144127.113245-10-sgarzare@redhat.com>
In-Reply-To: <20210128144127.113245-1-sgarzare@redhat.com>
References: <20210128144127.113245-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, Xie Yongji <xieyongji@bytedance.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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

The previous implementation wrote only the status of each request.
This patch implements a more accurate block device simulator,
providing a ramdisk-like behavior.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2:
- used %zd %zx to print size_t and ssize_t variables in dev_err()
- removed unnecessary new line [Jason]
- moved VIRTIO_BLK_T_GET_ID in another patch [Jason]
- used push/pull instead of write/read terminology
- added vdpasim_blk_check_range() to avoid overflows [Stefan]
- use vdpasim*_to_cpu instead of le*_to_cpu
- used vringh_kiov_length() helper [Jason]
---
 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c | 164 ++++++++++++++++++++++++---
 1 file changed, 146 insertions(+), 18 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
index 999f9ca0b628..fc47e8320358 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
@@ -3,6 +3,7 @@
  * VDPA simulator for block device.
  *
  * Copyright (c) 2020, Mellanox Technologies. All rights reserved.
+ * Copyright (c) 2021, Red Hat Inc. All rights reserved.
  *
  */
 
@@ -13,6 +14,7 @@
 #include <linux/sched.h>
 #include <linux/vringh.h>
 #include <linux/vdpa.h>
+#include <linux/blkdev.h>
 #include <uapi/linux/virtio_blk.h>
 
 #include "vdpa_sim.h"
@@ -36,10 +38,151 @@
 
 static struct vdpasim *vdpasim_blk_dev;
 
+static bool vdpasim_blk_check_range(u64 start_sector, size_t range_size)
+{
+	u64 range_sectors = range_size >> SECTOR_SHIFT;
+
+	if (range_size > VDPASIM_BLK_SIZE_MAX * VDPASIM_BLK_SEG_MAX)
+		return false;
+
+	if (start_sector > VDPASIM_BLK_CAPACITY)
+		return false;
+
+	if (range_sectors > VDPASIM_BLK_CAPACITY - start_sector)
+		return false;
+
+	return true;
+}
+
+/* Returns 'true' if the request is handled (with or without an I/O error)
+ * and the status is correctly written in the last byte of the 'in iov',
+ * 'false' otherwise.
+ */
+static bool vdpasim_blk_handle_req(struct vdpasim *vdpasim,
+				   struct vdpasim_virtqueue *vq)
+{
+	size_t pushed = 0, to_pull, to_push;
+	struct virtio_blk_outhdr hdr;
+	ssize_t bytes;
+	loff_t offset;
+	u64 sector;
+	u8 status;
+	u32 type;
+	int ret;
+
+	ret = vringh_getdesc_iotlb(&vq->vring, &vq->out_iov, &vq->in_iov,
+				   &vq->head, GFP_ATOMIC);
+	if (ret != 1)
+		return false;
+
+	if (vq->out_iov.used < 1 || vq->in_iov.used < 1) {
+		dev_err(&vdpasim->vdpa.dev, "missing headers - out_iov: %u in_iov %u\n",
+			vq->out_iov.used, vq->in_iov.used);
+		return false;
+	}
+
+	if (vq->in_iov.iov[vq->in_iov.used - 1].iov_len < 1) {
+		dev_err(&vdpasim->vdpa.dev, "request in header too short\n");
+		return false;
+	}
+
+	/* The last byte is the status and we checked if the last iov has
+	 * enough room for it.
+	 */
+	to_push = vringh_kiov_length(&vq->in_iov) - 1;
+
+	to_pull = vringh_kiov_length(&vq->out_iov);
+
+	bytes = vringh_iov_pull_iotlb(&vq->vring, &vq->out_iov, &hdr,
+				      sizeof(hdr));
+	if (bytes != sizeof(hdr)) {
+		dev_err(&vdpasim->vdpa.dev, "request out header too short\n");
+		return false;
+	}
+
+	to_pull -= bytes;
+
+	type = vdpasim32_to_cpu(vdpasim, hdr.type);
+	sector = vdpasim64_to_cpu(vdpasim, hdr.sector);
+	offset = sector << SECTOR_SHIFT;
+	status = VIRTIO_BLK_S_OK;
+
+	switch (type) {
+	case VIRTIO_BLK_T_IN:
+		if (!vdpasim_blk_check_range(sector, to_push)) {
+			dev_err(&vdpasim->vdpa.dev,
+				"reading over the capacity - offset: 0x%llx len: 0x%zx\n",
+				offset, to_push);
+			status = VIRTIO_BLK_S_IOERR;
+			break;
+		}
+
+		bytes = vringh_iov_push_iotlb(&vq->vring, &vq->in_iov,
+					      vdpasim->buffer + offset,
+					      to_push);
+		if (bytes < 0) {
+			dev_err(&vdpasim->vdpa.dev,
+				"vringh_iov_push_iotlb() error: %zd offset: 0x%llx len: 0x%zx\n",
+				bytes, offset, to_push);
+			status = VIRTIO_BLK_S_IOERR;
+			break;
+		}
+
+		pushed += bytes;
+		break;
+
+	case VIRTIO_BLK_T_OUT:
+		if (!vdpasim_blk_check_range(sector, to_pull)) {
+			dev_err(&vdpasim->vdpa.dev,
+				"writing over the capacity - offset: 0x%llx len: 0x%zx\n",
+				offset, to_pull);
+			status = VIRTIO_BLK_S_IOERR;
+			break;
+		}
+
+		bytes = vringh_iov_pull_iotlb(&vq->vring, &vq->out_iov,
+					      vdpasim->buffer + offset,
+					      to_pull);
+		if (bytes < 0) {
+			dev_err(&vdpasim->vdpa.dev,
+				"vringh_iov_pull_iotlb() error: %zd offset: 0x%llx len: 0x%zx\n",
+				bytes, offset, to_pull);
+			status = VIRTIO_BLK_S_IOERR;
+			break;
+		}
+		break;
+
+	default:
+		dev_warn(&vdpasim->vdpa.dev,
+			 "Unsupported request type %d\n", type);
+		status = VIRTIO_BLK_S_IOERR;
+		break;
+	}
+
+	/* If some operations fail, we need to skip the remaining bytes
+	 * to put the status in the last byte
+	 */
+	if (to_push - pushed > 0)
+		vringh_kiov_advance(&vq->in_iov, to_push - pushed);
+
+	/* Last byte is the status */
+	bytes = vringh_iov_push_iotlb(&vq->vring, &vq->in_iov, &status, 1);
+	if (bytes != 1)
+		return false;
+
+	pushed += bytes;
+
+	/* Make sure data is wrote before advancing index */
+	smp_wmb();
+
+	vringh_complete_iotlb(&vq->vring, vq->head, pushed);
+
+	return true;
+}
+
 static void vdpasim_blk_work(struct work_struct *work)
 {
 	struct vdpasim *vdpasim = container_of(work, struct vdpasim, work);
-	u8 status = VIRTIO_BLK_S_OK;
 	int i;
 
 	spin_lock(&vdpasim->lock);
@@ -53,22 +196,7 @@ static void vdpasim_blk_work(struct work_struct *work)
 		if (!vq->ready)
 			continue;
 
-		while (vringh_getdesc_iotlb(&vq->vring, &vq->out_iov,
-					    &vq->in_iov, &vq->head,
-					    GFP_ATOMIC) > 0) {
-			int write;
-
-			vq->in_iov.i = vq->in_iov.used - 1;
-			write = vringh_iov_push_iotlb(&vq->vring, &vq->in_iov,
-						      &status, 1);
-			if (write <= 0)
-				break;
-
-			/* Make sure data is wrote before advancing index */
-			smp_wmb();
-
-			vringh_complete_iotlb(&vq->vring, vq->head, write);
-
+		while (vdpasim_blk_handle_req(vdpasim, vq)) {
 			/* Make sure used is visible before rasing the interrupt. */
 			smp_wmb();
 
@@ -109,7 +237,7 @@ static int __init vdpasim_blk_init(void)
 	dev_attr.config_size = sizeof(struct virtio_blk_config);
 	dev_attr.get_config = vdpasim_blk_get_config;
 	dev_attr.work_fn = vdpasim_blk_work;
-	dev_attr.buffer_size = PAGE_SIZE;
+	dev_attr.buffer_size = VDPASIM_BLK_CAPACITY << SECTOR_SHIFT;
 
 	vdpasim_blk_dev = vdpasim_create(&dev_attr);
 	if (IS_ERR(vdpasim_blk_dev)) {
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
