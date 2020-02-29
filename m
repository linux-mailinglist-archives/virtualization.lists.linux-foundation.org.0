Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E98A017485B
	for <lists.virtualization@lfdr.de>; Sat, 29 Feb 2020 18:18:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4A7D8845C1;
	Sat, 29 Feb 2020 17:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NllRFG4SxV7; Sat, 29 Feb 2020 17:18:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C27C7845A3;
	Sat, 29 Feb 2020 17:18:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A644FC1D8E;
	Sat, 29 Feb 2020 17:18:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F321C0177
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 336F7879C3
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JzB-j3BkUIl0
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:18:27 +0000 (UTC)
X-Greylist: delayed 00:05:16 by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 757A0879A7
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:18:27 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f15so6840332wml.3
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 09:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XFcDlTrKIHj2foS9qGqB/jgRVxoWhysNTBBaTEafaDQ=;
 b=zeGutF9tzPl0q7tv0RmDUy0O/CtHNm/XDcg82ysRNGPKvpSSBi8dPNoE7egnm5PHXT
 tU5nwxXPi5k+XOdzGci2EUZEPrIVrdKWFnbZ5f33Y4/I2d97bJROJx+f/iZd7l8zesn1
 oRQ20/1zHkitB6W6h/QqQRKEtBilIU+LO3DRuCQ9QQUd4Ml/vb5TQk3cg9pDmxyUmpW+
 wjS/KhgbRbZad0wAjhl5h5eWHGFQffwc6jPewA3ZsurKfQ/PbzQVr9jbg4HLmHvoC9k6
 N50rThX5j6dJ/q6OZ4gGvy9+ymgqupgVo2yZCBtLQrUMaeuVFqDoDJUFNNJ4QJEYiHg4
 jXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XFcDlTrKIHj2foS9qGqB/jgRVxoWhysNTBBaTEafaDQ=;
 b=QQq5n6ZZaJkGfDiJpHfhZZcQCgOkesdbH4NximREwaBhCRgNc3U9AChgQutZSvLsx1
 NPscxZ+xrv7ki5IfPaRmGonwrIJbQwJOhAB5I6xNkJIBDQciHMRo1W3basQa3M/I9Dei
 SYCWy284AfBt0A1MXaZ/CIqhXbEZqXT34gL3XTSS03Fea0Rzgt/9Pl8yB1XbCo6onISV
 CqV0XvCZaK5fBPlT6KbZIwtHTJmTvXODeEhccC0qMT2M7pzeJ/x3BmBAkWmW8h8qO4bt
 Os623/pnkXEWkTKL83wjUow08mvZmUTMNwzL8SpXR1Ugd7hQNmwjDKE2unLamE/DAKka
 Ee+Q==
X-Gm-Message-State: APjAAAVH66u93b9mrxEJNPOIHflwt3ylP+ct7N9Ho864menmjtvVfjk8
 o2lVnLQPa/uWua9PJjVrHYQ5LvEqXIs=
X-Google-Smtp-Source: APXvYqyfXOsAkfb+WZU94O3Uhfef8Bs7qDGwfrmczN9tcH4C4qyns8k0e3hADV1FZJVNG/VDNUQKOA==
X-Received: by 2002:a05:600c:2283:: with SMTP id
 3mr10573988wmf.100.1582996392052; 
 Sat, 29 Feb 2020 09:13:12 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id r1sm17045046wrx.11.2020.02.29.09.13.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 29 Feb 2020 09:13:11 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] virtio-net: Introduce hash report feature
Date: Sat, 29 Feb 2020 19:13:01 +0200
Message-Id: <20200229171301.15234-4-yuri.benditovich@daynix.com>
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

The feature VIRTIO_NET_F_HASH_REPORT extends the
layout of the packet and requests the device to
calculate hash on incoming packets and report it
in the packet header.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 include/uapi/linux/virtio_net.h | 36 +++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
index 7a342657fb6c..6d7230469c57 100644
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
+	__virtio32 hash_value;
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
+	__virtio16 hash_report;
+	__virtio16 padding;
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
+	__virtio32 hash_types;
+	/* for compatibility with virtio_net_rss_config */
+	__virtio16 reserved[4];
+	__u8 hash_key_length;
+	__u8 hash_key_data[/*hash_key_length*/];
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
