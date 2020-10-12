Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF2E28AB93
	for <lists.virtualization@lfdr.de>; Mon, 12 Oct 2020 04:03:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 80A2920452;
	Mon, 12 Oct 2020 02:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hAg3tx2VX0BE; Mon, 12 Oct 2020 02:03:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BFCF3203FE;
	Mon, 12 Oct 2020 02:03:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A073CC0051;
	Mon, 12 Oct 2020 02:03:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BBFEC0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 02:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 76C7F203FE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 02:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvU7GIwjQBJw
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 02:03:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 41B3E2001F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 02:03:41 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id 16so17126573oix.9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 11 Oct 2020 19:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=j13Tylr9YBkdZ0Q6y1P4zQEjpOu1kWVXCB0vaRAU130=;
 b=ACNIBePjoAnvCfSd8s6z6kT8Js7T1Vq8g5oAhpnPtxIFeCpdFE4v/k2DUyARLJ53k7
 Fi/I672QmETEm/7L59US6zBtJgm5feW8XfCvfGsnr53Ybbw5ONXV0UDxa9U1OC2ogGPo
 D0Oi5XUTwPgOil4yyxWQiKvHzigAjPtRyAXivyL0A8Rh0Nq4JCkXCqgb3DCAuruzZy4b
 EjDhj4RGTAfmlBlGiUYBvE0OOHC4khrVj/N064OEuklRLtIsE7eocTE8JrhFKkYV6UQu
 0AeuKbw2UOX+EQN9u+aCXtqbmPqvp57iOEdrzVgHNYvviyHdM+UUixpdeeqZ3bfXhemR
 P3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=j13Tylr9YBkdZ0Q6y1P4zQEjpOu1kWVXCB0vaRAU130=;
 b=d1hDLvlFcRlbzGXExB3Uig/JvSmQD7Y12dKlp57f0hKuNbfOltDsTe6AYts4tHhTPO
 93NZmC9cNfycKbCqYY0QHMK7EpAEUcZVZgfwPOvvgIgc/15bUvUiSTp1rkBqSp9lKHCa
 hwA5J6Y72JLtwWoIwKdv7UO4HSi3EJVtWOjxRwvcb50FzUC8GmCWoOq55A7/dnPkO04f
 5qulZUZTD6UDAO4CTa+iIU/yDEtg1pf+nFvAkbVTmQPvXRcqA79orTPM6glr66TKrs/0
 hISRikq02R7BeO+XYSplzCnJ+JKe4VlMjtf1cA+jk+keLUkCi/zKXoYmnS3dmOetnbOl
 7u4A==
X-Gm-Message-State: AOAM532fEsU2dk54I5vbd5/9TyL7TT5gvtUTfEquBuwFVUD9/jxJsAjI
 buHXjedyDG7taJRFCEgk13E=
X-Google-Smtp-Source: ABdhPJzbSZngaFCV4YYKgEgA+zeTPsGl4ocGWWpONXc9jQ04lXVYHQZD/kFhwp5l2bt+VbTQZSy97g==
X-Received: by 2002:aca:3a57:: with SMTP id h84mr9778654oia.95.1602468220426; 
 Sun, 11 Oct 2020 19:03:40 -0700 (PDT)
Received: from localhost.localdomain ([50.236.19.102])
 by smtp.gmail.com with ESMTPSA id t12sm1560471oth.13.2020.10.11.19.03.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Oct 2020 19:03:39 -0700 (PDT)
From: xiangxia.m.yue@gmail.com
To: jasowang@redhat.com,
	mst@redhat.com,
	willemb@google.com
Subject: [PATCH net-next v3] virtio-net: ethtool configurable RXCSUM
Date: Mon, 12 Oct 2020 09:58:20 +0800
Message-Id: <20201012015820.62042-1-xiangxia.m.yue@gmail.com>
X-Mailer: git-send-email 2.15.0
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org
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

From: Tonghao Zhang <xiangxia.m.yue@gmail.com>

