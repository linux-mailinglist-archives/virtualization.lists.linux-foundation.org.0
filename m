Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D83A702BD1
	for <lists.virtualization@lfdr.de>; Mon, 15 May 2023 13:51:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0E97812A4;
	Mon, 15 May 2023 11:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0E97812A4
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bOD9yY7h
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oaxt9xpRxv8z; Mon, 15 May 2023 11:51:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7D65183BFC;
	Mon, 15 May 2023 11:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D65183BFC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC9C2C008A;
	Mon, 15 May 2023 11:51:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 593BDC002A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 May 2023 11:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34A0F40165
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 May 2023 11:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34A0F40165
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=bOD9yY7h
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAjFdnyQJYd9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 May 2023 11:51:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62B7A400FF
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62B7A400FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 May 2023 11:51:29 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3078d1c8828so9506212f8f.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 May 2023 04:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684151487; x=1686743487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ZxrLhbMqm9tPsig+ULpfo3eVRUq7zl+eSt53OmHcko=;
 b=bOD9yY7he8bOP4vGifYwZxj73H9sGfaKjhUIG2mfk5hvv6Dg2FxfWMFXFzKxD7Hzkg
 xBd4q4/49Z8k2Q4CToovriHAYv4xjWmJQnzbCCGhQ4EnBflG6bgPOgEinwiK6RB7kCB1
 OSaxmBw5z9g1pHsl1nvaLCHFaUsSzxcJRDdChZuXmMo4E0rFhxEez6GDaAHRmkNfSYPb
 gi/8lXkjAa3szTdovcnRiqKonQbDnpYCviHRnLJatCwKR7fB7tp30wojLIjn70Eld4nl
 CL+SbfDH29owrcs/gyvTK/ELZU8WBYlc71oFKANzghmZED7BoRDCi0ai4glk2WAoFqPU
 0SNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684151487; x=1686743487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+ZxrLhbMqm9tPsig+ULpfo3eVRUq7zl+eSt53OmHcko=;
 b=bqFH79XUCdjo/rvHC+UW9Z2T9lKegAEeCwtgYMtqu+x+oP4vpoZQ65FNMtW72dJ2uX
 E/kOxVvaZUbKc2H2F1slxQrJ53F2VEAz6MZszveA+YIkDULpq5zNdBbx6SE6oXy6j6Jw
 r81hPTQgZyJhk/74ngrZbJ8DK+M6HCv15CBkDHdnfaIcZ1SfxU84hFD2Nt2FhWQE+fBz
 mupjbvjU8lksy4kXXgsH8hUytp8RtYr598f4EIQeHEZwb0nZ5w7J80XmHOKjFLXrQQOl
 cc9hmN/kbKq1zdX4bGc6SBJFvNTapAY4ATQ5wly4gjKbzXzQ9WYO94HP0httvCZgUoel
 BdKA==
X-Gm-Message-State: AC+VfDwm0RwBnAyKD+j+rZKSFMwgHFi6TD6w1C+Ib91FoqS3gcndou38
 YSptAdkyDM+72YmGaCZjoR4WsA==
X-Google-Smtp-Source: ACHHUZ4V3Qog11yuZXD7nJ2Hy/NH2/YCvWaYTADQRCZiytBjuiZAVb4Ic6lBz+Kvcci1bbuTc4Oq3Q==
X-Received: by 2002:adf:e552:0:b0:307:7be5:90da with SMTP id
 z18-20020adfe552000000b003077be590damr21729916wrm.68.1684151487437; 
 Mon, 15 May 2023 04:51:27 -0700 (PDT)
Received: from localhost.localdomain (5750a5b3.skybroadband.com.
 [87.80.165.179]) by smtp.gmail.com with ESMTPSA id
 j6-20020a5d6186000000b003090cb7a9e6sm7555395wru.31.2023.05.15.04.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 04:51:27 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v2 2/2] iommu/virtio: Return size mapped for a detached domain
Date: Mon, 15 May 2023 12:39:50 +0100
Message-Id: <20230515113946.1017624-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230515113946.1017624-1-jean-philippe@linaro.org>
References: <20230515113946.1017624-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, akihiko.odaki@daynix.com,
 virtualization@lists.linux-foundation.org, eric.auger@redhat.com,
 iommu@lists.linux.dev, robin.murphy@arm.com
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

When map() is called on a detached domain, the domain does not exist in
the device so we do not send a MAP request, but we do update the
internal mapping tree, to be replayed on the next attach. Since this
constitutes a successful iommu_map() call, return *mapped in this case
too.

Fixes: 7e62edd7a33a ("iommu/virtio: Add map/unmap_pages() callbacks implementation")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/virtio-iommu.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index fd316a37d7562..3551ed057774e 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -833,25 +833,26 @@ static int viommu_map_pages(struct iommu_domain *domain, unsigned long iova,
 	if (ret)
 		return ret;
 
-	map = (struct virtio_iommu_req_map) {
-		.head.type	= VIRTIO_IOMMU_T_MAP,
-		.domain		= cpu_to_le32(vdomain->id),
-		.virt_start	= cpu_to_le64(iova),
-		.phys_start	= cpu_to_le64(paddr),
-		.virt_end	= cpu_to_le64(end),
-		.flags		= cpu_to_le32(flags),
-	};
+	if (vdomain->nr_endpoints) {
+		map = (struct virtio_iommu_req_map) {
+			.head.type	= VIRTIO_IOMMU_T_MAP,
+			.domain		= cpu_to_le32(vdomain->id),
+			.virt_start	= cpu_to_le64(iova),
+			.phys_start	= cpu_to_le64(paddr),
+			.virt_end	= cpu_to_le64(end),
+			.flags		= cpu_to_le32(flags),
+		};
 
-	if (!vdomain->nr_endpoints)
-		return 0;
-
-	ret = viommu_send_req_sync(vdomain->viommu, &map, sizeof(map));
-	if (ret)
-		viommu_del_mappings(vdomain, iova, end);
-	else if (mapped)
+		ret = viommu_send_req_sync(vdomain->viommu, &map, sizeof(map));
+		if (ret) {
+			viommu_del_mappings(vdomain, iova, end);
+			return ret;
+		}
+	}
+	if (mapped)
 		*mapped = size;
 
-	return ret;
+	return 0;
 }
 
 static size_t viommu_unmap_pages(struct iommu_domain *domain, unsigned long iova,
-- 
2.40.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
