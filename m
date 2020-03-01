Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 95440174DAB
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 15:33:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 42FB187829;
	Sun,  1 Mar 2020 14:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgAY+CVD35ci; Sun,  1 Mar 2020 14:33:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B52CD8789D;
	Sun,  1 Mar 2020 14:33:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E5A4C013E;
	Sun,  1 Mar 2020 14:33:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9F99C013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CBB3C85852
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 05J56EtBWaOR
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 13685857FB
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:14 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 9so2110304wmo.1
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 06:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6v9HE9PaNSFSyQOJMv/jnK9fSFyNaAnUECJQXmi/yS8=;
 b=NiTiBAK4qmJbQ49H0pGQ+YaewMiqj5ls5DHJG4eKlmGff7DWVsAavS8RcnQVEK1zOw
 HJs53nKQ9kfaFQtW9EoCeuvYuooilM/vb7ccZ/xcndOz2Owlfs4UbgmoVFlFMNl4nBBr
 wf8xDNzWIol4iMY22lIgOzqnPY5VjHK9unGsqPHHyQdLs92C8CiamIHvywLmGkeE9YO9
 QR5prY4+PUaF6qnsbdng856ea6LsC1AfXRZ6Ffqk182OusxeExqtNOdAUwYMAdQxPNTU
 Ax6Kg+GjV0n/IpgqZyqjn507ggjzqNzwIAowuXcCrJkgQOrZKaFzxwGHb4OJzWeEWUNY
 VPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6v9HE9PaNSFSyQOJMv/jnK9fSFyNaAnUECJQXmi/yS8=;
 b=mqDftt0fe2ukNVroXIAEogbR18TAfhEUcsbi36ox3+u/VnYGGuojtZbEpRWtTydhS9
 mb7G27kceS1zySSrd4uHHt+o/WF9OJS3ayRRSCCSdGeYK6fG7B7utQ7UWXBdcnU9+Wf/
 HJtDmCW3sDEL9OyAnWH8IoeyLWM6UQHQOKT/WgtKgcL2FzmVxXz9woPOA8F91g4XUliD
 dkEywpvx3LQ/SQhqW+KTHxSG/BBdnbnszgtV3+KQyf8Px9ka1uU8mBCE5SHhtRTxnikU
 Z/ON2AtVfnx1yWsHom9Qz59pGIpDwmInlISRQWQkK526sZ7AGzP9kaI6bRbvFSFjScG2
 oQAA==
X-Gm-Message-State: APjAAAUaJEmVWYCSLbqtETzxnJ7I/vk17zSgTNOi3xbGoaoK8rIFy+Ny
 Z4GGWYZpsCcye4mJNlY/PogF6w==
X-Google-Smtp-Source: APXvYqw3c1K/E9lEXPJfSvhr5xTxWnB+Cd8RzSbW3TNjHk8/J8zOGEc0yS2ip1ihIIRTYNOBGuDAHw==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr13975164wmg.147.1583073192506; 
 Sun, 01 Mar 2020 06:33:12 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id l4sm23617241wrv.22.2020.03.01.06.33.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 01 Mar 2020 06:33:12 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] virtio-net: Introduce hash report feature
Date: Sun,  1 Mar 2020 16:33:02 +0200
Message-Id: <20200301143302.8556-4-yuri.benditovich@daynix.com>
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

The feature VIRTIO_NET_F_HASH_REPORT extends the
layout of the packet and requests the device to
calculate hash on incoming packets and report it
in the packet header.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 include/uapi/linux/virtio_net.h | 36 +++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
index 188ad3eecdc8..4bd940501ba6 100644
--- a/include/uapi/linux/virtio_net.h
+++ b/include/uapi/linux/virtio_net.h
@@ -57,6 +57,7 @@
 					 * Steering */
 #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
 
+#define VIRTIO_NET_F_HASH_REPORT  57	/* Supports hash report */
 #define VIRTIO_NET_F_RSS	  60	/* Supports RSS RX steering */
 #define VIRTIO_NET_F_RSC_EXT	  61	/* extended coalescing info */
 #define VIRTIO_NET_F_STANDBY	  62	/* Act as standby for another device
@@ -154,6 +155,23 @@ struct virtio_net_hdr_v1 {
 	__virtio16 num_buffers;	/* Number of merged rx buffers */
 };
 
+struct virtio_net_hdr_v1_hash {
+	struct virtio_net_hdr_v1 hdr;
+	__le32 hash_value;
+#define VIRTIO_NET_HASH_REPORT_NONE            0
+#define VIRTIO_NET_HASH_REPORT_IPv4            1
+#define VIRTIO_NET_HASH_REPORT_TCPv4           2
+#define VIRTIO_NET_HASH_REPORT_UDPv4           3
+#define VIRTIO_NET_HASH_REPORT_IPv6            4
+#define VIRTIO_NET_HASH_REPORT_TCPv6           5
+#define VIRTIO_NET_HASH_REPORT_UDPv6           6
+#define VIRTIO_NET_HASH_REPORT_IPv6_EX         7
+#define VIRTIO_NET_HASH_REPORT_TCPv6_EX        8
+#define VIRTIO_NET_HASH_REPORT_UDPv6_EX        9
+	__le16 hash_report;
+	__le16 padding;
+};
+
 #ifndef VIRTIO_NET_NO_LEGACY
 /* This header comes first in the scatter-gather list.
  * For legacy virtio, if VIRTIO_F_ANY_LAYOUT is not negotiated, it must
@@ -302,6 +320,24 @@ struct virtio_net_rss_config {
 
  #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
 
+/*
+ * The command VIRTIO_NET_CTRL_MQ_HASH_CONFIG requests the device
+ * to include in the virtio header of the packet the value of the
+ * calculated hash and the report type of hash. It also provides
+ * parameters for hash calculation. The command requires feature
+ * VIRTIO_NET_F_HASH_REPORT to be negotiated to extend the
+ * layout of virtio header as defined in virtio_net_hdr_v1_hash.
+ */
+struct virtio_net_hash_config {
+	__le32 hash_types;
+	/* for compatibility with virtio_net_rss_config */
+	__le16 reserved[4];
+	__u8 hash_key_length;
+	__u8 hash_key_data[/* hash_key_length */];
+};
+
+ #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG         2
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
