Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDA412FCB0
	for <lists.virtualization@lfdr.de>; Fri,  3 Jan 2020 19:41:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F1389220CE;
	Fri,  3 Jan 2020 18:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FkKnozLbwbVW; Fri,  3 Jan 2020 18:41:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 15AB7220C4;
	Fri,  3 Jan 2020 18:41:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFD66C077D;
	Fri,  3 Jan 2020 18:41:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1AE6C077D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jan 2020 18:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DD8C185FA6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jan 2020 18:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DseNjElFUWKQ
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jan 2020 18:41:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6E30A85F91
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jan 2020 18:41:12 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id s21so16597545plr.7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Jan 2020 10:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9D9VKvlmP4xcm6mxezMI2I1JZqbgHJUV5TDzvPDXAZc=;
 b=mOCzmArRiEdKbKLIV75kzBRFbotMbnbRqZiB6g3ozt1sF661siuhpBbbkMMLCGIMqA
 OcKQE0HBEVM6djbylxYWhWqetE46pLwjmu2ta0zO9/PFtu2DOz22Eh1JuZ5tghmTo22H
 YxxYXHdxS3dOxuIcSXUMFgDm15nC0XuwPylLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9D9VKvlmP4xcm6mxezMI2I1JZqbgHJUV5TDzvPDXAZc=;
 b=Ddqj28nfKX1th07z6rQgwB9Z2uU9YLPKULFw2Tx6ORjBVd/dVqyscIg2VkCuPV63vT
 6c92Z8itRKW/J7TLKQIYSyg9Lq767t66UvWjffUZUJ8Q9k5B6PDRg+REfnvtCOrxmZkb
 wz1bLiDEIG109HFOVK5dsI7j88WpWMcfGX/nrqTiQvHKkCCKt2cDGCCobERqfFEL71yn
 lYWHeGl737EE2tjk4LAvLUb0+kp3FMydkzG3WTy1YMBYMxEODRHPrce0ASi6jihFQDDk
 CGRCUKt8lnNKlbCAqwYFIi+JiA3F+7Bj+IqWRMt6MGsfwqua1b4rmQO2OMl1UDhfXa1g
 FByA==
X-Gm-Message-State: APjAAAU5AFMLLtlRaVpZJ/slN28XJF0mJnVvX2w6dXx2OwBYpZ85M57K
 t435O8LNdjUpcRUKVwY8QZiMM93XqJ0=
X-Google-Smtp-Source: APXvYqwfOLQ/OQ5FETpgrQxvjhXZ82bQ04yNryRwdwQ2sYGhyU7RRcf9EXByhH4WUopQW4J4aVz8Ig==
X-Received: by 2002:a17:902:fe8b:: with SMTP id
 x11mr85211967plm.83.1578076871842; 
 Fri, 03 Jan 2020 10:41:11 -0800 (PST)
Received: from localhost ([2620:15c:202:201:bfdf:e7dd:b034:6ac7])
 by smtp.gmail.com with ESMTPSA id q63sm45907923pfb.149.2020.01.03.10.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 10:41:11 -0800 (PST)
From: Daniel Verkamp <dverkamp@chromium.org>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v2 2/2] virtio-pci: check name when counting MSI-X vectors
Date: Fri,  3 Jan 2020 10:40:45 -0800
Message-Id: <20200103184044.73568-2-dverkamp@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20200103184044.73568-1-dverkamp@chromium.org>
References: <20200103184044.73568-1-dverkamp@chromium.org>
MIME-Version: 1.0
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 stable@vger.kernel.org
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

VQs without a name specified are not valid; they are skipped in the
later loop that assigns MSI-X vectors to queues, but the per_vq_vectors
loop above that counts the required number of vectors previously still
counted any queue with a non-NULL callback as needing a vector.

Add a check to the per_vq_vectors loop so that vectors with no name are
not counted to make the two loops consistent.  This prevents
over-counting unnecessary vectors (e.g. for features which were not
negotiated with the device).

Cc: stable@vger.kernel.org
Fixes: 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
---

v1:
https://lists.linuxfoundation.org/pipermail/virtualization/2019-December/044828.html

 drivers/virtio/virtio_pci_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index f2862f66c2ac..222d630c41fc 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -294,7 +294,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned nvqs,
 		/* Best option: one for change interrupt, one per vq. */
 		nvectors = 1;
 		for (i = 0; i < nvqs; ++i)
-			if (callbacks[i])
+			if (names[i] && callbacks[i])
 				++nvectors;
 	} else {
 		/* Second best: one for change, shared for all vqs. */
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
