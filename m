Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B695564C61
	for <lists.virtualization@lfdr.de>; Mon,  4 Jul 2022 06:20:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6672B40114;
	Mon,  4 Jul 2022 04:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6672B40114
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UVxf+DaB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXNRMIrzBHc2; Mon,  4 Jul 2022 04:20:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D8ACD4012A;
	Mon,  4 Jul 2022 04:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8ACD4012A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04DB4C007C;
	Mon,  4 Jul 2022 04:20:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA893C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jul 2022 04:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ABC5409A4
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jul 2022 04:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ABC5409A4
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=UVxf+DaB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DlvW0fn6LYq8
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jul 2022 04:20:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99E5D4098F
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99E5D4098F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jul 2022 04:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656908399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y22z2RUZ3NgYrPGiKnWlsecCXQj+o4MeykcBKY+qCEI=;
 b=UVxf+DaBc6XUoNBT1OcitgYm02f1jsCSflGZNaRLALkE+Hg9zalj1s6YpH48/ep3MggzNO
 BlWjrNvmmlpwOfi5TOR59jtoOU/ItD7Bi0tZh68nI9JYVW5w/X7v2FFgXd3bXccBEob+NM
 N268zZ9TWJiuGhoGw4BavfCC15bcFWU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-PLh6vuKwPnKomflJ2Yfg3w-1; Mon, 04 Jul 2022 00:19:55 -0400
X-MC-Unique: PLh6vuKwPnKomflJ2Yfg3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8387811E75;
 Mon,  4 Jul 2022 04:19:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-251.pek2.redhat.com
 [10.72.13.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29F0340C1241;
 Mon,  4 Jul 2022 04:19:50 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Subject: [PATCH net V4] virtio-net: fix the race between refill work and close
Date: Mon,  4 Jul 2022 12:19:48 +0800
Message-Id: <20220704041948.13212-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

We try using cancel_delayed_work_sync() to prevent the work from
enabling NAPI. This is insufficient since we don't disable the source
of the refill work scheduling. This means an NAPI poll callback after
cancel_delayed_work_sync() can schedule the refill work then can
re-enable the NAPI that leads to use-after-free [1].

Since the work can enable NAPI, we can't simply disable NAPI before
calling cancel_delayed_work_sync(). So fix this by introducing a
dedicated boolean to control whether or not the work could be
scheduled from NAPI.

[1]
==================================================================
BUG: KASAN: use-after-free in refill_work+0x43/0xd4
Read of size 2 at addr ffff88810562c92e by task kworker/2:1/42

CPU: 2 PID: 42 Comm: kworker/2:1 Not tainted 5.19.0-rc1+ #480
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
Workqueue: events refill_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x34/0x44
 print_report.cold+0xbb/0x6ac
 ? _printk+0xad/0xde
 ? refill_work+0x43/0xd4
 kasan_report+0xa8/0x130
 ? refill_work+0x43/0xd4
 refill_work+0x43/0xd4
 process_one_work+0x43d/0x780
 worker_thread+0x2a0/0x6f0
 ? process_one_work+0x780/0x780
 kthread+0x167/0x1a0
 ? kthread_exit+0x50/0x50
 ret_from_fork+0x22/0x30
 </TASK>
...

Fixes: b2baed69e605c ("virtio_net: set/cancel work on ndo_open/ndo_stop")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
Changes since V3:
- rebase to -net
Changes since V2:
- use spin_unlock()/lock_bh() in open/stop to synchronize with bh
Changes since V1:
- Tweak the changelog
---
 drivers/net/virtio_net.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 356cf8dd4164..68430d7923ac 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -251,6 +251,12 @@ struct virtnet_info {
 	/* Does the affinity hint is set for virtqueues? */
 	bool affinity_hint_set;
 
+	/* Is refill work enabled? */
+	bool refill_work_enabled;
+
+	/* The lock to synchronize the access to refill_work_enabled */
+	spinlock_t refill_lock;
+
 	/* CPU hotplug instances for online & dead */
 	struct hlist_node node;
 	struct hlist_node node_dead;
@@ -348,6 +354,20 @@ static struct page *get_a_page(struct receive_queue *rq, gfp_t gfp_mask)
 	return p;
 }
 
+static void enable_refill_work(struct virtnet_info *vi)
+{
+	spin_lock_bh(&vi->refill_lock);
+	vi->refill_work_enabled = true;
+	spin_unlock_bh(&vi->refill_lock);
+}
+
+static void disable_refill_work(struct virtnet_info *vi)
+{
+	spin_lock_bh(&vi->refill_lock);
+	vi->refill_work_enabled = false;
+	spin_unlock_bh(&vi->refill_lock);
+}
+
 static void virtqueue_napi_schedule(struct napi_struct *napi,
 				    struct virtqueue *vq)
 {
@@ -1527,8 +1547,12 @@ static int virtnet_receive(struct receive_queue *rq, int budget,
 	}
 
 	if (rq->vq->num_free > min((unsigned int)budget, virtqueue_get_vring_size(rq->vq)) / 2) {
-		if (!try_fill_recv(vi, rq, GFP_ATOMIC))
-			schedule_delayed_work(&vi->refill, 0);
+		if (!try_fill_recv(vi, rq, GFP_ATOMIC)) {
+			spin_lock(&vi->refill_lock);
+			if (vi->refill_work_enabled)
+				schedule_delayed_work(&vi->refill, 0);
+			spin_unlock(&vi->refill_lock);
+		}
 	}
 
 	u64_stats_update_begin(&rq->stats.syncp);
@@ -1651,6 +1675,8 @@ static int virtnet_open(struct net_device *dev)
 	struct virtnet_info *vi = netdev_priv(dev);
 	int i, err;
 
+	enable_refill_work(vi);
+
 	for (i = 0; i < vi->max_queue_pairs; i++) {
 		if (i < vi->curr_queue_pairs)
 			/* Make sure we have some buffers: if oom use wq. */
@@ -2033,6 +2059,8 @@ static int virtnet_close(struct net_device *dev)
 	struct virtnet_info *vi = netdev_priv(dev);
 	int i;
 
+	/* Make sure NAPI doesn't schedule refill work */
+	disable_refill_work(vi);
 	/* Make sure refill_work doesn't re-enable napi! */
 	cancel_delayed_work_sync(&vi->refill);
 
@@ -2792,6 +2820,8 @@ static int virtnet_restore_up(struct virtio_device *vdev)
 
 	virtio_device_ready(vdev);
 
+	enable_refill_work(vi);
+
 	if (netif_running(vi->dev)) {
 		err = virtnet_open(vi->dev);
 		if (err)
@@ -3535,6 +3565,7 @@ static int virtnet_probe(struct virtio_device *vdev)
 	vdev->priv = vi;
 
 	INIT_WORK(&vi->config_work, virtnet_config_changed_work);
+	spin_lock_init(&vi->refill_lock);
 
 	/* If we can receive ANY GSO packets, we must allocate large ones. */
 	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
