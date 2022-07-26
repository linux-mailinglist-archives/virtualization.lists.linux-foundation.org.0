Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE99580CB4
	for <lists.virtualization@lfdr.de>; Tue, 26 Jul 2022 09:23:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7086B82D07;
	Tue, 26 Jul 2022 07:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7086B82D07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LX3Q_J4hnUSb; Tue, 26 Jul 2022 07:23:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 10F3C82E9D;
	Tue, 26 Jul 2022 07:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10F3C82E9D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE82FC002D;
	Tue, 26 Jul 2022 07:23:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DBC0C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jul 2022 07:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEC9E41716
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jul 2022 07:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEC9E41716
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMU3aaVBjEcE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jul 2022 07:23:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ADA84171B
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6ADA84171B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jul 2022 07:23:36 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=37; SR=0;
 TI=SMTPD_---0VKUN6oj_1658820208; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VKUN6oj_1658820208) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 15:23:29 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v13 33/42] virtio: find_vqs() add arg sizes
Date: Tue, 26 Jul 2022 15:22:16 +0800
Message-Id: <20220726072225.19884-34-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220726072225.19884-1-xuanzhuo@linux.alibaba.com>
References: <20220726072225.19884-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 19d2a6aae0b1
Cc: Vadim Pasternak <vadimp@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-remoteproc@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 kangjie.xu@linux.alibaba.com, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 kvm@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 Richard Weinberger <richard@nod.at>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 John Fastabend <john.fastabend@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Eric Farman <farman@linux.ibm.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Johannes Berg <johannes@sipsolutions.net>,
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

find_vqs() adds a new parameter sizes to specify the size of each vq
vring.

NULL as sizes means that all queues in find_vqs() use the maximum size.
A value in the array is 0, which means that the corresponding queue uses
the maximum size.

In the split scenario, the meaning of size is the largest size, because
it may be limited by memory, the virtio core will try a smaller size.
And the size is power of 2.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 arch/um/drivers/virtio_uml.c             |  2 +-
 drivers/platform/mellanox/mlxbf-tmfifo.c |  1 +
 drivers/remoteproc/remoteproc_virtio.c   |  1 +
 drivers/s390/virtio/virtio_ccw.c         |  1 +
 drivers/virtio/virtio_mmio.c             |  1 +
 drivers/virtio/virtio_pci_common.c       |  2 +-
 drivers/virtio/virtio_pci_common.h       |  2 +-
 drivers/virtio/virtio_pci_modern.c       |  7 +++++--
 drivers/virtio/virtio_vdpa.c             |  1 +
 include/linux/virtio_config.h            | 14 +++++++++-----
 10 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/um/drivers/virtio_uml.c b/arch/um/drivers/virtio_uml.c
