Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BA859105E48
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 02:34:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 664D387EDA;
	Fri, 22 Nov 2019 01:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F6gNJsoRqe4D; Fri, 22 Nov 2019 01:34:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3930887F04;
	Fri, 22 Nov 2019 01:34:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0403DC18DA;
	Fri, 22 Nov 2019 01:34:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 084C3C18DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 01:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EAD03889EC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 01:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-aCMpV5+E5Q
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 01:34:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 04E5E8859D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 01:34:26 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id m125so4902333qkd.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 17:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=M2t/bQT6SDEWyA5LFYGQq1a0ZPecdTO0+C4+tNOQp/Q=;
 b=cKZwN9aI0AhhNU/q3P8pUGyJtmoG7bBlp+Ye24J5Hh4/g/4KC78Kve6FoexiRpN7X9
 VXuZhSeUsR/i7jfUIbLyDIF726aBAueN3S+UWfn46U6GFQjnW0nOZ3M54ktteKWzMK/X
 OKy8BkXCVNnC2Z4SjT/U1o4J64aeAKEcdQMVcSpsc9d2oWN71toERVtA488UYLebphSu
 chsJBHEDszc7X73mGmXvDcnPSocD/IcYMP9upvMEyKu0O58ZwssOxUntsDqonZ1rnR0k
 dM26+udPe2wM0zNXntKhP81wd2G6qPsdnGi85g77jBRrLjI48ADHDjZ3vz5YJ4KYSWse
 w/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=M2t/bQT6SDEWyA5LFYGQq1a0ZPecdTO0+C4+tNOQp/Q=;
 b=sexMFZrrUbMc4y8GJp01CP8QCDcsfkDRbNvt5nsTA/3fC/I3CoKufrbJiu7bouGMJ5
 RiUKTFN/TcOXjBTBLGahPSu2Vz/sjbAfIpT1yRgaDZrZVj8YyVGwph/HuxK6e5pHLPpf
 XfXhDZyGeHgHBQbE6+Z3Uuxqo9o/ZimrX1sFoxdOeHWa///viE01ijJ/QwODg3TWDnLq
 IB1cin3lSUbMOzivPDQfm/VBb5M1goDa2jqKSU11tYWmwgDExlUdtXAo2xZV5RNWSXiA
 HTKzSHTqfsZTzt1TXKXGOi4jJvNwQXCPlDpgObZUR49zsLd3kQTNBmP9XmL65YONywp1
 Jqlw==
X-Gm-Message-State: APjAAAW7gbrewrOlmrfJmAEsfLJjq7wr+1BBWuEohh91F07lLUONYarh
 iWQomswg9X16CUwbZ6h9Kx8=
X-Google-Smtp-Source: APXvYqzZ/EJJ3EmUqlzJuVC3CRtXNCTr/UmNFVErkc75WzxXPUGQeuwG6FjYAg7wQbxVrUB7jnAXeQ==
X-Received: by 2002:a05:620a:984:: with SMTP id
 x4mr11421581qkx.373.1574386464621; 
 Thu, 21 Nov 2019 17:34:24 -0800 (PST)
Received: from ubuntu.default ([191.254.197.220])
 by smtp.gmail.com with ESMTPSA id a70sm2304857qkb.86.2019.11.21.17.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 17:34:23 -0800 (PST)
From: Julio Faracco <jcfaracco@gmail.com>
To: netdev@vger.kernel.org
Subject: [PATCH] drivers: net: virtio_net: Implement a dev_watchdog handler
Date: Thu, 21 Nov 2019 22:34:19 -0300
Message-Id: <20191122013419.980-1-jcfaracco@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: dnmendes76@gmail.com, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Driver virtio_net is not handling error events for TX provided by
dev_watchdog. This event is reached when transmission queue is having
problems to transmit packets. This could happen for any reason. To
enable it, driver should have .ndo_tx_timeout implemented.

This commit brings back virtnet_reset method to recover TX queues from a
error state. That function is called by schedule_work method and it puts
the reset function into work queue.

As the error cause is unknown at this moment, it would be better to
reset all queues.

