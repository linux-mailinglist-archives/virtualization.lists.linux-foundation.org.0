Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F204A1F66BE
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 13:34:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A0373895F2;
	Thu, 11 Jun 2020 11:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRKPdJ54+Pfo; Thu, 11 Jun 2020 11:34:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2E438895F3;
	Thu, 11 Jun 2020 11:34:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C0C1C016F;
	Thu, 11 Jun 2020 11:34:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FE60C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5F94626698
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Q70EzdJx4cS
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 88B3426679
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591875269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQeTVzMxKn8MhUVbsXHw7bWDPyusaDacrq6kngKNb/s=;
 b=XJunigVuXa/i4mFv2/FFcdSiZks5Eay0H5u35L86/z1minsuOiP9MMVW+4S1cSivHUUxpi
 SAk3lniDKqdMgnhosI15cNCGDIwoFN5p9Np45i+om8EuIEe+8MeE61u+wqGMUFiH2F0Ksq
 jx+Ht5O7JX0Wc4Mh41hendHErGYJQEE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-M9R4XeC-MYu1Vy_4p_3XEg-1; Thu, 11 Jun 2020 07:34:27 -0400
X-MC-Unique: M9R4XeC-MYu1Vy_4p_3XEg-1
Received: by mail-wr1-f72.google.com with SMTP id m14so2448884wrj.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 04:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GQeTVzMxKn8MhUVbsXHw7bWDPyusaDacrq6kngKNb/s=;
 b=sDMhuGFdFLcdz3lwRzpnoEztrlQDwQxC7ZInLFpsT6SlGP1zbfSTpZM+J7uVzV+SWJ
 po4r1OPPbEwuFWWoP9kFReDCLdLMYLlBkpxWeKEzegH2wi7FxkX7tbSGBMnl98RSEY11
 tTo1MQEzeczVvrqM6rCl/gZF0wYf9+IQEyRwmWlOxgpn3xmm4mATSKHC6ABRtTcx99m1
 lsPfv2dEYG4rkOUoUogdO7ttKEf+eQTX6LYlewBKUNzt+O7+J00LfZeMrF7u3J2ajd+F
 uxACvIcpB1Pg7dh+0SGmNY6XsFIKk25UyMq1s163kCc35pgjMJxqdK++qn2fsxov/DhB
 OgLg==
X-Gm-Message-State: AOAM532cZNwGQiJjbIXLnmInnNAwKhfqc1+e8Q7DRKg+sz69WNKcYisX
 tqQ+Px25pG1140lkwmf7VyIAmVW9CFMQz8jLkK2wgG2g0DBUzgesYqsd7Ryu2EPaveIL4gA1w0v
 +BfPuNEB8o3id69bF9gbuS87eeflHASKQZfJ/iWHN+A==
X-Received: by 2002:adf:f450:: with SMTP id f16mr9149830wrp.307.1591875266441; 
 Thu, 11 Jun 2020 04:34:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxu4RmLScea2SydO/nk/Zqnhh0evcgLZ860ln0HWt26ptj8Of6uBtznoHEKq49OIRHfJG06rw==
X-Received: by 2002:adf:f450:: with SMTP id f16mr9149807wrp.307.1591875266209; 
 Thu, 11 Jun 2020 04:34:26 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id w3sm4155571wmg.44.2020.06.11.04.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 04:34:25 -0700 (PDT)
Date: Thu, 11 Jun 2020 07:34:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v8 04/11] vhost: reorder functions
Message-ID: <20200611113404.17810-5-mst@redhat.com>
References: <20200611113404.17810-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200611113404.17810-1-mst@redhat.com>
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
index dfcdb36d4227..c38605b01080 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2425,19 +2425,6 @@ void vhost_discard_vq_desc(struct vhost_virtqueue *vq, int n)
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
@@ -2507,6 +2494,19 @@ int vhost_add_used_n(struct vhost_virtqueue *vq, struct vring_used_elem *heads,
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
