Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7999C1759C0
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 12:52:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1921986005;
	Mon,  2 Mar 2020 11:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OuL57XiNw9Ut; Mon,  2 Mar 2020 11:52:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5975085DB1;
	Mon,  2 Mar 2020 11:52:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44062C013E;
	Mon,  2 Mar 2020 11:52:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0795C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CCCB720457
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tsrye3ZN4-iG
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:52:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 4E2D42042E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:52:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so12218782wrn.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 03:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=f0jlRREPp+qvSUzyqdvi182saYlUvj1fqcCr6A7iT98=;
 b=WEfErNummzVNPDXp6mSj1QfU+vBXrqbhv/XRX+Blv0VeEP0OKon7Jy80I83PYThhKo
 lkwfoJOTDXCQVykBtqZUypzvBUy+2KYCX04MF+fVgCNUCmgmOhvNfeCtg3iwNHrewqSM
 yWZuolGu53u6RVYngaNiFswzSCTOq3myCijl/SBDtqyu91+l6YWFnnXImP6BCmirbhKg
 16xoYC2gEq0jJPl3KSUQSvlphyxh5TgRkk/TNUdd8/K1zQOWa5zmC+nyEw4HD48X4Oy5
 De8qMKGRS6VZhWodZoyRCHiDPAxlHf0NZHW9XWDivBS6H+URkOHpuOHuqZwNrd8zoiGa
 kJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=f0jlRREPp+qvSUzyqdvi182saYlUvj1fqcCr6A7iT98=;
 b=Jn24U2OxNsSS/jXAsGC5frVfGrB+8/2ZZwrvofSK3lAlHxxzbQ5bqVqW1baB0UGtM2
 0QhEK5PDl4yVM/yaAp9WGQSt4QcNoTNtnfRpGCgcf5TdmzjOkA6pmYSalK3jtj1cZ4WP
 BqHyd+TcM6y7u3rFy2pOvlIT8bheBJxao0B3o01//2YFKSCuJ/qVwRsDHaZNeO73BXCo
 lyew4Tdhv3zpICRdR+wIgAo588GH0eZ6I3l+rM8IMO1qEdIBECoDmtvQX4E+nQc145MF
 kQDQti8Lx8RaUE+sQAaWkbhZPLGsupcjD+7dapOejYmJdD+W/r6S05Acf2+xFBV5cF94
 PLeA==
X-Gm-Message-State: ANhLgQ1lLSdyygr5tN2204t6f+8YhP4JQodQBejNieSKFJwGnJntz1yP
 eFCNdohk0DoIhCmf/BP9GHIPxuZ++g4=
X-Google-Smtp-Source: ADFU+vt3izvKzbg+cQGUqCdtnD08DR30DaEbVrlJvInZ/qBhReNEowIZE5bPJuXGl3MSU9DYF+2o5A==
X-Received: by 2002:adf:f105:: with SMTP id r5mr12448129wro.314.1583149919738; 
 Mon, 02 Mar 2020 03:51:59 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id f17sm16840364wrj.28.2020.03.02.03.51.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Mar 2020 03:51:59 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] virtio-net: Introduce RSS receive steering feature
Date: Mon,  2 Mar 2020 13:50:02 +0200
Message-Id: <20200302115003.14877-3-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200302115003.14877-1-yuri.benditovich@daynix.com>
References: <20200302115003.14877-1-yuri.benditovich@daynix.com>
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
index 6466c5979a93..aec6fac3666a 100644
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
@@ -248,7 +266,9 @@ struct virtio_net_ctrl_mac {
 
 /*
  * Control Receive Flow Steering
- *
+ */
+#define VIRTIO_NET_CTRL_MQ   4
+/*
  * The command VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET
  * enables Receive Flow Steering, specifying the number of the transmit and
  * receive queues that will be used. After the command is consumed and acked by
@@ -261,11 +281,29 @@ struct virtio_net_ctrl_mq {
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
