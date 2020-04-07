Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C48741A0449
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:16:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6F80987E9C;
	Tue,  7 Apr 2020 01:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HOHdKmxjiGRu; Tue,  7 Apr 2020 01:16:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 321DF8838B;
	Tue,  7 Apr 2020 01:16:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12738C0177;
	Tue,  7 Apr 2020 01:16:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25AC2C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 113CF20517
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6EdRD2W+plOA
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id BD843204AF
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586222213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b+P99eoGOE59dzJri6nDdYTRF/iHp1rUM821OiEBSWI=;
 b=FL5cL9jB/jv3Cw8c0R7qvL4Fr6L6684qHMIGeLvRn49FmU0NAjyiVhOH2dTCfHtVcwNLTT
 /fKTvnPA8fBXt1d1mTRvRISYxbpwz2TZ3uzW9C1r2QkluBXsCQt8fjbqw8CNvpeNm1trai
 9qnn1PPCSS8PgevWzuuC3b3MAZBt08o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-plm_OQIZPwGYE_-mqB8T_Q-1; Mon, 06 Apr 2020 21:16:51 -0400
X-MC-Unique: plm_OQIZPwGYE_-mqB8T_Q-1
Received: by mail-wm1-f70.google.com with SMTP id y1so16650wmj.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b+P99eoGOE59dzJri6nDdYTRF/iHp1rUM821OiEBSWI=;
 b=TarTvyqIG3er6bgxqQoUMlTq+5OuxXSTZ4ZIarmJWGWXFcJdnxz7NmLKGSV0YYkjr4
 kjMjXlOns6M/fXzjsJSj8jX19oCeAR2Fv/PMzyArQvEV/+pH1TWpM8quroUYoMZkR7WU
 UIzM61ss6jShPlF39SecqcPB+dnvGptAfYpbJbjpGotdmkimgTiqH6P6QfsXaFSa6aLk
 TX4/7bxZtBA1PElb0cLUhYJCseFTdTGc/Vw4SMTVDAwXrufCV4MRG5m3OOBtqPl25rgo
 X4zZ58WxmjpZGCGXQZCGso3sDs5z8TbRpju2NJmaULFraQFRRoqLslx9XGSB1FcSlj9w
 FKUQ==
X-Gm-Message-State: AGi0PubLd/1NpV61is9jps28eL5OLsZE7KnO2629yriYoImlBjXk6U5z
 Zb1XK5uE/FoOQM+XGXEF8GQK77m0nTUTogd6KVD0K9qjZ7t4caUJWKWTY3lkiDnRnhA/Vu8FtC0
 y46BLrW5ukfNpWi5fCP80db6DAOnyH3kKVHFtUrqNjA==
X-Received: by 2002:adf:fe52:: with SMTP id m18mr2041301wrs.162.1586222210551; 
 Mon, 06 Apr 2020 18:16:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypJn5DjBcjpMzTbrTEAm6PtADPd35uHLc30DK0aLGHH0mu1pODoic12Kr5dEmc3NA5QUWXhA1A==
X-Received: by 2002:adf:fe52:: with SMTP id m18mr2041286wrs.162.1586222210287; 
 Mon, 06 Apr 2020 18:16:50 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id u13sm30079813wru.88.2020.04.06.18.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:16:49 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:16:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 10/19] vhost: force spec specified alignment on types
Message-ID: <20200407011612.478226-11-mst@redhat.com>
References: <20200407011612.478226-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407011612.478226-1-mst@redhat.com>
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
