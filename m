Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5641A043B
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:16:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CCF57878B4;
	Tue,  7 Apr 2020 01:16:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69FFznCfl5w8; Tue,  7 Apr 2020 01:16:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 83E7F8789E;
	Tue,  7 Apr 2020 01:16:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63F76C0177;
	Tue,  7 Apr 2020 01:16:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AC57C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7F8F92040C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id foJy65InEpvj
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 326B22002E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586222193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RVzro4XtEZaLbEft7JeQy81ssJHBlnUXRCePrLVPDZg=;
 b=IxnA8N2InNEgm/19vFJdUAeM3Mr5KGSVCZfFgbhgMCMoogbLALxglH13PEi/tTTm2HSfus
 PyZeENV24DOFyR3Xl/xyBtS2XZyGw7oykZ3Bz/Nw5vzoV5gkuJoS4f7XOMyf29bM5jVU5p
 63xRcps8MODEhshnlngwx0+o/Rq+6yM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-U8QsFIlsP7Ckq3HTh1ZwRg-1; Mon, 06 Apr 2020 21:16:32 -0400
X-MC-Unique: U8QsFIlsP7Ckq3HTh1ZwRg-1
Received: by mail-wr1-f70.google.com with SMTP id a10so879539wra.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RVzro4XtEZaLbEft7JeQy81ssJHBlnUXRCePrLVPDZg=;
 b=pG74oGe4XMlJHYptSM/BEB13tJSM6x/tvvQ/MlvyN/J9bEz1s7sS16Qq6CFj5uniYJ
 KUlbb3qyn5jkKKhdX+Z1Hu6W4knkPZa20Ud0mJ4uHR0IAGSWwVPRZ5rhk7FQkKIa83xs
 Os2/c295uA0Wyd3lyhL/BAXcRoPplGTCdbMJ360ZVNSWwYHi+LpP/nKWE9/eaf/8VKsC
 Cg3U5thOUnr5Yon8GFLxO/M7F3TgH0BhhHoyKA4omejGvXJ5L7/TJrXAQ1/1DliN4swf
 JXH7pygQedJ9/Dn1J50/f0pfkBiwsx3Ws4trDVCi9NDd9FCOU6MiV9y1o9USa3wBsFkK
 8ZwQ==
X-Gm-Message-State: AGi0PubtGR2JQeLowHOsiuqG3Xn719mP8ju6A0+9nypfZkK74W4bHO+1
 hzihGCygclk9bjb8oAf7SRmFURkQOTep8UTDsUT/ljkRjwdCkWus2880oO28Sz/a9aXS+NXFO9R
 As1XwYm4dS3itRBTVFa9wXbgNrldSLdlBiiJfAGXwOQ==
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr2187528wrp.90.1586222190936;
 Mon, 06 Apr 2020 18:16:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ7P/kPvw3paHovkMWNa/u3ENAVx5JqKqcOIuiBi1V5YrTfZ/ZU9piHeuzwqlHFaAyT1Zp0HQ==
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr2187520wrp.90.1586222190813;
 Mon, 06 Apr 2020 18:16:30 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id h26sm117645wmb.19.2020.04.06.18.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:16:30 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:16:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 01/19] tools/virtio: define aligned attribute
Message-ID: <20200407011612.478226-2-mst@redhat.com>
References: <20200407011612.478226-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407011612.478226-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
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

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tools/virtio/linux/compiler.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtio/linux/compiler.h b/tools/virtio/linux/compiler.h
index 903dc9c4bd11..2c51bccb97bb 100644
--- a/tools/virtio/linux/compiler.h
+++ b/tools/virtio/linux/compiler.h
@@ -7,4 +7,5 @@
 
 #define READ_ONCE(var) (*((volatile typeof(var) *)(&(var))))
 
+#define __aligned(x) __attribute((__aligned__(x)))
 #endif
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
