Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 232B51AB0D4
	for <lists.virtualization@lfdr.de>; Wed, 15 Apr 2020 20:35:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 866A487B18;
	Wed, 15 Apr 2020 18:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7o4b1tYKwyGv; Wed, 15 Apr 2020 18:35:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C7FFC87AE7;
	Wed, 15 Apr 2020 18:35:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9993DC1AE2;
	Wed, 15 Apr 2020 18:35:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 801A1C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 18:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2FFBB86DB3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 18:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cSZof9cPIgZN
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 18:35:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D0B9286D53
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 18:35:51 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b8so381999pfp.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 11:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=jfDJ6MpblUb31n5Ljr9XqCQpAPLrCBD/vxyBMeROGWo=;
 b=PI0VkieA2xzccjHkDUj37YYUuwh0P6eu3by2DhuiZnVHpocbIy8hx28zfyjJBJU9o5
 Fib9pIZUz4Tfw5gOpMAcgEtlNkb+8ydTIZ49guZsJp24RfV07e2E9ECpJBoBD6+yHkkD
 jAD8W7kkhEfdu46oQHnTGZEysnNC3lF5av54zvCIlNORFg8K6FBuA/wPzl90t0bVANPY
 AWiMe5pn9W/JA8MbzyOcWW8IL4ui1gyyOwNi93eASkLGY7H4r29Yhbhai+3Yc6H/HNx/
 AwlpX2xL7o8LzV77aukLMOUUosIUIIu0tnTj/yi8xkKwteFKrwNyp6K4SC44Z4IqW5rC
 sbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=jfDJ6MpblUb31n5Ljr9XqCQpAPLrCBD/vxyBMeROGWo=;
 b=b+dFGTuWO8X9h3D+vuGWFBVT0elod7JPWrya8unXvtjjoTLiMMV73zMYxdQr/xqmlp
 RQKnx0xwu+jMA/uTzfpkOGAqpBDBGHNyGPRf7QRYEZIe2xfpBSY467ukNNro3dTw8160
 9lLhrcZcvzXj/kyOfBHqAdJCoB7MaFbzLBhNLVba68Qr82KVCv+oBWActcEV/3+vw8Ed
 DIQx/AF7NS5PcLV0Yj2MM/1/DBUqKmcOuwPAvSO38vGYjLQRuYE2wANd3tm2lKGUOYVv
 gKSrqteuQxD6nLT9a2xzPvL5gWOeU72A39sY6YkIiKQ3ofnjuqloaemi8LegM7+dlsRp
 Ywcg==
X-Gm-Message-State: AGi0PuZwneJI9f0kpicVHQahAwYeaHYmp/kjLH7IAxe3UwEyjIEQvqoZ
 kERCYk+DR/Vyelm5Qsvk1Wc=
X-Google-Smtp-Source: APiQypKRaVF1Ap+QvuUfaF0Wjnu2lhrSacgnto2/4v73dx3VWgy2c2XedWCfYJipMwy4DibeuuDsqg==
X-Received: by 2002:a62:1e84:: with SMTP id
 e126mr27343942pfe.315.1586975751113; 
 Wed, 15 Apr 2020 11:35:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id i15sm2678896pfo.195.2020.04.15.11.35.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 11:35:50 -0700 (PDT)
Subject: [PATCH v2] virtio-balloon: Avoid using the word 'report' when
 referring to free page hinting
From: Alexander Duyck <alexander.duyck@gmail.com>
To: jasowang@redhat.com, david@redhat.com, mst@redhat.com
Date: Wed, 15 Apr 2020 11:35:49 -0700
Message-ID: <20200415183524.14402.24934.stgit@localhost.localdomain>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Cc: virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Alexander Duyck <alexander.h.duyck@linux.intel.com>

It can be confusing to have multiple features within the same driver that
are using the same verbage. As such this patch is creating a union of
free_page_report_cmd_id with free_page_hint_cmd_id so that we can clean-up
the userspace code a bit in terms of readability while maintaining the
functionality of legacy code.

Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
---
 drivers/virtio/virtio_balloon.c     |    2 +-
 include/uapi/linux/virtio_balloon.h |   13 ++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 0ef16566c3f3..95d9c2f0a7be 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -580,7 +580,7 @@ static u32 virtio_balloon_cmd_id_received(struct virtio_balloon *vb)
 	if (test_and_clear_bit(VIRTIO_BALLOON_CONFIG_READ_CMD_ID,
 			       &vb->config_read_bitmap))
 		virtio_cread(vb->vdev, struct virtio_balloon_config,
-			     free_page_report_cmd_id,
+			     free_page_hint_cmd_id,
 			     &vb->cmd_id_received_cache);
 
 	return vb->cmd_id_received_cache;
diff --git a/include/uapi/linux/virtio_balloon.h b/include/uapi/linux/virtio_balloon.h
index 19974392d324..3ce64f72bd09 100644
--- a/include/uapi/linux/virtio_balloon.h
+++ b/include/uapi/linux/virtio_balloon.h
@@ -34,7 +34,7 @@
 #define VIRTIO_BALLOON_F_MUST_TELL_HOST	0 /* Tell before reclaiming pages */
 #define VIRTIO_BALLOON_F_STATS_VQ	1 /* Memory Stats virtqueue */
 #define VIRTIO_BALLOON_F_DEFLATE_ON_OOM	2 /* Deflate balloon on OOM */
-#define VIRTIO_BALLOON_F_FREE_PAGE_HINT	3 /* VQ to report free pages */
+#define VIRTIO_BALLOON_F_FREE_PAGE_HINT	3 /* Free page hinting VQ and config */
 #define VIRTIO_BALLOON_F_PAGE_POISON	4 /* Guest is using page poisoning */
 #define VIRTIO_BALLOON_F_REPORTING	5 /* Page reporting virtqueue */
 
@@ -48,8 +48,15 @@ struct virtio_balloon_config {
 	__u32 num_pages;
 	/* Number of pages we've actually got in balloon. */
 	__u32 actual;
-	/* Free page report command id, readonly by guest */
-	__u32 free_page_report_cmd_id;
+	/*
+	 * Free page hint command id, readonly by guest.
+	 * Was previously named free_page_report_cmd_id so we
+	 * need to carry that name for legacy support.
+	 */
+	union {
+		__u32 free_page_hint_cmd_id;
+		__u32 free_page_report_cmd_id;	/* deprecated */
+	};
 	/* Stores PAGE_POISON if page poisoning is in use */
 	__u32 poison_val;
 };

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
