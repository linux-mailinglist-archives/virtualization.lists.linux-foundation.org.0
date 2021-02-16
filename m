Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B8C31CBD1
	for <lists.virtualization@lfdr.de>; Tue, 16 Feb 2021 15:26:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A1B486A03;
	Tue, 16 Feb 2021 14:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S4dpgEGcv5Io; Tue, 16 Feb 2021 14:26:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 45F7386731;
	Tue, 16 Feb 2021 14:26:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22902C013A;
	Tue, 16 Feb 2021 14:26:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9C1AC013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 14:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D859C87182
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 14:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2V2zDifIaW-e
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 14:26:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9997487180
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 14:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613485568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SEYfYar2Z34JEmg9fNkxOlKxP8XDPywN5twdNpU8D+A=;
 b=f9qjoI7v883bokzIwhKmq4s3ZPkVVkJOo6iyhfVdQ33uyN3gNG2+B2dz8O+BcT9Oc3ItNO
 40OR4I5/mGe5Ljw1W69Y0aRkBVi0NreXkSF2/ovMJG84p4kFsZLTEn1l+iRKrIC6J8nnXE
 Qm7/0hr8vVrGIiih2tlatRYoWLCo5Sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-0aJ7DoZmMcqyZ513nuUJfw-1; Tue, 16 Feb 2021 09:26:06 -0500
X-MC-Unique: 0aJ7DoZmMcqyZ513nuUJfw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C12AF3E759;
 Tue, 16 Feb 2021 14:25:37 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-212.ams2.redhat.com
 [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44F055B4BC;
 Tue, 16 Feb 2021 14:25:36 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH for 5.10 v2 4/5] vdpa_sim: make 'config' generic and usable
 for any device type
Date: Tue, 16 Feb 2021 15:24:38 +0100
Message-Id: <20210216142439.258713-5-sgarzare@redhat.com>
In-Reply-To: <20210216142439.258713-1-sgarzare@redhat.com>
References: <20210216142439.258713-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
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

commit f37cbbc65178e0a45823d281d290c4c02da9631c upstream.

Add new 'config_size' attribute in 'vdpasim_dev_attr' and allocates
'config' dynamically to support any device types.

Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Link: https://lore.kernel.org/r/20201215144256.155342-12-sgarzare@redhat.com
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Cc: <stable@vger.kernel.org> # 5.10.x
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index bc27fa485c3e..d9c494455156 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -70,6 +70,7 @@ static u64 vdpasim_features = (1ULL << VIRTIO_F_ANY_LAYOUT) |
 			      (1ULL << VIRTIO_NET_F_MAC);
 
 struct vdpasim_dev_attr {
+	size_t config_size;
 	int nvqs;
 };
 
@@ -81,7 +82,8 @@ struct vdpasim {
 	struct vdpasim_dev_attr dev_attr;
 	/* spinlock to synchronize virtqueue state */
 	spinlock_t lock;
-	struct virtio_net_config config;
+	/* virtio config according to device type */
+	void *config;
 	struct vhost_iotlb *iommu;
 	void *buffer;
 	u32 status;
@@ -380,6 +382,10 @@ static struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr)
 		goto err_iommu;
 	set_dma_ops(dev, &vdpasim_dma_ops);
 
+	vdpasim->config = kzalloc(dev_attr->config_size, GFP_KERNEL);
+	if (!vdpasim->config)
+		goto err_iommu;
+
 	vdpasim->vqs = kcalloc(dev_attr->nvqs, sizeof(struct vdpasim_virtqueue),
 			       GFP_KERNEL);
 	if (!vdpasim->vqs)
@@ -518,7 +524,8 @@ static u64 vdpasim_get_features(struct vdpa_device *vdpa)
 static int vdpasim_set_features(struct vdpa_device *vdpa, u64 features)
 {
 	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
-	struct virtio_net_config *config = &vdpasim->config;
+	struct virtio_net_config *config =
+		(struct virtio_net_config *)vdpasim->config;
 
 	/* DMA mapping must be done by driver */
 	if (!(features & (1ULL << VIRTIO_F_ACCESS_PLATFORM)))
@@ -588,8 +595,8 @@ static void vdpasim_get_config(struct vdpa_device *vdpa, unsigned int offset,
 {
 	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
 
-	if (offset + len < sizeof(struct virtio_net_config))
-		memcpy(buf, (u8 *)&vdpasim->config + offset, len);
+	if (offset + len < vdpasim->dev_attr.config_size)
+		memcpy(buf, vdpasim->config + offset, len);
 }
 
 static void vdpasim_set_config(struct vdpa_device *vdpa, unsigned int offset,
@@ -676,6 +683,7 @@ static void vdpasim_free(struct vdpa_device *vdpa)
 	if (vdpasim->iommu)
 		vhost_iotlb_free(vdpasim->iommu);
 	kfree(vdpasim->vqs);
+	kfree(vdpasim->config);
 }
 
 static const struct vdpa_config_ops vdpasim_net_config_ops = {
@@ -736,6 +744,7 @@ static int __init vdpasim_dev_init(void)
 	struct vdpasim_dev_attr dev_attr = {};
 
 	dev_attr.nvqs = VDPASIM_VQ_NUM;
+	dev_attr.config_size = sizeof(struct virtio_net_config);
 
 	vdpasim_dev = vdpasim_create(&dev_attr);
 
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
