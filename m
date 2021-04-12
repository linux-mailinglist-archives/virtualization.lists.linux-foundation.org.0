Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E3635CC23
	for <lists.virtualization@lfdr.de>; Mon, 12 Apr 2021 18:28:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5835F60ACD;
	Mon, 12 Apr 2021 16:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jVD2lfKcN-SU; Mon, 12 Apr 2021 16:28:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EE4760ACE;
	Mon, 12 Apr 2021 16:28:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C791BC000A;
	Mon, 12 Apr 2021 16:28:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCD20C000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 16:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB0234044D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 16:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7F8pIZnwQBR
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 16:28:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7E0D40315
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 16:28:07 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lVzPw-00086R-Sy; Mon, 12 Apr 2021 16:28:04 +0000
From: Colin King <colin.king@canonical.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@nvidia.com>, virtualization@lists.linux-foundation.org
Subject: [PATCH][next] vdpa/mlx5: Fix resource leak of mgtdev due to incorrect
 kfree
Date: Mon, 12 Apr 2021 17:28:04 +0100
Message-Id: <20210412162804.1628738-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

Static analysis is reporting a memory leak on mgtdev, it appears
that the wrong object is being kfree'd. Fix this by kfree'ing
mgtdev rather than mdev.

Addresses-Coverity: ("Resource leak")
Fixes: c8a2d4c73e70 ("vdpa/mlx5: Enable user to add/delete vdpa device")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/vdpa/mlx5/net/mlx5_vnet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index 10c5fef3c020..25533db01f5f 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -2089,7 +2089,7 @@ static int mlx5v_probe(struct auxiliary_device *adev,
 	return 0;
 
 reg_err:
-	kfree(mdev);
+	kfree(mgtdev);
 	return err;
 }
 
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
