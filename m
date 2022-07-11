Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id CA66D568CDB
	for <lists.virtualization@lfdr.de>; Wed,  6 Jul 2022 17:32:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD6B181298;
	Wed,  6 Jul 2022 15:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD6B181298
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d85yc1fX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KxmpZHbH3CqQ; Wed,  6 Jul 2022 15:32:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 923A28124D;
	Wed,  6 Jul 2022 15:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 923A28124D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8131C0077;
	Wed,  6 Jul 2022 15:32:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3C3EC002D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 15:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C96B605E8
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 15:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C96B605E8
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=d85yc1fX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HDKed5_FHAry
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 15:32:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89E85605D5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89E85605D5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 15:32:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D186F61FED;
 Wed,  6 Jul 2022 15:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70AFC341C8;
 Wed,  6 Jul 2022 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657121532;
 bh=XuABzMacapUPj02uf/mQtFYuIsg4w+Lm1rTeYvXdPwA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d85yc1fXPTuo+5DTb9lZNpk3qdvpsTD35tRcvdoreP264b02QrZZRznufYjVb+cpv
 ehg3jM5DVRJICo0rXpwRd9RHxISYdy9OEU7+reFwFfRElI0zn68hhPD8Wt9/X55wf4
 xvbJFIDa9POTFiMVU+wURc5pgBR2LHPWYQWZutPkfcaW0Xh8Jr+1m+z+By1QxFA08F
 o1SoHlPt1xSK672Jup0qRZe/Ph17BvpluyRNc/IdNry1IGGmnk/bTng4hE2dcZeLS0
 ZFrtrcCa77ULktqktGxQPJI9sOuqttbpdMy/6+h2uozboGQaLMvCRY49q1TiRpqpm3
 VND35yVOfD3Ug==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 04/18] vduse: Tie vduse mgmtdev and its device
Date: Wed,  6 Jul 2022 11:31:39 -0400
Message-Id: <20220706153153.1598076-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220706153153.1598076-1-sashal@kernel.org>
References: <20220706153153.1598076-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, guanjun@linux.alibaba.com,
 "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Xie Yongji <xieyongji@bytedance.com>, gautam.dawar@xilinx.com, elic@nvidia.com,
 dan.carpenter@oracle.com
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

From: Parav Pandit <parav@nvidia.com>

[ Upstream commit 0e0348ac3f0a6e6606f1aa5acb1803ada913aa3d ]

vduse devices are not backed by any real devices such as PCI. Hence it
doesn't have any parent device linked to it.

Kernel driver model in [1] suggests to avoid an empty device
release callback.

Hence tie the mgmtdevice object's life cycle to an allocate dummy struct
device instead of static one.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/core-api/kobject.rst?h=v5.18-rc7#n284

Signed-off-by: Parav Pandit <parav@nvidia.com>
Message-Id: <20220613195223.473966-1-parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Xie Yongji <xieyongji@bytedance.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/vdpa/vdpa_user/vduse_dev.c | 60 ++++++++++++++++++------------
 1 file changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index 9270398caf15..73e67fa88972 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -1466,16 +1466,12 @@ static char *vduse_devnode(struct device *dev, umode_t *mode)
 	return kasprintf(GFP_KERNEL, "vduse/%s", dev_name(dev));
 }
 
-static void vduse_mgmtdev_release(struct device *dev)
-{
-}
-
-static struct device vduse_mgmtdev = {
-	.init_name = "vduse",
-	.release = vduse_mgmtdev_release,
+struct vduse_mgmt_dev {
+	struct vdpa_mgmt_dev mgmt_dev;
+	struct device dev;
 };
 
-static struct vdpa_mgmt_dev mgmt_dev;
+static struct vduse_mgmt_dev *vduse_mgmt;
 
 static int vduse_dev_init_vdpa(struct vduse_dev *dev, const char *name)
 {
@@ -1500,7 +1496,7 @@ static int vduse_dev_init_vdpa(struct vduse_dev *dev, const char *name)
 	}
 	set_dma_ops(&vdev->vdpa.dev, &vduse_dev_dma_ops);
 	vdev->vdpa.dma_dev = &vdev->vdpa.dev;
-	vdev->vdpa.mdev = &mgmt_dev;
+	vdev->vdpa.mdev = &vduse_mgmt->mgmt_dev;
 
 	return 0;
 }
@@ -1545,34 +1541,52 @@ static struct virtio_device_id id_table[] = {
 	{ 0 },
 };
 
-static struct vdpa_mgmt_dev mgmt_dev = {
-	.device = &vduse_mgmtdev,
-	.id_table = id_table,
-	.ops = &vdpa_dev_mgmtdev_ops,
-};
+static void vduse_mgmtdev_release(struct device *dev)
+{
+	struct vduse_mgmt_dev *mgmt_dev;
+
+	mgmt_dev = container_of(dev, struct vduse_mgmt_dev, dev);
+	kfree(mgmt_dev);
+}
 
 static int vduse_mgmtdev_init(void)
 {
 	int ret;
 
-	ret = device_register(&vduse_mgmtdev);
-	if (ret)
+	vduse_mgmt = kzalloc(sizeof(*vduse_mgmt), GFP_KERNEL);
+	if (!vduse_mgmt)
+		return -ENOMEM;
+
+	ret = dev_set_name(&vduse_mgmt->dev, "vduse");
+	if (ret) {
+		kfree(vduse_mgmt);
 		return ret;
+	}
 
-	ret = vdpa_mgmtdev_register(&mgmt_dev);
+	vduse_mgmt->dev.release = vduse_mgmtdev_release;
+
+	ret = device_register(&vduse_mgmt->dev);
 	if (ret)
-		goto err;
+		goto dev_reg_err;
 
-	return 0;
-err:
-	device_unregister(&vduse_mgmtdev);
+	vduse_mgmt->mgmt_dev.id_table = id_table;
+	vduse_mgmt->mgmt_dev.ops = &vdpa_dev_mgmtdev_ops;
+	vduse_mgmt->mgmt_dev.device = &vduse_mgmt->dev;
+	ret = vdpa_mgmtdev_register(&vduse_mgmt->mgmt_dev);
+	if (ret)
+		device_unregister(&vduse_mgmt->dev);
+
+	return ret;
+
+dev_reg_err:
+	put_device(&vduse_mgmt->dev);
 	return ret;
 }
 
 static void vduse_mgmtdev_exit(void)
 {
-	vdpa_mgmtdev_unregister(&mgmt_dev);
-	device_unregister(&vduse_mgmtdev);
+	vdpa_mgmtdev_unregister(&vduse_mgmt->mgmt_dev);
+	device_unregister(&vduse_mgmt->dev);
 }
 
 static int vduse_init(void)
-- 
2.35.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
