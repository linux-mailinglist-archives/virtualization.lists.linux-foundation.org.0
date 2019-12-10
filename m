Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CECB4118944
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 14:09:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7CB638623E;
	Tue, 10 Dec 2019 13:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n5kWNAG2K4z0; Tue, 10 Dec 2019 13:09:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0CCF885F5B;
	Tue, 10 Dec 2019 13:09:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 033E8C0881;
	Tue, 10 Dec 2019 13:09:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB2B2C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE3C187645
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T53F2JkcLLrH
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:09:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id ECAFA87635
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575983390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1m4l6D3s+2g8XxkMBtJ4pgp0ukAmRJI6+mhxccXIzk=;
 b=PYCd0vKTtNkJmqsQMx/yX8xh3zjCyZUzA3fZnnIABTU0g637nRo7V8fh1mjiaTQx5RlrJS
 Q+z/n1vdq8xIX2jSDROVESOBBpd1qWxR1tGHoXsVMfkmGKbGLBtHT2KcJLyANfpVKCVcMK
 96fSxvPo5N5xJ+sNGZUiUPtb1wHQK3A=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-qicQhEr5MUitNcDLU7PZNQ-1; Tue, 10 Dec 2019 08:09:46 -0500
Received: by mail-qv1-f70.google.com with SMTP id n11so6762017qvp.15
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 05:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=arAx5zhnIVjaTnukE0oB8KOOT1PX3zCb62NUiTGRsxo=;
 b=FICvqZybrOfLKXvJAXCR/5QRUZ0hmWYipi47NU5xjTiIDNDALhKx7AUo31IkdU04+s
 /GqYFDuPRoR4YjaHL3/JCZUUkekzczSJ8++8Npzgd74haBxE+CfrZtgr2rRWONW21LxH
 5I4fHJE0leFhYcw2UoqFK9ks8T9y44G3L9IlGguxwh1s+dXEfCVE2usdRaJhyDYW1np4
 4ua3PEA8tMZ9slQ2+3uN5ERmo/DtAEkRNdiyONSKMUTRv+apkPv3iut+dvFYxw7L+AaH
 5in5anIe/oV+TeXnW2X19HOAtzvgVH18iJHGeDrTxvQCGwj0b/kiVifLqUD3dMWEmW1U
 h+XQ==
X-Gm-Message-State: APjAAAWDLIbZAUuMhWxn73tNYpFHiUVXz8lQUmpjwgORg7axzGuZduNH
 1CAhsuF1GQ+/V5GE8A49vKVRepzCk8h+tipgtd7/F8L7gsmJhqmgBwjatzlpmIn0s/wfZMlhQTj
 NwuZ01JcESnpy6dzDEaFa9+NUVMzCgYumkuJsfK/OhQ==
X-Received: by 2002:ac8:1c4e:: with SMTP id j14mr968380qtk.300.1575983385754; 
 Tue, 10 Dec 2019 05:09:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqx0NdqPQY5+CMuG066RsSLy1C9s67XUjynq5xyNWeBMJDtPlMed8sZPRLdRNcHBm75IprM/Dw==
X-Received: by 2002:ac8:1c4e:: with SMTP id j14mr968365qtk.300.1575983385613; 
 Tue, 10 Dec 2019 05:09:45 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id w29sm1102558qtc.72.2019.12.10.05.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 05:09:44 -0800 (PST)
Date: Tue, 10 Dec 2019 08:09:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org, Julio Faracco <jcfaracco@gmail.com>
Subject: [PATCH net-next v11 2/3] mlx4: use new txqueue timeout argument
Message-ID: <20191210130837.47913-3-mst@redhat.com>
References: <20191210130837.47913-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191210130837.47913-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-MC-Unique: qicQhEr5MUitNcDLU7PZNQ-1
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
