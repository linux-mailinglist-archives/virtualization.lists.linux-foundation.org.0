Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E40D21759BF
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 12:52:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9237186303;
	Mon,  2 Mar 2020 11:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSr5xIjpCw4c; Mon,  2 Mar 2020 11:52:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 18C2D8621D;
	Mon,  2 Mar 2020 11:52:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF8DDC013E;
	Mon,  2 Mar 2020 11:52:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E609C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2B1C1860FC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fzhr162mSpxy
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:52:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 26D3D85EA5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:52:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z11so3444862wro.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 03:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EvmdA4mUcVx5I2epCncii5r58YmYQVi/Ahr0EYjLfTw=;
 b=ZiTLYdSGUGDUhV7Kg2tg3E7IueFE6S6MqL/ekEAoYVVmCWp3OIxEOtN/OBklg30TOZ
 7eC/5FPSU76mBq/rqC/GYa4FRnEx2tb6bB6xAJU/TOhvRhWXKYhKLhxkb02xU/fTyM+S
 1vP9qZiUKY4o6tik38tzETLv01yZNOda4ZF4Nt1PS2JBwsBNs+svPk1OY6vt77Az3VJc
 W3QRP9LFDwjsCSbW4ZQinIHuYPm1nPqpILWohZm/ffAaMEFwDiFibKsXZICSMxkKRJjM
 trLzMJhIewa0YSTS6B/iV80VKU6YsbkQjA71xNh60WI9Q5zQ0VUq11vA2SmprN5qDxeZ
 IE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EvmdA4mUcVx5I2epCncii5r58YmYQVi/Ahr0EYjLfTw=;
 b=otcoumKGdZYO66nFql8tm0XpCP8xo1IRSBcssa7dgax9QcLwj+QX7w1pxOqJBXUtMv
 t9JhbuwqyEyCLPdonEp0Xu6Rl/PWoOcMISce8ZW686sozndzO+7+lFhVtCcbqhex/pJv
 hWVsapbZZZ5jrq7KQzr5nEYyr+pgf0/Tlvo0NqWptDCyk/Qi+9zEULT7LvNoDWEApMAx
 26qzJL7pSTErMTpJfIubXGIsi5rCL1zU31ok/1z+dmOh2V33L+fPvJ4Al4kxhauWBxKX
 rWB+9vZCi+lksMZZgT3wWncT4Aa7j2T96+ug8gEjjwuQbetMK1bR27XweFFTGz4Z+id8
 iehw==
X-Gm-Message-State: APjAAAXJ93+r2qPuM/0khdG7fJUPrnrfz0rkGG0b3N9iU/WF8RprS62F
 L3inLS6X0bdaQk2ENmAGO6ReVw==
X-Google-Smtp-Source: APXvYqwUiXK+alLIfLSbJannCMgduxIG9HH8CrR3edHz9Id9bStIHJJrh+VQup7W/1SBp2xvP+zrrQ==
X-Received: by 2002:adf:f342:: with SMTP id e2mr21663558wrp.15.1583149918550; 
 Mon, 02 Mar 2020 03:51:58 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id f17sm16840364wrj.28.2020.03.02.03.51.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Mar 2020 03:51:58 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] virtio-net: Introduce extended RSC feature
Date: Mon,  2 Mar 2020 13:50:01 +0200
Message-Id: <20200302115003.14877-2-yuri.benditovich@daynix.com>
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

VIRTIO_NET_F_RSC_EXT feature bit indicates that the device
is able to provide extended RSC information. When the feature
is negotiatede and 'gso_type' field in received packet is not
GSO_NONE, the device reports number of coalesced packets in
'csum_start' field and number of duplicated acks in 'csum_offset'
field and sets VIRTIO_NET_HDR_F_RSC_INFO in 'flags' field.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 include/uapi/linux/virtio_net.h | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
index a3715a3224c1..6466c5979a93 100644
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
@@ -113,8 +115,26 @@ struct virtio_net_hdr_v1 {
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
+		/* Checksum calculation */
+		struct {
+			/* Position to start checksumming from */
+			__virtio16 start;
+			/* Offset after that to place checksum */
+			__virtio16 offset;
+		} csum;
+		/* Receive Segment Coalescing */
+		struct {
+			/* Number of coalesced segments */
+			__le16 segments;
+			/* Number of duplicated acks */
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
