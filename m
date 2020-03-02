Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4AC1759C1
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 12:52:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2A615857D1;
	Mon,  2 Mar 2020 11:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKPMVEaZUn2z; Mon,  2 Mar 2020 11:52:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A4ACB85775;
	Mon,  2 Mar 2020 11:52:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85A1AC013E;
	Mon,  2 Mar 2020 11:52:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B843C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 58282860BC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m15nUMT01PaB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:52:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8AC1C86221
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:52:02 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r7so12214277wro.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 03:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KtdcpgsksXCx1N4N2bM6NED9m5ZpIIGrgkQBZ4ZE1c4=;
 b=PC6rsdhxq3sffskqU9+IRBQU1RA7FSmDXgH/2QnRv45n319Ca/KtUTWn5ppS0T246I
 QqQ+dP7j3czlTkfJqoKmyeos0Irmese2b/vIpuPlhcHb1vKG7Rz33tTWaRl5KHFS/qLP
 6k2EJg+PSRe8NzKrlkWnCbpK4KkxVbyTqYuyk7fo8+pYMKWFTQtuN93itdmXzBwa5XIJ
 yDIdwSk5MpFq4in6PhoAgWF61UtOWYooqAoNT0JvWL4JnZlkliPcHKa2yMyfnajsCnQh
 zfnjbIxdc39pJnzq4NbZAcGunvQuoaHw2pNwl42ZRtTcUCf30DAC+DDdDi8kHTnNhxYX
 rJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KtdcpgsksXCx1N4N2bM6NED9m5ZpIIGrgkQBZ4ZE1c4=;
 b=cy/w0O0DY18yj7G4/KkW4DwTxUqBG8NOBkj0o7pO0YjMwx3uo3bt2EK0mJ0eNT3TWM
 QaQgYX9T8mIm0K5kZjMwtSvnMeTssJO/DHpIcoPzErsG5b+lUY08sV94whBFHD3SN70M
 6rqCjdFpZ2EIjJ0KKRAue839hlnsFQ6wqp0WSuBL5FPHrcbgyKec8bSMWxRWZc1CxFgY
 aUYiOYLy0M5c2wmOHJFIn9y9J65H0z/xWeG9ctOCWPQLDSh6KcuO6GQMHnbmQuD1Cmkp
 smoY1pcdOtrSiF/+e0sxIUaeqsAlygI/rmzv9a8THnHwjE6vQ2gP+6ep8PLuybgVYYux
 iHXA==
X-Gm-Message-State: ANhLgQ3Fj3D1mxzz5WJCF/VsXDC5TVc/LkLv1J5UUwI4waQnLeWG5r6T
 MttfA9LU1pR218vnWIRWS/usDqqP8Ag=
X-Google-Smtp-Source: ADFU+vviH3TtvCtMrP6GnmfbXEbPAx1pCmSaaO4NnEiLQuc6Ff3G1DK9vgRZlHvdcKicckontl9x7w==
X-Received: by 2002:adf:9302:: with SMTP id 2mr12574891wro.217.1583149921022; 
 Mon, 02 Mar 2020 03:52:01 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id f17sm16840364wrj.28.2020.03.02.03.51.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Mar 2020 03:52:00 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] virtio-net: Introduce hash report feature
Date: Mon,  2 Mar 2020 13:50:03 +0200
Message-Id: <20200302115003.14877-4-yuri.benditovich@daynix.com>
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

The feature VIRTIO_NET_F_HASH_REPORT extends the
layout of the packet and requests the device to
calculate hash on incoming packets and report it
in the packet header.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 include/uapi/linux/virtio_net.h | 36 +++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
index aec6fac3666a..19d23e5baa4e 100644
--- a/include/uapi/linux/virtio_net.h
+++ b/include/uapi/linux/virtio_net.h
@@ -57,6 +57,7 @@
 					 * Steering */
 #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
 
+#define VIRTIO_NET_F_HASH_REPORT  57	/* Supports hash report */
 #define VIRTIO_NET_F_RSS	  60	/* Supports RSS RX steering */
 #define VIRTIO_NET_F_RSC_EXT	  61	/* extended coalescing info */
 #define VIRTIO_NET_F_STANDBY	  62	/* Act as standby for another device
@@ -156,6 +157,23 @@ struct virtio_net_hdr_v1 {
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
@@ -304,6 +322,24 @@ struct virtio_net_rss_config {
 
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
