Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 896771A0112
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 00:26:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 43953884C3;
	Mon,  6 Apr 2020 22:26:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gOQjJBNlFdCl; Mon,  6 Apr 2020 22:26:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88DCA884E9;
	Mon,  6 Apr 2020 22:26:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74C35C0177;
	Mon,  6 Apr 2020 22:26:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9477CC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8EEFD867A5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rgjhVDgP0zqv
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3A090867BD
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586212007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b+P99eoGOE59dzJri6nDdYTRF/iHp1rUM821OiEBSWI=;
 b=U/vFF5VpXdmJuvhGVtoAcxNjDn8Yk87a3t6GmWVVKJW6gY9fo+Ei6MevQc/8I0qh4LitRW
 /zglA5B++K0mdu5RAIDy8DsuK6jbwy+qzP/Astl6XkayEHxVRHXn8SOwCTRO+UCtJwehfB
 YFxDE5HwoaAnl6IzJEPcXMQ2g8a+rGg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-dXwfKY-RNMeef4m14BGl6Q-1; Mon, 06 Apr 2020 18:26:43 -0400
X-MC-Unique: dXwfKY-RNMeef4m14BGl6Q-1
Received: by mail-wm1-f70.google.com with SMTP id a4so471513wmb.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 15:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b+P99eoGOE59dzJri6nDdYTRF/iHp1rUM821OiEBSWI=;
 b=U8uujr0up4qXlAbsWH4W8PlohAlRBF7X82RkvN74htkpJIvgt9P5VCqeOxCuaFYxkG
 6vePIGI9DzNnxO26IcIbSnMwclWbtAc5/u4MGdOwB2Zgn2eAM/yvsmL57IzUbvpkWHxP
 RueYlKTNdIogrs3K9cQAhxmmOnZZ/DZZdU2JsENY0U3akz3PiGqK5xPbn0H7G2NVk/TX
 88GQbIslpIRzpe5E9Kei0AjvNu03O3rFE4QOekFZzlw8f/t/n1A43aUP/fLhMyMk7e+1
 Oxv7F+6cW938CPmgKJPKXApA95YVexkLo3k8+V+8r7HcsM89k9VEkA3zLFe3ylJAfmzf
 sQjg==
X-Gm-Message-State: AGi0PubzKoIrFRA0a2qAyTMR2N4UAkoSHsLPLwtc7GxMT+G6jTvQouAD
 SIi14pG4D3KjGzKgok3PKAkqxPcpTnr2x+6+cVFACSR2CDccvp14n+cMXxo7gR/94+YNKYGv3E6
 VbO5pxTy78JbnnOF2EHvPL5bMNV35hDGv07zQyXw7VQ==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr1618540wml.55.1586212002445;
 Mon, 06 Apr 2020 15:26:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypJbM6FeH7VkbvEqYuHfim8CWxiQKaSSyipP1ZEG1ds7M2SyHjKH/nl5jukff0ySxHyaH4YMVA==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr1618523wml.55.1586212002230;
 Mon, 06 Apr 2020 15:26:42 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id h2sm1186449wmb.16.2020.04.06.15.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 15:26:41 -0700 (PDT)
Date: Mon, 6 Apr 2020 18:26:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 06/12] vhost: force spec specified alignment on types
Message-ID: <20200406222507.281867-7-mst@redhat.com>
References: <20200406222507.281867-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406222507.281867-1-mst@redhat.com>
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
