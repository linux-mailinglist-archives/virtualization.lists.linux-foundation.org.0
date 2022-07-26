Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C984F580CA5
	for <lists.virtualization@lfdr.de>; Tue, 26 Jul 2022 09:23:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 686BE60AFF;
	Tue, 26 Jul 2022 07:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 686BE60AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeHq3u4ITpME; Tue, 26 Jul 2022 07:23:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EA1BF612F0;
	Tue, 26 Jul 2022 07:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA1BF612F0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BADCAC007D;
	Tue, 26 Jul 2022 07:23:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B5EAC007E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jul 2022 07:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C078B4170A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jul 2022 07:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C078B4170A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VGqssmn16SOI
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jul 2022 07:23:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A222F4171E
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A222F4171E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Jul 2022 07:23:32 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=37; SR=0;
 TI=SMTPD_---0VKUNVMe_1658820204; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VKUNVMe_1658820204) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 15:23:26 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v13 31/42] virtio_pci: extract the logic of active vq for
 modern pci
Date: Tue, 26 Jul 2022 15:22:14 +0800
Message-Id: <20220726072225.19884-32-xuanzhuo@linux.alibaba.com>
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

Introduce vp_active_vq() to configure vring to backend after vq attach
vring. And configure vq vector if necessary.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_pci_modern.c | 46 ++++++++++++++++++------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index e7e0b8c850f6..9041d9a41b7d 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -176,6 +176,29 @@ static void vp_reset(struct virtio_device *vdev)
 	vp_synchronize_vectors(vdev);
 }
 
+static int vp_active_vq(struct virtqueue *vq, u16 msix_vec)
+{
+	struct virtio_pci_device *vp_dev = to_vp_device(vq->vdev);
+	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
+	unsigned long index;
+
+	index = vq->index;
+
+	/* activate the queue */
+	vp_modern_set_queue_size(mdev, index, virtqueue_get_vring_size(vq));
+	vp_modern_queue_address(mdev, index, virtqueue_get_desc_addr(vq),
+				virtqueue_get_avail_addr(vq),
+				virtqueue_get_used_addr(vq));
+
+	if (msix_vec != VIRTIO_MSI_NO_VECTOR) {
+		msix_vec = vp_modern_queue_vector(mdev, index, msix_vec);
+		if (msix_vec == VIRTIO_MSI_NO_VECTOR)
+			return -EBUSY;
+	}
+
+	return 0;
+}
+
 static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
 {
 	return vp_modern_config_vector(&vp_dev->mdev, vector);
@@ -220,32 +243,19 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 
 	vq->num_max = num;
 
-	/* activate the queue */
-	vp_modern_set_queue_size(mdev, index, virtqueue_get_vring_size(vq));
-	vp_modern_queue_address(mdev, index, virtqueue_get_desc_addr(vq),
-				virtqueue_get_avail_addr(vq),
-				virtqueue_get_used_addr(vq));
+	err = vp_active_vq(vq, msix_vec);
+	if (err)
+		goto err;
 
 	vq->priv = (void __force *)vp_modern_map_vq_notify(mdev, index, NULL);
 	if (!vq->priv) {
 		err = -ENOMEM;
-		goto err_map_notify;
-	}
-
-	if (msix_vec != VIRTIO_MSI_NO_VECTOR) {
-		msix_vec = vp_modern_queue_vector(mdev, index, msix_vec);
-		if (msix_vec == VIRTIO_MSI_NO_VECTOR) {
-			err = -EBUSY;
-			goto err_assign_vector;
-		}
+		goto err;
 	}
 
 	return vq;
 
-err_assign_vector:
-	if (!mdev->notify_base)
-		pci_iounmap(mdev->pci_dev, (void __iomem __force *)vq->priv);
-err_map_notify:
+err:
 	vring_del_virtqueue(vq);
 	return ERR_PTR(err);
 }
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
