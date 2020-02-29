Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5EE17485C
	for <lists.virtualization@lfdr.de>; Sat, 29 Feb 2020 18:19:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CFFDB845C1;
	Sat, 29 Feb 2020 17:19:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTvcqEjnV4ZP; Sat, 29 Feb 2020 17:19:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 605B485C92;
	Sat, 29 Feb 2020 17:19:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BEE6C0177;
	Sat, 29 Feb 2020 17:19:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A294FC0177
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9166184707
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:19:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8HCeYjgyEDQa
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:19:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B68BA845C1
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 17:19:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g83so4540550wme.1
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 09:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BjGaacwNVrGoRZ2MPntB896YPWVR3A8tHODOQN+DEuM=;
 b=o5pAelwHUqvl9vs+9RFdUVSYc88c5p8kKvTZ8AJNts3rqPAeiHRbYe7NINpJwDI23r
 pdAiJ47REyDhXOp6dJrHGNrYizHRUvNEnV9Ishhvi9m5j2tyKRpJtTrCErqoNYLWyKzN
 K4tfX5uoFOIv/KhAHiZiV9NWuNRrMwOlQgkTzEZBZk7yZKi1O9Kwlj7/q+AlzoRgVQWC
 kRBzdk9r5COGvIWjP0uvzfXzBneoLBKQw6P9g3fVC4pSBKdWmDxJl3pbE3NHDBEx9+yG
 2XLCs00y9nzEDOA3YrGzIzhD4Cj99OWIX5UcOmqrcmNw+WZ/CPIJcHp1dDKCCMnCZIku
 Fr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BjGaacwNVrGoRZ2MPntB896YPWVR3A8tHODOQN+DEuM=;
 b=tXKtpYlZODg73bfozeOkovX1Bk7c9vh+oaA61F0+pCcyhqRt2IOfiJU6QbL5wIM4qN
 ciK36PbB/DW0oSmYomkft1roXIQShL4YogKe9SM7W7BkncfXFkEEGhydkB25LilWz6zt
 SWnmaQslx2ZOiDE0jsurPtTp6He+CVoyByP/D/97JyuUTSyr4B4AP50I1XmuUcIZNhVY
 UaSonryDzPHxNUscemjKuhijWUIpOgEV+hpy2KMKuqGcpViAZCNgBr83ZqyNdnz7yh92
 lqMZMam3vQ2DPjspKEZYyUWuB+oz2xe4Or1uMJyhzLgl7jyvCd3QeZhsGX7QbPG8lbf6
 pOyA==
X-Gm-Message-State: APjAAAUAbVVESdj8b+m4mDSbU1lZD2leAmfXRd0V5DiWq8xKb2QN3fW2
 mfzsYmdAeqcbVfQ84SYx3+m2IJN7Kyw=
X-Google-Smtp-Source: APXvYqwJ1ItXf1Quo7cWs8qfDaqKV9Wer87aIQjvdmFMRqn1FLTCzqLdtxdeudiYnhbxoudT+8L5MA==
X-Received: by 2002:a05:600c:2c44:: with SMTP id
 r4mr10324691wmg.140.1582996389857; 
 Sat, 29 Feb 2020 09:13:09 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id r1sm17045046wrx.11.2020.02.29.09.13.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 29 Feb 2020 09:13:09 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] virtio-net: Introduce extended RSC feature
Date: Sat, 29 Feb 2020 19:12:59 +0200
Message-Id: <20200229171301.15234-2-yuri.benditovich@daynix.com>
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

VIRTIO_NET_F_RSC_EXT feature bit indicates that the device
is able to provide extended RSC information. When the feature
is negotiatede and 'gso_type' field in received packet is not
GSO_NONE, the device reports number of coalesced packets in
'csum_start' field and number of duplicated acks in 'csum_offset'
field and sets VIRTIO_NET_HDR_F_RSC_INFO in 'flags' field.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 include/uapi/linux/virtio_net.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
index a3715a3224c1..6e26a2cc6ad0 100644
--- a/include/uapi/linux/virtio_net.h
+++ b/include/uapi/linux/virtio_net.h
@@ -57,6 +57,7 @@
 					 * Steering */
 #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
 
+#define VIRTIO_NET_F_RSC_EXT	  61	/* extended coalescing info */
 #define VIRTIO_NET_F_STANDBY	  62	/* Act as standby for another device
 					 * with the same MAC.
 					 */
@@ -104,6 +105,7 @@ struct virtio_net_config {
 struct virtio_net_hdr_v1 {
 #define VIRTIO_NET_HDR_F_NEEDS_CSUM	1	/* Use csum_start, csum_offset */
 #define VIRTIO_NET_HDR_F_DATA_VALID	2	/* Csum is valid */
+#define VIRTIO_NET_HDR_F_RSC_INFO	4	/* rsc info in csum_ fields */
 	__u8 flags;
 #define VIRTIO_NET_HDR_GSO_NONE		0	/* Not a GSO frame */
 #define VIRTIO_NET_HDR_GSO_TCPV4	1	/* GSO frame, IPv4 TCP (TSO) */
@@ -113,8 +115,14 @@ struct virtio_net_hdr_v1 {
 	__u8 gso_type;
 	__virtio16 hdr_len;	/* Ethernet + IP + tcp/udp hdrs */
 	__virtio16 gso_size;	/* Bytes to append to hdr_len per frame */
-	__virtio16 csum_start;	/* Position to start checksumming from */
-	__virtio16 csum_offset;	/* Offset after that to place checksum */
+	union {
+		__virtio16 csum_start;	/* Position to start checksumming from */
+		__virtio16 rsc_ext_num_packets; /* num of coalesced packets */
+	};
+	union {
+		__virtio16 csum_offset;	/* Offset after that to place checksum */
+		__virtio16 rsc_ext_num_dupacks; /* num of duplicated acks */
+	};
 	__virtio16 num_buffers;	/* Number of merged rx buffers */
 };
 
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
