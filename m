Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEC333C22B
	for <lists.virtualization@lfdr.de>; Mon, 15 Mar 2021 17:37:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75B1F4E2AC;
	Mon, 15 Mar 2021 16:37:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tp3lPON25BpZ; Mon, 15 Mar 2021 16:37:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0042C4E51E;
	Mon, 15 Mar 2021 16:37:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98665C0001;
	Mon, 15 Mar 2021 16:37:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5FCAC0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B85936F5BA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQqgxyfswMdX
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:37:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6EF16F59B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615826228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U8vUFAmjRmjmnzMs61Tq8yFKJeXqpEIeLAUIhyE/5+k=;
 b=MEJG96W9fL6LolbbFsMZay8+S8WfuMf+VDxJBlHEiwQH6bHYQx45TTXhHH1pR+uvE7tZyZ
 zwcN+6EQVxK29irO1mdz/46Oh//F7cZwrUZV5G6eLg9edQeRlkiYCsA70ir3a/G63AnOk7
 G23HH9SszcQ44kDunp48X16JQ4bvIUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-rnp7GeiANpG-K6VdCCLdvg-1; Mon, 15 Mar 2021 12:37:05 -0400
X-MC-Unique: rnp7GeiANpG-K6VdCCLdvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22B4C8015BD;
 Mon, 15 Mar 2021 16:37:03 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-114-1.ams2.redhat.com [10.36.114.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8AC55D705;
 Mon, 15 Mar 2021 16:37:00 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v4 14/14] vdpa_sim_blk: add support for vdpa management tool
Date: Mon, 15 Mar 2021 17:34:50 +0100
Message-Id: <20210315163450.254396-15-sgarzare@redhat.com>
In-Reply-To: <20210315163450.254396-1-sgarzare@redhat.com>
References: <20210315163450.254396-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xie Yongji <xieyongji@bytedance.com>, Stefan Hajnoczi <stefanha@redhat.com>
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

Enable the user to create vDPA block simulator devices using the
vdpa management tool:

    # Show vDPA supported devices
    $ vdpa mgmtdev show
    vdpasim_blk:
      supported_classes block

    # Create a vDPA block device named as 'blk0' from the management
    # device vdpasim:
    $ vdpa dev add mgmtdev vdpasim_blk name blk0

    # Show the info of the 'blk0' device just created
    $ vdpa dev show blk0 -jp
    {
        "dev": {
            "blk0": {
                "type": "block",
                "mgmtdev": "vdpasim_blk",
                "vendor_id": 0,
                "max_vqs": 1,
                "max_vq_size": 256
            }
        }
    }

    # Delete the vDPA device after its use
    $ vdpa dev del blk0

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c | 76 +++++++++++++++++++++++-----
 1 file changed, 63 insertions(+), 13 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
index 643ae3bc62c0..5bfe1c281645 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
@@ -37,7 +37,6 @@
 #define VDPASIM_BLK_SEG_MAX	32
 #define VDPASIM_BLK_VQ_NUM	1
 
-static struct vdpasim *vdpasim_blk_dev;
 static char vdpasim_blk_id[VIRTIO_BLK_ID_BYTES] = "vdpa_blk_sim";
 
 static bool vdpasim_blk_check_range(u64 start_sector, size_t range_size)
@@ -241,11 +240,23 @@ static void vdpasim_blk_get_config(struct vdpasim *vdpasim, void *config)
 	blk_config->blk_size = cpu_to_vdpasim32(vdpasim, SECTOR_SIZE);
 }
 
-static int __init vdpasim_blk_init(void)
+static void vdpasim_blk_mgmtdev_release(struct device *dev)
+{
+}
+
+static struct device vdpasim_blk_mgmtdev = {
+	.init_name = "vdpasim_blk",
+	.release = vdpasim_blk_mgmtdev_release,
+};
+
+static int vdpasim_blk_dev_add(struct vdpa_mgmt_dev *mdev, const char *name)
 {
 	struct vdpasim_dev_attr dev_attr = {};
+	struct vdpasim *simdev;
 	int ret;
 
+	dev_attr.mgmt_dev = mdev;
+	dev_attr.name = name;
 	dev_attr.id = VIRTIO_ID_BLOCK;
 	dev_attr.supported_features = VDPASIM_BLK_FEATURES;
 	dev_attr.nvqs = VDPASIM_BLK_VQ_NUM;
@@ -254,29 +265,68 @@ static int __init vdpasim_blk_init(void)
 	dev_attr.work_fn = vdpasim_blk_work;
 	dev_attr.buffer_size = VDPASIM_BLK_CAPACITY << SECTOR_SHIFT;
 
-	vdpasim_blk_dev = vdpasim_create(&dev_attr);
-	if (IS_ERR(vdpasim_blk_dev)) {
-		ret = PTR_ERR(vdpasim_blk_dev);
-		goto out;
-	}
+	simdev = vdpasim_create(&dev_attr);
+	if (IS_ERR(simdev))
+		return PTR_ERR(simdev);
 
-	ret = vdpa_register_device(&vdpasim_blk_dev->vdpa, VDPASIM_BLK_VQ_NUM);
+	ret = _vdpa_register_device(&simdev->vdpa, VDPASIM_BLK_VQ_NUM);
 	if (ret)
 		goto put_dev;
 
 	return 0;
 
 put_dev:
-	put_device(&vdpasim_blk_dev->vdpa.dev);
-out:
+	put_device(&simdev->vdpa.dev);
 	return ret;
 }
 
-static void __exit vdpasim_blk_exit(void)
+static void vdpasim_blk_dev_del(struct vdpa_mgmt_dev *mdev,
+				struct vdpa_device *dev)
 {
-	struct vdpa_device *vdpa = &vdpasim_blk_dev->vdpa;
+	struct vdpasim *simdev = container_of(dev, struct vdpasim, vdpa);
+
+	_vdpa_unregister_device(&simdev->vdpa);
+}
+
+static const struct vdpa_mgmtdev_ops vdpasim_blk_mgmtdev_ops = {
+	.dev_add = vdpasim_blk_dev_add,
+	.dev_del = vdpasim_blk_dev_del
+};
 
-	vdpa_unregister_device(vdpa);
+static struct virtio_device_id id_table[] = {
+	{ VIRTIO_ID_BLOCK, VIRTIO_DEV_ANY_ID },
+	{ 0 },
+};
+
+static struct vdpa_mgmt_dev mgmt_dev = {
+	.device = &vdpasim_blk_mgmtdev,
+	.id_table = id_table,
+	.ops = &vdpasim_blk_mgmtdev_ops,
+};
+
+static int __init vdpasim_blk_init(void)
+{
+	int ret;
+
+	ret = device_register(&vdpasim_blk_mgmtdev);
+	if (ret)
+		return ret;
+
+	ret = vdpa_mgmtdev_register(&mgmt_dev);
+	if (ret)
+		goto parent_err;
+
+	return 0;
+
+parent_err:
+	device_unregister(&vdpasim_blk_mgmtdev);
+	return ret;
+}
+
+static void __exit vdpasim_blk_exit(void)
+{
+	vdpa_mgmtdev_unregister(&mgmt_dev);
+	device_unregister(&vdpasim_blk_mgmtdev);
 }
 
 module_init(vdpasim_blk_init)
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
