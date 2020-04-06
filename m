Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DB01A0110
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 00:26:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id ADE402342E;
	Mon,  6 Apr 2020 22:26:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p83r58qsNyZm; Mon,  6 Apr 2020 22:26:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1431A2341A;
	Mon,  6 Apr 2020 22:26:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8E65C1D87;
	Mon,  6 Apr 2020 22:26:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8754C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C88C08761E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvYdH3Hss3Rp
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B7BA48701C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586212003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qWI++drUheRLgJRLP25chFJvpGmbc+MWUzzhPso8aKg=;
 b=FsDrJNIZpFR3DghYICeM29FSJfO2Cj846ByW+M+bv5T6sj8GRsosMlK5RIOhqvITAX3GHs
 pAlVDWulio+QZwh1ZQTEUXmrt+y2W2TLej3IzjCxOdY5JOCfhWwfcOW+R8dREhhH8Wagae
 3aK+pT7zJ6qRCJ2FltJ0XmcSHCzCS14=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-vbXrCjbVNtq8e2ujVvOmzQ-1; Mon, 06 Apr 2020 18:26:39 -0400
X-MC-Unique: vbXrCjbVNtq8e2ujVvOmzQ-1
Received: by mail-wr1-f69.google.com with SMTP id n7so648090wru.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 15:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qWI++drUheRLgJRLP25chFJvpGmbc+MWUzzhPso8aKg=;
 b=J4hJM3G/Aj3Jwd/0r+yfikp0EqlpTq6YIwbkcfMqAztfJu5a8LE3ihvjv3mWA3FASR
 hN85XysfpsyV4fV1YqPD/W9MFK6RtRY5NOmUNl0H7B0/OcgpOrJQ0iy4k6XX8Qzf+dq4
 eToocuWHxzRW2t+32znpSA3i8hUA6O87S8xFbP3FiLO/AeDS5p/G5zub5Y9Aqu5bbHyg
 I7uJbBasUbSkOd/yX0X64zA2hbLgyg9DK8lvVoikiPM26f7i/+2sA6Hg16HYnAaeKUlf
 d6QVHBRsCdXYFzz431R1ZkunroXMMg/uLIUcnt1nwmYolXxrBbpWde29UpPUG5RNWpko
 8Cmw==
X-Gm-Message-State: AGi0Pua3j1BmITooPLSrjeisPIuAwXQsLiDnXJAJBRq9FO0L5YHtC36s
 gZPGd055sg0drtyUNoKnsiHe2ky64BfqZHAgQLw6iHhaCYorOixMBPWfstpQtpi/c3dLUBVqX2u
 l7RwrODfb2DLhgiR7a2hdzyIcF3zg6B2+9tbnly46gQ==
X-Received: by 2002:a5d:6204:: with SMTP id y4mr1590914wru.410.1586211998045; 
 Mon, 06 Apr 2020 15:26:38 -0700 (PDT)
X-Google-Smtp-Source: APiQypITDhGNQZa99ndk04hNA7xG8SlNGaI/jBhEo5PQXjQ1+zaBzfx8Hh0Zv03WWW0lajc0/UW2QQ==
X-Received: by 2002:a5d:6204:: with SMTP id y4mr1590896wru.410.1586211997853; 
 Mon, 06 Apr 2020 15:26:37 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id f3sm1304116wmj.24.2020.04.06.15.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 15:26:37 -0700 (PDT)
Date: Mon, 6 Apr 2020 18:26:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 04/12] virtio: add VIRTIO_RING_NO_LEGACY
Message-ID: <20200406222507.281867-5-mst@redhat.com>
References: <20200406222507.281867-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406222507.281867-1-mst@redhat.com>
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
