Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 55150D554B
	for <lists.virtualization@lfdr.de>; Sun, 13 Oct 2019 10:18:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 586192283;
	Sun, 13 Oct 2019 08:18:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 327E421F9
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 08:08:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5700414D
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 08:08:19 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0C7885539
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 08:08:18 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id x77so13725442qka.11
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 01:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=3CYitd93iDHtPl2boSl3Eyofj0PvtzXYhyw7uXbmPmo=;
	b=knOmLtNozOCQ9yV+WVxYV+5nYMKYx4q6MaljptKDuupAhuH8HLMF4wmVCD1NhEZC+P
	k5zJRBLXWYjBqMXHGKFBLHqHoj4Jqspp73g8x4YcsLrPxscxVe88mvQG8T2r0KiUYtFb
	oopiJIrk/FfJqP3X8uUw9hViUVZf2EIu+A+CEA1igbjvBF9i8lhaXZ8GrwxCT5HNWBJB
	HpdhVz286NDF9ek0J5xhmG0WXG7EVjnBm5z167yL5m4x1lMUrGV1dhMcIwYOOAnFP/LT
	faOs6L9Bq2vm6xhTbc6azUqqIoYS/HNLNxjJiry1sUiQxi2cF5wuE9pqzi6AlYE+caQ/
	2NUw==
X-Gm-Message-State: APjAAAVvLgCmr7ay91oyJ1VitjkngYUXXFgMlto8rZ0CRcDofUnhuQ8X
	kyw3FlbnXpP62cSILhMigTE7H8eqG45Wwkqk6Y6bQuJ05UEpotR+FJOLZ2I4xUriNSPJx9qCi1h
	ZN3mjGAnyD5SzsR+Ok9yowblMXn8wzSBv4B3+Uz2hwA==
X-Received: by 2002:a37:9d10:: with SMTP id g16mr24681938qke.29.1570954098129; 
	Sun, 13 Oct 2019 01:08:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyaJ+QpLI1pMBCIJvuv7x0tuYvQpGl6FL4TAAJwm3gJXchv9/ST+/UasjDNh9TYNk8GtdJuXQ==
X-Received: by 2002:a37:9d10:: with SMTP id g16mr24681925qke.29.1570954097874; 
	Sun, 13 Oct 2019 01:08:17 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	f10sm6455018qtj.3.2019.10.13.01.08.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 13 Oct 2019 01:08:17 -0700 (PDT)
Date: Sun, 13 Oct 2019 04:08:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 4/4] vhost/net: add an option to test new code
Message-ID: <20191013080742.16211-5-mst@redhat.com>
References: <20191013080742.16211-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191013080742.16211-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Add a writeable module parameter that tests
the new code. Note: no effort was made to ensure
things work correctly if the parameter is changed
while the device is open. Make sure to
close the device before changing its value.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/net.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 1a2dd53caade..122b666ec1f2 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -35,6 +35,9 @@
 
 #include "vhost.h"
 
+static int newcode = 0;
+module_param(newcode, int, 0644);
+
 static int experimental_zcopytx = 0;
 module_param(experimental_zcopytx, int, 0444);
 MODULE_PARM_DESC(experimental_zcopytx, "Enable Zero Copy TX;"
@@ -565,8 +568,14 @@ static int vhost_net_tx_get_vq_desc(struct vhost_net *net,
 	struct vhost_virtqueue *rvq = &rnvq->vq;
 	struct vhost_virtqueue *tvq = &tnvq->vq;
 
-	int r = vhost_get_vq_desc(tvq, tvq->iov, ARRAY_SIZE(tvq->iov),
-				  out_num, in_num, NULL, NULL);
+	int r;
+
+	if (newcode)
+		r = vhost_get_vq_desc_batch(tvq, tvq->iov, ARRAY_SIZE(tvq->iov),
+					    out_num, in_num, NULL, NULL);
+	else
+		r = vhost_get_vq_desc(tvq, tvq->iov, ARRAY_SIZE(tvq->iov),
+				      out_num, in_num, NULL, NULL);
 
 	if (r == tvq->num && tvq->busyloop_timeout) {
 		/* Flush batched packets first */
@@ -575,8 +584,12 @@ static int vhost_net_tx_get_vq_desc(struct vhost_net *net,
 
 		vhost_net_busy_poll(net, rvq, tvq, busyloop_intr, false);
 
-		r = vhost_get_vq_desc(tvq, tvq->iov, ARRAY_SIZE(tvq->iov),
-				      out_num, in_num, NULL, NULL);
+		if (newcode)
+			r = vhost_get_vq_desc_batch(tvq, tvq->iov, ARRAY_SIZE(tvq->iov),
+						    out_num, in_num, NULL, NULL);
+		else
+			r = vhost_get_vq_desc(tvq, tvq->iov, ARRAY_SIZE(tvq->iov),
+					      out_num, in_num, NULL, NULL);
 	}
 
 	return r;
@@ -1046,9 +1059,14 @@ static int get_rx_bufs(struct vhost_virtqueue *vq,
 			r = -ENOBUFS;
 			goto err;
 		}
-		r = vhost_get_vq_desc(vq, vq->iov + seg,
-				      ARRAY_SIZE(vq->iov) - seg, &out,
-				      &in, log, log_num);
+		if (newcode)
+			r = vhost_get_vq_desc_batch(vq, vq->iov + seg,
+						    ARRAY_SIZE(vq->iov) - seg, &out,
+						    &in, log, log_num);
+		else
+			r = vhost_get_vq_desc(vq, vq->iov + seg,
+					      ARRAY_SIZE(vq->iov) - seg, &out,
+					      &in, log, log_num);
 		if (unlikely(r < 0))
 			goto err;
 
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
