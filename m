Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A344C1A003E
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:35:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 522CB882A1;
	Mon,  6 Apr 2020 21:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPoRP6uPkvgs; Mon,  6 Apr 2020 21:35:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 30B9B8829B;
	Mon,  6 Apr 2020 21:35:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B1EBC0177;
	Mon,  6 Apr 2020 21:35:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C84BC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6C40E87CBE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1URuMJes9FST
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2535687CAB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qxsCmO2anPyq8x1F5Rc9demQ45Mib3q8zcUy7zKxbTE=;
 b=NwgMhIdG9ImYGdtXoAV6ju//fah8e6+NizXat/6pWbuRNF+efA/puEwPopF07vhVTl7TIw
 exIGUlZw3aKMvcoEcybhiExeNCUVmHt32e4pk66falg/Wkqjr6O+IRd9s6ng0QIkDnd1tc
 wC0qMoYJEaS4TQILVDd8yTnQzNarqrY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44--Mh5dp_IP7eaJZ48emILlA-1; Mon, 06 Apr 2020 17:35:10 -0400
X-MC-Unique: -Mh5dp_IP7eaJZ48emILlA-1
Received: by mail-wr1-f71.google.com with SMTP id 91so588287wro.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qxsCmO2anPyq8x1F5Rc9demQ45Mib3q8zcUy7zKxbTE=;
 b=UxrgluHKJIOwsTKqmI7wrTyZDP3222J7MZsHAhCfOVJ9dsBlWXA/n2+DwEOwYljxWF
 DxUOAlekkK1RgazeMjzBosAEaDldEKlUmIsIUCaqQqEFLrhkeRTw19bNpP2oUv5m/h5v
 umwVfDNPFTU2zPFHTHwAq3Tta6OSa+iftY8lu0TL9h1uQ1NlEkjr9E1jhviyk1lIKFfK
 kPRtFZK1yoQL6udZ65ptqjEqQchzY6Za9wFlvCrT9/uVlEwg8Cy7WcbDfxCBtprH+42L
 87HbsV2YojgOk0XUOeeBvTMqBFXGc7GcK3oCpyM3ONQIIfzI4dPXoFt8yEuHcjtcCJcF
 0XSQ==
X-Gm-Message-State: AGi0PuaJfyk/RMpOKpsoV/xIHewBmK3FL7lGMK9Ahyf4b2ZmFqKpwnhh
 A3p1hd8w3sjK0ZaDqoctUPPyqkNiIu5lD2wgdIDNYrFV5O/LS/LFfSsdlfZoMo3D+bRiFPlKUic
 TW1Aj0KMLw5s8t1K4yZ+BnF/1TAgobI5w7t0T8Reudw==
X-Received: by 2002:a7b:c2a1:: with SMTP id c1mr1029194wmk.138.1586208909561; 
 Mon, 06 Apr 2020 14:35:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypI9b+LX+l4YiYBZj2i6VJ5KIEQ3hmFVk2kz6aT/tabWoxNGudtjGpT+UQ2sfcrxQWp7m/ymbQ==
X-Received: by 2002:a7b:c2a1:: with SMTP id c1mr1029181wmk.138.1586208909389; 
 Mon, 06 Apr 2020 14:35:09 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id g2sm27474875wrs.42.2020.04.06.14.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:35:08 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:35:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/12] virtio: add legacy init/size APIs
Message-ID: <20200406213314.248038-8-mst@redhat.com>
References: <20200406213314.248038-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406213314.248038-1-mst@redhat.com>
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
