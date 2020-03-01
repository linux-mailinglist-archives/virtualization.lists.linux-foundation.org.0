Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E02174CDD
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 12:07:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 63A19885FC;
	Sun,  1 Mar 2020 11:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GyRjHdvogz+a; Sun,  1 Mar 2020 11:07:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 86535885FF;
	Sun,  1 Mar 2020 11:07:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C070C1D85;
	Sun,  1 Mar 2020 11:07:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 515FDC013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4107B869DE
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BmSdpJbTnzOX
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:07:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9069C869C8
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:07:43 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 9so1829148wmo.1
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 03:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DRoldaKOeRvm8VvruGfzEVHUrHVPsd9EQl8oVSRV6s0=;
 b=ki7EpdQ+bpZC5vWe/ixTGYq1ZwLdZZTTRq11EG3uzol+y7Vpxvfk5jtR30mtsMQ35H
 eJ0FzIPRTnihsWRTso8+j6VplVazERpGTVDcZ8PIXtViCOH9pdwvM1KbInriAZ/xF140
 hzzDQhFq3tfetuuq6e1tzEjLJM4C29RFjgksTPG/06m5+d0fhtT2A5j9milcky1ie3oG
 JRp2SRKfWzxCnCGDuXG1cC95f9/zV0lTWGI5x6fm9Jg0l81hNEljQmDsVSBwrfqhcPrV
 hVBuV6uXrZ3tcvRoPlKYJ+5VizFl9lAUwn+6YKtEyK5becF5sYFSbtqiP/X4aXHurnib
 gJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DRoldaKOeRvm8VvruGfzEVHUrHVPsd9EQl8oVSRV6s0=;
 b=VBwAM6l8bWZhQH8x7kv8Wnfl49F7qG70v4soxsmESd+LuBtPJC0kzlseUSUebo0yY2
 uXn//Rjo9P+pqI3exVcrHngJzqYyF+a+K0THar4PvCPJPx7DZpkF+4VJXq5/RtFZYdUa
 t/a/ximWEgpPz0eyG030Zi2hqIZRnqSn+U4V2lxgfD970dYUYXgmGuWkjSyV2++yvzfr
 vxkIYQZo0MNwN8xDNuHV2FNL42qKVP5TpWb/DQgdruUfCMcmp0hs+kly0Atj9Wr8fzQn
 WMHPxo7sXP3TX0rao0ol9MDafRU9ol/IMSgp7MtF6odzlHaDwU1o8i71YPdPPC7gpcWB
 kSFA==
X-Gm-Message-State: APjAAAU+JiesiNKL9V5zD7QWyOv8f/kk1S5/6LM+7e66jgp6ddtFqI4D
 kAlXoFPQENrmEqedcHqp+piT/w==
X-Google-Smtp-Source: APXvYqxx9FgFQEZMeZWv/oL4XT1ygpaw2QNMK5f4zqBh9MmXWs6hitayUH0Eh9boLLGnSEGiVDMUrg==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr14972813wmg.66.1583060861841; 
 Sun, 01 Mar 2020 03:07:41 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id i7sm11563243wma.32.2020.03.01.03.07.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 01 Mar 2020 03:07:41 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] virtio-net: Introduce extended RSC feature
Date: Sun,  1 Mar 2020 13:07:31 +0200
Message-Id: <20200301110733.20197-2-yuri.benditovich@daynix.com>
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
index a3715a3224c1..536152fad3c4 100644
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
+		__le16 rsc_ext_num_packets; /* num of coalesced packets */
+	};
+	union {
+		__virtio16 csum_offset;	/* Offset after that to place checksum */
+		__le16 rsc_ext_num_dupacks; /* num of duplicated acks */
+	};
 	__virtio16 num_buffers;	/* Number of merged rx buffers */
 };
 
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
