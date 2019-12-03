Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEF21105E1
	for <lists.virtualization@lfdr.de>; Tue,  3 Dec 2019 21:19:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 703172043A;
	Tue,  3 Dec 2019 20:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kO8Az0hwA6DX; Tue,  3 Dec 2019 20:19:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4F70C227F7;
	Tue,  3 Dec 2019 20:19:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 329C0C087F;
	Tue,  3 Dec 2019 20:19:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F99BC087F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 20:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3B418227A3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 20:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09gE0e1VAxdL
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 20:19:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 579412043A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 20:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575404390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvoBxuvp3G0/XLbvffQRipup1lCyNBJiGiUdnNoPbls=;
 b=h7QOH9fKDTe8uO3xFTJ2KhQsA2cB/McXPPrqBTcP1ehOQd75gWcC0D0JDfzTEWefqzByjS
 F5AKsNzJx4ate24mJFyEsBhJetX8KOeRfdlWxfecIqHFNE0VoZYKHvCu3cLTfH4k7q0R1K
 6BcdOBQOC0zT8DTl0yZi35pV41pS4j4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-ExAyjBMEM4O9M_5l5dzQnA-1; Tue, 03 Dec 2019 15:19:48 -0500
Received: by mail-qt1-f197.google.com with SMTP id j14so3314628qtr.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Dec 2019 12:19:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QmtzDLYDSTNcDSWhu8MKh0ZRRQ2IxQ2t+dts0IfGnuc=;
 b=QMAZNO/PfxrdxPQPaM8WSU02Ma3f37qKN5oixOeWjvFCkIJl9Il+KUM6tFMuzDYstK
 nBMPwDM5jlr5vLMkTgRwM+6yuu6wa/TbJY2kndO/qDuwiuxExBJRw+JjdYBqdA5evRJf
 YXVFEMeFrJsKcK+yzGCDyTs3xcalMYyrkkyRI+27EyXjbIG0/awTTvbCJ34e2X835Jyo
 LHdozzvwGg1aU6IWhGbA/Za6IKGh24TCPDPGV1T0Hm6Ox0J0p3pLZmovFPWcUK6/Qh7j
 XO3SJokf/2nYWHh38TlTxEFJpOCXT24wDkKxMEtajYLaAKSItcNIXr41gtmOSRcJWT9d
 tyng==
X-Gm-Message-State: APjAAAUg0cAG7adCxN8zGAFTI7m6u3X3xMR4VhAbewVZd4SLTeEj0tcH
 usLDPLW1zpuc9boO5n8XlSgUXeP1+Cb9gV6yBYqZHLEGWwkRN9Lng+i3GAe1yn8LMmTftDaUMqK
 bipUx5L9xueuVXdMqjeXEyUiazeNaOXksCHtbKVNmpw==
X-Received: by 2002:a05:620a:210e:: with SMTP id
 l14mr7328299qkl.18.1575404388181; 
 Tue, 03 Dec 2019 12:19:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqzNAGftONrxG7OOOmA1p2XeS+kBT15c+ObkoyL77kRsuzntoDuyINOMAAxBlSMFnthhkga2lw==
X-Received: by 2002:a05:620a:210e:: with SMTP id
 l14mr7328279qkl.18.1575404387958; 
 Tue, 03 Dec 2019 12:19:47 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id s44sm2425816qts.22.2019.12.03.12.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 12:19:47 -0800 (PST)
Date: Tue, 3 Dec 2019 15:19:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org, Julio Faracco <jcfaracco@gmail.com>
Subject: [PATCH RFC net-next v8 2/3] mlx4: use new txqueue timeout argument
Message-ID: <20191203201804.662066-3-mst@redhat.com>
References: <20191203201804.662066-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191203201804.662066-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-MC-Unique: ExAyjBMEM4O9M_5l5dzQnA-1
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

changes from v7:
	build fix

 drivers/net/ethernet/mellanox/mlx4/en_netdev.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
index aa348230bd39..2c2ff1f0ea6d 100644
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
