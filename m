Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D13A2EAAED
	for <lists.virtualization@lfdr.de>; Tue,  5 Jan 2021 13:31:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0059985EBE;
	Tue,  5 Jan 2021 12:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nzdcMo5Vscqy; Tue,  5 Jan 2021 12:31:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5F86D85EBB;
	Tue,  5 Jan 2021 12:31:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A333C013A;
	Tue,  5 Jan 2021 12:31:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 033E0C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 12:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E15C4868A8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 12:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sEPt8OfQC2W0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 12:31:19 +0000 (UTC)
X-Greylist: delayed 00:06:46 by SQLgrey-1.7.6
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D3A6285F9B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 12:31:18 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id v14so2876765wml.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 05 Jan 2021 04:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=95fcQ7XOzwxPXY92PHMXKGjY9iDFTd+3y3erYQ9GO9s=;
 b=iIG6RHpaEDCYDyHHaHHz5lfqneKL//162o6PaecyRMmpgqZZ5U5KUefBSFTnAGQi+R
 wqietjz3diqRGXleLo4HCy0fTHlUgUBSZ4kHjhT65Nrx9ckCvaqjWiDAqKCGMvNJos72
 fPOOnFKHjb9+rYcHOI6J73EafrnWkxZU1e+hM9c7kYg0Toh/jOYpWM9uSN1ePIsrOHdQ
 ZCB3nB0ECeEsFGdMh4nMnogIcT9zPeiTwG9At5oUkqW627rO+LCZZ1f9ZYn22xH+RxoJ
 qFBXGavyiC+ex0VSFxq+Y2baqg2Rfx1Fg6DMT1atmtOGPJ3aA/f8Z+CK2b3XcEvT/QXR
 SM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=95fcQ7XOzwxPXY92PHMXKGjY9iDFTd+3y3erYQ9GO9s=;
 b=KJRQWVboVLN9JcZjgiVnpbAXo9gsjPpLLZt5WSd18vNfYsXtVTLdj0wiD3yGlBqPUS
 RjhYnRqJvQUXDZwTqKRnF0/DaJM3SQTLwC2oqk+FOEzQTm7QTQqOOMf3zgp8+R8cejQW
 knrcZeVND0Kh50lf8VwIByv2YvdKo3JUeoJCWMG+qjIYMzV8yiYJmzZf5SxfSwvUFEce
 eFDEJ/E4R4ZmbxlavvE4mMr12jV61DXhmm4KwsPqtTm8R5egL1ZAl7CDlJzzPnSiE6og
 LUVRvRHhOC0lHmQ9TQ0pXPuRIBY8lqn/KJM95BfKL87UoXrbH1IWqHLG/04kdrJF+NBA
 LAaw==
X-Gm-Message-State: AOAM531NZLxNIDkmRqpZ+ajBm+FBnmIHZqam+G1JDzhfFGfw6STHfbBG
 +UgEbhy6fuxbs4xfswRFjkUrX5ov36oeEQ==
X-Google-Smtp-Source: ABdhPJzorTi7ks7HQy2lPJ0gpjzOHvfFV47zjsVnH3IZt0rAIvgZ6KHOYmU//Cm9oLOW/QQz86qGVg==
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr3233640wme.3.1609849470379;
 Tue, 05 Jan 2021 04:24:30 -0800 (PST)
Received: from f2.redhat.com (bzq-79-183-72-147.red.bezeqint.net.
 [79.183.72.147])
 by smtp.gmail.com with ESMTPSA id 138sm4242281wma.41.2021.01.05.04.24.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 05 Jan 2021 04:24:29 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH 2/7] vhost: support for hash report virtio-net feature
Date: Tue,  5 Jan 2021 14:24:11 +0200
Message-Id: <20210105122416.16492-3-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210105122416.16492-1-yuri.benditovich@daynix.com>
References: <20210105122416.16492-1-yuri.benditovich@daynix.com>
Cc: yan@daynix.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

