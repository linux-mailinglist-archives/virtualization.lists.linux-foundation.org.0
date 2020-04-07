Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8196F1A044A
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:17:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F1C2784FA7;
	Tue,  7 Apr 2020 01:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EjxWULnYWcbz; Tue,  7 Apr 2020 01:16:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 62BFC85754;
	Tue,  7 Apr 2020 01:16:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56721C0177;
	Tue,  7 Apr 2020 01:16:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B02B9C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ACD4785E98
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0gAbP1Hqj-_5
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2BB1F86538
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586222215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qxsCmO2anPyq8x1F5Rc9demQ45Mib3q8zcUy7zKxbTE=;
 b=KNwrJcffL3ouGRkW6MQ4XAt8vlG6++OzpV86hRsp6UxPC3aSs33JhcEK26C303qeTQ0dZF
 wMAZ2GKIzINk95rLvscJCLiL7awthKEn6Lg4C+a52NWliElgo15wCT6S/7eK/MBBVipvon
 f13R0emL1qO0QwHKJ3NuLRibmxdX1Hw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-xWYRn8N0MsK0ReXT9Fu06g-1; Mon, 06 Apr 2020 21:16:53 -0400
X-MC-Unique: xWYRn8N0MsK0ReXT9Fu06g-1
Received: by mail-wr1-f72.google.com with SMTP id n7so862905wru.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qxsCmO2anPyq8x1F5Rc9demQ45Mib3q8zcUy7zKxbTE=;
 b=C+DQXi7S29tdXp9ORI/bxFzgNpxpjCoCMRib3zipNlJ7F1JKeAiyMns/soyH+VXPNk
 DkdQvHk86BnHnWKrZFJNuSmypYsLGmXYiTUEoSkhU9r9Bu3cmsIuSCLomaxBv7oFo8us
 IaKf7IcDJ5oKlYgEYbcxW/H2FTc1nj3ABaEDOi21Zyq9YP5jjM/JD0WPTyyu3acSQD3E
 r81M6IEL1VzQ3QPUxDup3EIuVVlG8FYPD0jJBL6lV53RN8osl5KjjOxHOBq74Grd9m+P
 7Cv55GC5ZRWs1IYMIy4nxxmEfQISInalQqFobM2ajlpMgf93ZB0ExEUbRskQ8farTcP3
 /uSA==
X-Gm-Message-State: AGi0PuabbjDxjzwSxKUTW1gTcQ6YHFYhUN6QehUkKS2z2s+fvzjLbo6I
 n2YMbxxv9OffYIfYKpl89taho174izUprwwNYShWYk1AKdTqpLdxuQPxig5YtfmPILinjwIKLRK
 nklpc6249krYZWeG2PtfsmmdfYHLfyHFUnQuTFzEKLg==
X-Received: by 2002:a1c:6a1a:: with SMTP id f26mr1771503wmc.170.1586222212482; 
 Mon, 06 Apr 2020 18:16:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypJzL/iLdswTbwfPuIEyAyp8RSCkFfA1Rco4f+oCEKC/uj6ezWN8xhsuv1T7W6chCyrFxBY3wg==
X-Received: by 2002:a1c:6a1a:: with SMTP id f26mr1771496wmc.170.1586222212258; 
 Mon, 06 Apr 2020 18:16:52 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id i5sm28052282wrr.12.2020.04.06.18.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:16:51 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:16:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 11/19] virtio: add legacy init/size APIs
Message-ID: <20200407011612.478226-12-mst@redhat.com>
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

vring_init/vring_size (in the uapi directory) are kept
around to solely avoid breaking old userspace builds.
It's not actually part of the UAPI - it was kept in the UAPI
header by mistake, and using it in kernel isn't necessary
and prevents us from making changes safely.
In particular, the APIs actually assume the legacy layout.

Add an internal kernel-only vring_legacy_init/vring_legacy_size.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/linux/virtio_ring.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
index c3f9ca054250..766d70bca492 100644
--- a/include/linux/virtio_ring.h
+++ b/include/linux/virtio_ring.h
@@ -140,4 +140,22 @@ void vring_del_virtqueue(struct virtqueue *vq);
 void vring_transport_features(struct virtio_device *vdev);
 
 irqreturn_t vring_interrupt(int irq, void *_vq);
+
+static inline void vring_legacy_init(struct vring *vr, unsigned int num, void *p,
+				     unsigned long align)
+{
+	vr->num = num;
+	vr->desc = p;
+	vr->avail = (struct vring_avail *)((char *)p + num * sizeof(struct vring_desc));
+	vr->used = (void *)(((uintptr_t)&vr->avail->ring[num] + sizeof(__virtio16)
+		+ align-1) & ~(align - 1));
+}
+
+static inline unsigned vring_legacy_size(unsigned int num, unsigned long align)
+{
+	return ((sizeof(struct vring_desc) * num + sizeof(__virtio16) * (3 + num)
+		 + align - 1) & ~(align - 1))
+		+ sizeof(__virtio16) * 3 + sizeof(struct vring_used_elem) * num;
+}
+
 #endif /* _LINUX_VIRTIO_RING_H */
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