index e719af8bdf56..79e38afd4b91 100644
--- a/arch/um/drivers/virtio_uml.c
+++ b/arch/um/drivers/virtio_uml.c
@@ -1011,7 +1011,7 @@ static struct virtqueue *vu_setup_vq(struct virtio_device *vdev,
 
 static int vu_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 		       struct virtqueue *vqs[], vq_callback_t *callbacks[],
-		       const char * const names[], const bool *ctx,
+		       const char * const names[], u32 sizes[], const bool *ctx,
 		       struct irq_affinity *desc)
 {
 	struct virtio_uml_device *vu_dev = to_virtio_uml_device(vdev);
diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index 1ae3c56b66b0..8be13d416f48 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -928,6 +928,7 @@ static int mlxbf_tmfifo_virtio_find_vqs(struct virtio_device *vdev,
 					struct virtqueue *vqs[],
 					vq_callback_t *callbacks[],
 					const char * const names[],
+					u32 sizes[],
 					const bool *ctx,
 					struct irq_affinity *desc)
 {
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 0f7706e23eb9..81c4f5776109 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -158,6 +158,7 @@ static int rproc_virtio_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 				 struct virtqueue *vqs[],
 				 vq_callback_t *callbacks[],
 				 const char * const names[],
+				 u32 sizes[],
 				 const bool * ctx,
 				 struct irq_affinity *desc)
 {
diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index 6b86d0280d6b..72500cd2dbf5 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -635,6 +635,7 @@ static int virtio_ccw_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 			       struct virtqueue *vqs[],
 			       vq_callback_t *callbacks[],
 			       const char * const names[],
+			       u32 sizes[],
 			       const bool *ctx,
 			       struct irq_affinity *desc)
 {
diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index a20d5a6b5819..5e3ba3cc7fd0 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -474,6 +474,7 @@ static int vm_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 		       struct virtqueue *vqs[],
 		       vq_callback_t *callbacks[],
 		       const char * const names[],
+		       u32 sizes[],
 		       const bool *ctx,
 		       struct irq_affinity *desc)
 {
diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index ad258a9d3b9f..7ad734584823 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -396,7 +396,7 @@ static int vp_find_vqs_intx(struct virtio_device *vdev, unsigned int nvqs,
 /* the config->find_vqs() implementation */
 int vp_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 		struct virtqueue *vqs[], vq_callback_t *callbacks[],
-		const char * const names[], const bool *ctx,
+		const char * const names[], u32 sizes[], const bool *ctx,
 		struct irq_affinity *desc)
 {
 	int err;
diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
index 23112d84218f..a5ff838b85a5 100644
--- a/drivers/virtio/virtio_pci_common.h
+++ b/drivers/virtio/virtio_pci_common.h
@@ -110,7 +110,7 @@ void vp_del_vqs(struct virtio_device *vdev);
 /* the config->find_vqs() implementation */
 int vp_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 		struct virtqueue *vqs[], vq_callback_t *callbacks[],
-		const char * const names[], const bool *ctx,
+		const char * const names[], u32 sizes[], const bool *ctx,
 		struct irq_affinity *desc);
 const char *vp_bus_name(struct virtio_device *vdev);
 
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index c3b9f2761849..be51ec849252 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -347,12 +347,15 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 static int vp_modern_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 			      struct virtqueue *vqs[],
 			      vq_callback_t *callbacks[],
-			      const char * const names[], const bool *ctx,
+			      const char * const names[],
+			      u32 sizes[],
+			      const bool *ctx,
 			      struct irq_affinity *desc)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
 	struct virtqueue *vq;
-	int rc = vp_find_vqs(vdev, nvqs, vqs, callbacks, names, ctx, desc);
+	int rc = vp_find_vqs(vdev, nvqs, vqs, callbacks, names, sizes, ctx,
+			     desc);
 
 	if (rc)
 		return rc;
diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
index 9670cc79371d..832d2c5b1b19 100644
--- a/drivers/virtio/virtio_vdpa.c
+++ b/drivers/virtio/virtio_vdpa.c
@@ -269,6 +269,7 @@ static int virtio_vdpa_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 				struct virtqueue *vqs[],
 				vq_callback_t *callbacks[],
 				const char * const names[],
+				u32 sizes[],
 				const bool *ctx,
 				struct irq_affinity *desc)
 {
diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index 36ec7be1f480..888f7e96f0c7 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -55,6 +55,7 @@ struct virtio_shm_region {
  *		include a NULL entry for vqs that do not need a callback
  *	names: array of virtqueue names (mainly for debugging)
  *		include a NULL entry for vqs unused by driver
+ *	sizes: array of virtqueue sizes
  *	Returns 0 on success or error status
  * @del_vqs: free virtqueues found by find_vqs().
  * @synchronize_cbs: synchronize with the virtqueue callbacks (optional)
@@ -103,7 +104,9 @@ struct virtio_config_ops {
 	void (*reset)(struct virtio_device *vdev);
 	int (*find_vqs)(struct virtio_device *, unsigned nvqs,
 			struct virtqueue *vqs[], vq_callback_t *callbacks[],
-			const char * const names[], const bool *ctx,
+			const char * const names[],
+			u32 sizes[],
+			const bool *ctx,
 			struct irq_affinity *desc);
 	void (*del_vqs)(struct virtio_device *);
 	void (*synchronize_cbs)(struct virtio_device *);
@@ -212,7 +215,7 @@ struct virtqueue *virtio_find_single_vq(struct virtio_device *vdev,
 	const char *names[] = { n };
 	struct virtqueue *vq;
 	int err = vdev->config->find_vqs(vdev, 1, &vq, callbacks, names, NULL,
-					 NULL);
+					 NULL, NULL);
 	if (err < 0)
 		return ERR_PTR(err);
 	return vq;
@@ -224,7 +227,8 @@ int virtio_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 			const char * const names[],
 			struct irq_affinity *desc)
 {
-	return vdev->config->find_vqs(vdev, nvqs, vqs, callbacks, names, NULL, desc);
+	return vdev->config->find_vqs(vdev, nvqs, vqs, callbacks, names, NULL,
+				      NULL, desc);
 }
 
 static inline
@@ -233,8 +237,8 @@ int virtio_find_vqs_ctx(struct virtio_device *vdev, unsigned nvqs,
 			const char * const names[], const bool *ctx,
 			struct irq_affinity *desc)
 {
-	return vdev->config->find_vqs(vdev, nvqs, vqs, callbacks, names, ctx,
-				      desc);
+	return vdev->config->find_vqs(vdev, nvqs, vqs, callbacks, names, NULL,
+				      ctx, desc);
 }
 
 /**
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
