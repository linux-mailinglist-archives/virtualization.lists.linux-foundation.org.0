Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDAD19FFC3
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:02:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EAD2086469;
	Mon,  6 Apr 2020 21:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2xb2XCv8gvz4; Mon,  6 Apr 2020 21:02:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 85BA286407;
	Mon,  6 Apr 2020 21:02:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61E0EC0177;
	Mon,  6 Apr 2020 21:02:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3819C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D956F2039E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 367IYRjQeB4l
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 9964720018
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586206927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qWI++drUheRLgJRLP25chFJvpGmbc+MWUzzhPso8aKg=;
 b=ijQCpYRLff04Kz4gzKbwhtd1SDAHUUFQPTFDlVnC3+sqAB5JdXb8lP7KVz1cxYr4uhrCms
 Y6tj3ezjAvivhLJf6PHSRcxb+d2m2PrwHAfG7NtAib0uXnIPV6HDjleFCznBPob4zlvn/8
 cXZB6eitnbAOTmQrmorpto9yYiwX6e0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-R14ZbuRLNqWYnPAcCVD-_Q-1; Mon, 06 Apr 2020 17:02:02 -0400
X-MC-Unique: R14ZbuRLNqWYnPAcCVD-_Q-1
Received: by mail-wm1-f70.google.com with SMTP id v8so21338wml.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qWI++drUheRLgJRLP25chFJvpGmbc+MWUzzhPso8aKg=;
 b=s9wpcJu0+aq34dewum+My3ju1noamYJAkCzy2+b2I3ppznN/5xL/EjLJTDv/tWAztw
 AEX8i2mR7X43tsHA/rvWLYtU0jWzJnWzjXfDXj8jzvp8ZUsr0PdtxnCpRGflKMPXd728
 6GOJ9nT1IgcRVsCV/jqTcZwlX8tHWxY/hMsjjAhd6bCc5BBSLXlbCSbfj2lDsb2YVxvG
 L+YVyKnrT8kDTj28cE9Lf1DOxcx6Wwc/jdSMl0N5KPoHoCPme1Wusg9hfDONK3OkQN5z
 fLeMDmKMwSSJdC56iH0z6kZJi2gAcH4SsTlH8uKCysDNBbTINdIQwIe0TkNuo/Ib12L4
 zllA==
X-Gm-Message-State: AGi0PuYUajfSuXtD4V2JftxWz1gvrNZpaK1+zqGdqZP+3VQ0SqXk9uWp
 +7AaNoTFLjuWiTCecif4VcmwCX7rw6ctGUTOdKBR0HR6otK5MV1Dc+gI0nhWuxHTW3wXKkLc3Y2
 I8Zx316rfiQUyZUuR4tR9IMk/+o1PDPzR85E0+EZAJQ==
X-Received: by 2002:adf:b649:: with SMTP id i9mr1142445wre.293.1586206921462; 
 Mon, 06 Apr 2020 14:02:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypKEUYmfMYe/JzPrGlq7UBZFq2PWhrh/0jswkaT4g7tdTKSXDPxWMZEEhPI5nnJzrSDsMC4jLQ==
X-Received: by 2002:adf:b649:: with SMTP id i9mr1142431wre.293.1586206921274; 
 Mon, 06 Apr 2020 14:02:01 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id f3sm1037368wmj.24.2020.04.06.14.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:02:00 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:01:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/12] virtio: add VIRTIO_RING_NO_LEGACY
Message-ID: <20200406210108.148131-5-mst@redhat.com>
References: <20200406210108.148131-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406210108.148131-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Matej Genci <matej.genci@nutanix.com>,
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

From: Matej Genci <matej.genci@nutanix.com>

Add macro to disable legacy vring functions.

Signed-off-by: Matej Genci <matej.genci@nutanix.com>
Link: https://lore.kernel.org/r/20190911124942.243713-1-matej.genci@nutanix.com
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_pci_modern.c | 1 +
 include/uapi/linux/virtio_ring.h   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 7abcc50838b8..db93cedd262f 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -16,6 +16,7 @@
 
 #include <linux/delay.h>
 #define VIRTIO_PCI_NO_LEGACY
+#define VIRTIO_RING_NO_LEGACY
 #include "virtio_pci_common.h"
 
 /*
diff --git a/include/uapi/linux/virtio_ring.h b/include/uapi/linux/virtio_ring.h
index 559f42e73315..9223c3a5c46a 100644
--- a/include/uapi/linux/virtio_ring.h
+++ b/include/uapi/linux/virtio_ring.h
@@ -135,6 +135,8 @@ struct vring {
 #define VRING_USED_ALIGN_SIZE 4
 #define VRING_DESC_ALIGN_SIZE 16
 
+#ifndef VIRTIO_RING_NO_LEGACY
+
 /* The standard layout for the ring is a continuous chunk of memory which looks
  * like this.  We assume num is a power of 2.
  *
@@ -181,6 +183,8 @@ static inline unsigned vring_size(unsigned int num, unsigned long align)
 		+ sizeof(__virtio16) * 3 + sizeof(struct vring_used_elem) * num;
 }
 
+#endif /* VIRTIO_RING_NO_LEGACY */
+
 /* The following is used with USED_EVENT_IDX and AVAIL_EVENT_IDX */
 /* Assuming a given event_idx value from the other side, if
  * we have just incremented index from old to new_idx,
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
