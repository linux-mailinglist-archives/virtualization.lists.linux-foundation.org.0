Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 20023174CDF
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 12:07:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B220C87D58;
	Sun,  1 Mar 2020 11:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDs1cEwaHXTm; Sun,  1 Mar 2020 11:07:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C61287D55;
	Sun,  1 Mar 2020 11:07:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04251C013E;
	Sun,  1 Mar 2020 11:07:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54666C013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5073A204E1
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0JMAyIzVMQC
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:07:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 181A0204D7
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:07:46 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e10so7405007wrr.10
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 03:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p/KmgnJg9kBEfvlzJJFSl6WfUIRmWHlWaOmzFYMMrw0=;
 b=NR0iRoFKv1Y0daC49tBZsWfbMDIN1XjcnZR8nA0VyEAKoGG8Zv6I6SVpsb5jyK7AdO
 3Fi/genDMftosGJnlvFCyxJaPM8w8QlZjV0WHy6wMiTnPAqwFzM62XZdis0CtSKmThfn
 0u/SvS7a55aezXHVJK0QUDAOaN9nQUd4kMl7bHnRt7jdaU5iAOY6wKqOZAxuBjuVTs9Y
 vrLu6bgyLBpZiHLz0c+zuGVWYa+jnZnx43U4dnlQUzCPHu0hhrf8C6HKxe2OfuV3bEks
 5NOpcHlb9Tlat4tsArmpvIKNoqB6220SJFmUaJSGdbro37/A+o3YwHLX9K6HwkQAVBit
 IuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p/KmgnJg9kBEfvlzJJFSl6WfUIRmWHlWaOmzFYMMrw0=;
 b=uj76EGLyS2DdyDlrshNkc03Wo0NFUtB+Tp6DknWrl2LuB7zQCF3RAsopjjtQCLEYVP
 LZM6o1YoB5gTrRGHG9fNu8hyPWzfW3qBv326zvzOn7N1WTCV8ZvEVCBI1Rb0NfcPpCQi
 I0O/pDEt0ik/VgSW2nkmFiav32uh+RetLbHgFZbKjS5djnWf/vgNRoHf5XbCv6hU8Gis
 UKwyNZSs3k9UbrZ/M9SGRhpBZ391UkwaENFbeeHqofjW3NIuV/vrAq1Cnh0zGuhhV/63
 5RHZjK1sj1BZ3VJ/ajPG6CyGsy/wwebzqz7ygG/FBq4LNW10VH8Wh6J+TowJ1EQjOQ6+
 Pbvw==
X-Gm-Message-State: APjAAAWLhJKQ0hPN+n7G8ORNwg1ZOL6LVq2j2gIXRMtl+FhAtnmPVvwE
 3SdVlbElWkY00rxb77mqZN+jEA==
X-Google-Smtp-Source: APXvYqxPL7x56TY1BrWRmoLhp0P70FyZV8p48kmLRnJLaOrD6PswXgPjUHoAnKbl/91J/HWSYDim1Q==
X-Received: by 2002:a5d:5286:: with SMTP id c6mr9721951wrv.418.1583060864461; 
 Sun, 01 Mar 2020 03:07:44 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id i7sm11563243wma.32.2020.03.01.03.07.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 01 Mar 2020 03:07:43 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] virtio-net: Introduce hash report feature
Date: Sun,  1 Mar 2020 13:07:33 +0200
Message-Id: <20200301110733.20197-4-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200301110733.20197-1-yuri.benditovich@daynix.com>
References: <20200301110733.20197-1-yuri.benditovich@daynix.com>
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

The feature VIRTIO_NET_F_HASH_REPORT extends the
layout of the packet and requests the device to
calculate hash on incoming packets and report it
in the packet header.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 include/uapi/linux/virtio_net.h | 36 +++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
index 6b309fe23671..c9ca62dd77a4 100644
--- a/include/uapi/linux/virtio_net.h
+++ b/include/uapi/linux/virtio_net.h
@@ -57,6 +57,7 @@
 					 * Steering */
 #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
 
+#define VIRTIO_NET_F_HASH_REPORT  57	/* Supports hash report */
 #define VIRTIO_NET_F_RSS	  60	/* Supports RSS RX steering */
 #define VIRTIO_NET_F_RSC_EXT	  61	/* extended coalescing info */
 #define VIRTIO_NET_F_STANDBY	  62	/* Act as standby for another device
@@ -144,6 +145,23 @@ struct virtio_net_hdr_v1 {
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
@@ -292,6 +310,24 @@ struct virtio_net_rss_config {
 
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
