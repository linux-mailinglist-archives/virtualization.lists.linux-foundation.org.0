Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6181F0BAE
	for <lists.virtualization@lfdr.de>; Sun,  7 Jun 2020 16:11:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7768886A0C;
	Sun,  7 Jun 2020 14:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KzfXZIhpN89a; Sun,  7 Jun 2020 14:11:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 23B4E86A07;
	Sun,  7 Jun 2020 14:11:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02FF6C016F;
	Sun,  7 Jun 2020 14:11:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2E40C016F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CF81E86252
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cP8AeDf1Bhu2
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7288F85BCA
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591539101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wp6BO12ZdY311uANoeiTSpiBXoC9bVPHS+5RWfNAiPw=;
 b=aWEwTjypIXyku/geRCCP71LGFIRv2DGCeTDLsO48bc2T4HbowCD6qxvo1jqG0ko9qcAE3w
 PX2QKc9FopTnNEsRS6vTBHTAfECpdN9ipGZOQ42H85SXtjk4vv0zvtZGYwR3Gv0iwlFNI+
 +MpqWLMTYb9J3V+vXtReLd2ZeE1qXqM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-MOF7EguVOnGjGB1eokFFgw-1; Sun, 07 Jun 2020 10:11:39 -0400
X-MC-Unique: MOF7EguVOnGjGB1eokFFgw-1
Received: by mail-wr1-f72.google.com with SMTP id p9so6063326wrx.10
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 07:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wp6BO12ZdY311uANoeiTSpiBXoC9bVPHS+5RWfNAiPw=;
 b=b1LYlNE5KsbvGzC75EZgzwK7O3ZFqi9SNAKyAT64TJsHsKLT6u7VexIPhcf1ul0Inf
 3FwEI7RW8KwexcnYcvF2Hj0UA/tFXJhrCZ32WqYRRH+b+BSW1hUzdguE/sw30T7PosSu
 yvcv9gOElwOBCjXg3JyB2rl0Sx0ARaxrOHc7BODkQna6F9nLtCViT27IbKcDSVT1cqTf
 rX9cbiBy4/xMGInyf6PjvR5iiS4zIdrkbhvIGhfjoiyKtrMe/rjtMhfVeG4nYCLV5pI8
 QZtWEE27cchL4ia4NpYUsu1ulS93epeCX1CnFTBjOR+bKIA2B4YYVXZ5vXS3QzAsaTDA
 kgvg==
X-Gm-Message-State: AOAM531ZrfbAXXnIa9nJPrLtIf8LstpBrPn4U9QSR/zO8gjAlNtmy9b5
 NOARbyMi091SGYuFfqoXzm93hWuSNJUg7u2yHCiup+t4XZ/Ui82NOQ01bdmBwbKXoBoTGlWSMKt
 V3BWjV0mvN16RaHLIAopKR6T4cystRZLnnRjReqQCMw==
X-Received: by 2002:a1c:e20a:: with SMTP id z10mr11194108wmg.63.1591539098286; 
 Sun, 07 Jun 2020 07:11:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFt8FJP6Ka1KJy2iQ809xCaM+/JyNuAYCSvk8oDmutDU4mYkXzFPpUiOv4ag1sD+vroAfCPA==
X-Received: by 2002:a1c:e20a:: with SMTP id z10mr11194090wmg.63.1591539098051; 
 Sun, 07 Jun 2020 07:11:38 -0700 (PDT)
Received: from redhat.com (bzq-82-81-31-23.red.bezeqint.net. [82.81.31.23])
 by smtp.gmail.com with ESMTPSA id o10sm18638815wrq.40.2020.06.07.07.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 07:11:37 -0700 (PDT)
Date: Sun, 7 Jun 2020 10:11:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v5 06/13] vhost: reorder functions
Message-ID: <20200607141057.704085-7-mst@redhat.com>
References: <20200607141057.704085-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200607141057.704085-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, eperezma@redhat.com, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Reorder functions in the file to not rely on forward
declarations, in preparation to making them static
down the road.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vhost.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 5075505cfe55..3ffcba4e27e9 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2299,6 +2299,13 @@ static int fetch_buf(struct vhost_virtqueue *vq)
 	return 1;
 }
 
+/* Reverse the effect of vhost_get_vq_desc. Useful for error handling. */
+void vhost_discard_vq_desc(struct vhost_virtqueue *vq, int n)
+{
+	vq->last_avail_idx -= n;
+}
+EXPORT_SYMBOL_GPL(vhost_discard_vq_desc);
+
 /* This function returns a value > 0 if a descriptor was found, or 0 if none were found.
  * A negative code is returned on error. */
 static int fetch_descs(struct vhost_virtqueue *vq)
@@ -2413,26 +2420,6 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
 }
 EXPORT_SYMBOL_GPL(vhost_get_vq_desc);
 
-/* Reverse the effect of vhost_get_vq_desc. Useful for error handling. */
-void vhost_discard_vq_desc(struct vhost_virtqueue *vq, int n)
-{
-	vq->last_avail_idx -= n;
-}
-EXPORT_SYMBOL_GPL(vhost_discard_vq_desc);
-
-/* After we've used one of their buffers, we tell them about it.  We'll then
- * want to notify the guest, using eventfd. */
-int vhost_add_used(struct vhost_virtqueue *vq, unsigned int head, int len)
-{
-	struct vring_used_elem heads = {
-		cpu_to_vhost32(vq, head),
-		cpu_to_vhost32(vq, len)
-	};
-
-	return vhost_add_used_n(vq, &heads, 1);
-}
-EXPORT_SYMBOL_GPL(vhost_add_used);
-
 static int __vhost_add_used_n(struct vhost_virtqueue *vq,
 			    struct vring_used_elem *heads,
 			    unsigned count)
@@ -2502,6 +2489,19 @@ int vhost_add_used_n(struct vhost_virtqueue *vq, struct vring_used_elem *heads,
 }
 EXPORT_SYMBOL_GPL(vhost_add_used_n);
 
+/* After we've used one of their buffers, we tell them about it.  We'll then
+ * want to notify the guest, using eventfd. */
+int vhost_add_used(struct vhost_virtqueue *vq, unsigned int head, int len)
+{
+	struct vring_used_elem heads = {
+		cpu_to_vhost32(vq, head),
+		cpu_to_vhost32(vq, len)
+	};
+
+	return vhost_add_used_n(vq, &heads, 1);
+}
+EXPORT_SYMBOL_GPL(vhost_add_used);
+
 static bool vhost_notify(struct vhost_dev *dev, struct vhost_virtqueue *vq)
 {
 	__u16 old, new;
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
