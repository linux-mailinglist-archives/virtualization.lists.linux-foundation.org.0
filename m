Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 50449323751
	for <lists.virtualization@lfdr.de>; Wed, 24 Feb 2021 07:19:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8A7A6F5C2;
	Wed, 24 Feb 2021 06:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7I3AW3ykzoGN; Wed, 24 Feb 2021 06:19:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A8D6F5D0;
	Wed, 24 Feb 2021 06:19:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1D18C0001;
	Wed, 24 Feb 2021 06:19:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6C69C0016
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 06:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9D1C4307B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 06:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UN0NFXaJH2mn
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 06:19:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45ADB414ED
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 06:19:04 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6035efd70003>; Tue, 23 Feb 2021 22:19:03 -0800
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 24 Feb 2021 06:19:02 +0000
From: Parav Pandit <parav@nvidia.com>
To: <virtualization@lists.linux-foundation.org>
Subject: [PATCH linux-next 5/9] vdpa_sim_net: Remove redundant get_config
 callback
Date: Wed, 24 Feb 2021 08:18:40 +0200
Message-ID: <20210224061844.137776-6-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224061844.137776-1-parav@nvidia.com>
References: <20210224061844.137776-1-parav@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614147543; bh=jQjaDuBmTBsGCSZcsuBrVRJUIQEyaNUNYjgXpjeqD28=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=EdqGrvd1O6sOMOxFzSlujNGWQL2dSlyOAEqer1OI0x+gdauKpzetFsDTiappezsgK
 NqYsNCjRR+AOaCmfaNojlaj4M6LSExWZYTxVgZjBpTOLu7LK5nEdy77w9pQ18D9SIm
 IF2mNSiuQOsUQhjne5k6BJraAxYYAF/BpWfuSTYeiD8dLdC86oO1kVKN6H1oZL6KOO
 zgpLeeHJC2ru8AKcnSXIA2T+pPKhr7mirkR1xZY/HhZgX+B4c50fmV+So2PlU0fMMA
 gJhwt6P1bO9SCl2fQMGLVnvwt4zM3659Jb/AU0uHfStpfBbdCkX+gFk1RrUz8x/Ean
 ZSLQq+B4kmtjg==
Cc: Eli Cohen <elic@nvidia.com>, mst@redhat.com
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

Now that mac address and mtu are set in the vdpa_sim allocated config
space and read from the vdpa_sim maintained memory area, remove
get_config callback implementation.

Link status is setup only once, set up once after config space is
allocated by the vdpa_sim.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Eli Cohen <elic@nvidia.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim_net.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
index 6e941b0e7935..61f1d37d8d60 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
@@ -102,14 +102,6 @@ static void vdpasim_net_work(struct work_struct *work)
 	spin_unlock(&vdpasim->lock);
 }
 
-static void vdpasim_net_get_config(struct vdpasim *vdpasim, void *config)
-{
-	struct virtio_net_config *net_config =
-		(struct virtio_net_config *)config;
-
-	net_config->status = cpu_to_vdpasim16(vdpasim, VIRTIO_NET_S_LINK_UP);
-}
-
 static void vdpasim_net_mgmtdev_release(struct device *dev)
 {
 }
@@ -137,7 +129,6 @@ static int vdpasim_net_dev_add(struct vdpa_mgmt_dev *mdev, const char *name)
 	dev_attr.supported_features = VDPASIM_NET_FEATURES;
 	dev_attr.nvqs = VDPASIM_NET_VQ_NUM;
 	dev_attr.config_size = sizeof(struct virtio_net_config);
-	dev_attr.get_config = vdpasim_net_get_config;
 	dev_attr.work_fn = vdpasim_net_work;
 	dev_attr.buffer_size = PAGE_SIZE;
 
@@ -148,6 +139,7 @@ static int vdpasim_net_dev_add(struct vdpa_mgmt_dev *mdev, const char *name)
 	cfg = simdev->config;
 	eth_random_addr(cfg->mac);
 	cfg->mtu = cpu_to_vdpasim16(simdev, 1500);
+	cfg->status = cpu_to_vdpasim16(simdev, VIRTIO_NET_S_LINK_UP);
 
 	ret = _vdpa_register_device(&simdev->vdpa);
 	if (ret)
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
