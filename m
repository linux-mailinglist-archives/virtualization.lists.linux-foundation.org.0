Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 152371A010F
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 00:26:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B6DC9884D3;
	Mon,  6 Apr 2020 22:26:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhnG8sYOdWVR; Mon,  6 Apr 2020 22:26:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3D76C884DB;
	Mon,  6 Apr 2020 22:26:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 372C4C1D89;
	Mon,  6 Apr 2020 22:26:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39257C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 282B7867ED
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dK3ycHeXKD_g
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E7441867A5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586212006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qxsCmO2anPyq8x1F5Rc9demQ45Mib3q8zcUy7zKxbTE=;
 b=f3cvAl9A282CGknz5yrPycs2q/Qj2WfVhs+WSl5vIMeh6tOCLZt1zGysuHZ4bZRPCdu45g
 TmQaquNaY1E6sQ8rVb2Zur0jubd52Nip9SLqGu2lQpVmBpj+xxwPC1zk4qqWBxDv6NXobD
 pUHUZPVV2vcN7ROTK3iURX3KPZbGE9g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-m-M9YpNkPBud4DwkEZ0IEA-1; Mon, 06 Apr 2020 18:26:45 -0400
X-MC-Unique: m-M9YpNkPBud4DwkEZ0IEA-1
Received: by mail-wm1-f71.google.com with SMTP id f9so466150wme.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 15:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qxsCmO2anPyq8x1F5Rc9demQ45Mib3q8zcUy7zKxbTE=;
 b=CnSTEFe5HbgoYPF5Ik33yLcrSYIeExrO7VvzZiLeS9GHL3A5p7pWu1rAmDEBxf7Syk
 vNitZpHyukxzLp7LJ9GeVuIGBRXarYiITkbA52lDGhjHwGz5oWuSPO8hRyl1/jJ85It5
 RUKF7Xa+t4BQzRx73zoE+rd1RUzg6vzFsdl/ASkZzV2mqbmBwPFnBBNQtk50yABecgog
 6mQ1skOORnVBoJWDf7e6PyWoOztYcO7dLEd503xpPvNr4wYrJUYtWLFSZkOIeIUt353T
 JIFGoJMgPKbotL7JVTZLCYxRqw5QmUCAVZWI9bhAyBlcky1Arl8k3JcF/9rDReswuQhw
 1xRA==
X-Gm-Message-State: AGi0PubR1e6ZNhAAmsrWKYy43EoKa4+gn5uC4f+kltxe6txhl26Yg58z
 PPebbt6lJGLvT3Pi8dYm00lmqrVgwd710V+mHJb5Rxlbj/aFRVqMYyFFwmjQYXRXrW4ZW2r+8Yf
 qHii0e5rhCki7ycx4KFjE/5BrgNCkkFg1tMwWYM/98g==
X-Received: by 2002:a1c:23d6:: with SMTP id j205mr1232804wmj.22.1586212004354; 
 Mon, 06 Apr 2020 15:26:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypKQ/45f7zuFQT9DjcuwOy3vnB/1khCwWFcukcPvRmpb8ILrNbQyCkNjC9BaPVmYB4AatJDrmw==
X-Received: by 2002:a1c:23d6:: with SMTP id j205mr1232793wmj.22.1586212004174; 
 Mon, 06 Apr 2020 15:26:44 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id d6sm28346200wrw.10.2020.04.06.15.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 15:26:43 -0700 (PDT)
Date: Mon, 6 Apr 2020 18:26:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 07/12] virtio: add legacy init/size APIs
Message-ID: <20200406222507.281867-8-mst@redhat.com>
References: <20200406222507.281867-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406222507.281867-1-mst@redhat.com>
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
