Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA1931D545
	for <lists.virtualization@lfdr.de>; Wed, 17 Feb 2021 07:06:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3AB06F60F
	for <lists.virtualization@lfdr.de>; Wed, 17 Feb 2021 06:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYJVgi6_VBgI for <lists.virtualization@lfdr.de>;
	Wed, 17 Feb 2021 06:06:48 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 98B156F61C; Wed, 17 Feb 2021 06:06:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6807C6F5C6;
	Wed, 17 Feb 2021 06:06:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CF27C1DA9;
	Wed, 17 Feb 2021 06:06:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DB99C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 06:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 53A5586866
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 06:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IXalEHbZRk3j
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 06:06:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B1EE186660
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 06:06:31 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B602cb2670000>; Tue, 16 Feb 2021 22:06:31 -0800
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 17 Feb 2021 06:06:30 +0000
From: Parav Pandit <parav@nvidia.com>
To: <mst@redhat.com>, <virtualization@lists.linux-foundation.org>,
 <jasowang@redhat.com>
Subject: [PATCH linux-next v2] vdpa: Fix memory leak in error unwinding path
Date: Wed, 17 Feb 2021 08:06:14 +0200
Message-ID: <20210217060614.59561-1-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1613541991; bh=I+qpsHvb3or79Z/XkLxs3wR1yOB0C7v+5jtSjtAo8Qo=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
 X-ClientProxiedBy;
 b=A9aRAnRHkRRx6Y3e1VrQKV0CuZzc7P6kT7y7hyQJN/Xa70yyijt3GDorUQxiYO0zx
 J18Ubnk6lNqAx6GOOqK9rKiTykNHvsnlkNKBpY+jgzmaO5KssG+X2Fv3RyQfFylENn
 iuLs3aFbk5VT9LIMqsfPKyu9M17vLrY2UsJxZWomQ+5sivMTWKT6RpqIX9O6qprVxe
 vgqwByqmrVrSZ+4OtbA4kfZVEAujs9LiPn7fBCays1FVrgof/Lmz0C1kaMSeyB8MRH
 vG3xxZNmA2jKn4/Qn77zPJPDV+W2zij7InElBNyaHwVGbrxyVJllSBPqgQyh9GPnXt
 lzPnNsqnPvhFQ==
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

When device get command fails to find the device or mdev,
it skips to free the skb during error unwinding path.
Fix it by freeing in error unwind path.
While at it, make error unwind path more clear to avoid such errors.

Fixes: a12a2f694ce8 ("vdpa: Enable user to query vdpa device info")
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v1->v2:
 - Addressed Stefano's comment to make error unwind code more clear
---
 drivers/vdpa/vdpa.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 3d997b389345..da67f07e24fd 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -538,22 +538,22 @@ static int vdpa_nl_cmd_dev_get_doit(struct sk_buff *skb, struct genl_info *info)
 	mutex_lock(&vdpa_dev_mutex);
 	dev = bus_find_device(&vdpa_bus, NULL, devname, vdpa_name_match);
 	if (!dev) {
-		mutex_unlock(&vdpa_dev_mutex);
 		NL_SET_ERR_MSG_MOD(info->extack, "device not found");
-		return -ENODEV;
+		err = -ENODEV;
+		goto err;
 	}
 	vdev = container_of(dev, struct vdpa_device, dev);
 	if (!vdev->mdev) {
-		mutex_unlock(&vdpa_dev_mutex);
-		put_device(dev);
-		return -EINVAL;
+		err = -EINVAL;
+		goto mdev_err;
 	}
 	err = vdpa_dev_fill(vdev, msg, info->snd_portid, info->snd_seq, 0, info->extack);
 	if (!err)
 		err = genlmsg_reply(msg, info);
+mdev_err:
 	put_device(dev);
+err:
 	mutex_unlock(&vdpa_dev_mutex);
-
 	if (err)
 		nlmsg_free(msg);
 	return err;
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
