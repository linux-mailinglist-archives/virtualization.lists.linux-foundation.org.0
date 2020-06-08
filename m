Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BD31F1932
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 14:53:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 33D3788159;
	Mon,  8 Jun 2020 12:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1lt7GtWutUpx; Mon,  8 Jun 2020 12:53:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B854188158;
	Mon,  8 Jun 2020 12:53:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A184C016F;
	Mon,  8 Jun 2020 12:53:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CECB7C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BCB218628E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59ItS8S1+HhT
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B21F086E21
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591620793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nNh1TL7xZUtXOusVSg8tIG35kTb/6beDbMDeGMbkL8c=;
 b=cdK3hBalYnQTZ2ivoNup29kX+WgRgCaAnDsw5wfyGBdugUnta7zGmGaDV+15nJQns5GPRJ
 3GryBGOPIok8qhGcXLqe2hE9foMQtYKpzJzxjWt4OCmt5QWp2ExK7hHLytKKm+6LttVg4K
 zxoZmC//Jkzvnn47x3BXU0ECh6klymA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-UHyrVCfpNrigT98VnvS22w-1; Mon, 08 Jun 2020 08:53:11 -0400
X-MC-Unique: UHyrVCfpNrigT98VnvS22w-1
Received: by mail-wr1-f70.google.com with SMTP id l18so7167372wrm.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 05:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nNh1TL7xZUtXOusVSg8tIG35kTb/6beDbMDeGMbkL8c=;
 b=CdsMM+XYvdf97E7RvT3+xDYpvRMJzYOAMT1A4sTmjnfHAFruuNrJjIrgEV5rkg0UDm
 8LhNZw0/ZHOu7/XmK1uc4Jb/g8dlFk8yZsvZJ4JwNiGhcsBG3G++n/bku41JL5uVPfMb
 T3CdsDe+k0onTmQIDFE8ZOWV9ZhcY4+eHWX2hdZgfvc1oxxFyKPj85qqtnuVR9KnoR45
 Y44BlHigkQGHrtKwt7iO15pPzWXW1zu1wOPFkMysUqTm/k02DWWC2FBCdGC30G54Hjvm
 kgGuiwHZWex1LmUHlhhRuO/L9y4C9bvBh536WLJ5OB/j81vFA+MmtCva4E03Kl8qC7df
 sk9A==
X-Gm-Message-State: AOAM533BTl77mflLz86xDRKhnxzKAI8aWy3XPQBFDmsvNQW+G4TjVum9
 ctvvEToqnHjzzBqSh0ZrRJbcmcxFTNF4cPwpH6sHuiG6R7YwfQjgRKBZHGnKkPy/DoWsxqSZP6c
 fzMsycW0RrjX1Gnr/6azh3wvHYI/7qHe19xNKdyFVRg==
X-Received: by 2002:a5d:4b47:: with SMTP id w7mr22414164wrs.234.1591620790805; 
 Mon, 08 Jun 2020 05:53:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweTCKDLbfiVGUFqWREKS9iQ8j4XUwzsDXWV07w/+PxSXiYAJVsAr7kpiUE/TGQ+cExzBaktw==
X-Received: by 2002:a5d:4b47:: with SMTP id w7mr22414144wrs.234.1591620790552; 
 Mon, 08 Jun 2020 05:53:10 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 h15sm22578283wrt.73.2020.06.08.05.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 05:53:10 -0700 (PDT)
Date: Mon, 8 Jun 2020 08:53:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v6 08/11] vhost/test: convert to the buf API
Message-ID: <20200608125238.728563-9-mst@redhat.com>
References: <20200608125238.728563-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200608125238.728563-1-mst@redhat.com>
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
index 7d69778aaa26..12304eb8da15 100644
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
+		ret = vhost_get_avail_buf(vq, &buf, vq->iov,
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
