Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 016A32CE6D6
	for <lists.virtualization@lfdr.de>; Fri,  4 Dec 2020 05:05:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B051B87BFF;
	Fri,  4 Dec 2020 04:05:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2c8yaAqnYWrj; Fri,  4 Dec 2020 04:05:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EECE887C02;
	Fri,  4 Dec 2020 04:05:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3E54C0FA7;
	Fri,  4 Dec 2020 04:05:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6853C0FA7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 04:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D2AE48787B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 04:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KrZbEB63L3Ap
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 04:05:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F039287834
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 04:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607054710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2qEWI+MX2adpYOE0dEiuQYxEzz8VLasn0pLk1ZCl7lA=;
 b=HecSqEbgFT3/iFt9jWmGFgqZ7fjjO23VKO4vxo4UD5cWNqJoGzSOCxD99cXXeFzZfRfrRq
 04ky7rQERYLs/HIJMI63e7p6X3rRjXJk+cOyISta/w0FizHm8CTCvsDXNJzwJs7ZkGzcVk
 bn2RXZfv1ajVY/jUgXPomDUGZzA3A8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-1IaHLpxPNB60BnvIIyJRDA-1; Thu, 03 Dec 2020 23:05:08 -0500
X-MC-Unique: 1IaHLpxPNB60BnvIIyJRDA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44AE0107ACE3;
 Fri,  4 Dec 2020 04:05:07 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-116.pek2.redhat.com [10.72.12.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA31E1A4D0;
 Fri,  4 Dec 2020 04:05:01 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 17/19] vdpa: set the virtqueue num during register
Date: Fri,  4 Dec 2020 12:03:51 +0800
Message-Id: <20201204040353.21679-18-jasowang@redhat.com>
In-Reply-To: <20201204040353.21679-1-jasowang@redhat.com>
References: <20201204040353.21679-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: shahafs@mellanox.com
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

This patch delay the queue number setting to vDPA device
registering. This allows us to probe the virtqueue numbers between
device allocation and registering.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/ifcvf/ifcvf_main.c   | 5 ++---
 drivers/vdpa/mlx5/net/mlx5_vnet.c | 5 ++---
 drivers/vdpa/vdpa.c               | 8 ++++----
 drivers/vdpa/vdpa_sim/vdpa_sim.c  | 4 ++--
 include/linux/vdpa.h              | 7 +++----
 5 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