According to the virtio specification if VIRTIO_NET_F_HASH_REPORT
feature acked the virtio-net header is extended to hold the hash
value and hash report type.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 drivers/vhost/net.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 531a00d703cd..31a894b9a992 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -73,7 +73,8 @@ enum {
 	VHOST_NET_FEATURES = VHOST_FEATURES |
 			 (1ULL << VHOST_NET_F_VIRTIO_NET_HDR) |
 			 (1ULL << VIRTIO_NET_F_MRG_RXBUF) |
-			 (1ULL << VIRTIO_F_ACCESS_PLATFORM)
+			 (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
+			 (1ULL << VIRTIO_NET_F_HASH_REPORT)
 };
 
 enum {
@@ -1108,14 +1109,16 @@ static void handle_rx(struct vhost_net *net)
 		.msg_controllen = 0,
 		.msg_flags = MSG_DONTWAIT,
 	};
-	struct virtio_net_hdr hdr = {
-		.flags = 0,
-		.gso_type = VIRTIO_NET_HDR_GSO_NONE
+	struct virtio_net_hdr_v1_hash hdrv1 = {
+		{
+			.flags = 0,
+			.gso_type = VIRTIO_NET_HDR_GSO_NONE
+		}
 	};
 	size_t total_len = 0;
 	int err, mergeable;
 	s16 headcount;
-	size_t vhost_hlen, sock_hlen;
+	size_t vhost_hlen, sock_hlen, extra_hlen;
 	size_t vhost_len, sock_len;
 	bool busyloop_intr = false;
 	struct socket *sock;
@@ -1137,9 +1140,12 @@ static void handle_rx(struct vhost_net *net)
 	vhost_hlen = nvq->vhost_hlen;
 	sock_hlen = nvq->sock_hlen;
 
+
 	vq_log = unlikely(vhost_has_feature(vq, VHOST_F_LOG_ALL)) ?
 		vq->log : NULL;
 	mergeable = vhost_has_feature(vq, VIRTIO_NET_F_MRG_RXBUF);
+	extra_hlen = vhost_has_feature(vq, VIRTIO_NET_F_HASH_REPORT) ?
+		sizeof(hdrv1) - sizeof(hdrv1.hdr) : 0;
 
 	do {
 		sock_len = vhost_net_rx_peek_head_len(net, sock->sk,
@@ -1201,8 +1207,8 @@ static void handle_rx(struct vhost_net *net)
 		}
 		/* Supply virtio_net_hdr if VHOST_NET_F_VIRTIO_NET_HDR */
 		if (unlikely(vhost_hlen)) {
-			if (copy_to_iter(&hdr, sizeof(hdr),
-					 &fixup) != sizeof(hdr)) {
+			if (copy_to_iter(&hdrv1, sizeof(struct virtio_net_hdr),
+					 &fixup) != sizeof(struct virtio_net_hdr)) {
 				vq_err(vq, "Unable to write vnet_hdr "
 				       "at addr %p\n", vq->iov->iov_base);
 				goto out;
@@ -1211,7 +1217,7 @@ static void handle_rx(struct vhost_net *net)
 			/* Header came from socket; we'll need to patch
 			 * ->num_buffers over if VIRTIO_NET_F_MRG_RXBUF
 			 */
-			iov_iter_advance(&fixup, sizeof(hdr));
+			iov_iter_advance(&fixup, sizeof(struct virtio_net_hdr));
 		}
 		/* TODO: Should check and handle checksum. */
 
@@ -1223,6 +1229,18 @@ static void handle_rx(struct vhost_net *net)
 			vhost_discard_vq_desc(vq, headcount);
 			goto out;
 		}
+		if (unlikely(extra_hlen)) {
+			if (unlikely(vhost_hlen)) {
+				if (copy_to_iter(&hdrv1.hash_value, extra_hlen,
+						&fixup) != extra_hlen) {
+					vq_err(vq, "Unable to write extra_hdr "
+					"at addr %p\n", vq->iov->iov_base);
+					goto out;
+				}
+			} else {
+				iov_iter_advance(&fixup, extra_hlen);
+			}
+		}
 		nvq->done_idx += headcount;
 		if (nvq->done_idx > VHOST_NET_BATCH)
 			vhost_net_signal_used(nvq);
@@ -1624,6 +1642,9 @@ static int vhost_net_set_features(struct vhost_net *n, u64 features)
 			       (1ULL << VIRTIO_F_VERSION_1))) ?
 			sizeof(struct virtio_net_hdr_mrg_rxbuf) :
 			sizeof(struct virtio_net_hdr);
+	if (features & (1ULL << VIRTIO_NET_F_HASH_REPORT)) {
+		hdr_len = sizeof(struct virtio_net_hdr_v1_hash);
+	}
 	if (features & (1 << VHOST_NET_F_VIRTIO_NET_HDR)) {
 		/* vhost provides vnet_hdr */
 		vhost_hlen = hdr_len;
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
