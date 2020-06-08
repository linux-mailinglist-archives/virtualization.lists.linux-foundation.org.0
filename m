Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB071F192E
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 14:53:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DCFFF86053;
	Mon,  8 Jun 2020 12:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nX9mQ_KMGCuI; Mon,  8 Jun 2020 12:53:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8D75685FE6;
	Mon,  8 Jun 2020 12:53:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 661ADC016F;
	Mon,  8 Jun 2020 12:53:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD9ADC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9A38B88094
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4sepigcVrazT
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 721C088084
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591620788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YC9C1bg85UqEARLoLzVVH0wVxPzUMhgdZVeMnCOVW8I=;
 b=fV47kVqkLRCtXkaRCVNM1x91/Kr0QqPv+kfnHCyAl1gqS+ABxJdXp2QjS/nqV60ow5iCoM
 dzqTAMn+G6n/hQwlJF+XARmt2s7qhRPRBeFmhQMqjp8GMjKurWj9HznU+UxHs4FMebUwbU
 omALymTesSekIwqjUk4s2qQ9gFivNxU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-EhvXD554MK2Hoo5BlWD1XQ-1; Mon, 08 Jun 2020 08:53:03 -0400
X-MC-Unique: EhvXD554MK2Hoo5BlWD1XQ-1
Received: by mail-wm1-f72.google.com with SMTP id t145so5220152wmt.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 05:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YC9C1bg85UqEARLoLzVVH0wVxPzUMhgdZVeMnCOVW8I=;
 b=beVax+JwFKvTbxGRlTjgyb2miKDa0/Sw1bzs6H4qIXeUOvh7DjZqn7i3K688w4IvF/
 Y51uD7pS8FXMqxL1vwsYzyGrN4/3SQIXY6ySi0N5weHG+VEIp8fgpzhzv5w+5GgtDTDM
 yGz4PklH/vzOe4l6j3npYxBt68EwVoSCFomy9X8liIt5w87xdeGgtRRb4gGZeLocwyR6
 1zgRqRsZce9HwHEIXrV3toIFZfWgi5BijLsiG+XM76QMX6LH0njGBCqW/8QSZ9BZzibQ
 gjjlJhpWljp5UJu9UmSXLVHoo/s7SlVhQBuTviVKom/fQ8pud2Ca05iJqk63eY9GIylb
 k0Fw==
X-Gm-Message-State: AOAM533d9Nslu5wERNuKHZz9VHCt1gbZbKDjjeG8OiJVisfedr8k3Il+
 0ugdQ9OpyiTuyJ1pHsEVXCdFqBuRn3BxmrqIBMqQ92EVk1sbHlyYhzXVPfRWKCR0QgnTsUCF3Eg
 q37qGeRXDAfcLPCYfBwNsNAplobKp5SiBpt2RlB8LMQ==
X-Received: by 2002:a1c:59c7:: with SMTP id n190mr15634970wmb.61.1591620782175; 
 Mon, 08 Jun 2020 05:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycvWcSZ9pgrB8OOPKZQyruJy8vStQkFo1WrrMhroFInHbRmdrcF8cq2oRf/qnvmhPPXJjLnQ==
X-Received: by 2002:a1c:59c7:: with SMTP id n190mr15634952wmb.61.1591620781966; 
 Mon, 08 Jun 2020 05:53:01 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 r12sm23319300wrc.22.2020.06.08.05.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 05:53:01 -0700 (PDT)
Date: Mon, 8 Jun 2020 08:53:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v6 04/11] vhost: reorder functions
Message-ID: <20200608125238.728563-5-mst@redhat.com>
References: <20200608125238.728563-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200608125238.728563-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, eperezma@redhat.com, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Reorder functions in the file to not rely on forward
declarations, in preparation to making them static
down the road.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vhost.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 41d6b132c234..334529ebecab 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2429,19 +2429,6 @@ void vhost_discard_vq_desc(struct vhost_virtqueue *vq, int n)
 }
 EXPORT_SYMBOL_GPL(vhost_discard_vq_desc);
 
-/* After we've used one of their buffers, we tell them about it.  We'll then
- * want to notify the guest, using eventfd. */
-int vhost_add_used(struct vhost_virtqueue *vq, unsigned int head, int len)
-{
-	struct vring_used_elem heads = {
-		cpu_to_vhost32(vq, head),
-		cpu_to_vhost32(vq, len)
-	};
-
-	return vhost_add_used_n(vq, &heads, 1);
-}
-EXPORT_SYMBOL_GPL(vhost_add_used);
-
 static int __vhost_add_used_n(struct vhost_virtqueue *vq,
 			    struct vring_used_elem *heads,
 			    unsigned count)
@@ -2511,6 +2498,19 @@ int vhost_add_used_n(struct vhost_virtqueue *vq, struct vring_used_elem *heads,
 }
 EXPORT_SYMBOL_GPL(vhost_add_used_n);
 
+/* After we've used one of their buffers, we tell them about it.  We'll then
+ * want to notify the guest, using eventfd. */
+int vhost_add_used(struct vhost_virtqueue *vq, unsigned int head, int len)
+{
+	struct vring_used_elem heads = {
+		cpu_to_vhost32(vq, head),
+		cpu_to_vhost32(vq, len)
+	};
+
+	return vhost_add_used_n(vq, &heads, 1);
+}
+EXPORT_SYMBOL_GPL(vhost_add_used);
+
 static bool vhost_notify(struct vhost_dev *dev, struct vhost_virtqueue *vq)
 {
 	__u16 old, new;
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
