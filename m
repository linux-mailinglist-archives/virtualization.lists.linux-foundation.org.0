Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6729319FFC5
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:02:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 02DBE2045F;
	Mon,  6 Apr 2020 21:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dK1pcYkHHkRA; Mon,  6 Apr 2020 21:02:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 420502041E;
	Mon,  6 Apr 2020 21:02:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 206CBC0177;
	Mon,  6 Apr 2020 21:02:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F11FC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4DB8585C6F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Gi1l9WSRKsm
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6857281DD5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586206931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b+P99eoGOE59dzJri6nDdYTRF/iHp1rUM821OiEBSWI=;
 b=XmIRmsiUZ3I7KTvTmU6YIlZygfvw1JUzx7vTeNey3LWmMGJuK063rnD2YNpb8nG2LgfW1E
 MX2g9E0xGPawA0p1g7z1IhsmxUHWYxiXNh9eS9MkH7aMbm5O4FuvRysOEwS0K2N7ncr/hb
 +Z4CFQ6T/Njq1WxLIlMrqH7qgbFTNJc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-4TcoM8dBMPesDZJn3pXApQ-1; Mon, 06 Apr 2020 17:02:07 -0400
X-MC-Unique: 4TcoM8dBMPesDZJn3pXApQ-1
Received: by mail-wr1-f70.google.com with SMTP id 88so540446wrq.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b+P99eoGOE59dzJri6nDdYTRF/iHp1rUM821OiEBSWI=;
 b=ErYFKKUTYAUg/UeQa9zJtfWFlZvR7NvS9Ui+aCdsBQeASTWzHFpgf93NnIuSk+RKvO
 s5DBAiAf1N38vOMLPggjwwC3UyX29N1HZZ3po7vcKkIT2/7AJrhdCyd+4Lf4UzqR5+U5
 2aK8B3STjRVDdmiUrwZIstj53WxlxYkVI8JTOcDd8k5bnymD+8qfq6CVrZO8nYMcTzaZ
 CW/FZH4v5s5xzVXfpdbQqRAvxtZqhB1IIWE9boylWPycLwJqdrL+ROHtpQg74CDMHmgc
 lr34+0MtWaMb/pHT0C2wLEW6S3hCKTY/7smgJsevw67Tv4D79w8YVG/CLrxGgpkYsrnM
 6PdQ==
X-Gm-Message-State: AGi0Puah8l4ZU5/tIJadWXmtlJmI4ZUi+Mb8u95Xgovr992Ar0rfGg1+
 gL5hAS0xU3pSQbXqqnJgtyrBCNFMZXu2zj/FQubnEwh5lomwBDawQ0YR1jvIDw+miZisfLiohiM
 IvgJrWCS553gZpxUx9KoaciuUyyWW0aFMAGfiUYn0DA==
X-Received: by 2002:a1c:3589:: with SMTP id c131mr1302287wma.116.1586206926218; 
 Mon, 06 Apr 2020 14:02:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypLupa6V8Ag++nWn1lmvVOFBGbVp+NnLiKBe5TZlJuWBjL147oyGdoSjF8DsSNg7neOpqnwMaw==
X-Received: by 2002:a1c:3589:: with SMTP id c131mr1302258wma.116.1586206925856; 
 Mon, 06 Apr 2020 14:02:05 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id v9sm17395464wrv.18.2020.04.06.14.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:02:05 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:02:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/12] vhost: force spec specified alignment on types
Message-ID: <20200406210108.148131-7-mst@redhat.com>
References: <20200406210108.148131-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406210108.148131-1-mst@redhat.com>
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
