Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AE324E39E
	for <lists.virtualization@lfdr.de>; Sat, 22 Aug 2020 00:51:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7581386AA4;
	Fri, 21 Aug 2020 22:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xSlf_UmvLFPM; Fri, 21 Aug 2020 22:51:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5B06986A9A;
	Fri, 21 Aug 2020 22:51:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 331B1C0051;
	Fri, 21 Aug 2020 22:51:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB6BAC0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 22:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 898D5214EB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 22:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rrjSfxMiP9Co
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 22:51:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 38FEE20768
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 22:51:11 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id t23so2400165qto.3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 15:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m6ZztkKitApUlwV+ZX0Zt+Hf87PA0Zib6OW8N+QCBqM=;
 b=dcro/mrEGFp2nLXCD4ox6HKQkFBTr/8RKDRxQYJ7gMFpIv0vYubXMZbe+BlFWh4YWH
 NOKgqOcElmHokhlCQ5TvCJs73/IT8dLZ5XpDreQ+I9rPzm9aNaZ+DN6sxqHeeQYJC0gp
 UXdsP8x7yxYn+motOonBAWWu/O8YLTHhfvjU39vDd5R3Vu68sllTJvhlFx1DehJZgJfK
 xo29Zr0Wq6QFuUSALkdsGMqxjSR+w7G/ZjJputBSXQm5uSkZY1UKYSqQbimkdaMJpFX3
 KXVWB00Jysfv6Y+japygpqwozv35cK2QwSwPrk4XfP+Vfuw5MAJMqv4LmrAzuTI61CRT
 Ykmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m6ZztkKitApUlwV+ZX0Zt+Hf87PA0Zib6OW8N+QCBqM=;
 b=Rj6zpb7iBihR4gYKe2YF/1j8ojZnpv3pz2GGAZIn3ko1Ks1VLeWfeQLe7wdSQ4xheK
 qLghybsnIjPYmoZyEv9A9ZRrU+m3T+X0Q8aAcFVb0+EYPhxMIU+9g54OKQgxD+ly5pvU
 EuPw2dZr6sMWtQEoVNV/m/A4hFXgBQUq+Pe3p1cxbFvubhqoU2t9xgnSJCvLpwk3xeLb
 fJJ9ss4PYLkOyc/yGCVogbl4i3d1qiENP3oWVtPdanFHnXbeFArDhSeP6yP6QSQTDHrB
 97brgqCnlNRFQOcjlegYDeHDyF55qSqUivWjqmNGZK54w/lGAjdUugGFC9FfRkRCeWVt
 wGgw==
X-Gm-Message-State: AOAM530o6sJCR+V/eNulZEdzQ+5c4ojRRmYBajmEtFA0nsYyhPBhK7u7
 0juhwfJzGHx7nU7FaDbpgAA=
X-Google-Smtp-Source: ABdhPJxdxS/JxHTibt9uGmlF1XjwT6ZAbA+EmmReynT0Zhv+da9t0oBhGD9valDYDz1kkvoZeeUvMg==
X-Received: by 2002:ac8:14a:: with SMTP id f10mr4828355qtg.232.1598050270120; 
 Fri, 21 Aug 2020 15:51:10 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:45d1:2600::1])
 by smtp.gmail.com with ESMTPSA id o17sm3367235qtr.13.2020.08.21.15.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 15:51:09 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Eli Cohen <eli@mellanox.com>
Subject: [PATCH] vdpa/mlx5: Avoid warnings about shifts on 32-bit platforms
Date: Fri, 21 Aug 2020 15:50:19 -0700
Message-Id: <20200821225018.940798-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linux-kernel@vger.kernel.org,
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

Clang warns several times when building for 32-bit ARM along the lines
of:

drivers/vdpa/mlx5/net/mlx5_vnet.c:1462:31: warning: shift count >= width
of type [-Wshift-count-overflow]
                ndev->mvdev.mlx_features |= BIT(VIRTIO_F_VERSION_1);
                                            ^~~~~~~~~~~~~~~~~~~~~~~

This is related to the BIT macro, which uses an unsigned long literal,
which is 32-bit on ARM so having a shift equal to or larger than 32 will
cause this warning, such as the above, where VIRTIO_F_VERSION_1 is 32.
To avoid this, use BIT_ULL, which will be an unsigned long long. This
matches the size of the features field throughout this driver, which is
u64 so there should be no functional change.

Fixes: 1a86b377aa21 ("vdpa/mlx5: Add VDPA driver for supported mlx5 devices")
Link: https://github.com/ClangBuiltLinux/linux/issues/1140
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/vdpa/mlx5/net/mlx5_vnet.c | 50 +++++++++++++++----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index 9df69d5efe8c..70676a6d1691 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -16,19 +16,19 @@
 #define to_mvdev(__vdev) container_of((__vdev), struct mlx5_vdpa_dev, vdev)
 
 #define VALID_FEATURES_MASK                                                                        \
