Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FD133C203
	for <lists.virtualization@lfdr.de>; Mon, 15 Mar 2021 17:35:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CABF483DE;
	Mon, 15 Mar 2021 16:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id omawTq3ACnHq; Mon, 15 Mar 2021 16:35:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB62D4B59B;
	Mon, 15 Mar 2021 16:35:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76A7CC0001;
	Mon, 15 Mar 2021 16:35:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 519A7C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38162831DA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4xNUVVxFBWfx
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:35:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CBBB831A5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615826109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jsUZUVCSRh1NO+z5Pe9JP5OUAGHMXds3G/W6I3hhmIQ=;
 b=eoU14Ic8NxYi2VydyJVzvw/+0Y/lqP+zmJCIof+YmMm+SMM9+qJq75WnwHJ02L4WS8tTIh
 gG+wLfkRLXG33dMPfhdc8QjSqcfSHgbze5KpYu7QuIbGwUZlW1aDOWvc3/p+yZd97/R37y
 cgqnSVUvyupuqwAtEKOvNN0A372guAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-3TexvZA8O3SDA0bpXWHjLw-1; Mon, 15 Mar 2021 12:35:07 -0400
X-MC-Unique: 3TexvZA8O3SDA0bpXWHjLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54014100C667;
 Mon, 15 Mar 2021 16:35:05 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-114-1.ams2.redhat.com [10.36.114.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F14331F43D;
 Mon, 15 Mar 2021 16:35:02 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v4 02/14] vringh: add 'iotlb_lock' to synchronize iotlb
 accesses
Date: Mon, 15 Mar 2021 17:34:38 +0100
Message-Id: <20210315163450.254396-3-sgarzare@redhat.com>
In-Reply-To: <20210315163450.254396-1-sgarzare@redhat.com>
References: <20210315163450.254396-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xie Yongji <xieyongji@bytedance.com>, Stefan Hajnoczi <stefanha@redhat.com>
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

Usually iotlb accesses are synchronized with a spinlock.
Let's request it as a new parameter in vringh_set_iotlb() and
hold it when we navigate the iotlb in iotlb_translate() to avoid
race conditions with any new additions/deletions of ranges from
the ioltb.

Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/linux/vringh.h           | 6 +++++-
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 3 ++-
 drivers/vhost/vringh.c           | 9 ++++++++-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/linux/vringh.h b/include/linux/vringh.h
index 59bd50f99291..9c077863c8f6 100644
--- a/include/linux/vringh.h
+++ b/include/linux/vringh.h
@@ -46,6 +46,9 @@ struct vringh {
 	/* IOTLB for this vring */
 	struct vhost_iotlb *iotlb;
 
+	/* spinlock to synchronize IOTLB accesses */
+	spinlock_t *iotlb_lock;
+
 	/* The function to call to notify the guest about added buffers */
 	void (*notify)(struct vringh *);
 };
@@ -258,7 +261,8 @@ static inline __virtio64 cpu_to_vringh64(const struct vringh *vrh, u64 val)
 
 #if IS_REACHABLE(CONFIG_VHOST_IOTLB)
 
-void vringh_set_iotlb(struct vringh *vrh, struct vhost_iotlb *iotlb);
+void vringh_set_iotlb(struct vringh *vrh, struct vhost_iotlb *iotlb,
+		      spinlock_t *iotlb_lock);
 
 int vringh_init_iotlb(struct vringh *vrh, u64 features,
 		      unsigned int num, bool weak_barriers,
diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index fc2ec9599753..a92c08880098 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -284,7 +284,8 @@ struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr)
 		goto err_iommu;
 
 	for (i = 0; i < dev_attr->nvqs; i++)
-		vringh_set_iotlb(&vdpasim->vqs[i].vring, vdpasim->iommu);
+		vringh_set_iotlb(&vdpasim->vqs[i].vring, vdpasim->iommu,
+				 &vdpasim->iommu_lock);
 
 	ret = iova_cache_get();
 	if (ret)
diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index 85d85faba058..f68122705719 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -1074,6 +1074,8 @@ static int iotlb_translate(const struct vringh *vrh,
 	int ret = 0;
 	u64 s = 0;
 
+	spin_lock(vrh->iotlb_lock);
+
 	while (len > s) {
 		u64 size, pa, pfn;
 
@@ -1103,6 +1105,8 @@ static int iotlb_translate(const struct vringh *vrh,
 		++ret;
 	}
 
+	spin_unlock(vrh->iotlb_lock);
+
 	return ret;
 }
 
@@ -1262,10 +1266,13 @@ EXPORT_SYMBOL(vringh_init_iotlb);
  * vringh_set_iotlb - initialize a vringh for a ring with IOTLB.
  * @vrh: the vring
  * @iotlb: iotlb associated with this vring
+ * @iotlb_lock: spinlock to synchronize the iotlb accesses
  */
-void vringh_set_iotlb(struct vringh *vrh, struct vhost_iotlb *iotlb)
+void vringh_set_iotlb(struct vringh *vrh, struct vhost_iotlb *iotlb,
+		      spinlock_t *iotlb_lock)
 {
 	vrh->iotlb = iotlb;
+	vrh->iotlb_lock = iotlb_lock;
 }
 EXPORT_SYMBOL(vringh_set_iotlb);
 
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
