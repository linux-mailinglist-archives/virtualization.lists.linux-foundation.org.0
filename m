Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B7A1F0BB6
	for <lists.virtualization@lfdr.de>; Sun,  7 Jun 2020 16:11:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C410220338;
	Sun,  7 Jun 2020 14:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXuAPGnLXbar; Sun,  7 Jun 2020 14:11:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 10C67204B5;
	Sun,  7 Jun 2020 14:11:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6DD8C07FF;
	Sun,  7 Jun 2020 14:11:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5670C016F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DF75287D48
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYuH2ii5cxY7
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DCB9D87D46
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591539109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LkIC7lu04RjihR3CHtt6ay4K/Xfv1eAdqmqMBhW1nUc=;
 b=KClBS+4StlfbF/xhh1Xsa+8ZofIAwN4Csgy1OuU5MWFcVXP+KiBoc/D+7Ulm4LldWcpHyK
 OpAxpKZLXq1gtj/ZKUmnyAqTqllcGajFqTqwZ0GuusxWvjZM3y67PvidQnJostOo389zYR
 4gjtd/sWcQSLjg3I0SS4CnixbPPLs9o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-Fin_xwAxPXum8p_WIPWGgA-1; Sun, 07 Jun 2020 10:11:48 -0400
X-MC-Unique: Fin_xwAxPXum8p_WIPWGgA-1
Received: by mail-wr1-f71.google.com with SMTP id j16so6006883wre.22
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 07:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LkIC7lu04RjihR3CHtt6ay4K/Xfv1eAdqmqMBhW1nUc=;
 b=S4JoVrjV0n7vfMxI44eCwIBFA0w21+gzo1U9ca3yNLycqhET/Y9Y92ycq7FBCPnwyr
 kTAngKd6G3/a806mfwa5Wpflpg8tcj/vu1IYmufPKCETBE7Zmpq8GxLyVJ1XS+ZrtNpJ
 J6S1faXnBIKhfEQqUcNSHEUlvJUfEt3xhZwdMNJg5mVjFTK6GxApVeMNvYV3Ti2Pafgi
 PAnKV7Tbh+vbl+VHNPG77CX6uS/PFCHPTvKQxDBdwbq7tms2CWp+wLDJv+i6OBnD60M/
 8mF2X6QZR32JJBe6kYXMr2gnmDELGysSmhKu4jlFCH/JTbT5t4bE2PO2VvoBLlhLYQ3t
 3x0g==
X-Gm-Message-State: AOAM530JKPGsA7bxRRJ3whLGTV2wNBySwMddaj/hFb1yst7aP8bfUaJy
 TbK9ABHOia3ZEsXN7Klnxm+IJMy1eWS8Mf44WKbA6uxbYHhC0bkxl7KZ79YXr1PExB5uaowvPVt
 m0q4hN/erBRHvJOpwIOwEXyrlQpOFxrHFB+vcAA3DWA==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr10409313wmc.10.1591539106886; 
 Sun, 07 Jun 2020 07:11:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCfLPmb9+BZnCuC5u2jfWuqmXeqMS8Ihho5hEhJLUW08ori7QKr5nyQ1D2eMu4yFMhmwKabg==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr10409289wmc.10.1591539106521; 
 Sun, 07 Jun 2020 07:11:46 -0700 (PDT)
Received: from redhat.com (bzq-82-81-31-23.red.bezeqint.net. [82.81.31.23])
 by smtp.gmail.com with ESMTPSA id a81sm20684853wmd.25.2020.06.07.07.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 07:11:46 -0700 (PDT)
Date: Sun, 7 Jun 2020 10:11:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v5 10/13] vhost/test: convert to the buf API
Message-ID: <20200607141057.704085-11-mst@redhat.com>
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

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/test.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
index 02806d6f84ef..251fd2bf74a3 100644
--- a/drivers/vhost/test.c
+++ b/drivers/vhost/test.c
@@ -44,9 +44,10 @@ static void handle_vq(struct vhost_test *n)
 {
 	struct vhost_virtqueue *vq = &n->vqs[VHOST_TEST_VQ];
 	unsigned out, in;
-	int head;
+	int ret;
 	size_t len, total_len = 0;
 	void *private;
+	struct vhost_buf buf;
 
 	mutex_lock(&vq->mutex);
 	private = vhost_vq_get_backend(vq);
@@ -58,15 +59,15 @@ static void handle_vq(struct vhost_test *n)
 	vhost_disable_notify(&n->dev, vq);
 
 	for (;;) {
-		head = vhost_get_vq_desc(vq, vq->iov,
-					 ARRAY_SIZE(vq->iov),
-					 &out, &in,
-					 NULL, NULL);
+		ret = vhost_get_avail_buf(vq, vq->iov, &buf,
+					  ARRAY_SIZE(vq->iov),
+					  &out, &in,
+					  NULL, NULL);
 		/* On error, stop handling until the next kick. */
-		if (unlikely(head < 0))
+		if (unlikely(ret < 0))
 			break;
 		/* Nothing new?  Wait for eventfd to tell us they refilled. */
-		if (head == vq->num) {
+		if (!ret) {
 			if (unlikely(vhost_enable_notify(&n->dev, vq))) {
 				vhost_disable_notify(&n->dev, vq);
 				continue;
@@ -78,13 +79,14 @@ static void handle_vq(struct vhost_test *n)
 			       "out %d, int %d\n", out, in);
 			break;
 		}
-		len = iov_length(vq->iov, out);
+		len = buf.out_len;
 		/* Sanity check */
 		if (!len) {
 			vq_err(vq, "Unexpected 0 len for TX\n");
 			break;
 		}
-		vhost_add_used_and_signal(&n->dev, vq, head, 0);
+		vhost_put_used_buf(vq, &buf);
+		vhost_signal(&n->dev, vq);
 		total_len += len;
 		if (unlikely(vhost_exceeds_weight(vq, 0, total_len)))
 			break;
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
