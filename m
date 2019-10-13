Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FAD5611
	for <lists.virtualization@lfdr.de>; Sun, 13 Oct 2019 13:54:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A38B32376;
	Sun, 13 Oct 2019 11:54:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 10EFC2367
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 11:42:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 04CF76CE
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 11:42:14 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C5333DE0C
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 11:42:13 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id j5so14849857qtn.10
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 04:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=Ls+7nvLzVD/C5D5VX4czbgip7cBCYdFDThqPFhQtYcU=;
	b=fyRS/MtDx8WmVUjdBBIKSxp2mKOrrCYeitkKB4fIxhQhEp9+XGs2SrrdH8ZzkFFC3E
	v2qTcOAd6bEttIqZCQZlqOHdQ9CAH1blb7un/XaB89OA2OE2brd2hnA8t99+sjIcSM8+
	OyD4dWCIfclMmjqa3SaXrI517TEWOgzcXd33h8dHdwkuU+YStoC4GMzVx1U2SaIKUhWI
	bOQSonsSqSpj/Jiaj+FAY5Jb8eH+4rQiqnUytbvmzpJgiv5McP/b3+t8xLaTs589SQ4G
	i1mP5lNGo4R9RzkHmhPszK3GWIwJWyJvgPyk9roKCePxX7U1ZLZF7TbZ2++g2l0Ps6JE
	fyKg==
X-Gm-Message-State: APjAAAWGwa1lXsP1cwOu5t+VbkWc99AY1IInFpwbdyMBO7fFotYSNzAq
	2pjIqbQ0Fw8xYjWzufV8p5SefaQSrWW0+fvZONcgTrCkY4kiLVn/nzsPCEP2l4WLTGThcx8Ebjo
	tjVhxuDJR+JEkYXbxKk3rNh8Mu6ZFxwzC7IAIzUSJpA==
X-Received: by 2002:a0c:fc4a:: with SMTP id w10mr26413621qvp.46.1570966932887; 
	Sun, 13 Oct 2019 04:42:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzk+MzrwJBp1s36w10kcHkZ3zHXuqofxfxn+xexQgdtQjVvG9LWQNytw8VUoM650ZyCDUjTNw==
X-Received: by 2002:a0c:fc4a:: with SMTP id w10mr26413597qvp.46.1570966932473; 
	Sun, 13 Oct 2019 04:42:12 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	g33sm6728182qtd.12.2019.10.13.04.42.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 13 Oct 2019 04:42:11 -0700 (PDT)
Date: Sun, 13 Oct 2019 07:42:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 2/5] vhost/test: add an option to test new code
Message-ID: <20191013113940.2863-3-mst@redhat.com>
References: <20191013113940.2863-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191013113940.2863-1-mst@redhat.com>
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
 drivers/vhost/test.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
index 056308008288..39a018a7af2d 100644
--- a/drivers/vhost/test.c
+++ b/drivers/vhost/test.c
@@ -18,6 +18,9 @@
 #include "test.h"
 #include "vhost.h"
 
+static int newcode = 0;
+module_param(newcode, int, 0644);
+
 /* Max number of bytes transferred before requeueing the job.
  * Using this limit prevents one virtqueue from starving others. */
 #define VHOST_TEST_WEIGHT 0x80000
@@ -58,10 +61,16 @@ static void handle_vq(struct vhost_test *n)
 	vhost_disable_notify(&n->dev, vq);
 
 	for (;;) {
-		head = vhost_get_vq_desc(vq, vq->iov,
-					 ARRAY_SIZE(vq->iov),
-					 &out, &in,
-					 NULL, NULL);
+		if (newcode)
+			head = vhost_get_vq_desc_batch(vq, vq->iov,
+						       ARRAY_SIZE(vq->iov),
+						       &out, &in,
+						       NULL, NULL);
+		else
+			head = vhost_get_vq_desc(vq, vq->iov,
+						 ARRAY_SIZE(vq->iov),
+						 &out, &in,
+						 NULL, NULL);
 		/* On error, stop handling until the next kick. */
 		if (unlikely(head < 0))
 			break;
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
