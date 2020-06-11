Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE291F66C6
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 13:34:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DDE6A879F2;
	Thu, 11 Jun 2020 11:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNVGCoMJLGWK; Thu, 11 Jun 2020 11:34:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 72838879E7;
	Thu, 11 Jun 2020 11:34:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62795C016F;
	Thu, 11 Jun 2020 11:34:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9045C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C3A3720409
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ld3FDVwXIvU8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 30B04266DE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591875279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nNh1TL7xZUtXOusVSg8tIG35kTb/6beDbMDeGMbkL8c=;
 b=aQNpekBut2PKhl/aIu//tCUiUfNjTnX+eEbdD/F56exs6eGi3FDEq5fK5Xotw1AsQ4Z1W2
 glfNiZkth+CjGnsJp5PtDUByFGLYvgf5PeW/UX+hUMxUwZ18Vvc2fMgskB/Z47M1+U0H27
 X7+1s1njrDDBf38ewFVF+XQfQDb05yI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-8R2csTqLPR6L3i1HU_a5cA-1; Thu, 11 Jun 2020 07:34:37 -0400
X-MC-Unique: 8R2csTqLPR6L3i1HU_a5cA-1
Received: by mail-wm1-f72.google.com with SMTP id 14so1206537wmi.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 04:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nNh1TL7xZUtXOusVSg8tIG35kTb/6beDbMDeGMbkL8c=;
 b=dNVy3MmzeVK8juP3YLRIygtEy7NS7fT2SD1RUwMkaSC2NatbGzallGLJ2nu9Vc+bxZ
 I6g1yGgyFbO1cWyhxut8uidmH4x5VaF0po55Xin3F4G6ieqoEYCXaNIEV3I7eRXu1vOx
 uL6peODXCPTGjnTpueae578GQZuWSo0jLZ6yHDhqOnf8NPZOxZ+nPVwuIluCSjqPwr6O
 eTNLcJU0ubPI81U+lRZue5PbKnMKcJWLqHLGlIb9SSAvwrgDCb7xwy3hHQxadP4CEtBp
 xLdlJeYRxSjOiM5PlShWJyPbvPBmhPn4A9mLKb8URzbXlpqvdAIwFhUq/1/8qBeKdYDm
 sc8A==
X-Gm-Message-State: AOAM530ETD+vsGz/zZ/nvBjK7YVYg8zU5Edf8T2vzgQHkap3f9upy2P9
 Jnlr8bowPAqMeJuWq5pExaxctg/+IXJujeSFvBwJRhjC4E+jtVK1knxe4tNMJZL340egL4ov01L
 i9ob7skv2H74PtmthCnyoUE5Y1Lv1e0bCPG7ZaBOSNw==
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr9625702wrw.277.1591875276456; 
 Thu, 11 Jun 2020 04:34:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2zXWmmSHCI3WrhXi4UlhJiH0TBT9f7dUAngUHj4AqaFD4pDWyqbUiTnBy/EttZUS7AWNdGA==
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr9625677wrw.277.1591875276191; 
 Thu, 11 Jun 2020 04:34:36 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id h12sm4550238wro.80.2020.06.11.04.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 04:34:35 -0700 (PDT)
Date: Thu, 11 Jun 2020 07:34:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v8 08/11] vhost/test: convert to the buf API
Message-ID: <20200611113404.17810-9-mst@redhat.com>
References: <20200611113404.17810-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200611113404.17810-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
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
