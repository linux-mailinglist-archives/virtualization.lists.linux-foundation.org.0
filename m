Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB9C1A003C
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:35:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C47CF882CC;
	Mon,  6 Apr 2020 21:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IX2L3gwi3HmM; Mon,  6 Apr 2020 21:35:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9B6E388268;
	Mon,  6 Apr 2020 21:35:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95261C0177;
	Mon,  6 Apr 2020 21:35:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CDBFC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 13780204B0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1oIKX6MVhdu
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 842F222850
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qWI++drUheRLgJRLP25chFJvpGmbc+MWUzzhPso8aKg=;
 b=hGQDNFBhCtLPo3kFLlMANxSX7C8lkqkf8wWbP9w54kzZMlAz+qy4NhVKU0cx7V3XCwKewQ
 84P6kmFX38ce73CtIYLIhgUYxdsDXa5yREJyUDY7rcod+9X3B/xKxh6wgf+GVey7cQszjf
 hR7ARktooUzenua3zeYSizOQpfGMN/g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-SFyrFlQUOjyEAU8ECvdIQg-1; Mon, 06 Apr 2020 17:35:03 -0400
X-MC-Unique: SFyrFlQUOjyEAU8ECvdIQg-1
Received: by mail-wr1-f72.google.com with SMTP id h14so573875wrr.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qWI++drUheRLgJRLP25chFJvpGmbc+MWUzzhPso8aKg=;
 b=nNdqYjPAj+59Zdv61ckcYeWdM57sbzceMrKITiivfqb3+dSAGktM2/voTMLp0PylT/
 PQxWRjdodEE+CjdqUm1Z0HrqH0d0/VDBKYZrSm/mqUyxVBZqvEFRUbtyE4i2IvC4fL6G
 HHl85OAZXxBlcm29ktHv4JvfE4sMEwJ6Qw+nTkvilGEGWL/KWbLiTJaeCDbpLOue9ze4
 1vYeaHaFOMYxYCUZZixF+xhLs+QclEHiMTgQOto4K+1XUKDh59K7TqB6DyIWMy6ntHUH
 UWbzCT4cPTBUXN5wmPxwHEIoTH30k5RO+Vs+E/Rcxot1cE0kAwJsLgfr9n/+bhFD4VMq
 1eqA==
X-Gm-Message-State: AGi0Pua1FxT+v1DCZg8URaEMkGWYJIxAln4onF10U/j4+Lma9KW44j76
 y4isHL98zy8unLBLTtV3hjD1Uyzg/IL2Xx6CNhuUqScVR4LyRyjZin4OaUx0sA+TO6ugfP9n3r0
 o8UVONIpFyP45ErFMawAtGeUdkFxJRG8nSKK4r9NJng==
X-Received: by 2002:a1c:6189:: with SMTP id v131mr1379081wmb.69.1586208902288; 
 Mon, 06 Apr 2020 14:35:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypIGMFjC6JEE4rj0+kmWXxAPv5VbkaMdS8mzLAfjCwSQ+lPL71eAN+wnTMem5IdlA9ywESErYA==
X-Received: by 2002:a1c:6189:: with SMTP id v131mr1379063wmb.69.1586208902051; 
 Mon, 06 Apr 2020 14:35:02 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id u17sm31576241wra.63.2020.04.06.14.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:35:01 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:35:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/12] virtio: add VIRTIO_RING_NO_LEGACY
Message-ID: <20200406213314.248038-5-mst@redhat.com>
References: <20200406213314.248038-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406213314.248038-1-mst@redhat.com>
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
