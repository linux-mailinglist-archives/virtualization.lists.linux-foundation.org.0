Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F1596174DA9
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 15:33:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6B86920365;
	Sun,  1 Mar 2020 14:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVN9WycusRiv; Sun,  1 Mar 2020 14:33:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F2A1F20013;
	Sun,  1 Mar 2020 14:33:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0F9AC07FE;
	Sun,  1 Mar 2020 14:33:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CFE3C013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7BCE085852
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 15bDNoWbGUag
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A1C99857FB
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:11 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z11so454769wro.9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 06:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VaL51ACNGSwlIJlmeO4/TcbLfxPWGDpUsq2T8gnLheE=;
 b=Owzs1PfiGqFtEWA+qEbDVP3PvPExSDErmmM7JwxWDaeuh1BdGGEeKdr6+sgf2utAZ6
 ywQPsIfbBICiu7eSzxm8BUBr/SPFak+KuI0BfC1jHjJhRDMfLNDac8uWv0ghTbedREkA
 8NY9A5s1G1wLctfdH4jk2WgZlNyhIL/oXmEWM/Mamx9a4eG3FyQskvsVklQQKtrU5g7F
 qMHeuCPXm6H8tUAf+j1xomWq5L/CLZjmsKy2yDa/8RiyYczR0So15GaL8yqVTLvuSzne
 6HfQx7fPe6mkAMU4ilqxYDdCj+34H55Nj098IU231mpR272VZJ288jVI2ub1q/9qqHE0
 z/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VaL51ACNGSwlIJlmeO4/TcbLfxPWGDpUsq2T8gnLheE=;
 b=YZBVkAvoyFfxeK/gsktpF+GS+h3rkyXvjz33vGJPKMRyZ9WPhtpYOaqqf434WP+O8a
 oX3ytPeM0qAPysb4/vrCaIAo6Ul1JJuOQ6JAoko61SedtfkUV0voc+9eLJwH7v0BuQcu
 LAfDXhvnT3LBhr1VZqWV/xUdIR22wZKzkwNxYRv929oRl5uQPZYGdZdnbbv9UV5qctTh
 Hc8hbkiaRqefLXXEnA++klS3iFKE7Ijm/g6Uax7apBepie1YRfJvawsYEEsCfrYu6eCX
 0aFKquCCf1Eh2V/6lPHQDv7sLSzchCEFuCJ9AIB0s/WX2ejxwDja9LqQV+NAysX2XpxM
 51dA==
X-Gm-Message-State: APjAAAXxhBo6CAvYZ58rGLcb49//S/Q2da+X1V8UC8uRiiGiuGbFIuui
 uEslgQgxmSYyv5TOSXEoTXkK8A==
X-Google-Smtp-Source: APXvYqwoPfjEL3QODyOTiNJPvlw/dctQVRNXDuzknTtlGtpMlT9v9siA5S3NzYIpnnoRu0AZcfE5jQ==
X-Received: by 2002:adf:a4c4:: with SMTP id h4mr16495453wrb.112.1583073190013; 
 Sun, 01 Mar 2020 06:33:10 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id l4sm23617241wrv.22.2020.03.01.06.33.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 01 Mar 2020 06:33:09 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] virtio-net: Introduce extended RSC feature
Date: Sun,  1 Mar 2020 16:33:00 +0200
Message-Id: <20200301143302.8556-2-yuri.benditovich@daynix.com>
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

VIRTIO_NET_F_RSC_EXT feature bit indicates that the device
is able to provide extended RSC information. When the feature
is negotiatede and 'gso_type' field in received packet is not
GSO_NONE, the device reports number of coalesced packets in
'csum_start' field and number of duplicated acks in 'csum_offset'
field and sets VIRTIO_NET_HDR_F_RSC_INFO in 'flags' field.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 include/uapi/linux/virtio_net.h | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
index a3715a3224c1..19e76b3e3a64 100644
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
@@ -113,8 +115,24 @@ struct virtio_net_hdr_v1 {
 	__u8 gso_type;
 	__virtio16 hdr_len;	/* Ethernet + IP + tcp/udp hdrs */
 	__virtio16 gso_size;	/* Bytes to append to hdr_len per frame */
-	__virtio16 csum_start;	/* Position to start checksumming from */
-	__virtio16 csum_offset;	/* Offset after that to place checksum */
+	union {
+		struct {
+			__virtio16 csum_start;
+			__virtio16 csum_offset;
+		};
+		struct {
+			/* Position to start checksumming from */
+			__virtio16 start;
+			/* Offset after that to place checksum */
+			__virtio16 offset;
+		} csum;
+		struct {
+			/* num of coalesced packets */
+			__le16 packets;
+			/* num of duplicated acks */
+			__le16 dup_acks;
+		} rsc;
+	};
 	__virtio16 num_buffers;	/* Number of merged rx buffers */
 };
 
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
