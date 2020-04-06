Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A31A003D
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:35:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 25DA688294;
	Mon,  6 Apr 2020 21:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kEQ9+cbPDxfq; Mon,  6 Apr 2020 21:35:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F106B8829F;
	Mon,  6 Apr 2020 21:35:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEF1FC0177;
	Mon,  6 Apr 2020 21:35:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB354C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BB55E87CBE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ZQYx8kyacs8
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5AE7C87CAB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b+P99eoGOE59dzJri6nDdYTRF/iHp1rUM821OiEBSWI=;
 b=Mg8Vj/gSwdhlNbgAr3FwEyVtVnfFe74j6FkXKNpo6Y2sjrAryV6/F4irQ13Be0WTFVUAhv
 lWcVu+JJxAZgM6Ytf0vWZCow0mw15mJVmY0l3o0WS4bjLspxtR6Rxqjmas6Eo61scFXvbV
 qAeX7jQ7RqgwNwLXI3x0f4r/Dl0WfrI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-TAqb7OCqN4mLRd4lY2j4ag-1; Mon, 06 Apr 2020 17:35:08 -0400
X-MC-Unique: TAqb7OCqN4mLRd4lY2j4ag-1
Received: by mail-wr1-f70.google.com with SMTP id u16so572717wrp.14
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b+P99eoGOE59dzJri6nDdYTRF/iHp1rUM821OiEBSWI=;
 b=WYHElMaeRsPpO4Ud1Zult1s2nCssdDniDLcV7dQkwx8CdSVWw9RKvlzfCYon0ldXHG
 Ic3SIZeBkJBT9FDTpfX1Ya1GasTLF2naAOtY7Fd4ezMrtdDCPz7hRv4gtUs0dJqFusJx
 gqIb2qL6HEJoC2ahdWCYAV9JrpUadGZd765SmKLFsi9NJJN3y2W34EUQKhdeN7IAGCmc
 M6lEM2NhD8W7OssmK0+jmyOyn3KPykfrtWIK05jHhFDyuLsPzEmHsR93lybYKAGOR54F
 9wnuQCiWF8y4Xocxkyo36Dv9m2cODZOZaM1dJZNvaHxpC4ix2AvQRTgzpv2B8GhRFzVU
 JNZw==
X-Gm-Message-State: AGi0PuZyAXNcjVfNfDy6dzT6o0mxfdEVeCmhGDmBwZ/JI0gKTdA7wkkA
 5TDBmqUczm8oOnHrzuWacdKmyoBIKqadnJTrU6iXBMnQWU4eiTnj3jLHh5Bb9gMhCk9r4U5mUL/
 xIRk2IQgoCRyVRvGdN8i66G2qQ/TXizweyWYMfsQDGA==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr1417292wrs.39.1586208907583;
 Mon, 06 Apr 2020 14:35:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypKcIiWn1HPwA+vMFpmabnpjQIkpeHu9tKG3iwnUgYRQLaqvdB7lSYnAh68ff+ai34FiHnYBKA==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr1417269wrs.39.1586208907340;
 Mon, 06 Apr 2020 14:35:07 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id u22sm1003113wmu.43.2020.04.06.14.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:35:06 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:35:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/12] vhost: force spec specified alignment on types
Message-ID: <20200406213314.248038-7-mst@redhat.com>
References: <20200406213314.248038-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406213314.248038-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
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

The ring element addresses are passed between components with different
alignments assumptions. Thus, if guest/userspace selects a pointer and
host then gets and dereferences it, we might need to decrease the
compiler-selected alignment to prevent compiler on the host from
assuming pointer is aligned.

This actually triggers on ARM with -mabi=apcs-gnu - which is a
deprecated configuration, but it seems safer to handle this
generally.

I verified that the produced binary is exactly identical on x86.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vhost.h       |  6 +++---
 include/linux/virtio_ring.h | 24 +++++++++++++++++++++---
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index f8403bd46b85..60cab4c78229 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -67,9 +67,9 @@ struct vhost_virtqueue {
 	/* The actual ring of buffers. */
 	struct mutex mutex;
 	unsigned int num;
-	struct vring_desc __user *desc;
-	struct vring_avail __user *avail;
-	struct vring_used __user *used;
+	vring_desc_t __user *desc;
+	vring_avail_t __user *avail;
+	vring_used_t __user *used;
 	const struct vhost_iotlb_map *meta_iotlb[VHOST_NUM_ADDRS];
 	struct file *kick;
 	struct eventfd_ctx *call_ctx;
diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
index 11680e74761a..c3f9ca054250 100644
--- a/include/linux/virtio_ring.h
+++ b/include/linux/virtio_ring.h
@@ -60,14 +60,32 @@ static inline void virtio_store_mb(bool weak_barriers,
 struct virtio_device;
 struct virtqueue;
 
+/*
+ * The ring element addresses are passed between components with different
+ * alignments assumptions. Thus, we might need to decrease the compiler-selected
+ * alignment, and so must use a typedef to make sure the __aligned attribute
+ * actually takes hold:
+ *
+ * https://gcc.gnu.org/onlinedocs//gcc/Common-Type-Attributes.html#Common-Type-Attributes
+ *
+ * When used on a struct, or struct member, the aligned attribute can only
+ * increase the alignment; in order to decrease it, the packed attribute must
+ * be specified as well. When used as part of a typedef, the aligned attribute
+ * can both increase and decrease alignment, and specifying the packed
+ * attribute generates a warning.
+ */
+typedef struct vring_desc __aligned(VRING_DESC_ALIGN_SIZE) vring_desc_t;
+typedef struct vring_avail __aligned(VRING_AVAIL_ALIGN_SIZE) vring_avail_t;
+typedef struct vring_used __aligned(VRING_USED_ALIGN_SIZE) vring_used_t;
+
 struct vring {
 	unsigned int num;
 
-	struct vring_desc *desc;
+	vring_desc_t *desc;
 
-	struct vring_avail *avail;
+	vring_avail_t *avail;
 
-	struct vring_used *used;
+	vring_used_t *used;
 };
 
 /*
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
