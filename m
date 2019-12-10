Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A82311890B
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 14:01:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CFF3288158;
	Tue, 10 Dec 2019 13:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7iHz9vMuK87u; Tue, 10 Dec 2019 13:01:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 67C6A87BDE;
	Tue, 10 Dec 2019 13:01:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6005AC0881;
	Tue, 10 Dec 2019 13:01:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADEB8C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9DA1B85F46
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-uqtBoiYvCs
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:01:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BA5BF85F37
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575982871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eNW85TJiVrfXL/ZGCG2VfYculhggK+TL5+4s0Y/nnQ=;
 b=XcPC93KxXzw6aiFfl0yXJegKHAs0GZVf25vPQWC6XQW7Kik/0uXyVnGYYlcj1mcYur6pO5
 rR1eGHZRnbYl/t2YjPwnHXvwn7S4cV25Vf+Z95CfmvLISWy8NhZdWSXVthaFz+dxJu8N/E
 suNfQJcqTfzkpd04BnpJz2HhzShWdZc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-5TqL6cflOeyLCg96-ZHVgg-1; Tue, 10 Dec 2019 08:01:08 -0500
Received: by mail-qk1-f199.google.com with SMTP id j1so12131168qkk.17
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 05:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h9ppGS7fm6SZMGx/U7neET6k7mTCQfQI5kEQjvcd/YA=;
 b=FKzSb/T7HvcUlD7LUFDU8qhavp24Uv2rMWHMSYJm3V/5gFc95VLqj/VIu2BNcKv7+5
 PDWvW7E1HrHEbm71dyWWSbOQPXVRxS4oQuLIWj2bsOZ9H73VG0tLRyt7Q/tJyiCjNFKQ
 Po8Z8hEEc7jb3IoJe6kLl8a4cwjf9yiBMZ6Rvk7mGkBTtxPV03uUT+OuerNoXTiKGcaF
 Ii120tWycimgnCc5/APtepXUqqrvs3ObIyF3qKQ01lbaSz9De8LVU+Fp8yqCjYui4Pnh
 Gx5nMP1qs2t7i7d/MDDl1TSd+kSrNy6e5K4lZHjWM+RA1UCDmIcTJN03AZFv/+MgUHGP
 1XWQ==
X-Gm-Message-State: APjAAAV/VWv5Euoa5EkhaT7dk43zir4mg82LOUCmo8ctkbSqqGmv8ams
 kty/kH/Y1jZ3TgZZezCdBmPYxaBz/LIQxw+CBeqkqAW3sDnhfJff056V9YrI9kc3Fxxodx7CSaM
 dzK952b+inC46cE7F2N9iUgeIdRcjsm1vyJcPYRCEzA==
X-Received: by 2002:a37:9345:: with SMTP id v66mr3975292qkd.195.1575982866624; 
 Tue, 10 Dec 2019 05:01:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHMG7fHBREIQP5xXEtbXFAXxXmprGvs+2LXAytwLYY15kf2vYIZ5QNpJ3t9gx8gh4i5FTAbA==
X-Received: by 2002:a37:9345:: with SMTP id v66mr3975268qkd.195.1575982866415; 
 Tue, 10 Dec 2019 05:01:06 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id x65sm902458qkd.15.2019.12.10.05.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 05:01:05 -0800 (PST)
Date: Tue, 10 Dec 2019 08:01:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org, Julio Faracco <jcfaracco@gmail.com>
Subject: [PATCH net-next v10 2/3] mlx4: use new txqueue timeout argument
Message-ID: <20191210130014.47179-3-mst@redhat.com>
References: <20191210130014.47179-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191210130014.47179-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-MC-Unique: 5TqL6cflOeyLCg96-ZHVgg-1
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
