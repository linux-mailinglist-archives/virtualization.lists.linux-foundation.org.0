Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B53806C8160
	for <lists.virtualization@lfdr.de>; Fri, 24 Mar 2023 16:36:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FFC060ADD;
	Fri, 24 Mar 2023 15:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FFC060ADD
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TeoOF8VK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BRgm6CuvHMVB; Fri, 24 Mar 2023 15:36:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DD03D607B0;
	Fri, 24 Mar 2023 15:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD03D607B0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47185C007E;
	Fri, 24 Mar 2023 15:36:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3C05C0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Mar 2023 15:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE36760ADD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Mar 2023 15:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE36760ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cvM4PtYgU7KC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Mar 2023 15:36:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27316607B0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27316607B0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Mar 2023 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679672210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=reoAM7f+Ql0t7teTIED97nCtpsbVHLsQxA9mgF0KDac=;
 b=TeoOF8VKC3NFJ91iSDXj6g4d7GljTz3m3Z5prAGc9BcOJrWcmTT/iTZQdfsu6jNNW71rwv
 9AulSSFvk0jJB91AodcbG4jjun2fIYYGscKoo6xpr3cEytZm4exwCfdQ59E3iStjFqUeeR
 I1+g5uUC80gp6dgRIavQGDwhh0p3ccs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-4QEnLpdqOIWCs8hPBzr_UQ-1; Fri, 24 Mar 2023 11:36:49 -0400
X-MC-Unique: 4QEnLpdqOIWCs8hPBzr_UQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 r19-20020a50aad3000000b005002e950cd3so3790067edc.11
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Mar 2023 08:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679672206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=reoAM7f+Ql0t7teTIED97nCtpsbVHLsQxA9mgF0KDac=;
 b=Tz6ICOqMc5rLC9Tc7X4jSGE6CWj8bCoYqla6Ikwd1MtjzV6ob2ktDkvN556sj4mldB
 sNOQk3sdLZtb00XCXw+fPuiAYjA/gitKls2P4uxmjjcH5UGNX9luCrIvpmF/HDnhDptx
 W8M+9C8BZMFe36uSTH/VcjFy2gkx4M4HAbkmXPicsLgVd8rbRTeeQoAcOWTq1cH1YMKV
 NZ6dkdUvems7IWld7mySaHkAGTP32IZo4JYFozM1Ueg+drufwyGnctXfTojBXgjEN7l9
 gON36A4dCDVsCZm91kHDhoUyDEv7Eiiy2B57zlnvX/66jLJO0vjCoCNGbbcFI6xJpqy1
 wd2w==
X-Gm-Message-State: AAQBX9cjVZNWg3Li4TgqU503eIZQIwlB6zrwuw9jbWhlw1+NqUhcxvOU
 CdUouL2k1hKRcR6War4WD8Up156xhicthE8K57wpHWqdm6a0/bjM7IkYs4M+BO/zdYD0Qkksz/I
 BkPdK/MDnM9a4b9EvAeQdd1TL2DwQE7Up0Xnv1UvqBB6iF97ssfyAjT5CpIvJHqP65/jj08u842
 WjOqOXBdJV17S9wBZB5oS6j7qUSQ==
X-Received: by 2002:a05:6402:1002:b0:501:c547:2135 with SMTP id
 c2-20020a056402100200b00501c5472135mr3055033edu.36.1679672206688; 
 Fri, 24 Mar 2023 08:36:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350b+KdvTwnSlwUHcwfB5Dr3iyF2TswJnUvHzIhq2f2NvqKi7QHj4nw34d7o5dhOk+zWrmvdj3w==
X-Received: by 2002:a05:6402:1002:b0:501:c547:2135 with SMTP id
 c2-20020a056402100200b00501c5472135mr3055009edu.36.1679672206395; 
 Fri, 24 Mar 2023 08:36:46 -0700 (PDT)
Received: from localhost.localdomain
 (host-82-53-134-98.retail.telecomitalia.it. [82.53.134.98])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a50d0d9000000b00501c2a9e16dsm7987307edf.74.2023.03.24.08.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 08:36:45 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v4 4/9] vringh: define the stride used for translation
Date: Fri, 24 Mar 2023 16:36:02 +0100
Message-Id: <20230324153607.46836-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324153607.46836-1-sgarzare@redhat.com>
References: <20230324153607.46836-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, eperezma@redhat.com, stefanha@redhat.com
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

Define a macro to be reused in the different parts of the code.

Useful for the next patches where we add more arrays to manage also
translations with user VA.

Suggested-by: Eugenio Perez Martin <eperezma@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---

Notes:
    v4:
    - added this patch with the changes extracted from the next patch [Eugenio]
    - used _STRIDE instead of _SIZE [Eugenio]

 drivers/vhost/vringh.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index 0ba3ef809e48..4aee230f7622 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -1141,13 +1141,15 @@ static int iotlb_translate(const struct vringh *vrh,
 	return ret;
 }
 
+#define IOTLB_IOV_STRIDE 16
+
 static inline int copy_from_iotlb(const struct vringh *vrh, void *dst,
 				  void *src, size_t len)
 {
 	u64 total_translated = 0;
 
 	while (total_translated < len) {
-		struct bio_vec iov[16];
+		struct bio_vec iov[IOTLB_IOV_STRIDE];
 		struct iov_iter iter;
 		u64 translated;
 		int ret;
@@ -1180,7 +1182,7 @@ static inline int copy_to_iotlb(const struct vringh *vrh, void *dst,
 	u64 total_translated = 0;
 
 	while (total_translated < len) {
-		struct bio_vec iov[16];
+		struct bio_vec iov[IOTLB_IOV_STRIDE];
 		struct iov_iter iter;
 		u64 translated;
 		int ret;
-- 
2.39.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
