Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E053F19F9E5
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 18:12:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 966A588277;
	Mon,  6 Apr 2020 16:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3U3I4uDo50BS; Mon,  6 Apr 2020 16:12:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EFC3F882CD;
	Mon,  6 Apr 2020 16:12:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4CC5C1AE2;
	Mon,  6 Apr 2020 16:12:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57299C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 16:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 165CD20027
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 16:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRr4fL6c6hRj
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 16:12:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id CE25423492
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 16:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586189528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YSJ8Eyd5qzlvYRVDFDnJ/h6MFs7vCBsG17V62Acz7Go=;
 b=eyV2B8YNkwvmRb0v5xMEd85IeegWif0Ogf0guMeFaWL8xGZt8muSswQT3MeyXgUKdrm4ka
 dZGJXvmhZHVZD4P20jqXxDUUAfjF2ZIt0Zwxg2lgypKY0pXB4okZSXdTON+YeunCsmOMJF
 hXVp8kmutN3UQ5UopQF1Hk7hxsWhZVI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-HZ_gIF2bPoqWqiyF9kz8Kw-1; Mon, 06 Apr 2020 12:12:04 -0400
X-MC-Unique: HZ_gIF2bPoqWqiyF9kz8Kw-1
Received: by mail-wr1-f69.google.com with SMTP id h14so42975wrr.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 09:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YSJ8Eyd5qzlvYRVDFDnJ/h6MFs7vCBsG17V62Acz7Go=;
 b=BZWB+F0OmhM3iUSt5KEfBAiL5JGSo5yB5/mTxaCHCF5XXzPtbkPK72pC1sBUJU52tT
 jiwFAfFFdGWYRndo3Hm4nBARkG65T3ZLsdMpuwaUt7YQuxhZ5wWv1bGPqTcnf+B5lvlF
 IX3nqKIXi6XexsmYqSTHlCVit11P2gASITG0VnC5mOVlL3ALOMJll3x80uqGffxpaFjE
 czFB5oFGGgGRg3d8B22P6yrT1HGiEXNzcSjsOxAw7gVloYl2l2gMHG5I0Jd8FecikESw
 moslb8LmAikUKVmjuH/ToY0d15X4DRGOykLYG8HVtyVBdtGrDTuCzUacsYEbDMTHEl19
 92Dw==
X-Gm-Message-State: AGi0PubqW48p3Jkhg4hyY9WOC2KhV+WR4Q1Y2r7PNS2x3w9q76IHxZvz
 NGWU3wL2yI8f/3nRVM+x0cM+MQytj4RSRtc+yeVZFEq2zk/ril6cw3i9VMmhU0gaC/p4iHlPoxk
 ElOwBtf1F2KnS5cUXOeCsWxB/Jgc8zsFXNi3E376fqg==
X-Received: by 2002:adf:a48d:: with SMTP id g13mr26477937wrb.38.1586189522887; 
 Mon, 06 Apr 2020 09:12:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypJYH9VirBBcJS7XAIuyV6I64Pp7s8xM5+YVZD9WaBXPltzMCbzOkZBbTEPyDfUwNBxO2HXnbw==
X-Received: by 2002:adf:a48d:: with SMTP id g13mr26477907wrb.38.1586189522618; 
 Mon, 06 Apr 2020 09:12:02 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id s66sm56418wme.40.2020.04.06.09.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 09:12:02 -0700 (PDT)
Date: Mon, 6 Apr 2020 12:12:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] vhost: force spec specified alignment on types
Message-ID: <20200406161146.130741-3-mst@redhat.com>
References: <20200406161146.130741-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406161146.130741-1-mst@redhat.com>
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
index 181382185bbc..3ceaafecc1fb 100644
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
index b6a31b3cf87c..dfb58eff7a7f 100644
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
 struct vring {
 	unsigned int num;
 
-	struct vring_desc *desc;
+	vring_desc_t *desc;
 
-	struct vring_avail *avail;
+	vring_avail_t *avail;
 
-	struct vring_used *used;
+	vring_used_t *used;
 };
 
 static inline void vring_legacy_init(struct vring *vr, unsigned int num, void *p,
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
