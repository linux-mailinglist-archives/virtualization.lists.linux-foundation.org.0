Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB944C24F8
	for <lists.virtualization@lfdr.de>; Thu, 24 Feb 2022 09:11:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81B1283265;
	Thu, 24 Feb 2022 08:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOPmoF6rFuAu; Thu, 24 Feb 2022 08:11:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3D04683267;
	Thu, 24 Feb 2022 08:11:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 516D6C0079;
	Thu, 24 Feb 2022 08:11:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86929C0011
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Feb 2022 08:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 738308322E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Feb 2022 08:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JluQYXzLGOFk
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Feb 2022 08:11:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B636831DE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Feb 2022 08:11:48 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=34; SR=0; TI=SMTPD_---0V5NJNGB_1645690302; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V5NJNGB_1645690302) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 24 Feb 2022 16:11:43 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org
Subject: [PATCH v6 19/26] virtio_pci: support the arg sizes of find_vqs()
Date: Thu, 24 Feb 2022 16:10:55 +0800
Message-Id: <20220224081102.80224-20-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220224081102.80224-1-xuanzhuo@linux.alibaba.com>
References: <20220224081102.80224-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: bd1c915e263f
Cc: Vadim Pasternak <vadimp@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-remoteproc@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes.berg@intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Richard Weinberger <richard@nod.at>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 John Fastabend <john.fastabend@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, kvm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 bpf@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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