Signed-off-by: Julio Faracco <jcfaracco@gmail.com>
Signed-off-by: Daiane Mendes <dnmendes76@gmail.com>
Cc: Jason Wang <jasowang@redhat.com>
---
 drivers/net/virtio_net.c | 95 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 4d7d5434cc5d..31890d77eaf2 100644
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
@@ -211,6 +213,9 @@ struct virtnet_info {
 	/* Work struct for config space updates */
 	struct work_struct config_work;
 
+	/* Work struct for resetting the virtio-net driver. */
+	struct work_struct reset_work;
+
 	/* Does the affinity hint is set for virtqueues? */
 	bool affinity_hint_set;
 
@@ -1721,7 +1726,7 @@ static void virtnet_stats(struct net_device *dev,
 	int i;
 
 	for (i = 0; i < vi->max_queue_pairs; i++) {
-		u64 tpackets, tbytes, rpackets, rbytes, rdrops;
+		u64 tpackets, tbytes, terrors, rpackets, rbytes, rdrops;
 		struct receive_queue *rq = &vi->rq[i];
 		struct send_queue *sq = &vi->sq[i];
 
@@ -1729,6 +1734,7 @@ static void virtnet_stats(struct net_device *dev,
 			start = u64_stats_fetch_begin_irq(&sq->stats.syncp);
 			tpackets = sq->stats.packets;
 			tbytes   = sq->stats.bytes;
+			terrors  = sq->stats.tx_timeouts;
 		} while (u64_stats_fetch_retry_irq(&sq->stats.syncp, start));
 
 		do {
@@ -1743,6 +1749,7 @@ static void virtnet_stats(struct net_device *dev,
 		tot->rx_bytes   += rbytes;
 		tot->tx_bytes   += tbytes;
 		tot->rx_dropped += rdrops;
+		tot->tx_errors  += terrors;
 	}
 
 	tot->tx_dropped = dev->stats.tx_dropped;
@@ -2578,6 +2585,33 @@ static int virtnet_set_features(struct net_device *dev,
 	return 0;
 }
 
+static void virtnet_tx_timeout(struct net_device *dev)
+{
+	struct virtnet_info *vi = netdev_priv(dev);
+	u32 i;
+
+	netdev_warn(dev, "TX timeout stats:\n");
+	/* find the stopped queue the same way dev_watchdog() does */
+	for (i = 0; i < vi->curr_queue_pairs; i++) {
+		struct send_queue *sq = &vi->sq[i];
+
+		if (!netif_xmit_stopped(netdev_get_tx_queue(dev, i))) {
+			netdev_warn(dev, " Available send queue: %d, sq: %s, vq: %d, name: %s\n",
+				    i, sq->name, sq->vq->index, sq->vq->name);
+			continue;
+		}
+
+		u64_stats_update_begin(&sq->stats.syncp);
+		sq->stats.tx_timeouts++;
+		u64_stats_update_end(&sq->stats.syncp);
+
+		netdev_warn(dev, " Unavailable send queue: %d, sq: %s, vq: %d, name: %s\n",
+			    i, sq->name, sq->vq->index, sq->vq->name);
+	}
+
+	schedule_work(&vi->reset_work);
+}
+
 static const struct net_device_ops virtnet_netdev = {
 	.ndo_open            = virtnet_open,
 	.ndo_stop   	     = virtnet_close,
@@ -2593,6 +2627,7 @@ static const struct net_device_ops virtnet_netdev = {
 	.ndo_features_check	= passthru_features_check,
 	.ndo_get_phys_port_name	= virtnet_get_phys_port_name,
 	.ndo_set_features	= virtnet_set_features,
+	.ndo_tx_timeout		= virtnet_tx_timeout,
 };
 
 static void virtnet_config_changed_work(struct work_struct *work)
@@ -2982,6 +3017,62 @@ static int virtnet_validate(struct virtio_device *vdev)
 	return 0;
 }
 
+static void _remove_vq_common(struct virtnet_info *vi)
+{
+	vi->vdev->config->reset(vi->vdev);
+
+	/* Free unused buffers in both send and recv, if any. */
+	free_unused_bufs(vi);
+
+	_free_receive_bufs(vi);
+
+	free_receive_page_frags(vi);
+
+	virtnet_del_vqs(vi);
+}
+
+static int _virtnet_reset(struct virtnet_info *vi)
+{
+	struct virtio_device *vdev = vi->vdev;
+	int ret;
+
+	virtio_config_disable(vdev);
+	vdev->failed = vdev->config->get_status(vdev) & VIRTIO_CONFIG_S_FAILED;
+
+	virtnet_freeze_down(vdev);
+	_remove_vq_common(vi);
+
+	virtio_add_status(vdev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
+	virtio_add_status(vdev, VIRTIO_CONFIG_S_DRIVER);
+
+	ret = virtio_finalize_features(vdev);
+	if (ret)
+		goto err;
+
+	ret = virtnet_restore_up(vdev);
+	if (ret)
+		goto err;
+
+	ret = _virtnet_set_queues(vi, vi->curr_queue_pairs);
+	if (ret)
+		goto err;
+
+	virtio_add_status(vdev, VIRTIO_CONFIG_S_DRIVER_OK);
+	virtio_config_enable(vdev);
+	return 0;
+err:
+	virtio_add_status(vdev, VIRTIO_CONFIG_S_FAILED);
+	return ret;
+}
+
+static void virtnet_reset(struct work_struct *work)
+{
+	struct virtnet_info *vi =
+		container_of(work, struct virtnet_info, reset_work);
+
+	_virtnet_reset(vi);
+}
+
 static int virtnet_probe(struct virtio_device *vdev)
 {
 	int i, err = -ENOMEM;
@@ -3011,6 +3102,7 @@ static int virtnet_probe(struct virtio_device *vdev)
 	dev->netdev_ops = &virtnet_netdev;
 	dev->features = NETIF_F_HIGHDMA;
 
+	dev->watchdog_timeo = 5 * HZ;
 	dev->ethtool_ops = &virtnet_ethtool_ops;
 	SET_NETDEV_DEV(dev, &vdev->dev);
 
@@ -3068,6 +3160,7 @@ static int virtnet_probe(struct virtio_device *vdev)
 	vdev->priv = vi;
 
 	INIT_WORK(&vi->config_work, virtnet_config_changed_work);
+	INIT_WORK(&vi->reset_work, virtnet_reset);
 
 	/* If we can receive ANY GSO packets, we must allocate large ones. */
 	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
