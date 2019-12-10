Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0B3118AB6
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 15:24:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0A78F22643;
	Tue, 10 Dec 2019 14:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KzArgarzYUgd; Tue, 10 Dec 2019 14:24:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0E7332262E;
	Tue, 10 Dec 2019 14:24:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02001C0881;
	Tue, 10 Dec 2019 14:24:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8513CC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 746D586A10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XyACBx4abGKi
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:24:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E603F866A9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575987840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1m4l6D3s+2g8XxkMBtJ4pgp0ukAmRJI6+mhxccXIzk=;
 b=BsY2OEUDdgVNd5BRVVkjDJ11txUdztibqYiWpM66ajiJbcKeBhYYex+GKa4/UxAeEBmrxO
 JyHG2Hw+qrUSN3koYE2Lp0/zV7XvQBVUNT283yT8futGnhQsaue7uTYVx6UvXlvL/N0T3I
 G1tH0AntNNuSO6fiNIGHPq4DGUH+CFA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-EA_YQ4feMDCY6SB40D5MkA-1; Tue, 10 Dec 2019 09:23:59 -0500
Received: by mail-wm1-f69.google.com with SMTP id s12so1060933wmc.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 06:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=arAx5zhnIVjaTnukE0oB8KOOT1PX3zCb62NUiTGRsxo=;
 b=kAoE1ivED62C5pt+Cnq/uD3SEGWH85Kc4B3G9undlZmWI9IM8D1VSSN9S38yN+p1tS
 lZM/0XcBA0ksFcH4CXFHxnlY76q4aovvf5uj/hZzqNby8pz91KODCY4i/EWP5dCFK9UW
 HBU2gbaUCYC7lHlXVFx71xEqSll9nnPXzP0F5rSeLhQ07olOeLAo/dIQXyCpQ9bfAfjv
 SiqrCTNVMElBUA/v+A9xr+4LUfXhFOtXPCIy9dUTD2ChjT32HeqKh9aVNn8/NW24+IFt
 6T3kzm6D+fl4BgNhHqfuzn378wml8lmbyzuv7YkE8b81qQYZDctu+f+KBZt4b3uFAS2v
 eMLA==
X-Gm-Message-State: APjAAAUr0erfNwOYhdbCE/pSDClUbvoE/2M4qOnx+dXwlMPQoflg9tuh
 Zy/0JWq+l+7P52cKIXvANf/LeyYUF4TbY5EQWBoBzGQ6d+4yFJhNZUFxHnb46/K4KDVy4XvaLFt
 OpF788G4NcOoNVo5PVCRICU5oiTEwHjFkQAk/HINW7g==
X-Received: by 2002:a05:600c:388:: with SMTP id
 w8mr5408424wmd.177.1575987837743; 
 Tue, 10 Dec 2019 06:23:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqx3iXOMR3qEF6e0xi6D2sYK7FHbDpCppXr1B3M6TQgnyG1PzoKqeN8Vu22ZrU4aPQPWYkHNDQ==
X-Received: by 2002:a05:600c:388:: with SMTP id
 w8mr5408414wmd.177.1575987837599; 
 Tue, 10 Dec 2019 06:23:57 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id a14sm3533644wrx.81.2019.12.10.06.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 06:23:57 -0800 (PST)
Date: Tue, 10 Dec 2019 09:23:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org, Julio Faracco <jcfaracco@gmail.com>
Subject: [PATCH net-next v12 2/3] mlx4: use new txqueue timeout argument
Message-ID: <20191210142305.52171-3-mst@redhat.com>
References: <20191210142305.52171-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191210142305.52171-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-MC-Unique: EA_YQ4feMDCY6SB40D5MkA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: dnmendes76@gmail.com, mst@redhat.com, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, davem@davemloft.net
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

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_netdev.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
index 71c083960a87..43dcbd8214c6 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
@@ -1367,20 +1367,14 @@ static void mlx4_en_tx_timeout(struct net_device *dev, unsigned int txqueue)
 {
 	struct mlx4_en_priv *priv = netdev_priv(dev);
 	struct mlx4_en_dev *mdev = priv->mdev;
-	int i;
+	struct mlx4_en_tx_ring *tx_ring = priv->tx_ring[TX][txqueue];
 
 	if (netif_msg_timer(priv))
 		en_warn(priv, "Tx timeout called on port:%d\n", priv->port);
 
-	for (i = 0; i < priv->tx_ring_num[TX]; i++) {
-		struct mlx4_en_tx_ring *tx_ring = priv->tx_ring[TX][i];
-
-		if (!netif_tx_queue_stopped(netdev_get_tx_queue(dev, i)))
-			continue;
-		en_warn(priv, "TX timeout on queue: %d, QP: 0x%x, CQ: 0x%x, Cons: 0x%x, Prod: 0x%x\n",
-			i, tx_ring->qpn, tx_ring->sp_cqn,
-			tx_ring->cons, tx_ring->prod);
-	}
+	en_warn(priv, "TX timeout on queue: %d, QP: 0x%x, CQ: 0x%x, Cons: 0x%x, Prod: 0x%x\n",
+		txqueue, tx_ring->qpn, tx_ring->sp_cqn,
+		tx_ring->cons, tx_ring->prod);
 
 	priv->port_stats.tx_timeout++;
 	en_dbg(DRV, priv, "Scheduling watchdog\n");
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
