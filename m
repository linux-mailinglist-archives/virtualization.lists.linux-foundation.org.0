Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E78C4560EF4
	for <lists.virtualization@lfdr.de>; Thu, 30 Jun 2022 04:08:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32144408D2;
	Thu, 30 Jun 2022 02:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32144408D2
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SxM0q7A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FmPoxNL_mgbm; Thu, 30 Jun 2022 02:08:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B973540176;
	Thu, 30 Jun 2022 02:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B973540176
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C82A4C0036;
	Thu, 30 Jun 2022 02:08:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A9A5C0011
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jun 2022 02:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2B15408D2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jun 2022 02:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2B15408D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxiynPbTAQuw
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jun 2022 02:08:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D3C440176
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D3C440176
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jun 2022 02:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656554894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rdzs+ejxlay4oS8U29luxVEbd5hmptD+SpCokSpGfUE=;
 b=SxM0q7A0iUGRGEHB6VPgjaqh99MBqy3VMwIWCZVxKyxTlARTJy0rZIu24nnBErARskASuw
 RzceX1xouCeEUC2xJlVKyfb32JCfbs2XnjAM7nPYDaywFMifXjxOJC3KZxouXzr0dpVMMj
 C3yVa2/cPIRtoZJ3LZRE2ysSyOgmquA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-_hjto7RuNAajHfm7IQHkQg-1; Wed, 29 Jun 2022 22:08:11 -0400
X-MC-Unique: _hjto7RuNAajHfm7IQHkQg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD43D85A581;
 Thu, 30 Jun 2022 02:08:10 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-189.pek2.redhat.com
 [10.72.12.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEFEB492C3B;
 Thu, 30 Jun 2022 02:08:07 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com, davem@davemloft.net, kuba@kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V2] virtio-net: fix the race between refill work and close
Date: Thu, 30 Jun 2022 10:08:04 +0800
Message-Id: <20220630020805.74658-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
 drivers/net/virtio_net.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index db05b5e930be..21bf1e5c81ef 100644
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
+	spin_lock(&vi->refill_lock);
+	vi->refill_work_enabled = true;
+	spin_unlock(&vi->refill_lock);
+}
+
+static void disable_refill_work(struct virtnet_info *vi)
+{
+	spin_lock(&vi->refill_lock);
+	vi->refill_work_enabled = false;
+	spin_unlock(&vi->refill_lock);
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
 
@@ -2776,6 +2804,9 @@ static void virtnet_freeze_down(struct virtio_device *vdev)
 	netif_tx_lock_bh(vi->dev);
 	netif_device_detach(vi->dev);
 	netif_tx_unlock_bh(vi->dev);
+	/* Make sure NAPI doesn't schedule refill work */
+	disable_refill_work(vi);
+	/* Make sure refill_work doesn't re-enable napi! */
 	cancel_delayed_work_sync(&vi->refill);
 
 	if (netif_running(vi->dev)) {
@@ -2799,6 +2830,8 @@ static int virtnet_restore_up(struct virtio_device *vdev)
 
 	virtio_device_ready(vdev);
 
+	enable_refill_work(vi);
+
 	if (netif_running(vi->dev)) {
 		for (i = 0; i < vi->curr_queue_pairs; i++)
 			if (!try_fill_recv(vi, &vi->rq[i], GFP_KERNEL))
@@ -3548,6 +3581,7 @@ static int virtnet_probe(struct virtio_device *vdev)
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
