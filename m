Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E57801235A3
	for <lists.virtualization@lfdr.de>; Tue, 17 Dec 2019 20:27:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8D37586599;
	Tue, 17 Dec 2019 19:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9QavZRZbI65S; Tue, 17 Dec 2019 19:27:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 18EDC8643D;
	Tue, 17 Dec 2019 19:27:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F35E8C1D7D;
	Tue, 17 Dec 2019 19:27:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9EBAC077D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 19:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C522D86D5A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 19:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1sZfo1oMtvP0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 19:27:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5145086D41
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 19:27:13 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id k25so6201724pgt.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 11:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ANMvkj+l7q7AopI4QOdGaOhvpqKS81eqSuGoKFBjI0=;
 b=Ku5MIkBfpFYTsFcD/ydV1xr6F/r2WI5SW23pPmXA9JaqAUJbfuDz6YYdfVPwyu0AgJ
 8k/gsa6phHSVhHi+cRUZtWhw1fvB9r8hoQ63cEMcPNmU9HOwOav9JYIEBKb5KsRBfvFx
 Bbc3ghDt3bNmtjzgfiVmQxZW8Z1TFl53Yzgdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ANMvkj+l7q7AopI4QOdGaOhvpqKS81eqSuGoKFBjI0=;
 b=smsLiGGgN1Uk8K57ragEjM4bRLP7y+iXX+pUsd2VM2IXhmqTvPzWFf//Ck4xJ516yv
 VCzW/TVDFxvNkXTwkRHsE+uLbMBYABSdkaBiRiajHmT1GjTbElEkLRPktbv8uGlw580v
 i9shOVWqSgJjiyVYHdePf79dCHj14IJWdB0wuavcmJPsY7yfEPlNm1kqzAmngRTG/QQk
 626+e+4hVvE5iSh6m5qGqqikZBvK8tmQxfIPMeEKDgwa+UVGQ2gFLq17CqX+NB2WhW16
 njaZbPZY2d/tTNIMOmKg9SzZWI4hVUTF+B/XDxBUcASrQ1SnoIxN0eE/EHZ+s5LkaJP2
 mkXQ==
X-Gm-Message-State: APjAAAW0gw0CIEWFB+nAWUqAvseDiAJ9Wy0oizFvO4nqjOdt+MJghSs5
 XbK+qAS6Qyo10Og7Ef34YTPpLyLhqT0=
X-Google-Smtp-Source: APXvYqwui/AQDXz+WKcb/k8VKMvBgH9+lyqmVoPV0Gd3b+XGJ2oF0EWybdNacusB6PFTCNE2Y9M6IQ==
X-Received: by 2002:a63:534d:: with SMTP id t13mr25903820pgl.89.1576609573048; 
 Tue, 17 Dec 2019 11:06:13 -0800 (PST)
Received: from localhost ([2620:15c:202:201:bfdf:e7dd:b034:6ac7])
 by smtp.gmail.com with ESMTPSA id g17sm29011450pfb.180.2019.12.17.11.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 11:06:12 -0800 (PST)
From: Daniel Verkamp <dverkamp@chromium.org>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH 1/2] virtio-balloon: initialize all vq callbacks
Date: Tue, 17 Dec 2019 11:06:09 -0800
Message-Id: <20191217190610.248061-1-dverkamp@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Cc: "Michael S. Tsirkin" <mst@redhat.com>
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

Ensure that elements of the array that correspond to unavailable
features are set to NULL; previously, they would be left uninitialized.

Since the corresponding names array elements were explicitly set to
NULL, the uninitialized callback pointers would not actually be
dereferenced; however, the uninitialized callbacks elements would still
be read in vp_find_vqs_msix() and used to calculate the number of MSI-X
vectors required.

Fixes: 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
---
 drivers/virtio/virtio_balloon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 93f995f6cf36..8e400ece9273 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -475,7 +475,9 @@ static int init_vqs(struct virtio_balloon *vb)
 	names[VIRTIO_BALLOON_VQ_INFLATE] = "inflate";
 	callbacks[VIRTIO_BALLOON_VQ_DEFLATE] = balloon_ack;
 	names[VIRTIO_BALLOON_VQ_DEFLATE] = "deflate";
+	callbacks[VIRTIO_BALLOON_VQ_STATS] = NULL;
 	names[VIRTIO_BALLOON_VQ_STATS] = NULL;
+	callbacks[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
 	names[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
 
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_STATS_VQ)) {
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
