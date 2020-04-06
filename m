Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4721A0035
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:34:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B62F888294;
	Mon,  6 Apr 2020 21:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrHrmEuiVagI; Mon,  6 Apr 2020 21:34:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 07297882B5;
	Mon,  6 Apr 2020 21:34:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2EA6C1D7F;
	Mon,  6 Apr 2020 21:34:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B890C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6865C87A74
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l3drVphZbAiY
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8E90587CB4
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qxsCmO2anPyq8x1F5Rc9demQ45Mib3q8zcUy7zKxbTE=;
 b=a+L0KOVSfqZJgoePiwLiea2vHrslAV83aYWABG/+he+pWFbHOiRsERZptR5Xm1vNxtynHT
 /2ibXBv5uLcCmwgdMNttCOICqBR1TYGFGOEPu/QZnabxwTkCQ6pimUxmpsCZhDoi+qNjh7
 T17lsC+lP1CXPMtX7Yl966uHeH9ofy8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-mztuQSE6MyCSoiVjDPKL6g-1; Mon, 06 Apr 2020 17:34:42 -0400
X-MC-Unique: mztuQSE6MyCSoiVjDPKL6g-1
Received: by mail-wr1-f72.google.com with SMTP id 88so588580wrq.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qxsCmO2anPyq8x1F5Rc9demQ45Mib3q8zcUy7zKxbTE=;
 b=gjMrF2cjrewUwVlTjXF6GMlfTjN331tr+TYmMEy/f7mNJmjKIswwymDp+b6qTNyfRM
 BriYWCV7g9y9V5r48TwMsy2PtNlBysC514RywYJVWBYrUlByuMpVI0oRioiFUAeOQVjC
 Yuar05LKZMzfPBTTW5qzyo6b1/mHE7TTVBlYosgEBvYscJorBREf78NwApXaQXqprL3m
 JW0qdGiyvpLW+M/LAROFdcmU4Hl8LHQVUPkz7A6KNpOEUnyILvftg9RlnIJ5AnrinIRx
 99ceWffvbKbiQGAfK59o+BUL8orgBCHri18lYFI7M5oFYWzLhezk7DdBIxDjyxqvaI/W
 pEkw==
X-Gm-Message-State: AGi0PubrjVw2Mv9KEj534rzbI599uLwTFvHzkT9Ju1D87Xhx0mTJiCwE
 u0YhUXGucgY5NKjaL26MjYzk9phEsZI+fwBJHAM97jaKVhnBXJqrOl0S7jtQukQu3NakBsJWrIC
 pDAurB22UyJQNTg/BEIF8RojHxsLB8ORDMNgp4plpQw==
X-Received: by 2002:adf:82c5:: with SMTP id 63mr1278578wrc.312.1586208881557; 
 Mon, 06 Apr 2020 14:34:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypJvQJhmwP93/iT6ip06xiPQv/iv6F3OoIKQOfqi1rQxvSh+ASmH0VZ0wEEhAJBcaQLMzXMjvw==
X-Received: by 2002:adf:82c5:: with SMTP id 63mr1278564wrc.312.1586208881342; 
 Mon, 06 Apr 2020 14:34:41 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id f16sm992424wmc.37.2020.04.06.14.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:34:40 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:34:39 -0400
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
