Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id B933E6E0714
	for <lists.virtualization@lfdr.de>; Thu, 13 Apr 2023 08:40:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B7E583ED5;
	Thu, 13 Apr 2023 06:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B7E583ED5
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GceBONcl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3thmGnTBi6vQ; Thu, 13 Apr 2023 06:40:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E75BE83EBD;
	Thu, 13 Apr 2023 06:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E75BE83EBD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EBE5C0089;
	Thu, 13 Apr 2023 06:40:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08E26C002A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Apr 2023 06:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB36540CB3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Apr 2023 06:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB36540CB3
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=GceBONcl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V9a3TO-LDNpt
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Apr 2023 06:40:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0372140CA1
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0372140CA1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Apr 2023 06:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681368048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTB3CgJRk7J5IzkSOYPigSPFDZTD53vvUVJW3ncH3HA=;
 b=GceBONcl/ryI8DyMdPXrzKfGaMsWQsq//v0dQh8OOj6j6AK4qa1FDrHxGezsQnHUVAAurl
 nkBXLs1rKLpPwCgrlQap8MLP93P1TBtg6GknDrXjfdnHZHD45o/QIQ+VJXw7BoiM6AN9lM
 rk8dMqHBMbS4Tda82JeuLh0X4JMfOiY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-tcTRVZCjPderlQhfr7Cpkg-1; Thu, 13 Apr 2023 02:40:42 -0400
X-MC-Unique: tcTRVZCjPderlQhfr7Cpkg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B6823C1068B;
 Thu, 13 Apr 2023 06:40:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-72.pek2.redhat.com [10.72.12.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B878B40C6E20;
 Thu, 13 Apr 2023 06:40:36 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH net-next V2 1/2] virtio-net: convert rx mode setting to use
 workqueue
Date: Thu, 13 Apr 2023 14:40:26 +0800
Message-Id: <20230413064027.13267-2-jasowang@redhat.com>
In-Reply-To: <20230413064027.13267-1-jasowang@redhat.com>
References: <20230413064027.13267-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Cc: xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 edumazet@google.com, maxime.coquelin@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, david.marchand@redhat.com, davem@davemloft.net
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

This patch convert rx mode setting to be done in a workqueue, this is
a must for allow to sleep when waiting for the cvq command to
response since current code is executed under addr spin lock.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
Changes since V1:
- use RTNL to synchronize rx mode worker
---
 drivers/net/virtio_net.c | 55 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index e2560b6f7980..2e56bbf86894 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -265,6 +265,12 @@ struct virtnet_info {
 	/* Work struct for config space updates */
 	struct work_struct config_work;
 
+	/* Work struct for config rx mode */
+	struct work_struct rx_mode_work;
+
+	/* Is rx mode work enabled? */
+	bool rx_mode_work_enabled;
+
 	/* Does the affinity hint is set for virtqueues? */
 	bool affinity_hint_set;
 
@@ -388,6 +394,20 @@ static void disable_delayed_refill(struct virtnet_info *vi)
 	spin_unlock_bh(&vi->refill_lock);
 }
 
+static void enable_rx_mode_work(struct virtnet_info *vi)
+{
+	rtnl_lock();
+	vi->rx_mode_work_enabled = true;
+	rtnl_unlock();
+}
+
+static void disable_rx_mode_work(struct virtnet_info *vi)
+{
+	rtnl_lock();
+	vi->rx_mode_work_enabled = false;
+	rtnl_unlock();
+}
+
 static void virtqueue_napi_schedule(struct napi_struct *napi,
 				    struct virtqueue *vq)
 {
@@ -2310,9 +2330,11 @@ static int virtnet_close(struct net_device *dev)
 	return 0;
 }
 
