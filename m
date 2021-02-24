Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AD6323756
	for <lists.virtualization@lfdr.de>; Wed, 24 Feb 2021 07:19:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21C6C4EBCA;
	Wed, 24 Feb 2021 06:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QM-MkJdc7pxK; Wed, 24 Feb 2021 06:19:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 989C54EBD0;
	Wed, 24 Feb 2021 06:19:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FB4FC0013;
	Wed, 24 Feb 2021 06:19:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 226A9C001F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 06:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E38A44EBD6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 06:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uRpmuVFE-o3P
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 06:19:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 172224EB9D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 06:19:05 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6035efd90001>; Tue, 23 Feb 2021 22:19:05 -0800
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 24 Feb 2021 06:19:04 +0000
From: Parav Pandit <parav@nvidia.com>
To: <virtualization@lists.linux-foundation.org>
Subject: [PATCH linux-next 8/9] vdpa/mlx5: Support configuration of MAC
Date: Wed, 24 Feb 2021 08:18:43 +0200
Message-ID: <20210224061844.137776-9-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224061844.137776-1-parav@nvidia.com>
References: <20210224061844.137776-1-parav@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614147545; bh=3fKHKuwGgoXgK/sEIfHUZQ4OWTgpkIbwLZbKGZv4DyM=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=Sf47nKtOp9Ao46DSsyu5+yd3iQ4pw0PVrzLGsZNlyuuay6EVnCKaqCFIVGzYg/Zgw
 dtiX/ZviH3sdpuiiimuA4ToNbJZLjmkFIR6K2fetTVQgg7CWVthu/tsX/TSyOVQvnm
 oWTaP3y5EyxOLdrjLonUUZaGneGEmUjXaui3lLJhhXFhRfU5J6Y9AQ6vMgDfCHbhUq
 jHxKcDqIfRv0dWTSxiRjjBATn1dDkgOg8+zIyvEW5M6RFpJQtLuCtnhHIQ/2l2lmOu
 kLXLxG9Vlwkw2P4zi6iiE75UbpL6ANlCh1Y5AiUk1SINca340obBkNBIBvRFImjx6k
 pYBKNUqUSfAjg==
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

From: Eli Cohen <elic@nvidia.com>

Add code to accept MAC configuration through vdpa tool. The MAC is
written into the config struct and later can be retrieved through
get_config().

Examples:
1. Configure MAC:
$ vdpa dev config set vdpa0 mac 00:11:22:33:44:55

2. Show configured params:
$ vdpa dev config show
vdpa0: mac 00:11:22:33:44:55 link down link_announce false mtu 0 speed 0 duplex 0

Signed-off-by: Eli Cohen <elic@nvidia.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
---
 drivers/vdpa/mlx5/net/mlx5_vnet.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index ece2183e7b20..51a3fc4cde4d 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -1972,6 +1972,22 @@ struct mlx5_vdpa_mgmtdev {
 	struct mlx5_vdpa_net *ndev;
 };
 
+static int mlx5_vdpa_net_dev_config_set(struct vdpa_mgmt_dev *v_mdev,
+					struct vdpa_device *vdev,
+					const struct vdpa_dev_config_set_attr *attrs)
+{
+	struct mlx5_vdpa_mgmtdev *mgtdev = container_of(v_mdev, struct mlx5_vdpa_mgmtdev, mgtdev);
+	struct mlx5_vdpa_net *ndev = mgtdev->ndev;
+
+	if (attrs->mask.mtu_valid)
+		return -EOPNOTSUPP;
+
+	if (attrs->mask.mac_valid)
+		memcpy(ndev->config.mac, attrs->cfg.mac, ETH_ALEN);
+
+	return 0;
+}
+
 static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name)
 {
 	struct mlx5_vdpa_mgmtdev *mgtdev = container_of(v_mdev, struct mlx5_vdpa_mgmtdev, mgtdev);
@@ -2044,6 +2060,7 @@ static void mlx5_vdpa_dev_del(struct vdpa_mgmt_dev *v_mdev, struct vdpa_device *
 static const struct vdpa_mgmtdev_ops mdev_ops = {
 	.dev_add = mlx5_vdpa_dev_add,
 	.dev_del = mlx5_vdpa_dev_del,
+	.dev_config_set = mlx5_vdpa_net_dev_config_set,
 };
 
 static struct virtio_device_id id_table[] = {
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
