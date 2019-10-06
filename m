Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F426CD8B2
	for <lists.virtualization@lfdr.de>; Sun,  6 Oct 2019 20:45:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 094F0C9A;
	Sun,  6 Oct 2019 18:45:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A4873C87
	for <virtualization@lists.linux-foundation.org>;
	Sun,  6 Oct 2019 18:45:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4576127B
	for <virtualization@lists.linux-foundation.org>;
	Sun,  6 Oct 2019 18:45:24 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d16so16106242qtq.8
	for <virtualization@lists.linux-foundation.org>;
	Sun, 06 Oct 2019 11:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZMrZ1RubZY9dyZJ9Hkb1yPFx5en+hRm60DJ8k1k6vSg=;
	b=sd0OiqMr5oiSOqh/1GM2pf4ESTmHrrgBjeKXfjitHhBf4pj4o1OuSMBVRC5HXz4biP
	zYoMBWsEwqHoFTgM9OWX2stj+66/9YsuNlN3JWyv2hg+gAeVHAeLJSYOv3Pl6pb3pE/H
	e0as4YJnQibs1GDl722UdJKquZB5J0MsYYO3BRzjKWmGHjfHhzg4xkAtgB+zT/W7gS6T
	uKcPSJDB8/LXl9B9dkaEHsnNbesPURuqhm+/D/YluqQMCZyvzVyXXttxI9tUy54OebAo
	us2jxAGv8UCjJRRdFA2gsFEgqiVclT4nkp5G5e8h3zMyP3ZucuwK2bW2IT7cI1O3t0Gi
	hJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZMrZ1RubZY9dyZJ9Hkb1yPFx5en+hRm60DJ8k1k6vSg=;
	b=hl7qWxBSt4hT6juElsNcckXibCCLDKGobfx4PzHcoEj05/43ls0dxnAKhGjcUrF4ZR
	XyQlRkPx17o/hW4cyY+iskUqDzL5RBs8Au/kJmuJuf2sEu2wiX9YARix5T5kP+raDqpW
	ThZEL221A3SxJbewygZ+CLi3hzQWPurf/IQJjqPRIazP3ttrjeMzrvzty9lFCx8g+uJA
	g4mWWzUfijO5GjcgYcnEiP33x70lhuYl1BmnHsZO7uwxGaxCfvkS68z+DDWsFE0WGBBP
	l81i4pydyA9jEX9v54a1QE8ECQK+61HLUQnDtqGh4r+r3Z9E+s5+VMYeoZUM9jTcBxjd
	OZdQ==
X-Gm-Message-State: APjAAAUiALeundQBurqXmgHJR9PAiYK/Mw4ciDNq0t9nS42PxDz4WdtI
	2sNBrQ+FnD8UftkIHFvsh60=
X-Google-Smtp-Source: APXvYqwBa99OxIXSIXW8z7fEMc8gNDcJmwc8glhoOkclr8oJJdigdpqpIWyeg2BA5rNH3vMjJLHjNg==
X-Received: by 2002:ac8:7019:: with SMTP id x25mr27196849qtm.133.1570387523264;
	Sun, 06 Oct 2019 11:45:23 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7cb:21c2:d505:73c7:4df5:8eac])
	by smtp.gmail.com with ESMTPSA id
	l23sm11275578qta.53.2019.10.06.11.45.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 06 Oct 2019 11:45:22 -0700 (PDT)
From: jcfaracco@gmail.com
To: netdev@vger.kernel.org
Subject: [PATCH RFC net-next 1/2] drivers: net: virtio_net: Add tx_timeout
	stats field
Date: Sun,  6 Oct 2019 15:45:14 -0300
Message-Id: <20191006184515.23048-2-jcfaracco@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191006184515.23048-1-jcfaracco@gmail.com>
References: <20191006184515.23048-1-jcfaracco@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dnmendes76@gmail.com, mst@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, davem@davemloft.net
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

From: Julio Faracco <jcfaracco@gmail.com>

For debug purpose of TX timeout events, a tx_timeout entry was added to
monitor this special case: when dev_watchdog identifies a tx_timeout and
throw an exception. We can both consider this event as an error, but
driver should report as a tx_timeout statistic.

Signed-off-by: Julio Faracco <jcfaracco@gmail.com>
Signed-off-by: Daiane Mendes <dnmendes76@gmail.com>
Cc: Jason Wang <jasowang@redhat.com>
---
 drivers/net/virtio_net.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 4f3de0ac8b0b..27f9b212c9f5 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -75,6 +75,7 @@ struct virtnet_sq_stats {
 	u64 xdp_tx;
 	u64 xdp_tx_drops;
 	u64 kicks;
+	u64 tx_timeouts;
 };
 
 struct virtnet_rq_stats {
@@ -98,6 +99,7 @@ static const struct virtnet_stat_desc virtnet_sq_stats_desc[] = {
 	{ "xdp_tx",		VIRTNET_SQ_STAT(xdp_tx) },
 	{ "xdp_tx_drops",	VIRTNET_SQ_STAT(xdp_tx_drops) },
 	{ "kicks",		VIRTNET_SQ_STAT(kicks) },
+	{ "tx_timeouts",	VIRTNET_SQ_STAT(tx_timeouts) },
 };
 
 static const struct virtnet_stat_desc virtnet_rq_stats_desc[] = {
@@ -1721,7 +1723,7 @@ static void virtnet_stats(struct net_device *dev,
 	int i;
 
 	for (i = 0; i < vi->max_queue_pairs; i++) {
-		u64 tpackets, tbytes, rpackets, rbytes, rdrops;
+		u64 tpackets, tbytes, terrors, rpackets, rbytes, rdrops;
 		struct receive_queue *rq = &vi->rq[i];
 		struct send_queue *sq = &vi->sq[i];
 
@@ -1729,6 +1731,7 @@ static void virtnet_stats(struct net_device *dev,
 			start = u64_stats_fetch_begin_irq(&sq->stats.syncp);
 			tpackets = sq->stats.packets;
 			tbytes   = sq->stats.bytes;
+			terrors  = sq->stats.tx_timeouts;
 		} while (u64_stats_fetch_retry_irq(&sq->stats.syncp, start));
 
 		do {
@@ -1743,6 +1746,7 @@ static void virtnet_stats(struct net_device *dev,
 		tot->rx_bytes   += rbytes;
 		tot->tx_bytes   += tbytes;
 		tot->rx_dropped += rdrops;
+		tot->tx_errors  += terrors;
 	}
 
 	tot->tx_dropped = dev->stats.tx_dropped;
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
