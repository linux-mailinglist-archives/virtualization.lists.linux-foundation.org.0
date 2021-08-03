Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAA73DEFEC
	for <lists.virtualization@lfdr.de>; Tue,  3 Aug 2021 16:17:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FD078384B;
	Tue,  3 Aug 2021 14:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uw_CbzNeMiVa; Tue,  3 Aug 2021 14:17:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 469778381F;
	Tue,  3 Aug 2021 14:17:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D65A6C000E;
	Tue,  3 Aug 2021 14:17:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D155FC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 14:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B36B9404A7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 14:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="q209fWC/";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="qr6ly/Ve"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 490ZXRhlcskd
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 14:17:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24DA54036F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 14:17:13 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1628000231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2uoO50/v7bqMCm6KdvZeuFGej/XDok02zYQUn61la+Q=;
 b=q209fWC/mgcf8ee5UUh02WLuwHEZJOkbdDWOqmIg3Gvv+lUDPJUOCkdDanYrqSO3Q76ewX
 evkXGjlIc2Wllr5yCbchHJ/yUtiog/syfaQ5vQvPmgX6MWqHqJnGM155I/M6zx1GZqPd8B
 IAe0tPTI8TfvOyD7QvNxr+2Cl9BDOwFcPJPzqoGjRC7MGGMsaQDRrdZdAP2FDFm2ZnmNCo
 lpL5BiSWcnWWL7BqdCVYu78OwkVrUU10rouVIFdzW8aTGgG9jwmC8QGKERWu2ealInkU6U
 7IbLvrFieqw4ynJviuZBc593/JQ4SnEjffWX0QmX327q62TUnCTEx4601diWcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1628000231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2uoO50/v7bqMCm6KdvZeuFGej/XDok02zYQUn61la+Q=;
 b=qr6ly/VeWBNIbG7ikdjGJ0C3OWrZHNj4rRwhmYZY9FSxYdtfgooDNLOn2sOGznPqHnaI01
 cSdCHzLg7wbNExDA==
To: linux-kernel@vger.kernel.org
Subject: [PATCH 21/38] virtio_net: Replace deprecated CPU-hotplug functions.
Date: Tue,  3 Aug 2021 16:16:04 +0200
Message-Id: <20210803141621.780504-22-bigeasy@linutronix.de>
In-Reply-To: <20210803141621.780504-1-bigeasy@linutronix.de>
References: <20210803141621.780504-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Jakub Kicinski <kuba@kernel.org>,
 tglx@linutronix.de, "David S. Miller" <davem@davemloft.net>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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

The functions get_online_cpus() and put_online_cpus() have been
deprecated during the CPU hotplug rework. They map directly to
cpus_read_lock() and cpus_read_unlock().

Replace deprecated CPU-hotplug functions with the official version.
The behavior remains unchanged.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: virtualization@lists.linux-foundation.org
Cc: netdev@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/net/virtio_net.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 56c3f85190938..ea551ac9e08db 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -2208,14 +2208,14 @@ static int virtnet_set_channels(struct net_device *dev,
 	if (vi->rq[0].xdp_prog)
 		return -EINVAL;
 
-	get_online_cpus();
+	cpus_read_lock();
 	err = _virtnet_set_queues(vi, queue_pairs);
 	if (err) {
-		put_online_cpus();
+		cpus_read_unlock();
 		goto err;
 	}
 	virtnet_set_affinity(vi);
-	put_online_cpus();
+	cpus_read_unlock();
 
 	netif_set_real_num_tx_queues(dev, queue_pairs);
 	netif_set_real_num_rx_queues(dev, queue_pairs);
@@ -2970,9 +2970,9 @@ static int init_vqs(struct virtnet_info *vi)
 	if (ret)
 		goto err_free;
 
-	get_online_cpus();
+	cpus_read_lock();
 	virtnet_set_affinity(vi);
-	put_online_cpus();
+	cpus_read_unlock();
 
 	return 0;
 
-- 
2.32.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
