Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8851A03FD
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:08:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4B0D623077;
	Tue,  7 Apr 2020 01:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AvKLo9xG4xKl; Tue,  7 Apr 2020 01:07:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CCB8B20534;
	Tue,  7 Apr 2020 01:07:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBB3AC0177;
	Tue,  7 Apr 2020 01:07:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B721FC089E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A41BD8851B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FL9QfUAXpom3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CC8B7884B2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586221674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qxsCmO2anPyq8x1F5Rc9demQ45Mib3q8zcUy7zKxbTE=;
 b=cP5DBAUfDxJsQEhZLnsCuqEkLoF87FCJMsTj9ZnNe69SAmXv1+GFY03QecXxnrCJj0nEHu
 kdxbnI8gRAsQNJ7O7jD8jPsqWJBRLuLm0M5zBbaWlfAlfRq8TfDxjDljT7qddHY+FrkxZ4
 L/Y342d8GJECdkRvBIjVhxX2r85FisU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-52eGojLRO8qF4O35B0OXHg-1; Mon, 06 Apr 2020 21:07:53 -0400
X-MC-Unique: 52eGojLRO8qF4O35B0OXHg-1
Received: by mail-wr1-f71.google.com with SMTP id t13so866107wru.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qxsCmO2anPyq8x1F5Rc9demQ45Mib3q8zcUy7zKxbTE=;
 b=Z52+wra6mL93+2iPxPQCUYEQJp4DAWUxS4QMtXf7w9HYjbPGdq2J5TuDt3yRO5C5of
 I9xU2nLXS0LaLyeb2q8CejZf2HCHk9/0xN0exu6k5auluTIP+aS0bwILliRUBV4g4f+6
 uJL8b0xHncdBteRQqGrWusU8GiJjZ0wMDOvfADy7RoGUW4x5dzMZWkJpRiWvKCPV2b+q
 Qu15tsf9XRnHp9Vnd7uwT36ddbaAa0OYeKTRUCXz5DQqtckXkaU2DC60XEiMO/1mIYiD
 enxDxOjST5qUZ3I1WjzGmtKOcePpBBl4WtOEID7i3Pd4ervgI62Gc0hMceghBRgcCIje
 ePEA==
X-Gm-Message-State: AGi0PuZJmzQtmmNg/xQZ/WhfL/QWotFcMQnJlUWmkCJMjU7M5ynmtxNv
 XdXAYd4TTfT7k2EGd6CtHJPcWgmn7KTx/Mp0XLEbCNiAofxFB/Y9ENs+72eXlGo7bLKbVybqDQQ
 gdPv1NGGk2Z2IymgKr3jAsgCMp4RmWEdQAPgmPVec2A==
X-Received: by 2002:a1c:4409:: with SMTP id r9mr2094022wma.165.1586221671780; 
 Mon, 06 Apr 2020 18:07:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypKN9CYrbHE2jjD2afGiujtBXVlhpdUl35y5TmBdV4Epk5CAHj0sa2E4dFkJIJ5/QNzH6ShPow==
X-Received: by 2002:a1c:4409:: with SMTP id r9mr2094010wma.165.1586221671557; 
 Mon, 06 Apr 2020 18:07:51 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id a145sm97034wmd.20.2020.04.06.18.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:07:51 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:07:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 11/19] virtio: add legacy init/size APIs
Message-ID: <20200407010700.446571-12-mst@redhat.com>
References: <20200407010700.446571-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407010700.446571-1-mst@redhat.com>
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
