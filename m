Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 339D723AE96
	for <lists.virtualization@lfdr.de>; Mon,  3 Aug 2020 22:59:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D9697204FF;
	Mon,  3 Aug 2020 20:59:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WYM8gX++NQ9o; Mon,  3 Aug 2020 20:59:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 00D35204C7;
	Mon,  3 Aug 2020 20:59:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2218C0050;
	Mon,  3 Aug 2020 20:59:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07BDCC004C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 20:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E4697204C7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 20:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGlFl4x57XzU
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 20:59:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id DC53E20482
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596488369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ab6nlp2Jw2w+JsB2kWgOwMJeURtEG/pcTlw1+Idrc0w=;
 b=Xfk6ByDARDnH4VHd4O9qqSeykAwQjQFULdvf6ALai383GfkYPK6A9bfhdVurOhczH74vos
 2+Cg/j2+iCXiASRwMVjY2dxnBaxVpYAkRpPGxHz9AaU9mtx7wL4pddjJDbIHLE+CVfZU33
 LMrlfgawdtrSJEkF4+7E9I9ZNjvKXrU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-_OgDptckNYSRUuGikXmNrA-1; Mon, 03 Aug 2020 16:59:28 -0400
X-MC-Unique: _OgDptckNYSRUuGikXmNrA-1
Received: by mail-qt1-f197.google.com with SMTP id b1so20293258qto.17
 for <virtualization@lists.linux-foundation.org>;
 Mon, 03 Aug 2020 13:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ab6nlp2Jw2w+JsB2kWgOwMJeURtEG/pcTlw1+Idrc0w=;
 b=LzKBQ14ToRssdAGDJAMMPyJQiEYj9lrbdJjBF0O/b9lJcFSdBDFcAhbqYiFKsSxCSb
 OP+rMfJUZF3/jlfJFaC6p4HsGLycwkt6KSEffpyjACET4cgxMdCQ5WNNmwA2Hb4WepTG
 T+cEDUUWvV5ISVYii2hOhqNK3VmKcfchd5Dyt9uptCPQcVZF7gy3O1QIZJfggIgJpMjd
 a1ZFlrgprihXsx0V+3xmEipM4sqfsyGV9OurJHESCYE9j2GDHFJsdVkmjXBbUZ8jCMNO
 sXjUe1KqFX2c75eg8IuRQSIMhCQKaqIG+oAChZDcVq/GKWyHpBuxbqNX1mwRp9cvsmXy
 ogdw==
X-Gm-Message-State: AOAM531Au+y+vxtZJIzhM9o5TQNu/IFYr8xf/u2f0f9Qrv9/kwctl57i
 +JHmUX2Kc0a6pZFj+dHj2tItA4pvB0mofGF7QjHn54YAflusTeoWLE0bIMNkggK1Duo2OhtXIei
 +uWPvNuOuakjDENd7sgZfXzwWUNbqGWf+U0Tz+BRoYw==
X-Received: by 2002:a05:620a:208f:: with SMTP id
 e15mr17956955qka.473.1596488367588; 
 Mon, 03 Aug 2020 13:59:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrB9UGtNCPuZQkt5PUco1BHyFWN4HxBbqHKD5Mi9qKM26/vro6+0vNw0/CJquO0wN55PmNug==
X-Received: by 2002:a05:620a:208f:: with SMTP id
 e15mr17956941qka.473.1596488367357; 
 Mon, 03 Aug 2020 13:59:27 -0700 (PDT)
Received: from redhat.com (bzq-79-177-102-128.red.bezeqint.net.
 [79.177.102.128])
 by smtp.gmail.com with ESMTPSA id i20sm19809053qka.17.2020.08.03.13.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 13:59:26 -0700 (PDT)
Date: Mon, 3 Aug 2020 16:59:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/24] virtio_input: correct tags for config space fields
Message-ID: <20200803205814.540410-12-mst@redhat.com>
References: <20200803205814.540410-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200803205814.540410-1-mst@redhat.com>
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

Since this is a modern-only device,
tag config space fields as having little endian-ness.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/uapi/linux/virtio_input.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/uapi/linux/virtio_input.h b/include/uapi/linux/virtio_input.h
index a7fe5c8fb135..52084b1fb965 100644
--- a/include/uapi/linux/virtio_input.h
+++ b/include/uapi/linux/virtio_input.h
@@ -40,18 +40,18 @@ enum virtio_input_config_select {
 };
 
 struct virtio_input_absinfo {
-	__u32 min;
-	__u32 max;
-	__u32 fuzz;
-	__u32 flat;
-	__u32 res;
+	__le32 min;
+	__le32 max;
+	__le32 fuzz;
+	__le32 flat;
+	__le32 res;
 };
 
 struct virtio_input_devids {
-	__u16 bustype;
-	__u16 vendor;
-	__u16 product;
-	__u16 version;
+	__le16 bustype;
+	__le16 vendor;
+	__le16 product;
+	__le16 version;
 };
 
 struct virtio_input_config {
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
