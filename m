Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ABD1A0033
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:34:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A9C3C86702;
	Mon,  6 Apr 2020 21:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pl8slsHH00lM; Mon,  6 Apr 2020 21:34:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7B2C586672;
	Mon,  6 Apr 2020 21:34:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6ECF4C0177;
	Mon,  6 Apr 2020 21:34:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF79DC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BC8B988292
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-9hHmQhzDji
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 85413882A1
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qWI++drUheRLgJRLP25chFJvpGmbc+MWUzzhPso8aKg=;
 b=cBLA4FOe0t33zl887uI/CbBy7xMXBgzSPmZXM5X7mx9Gbs/kwJTAZRX8q76ub2WOoylm+M
 lt66bm/baESP+n5PAzB9HkZR8YwOEVknc14YE+rtn0HOzBBqszLtUco76kUhFLAoCMbDta
 QD/uy2dz5b0D76st3iB2LVJh4MIzNG8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-z4yOwMThPOa8vAX-GRPF_g-1; Mon, 06 Apr 2020 17:34:36 -0400
X-MC-Unique: z4yOwMThPOa8vAX-GRPF_g-1
Received: by mail-wm1-f70.google.com with SMTP id u6so411639wmm.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qWI++drUheRLgJRLP25chFJvpGmbc+MWUzzhPso8aKg=;
 b=erR0ZGIB15hyRlpyhHFvckUVE/cFW3sUx8SHpWr3VRHbBnE1yBz6lO5sLNFMZBd3X/
 Rkdsjo9fXuUaTguhaqtsms5MnrxKcqouw2JaOXYy/tnYWdT4088Y+kj//8mAw7Scpuhb
 mFihUIRSfNnGJbmx+kFHxEXuBVYWo3nehU8rTMmihLpSv5RmnRGyHTYL052p9L1wdNFm
 +sXgpfEJhPq2EjAWn4EwVS6KlDxW0wTNV3RSEbiyBGHassD3NWolEykVYU2E0lSeo69a
 408aooqLHgvMG4LkDmuEFfS4lPyOAWu5H0s9JEIXR+w7m+v0+/fTLeDEeOOl71WdL8fn
 Qihw==
X-Gm-Message-State: AGi0PuYxLVU6NnF6ewerSO++d4BClCrhK9IYXrmEDUqfcJzMeA0W7tN+
 MqMbHU9NtlGz8QDML15vNIRW0DnI/yCpEs9UPCeF3pIWrkXdMQaZUzxy5ne7wxLX82xqXpFnRhW
 e8+DSU2nBRYzKHQQEGtumhcpy5J1lSa8nSzN2cQ8Z0g==
X-Received: by 2002:a7b:c402:: with SMTP id k2mr1101236wmi.21.1586208875349;
 Mon, 06 Apr 2020 14:34:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypLyqEDlE/IL49G3Pxv/kJijKYUNeWb/9wixH2WnadTfCvyxI9caTl+yxyLpMNSiBi9358S8Fg==
X-Received: by 2002:a7b:c402:: with SMTP id k2mr1101230wmi.21.1586208875148;
 Mon, 06 Apr 2020 14:34:35 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id v21sm994848wmh.26.2020.04.06.14.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:34:34 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:34:33 -0400
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
