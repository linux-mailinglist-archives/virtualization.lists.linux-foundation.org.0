Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1247811891D
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 14:05:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7010187645;
	Tue, 10 Dec 2019 13:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wmfraG8T43K; Tue, 10 Dec 2019 13:05:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F024887684;
	Tue, 10 Dec 2019 13:05:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9927C0881;
	Tue, 10 Dec 2019 13:05:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 559A3C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 41DCA87645
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FJ52yoAJDMUI
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:05:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 78AB387657
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575983099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eNW85TJiVrfXL/ZGCG2VfYculhggK+TL5+4s0Y/nnQ=;
 b=ce1UR3CpE4y/k4EUbjyl4ZIhwJYFHWjErayZIBXJb/TTwP7YcGL8a/WNfdlw1zaBKXW8lw
 1RAYJxZ3LUxYN9FnRYX4FMSp429nJmxQfY58mMvIAIz3JVSu5tc3Tf4coCXnnrmqfVBEqk
 bZ89ZRFcIIxJo2P0oSM6strEYiXvk6g=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-6EqRtC_1MtmOJtFoXvHQ2Q-1; Tue, 10 Dec 2019 08:04:58 -0500
Received: by mail-qt1-f198.google.com with SMTP id q17so1812343qtc.8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 05:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h9ppGS7fm6SZMGx/U7neET6k7mTCQfQI5kEQjvcd/YA=;
 b=lB5llFx3q1LFVGEBsdBgCDtRIXCJMT4LuBo3Rczmu2g1JbdgnMmYyoBBEEbZNQgfzW
 nqoJYPAiQn7WFOKkvVH8fLt59nfhowmE1zK3svCLztpA14t3jVSNJSlG39/gDuKqgv8S
 myOSne4nDdarpEj0QF+CAqXfWSkcBfgMoHgk2PtdhcYntm/iRB8NVvydu9+pp/BhQoIq
 8FDVn43OsulrydpOMOWD2gQKK+wdiOSyMXv7OCexqUdL21/EP9/zUAC1Z1M4Ygy/+7ZD
 sWIc/xLxTDrOH7Rt2DKrbb0YKF8dfIGtkqtSGjnTW3iI6pOOkr/ekcMPPsQbh28cb7Il
 shUQ==
X-Gm-Message-State: APjAAAUKD6mTqX3NOAa5Ii7B1P8Sb7dmJgnLcYfdmRxx8qFHnCtPIYoz
 Z0II+l16EQ/yCOVOH6bbm/FssBxqYcjfetO9BMkKHxH539N1Em2cptSM/NBxcy/mlXEeLGdqpOv
 JMtYKtIoH/v39a1DdiYVOBqqzPsF4gRzt/KRbWsFLHw==
X-Received: by 2002:ac8:936:: with SMTP id t51mr27723078qth.212.1575983096239; 
 Tue, 10 Dec 2019 05:04:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqzWPe3g8zfEiNjmoeJrevzpnBuyLsoh4sh45qptZPEMLWSJ0KDxY9JnMocSEHn/0pDfmr1CGQ==
X-Received: by 2002:ac8:936:: with SMTP id t51mr27723059qth.212.1575983095995; 
 Tue, 10 Dec 2019 05:04:55 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id d23sm1112811qte.32.2019.12.10.05.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 05:04:55 -0800 (PST)
Date: Tue, 10 Dec 2019 08:04:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org, Julio Faracco <jcfaracco@gmail.com>
Subject: [PATCH net-next v10 2/3] mlx4: use new txqueue timeout argument
Message-ID: <20191210130014.47179-3-mst@redhat.com>
References: <20191210130014.47179-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191210130014.47179-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-MC-Unique: 6EqRtC_1MtmOJtFoXvHQ2Q-1
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