Virtio PCI supports new parameter sizes of find_vqs().

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_pci_common.c | 18 ++++++++++--------
 drivers/virtio/virtio_pci_common.h |  1 +
 drivers/virtio/virtio_pci_legacy.c |  6 +++++-
 drivers/virtio/virtio_pci_modern.c | 10 +++++++---
 4 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index 8e8fa7e5ad80..1faf65325060 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -208,6 +208,7 @@ static int vp_request_msix_vectors(struct virtio_device *vdev, int nvectors,
 static struct virtqueue *vp_setup_vq(struct virtio_device *vdev, unsigned index,
 				     void (*callback)(struct virtqueue *vq),
 				     const char *name,
+				     u32 size,
 				     bool ctx,
 				     u16 msix_vec)
 {
@@ -221,7 +222,7 @@ static struct virtqueue *vp_setup_vq(struct virtio_device *vdev, unsigned index,
 		return ERR_PTR(-ENOMEM);
 
 	vq = vp_dev->setup_vq(vp_dev, info, index, callback, name, ctx,
-			      msix_vec);
+			      size, msix_vec);
 	if (IS_ERR(vq))
 		goto out_info;
 
@@ -314,7 +315,7 @@ void vp_del_vqs(struct virtio_device *vdev)
 
 static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned nvqs,
 		struct virtqueue *vqs[], vq_callback_t *callbacks[],
-		const char * const names[], bool per_vq_vectors,
+		const char * const names[], u32 sizes[], bool per_vq_vectors,
 		const bool *ctx,
 		struct irq_affinity *desc)
 {
@@ -357,8 +358,8 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned nvqs,
 		else
 			msix_vec = VP_MSIX_VQ_VECTOR;
 		vqs[i] = vp_setup_vq(vdev, queue_idx++, callbacks[i], names[i],
-				     ctx ? ctx[i] : false,
-				     msix_vec);
+				     sizes ? sizes[i] : 0,
+				     ctx ? ctx[i] : false, msix_vec);
 		if (IS_ERR(vqs[i])) {
 			err = PTR_ERR(vqs[i]);
 			goto error_find;
@@ -388,7 +389,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned nvqs,
 
 static int vp_find_vqs_intx(struct virtio_device *vdev, unsigned nvqs,
 		struct virtqueue *vqs[], vq_callback_t *callbacks[],
-		const char * const names[], const bool *ctx)
+		const char * const names[], u32 sizes[], const bool *ctx)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
 	int i, err, queue_idx = 0;
@@ -410,6 +411,7 @@ static int vp_find_vqs_intx(struct virtio_device *vdev, unsigned nvqs,
 			continue;
 		}
 		vqs[i] = vp_setup_vq(vdev, queue_idx++, callbacks[i], names[i],
+				     sizes ? sizes[i] : 0,
 				     ctx ? ctx[i] : false,
 				     VIRTIO_MSI_NO_VECTOR);
 		if (IS_ERR(vqs[i])) {
@@ -433,15 +435,15 @@ int vp_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 	int err;
 
 	/* Try MSI-X with one vector per queue. */
-	err = vp_find_vqs_msix(vdev, nvqs, vqs, callbacks, names, true, ctx, desc);
+	err = vp_find_vqs_msix(vdev, nvqs, vqs, callbacks, names, sizes, true, ctx, desc);
 	if (!err)
 		return 0;
 	/* Fallback: MSI-X with one vector for config, one shared for queues. */
-	err = vp_find_vqs_msix(vdev, nvqs, vqs, callbacks, names, false, ctx, desc);
+	err = vp_find_vqs_msix(vdev, nvqs, vqs, callbacks, names, sizes, false, ctx, desc);
 	if (!err)
 		return 0;
 	/* Finally fall back to regular interrupts. */
-	return vp_find_vqs_intx(vdev, nvqs, vqs, callbacks, names, ctx);
+	return vp_find_vqs_intx(vdev, nvqs, vqs, callbacks, names, sizes, ctx);
 }
 
 const char *vp_bus_name(struct virtio_device *vdev)
diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
index 9dbf1d555dff..a15ac5570ddd 100644
--- a/drivers/virtio/virtio_pci_common.h
+++ b/drivers/virtio/virtio_pci_common.h
@@ -82,6 +82,7 @@ struct virtio_pci_device {
 				      void (*callback)(struct virtqueue *vq),
 				      const char *name,
 				      bool ctx,
+				      u32 size,
 				      u16 msix_vec);
 	void (*del_vq)(struct virtio_pci_vq_info *info);
 
diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
index b68934fe6b5d..efa98d2debe0 100644
--- a/drivers/virtio/virtio_pci_legacy.c
+++ b/drivers/virtio/virtio_pci_legacy.c
@@ -113,6 +113,7 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 				  void (*callback)(struct virtqueue *vq),
 				  const char *name,
 				  bool ctx,
+				  u32 size,
 				  u16 msix_vec)
 {
 	struct virtqueue *vq;
@@ -125,10 +126,13 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 	if (!num || vp_legacy_get_queue_enable(&vp_dev->ldev, index))
 		return ERR_PTR(-ENOENT);
 
+	if (!size || size > num)
+		size = num;
+
 	info->msix_vector = msix_vec;
 
 	/* create the vring */
-	vq = vring_create_virtqueue(index, num,
+	vq = vring_create_virtqueue(index, size,
 				    VIRTIO_PCI_VRING_ALIGN, &vp_dev->vdev,
 				    true, false, ctx,
 				    vp_notify, callback, name);
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 342795175c29..0e17e0df6a8a 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -289,6 +289,7 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 				  void (*callback)(struct virtqueue *vq),
 				  const char *name,
 				  bool ctx,
+				  u32 size,
 				  u16 msix_vec)
 {
 
@@ -305,15 +306,18 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 	if (!num || vp_modern_get_queue_enable(mdev, index))
 		return ERR_PTR(-ENOENT);
 
-	if (num & (num - 1)) {
-		dev_warn(&vp_dev->pci_dev->dev, "bad queue size %u", num);
+	if (!size || size > num)
+		size = num;
+
+	if (size & (size - 1)) {
+		dev_warn(&vp_dev->pci_dev->dev, "bad queue size %u", size);
 		return ERR_PTR(-EINVAL);
 	}
 
 	info->msix_vector = msix_vec;
 
 	/* create the vring */
-	vq = vring_create_virtqueue(index, num,
+	vq = vring_create_virtqueue(index, size,
 				    SMP_CACHE_BYTES, &vp_dev->vdev,
 				    true, true, ctx,
 				    vp_notify, callback, name);
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
