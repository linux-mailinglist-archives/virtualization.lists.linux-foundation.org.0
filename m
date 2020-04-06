Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AED19F8F0
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 17:35:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F159E863AE;
	Mon,  6 Apr 2020 15:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tvl0rUBVSepw; Mon,  6 Apr 2020 15:35:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79A1F863D9;
	Mon,  6 Apr 2020 15:35:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E672C0177;
	Mon,  6 Apr 2020 15:35:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49AF5C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3953E87F6A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QcerzZjZsCH3
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:35:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 19AFC87F65
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586187334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WcD5bnL3oh20wTc9EOP7RiXfqynrk2ncKD+A08n84pk=;
 b=XcHjY071ArrTCW3RcihpPdeVwSEXNfK1x5jR95atepTZ8sgV7G7gmBJcjMBZ8RFV8ujoau
 rrpQu1ZPb5addMrHYjJpL0TL26GDLkpG7hHPVQRbngJNyCadPqcfvgItGFfgCqz/sDy9el
 L454NdAMSkjI7C6vUI7/BCXv4jp3xMw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-sj_cR6MaO4yCod8yo-wueA-1; Mon, 06 Apr 2020 11:35:29 -0400
X-MC-Unique: sj_cR6MaO4yCod8yo-wueA-1
Received: by mail-wm1-f71.google.com with SMTP id s22so4249061wmh.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 08:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WcD5bnL3oh20wTc9EOP7RiXfqynrk2ncKD+A08n84pk=;
 b=pLX17L1NuCsqAR0Snfx7ybyNV6Vnkv2timxLRdB/mySRs8XtTbJuccdbTgpuw3eNrM
 ZLvTm+9ARpwL/ta+PbaH6wNBE2rx1QHL6P+lZkjWC9Ns/UYXkGh/W6AuN3sFM+g3h2r4
 2y6sOLiYidc+1Pxy+/kXccbxclvC/R7rDj5JUIenv3jqJGtt9FdTuM2kCOZjuz+mapE3
 rdu7p5gdTjQWysCdDLBqdstE27IzI3KpMcSZY9teiRRnw5K5St2G80tnViicxtrXulN5
 UX/1wyH22MeSeRqwESIoiJPXZ+PwnGHweTse1t4vDaLDjgGVQUMpuXlDTu8L6fDPtYa4
 S8GQ==
X-Gm-Message-State: AGi0Puazrt1eqTOHoNA957VYj86xpO8Q3qfC8BRCpZOWEx9Lz4hJnLts
 T0IeY0MjxpI1vkGqgoi9L6gP3ACAgU/w/Xa69hkTwxrTvkmo7mkQnHlv7v1JS6fyV99JPN7b6gn
 yqjjI9FnWSb/x97aGw2e97tqZCILdWyQ6DX+SAkTrzg==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr235148wmj.61.1586187328646;
 Mon, 06 Apr 2020 08:35:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypJviLbcieugAjPGOVBq05eDNBi87y+oZCK+mJ9GTEVcTRtTrZXiXSxdhRpJLHpez1P5uNEa6Q==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr235126wmj.61.1586187328352;
 Mon, 06 Apr 2020 08:35:28 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id d6sm27113086wrw.10.2020.04.06.08.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 08:35:27 -0700 (PDT)
Date: Mon, 6 Apr 2020 11:35:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] vhost: force spec specified alignment on types
Message-ID: <20200406153245.127680-3-mst@redhat.com>
References: <20200406153245.127680-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406153245.127680-1-mst@redhat.com>
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
index cc82918158d2..a67bda9792ec 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -74,9 +74,9 @@ struct vhost_virtqueue {
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
 
 	struct vhost_desc *descs;
diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
index 09fc6164b523..efcb9fde1dbf 100644
--- a/include/linux/virtio_ring.h
+++ b/include/linux/virtio_ring.h
@@ -113,14 +113,32 @@ void vring_transport_features(struct virtio_device *vdev);
 
 irqreturn_t vring_interrupt(int irq, void *_vq);
 
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
 struct vring_s {
 	unsigned int num;
 
-	struct vring_desc *desc;
+	vring_desc_t *desc;
 
-	struct vring_avail *avail;
+	vring_avail_t *avail;
 
-	struct vring_used *used;
+	vring_used_t *used;
 };
 
 static inline void vring_legacy_init(struct vring_s *vr, unsigned int num, void *p,
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
