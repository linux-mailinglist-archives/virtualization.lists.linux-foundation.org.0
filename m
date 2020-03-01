Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AF5174DA8
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 15:33:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 225AD87824;
	Sun,  1 Mar 2020 14:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hu7klf3K4v0g; Sun,  1 Mar 2020 14:33:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 308B387860;
	Sun,  1 Mar 2020 14:33:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27F5AC07FE;
	Sun,  1 Mar 2020 14:33:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5A3FC07FE
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A29E68584A
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id my0okV3_1SxL
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BD9BA857FB
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e10so7765777wrr.10
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 06:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AkhjaV2U386xal/zszLDOfObdUkcke5EWewGOR3a+d0=;
 b=UvHfkOtDekecdk3VJ2I7QAi9fjYkrUv4I17dIOSjDXGGEe1hycXWsiuiYCQk27rk88
 WpHq5VNnOa3DknUvS+iMD0f8Qb4tnkNwWO1xAYEK6fjcEX2qXxc53CfxHDbobXuc4rcW
 N7kPls2/dmiviJ4Jygx2BfuGW39rOhv6VpGwCLP7PzCHU1c75hzcG27WU76JVlmo2xyV
 iMnuL+ZCB3926BLg0l49KcTQ8tbcuO6iPHFUlQlZO9t0h2DhSlF99cTAOqK3WbnxHc4A
 iOJe71fd9tCn5WF47vWqt9KXtZdHhDEeREMTIOFbNGP0buwDKQLC/L/rrxfHsDhzuk1j
 p22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AkhjaV2U386xal/zszLDOfObdUkcke5EWewGOR3a+d0=;
 b=CuFTWgIV6Z+9RG49WOdZBXbrdIchtUdPK9ZcrsVInkLZeazEfEWM0TTU81wawSIkxV
 IfnCpUMFCaFfl7xWvMyJTDpmceG4l6wsy0s5N+N0xC+1F8qw1LiJ2yY9zCyg8aWHbyZI
 aQ0hBonFonkkEoP8AFx7UKCXqh0yC90ycOvl+SH7hCAZ6mNAk9gEyDW6fRMk0/oAueFi
 crCAZNjtvdD6L7rVANS3+H/k65MUZj/kJQU03wmoQxQps++9MtlMXrxdf/4RhTTyoL3a
 hN+ktWzakjxiWMC8hJPIZbDmu/b9dqfHNApQ9ozNeCssgmYnFQ6odgVde409qE0AjAlf
 WLLA==
X-Gm-Message-State: ANhLgQ2MscWjL+FkTlFVl5sHF5JfEs2i2Y4UJnCqWUxzM4VCLvcp85It
 0ADl2m74GOglLbtuKuMKalFNIA==
X-Google-Smtp-Source: ADFU+vuAv02/b5EHJnyIlUzx4EDC9EjhCbPqKC+IElKUQwfRdUMU541qOT+J2y86saa3RAORVOneOg==
X-Received: by 2002:adf:cf0d:: with SMTP id o13mr1476179wrj.74.1583073191242; 
 Sun, 01 Mar 2020 06:33:11 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id l4sm23617241wrv.22.2020.03.01.06.33.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 01 Mar 2020 06:33:10 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] virtio-net: Introduce RSS receive steering feature
Date: Sun,  1 Mar 2020 16:33:01 +0200
Message-Id: <20200301143302.8556-3-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200301143302.8556-1-yuri.benditovich@daynix.com>
References: <20200301143302.8556-1-yuri.benditovich@daynix.com>
Cc: yan@daynix.com, virtio-dev@lists.oasis-open.org
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
index 19e76b3e3a64..188ad3eecdc8 100644
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
+	/* maximum size of RSS key */
+	__u8 rss_max_key_size;
+	/* maximum number of indirection table entries */
+	__le16 rss_max_indirection_table_length;
+	/* bitmask of supported VIRTIO_NET_RSS_HASH_ types */
+	__le32 supported_hash_types;
 } __attribute__((packed));
 
 /*
@@ -246,7 +264,9 @@ struct virtio_net_ctrl_mac {
 
 /*
  * Control Receive Flow Steering
- *
+ */
+#define VIRTIO_NET_CTRL_MQ   4
+/*
  * The command VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET
  * enables Receive Flow Steering, specifying the number of the transmit and
  * receive queues that will be used. After the command is consumed and acked by
@@ -259,11 +279,29 @@ struct virtio_net_ctrl_mq {
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
+	__le32 hash_types;
+	__le16 indirection_table_mask;
+	__le16 unclassified_queue;
+	__le16 indirection_table[1/* + indirection_table_mask */];
+	__le16 max_tx_vq;
+	__u8 hash_key_length;
+	__u8 hash_key_data[/* hash_key_length */];
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
