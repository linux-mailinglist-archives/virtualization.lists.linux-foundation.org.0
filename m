Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EBED9174857
	for <lists.virtualization@lfdr.de>; Sat, 29 Feb 2020 18:13:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 64B7584138;
	Sat, 29 Feb 2020 17:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ferPeWl0f9Hc; Sat, 29 Feb 2020 17:13:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B653484186;
	Sat, 29 Feb 2020 17:13:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99C95C0177;
	Sat, 29 Feb 2020 17:13:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1987AC0177
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F1AE586D5A
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NppwaF8I3smR
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:13:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B162486190
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:13:12 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v2so7133463wrp.12
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 09:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+fIQn9uyVer5wlDY9m6nXs8oyQIBHwFNHtVk99ISOtM=;
 b=h6R8hIBCaYjYWedumK3a7C0mS4sgxjN2FwmK9KSRKyMHBFgf/jBkRcjXXQ8zXSP/+9
 ofHQgj6esfKap7q0AmD4xfkRcENq1whofrteocJCm90kwTYLiPBRb036b1YVk5oXjIzI
 JbKre0+Z7TlgcR4cLtdp5NhnqHttcx7TtMF6QNy2Q1GqVHtPAPrM+jyHliqf0yctitw4
 r63DhCRx2hGfB15XPPZKpoRpYQQHewIysOC/UyuVqVhozHiAYlmkrp0FwGpV02cNCMpG
 wNeYr0jTkzU6Yfs+bbkDTMasTGyvosWr1rvRP9cmsnWMwvq/f5Ui08R0OU+NVTOf4jVH
 WL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+fIQn9uyVer5wlDY9m6nXs8oyQIBHwFNHtVk99ISOtM=;
 b=kl+il6t7vVkYRIg5nTfZtvlEpYnN8Z2aRFEjE+7nQPfdmV9cb0VMZqqnW5jUr2Wbar
 kB7yDeDWkJ8X6ejdDBK+kwEmY0CqVpfQpHLSTarjzMZA8gwTK80r4XDUULrWlCG6AzXQ
 jCps9Y/pqP2/NAFv7Y45b7Mxe6nmTVShW6jHdTJToHSAYsoQrqRwVPQFe4zeCXZh9Odb
 QJfroTDiblKczyNbhNYvxBYRfb+sJb4CXW1XrIpUfd9vhTr4MXfwqjHSK1veYQPwGXEC
 QPMdgygsBvQflfL0BkPuz0KS8q0c3KXau1SZpCark2Aqt4r3RKea2Hox3v1KljlXbi5w
 nuVg==
X-Gm-Message-State: APjAAAV0CFOZw9OnNyyxv3xB61h0+UW3VZHYdC9oAgOqKySj1wESRbqC
 Y7rl5/yGbQjGpnQpvavlUK5wy75BSx4=
X-Google-Smtp-Source: APXvYqzx8LxbQy09KKedElts1XVbFSl87BqgZV5YuuRgldvKx6wEGnoQqQ2d0nMlOLSibe72ECHNPA==
X-Received: by 2002:adf:de0b:: with SMTP id b11mr11109419wrm.89.1582996390949; 
 Sat, 29 Feb 2020 09:13:10 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id r1sm17045046wrx.11.2020.02.29.09.13.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 29 Feb 2020 09:13:10 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] virtio-net: Introduce RSS receive steering feature
Date: Sat, 29 Feb 2020 19:13:00 +0200
Message-Id: <20200229171301.15234-3-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200229171301.15234-1-yuri.benditovich@daynix.com>
References: <20200229171301.15234-1-yuri.benditovich@daynix.com>
Cc: yan@daynix.com
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

RSS (Receive-side scaling) defines hash calculation
rules and decision on receive virtqueue according to
the calculated hash, provided mask to apply and
provided indirection table containing indices of
receive virqueues. The driver sends the control
command to enable multiqueue and provide parameters
for receive steering.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 include/uapi/linux/virtio_net.h | 42 +++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
index 6e26a2cc6ad0..7a342657fb6c 100644
--- a/include/uapi/linux/virtio_net.h
+++ b/include/uapi/linux/virtio_net.h
@@ -57,6 +57,7 @@
 					 * Steering */
 #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
 
+#define VIRTIO_NET_F_RSS	  60	/* Supports RSS RX steering */
 #define VIRTIO_NET_F_RSC_EXT	  61	/* extended coalescing info */
 #define VIRTIO_NET_F_STANDBY	  62	/* Act as standby for another device
 					 * with the same MAC.
@@ -70,6 +71,17 @@
 #define VIRTIO_NET_S_LINK_UP	1	/* Link is up */
 #define VIRTIO_NET_S_ANNOUNCE	2	/* Announcement is needed */
 
+/* supported/enabled hash types */
+#define VIRTIO_NET_RSS_HASH_TYPE_IPv4          (1 << 0)
+#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4         (1 << 1)
+#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4         (1 << 2)
+#define VIRTIO_NET_RSS_HASH_TYPE_IPv6          (1 << 3)
+#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6         (1 << 4)
+#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6         (1 << 5)
+#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX         (1 << 6)
+#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX        (1 << 7)
+#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX        (1 << 8)
+
 struct virtio_net_config {
 	/* The config defining mac address (if VIRTIO_NET_F_MAC) */
 	__u8 mac[ETH_ALEN];
@@ -93,6 +105,12 @@ struct virtio_net_config {
 	 * Any other value stands for unknown.
 	 */
 	__u8 duplex;
+	/* maximal size of RSS key */
+	__u8 rss_max_key_size;
+	/* maximal number of indirection table entries */
+	__u16 rss_max_indirection_table_length;
+	/* bitmask of supported VIRTIO_NET_RSS_HASH_ types */
+	__u32 supported_hash_types;
 } __attribute__((packed));
 
 /*
@@ -236,7 +254,9 @@ struct virtio_net_ctrl_mac {
 
 /*
  * Control Receive Flow Steering
- *
+ */
+#define VIRTIO_NET_CTRL_MQ   4
+/*
  * The command VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET
  * enables Receive Flow Steering, specifying the number of the transmit and
  * receive queues that will be used. After the command is consumed and acked by
@@ -249,11 +269,29 @@ struct virtio_net_ctrl_mq {
 	__virtio16 virtqueue_pairs;
 };
 
-#define VIRTIO_NET_CTRL_MQ   4
  #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0
  #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN        1
  #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX        0x8000
 
+/*
+ * The command VIRTIO_NET_CTRL_MQ_RSS_CONFIG has the same effect as
+ * VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET does and additionally configures
+ * the receive steering to use a hash calculated for incoming packet
+ * to decide on receive virtqueue to place the packet. The command
+ * also provides parameters to calculate a hash and receive virtqueue.
+ */
+struct virtio_net_rss_config {
+	__virtio32 hash_types;
+	__virtio16 indirection_table_mask;
+	__virtio16 unclassified_queue;
+	__virtio16 indirection_table[1/* + indirection_table_mask*/];
+	__virtio16 max_tx_vq;
+	__u8 hash_key_length;
+	__u8 hash_key_data[/*hash_key_length*/];
+};
+
+ #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
+
 /*
  * Control network offloads
  *
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
