Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FD3121F0C
	for <lists.virtualization@lfdr.de>; Tue, 17 Dec 2019 00:39:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 870D586A0F;
	Mon, 16 Dec 2019 23:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kg-MebymKhJr; Mon, 16 Dec 2019 23:39:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E908586538;
	Mon, 16 Dec 2019 23:39:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6150C077D;
	Mon, 16 Dec 2019 23:39:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C42E4C077D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Dec 2019 23:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AD32622708
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Dec 2019 23:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3fbjzYz2Bsza
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Dec 2019 23:39:03 +0000 (UTC)
X-Greylist: delayed 00:24:30 by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id E046B22703
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Dec 2019 23:39:03 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id j11so3713724pjs.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Dec 2019 15:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hh4xJUGnwtI6vTmvxaUgzW0nF+oGlVMU5O+ceMGA88M=;
 b=SgzCCyoQgX+qcPm/DKUK17Os5yRMoipT1rwpuulJYqCs/xRfkx/EfDC1moVtI6wpBi
 8IP/o2G0A+v/q8yQD1fMABfUVWNiIjm8rs91U5+EXiXK1ElxTV6rwifM99Girb803Mbr
 Y+1KLgN0EVhfhaUgyFCUN+yT1net7VFKxsWgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hh4xJUGnwtI6vTmvxaUgzW0nF+oGlVMU5O+ceMGA88M=;
 b=Y1dAO2p+TIvdy2exeJRO0rNQYV44OEo87b2guJMNfS9s5cavasYm9opUooHsm1tKSO
 OGgl76GFL2XiePkh9C0CxZD3sopbHdecttnm2IbUmPefq5Ivqwskcr4uwO7NEX7ncP24
 UOuCkX0upO3nNrbI72Xx0ANo2pclIXUQrWzXv5fQCV8FP7qcgyqku8xLXq1NucYJGUA+
 H8XsAjwGSDeWgRB2bjcH1F8n32mkjisyW96mwPJ2rDzqePkfQzlEtmduG5wzDqi+s9eN
 5Wg522cQgbIHBor4urj7zgTxrNjt31sUQKMtldhDyCzMEGyiXwtKPNudIGkg2DJ78JAz
 u+nQ==
X-Gm-Message-State: APjAAAWjTmnl4yGwQCEjHGR6p/iVsHu1P7l0QIVyX4xMlqPBhaD2PeoF
 CK/y6n0YNUDKi5jDKCRsdU6lPbchfeQ=
X-Google-Smtp-Source: APXvYqxOZHjGu9ft+ASNRTxZGhrHVLXROKs4n9qFX/OnSQbkgrxElNjjTHcV0mVi8HZCDGvGAS+LCA==
X-Received: by 2002:a17:902:8bc5:: with SMTP id
 r5mr19585315plo.189.1576538072271; 
 Mon, 16 Dec 2019 15:14:32 -0800 (PST)
Received: from localhost ([2620:15c:202:201:bfdf:e7dd:b034:6ac7])
 by smtp.gmail.com with ESMTPSA id w8sm23168802pfn.186.2019.12.16.15.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 15:14:31 -0800 (PST)
From: Daniel Verkamp <dverkamp@chromium.org>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH] virtio-balloon: request nvqs based on features
Date: Mon, 16 Dec 2019 15:14:29 -0800
Message-Id: <20191216231429.38202-1-dverkamp@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Cc: Liang Li <liang.z.li@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
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

After 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT"),
the virtio-balloon device unconditionally specifies 4 virtqueues as the
argument to find_vqs(), which means that 5 MSI-X vectors are required in
order to assign one vector per VQ plus one for configuration changes.

However, in cases where the virtio device only provides exactly as many
MSI-X vectors as required for the features it implements (e.g. 3 for the
basic configuration of inflate + deflate + config), this results in the
selection of the fallback configuration where one interrupt vector is
used for all VQs instead of having one VQ per vector.

Restore the logic that chose nvqs conditionally based on enabled
features, which was removed as part of the aforementioned commit.
This is slightly more complex than just incrementing a counter of the
number of VQs, since the queue for a given feature is assigned a fixed
index.

Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
---
 drivers/virtio/virtio_balloon.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 93f995f6cf36..67c6318d77c7 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -465,6 +465,7 @@ static int init_vqs(struct virtio_balloon *vb)
 	vq_callback_t *callbacks[VIRTIO_BALLOON_VQ_MAX];
 	const char *names[VIRTIO_BALLOON_VQ_MAX];
 	int err;
+	unsigned nvqs;
 
 	/*
 	 * Inflateq and deflateq are used unconditionally. The names[]
@@ -475,20 +476,24 @@ static int init_vqs(struct virtio_balloon *vb)
 	names[VIRTIO_BALLOON_VQ_INFLATE] = "inflate";
 	callbacks[VIRTIO_BALLOON_VQ_DEFLATE] = balloon_ack;
 	names[VIRTIO_BALLOON_VQ_DEFLATE] = "deflate";
+	nvqs = VIRTIO_BALLOON_VQ_DEFLATE + 1;
+
 	names[VIRTIO_BALLOON_VQ_STATS] = NULL;
 	names[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
 
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_STATS_VQ)) {
 		names[VIRTIO_BALLOON_VQ_STATS] = "stats";
 		callbacks[VIRTIO_BALLOON_VQ_STATS] = stats_request;
+		nvqs = VIRTIO_BALLOON_VQ_STATS + 1;
 	}
 
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
 		names[VIRTIO_BALLOON_VQ_FREE_PAGE] = "free_page_vq";
 		callbacks[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
+		nvqs = VIRTIO_BALLOON_VQ_FREE_PAGE + 1;
 	}
 
-	err = vb->vdev->config->find_vqs(vb->vdev, VIRTIO_BALLOON_VQ_MAX,
+	err = vb->vdev->config->find_vqs(vb->vdev, nvqs,
 					 vqs, callbacks, names, NULL, NULL);
 	if (err)
 		return err;
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
