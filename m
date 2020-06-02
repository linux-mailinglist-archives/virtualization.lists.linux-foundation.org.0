Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AF81EBC67
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 15:06:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8BCA420770;
	Tue,  2 Jun 2020 13:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dc2GroI8HElf; Tue,  2 Jun 2020 13:06:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4171C20500;
	Tue,  2 Jun 2020 13:06:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DF43C016E;
	Tue,  2 Jun 2020 13:06:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60FE2C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 40DD320517
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EDECBrfH-2Ma
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 3D83820500
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591103183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LkIC7lu04RjihR3CHtt6ay4K/Xfv1eAdqmqMBhW1nUc=;
 b=LifWSsa+dlAOqYvpOSxVpBrjO3E+PBxENGpFlQtx4cQYfV62b1jr+4Pbsf3V4bb6xvbLyq
 QZRqGkQCeXrnqgLbtIK0Pr2AIwjlxjHRVplUyUUGw96c2xRrykc3YhCUVNL7RIptsmY81l
 YEKpPIMCOrhWgmV1AGPLHWWLgRcI+ps=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-TmexiclLOhm3pYlS37ep-g-1; Tue, 02 Jun 2020 09:06:21 -0400
X-MC-Unique: TmexiclLOhm3pYlS37ep-g-1
Received: by mail-wm1-f70.google.com with SMTP id l26so933739wmh.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 02 Jun 2020 06:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LkIC7lu04RjihR3CHtt6ay4K/Xfv1eAdqmqMBhW1nUc=;
 b=XdzrnnGyzgIfgU3GzOxKGuZaReejpBuxATBydxac4LPAU93dEEzK5HHgLCQKGkmUoe
 qDrhbPu0uqs0QxDJ95/wZaPExXu5w8CVo3RgKN331pfbKqdLqHOHwiPNLKEUI+uvBKe7
 kclziazVyCPYzoK6oKDaY2zRY0CojGYhUqDVc4CGpelr4gs1QdcPJWdWELEmmQ4EZkvh
 dSt9LyNPvcFOQgbSwxptepNdda61QpNlpwO3LuvygCLhij0TXK6xMSGEit1RZOqnjzqd
 xkZMpMsQw4GBYeDrE3Gy2sGsBBjW6darfKCuMLnOO4DpomASzK2+t4ZOJLS+C6J7O49f
 Nj1g==
X-Gm-Message-State: AOAM532RqSstWRvQ3csKU6Nv+N2F28VkkTZqTwFWC75L5/a0xK146u3N
 90j+CH171hjESi7MNtboWkS2WP1TtD/smjscGy4184F1mql62HxnaZDK0sIDXmj3A2W0ftsfYOZ
 IATp7M2dP1JkhCUAJ5zS2EJyPFCoN+U10Aj+Ta+ZolQ==
X-Received: by 2002:a05:6000:87:: with SMTP id
 m7mr26716063wrx.306.1591103180173; 
 Tue, 02 Jun 2020 06:06:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5w09ZL79wZ7Oh271xsfdoKTPaA5LzVH1a7uDl4PbLKlKnjLFOCQbjfNEw+zB0N+AN5b0WkA==
X-Received: by 2002:a05:6000:87:: with SMTP id
 m7mr26716050wrx.306.1591103179992; 
 Tue, 02 Jun 2020 06:06:19 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 j5sm3782271wrq.39.2020.06.02.06.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 06:06:19 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:06:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 10/13] vhost/test: convert to the buf API
Message-ID: <20200602130543.578420-11-mst@redhat.com>
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
