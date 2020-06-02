Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA821EBC63
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 15:06:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4DA3786155;
	Tue,  2 Jun 2020 13:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3eM2LzZo2fzB; Tue,  2 Jun 2020 13:06:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 484AE86101;
	Tue,  2 Jun 2020 13:06:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AE40C0178;
	Tue,  2 Jun 2020 13:06:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A74AAC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 93E942014A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id urJrfHdgBK0a
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 849D6203FE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591103174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Doki9eOY+Vt0bEelnsffrGLeK+qhziALFfS1p6mljA=;
 b=HGb8xCngIiZe/j2BliUuxEjIqDNo4lUe3nBLSmz+sh45Ww7GtTj8Lnm5nh6f4KlkYRLdI9
 99o0ydvdkNNU8ZPxvQv2xbmJQAxLOSKsNjlxqflgoFpCXOtUZYXwtyWqfS0npw9IPQUrPO
 TwIa5l4zlncovlf3wGWZXrVrjash8Os=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-f3xnYAbCOgm2hzDl_F5y5w-1; Tue, 02 Jun 2020 09:06:12 -0400
X-MC-Unique: f3xnYAbCOgm2hzDl_F5y5w-1
Received: by mail-wm1-f72.google.com with SMTP id h6so812360wmb.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 02 Jun 2020 06:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6Doki9eOY+Vt0bEelnsffrGLeK+qhziALFfS1p6mljA=;
 b=XCBMjvobjlqAhFIHnIntZygGjdDeVOPb9i7w5cjZg+/VdTNIAzEw+iwwBxgrzBXQrd
 64m2GOdsD84a+H+ZmCpCuAw7KIySoqHC+Aj1XEKJt9oLsLa5WtcikwvhDNFNpo0rjZ+9
 lWTe0fIDYDzDQKwtMivHDZDPyV/AKTxCjdbh1L4D3t7+zJN8bsSssltciBByHr+CjjmA
 l8zh2gevLLxVG17OxW1Zk1Izm1t2y0sjbDaFxk0pOar920oiOkRqGPqSRbV0CopLjg9j
 aEgK+ozNXP9dRMcRAjD9ur+/ESagrmoa67NW5MNoWRB//gCHG43Rho9hYjA+kWCol3Jr
 zuAQ==
X-Gm-Message-State: AOAM5316EKVAdzdmU35KyhH8WIO9L1YM5kN1CwpQwogSutRLlSN6QdA3
 cLzyRWF1qguXjS8ufYZjXaSLaRFx6GfgtHLW6kTqDQgoGtLqlkgn2c51wZG/98EEszdbdWFuUZC
 tHQxBvWzoWjNmmkwmhymA5nb7hY82MH4JEvT+w1K+cA==
X-Received: by 2002:adf:d852:: with SMTP id k18mr11135190wrl.177.1591103170689; 
 Tue, 02 Jun 2020 06:06:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze7fjrtd3HAxuSDspGJm8TtOVdc3+cTfx7SISy8qbvd/4VQ9hQeFCUsVzEXG1sYbQZL/2f6g==
X-Received: by 2002:adf:d852:: with SMTP id k18mr11135174wrl.177.1591103170498; 
 Tue, 02 Jun 2020 06:06:10 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 k14sm3631200wrq.97.2020.06.02.06.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 06:06:10 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:06:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 06/13] vhost: reorder functions
Message-ID: <20200602130543.578420-7-mst@redhat.com>
References: <20200602130543.578420-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200602130543.578420-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, netdev@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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
 drivers/vhost/vhost.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index bd52b44b0d23..b4a6e44d56a8 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2256,6 +2256,13 @@ static int fetch_buf(struct vhost_virtqueue *vq)
 	return 1;
 }
 
+/* Reverse the effect of vhost_get_vq_desc. Useful for error handling. */
+void vhost_discard_vq_desc(struct vhost_virtqueue *vq, int n)
+{
+	vq->last_avail_idx -= n;
+}
+EXPORT_SYMBOL_GPL(vhost_discard_vq_desc);
+
 /* This function returns a value > 0 if a descriptor was found, or 0 if none were found.
  * A negative code is returned on error. */
 static int fetch_descs(struct vhost_virtqueue *vq)
@@ -2370,26 +2377,6 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
 }
 EXPORT_SYMBOL_GPL(vhost_get_vq_desc);
 
-/* Reverse the effect of vhost_get_vq_desc. Useful for error handling. */
-void vhost_discard_vq_desc(struct vhost_virtqueue *vq, int n)
-{
-	vq->last_avail_idx -= n;
-}
-EXPORT_SYMBOL_GPL(vhost_discard_vq_desc);
-
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
@@ -2459,6 +2446,19 @@ int vhost_add_used_n(struct vhost_virtqueue *vq, struct vring_used_elem *heads,
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
