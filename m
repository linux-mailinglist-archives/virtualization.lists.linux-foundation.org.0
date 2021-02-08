Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9B9313915
	for <lists.virtualization@lfdr.de>; Mon,  8 Feb 2021 17:18:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A3A6586D63;
	Mon,  8 Feb 2021 16:17:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gtel3D9K1-Sx; Mon,  8 Feb 2021 16:17:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B4BEF86D7A;
	Mon,  8 Feb 2021 16:17:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DA5EC013A;
	Mon,  8 Feb 2021 16:17:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2ED5BC013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 16:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1DF5E86B8B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 16:17:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IY19xbDg9j8t
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 16:17:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EB29586B28
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612801071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CFslgI4BdX7W8W1Jxi7aVjgoo9QpMFhu3ejcV0QAAXo=;
 b=elUaNjopgJm77Yby7BQafYflUS1Qs40zHajO3D1MOvE5PhSyJte280244Xsx2eZWgHNzPX
 L+TiQfCguZ4WFpeK9HNszJsOxbE7PMOPTHZHsqo3jHrdWPLU/mceQKmi9GMA0e164nVI/l
 fBLNtwCayuTB4hTQIlicDEFocQ20eHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-D4XTqdr-N8OYL04EYtxZsQ-1; Mon, 08 Feb 2021 11:17:49 -0500
X-MC-Unique: D4XTqdr-N8OYL04EYtxZsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA5261966321;
 Mon,  8 Feb 2021 16:17:47 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-115-25.ams2.redhat.com
 [10.36.115.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59D5A19C59;
 Mon,  8 Feb 2021 16:17:42 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH] vdpa/mlx5: fix param validation in mlx5_vdpa_get_config()
Date: Mon,  8 Feb 2021 17:17:41 +0100
Message-Id: <20210208161741.104939-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: linux-kernel@vger.kernel.org, Eli Cohen <elic@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

It's legal to have 'offset + len' equal to
sizeof(struct virtio_net_config), since 'ndev->config' is a
'struct virtio_net_config', so we can safely copy its content under
this condition.

Fixes: 1a86b377aa21 ("vdpa/mlx5: Add VDPA driver for supported mlx5 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vdpa/mlx5/net/mlx5_vnet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index dc88559a8d49..10e9b09932eb 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -1820,7 +1820,7 @@ static void mlx5_vdpa_get_config(struct vdpa_device *vdev, unsigned int offset,
 	struct mlx5_vdpa_dev *mvdev = to_mvdev(vdev);
 	struct mlx5_vdpa_net *ndev = to_mlx5_vdpa_ndev(mvdev);
 
-	if (offset + len < sizeof(struct virtio_net_config))
+	if (offset + len <= sizeof(struct virtio_net_config))
 		memcpy(buf, (u8 *)&ndev->config + offset, len);
 }
 
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