Allow user configuring RXCSUM separately with ethtool -K,
reusing the existing virtnet_set_guest_offloads helper
that configures RXCSUM for XDP. This is conditional on
VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.

If Rx checksum is disabled, LRO should also be disabled.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>
Signed-off-by: Tonghao Zhang <xiangxia.m.yue@gmail.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/net/virtio_net.c | 48 ++++++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 21b71148c532..d2d2c4a53cf2 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -68,6 +68,8 @@ static const unsigned long guest_offloads[] = {
 				(1ULL << VIRTIO_NET_F_GUEST_ECN)  | \
 				(1ULL << VIRTIO_NET_F_GUEST_UFO))
 
+#define GUEST_OFFLOAD_CSUM_MASK (1ULL << VIRTIO_NET_F_GUEST_CSUM)
+
 struct virtnet_stat_desc {
 	char desc[ETH_GSTRING_LEN];
 	size_t offset;
@@ -2522,29 +2524,48 @@ static int virtnet_get_phys_port_name(struct net_device *dev, char *buf,
 	return 0;
 }
 
+static netdev_features_t virtnet_fix_features(struct net_device *netdev,
+					      netdev_features_t features)
+{
+	/* If Rx checksum is disabled, LRO should also be disabled. */
+	if (!(features & NETIF_F_RXCSUM))
+		features &= ~NETIF_F_LRO;
+
+	return features;
+}
+
 static int virtnet_set_features(struct net_device *dev,
 				netdev_features_t features)
 {
 	struct virtnet_info *vi = netdev_priv(dev);
-	u64 offloads;
+	u64 offloads = vi->guest_offloads;
 	int err;
 
-	if ((dev->features ^ features) & NETIF_F_LRO) {
-		if (vi->xdp_queue_pairs)
-			return -EBUSY;
+	/* Don't allow configuration while XDP is active. */
+	if (vi->xdp_queue_pairs)
+		return -EBUSY;
 
+	if ((dev->features ^ features) & NETIF_F_LRO) {
 		if (features & NETIF_F_LRO)
-			offloads = vi->guest_offloads_capable;
+			offloads |= GUEST_OFFLOAD_LRO_MASK &
+				    vi->guest_offloads_capable;
 		else
-			offloads = vi->guest_offloads_capable &
-				   ~GUEST_OFFLOAD_LRO_MASK;
+			offloads &= ~GUEST_OFFLOAD_LRO_MASK;
+	}
 
-		err = virtnet_set_guest_offloads(vi, offloads);
-		if (err)
-			return err;
-		vi->guest_offloads = offloads;
+	if ((dev->features ^ features) & NETIF_F_RXCSUM) {
+		if (features & NETIF_F_RXCSUM)
+			offloads |= GUEST_OFFLOAD_CSUM_MASK &
+				    vi->guest_offloads_capable;
+		else
+			offloads &= ~GUEST_OFFLOAD_CSUM_MASK;
 	}
 
+	err = virtnet_set_guest_offloads(vi, offloads);
+	if (err)
+		return err;
+
+	vi->guest_offloads = offloads;
 	return 0;
 }
 
@@ -2563,6 +2584,7 @@ static const struct net_device_ops virtnet_netdev = {
 	.ndo_features_check	= passthru_features_check,
 	.ndo_get_phys_port_name	= virtnet_get_phys_port_name,
 	.ndo_set_features	= virtnet_set_features,
+	.ndo_fix_features	= virtnet_fix_features,
 };
 
 static void virtnet_config_changed_work(struct work_struct *work)
@@ -3013,8 +3035,10 @@ static int virtnet_probe(struct virtio_device *vdev)
 	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
 	    virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6))
 		dev->features |= NETIF_F_LRO;
-	if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
+	if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS)) {
+		dev->hw_features |= NETIF_F_RXCSUM;
 		dev->hw_features |= NETIF_F_LRO;
+	}
 
 	dev->vlan_features = dev->features;
 
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
