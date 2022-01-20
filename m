Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF55494777
	for <lists.virtualization@lfdr.de>; Thu, 20 Jan 2022 07:43:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0EA9400B8;
	Thu, 20 Jan 2022 06:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhniOJ5RVqFy; Thu, 20 Jan 2022 06:43:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 621BF40550;
	Thu, 20 Jan 2022 06:43:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED3D7C002F;
	Thu, 20 Jan 2022 06:43:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEC38C007A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jan 2022 06:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 744F04151A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jan 2022 06:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QcdKpR8sSEKx
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jan 2022 06:43:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53FEE409EA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jan 2022 06:43:16 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0V2KlUd0_1642660991; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V2KlUd0_1642660991) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 20 Jan 2022 14:43:12 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 07/12] virtio: queue_reset: pci: support VIRTIO_F_RING_RESET
Date: Thu, 20 Jan 2022 14:42:58 +0800
Message-Id: <20220120064303.106639-8-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220120064303.106639-1-xuanzhuo@linux.alibaba.com>
References: <20220120064303.106639-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
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

This patch implements virtio pci support for QUEUE RESET.

Performing reset on a queue is divided into two steps:

1. reset_vq: reset one vq
2. enable_reset_vq: re-enable the reset queue

In the first step, these tasks will be completed:
   1. notify the hardware queue to reset
   2. recycle the buffer from vq
   3. delete the vq

When deleting a vq, vp_del_vq() will be called to release all the memory
of the vq. But this does not affect the process of deleting vqs, because
that is based on the queue to release all the vqs. During this process,
the vq has been removed from the queue.

When deleting vq, info and vq will be released, and I save msix_vec in
vp_dev->vqs[queue_index]. When re-enable, the current msix_vec can be
reused. And based on intx_enabled to determine which method to use to
enable this queue.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_pci_common.c | 49 ++++++++++++++++++++
 drivers/virtio/virtio_pci_common.h |  4 ++
 drivers/virtio/virtio_pci_modern.c | 73 ++++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index 5afe207ce28a..28b5ffde4621 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -464,6 +464,55 @@ int vp_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 	return vp_find_vqs_intx(vdev, nvqs, vqs, callbacks, names, ctx);
 }
 
+#define VQ_IS_DELETED(vp_dev, idx) ((unsigned long)vp_dev->vqs[idx] & 1)
+#define VQ_RESET_MSIX_VEC(vp_dev, idx) ((unsigned long)vp_dev->vqs[idx] >> 2)
+#define VQ_RESET_MARK(msix_vec) ((void *)(long)((msix_vec << 2) + 1))
+
+void vp_del_reset_vq(struct virtio_device *vdev, u16 queue_index)
+{
+	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	struct virtio_pci_vq_info *info;
+	u16 msix_vec;
+
+	info = vp_dev->vqs[queue_index];
+
+	msix_vec = info->msix_vector;
+
+	/* delete vq */
+	vp_del_vq(info->vq);
+
+	/* Mark the vq has been deleted, and save the msix_vec. */
+	vp_dev->vqs[queue_index] = VQ_RESET_MARK(msix_vec);
+}
+
+struct virtqueue *vp_enable_reset_vq(struct virtio_device *vdev,
+				     int queue_index,
+				     vq_callback_t *callback,
+				     const char *name,
+				     const bool ctx)
+{
+	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	struct virtqueue *vq;
+	u16 msix_vec;
+
+	if (!VQ_IS_DELETED(vp_dev, queue_index))
+		return ERR_PTR(-EPERM);
+
+	msix_vec = VQ_RESET_MSIX_VEC(vp_dev, queue_index);
+
+	if (vp_dev->intx_enabled)
+		vq = vp_setup_vq(vdev, queue_index, callback, name, ctx,
+				 VIRTIO_MSI_NO_VECTOR);
+	else
+		vq = vp_enable_vq_msix(vdev, queue_index, callback, name, ctx,
+				       msix_vec);
+
+	if (IS_ERR(vq))
+		vp_dev->vqs[queue_index] = VQ_RESET_MARK(msix_vec);
+
+	return vq;
+}
+
 const char *vp_bus_name(struct virtio_device *vdev)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
index 23f6c5c678d5..96c13b1398f8 100644
--- a/drivers/virtio/virtio_pci_common.h
+++ b/drivers/virtio/virtio_pci_common.h
@@ -115,6 +115,10 @@ int vp_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 		struct virtqueue *vqs[], vq_callback_t *callbacks[],
 		const char * const names[], const bool *ctx,
 		struct irq_affinity *desc);
