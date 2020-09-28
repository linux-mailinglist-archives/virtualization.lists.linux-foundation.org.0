Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF7927A5D2
	for <lists.virtualization@lfdr.de>; Mon, 28 Sep 2020 05:42:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0866E8610F;
	Mon, 28 Sep 2020 03:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t1jMfijqahGE; Mon, 28 Sep 2020 03:42:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4F9CE86130;
	Mon, 28 Sep 2020 03:42:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35B6FC016F;
	Mon, 28 Sep 2020 03:42:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15109C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 03:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EC13C20022
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 03:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 14a0OIwyf8fD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 03:42:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 by silver.osuosl.org (Postfix) with ESMTPS id ABE9720377
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 03:42:02 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id g16so1711987uan.5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 27 Sep 2020 20:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5tf8R6j6ulK4E5b7bjR1T1ekmlta6QQ2PvHfvroeWjk=;
 b=EM54iXaY91q2HajRleaaczPoVQyPkZtt+3Gri/okZty+4lfRZAW3d1DE9IWUaD//L0
 KS9SlffXVdNbk6k9iglE87hUakp9eIxohYsPYByuIpP4UobzGO+CN+5ZIJDOIwAcztuS
 GsHTyrnaWZf4w+/GJNgORSfMdELcFYFJUi4sPSbwPTwIJ1pGCMflFpHO2AWk9i+lW27G
 VxSDK8b/7yXJfMY8dqVEBdTXDaI/6fjFYgetywD825D1yjgq4eO+EjHqd8h58NvS9v2t
 udcmCAhZPAtzbvxBGDmw45S5ViIITYF3hR+OYQVbFZcI/OCsLWGUUby2EnXar/C4g9w4
 BcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5tf8R6j6ulK4E5b7bjR1T1ekmlta6QQ2PvHfvroeWjk=;
 b=nliuJ+SYqtqn7E4IurYds9tkax0ebQ3XcA5IssGX0fqD2cUEvV09VBgJiPyw1J0gQz
 mDG7xkAixC6I39Anj7y1m/VW1MK6VodTob/gSQw+at8GuPbQzRJJH/LLp0oarY3dHnBr
 cGmEYBJ/898q2iMoJoR0PlO2vdErVzzkqFJYfWriVZdIZggDSW2sLpAxkiY/QGwHd6fp
 4c7V+F39giMzy/GsLifnpKvjMuCznERVhvVDelz+zM4ZTBBrknpqogwMLRy+bOwLRbHp
 xGV2g8dn43fBZYNNi1zur3nNw65JHwSg9Crz+dLMbawUiLIzYhDeFC/FnrPM8tEk048D
 IRQg==
X-Gm-Message-State: AOAM5317GnLZFnvd3nM5QinDLnqy/gEpapasIGK4JjSjA8l87g3UaWIU
 XcGjAXIGQWmRGT86KoG4Hhg=
X-Google-Smtp-Source: ABdhPJz4wgHxqorF8SymxYsgdMbcKMazO/YeVmbdARH513+nwqLFgXqj/M2+nsAmDOB16B58UweAiA==
X-Received: by 2002:a9f:24d4:: with SMTP id 78mr4051625uar.47.1601264521635;
 Sun, 27 Sep 2020 20:42:01 -0700 (PDT)
Received: from localhost.localdomain ([50.236.19.102])
 by smtp.gmail.com with ESMTPSA id e3sm1363499vsa.8.2020.09.27.20.41.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Sep 2020 20:42:01 -0700 (PDT)
From: xiangxia.m.yue@gmail.com
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH 2/2] virtio-net: ethtool configurable RXCSUM
Date: Mon, 28 Sep 2020 11:39:15 +0800
Message-Id: <20200928033915.82810-2-xiangxia.m.yue@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200928033915.82810-1-xiangxia.m.yue@gmail.com>
References: <20200928033915.82810-1-xiangxia.m.yue@gmail.com>
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

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Signed-off-by: Tonghao Zhang <xiangxia.m.yue@gmail.com>
---
 drivers/net/virtio_net.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 21b71148c532..2e3af0b2c281 100644
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
@@ -2526,25 +2528,37 @@ static int virtnet_set_features(struct net_device *dev,
 				netdev_features_t features)
 {
 	struct virtnet_info *vi = netdev_priv(dev);
-	u64 offloads;
+	u64 offloads = vi->guest_offloads &
+		       vi->guest_offloads_capable;
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
+			offloads |= GUEST_OFFLOAD_LRO_MASK;
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
+			offloads |= GUEST_OFFLOAD_CSUM_MASK;
+		else
+			offloads &= ~GUEST_OFFLOAD_CSUM_MASK;
 	}
 
+	if (offloads == (vi->guest_offloads &
+			 vi->guest_offloads_capable))
+		return 0;
+
+	err = virtnet_set_guest_offloads(vi, offloads);
+	if (err)
+		return err;
+
+	vi->guest_offloads = offloads;
 	return 0;
 }
 
@@ -3013,8 +3027,10 @@ static int virtnet_probe(struct virtio_device *vdev)
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
