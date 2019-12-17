Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 43522123570
	for <lists.virtualization@lfdr.de>; Tue, 17 Dec 2019 20:14:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C870B8636D;
	Tue, 17 Dec 2019 19:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMMyZJAeaa9y; Tue, 17 Dec 2019 19:14:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 489AC85FAE;
	Tue, 17 Dec 2019 19:14:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34768C077D;
	Tue, 17 Dec 2019 19:14:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BA1CC077D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 19:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 16BBD85FA4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 19:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mf1YrWQS8SOq
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 19:14:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 92F2F857D6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 19:14:24 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id k25so6183491pgt.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 11:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c2x7CM8Btjs+UuSYh0fcfzZK8a7PrsBtFIzXCqrFemg=;
 b=WlJfYT2k8U37vSXGAKFxab9ISdMIBHofpb2VPgQ5P7SovscC3++o4fE3aCK6oKhgNt
 CeYgyM8mdrpA4LwHR/englB1SsJqCSfNHP6rsfBXpo4aZ1qFY8ae1UlcBz1F687i1T7x
 aWYCx6/3Gc7TOT9LWoKnqZmcIO4CXXrcFCuDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c2x7CM8Btjs+UuSYh0fcfzZK8a7PrsBtFIzXCqrFemg=;
 b=oJcjflLjnl3MTCh3dm9dbQifVGkk+/dVQLDs/Lwy/7Ugu8YVOKJV1jaIws2KNGweTE
 aEYiFVCvzXBZ59/0qAg0PXOFdNroO21hgfX8MSDiCoXBxO40+Ehi8Kk0Xujj/02tvVDf
 F46bN1FObg51FgvPtknHbr/q4ciwhtfDMiY6UTR4Falqwt2/ETAaVa0bcDHuo9RoZbtk
 b/lZ+wqVGQFLPBHqPekE2VxL/nyMt42Ag2GqJoNvQaWhnOh2fn+quViH4L1UO0FvbPRd
 8LAzFJlTngEbMQDX+RP39MEjNcByfpleirNzJGPL4zfJlBCRZwe4LSRuIZ6Qocn0jrd5
 A6Lw==
X-Gm-Message-State: APjAAAWAiB2OqEg6D+HTPJJVQtkecpmYza2TuSFZ8XIKTDjXJpgIGvTL
 q+t+/LP8rcdzHH4Az2vcNYcOu/ZLsXc=
X-Google-Smtp-Source: APXvYqxxJ7NyW67gGF+KPqDRTcvIGXblbd6n0Zc1Fny3vinQqjWR555u36OgKhkVUVpvgd4obgkXcg==
X-Received: by 2002:a63:1344:: with SMTP id 4mr27453619pgt.0.1576609575949;
 Tue, 17 Dec 2019 11:06:15 -0800 (PST)
Received: from localhost ([2620:15c:202:201:bfdf:e7dd:b034:6ac7])
 by smtp.gmail.com with ESMTPSA id p5sm27057559pgs.28.2019.12.17.11.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 11:06:15 -0800 (PST)
From: Daniel Verkamp <dverkamp@chromium.org>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH 2/2] virtio-pci: check name when counting MSI-X vectors
Date: Tue, 17 Dec 2019 11:06:10 -0800
Message-Id: <20191217190610.248061-2-dverkamp@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191217190610.248061-1-dverkamp@chromium.org>
References: <20191217190610.248061-1-dverkamp@chromium.org>
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

VQs without a name specified are not valid; they are skipped in the
later loop that assigns MSI-X vectors to queues, but the per_vq_vectors
loop above that counts the required number of vectors previously still
counted any queue with a non-NULL callback as needing a vector.

Add a check to the per_vq_vectors loop so that vectors with no name are
not counted to make the two loops consistent.  This prevents
over-counting unnecessary vectors (e.g. for features which were not
negotiated with the device).

Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
---
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
