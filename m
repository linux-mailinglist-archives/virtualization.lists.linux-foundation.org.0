Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 450B519FFC7
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:02:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6061322829;
	Mon,  6 Apr 2020 21:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YlwVJhyJ15Z0; Mon,  6 Apr 2020 21:02:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 86BA22079A;
	Mon,  6 Apr 2020 21:02:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F106C0177;
	Mon,  6 Apr 2020 21:02:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF2E9C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C4B6F86472
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TvjZOMbEBhn1
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9F83C8639F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586206931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qxsCmO2anPyq8x1F5Rc9demQ45Mib3q8zcUy7zKxbTE=;
 b=YE8P2pG8sy5+DUjovSuJG4j73Na/skBG/5PjAqufEdCiLnXWhiZzwQLcXW+ZGsMB9WGYUZ
 +heP7oZEOpNE6V7LZrEQBwnz3aAfnmDHof+8nd/UvtEXduybMEt/NUn4TQCuJPr6cz2/Xt
 5hzg0phvaCk0V2EI3ns4XVAWNOGqxvA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-2tz2Q7PCOCyWxoGkDnq-jA-1; Mon, 06 Apr 2020 17:02:09 -0400
X-MC-Unique: 2tz2Q7PCOCyWxoGkDnq-jA-1
Received: by mail-wr1-f70.google.com with SMTP id j12so516386wrr.18
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qxsCmO2anPyq8x1F5Rc9demQ45Mib3q8zcUy7zKxbTE=;
 b=PodM5jK1+9MGiasrXLhu+xXQdIush5YDp/qYxMiY96TeAYXFpJeVZ0kqGid1AHN1xp
 LRlhbW9skZKg15H0cJOxggPfHg+MVvSihSlRela51QYySoWhOrGTxbrBR6+54C7vZDKS
 jcmIn/5W/6UWGzdU3ZtL+vWfa/1zhfm4LhYd4syyDAuNHW0oU+S3HRCnX7VaQlXdRxSI
 g7QJqm0WJ4o7wecWVg62uCNVGIBhVqF4LZb8JT+/81R2rwg9qz88TOySgTBSbxkCJq7+
 13IVk5vNAXgv6xAgXEQAtyovZEg6WvvYDj7FyA5EoblHi/gHHXSJaN3AP8ZQUhXBCWwX
 Stfw==
X-Gm-Message-State: AGi0PuYWNscJoTnWHJpXLJ+fIoj3aD5JMHWXu2z6ZOcMKby8hldrSioM
 ETWddxydz0HaVJufaK1vkU/Fo4ZRsWZp9qbEI+GV4w/sHeqr/BJphUVlqPYV5P/Au6smqT6MaIA
 fJZ6yNSdADfUUJyaBrJ2utS1uwsf/CRLXzJe4A3Siow==
X-Received: by 2002:a05:600c:2a52:: with SMTP id
 x18mr900891wme.37.1586206928356; 
 Mon, 06 Apr 2020 14:02:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypLkdRWogVpuwz60S1SSNfj/qpunsYK8n1kb8iM3ayAfqYVbsZEQukr2xmQqXDfS9yzMWdEoSQ==
X-Received: by 2002:a05:600c:2a52:: with SMTP id
 x18mr900874wme.37.1586206928040; 
 Mon, 06 Apr 2020 14:02:08 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id 106sm17819538wrc.46.2020.04.06.14.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:02:07 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:02:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/12] virtio: add legacy init/size APIs
Message-ID: <20200406210108.148131-8-mst@redhat.com>
References: <20200406210108.148131-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406210108.148131-1-mst@redhat.com>
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
