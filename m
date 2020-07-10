Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A13621B370
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 12:49:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 21C4489BBC;
	Fri, 10 Jul 2020 10:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yuyv5-Q5s9sl; Fri, 10 Jul 2020 10:49:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B5B50898A7;
	Fri, 10 Jul 2020 10:49:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA234C016F;
	Fri, 10 Jul 2020 10:49:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73FE7C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 618B8204D9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CcfVGJaFFMsH
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:49:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 879E62040B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594378147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=UIoKJgwiwHBXzqx7bTTScO5nMJSnsWEl2/CTLb7XXEY=;
 b=c0yaHTcYMtIsTfjEMokuVAY5njscDvANLbK25B9byCkzYZ8GA8/33FICVxmMgYwd/hTXQm
 LLxgnKpgeYUevm9obiqlnmcFN+7MJXHg+t7XhJprAzQEvDYI6aQpwvqa1o9xFeYlBpcorg
 3bJTTo9KWSD1wbHu5OpGsDLXHFm50ZA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-WxTqomn-OWSvkmZX0myVBg-1; Fri, 10 Jul 2020 06:49:05 -0400
X-MC-Unique: WxTqomn-OWSvkmZX0myVBg-1
Received: by mail-wm1-f69.google.com with SMTP id 65so6262604wmd.8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 03:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=UIoKJgwiwHBXzqx7bTTScO5nMJSnsWEl2/CTLb7XXEY=;
 b=bq1UGLZ0LxflsTsI5qQ4BN9XrJO2BM3Pv+qcQu70luKIUM9Lif/pssi17g8Q9A8SmU
 YEtqIcgpWeyeMpHsMuFI4KeAKywqEOMfT4mhPNCpnibcbnSN/pnrNVUE3P4Yl9BXF7qe
 wnHhmUMHxvdap8l0W1IHbGnmc53KA1TB1ae9WttSigeUgZ/nXMA2AwYdgk8ZZ3Y1NYnt
 WbebjQw2qvFBK3TgQ8GFmByjV56fdHXu9U6GXgDp2QHBmkZ+SZuJ2OSLhkxXUhTPY+14
 YBTSDaEvev3bLC0lbJHmRaI/Kmemw6938nWP146bue71XJvKAi8qzYBC0qXWu0VTFkGH
 hl2w==
X-Gm-Message-State: AOAM532nNUTS6VOngBLiWhpmHKl3qGEZaWCkcN7GpsWXtT50i0JgVT3S
 U556O7WMw6b9hcsw0rTYdg3gvlIr3XexYJtEtFLREGfxQ3p/o3ZsNI2YXE3C9DBZ9eX2UAQZQZT
 unB4R/4TDiBa07I/9c/+BjFwHdOXdQk2EVoC781w1MQ==
X-Received: by 2002:a7b:ce83:: with SMTP id q3mr4450498wmj.5.1594378144463;
 Fri, 10 Jul 2020 03:49:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiVqSPwoFJmCuv4VkKtHKz+ZUBx2usJsVcKLHafPXfNp1z3D30HjV2wwFh+wFmgF6XIFZOHw==
X-Received: by 2002:a7b:ce83:: with SMTP id q3mr4450472wmj.5.1594378144099;
 Fri, 10 Jul 2020 03:49:04 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 d13sm9162933wrq.89.2020.07.10.03.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:49:03 -0700 (PDT)
Date: Fri, 10 Jul 2020 06:49:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio_ring: sparse warning fixup
Message-ID: <20200710104900.406084-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
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

virtio_store_mb was built with split ring in mind so it accepts
__virtio16 arguments. Packed ring uses __le16 values, so sparse
complains.  It's just a store with some barriers so let's convert it to
a macro, we don't loose too much type safety by doing that.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/linux/virtio_ring.h | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
index 3dc70adfe5f5..b485b13fa50b 100644
--- a/include/linux/virtio_ring.h
+++ b/include/linux/virtio_ring.h
@@ -46,16 +46,15 @@ static inline void virtio_wmb(bool weak_barriers)
 		dma_wmb();
 }
 
-static inline void virtio_store_mb(bool weak_barriers,
-				   __virtio16 *p, __virtio16 v)
-{
-	if (weak_barriers) {
-		virt_store_mb(*p, v);
-	} else {
-		WRITE_ONCE(*p, v);
-		mb();
-	}
-}
+#define virtio_store_mb(weak_barriers, p, v) \
+do { \
+	if (weak_barriers) { \
+		virt_store_mb(*p, v); \
+	} else { \
+		WRITE_ONCE(*p, v); \
+		mb(); \
+	} \
+} while (0) \
 
 struct virtio_device;
 struct virtqueue;
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
