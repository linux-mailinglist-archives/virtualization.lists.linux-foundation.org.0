Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2B11F5364
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 13:36:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 04102880A4;
	Wed, 10 Jun 2020 11:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7pHU7gSv8HM; Wed, 10 Jun 2020 11:36:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 86E4E88093;
	Wed, 10 Jun 2020 11:36:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77A07C088C;
	Wed, 10 Jun 2020 11:36:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C996C088C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0873A25D1F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZ0LAvQg2frI
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 27B1725D5D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591788974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+SD3Vrt7U6HArLpzqOyIxuZrc1fS29Ei8HX5xaDKKOw=;
 b=XR1X0qwmqNbKqPwY25Jrq/T/gCXJBJtu8LeAEFSbEcKQdDbKDXoMejKUTIdLNJxYYwckwA
 5wrkiDrvlxpcgqO22fmEkRYCll1SwRXYTy8qjk3mhacVkc9FrxltBz3UZ6ZAC5c0bCiupY
 dVvHc7wuv0Uq20VoALRGrKIuX0iVr3U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-VIrHh_0BNVyfhc7W0j5ihw-1; Wed, 10 Jun 2020 07:36:12 -0400
X-MC-Unique: VIrHh_0BNVyfhc7W0j5ihw-1
Received: by mail-wm1-f70.google.com with SMTP id p24so332788wma.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+SD3Vrt7U6HArLpzqOyIxuZrc1fS29Ei8HX5xaDKKOw=;
 b=t44UC0utPA65Y146AFuNhCY/CwTvW2/G+ALFxnmXL4lXx7lLK5zkbZHQ7+FOR7jZSj
 j8xnktq58gktkgwm6KCq3qA8sCLcJUx8OMYpN+Dz1aXJgwg8CppC+bdHnzccWYha3NMH
 bGAJE6Ouk1+8pBKXUlEhzqS2G4yc7jQK/IG6e6UYRRXlIHRvXxd9TKZMOVVx/aYrPt55
 OP1SzT3j+Ocakj5kUF3xrjvADeoCOcUF8WENhTK6D1MN4fNFMe8W7im3hxX7pMDKzmyt
 JJBx7X1dAjhGYVlish/1go8vlNhJs0n2jLujzfFnMAZ1N3q4aqqmrfVROoB23vmW3UhL
 6nHA==
X-Gm-Message-State: AOAM531aGAZFksnlfyZtRUTMjRKcozIO9wLJAkrMAD6sbjfjWIw+HRK6
 aAj4aK5jV8uetkIo4SiFiDflUDiee4QvdDAUbSKl+srR8j2+6PHRTnT7QhTMUP0s0G8OmuSxPjl
 sPSaqfQSdSBFOYId9rQ3oiL6t8teHdpWR1iGp/QTDZA==
X-Received: by 2002:a1c:22d7:: with SMTP id i206mr2755084wmi.186.1591788970804; 
 Wed, 10 Jun 2020 04:36:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxemEaCHMgCrHg7/oKSQ4yFnNXg1fLjZ5OHmMHvyeRIUoWRpQOB/0A8RO0HmZnjlr0fN5RKtA==
X-Received: by 2002:a1c:22d7:: with SMTP id i206mr2755070wmi.186.1591788970615; 
 Wed, 10 Jun 2020 04:36:10 -0700 (PDT)
Received: from redhat.com ([212.92.121.57])
 by smtp.gmail.com with ESMTPSA id a1sm6866225wmd.28.2020.06.10.04.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 04:36:10 -0700 (PDT)
Date: Wed, 10 Jun 2020 07:36:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v7 05/14] vhost: reorder functions
Message-ID: <20200610113515.1497099-6-mst@redhat.com>
References: <20200610113515.1497099-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200610113515.1497099-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
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
index 28f324fd77df..506208b63126 100644
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
