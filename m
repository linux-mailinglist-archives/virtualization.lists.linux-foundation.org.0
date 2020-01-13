Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F16E138CC5
	for <lists.virtualization@lfdr.de>; Mon, 13 Jan 2020 09:25:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1425B2000E;
	Mon, 13 Jan 2020 08:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bY6O3PRjgfWD; Mon, 13 Jan 2020 08:25:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 476A720411;
	Mon, 13 Jan 2020 08:25:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E320C077D;
	Mon, 13 Jan 2020 08:25:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B18DC077D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 08:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 50BE720013
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 08:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndKpVRPsAwlT
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 08:25:35 +0000 (UTC)
X-Greylist: delayed 00:07:49 by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id D028320363
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 08:25:34 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z7so7506066wrl.13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 00:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=0zANXS8TKEoJJ1M/Ul1KQmGBcWvlQfYmWq/kiBRyKvE=;
 b=xnIE4e4rPMU7OcSUOkAKlSrl9l0EdteOqeunkUgKv3arlLdDevR5M5UkbX+CciM44M
 mWZouqu8AcjErkPZBBVSPB2ulJ0+cd5V/Cuud7lgm6/FdhPntluM5DU/c/JTFyuYLAKW
 djGwT/u2QtBSq19YSbgEgsVJs08zFbxJAoxrDDPnYcfTuKFdXE1QPp1Hv7dtZbp/qsVB
 9kL9iu9sjaz0qgZE/AETM+jugg22uE6vU59YWmjzcvPZrR4z0pkpd7GZAdWHofocrrrZ
 /c/7XPoOUhDE8q2coVq/408tcWpqI+4/vP9URmPtAePlqwjxht3/dMQbTfAOTMuKd+8k
 4lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0zANXS8TKEoJJ1M/Ul1KQmGBcWvlQfYmWq/kiBRyKvE=;
 b=r6+XcQ3D2Ld+DAmTrmwY7i5LXQyLZodVSs2QgwDdYwFC0lzSjSwNOg3cOMmcSJsYjp
 dpeIlyBZ4RGFY+Cc6hfY/Alg+TbTAFwkR/9qz39ACChsu8qAbqcbvk78HplnLr+La/oc
 e/43K/IVY9awo2Abywxv28JomVPgnMYq6c8dP0x9/UQKL5EJO97EmXDxCXNzHMEpzWan
 +FW5Z3AM1m2YK4+AlNvZemqUtENJJuxFm4lw2YTFtEOwLkvAKXIOhENLmd5yDubMMJNM
 LsEsAN+svwOfrrJ11Tf3U5HJtHfP1jw4+HExdpH7oCPbRmhiv3V4nQahlrDpYokv8XeD
 f1SQ==
X-Gm-Message-State: APjAAAV3zswXAQivKZjJVMkAwbt4vQG8ci6iNIvG5VXKDsixcC9cDD60
 FDjeVvWXKHZVbQp8bh+FVigeB/QBZxQ=
X-Google-Smtp-Source: APXvYqzANWNHrC26zw2epeZgu5xcQ1xAM/Ml24jTOdkZMXBwIIusDkz1CKMmA1wx3gHpSAxsNFQepQ==
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr17827382wru.6.1578903463793; 
 Mon, 13 Jan 2020 00:17:43 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id v14sm13949234wrm.28.2020.01.13.00.17.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Jan 2020 00:17:43 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] virtio-net: Introduce extended RSC feature
Date: Mon, 13 Jan 2020 10:17:36 +0200
Message-Id: <20200113081736.2340-1-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
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

VIRTIO_NET_F_RSC_EXT feature bit indicates that the device
is able to provide extended RSC information. When the feature
is negotiatede and 'gso_type' field in received packet is not
GSO_NONE, the device reports number of coalesced packets in
'csum_start' field and number of duplicated acks in 'csum_offset'
field and sets VIRTIO_NET_HDR_F_RSC_INFO in 'flags' field.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 include/uapi/linux/virtio_net.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
index a3715a3224c1..2bdd26f8a4ed 100644
--- a/include/uapi/linux/virtio_net.h
+++ b/include/uapi/linux/virtio_net.h
@@ -56,7 +56,7 @@
 #define VIRTIO_NET_F_MQ	22	/* Device supports Receive Flow
 					 * Steering */
 #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
-
+#define VIRTIO_NET_F_RSC_EXT	  61	/* Provides extended RSC info */
 #define VIRTIO_NET_F_STANDBY	  62	/* Act as standby for another device
 					 * with the same MAC.
 					 */
@@ -104,6 +104,7 @@ struct virtio_net_config {
 struct virtio_net_hdr_v1 {
 #define VIRTIO_NET_HDR_F_NEEDS_CSUM	1	/* Use csum_start, csum_offset */
 #define VIRTIO_NET_HDR_F_DATA_VALID	2	/* Csum is valid */
+#define VIRTIO_NET_HDR_F_RSC_INFO	4	/* rsc_ext data in csum_ fields */
 	__u8 flags;
 #define VIRTIO_NET_HDR_GSO_NONE		0	/* Not a GSO frame */
 #define VIRTIO_NET_HDR_GSO_TCPV4	1	/* GSO frame, IPv4 TCP (TSO) */
@@ -118,6 +119,13 @@ struct virtio_net_hdr_v1 {
 	__virtio16 num_buffers;	/* Number of merged rx buffers */
 };
 
+/*
+ * if VIRTIO_NET_F_RSC_EXT feature has been negotiated and
+ * VIRTIO_NET_HDR_F_RSC_INFO is set in RX packet
+ */
+#define virtio_net_rsc_ext_num_packets	csum_start
+#define virtio_net_rsc_ext_num_dupacks	csum_offset
+
 #ifndef VIRTIO_NET_NO_LEGACY
 /* This header comes first in the scatter-gather list.
  * For legacy virtio, if VIRTIO_F_ANY_LAYOUT is not negotiated, it must
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
