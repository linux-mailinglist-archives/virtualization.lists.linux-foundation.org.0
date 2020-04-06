Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F901A0034
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:34:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D69962079A;
	Mon,  6 Apr 2020 21:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gNyzVseZqFfo; Mon,  6 Apr 2020 21:34:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C8F25204B0;
	Mon,  6 Apr 2020 21:34:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9295C1AE2;
	Mon,  6 Apr 2020 21:34:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11287C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 00FBD865DB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uLLjo0D1pp54
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 49771860FE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b+P99eoGOE59dzJri6nDdYTRF/iHp1rUM821OiEBSWI=;
 b=Z7amTvX4E8a/BsieLgf9KNnVc3e3g/OJSc4czDKiqHROckdje2WEV9RbRep8GmmBWna4Pl
 9sv4BugdujiMjM/t3oHaFhKtG6X7cxVDzsQhDMA7u7q+xf5kxgbrSltrL6TObsj5uk6YBF
 IntsugIb4kUrEWOUzOIg2XbCz0juVDs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-SUHFWcZkO_Kr_kvP8YlfnQ-1; Mon, 06 Apr 2020 17:34:40 -0400
X-MC-Unique: SUHFWcZkO_Kr_kvP8YlfnQ-1
Received: by mail-wr1-f71.google.com with SMTP id g6so576556wru.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b+P99eoGOE59dzJri6nDdYTRF/iHp1rUM821OiEBSWI=;
 b=Yvsm+9Guzygg/NY6n8y9AYtHOrPvqrtQRwhAYWCKl4LqcAIxLx22VjM5IkL8UrbEIY
 GWPOiMkwpZZ6inFOZQYsOWrc0hpd+Zv2G0UG34in5lHZ6q/uDayecQQkNH3wYdQzqdJ9
 Go3ont+lmhuUxaVsGcYQ8xEoChrT4QPosKtcsox9yBLBq7jObOachblpd0RMimKnEYbD
 KL/3cz+VpjsJCbpj0RHKg8UiAaNbjwRhhXrrAR3ZUO/vvVWcLHvD4lpe45mGGEINFACR
 ZvOpQyz86wmEFUv9Jfzk/VoPVVLwV+Q9m8/HfK5+abYovvQ7DzPy28bOJifqMgpSrE6V
 +4Gg==
X-Gm-Message-State: AGi0PubHQZxPciwMVB78xUjjWs6EFmkBztb0cNFPzWk1Mlo49owF2+UI
 cHYBFrBWXN4LP6/as7ourUZfvv1BN1T3YmGsD2cV870fJU+ms8cYuQH/QWc6NXPgp+cV+txvzFi
 Nx0zFjsAkFM81wbGkymy6Ecdl6793/mESvz3QDhkLIw==
X-Received: by 2002:a1c:2d95:: with SMTP id t143mr1048135wmt.89.1586208879545; 
 Mon, 06 Apr 2020 14:34:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypIDfEOd292CqNqE70r5arC2C5jNItEbGfr741TbN6Hn4hfA1uTh0Srcc3LesXCK0n49qBd6Cw==
X-Received: by 2002:a1c:2d95:: with SMTP id t143mr1048122wmt.89.1586208879332; 
 Mon, 06 Apr 2020 14:34:39 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id b85sm1103452wmb.21.2020.04.06.14.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:34:38 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:34:37 -0400
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
