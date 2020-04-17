Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 551AF1AD819
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 09:59:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0757F20427;
	Fri, 17 Apr 2020 07:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VbIEN8a3G6VU; Fri, 17 Apr 2020 07:59:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7B1872262F;
	Fri, 17 Apr 2020 07:59:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A671C0172;
	Fri, 17 Apr 2020 07:59:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76D3CC0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 07:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6678A87659
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 07:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GnlftL-sHBC9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 07:59:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0599A8764F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 07:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587110387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=pttTsXfJsO5qd96fUX4GjjyN7BeuHWmaGEZtAEZg4sw=;
 b=J8Hw9dixONztY7+Tpsyrf+Zi72I4LVRfSEFHivVdPTY5VGASeKZ4cC2QjYA6nChmp9sMMj
 fAPTDpYWn/94FOr/M2+Z4Fk4EOPMjJzYX11w5NYk24MYlrSMblxRtsHKET7zjApp7s0mUi
 7/uJDWUb/4iVLsZgJAn1mKFkSeakORE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-K6uaXkROPnSWsQnAx6r1aw-1; Fri, 17 Apr 2020 03:59:39 -0400
X-MC-Unique: K6uaXkROPnSWsQnAx6r1aw-1
Received: by mail-wr1-f71.google.com with SMTP id o10so598265wrj.7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 00:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=pttTsXfJsO5qd96fUX4GjjyN7BeuHWmaGEZtAEZg4sw=;
 b=MkKqwJ1hEWPTLcrmJTNNW5R+uUX6eZFWB0dNs1YuaVC5Tyr8JXOWoTDjS6OmFRN/Gg
 vKUrKWwvRNUTl89a1/qkPJ9DhHQIhfKczHdB3xlCBE6kKNk94Gs91hIzRMe879DX7nxE
 +jBVjEm5TRlrQaLPFseTUx7ZY1W7j7JWktHfbLLCyLDgvaOUN1aNokrI2VqE1g3KO2UN
 m2U5COg+0a+KNZ0+y3VVjRLmTNqgqc07VZ98kKhRafZpE+gHANSbkyeJhjCS57Rzx7bg
 wpi4UBufUAZtoEKgCphhyRz8H9wYpfVWNLxgcZ8AIioq0AKkfLyXApjv6wLd5+epNY/R
 x5hw==
X-Gm-Message-State: AGi0PuZvpJBxDr/r56pZpYKIpagBZb5EPUYHGvDJYwPKvWelBonARaNV
 0rww6+mDOHOARPhrougA8Gp2jLSOQwiEM3ToT3BbO3k84ib0GnPxewfVLnBdX4YVsQ5TeiZCYHO
 oLV+nIfhCqQzl5h/piuWEIlWKOevWsxMFhfxYvDV5SA==
X-Received: by 2002:a1c:9d84:: with SMTP id g126mr1898735wme.184.1587110378073; 
 Fri, 17 Apr 2020 00:59:38 -0700 (PDT)
X-Google-Smtp-Source: APiQypL7JfXhE5vFVj1kJeWaNlkc8YDs13yjfj3N/sFo8oSVy/wgjrWfOFrSOQ9Dg05aWCm/T5Fq4A==
X-Received: by 2002:a1c:9d84:: with SMTP id g126mr1898718wme.184.1587110377796; 
 Fri, 17 Apr 2020 00:59:37 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id o28sm16416939wra.84.2020.04.17.00.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 00:59:37 -0700 (PDT)
Date: Fri, 17 Apr 2020 03:59:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v9] virtio: force spec specified alignment on types
Message-ID: <20200417075551.12291-1-mst@redhat.com>
MIME-Version: 1.0
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

Note that userspace that allocates the memory is actually OK and does
not need to be fixed, but userspace that gets it from guest or another
process does need to be fixed. The later doesn't generally talk to the
kernel so while it might be buggy it's not talking to the kernel in the
buggy way - it's just using the header in the buggy way - so fixing
header and asking userspace to recompile is the best we can do.

I verified that the produced kernel binary on x86 is exactly identical
before and after the change.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

I am still not sure this is even needed. Does compiler make
optimizations based on ABI alignment assumptions?


Changes from v8:
	- better commit log
	- go back to vring in UAPI

 drivers/vhost/vhost.h            |  6 ++---
 include/uapi/linux/virtio_ring.h | 38 +++++++++++++++++++++++---------
 2 files changed, 31 insertions(+), 13 deletions(-)

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
diff --git a/include/uapi/linux/virtio_ring.h b/include/uapi/linux/virtio_ring.h
index 9223c3a5c46a..177227f0d9cd 100644
--- a/include/uapi/linux/virtio_ring.h
+++ b/include/uapi/linux/virtio_ring.h
@@ -118,16 +118,6 @@ struct vring_used {
 	struct vring_used_elem ring[];
 };
 
-struct vring {
-	unsigned int num;
-
-	struct vring_desc *desc;
-
-	struct vring_avail *avail;
-
-	struct vring_used *used;
-};
-
 /* Alignment requirements for vring elements.
  * When using pre-virtio 1.0 layout, these fall out naturally.
  */
@@ -135,6 +125,34 @@ struct vring {
 #define VRING_USED_ALIGN_SIZE 4
 #define VRING_DESC_ALIGN_SIZE 16
 
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
+struct vring {
+	unsigned int num;
+
+	vring_desc_t *desc;
+
+	vring_avail_t *avail;
+
+	vring_used_t *used;
+};
+
 #ifndef VIRTIO_RING_NO_LEGACY
 
 /* The standard layout for the ring is a continuous chunk of memory which looks
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
