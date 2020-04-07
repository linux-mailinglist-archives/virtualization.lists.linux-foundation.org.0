Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9EF1A0446
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:16:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 16C6285C06;
	Tue,  7 Apr 2020 01:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9aZvdsE0a5xe; Tue,  7 Apr 2020 01:16:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 85C0685754;
	Tue,  7 Apr 2020 01:16:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67F88C0177;
	Tue,  7 Apr 2020 01:16:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7C6EC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9786182241
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zxF29rGAaYrH
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 602B488601
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586222200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qWI++drUheRLgJRLP25chFJvpGmbc+MWUzzhPso8aKg=;
 b=UelDHPHwrbnEcsET/cwKnFImfmGkTX1YAXB919PUZZlpRkKC5/2IdkLzcZZ4r2vLlaui92
 3GfKd23PJT1HXtqWSvg64j1zXuW4P+Jw2uIh3FDvZd2ghcdzLDkPMG+rGf2TUDitrnCXPy
 QjkH9SWySJN3WILv/v3vperzCkH8Wv4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-Kyw_IFyiPWqHm1Zivfj88w-1; Mon, 06 Apr 2020 21:16:38 -0400
X-MC-Unique: Kyw_IFyiPWqHm1Zivfj88w-1
Received: by mail-wm1-f71.google.com with SMTP id o5so14553wmo.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qWI++drUheRLgJRLP25chFJvpGmbc+MWUzzhPso8aKg=;
 b=EmI8mza8J6kiFQU8wqAWiypiZd/aaH81GMFQcgHMUdelGXGPc17FaQzmiUKt8LNOsG
 XyitTyOCOO7+jJ4k39TINvOok+ylQSeS1Hfy86m9qd4RaZSzCDwKIw2UyJPG8hCvnnuu
 exX8qyvpBpYcFOPcLOQO7iK5JHSEdLUfpfmnK38OH0jB1y5z6N29O0Vn4mkczB/ucg8t
 1ojbRB9shkDbW1+jWgIxeXkwgsGq9jHcet2nezcNipkTyy6nxonx6slZ2dP3v/8sM8Lo
 PyUcsH2Xhm8NLOVcnja7Ag3girFh8AAz2rViHNAA7f87Ua+TcQywHk6foajAhh7bvDQx
 5wyg==
X-Gm-Message-State: AGi0PuaC/17FpiJ/K5IW9DX4/uc+YwXlmUhkmAv1ikRVi7geBQGF6cst
 Yh9HWyfuQMtPrn4WFNyEdaFO3Km4cMziXKKht7yQ1D/T/gbgWp0lklyBEwjTupZMEd/pLtQyUSm
 jjyVdIBvkiXn0uJ2YIf+W0khJtUupCnj20uX+zBnddg==
X-Received: by 2002:a1c:f315:: with SMTP id q21mr2048647wmq.169.1586222197142; 
 Mon, 06 Apr 2020 18:16:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypIzBMyKPWUK7kodkLb2Qg8aZfq7m2tt5u6B0Jpm9XZOtZrUL8QvMMUAmGtTWn7vvPaz0udVuQ==
X-Received: by 2002:a1c:f315:: with SMTP id q21mr2048633wmq.169.1586222196879; 
 Mon, 06 Apr 2020 18:16:36 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id v16sm107723wml.30.2020.04.06.18.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:16:36 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:16:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 04/19] virtio: add VIRTIO_RING_NO_LEGACY
Message-ID: <20200407011612.478226-5-mst@redhat.com>
References: <20200407011612.478226-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407011612.478226-1-mst@redhat.com>
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