-static void virtnet_set_rx_mode(struct net_device *dev)
+static void virtnet_rx_mode_work(struct work_struct *work)
 {
-	struct virtnet_info *vi = netdev_priv(dev);
+	struct virtnet_info *vi =
+		container_of(work, struct virtnet_info, rx_mode_work);
+	struct net_device *dev = vi->dev;
 	struct scatterlist sg[2];
 	struct virtio_net_ctrl_mac *mac_data;
 	struct netdev_hw_addr *ha;
@@ -2325,6 +2347,8 @@ static void virtnet_set_rx_mode(struct net_device *dev)
 	if (!virtio_has_feature(vi->vdev, VIRTIO_NET_F_CTRL_RX))
 		return;
 
+	rtnl_lock();
+
 	vi->ctrl->promisc = ((dev->flags & IFF_PROMISC) != 0);
 	vi->ctrl->allmulti = ((dev->flags & IFF_ALLMULTI) != 0);
 
@@ -2342,14 +2366,19 @@ static void virtnet_set_rx_mode(struct net_device *dev)
 		dev_warn(&dev->dev, "Failed to %sable allmulti mode.\n",
 			 vi->ctrl->allmulti ? "en" : "dis");
 
+	netif_addr_lock_bh(dev);
+
 	uc_count = netdev_uc_count(dev);
 	mc_count = netdev_mc_count(dev);
 	/* MAC filter - use one buffer for both lists */
 	buf = kzalloc(((uc_count + mc_count) * ETH_ALEN) +
 		      (2 * sizeof(mac_data->entries)), GFP_ATOMIC);
 	mac_data = buf;
-	if (!buf)
+	if (!buf) {
+		netif_addr_unlock_bh(dev);
+		rtnl_unlock();
 		return;
+	}
 
 	sg_init_table(sg, 2);
 
@@ -2370,6 +2399,8 @@ static void virtnet_set_rx_mode(struct net_device *dev)
 	netdev_for_each_mc_addr(ha, dev)
 		memcpy(&mac_data->macs[i++][0], ha->addr, ETH_ALEN);
 
+	netif_addr_unlock_bh(dev);
+
 	sg_set_buf(&sg[1], mac_data,
 		   sizeof(mac_data->entries) + (mc_count * ETH_ALEN));
 
@@ -2377,9 +2408,19 @@ static void virtnet_set_rx_mode(struct net_device *dev)
 				  VIRTIO_NET_CTRL_MAC_TABLE_SET, sg))
 		dev_warn(&dev->dev, "Failed to set MAC filter table.\n");
 
+	rtnl_unlock();
+
 	kfree(buf);
 }
 
+static void virtnet_set_rx_mode(struct net_device *dev)
+{
+	struct virtnet_info *vi = netdev_priv(dev);
+
+	if (vi->rx_mode_work_enabled)
+		schedule_work(&vi->rx_mode_work);
+}
+
 static int virtnet_vlan_rx_add_vid(struct net_device *dev,
 				   __be16 proto, u16 vid)
 {
@@ -3150,6 +3191,8 @@ static void virtnet_freeze_down(struct virtio_device *vdev)
 
 	/* Make sure no work handler is accessing the device */
 	flush_work(&vi->config_work);
+	disable_rx_mode_work(vi);
+	flush_work(&vi->rx_mode_work);
 
 	netif_tx_lock_bh(vi->dev);
 	netif_device_detach(vi->dev);
@@ -3172,6 +3215,7 @@ static int virtnet_restore_up(struct virtio_device *vdev)
 	virtio_device_ready(vdev);
 
 	enable_delayed_refill(vi);
+	enable_rx_mode_work(vi);
 
 	if (netif_running(vi->dev)) {
 		err = virtnet_open(vi->dev);
@@ -3969,6 +4013,7 @@ static int virtnet_probe(struct virtio_device *vdev)
 	vdev->priv = vi;
 
 	INIT_WORK(&vi->config_work, virtnet_config_changed_work);
+	INIT_WORK(&vi->rx_mode_work, virtnet_rx_mode_work);
 	spin_lock_init(&vi->refill_lock);
 
 	if (virtio_has_feature(vdev, VIRTIO_NET_F_MRG_RXBUF)) {
@@ -4077,6 +4122,8 @@ static int virtnet_probe(struct virtio_device *vdev)
 	if (vi->has_rss || vi->has_rss_hash_report)
 		virtnet_init_default_rss(vi);
 
+	enable_rx_mode_work(vi);
+
 	/* serialize netdev register + virtio_device_ready() with ndo_open() */
 	rtnl_lock();
 
@@ -4174,6 +4221,8 @@ static void virtnet_remove(struct virtio_device *vdev)
 
 	/* Make sure no work handler is accessing the device. */
 	flush_work(&vi->config_work);
+	disable_rx_mode_work(vi);
+	flush_work(&vi->rx_mode_work);
 
 	unregister_netdev(vi->dev);
 
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
