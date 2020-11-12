Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 132F42AFFC8
	for <lists.virtualization@lfdr.de>; Thu, 12 Nov 2020 07:40:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 79FDE2E144;
	Thu, 12 Nov 2020 06:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8x+vUAqWlCCk; Thu, 12 Nov 2020 06:40:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2B5B72E136;
	Thu, 12 Nov 2020 06:40:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2CC4C016F;
	Thu, 12 Nov 2020 06:40:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9B7DC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 06:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B73352E136
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 06:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id czXfY2oTzvXd
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 06:40:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by silver.osuosl.org (Postfix) with ESMTPS id 37B392E141
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 06:40:35 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5facd8dd0001>; Wed, 11 Nov 2020 22:40:29 -0800
Received: from sw-mtx-036.mtx.labs.mlnx (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Nov
 2020 06:40:34 +0000
From: Parav Pandit <parav@nvidia.com>
To: <virtualization@lists.linux-foundation.org>
Subject: [PATCH 7/7] vdpa/vdpa_sim: Enable user to create vdpasim net devices
Date: Thu, 12 Nov 2020 08:40:05 +0200
Message-ID: <20201112064005.349268-8-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201112064005.349268-1-parav@nvidia.com>
References: <20201112064005.349268-1-parav@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605163229; bh=KJ3AOJWMJTMztY+TXdCv61rtyZGand4171XiGUabLAI=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=X3AME2CEGukSsNJizi2DRuLJDHos1YyLKY9cOrHZFFXkoj/mtFQgJ27+8gYsA3DTm
 1W/3RVB7+LaLpNszZOu1MfeP/fVjfpD1NJMqGEeOK/dT2+1xo7SSumUw3X48rdfZQX
 C4XxqO3HVRY/Jhf4sJZeQq0Krqu9HuKq4ddWqlVe91oKkNRwhm/gt1odNlM4uiqiVr
 /u3dIPJpE7f1xq6FGAFIaGE5HukcuhnPr8s/W+VjQnkv3klAJZPUEe2O1kq4IIErCX
 eryY7iuEpfSCkQm/DJRpqbNsMhIJmgEAcg8uWhpzi6MRm+FcVmx9wTisQChP7BeH7S
 hO3dwU1arQYFQ==
Cc: netdev@vger.kernel.org, elic@nvidia.com, mst@redhat.com
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

Enable user to create vdpasim net simulate devices.

Show vdpa parent device that supports creating, deleting vdpa devices.

$ vdpa parentdev show
vdpasim:
  supported_classes
    net

$ vdpa parentdev show -jp
{
    "show": {
        "vdpasim": {
            "supported_classes": {
              "net"
        }
    }
}

Create a vdpa device of type networking named as "foo2" from
the parent device vdpasim:

$ vdpa dev add parentdev vdpasim type net name foo2

Show the newly created vdpa device by its name:
$ vdpa dev show foo2
foo2: type network parentdev vdpasim vendor_id 0 max_vqs 2 max_vq_size 256

$ vdpa dev show foo2 -jp
{
    "dev": {
        "foo2": {
            "type": "network",
            "parentdev": "vdpasim",
            "vendor_id": 0,
            "max_vqs": 2,
            "max_vq_size": 256
        }
    }
}

Delete the vdpa device after its use:
$ vdpa dev del foo2

Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Eli Cohen <elic@nvidia.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 81 +++++++++++++++++++++++++++-----
 1 file changed, 69 insertions(+), 12 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index aed1bb7770ab..85776e4e6749 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -28,6 +28,7 @@
 #include <linux/vhost_iotlb.h>
 #include <uapi/linux/virtio_config.h>
 #include <uapi/linux/virtio_net.h>
+#include <uapi/linux/vdpa.h>
 
 #define DRV_VERSION  "0.1"
 #define DRV_AUTHOR   "Jason Wang <jasowang@redhat.com>"
@@ -42,6 +43,17 @@ static char *macaddr;
 module_param(macaddr, charp, 0);
 MODULE_PARM_DESC(macaddr, "Ethernet MAC address");
 
+static struct vdpa_parent_dev parent_dev;
+
+static void vdpasim_parent_release(struct device *dev)
+{
+}
+
+static struct device vdpasim_parent = {
+	.init_name = "vdpasim",
+	.release = vdpasim_parent_release,
+};
+
 struct vdpasim_virtqueue {
 	struct vringh vring;
 	struct vringh_kiov iov;
@@ -101,8 +113,6 @@ static inline __virtio16 cpu_to_vdpasim16(struct vdpasim *vdpasim, u16 val)
 	return __cpu_to_virtio16(vdpasim_is_little_endian(vdpasim), val);
 }
 
-static struct vdpasim *vdpasim_dev;
-
 static struct vdpasim *vdpa_to_sim(struct vdpa_device *vdpa)
 {
 	return container_of(vdpa, struct vdpasim, vdpa);
@@ -345,7 +355,7 @@ static const struct dma_map_ops vdpasim_dma_ops = {
 static const struct vdpa_config_ops vdpasim_net_config_ops;
 static const struct vdpa_config_ops vdpasim_net_batch_config_ops;
 
-static struct vdpasim *vdpasim_create(void)
+static struct vdpasim *vdpasim_create(const char *name)
 {
 	const struct vdpa_config_ops *ops;
 	struct vdpasim *vdpasim;
@@ -357,7 +367,7 @@ static struct vdpasim *vdpasim_create(void)
 	else
 		ops = &vdpasim_net_config_ops;
 
-	vdpasim = vdpa_alloc_device(struct vdpasim, vdpa, NULL, ops, VDPASIM_VQ_NUM, NULL);
+	vdpasim = vdpa_alloc_device(struct vdpasim, vdpa, NULL, ops, VDPASIM_VQ_NUM, name);
 	if (!vdpasim)
 		goto err_alloc;
 
@@ -393,7 +403,8 @@ static struct vdpasim *vdpasim_create(void)
 	vringh_set_iotlb(&vdpasim->vqs[1].vring, vdpasim->iommu);
 
 	vdpasim->vdpa.dma_dev = dev;
-	ret = vdpa_register_device(&vdpasim->vdpa);
+	vdpasim->vdpa.pdev = &parent_dev;
+	ret = _vdpa_register_device(&vdpasim->vdpa);
 	if (ret)
 		goto err_iommu;
 
@@ -714,21 +725,67 @@ static const struct vdpa_config_ops vdpasim_net_batch_config_ops = {
 	.free                   = vdpasim_free,
 };
 
+static struct vdpa_device *
+vdpa_dev_add(struct vdpa_parent_dev *pdev, const char *name, u32 device_id)
+{
+	struct vdpasim *simdev;
+
+	if (device_id != VIRTIO_ID_NET)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	simdev = vdpasim_create(name);
+	if (IS_ERR(simdev))
+		return (struct vdpa_device *)simdev;
+
+	return &simdev->vdpa;
+}
+
+static void vdpa_dev_del(struct vdpa_parent_dev *pdev, struct vdpa_device *dev)
+{
+	struct vdpasim *simdev = container_of(dev, struct vdpasim, vdpa);
+
+	_vdpa_unregister_device(&simdev->vdpa);
+}
+
+static const struct vdpa_dev_ops vdpa_dev_parent_ops = {
+	.dev_add = vdpa_dev_add,
+	.dev_del = vdpa_dev_del
+};
+
+static struct virtio_device_id id_table[] = {
+	{ VIRTIO_ID_NET, VIRTIO_DEV_ANY_ID },
+	{ 0 },
+};
+
+static struct vdpa_parent_dev parent_dev = {
+	.device = &vdpasim_parent,
+	.id_table = id_table,
+	.ops = &vdpa_dev_parent_ops,
+};
+
 static int __init vdpasim_dev_init(void)
 {
-	vdpasim_dev = vdpasim_create();
+	int ret;
 
-	if (!IS_ERR(vdpasim_dev))
-		return 0;
+	ret = device_register(&vdpasim_parent);
+	if (ret)
+		return ret;
+
+	ret = vdpa_parentdev_register(&parent_dev);
+	if (ret)
+		goto parent_err;
 
-	return PTR_ERR(vdpasim_dev);
+	return 0;
+
+parent_err:
+	device_unregister(&vdpasim_parent);
+	return ret;
 }
 
 static void __exit vdpasim_dev_exit(void)
 {
-	struct vdpa_device *vdpa = &vdpasim_dev->vdpa;
-
-	vdpa_unregister_device(vdpa);
+	vdpa_parentdev_unregister(&parent_dev);
+	device_unregister(&vdpasim_parent);
 }
 
 module_init(vdpasim_dev_init)
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
