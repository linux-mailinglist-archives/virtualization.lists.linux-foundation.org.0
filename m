Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AC71EBC62
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 15:06:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8F3CC86031;
	Tue,  2 Jun 2020 13:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pv8Qe7In-_s8; Tue,  2 Jun 2020 13:06:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1C2C1860C9;
	Tue,  2 Jun 2020 13:06:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0354FC088D;
	Tue,  2 Jun 2020 13:06:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D75AC0178
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0CC63204B4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NFEoGqDZHz4M
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id B8DC62014A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591103173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LMo2drqoQTmF0s7z53vtXvrX6v2dv44a7nAUfjbkZzI=;
 b=jMY2tfAgaG5Ysf9qica/YEmujqfcHScL6sExUZoxxh/NrhuewoDOg/Pbdt3g6ASnUC8tlT
 gx6EyOMNDv/+JX+oSHLILDhN18oHYSFOgVez0qQqLgMixE9MNhmY6pHC8uZrPAz5+xCjtZ
 xWtr/Aoo/DybNV5ecZcsMV93xK2+IHA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-Ct8rYa_RNX-Exrt_j-hSGw-1; Tue, 02 Jun 2020 09:06:09 -0400
X-MC-Unique: Ct8rYa_RNX-Exrt_j-hSGw-1
Received: by mail-wm1-f71.google.com with SMTP id l2so829777wmi.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 02 Jun 2020 06:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LMo2drqoQTmF0s7z53vtXvrX6v2dv44a7nAUfjbkZzI=;
 b=JWAbQsCTnA9Q5sFZdHYuq1SFOp1/F/lPIV4LOkXKWCcrgMvqPfXCThbNFLAAjVPF+N
 u0AungPIsjggGXiZCG4pkRgEqyqSoH0GhiTSogVxCkF3HYVSMmczpMkKND12VfBObnar
 G0r+Jy1I0E/Q/nU/dd4v98b+NORTz0lSYjlyhLzCgmWNfHIrZ5WpPx7UXYy+Fb5a1h5Y
 f5iZ0WRSiNmL66RTjHOpD1+UKKEQEIAVY7AX8FMj+ABzEBK9rcjtVF6mYJyfkGxQHD1W
 6rQxCUc4aEgFf8KI0iUsNF7zS02tyv/G3IfwQBif2SXMfwkc5Z+C6qdgnTLsiT4ikoAv
 ruqA==
X-Gm-Message-State: AOAM5313E8oZGqrnkkz9gPfpoCcQFPcMilWqs3VvQKC1reTmsib2z6pd
 R8m4otVYe3Vn7Yrq4ec7wBqaJC8BCfwrRvZefelxsKIh+MFJtRsAosR9GJHbjvLDFsiuSunP2v0
 9ZBZgdd5+0Dtp1ZyEpMU43GGOgXOCRysPrAxB+Cc8Ig==
X-Received: by 2002:adf:f988:: with SMTP id f8mr28409409wrr.81.1591103168346; 
 Tue, 02 Jun 2020 06:06:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG9bw3Ul7VoJ7lrSM6JnY068u1IXNEEmqvhm6cdNr9QfAcz0IRu5Ie8ZlB9aURJhAs2bO3EA==
X-Received: by 2002:adf:f988:: with SMTP id f8mr28409395wrr.81.1591103168152; 
 Tue, 02 Jun 2020 06:06:08 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 t129sm3890953wmf.41.2020.06.02.06.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 06:06:07 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:06:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 05/13] vhost/net: pass net specific struct pointer
Message-ID: <20200602130543.578420-6-mst@redhat.com>
References: <20200602130543.578420-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200602130543.578420-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, netdev@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

In preparation for further cleanup, pass net specific pointer
to ubuf callbacks so we can move net specific fields
out to net structures.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/net.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 2927f02cc7e1..749a9cf51a59 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -94,7 +94,7 @@ struct vhost_net_ubuf_ref {
 	 */
 	atomic_t refcount;
 	wait_queue_head_t wait;
-	struct vhost_virtqueue *vq;
+	struct vhost_net_virtqueue *nvq;
 };
 
 #define VHOST_NET_BATCH 64
@@ -231,7 +231,7 @@ static void vhost_net_enable_zcopy(int vq)
 }
 
 static struct vhost_net_ubuf_ref *
-vhost_net_ubuf_alloc(struct vhost_virtqueue *vq, bool zcopy)
+vhost_net_ubuf_alloc(struct vhost_net_virtqueue *nvq, bool zcopy)
 {
 	struct vhost_net_ubuf_ref *ubufs;
 	/* No zero copy backend? Nothing to count. */
@@ -242,7 +242,7 @@ vhost_net_ubuf_alloc(struct vhost_virtqueue *vq, bool zcopy)
 		return ERR_PTR(-ENOMEM);
 	atomic_set(&ubufs->refcount, 1);
 	init_waitqueue_head(&ubufs->wait);
-	ubufs->vq = vq;
+	ubufs->nvq = nvq;
 	return ubufs;
 }
 
@@ -384,13 +384,13 @@ static void vhost_zerocopy_signal_used(struct vhost_net *net,
 static void vhost_zerocopy_callback(struct ubuf_info *ubuf, bool success)
 {
 	struct vhost_net_ubuf_ref *ubufs = ubuf->ctx;
-	struct vhost_virtqueue *vq = ubufs->vq;
+	struct vhost_net_virtqueue *nvq = ubufs->nvq;
 	int cnt;
 
 	rcu_read_lock_bh();
 
 	/* set len to mark this desc buffers done DMA */
-	vq->heads[ubuf->desc].len = success ?
+	nvq->vq.heads[ubuf->desc].in_len = success ?
 		VHOST_DMA_DONE_LEN : VHOST_DMA_FAILED_LEN;
 	cnt = vhost_net_ubuf_put(ubufs);
 
@@ -402,7 +402,7 @@ static void vhost_zerocopy_callback(struct ubuf_info *ubuf, bool success)
 	 * less than 10% of times).
 	 */
 	if (cnt <= 1 || !(cnt % 16))
-		vhost_poll_queue(&vq->poll);
+		vhost_poll_queue(&nvq->vq.poll);
 
 	rcu_read_unlock_bh();
 }
@@ -1525,7 +1525,7 @@ static long vhost_net_set_backend(struct vhost_net *n, unsigned index, int fd)
 	/* start polling new socket */
 	oldsock = vhost_vq_get_backend(vq);
 	if (sock != oldsock) {
-		ubufs = vhost_net_ubuf_alloc(vq,
+		ubufs = vhost_net_ubuf_alloc(nvq,
 					     sock && vhost_sock_zcopy(sock));
 		if (IS_ERR(ubufs)) {
 			r = PTR_ERR(ubufs);
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