-	(BIT(VIRTIO_NET_F_CSUM) | BIT(VIRTIO_NET_F_GUEST_CSUM) |                                   \
-	 BIT(VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) | BIT(VIRTIO_NET_F_MTU) | BIT(VIRTIO_NET_F_MAC) |   \
-	 BIT(VIRTIO_NET_F_GUEST_TSO4) | BIT(VIRTIO_NET_F_GUEST_TSO6) |                             \
-	 BIT(VIRTIO_NET_F_GUEST_ECN) | BIT(VIRTIO_NET_F_GUEST_UFO) | BIT(VIRTIO_NET_F_HOST_TSO4) | \
-	 BIT(VIRTIO_NET_F_HOST_TSO6) | BIT(VIRTIO_NET_F_HOST_ECN) | BIT(VIRTIO_NET_F_HOST_UFO) |   \
-	 BIT(VIRTIO_NET_F_MRG_RXBUF) | BIT(VIRTIO_NET_F_STATUS) | BIT(VIRTIO_NET_F_CTRL_VQ) |      \
-	 BIT(VIRTIO_NET_F_CTRL_RX) | BIT(VIRTIO_NET_F_CTRL_VLAN) |                                 \
-	 BIT(VIRTIO_NET_F_CTRL_RX_EXTRA) | BIT(VIRTIO_NET_F_GUEST_ANNOUNCE) |                      \
-	 BIT(VIRTIO_NET_F_MQ) | BIT(VIRTIO_NET_F_CTRL_MAC_ADDR) | BIT(VIRTIO_NET_F_HASH_REPORT) |  \
-	 BIT(VIRTIO_NET_F_RSS) | BIT(VIRTIO_NET_F_RSC_EXT) | BIT(VIRTIO_NET_F_STANDBY) |           \
-	 BIT(VIRTIO_NET_F_SPEED_DUPLEX) | BIT(VIRTIO_F_NOTIFY_ON_EMPTY) |                          \
-	 BIT(VIRTIO_F_ANY_LAYOUT) | BIT(VIRTIO_F_VERSION_1) | BIT(VIRTIO_F_ACCESS_PLATFORM) |      \
-	 BIT(VIRTIO_F_RING_PACKED) | BIT(VIRTIO_F_ORDER_PLATFORM) | BIT(VIRTIO_F_SR_IOV))
+	(BIT_ULL(VIRTIO_NET_F_CSUM) | BIT_ULL(VIRTIO_NET_F_GUEST_CSUM) |                                   \
+	 BIT_ULL(VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) | BIT_ULL(VIRTIO_NET_F_MTU) | BIT_ULL(VIRTIO_NET_F_MAC) |   \
+	 BIT_ULL(VIRTIO_NET_F_GUEST_TSO4) | BIT_ULL(VIRTIO_NET_F_GUEST_TSO6) |                             \
+	 BIT_ULL(VIRTIO_NET_F_GUEST_ECN) | BIT_ULL(VIRTIO_NET_F_GUEST_UFO) | BIT_ULL(VIRTIO_NET_F_HOST_TSO4) | \
+	 BIT_ULL(VIRTIO_NET_F_HOST_TSO6) | BIT_ULL(VIRTIO_NET_F_HOST_ECN) | BIT_ULL(VIRTIO_NET_F_HOST_UFO) |   \
+	 BIT_ULL(VIRTIO_NET_F_MRG_RXBUF) | BIT_ULL(VIRTIO_NET_F_STATUS) | BIT_ULL(VIRTIO_NET_F_CTRL_VQ) |      \
+	 BIT_ULL(VIRTIO_NET_F_CTRL_RX) | BIT_ULL(VIRTIO_NET_F_CTRL_VLAN) |                                 \
+	 BIT_ULL(VIRTIO_NET_F_CTRL_RX_EXTRA) | BIT_ULL(VIRTIO_NET_F_GUEST_ANNOUNCE) |                      \
+	 BIT_ULL(VIRTIO_NET_F_MQ) | BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) | BIT_ULL(VIRTIO_NET_F_HASH_REPORT) |  \
+	 BIT_ULL(VIRTIO_NET_F_RSS) | BIT_ULL(VIRTIO_NET_F_RSC_EXT) | BIT_ULL(VIRTIO_NET_F_STANDBY) |           \
+	 BIT_ULL(VIRTIO_NET_F_SPEED_DUPLEX) | BIT_ULL(VIRTIO_F_NOTIFY_ON_EMPTY) |                          \
+	 BIT_ULL(VIRTIO_F_ANY_LAYOUT) | BIT_ULL(VIRTIO_F_VERSION_1) | BIT_ULL(VIRTIO_F_ACCESS_PLATFORM) |      \
+	 BIT_ULL(VIRTIO_F_RING_PACKED) | BIT_ULL(VIRTIO_F_ORDER_PLATFORM) | BIT_ULL(VIRTIO_F_SR_IOV))
 
 #define VALID_STATUS_MASK                                                                          \
 	(VIRTIO_CONFIG_S_ACKNOWLEDGE | VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_DRIVER_OK |        \
@@ -149,7 +149,7 @@ static bool mlx5_vdpa_debug;
 
 #define MLX5_LOG_VIO_FLAG(_feature)                                                                \
 	do {                                                                                       \
-		if (features & BIT(_feature))                                                      \
+		if (features & BIT_ULL(_feature))                                                  \
 			mlx5_vdpa_info(mvdev, "%s\n", #_feature);                                  \
 	} while (0)
 
@@ -750,10 +750,10 @@ static bool vq_is_tx(u16 idx)
 
 static u16 get_features_12_3(u64 features)
 {
-	return (!!(features & BIT(VIRTIO_NET_F_HOST_TSO4)) << 9) |
-	       (!!(features & BIT(VIRTIO_NET_F_HOST_TSO6)) << 8) |
-	       (!!(features & BIT(VIRTIO_NET_F_CSUM)) << 7) |
-	       (!!(features & BIT(VIRTIO_NET_F_GUEST_CSUM)) << 6);
+	return (!!(features & BIT_ULL(VIRTIO_NET_F_HOST_TSO4)) << 9) |
+	       (!!(features & BIT_ULL(VIRTIO_NET_F_HOST_TSO6)) << 8) |
+	       (!!(features & BIT_ULL(VIRTIO_NET_F_CSUM)) << 7) |
+	       (!!(features & BIT_ULL(VIRTIO_NET_F_GUEST_CSUM)) << 6);
 }
 
 static int create_virtqueue(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *mvq)
@@ -1439,13 +1439,13 @@ static u64 mlx_to_vritio_features(u16 dev_features)
 	u64 result = 0;
 
 	if (dev_features & MLX5_VIRTIO_NET_F_GUEST_CSUM)
-		result |= BIT(VIRTIO_NET_F_GUEST_CSUM);
+		result |= BIT_ULL(VIRTIO_NET_F_GUEST_CSUM);
 	if (dev_features & MLX5_VIRTIO_NET_F_CSUM)
-		result |= BIT(VIRTIO_NET_F_CSUM);
+		result |= BIT_ULL(VIRTIO_NET_F_CSUM);
 	if (dev_features & MLX5_VIRTIO_NET_F_HOST_TSO6)
-		result |= BIT(VIRTIO_NET_F_HOST_TSO6);
+		result |= BIT_ULL(VIRTIO_NET_F_HOST_TSO6);
 	if (dev_features & MLX5_VIRTIO_NET_F_HOST_TSO4)
-		result |= BIT(VIRTIO_NET_F_HOST_TSO4);
+		result |= BIT_ULL(VIRTIO_NET_F_HOST_TSO4);
 
 	return result;
 }
@@ -1459,15 +1459,15 @@ static u64 mlx5_vdpa_get_features(struct vdpa_device *vdev)
 	dev_features = MLX5_CAP_DEV_VDPA_EMULATION(mvdev->mdev, device_features_bits_mask);
 	ndev->mvdev.mlx_features = mlx_to_vritio_features(dev_features);
 	if (MLX5_CAP_DEV_VDPA_EMULATION(mvdev->mdev, virtio_version_1_0))
-		ndev->mvdev.mlx_features |= BIT(VIRTIO_F_VERSION_1);
-	ndev->mvdev.mlx_features |= BIT(VIRTIO_F_ACCESS_PLATFORM);
+		ndev->mvdev.mlx_features |= BIT_ULL(VIRTIO_F_VERSION_1);
+	ndev->mvdev.mlx_features |= BIT_ULL(VIRTIO_F_ACCESS_PLATFORM);
 	print_features(mvdev, ndev->mvdev.mlx_features, false);
 	return ndev->mvdev.mlx_features;
 }
 
 static int verify_min_features(struct mlx5_vdpa_dev *mvdev, u64 features)
 {
-	if (!(features & BIT(VIRTIO_F_ACCESS_PLATFORM)))
+	if (!(features & BIT_ULL(VIRTIO_F_ACCESS_PLATFORM)))
 		return -EOPNOTSUPP;
 
 	return 0;

base-commit: 8a7c3213db068135e816a6a517157de6443290d6
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
