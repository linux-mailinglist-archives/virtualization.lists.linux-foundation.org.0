Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B50131A0432
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:11:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A7D948495A;
	Tue,  7 Apr 2020 01:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d54UfQLoDPTZ; Tue,  7 Apr 2020 01:11:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7E4D984BDF;
	Tue,  7 Apr 2020 01:11:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35079C1D89;
	Tue,  7 Apr 2020 01:11:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B44BC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5A02884BB6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xHcdG8fRZ5nh
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:11:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 298E68495A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586221866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qWI++drUheRLgJRLP25chFJvpGmbc+MWUzzhPso8aKg=;
 b=akCXC5ZIuoI+xgVGIS3arkdOeuCua1oatykcl3PT04qQckknR+Ks3ZqN3Etsidk4+nli9G
 VDKPXGrQJy6hB0DE3h34VavR+nr2KjId2FiQKkZ/0THfhq1+2/GByEdqoEHgQdMUV/CVhy
 zy7sLxrkuv152Ngb21aYvky4iE98PzI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-AXm-XOCLORm83KJguH1sFA-1; Mon, 06 Apr 2020 21:07:37 -0400
X-MC-Unique: AXm-XOCLORm83KJguH1sFA-1
Received: by mail-wm1-f71.google.com with SMTP id o5so7860wmo.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qWI++drUheRLgJRLP25chFJvpGmbc+MWUzzhPso8aKg=;
 b=LVsstnRwc0TSBP8cN2p+ELezInWrnfUiQfoF61b1sTOgQ2741IFTZ0e4SFjtlXf25k
 05FVMSvcO4sPvCFm8j1rcSKkeCk7Ts/s84QMcxNXDaBRp6Ueyuv35IuY6OoT1UEpDVQf
 R9VeXIeDgpEagUvg5664OYoXIpBVjI5UT+TXstEfI6XzeO6F4zUgLEPpR4egNZCnz/kH
 xGnJUDbs8g101d/VVghu+u5Nftuy7HIfmXUajA3qC3jMfENzJp5f1tt/n280BSutAeOi
 RNK2+n7SmwRTXnZQ/vXewsHiMQqApPCReuMGT4Z2RleJ7wvSOIb3IYwcycZmAmQQ+bgr
 40aw==
X-Gm-Message-State: AGi0PuZy5Ap5x46amElZi2GLBKoVgV1IhBsk43X+ZnHV7VBCUfv4lfqa
 tZ8b6HEHlFjzBUbeuNxeSLeiLOamJ5Fln57hWnG8Kd5U4UzqPa5CyQFgi5l5lVxy7XNGfxj0Nvg
 m9hEs4fbk06X+JZMdXRb3HZn+3IFDdJWxQ6DBq5qnlg==
X-Received: by 2002:a7b:c051:: with SMTP id u17mr1924682wmc.129.1586221656373; 
 Mon, 06 Apr 2020 18:07:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypL1VPym0WV2AUNWF3nePrQ1HrbzKWkz96fRM10+GRgtdRjalH82OhlghtMpKVrLdSxpzpVYzw==
X-Received: by 2002:a7b:c051:: with SMTP id u17mr1924673wmc.129.1586221656136; 
 Mon, 06 Apr 2020 18:07:36 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id p21sm78486wmg.34.2020.04.06.18.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:07:35 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:07:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 04/19] virtio: add VIRTIO_RING_NO_LEGACY
Message-ID: <20200407010700.446571-5-mst@redhat.com>
References: <20200407010700.446571-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407010700.446571-1-mst@redhat.com>
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
