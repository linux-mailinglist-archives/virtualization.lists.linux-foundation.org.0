Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A902123CB40
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 15:45:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4F9FB22713;
	Wed,  5 Aug 2020 13:45:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5PVSn0-DVND; Wed,  5 Aug 2020 13:45:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CA400226FF;
	Wed,  5 Aug 2020 13:45:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFAA7C0051;
	Wed,  5 Aug 2020 13:45:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB137C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 87A84226B0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPYNthVanZQ5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:45:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 8871D2271F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596635103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=atxIzRxbT9FOuFO2CvHZA+vE3tCMe4mwfA9uGPPCf/o=;
 b=EapARIHpRcL8L8odkOjm8bwfBJ8cNJeLPOUbtT6li4KNMPqj9vdbSPc2XUi0sNSFgPsRr/
 GDXdLm2dYs9CNtxrRGWkUtu45mLIxczRJJEwJVWgoZXG5IcKUv5Por2y4hzY2HR1kxybkq
 XX4b41Y58qCHZ0nJr1XnypMmRAROQ4c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-Yh_ukuwrNBOQvv5lrXJ0Fw-1; Wed, 05 Aug 2020 09:45:02 -0400
X-MC-Unique: Yh_ukuwrNBOQvv5lrXJ0Fw-1
Received: by mail-wm1-f72.google.com with SMTP id f74so2746517wmf.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Aug 2020 06:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=atxIzRxbT9FOuFO2CvHZA+vE3tCMe4mwfA9uGPPCf/o=;
 b=aN978vGmTZR3UZ5cpCS2NyRBNm0LCAsziCRBFyGQ+j2DgrL5nxvwi9BDqosD6bA0/N
 Ye610fCZd0AcdwhHfmgpNlLe31PckeFcTh/4thgMSjtrL60PQqjToMKCb25ejGZCyk12
 M5l+cUerfrk38sFz/wFxb9xUHoVlOJTuOUMKUTQ1GV7GHAKJnmxZ0xGIUG0qVSwf6wG4
 LEJ59yH4YKSux27ojlCliwLy7bh3i6kuKFq3dXheCPYJSr54iEl3Hd+j3mzLku5NPS1/
 xsS4tzEqDtjAhgombpbt2ESCL0yuij85Xy+gP0LQBJ6PZ389QzE6aq3Ct2IqQK5wJLSc
 jhTQ==
X-Gm-Message-State: AOAM530e3RSfYxWWdJ74h57daKOzqggZZqvPXZCT2+3HXyFWxfDD0Qda
 qd28JjREGnrXTQ6vIyrQIzNVSyl7scUwjUtFuzxyTpJ20fDdfHJrVtwd9kFf5SdNfWKGZLWySZx
 adTa4sC0Ec6e/RHTPcv3eTHYF11G1zkwXjTV3VxsOCw==
X-Received: by 2002:a1c:2095:: with SMTP id g143mr3259118wmg.113.1596635100199; 
 Wed, 05 Aug 2020 06:45:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi486zYfcrRq7SJ5KWTOvEIp6eSofJ8hVOMn9kJixY7f4ly7cOd7mIjGAtKnLyQE6YgYvPbA==
X-Received: by 2002:a1c:2095:: with SMTP id g143mr3259106wmg.113.1596635100023; 
 Wed, 05 Aug 2020 06:45:00 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
 by smtp.gmail.com with ESMTPSA id v15sm2904117wrm.23.2020.08.05.06.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:44:59 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:44:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 37/38] virtio_config: drop LE option from config space
Message-ID: <20200805134226.1106164-38-mst@redhat.com>
References: <20200805134226.1106164-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200805134226.1106164-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org
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

All drivers now use virtio_cread/write_le for LE config
space fields. Drop LE option from virtio_cread/write, only leaving
the option to access transitional fields.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/linux/virtio_config.h | 28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index cc7a2b1fd7b2..ecb166c824bb 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -293,19 +293,7 @@ static inline __virtio64 cpu_to_virtio64(struct virtio_device *vdev, u64 val)
 		__u8: (x), \
 		__virtio16: virtio16_to_cpu((vdev), (x)), \
 		__virtio32: virtio32_to_cpu((vdev), (x)), \
-		__virtio64: virtio64_to_cpu((vdev), (x)), \
-		/*
-		 * Why define a default? checker can distinguish between
-		 * e.g. __u16, __le16 and __virtio16, but GCC can't so
-		 * attempts to define variants for both look like a duplicate
-		 * variant to it.
-		 */ \
-		default: _Generic((x), \
-				 __u8: (x), \
-				 __le16: virtio16_to_cpu((vdev), (__force __virtio16)(x)), \
-				 __le32: virtio32_to_cpu((vdev), (__force __virtio32)(x)), \
-				 __le64: virtio64_to_cpu((vdev), (__force __virtio64)(x)) \
-				 ) \
+		__virtio64: virtio64_to_cpu((vdev), (x)) \
 		)
 
 #define cpu_to_virtio(vdev, x, m) \
@@ -313,19 +301,7 @@ static inline __virtio64 cpu_to_virtio64(struct virtio_device *vdev, u64 val)
 		__u8: (x), \
 		__virtio16: cpu_to_virtio16((vdev), (x)), \
 		__virtio32: cpu_to_virtio32((vdev), (x)), \
-		__virtio64: cpu_to_virtio64((vdev), (x)), \
-		/*
-		 * Why define a default? checker can distinguish between
-		 * e.g. __u16, __le16 and __virtio16, but GCC can't so
-		 * attempts to define variants for both look like a duplicate
-		 * variant to it.
-		 */ \
-		default: _Generic((m), \
-				 __u8: (x), \
-				 __le16: (__force __le16)cpu_to_virtio16((vdev), (x)), \
-				 __le32: (__force __le32)cpu_to_virtio32((vdev), (x)), \
-				 __le64: (__force __le64)cpu_to_virtio64((vdev), (x)) \
-				 ) \
+		__virtio64: cpu_to_virtio64((vdev), (x)) \
 		)
 
 #define __virtio_native_type(structname, member) \
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