+void vp_del_reset_vq(struct virtio_device *vdev, u16 queue_index);
+struct virtqueue *vp_enable_reset_vq(struct virtio_device *vdev, int queue_index,
+				     vq_callback_t *callback, const char *name,
+				     const bool ctx);
 const char *vp_bus_name(struct virtio_device *vdev);
 
 /* Setup the affinity for a virtqueue:
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 5455bc041fb6..fbf87239c920 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -34,6 +34,9 @@ static void vp_transport_features(struct virtio_device *vdev, u64 features)
 	if ((features & BIT_ULL(VIRTIO_F_SR_IOV)) &&
 			pci_find_ext_capability(pci_dev, PCI_EXT_CAP_ID_SRIOV))
 		__virtio_set_bit(vdev, VIRTIO_F_SR_IOV);
+
+	if (features & BIT_ULL(VIRTIO_F_RING_RESET))
+		__virtio_set_bit(vdev, VIRTIO_F_RING_RESET);
 }
 
 /* virtio config->finalize_features() implementation */
@@ -176,6 +179,72 @@ static void vp_reset(struct virtio_device *vdev)
 	vp_disable_cbs(vdev);
 }
 
+static int vp_modern_reset_vq(struct virtio_device *vdev, u16 queue_index,
+			      vq_reset_callback_t *callback, void *data)
+{
+	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
+	struct virtio_pci_vq_info *info;
+	u16 msix_vec;
+	void *buf;
+
+	if (!virtio_has_feature(vdev, VIRTIO_F_RING_RESET))
+		return -ENOENT;
+
+	vp_modern_set_queue_reset(mdev, queue_index);
+
+	/* After write 1 to queue reset, the driver MUST wait for a read of
+	 * queue reset to return 1.
+	 */
+	while (vp_modern_get_queue_reset(mdev, queue_index) != 1)
+		msleep(1);
+
+	info = vp_dev->vqs[queue_index];
+	msix_vec = info->msix_vector;
+
+	/* Disable VQ callback. */
+	if (vp_dev->per_vq_vectors && msix_vec != VIRTIO_MSI_NO_VECTOR)
+		disable_irq(pci_irq_vector(vp_dev->pci_dev, msix_vec));
+
+	while ((buf = virtqueue_detach_unused_buf(info->vq)) != NULL)
+		callback(vdev, buf, data);
+
+	vp_del_reset_vq(vdev, queue_index);
+
+	return 0;
+}
+
+static struct virtqueue *vp_modern_enable_reset_vq(struct virtio_device *vdev,
+						   u16 queue_index,
+						   vq_callback_t *callback,
+						   const char *name,
+						   const bool *ctx)
+{
+	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
+	struct virtqueue *vq;
+	u16 msix_vec;
+
+	if (!virtio_has_feature(vdev, VIRTIO_F_RING_RESET))
+		return ERR_PTR(-ENOENT);
+
+	/* check queue reset status */
+	if (vp_modern_get_queue_reset(mdev, queue_index) != 1)
+		return ERR_PTR(-EBUSY);
+
+	vq = vp_enable_reset_vq(vdev, queue_index, callback, name, ctx);
+	if (IS_ERR(vq))
+		return vq;
+
+	vp_modern_set_queue_enable(&vp_dev->mdev, vq->index, true);
+
+	msix_vec = vp_dev->vqs[queue_index]->msix_vector;
+	if (vp_dev->per_vq_vectors && msix_vec != VIRTIO_MSI_NO_VECTOR)
+		enable_irq(pci_irq_vector(vp_dev->pci_dev, msix_vec));
+
+	return vq;
+}
+
 static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
 {
 	return vp_modern_config_vector(&vp_dev->mdev, vector);
@@ -395,6 +464,8 @@ static const struct virtio_config_ops virtio_pci_config_nodev_ops = {
 	.set_vq_affinity = vp_set_vq_affinity,
 	.get_vq_affinity = vp_get_vq_affinity,
 	.get_shm_region  = vp_get_shm_region,
+	.reset_vq	 = vp_modern_reset_vq,
+	.enable_reset_vq = vp_modern_enable_reset_vq,
 };
 
 static const struct virtio_config_ops virtio_pci_config_ops = {
@@ -413,6 +484,8 @@ static const struct virtio_config_ops virtio_pci_config_ops = {
 	.set_vq_affinity = vp_set_vq_affinity,
 	.get_vq_affinity = vp_get_vq_affinity,
 	.get_shm_region  = vp_get_shm_region,
+	.reset_vq	 = vp_modern_reset_vq,
+	.enable_reset_vq = vp_modern_enable_reset_vq,
 };
 
 /* the PCI probing function */
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