index 8b4028556cb6..d65f3221d8ed 100644
--- a/drivers/vdpa/ifcvf/ifcvf_main.c
+++ b/drivers/vdpa/ifcvf/ifcvf_main.c
@@ -438,8 +438,7 @@ static int ifcvf_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 
 	adapter = vdpa_alloc_device(struct ifcvf_adapter, vdpa,
-				    dev, &ifc_vdpa_ops,
-				    IFCVF_MAX_QUEUE_PAIRS * 2);
+				    dev, &ifc_vdpa_ops);
 	if (adapter == NULL) {
 		IFCVF_ERR(pdev, "Failed to allocate vDPA structure");
 		return -ENOMEM;
@@ -463,7 +462,7 @@ static int ifcvf_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	for (i = 0; i < IFCVF_MAX_QUEUE_PAIRS * 2; i++)
 		vf->vring[i].irq = -EINVAL;
 
-	ret = vdpa_register_device(&adapter->vdpa);
+	ret = vdpa_register_device(&adapter->vdpa, IFCVF_MAX_QUEUE_PAIRS * 2);
 	if (ret) {
 		IFCVF_ERR(pdev, "Failed to register ifcvf to vdpa bus");
 		goto err;
diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index 1fa6fcac8299..3c3eb2a02f76 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -1940,8 +1940,7 @@ void *mlx5_vdpa_add_dev(struct mlx5_core_dev *mdev)
 	max_vqs = MLX5_CAP_DEV_VDPA_EMULATION(mdev, max_num_virtio_queues);
 	max_vqs = min_t(u32, max_vqs, MLX5_MAX_SUPPORTED_VQS);
 
-	ndev = vdpa_alloc_device(struct mlx5_vdpa_net, mvdev.vdev, mdev->device, &mlx5_vdpa_ops,
-				 2 * mlx5_vdpa_max_qps(max_vqs));
+	ndev = vdpa_alloc_device(struct mlx5_vdpa_net, mvdev.vdev, mdev->device, &mlx5_vdpa_ops);
 	if (IS_ERR(ndev))
 		return ndev;
 
@@ -1968,7 +1967,7 @@ void *mlx5_vdpa_add_dev(struct mlx5_core_dev *mdev)
 	if (err)
 		goto err_res;
 
-	err = vdpa_register_device(&mvdev->vdev);
+	err = vdpa_register_device(&mvdev->vdev, 2 * mlx5_vdpa_max_qps(max_vqs));
 	if (err)
 		goto err_reg;
 
diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index a69ffc991e13..ba89238f9898 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -61,7 +61,6 @@ static void vdpa_release_dev(struct device *d)
  * initialized but before registered.
  * @parent: the parent device
  * @config: the bus operations that is supported by this device
- * @nvqs: number of virtqueues supported by this device
  * @size: size of the parent structure that contains private data
  *
  * Driver should use vdpa_alloc_device() wrapper macro instead of
@@ -72,7 +71,6 @@ static void vdpa_release_dev(struct device *d)
  */
 struct vdpa_device *__vdpa_alloc_device(struct device *parent,
 					const struct vdpa_config_ops *config,
-					int nvqs,
 					size_t size)
 {
 	struct vdpa_device *vdev;
@@ -99,7 +97,6 @@ struct vdpa_device *__vdpa_alloc_device(struct device *parent,
 	vdev->index = err;
 	vdev->config = config;
 	vdev->features_valid = false;
-	vdev->nvqs = nvqs;
 
 	err = dev_set_name(&vdev->dev, "vdpa%u", vdev->index);
 	if (err)
@@ -122,11 +119,14 @@ EXPORT_SYMBOL_GPL(__vdpa_alloc_device);
  * vdpa_register_device - register a vDPA device
  * Callers must have a succeed call of vdpa_alloc_device() before.
  * @vdev: the vdpa device to be registered to vDPA bus
+ * @nvqs: number of virtqueues supported by this device
  *
  * Returns an error when fail to add to vDPA bus
  */
-int vdpa_register_device(struct vdpa_device *vdev)
+int vdpa_register_device(struct vdpa_device *vdev, int nvqs)
 {
+	vdev->nvqs = nvqs;
+
 	return device_add(&vdev->dev);
 }
 EXPORT_SYMBOL_GPL(vdpa_register_device);
diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 6a90fdb9cbfc..b129cb4dd013 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -357,7 +357,7 @@ static struct vdpasim *vdpasim_create(void)
 	else
 		ops = &vdpasim_net_config_ops;
 
-	vdpasim = vdpa_alloc_device(struct vdpasim, vdpa, NULL, ops, VDPASIM_VQ_NUM);
+	vdpasim = vdpa_alloc_device(struct vdpasim, vdpa, NULL, ops);
 	if (!vdpasim)
 		goto err_alloc;
 
@@ -393,7 +393,7 @@ static struct vdpasim *vdpasim_create(void)
 	vringh_set_iotlb(&vdpasim->vqs[1].vring, vdpasim->iommu);
 
 	vdpasim->vdpa.dma_dev = dev;
-	ret = vdpa_register_device(&vdpasim->vdpa);
+	ret = vdpa_register_device(&vdpasim->vdpa, VDPASIM_VQ_NUM);
 	if (ret)
 		goto err_iommu;
 
diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index 30bc7a7223bb..d9e9d17b9083 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -244,18 +244,17 @@ struct vdpa_config_ops {
 
 struct vdpa_device *__vdpa_alloc_device(struct device *parent,
 					const struct vdpa_config_ops *config,
-					int nvqs,
 					size_t size);
 
-#define vdpa_alloc_device(dev_struct, member, parent, config, nvqs)   \
+#define vdpa_alloc_device(dev_struct, member, parent, config)   \
 			  container_of(__vdpa_alloc_device( \
-				       parent, config, nvqs, \
+				       parent, config, \
 				       sizeof(dev_struct) + \
 				       BUILD_BUG_ON_ZERO(offsetof( \
 				       dev_struct, member))), \
 				       dev_struct, member)
 
-int vdpa_register_device(struct vdpa_device *vdev);
+int vdpa_register_device(struct vdpa_device *vdev, int nvqs);
 void vdpa_unregister_device(struct vdpa_device *vdev);
 
 /**
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
