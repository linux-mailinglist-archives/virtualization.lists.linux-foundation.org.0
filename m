Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EC80C30F97B
	for <lists.virtualization@lfdr.de>; Thu,  4 Feb 2021 18:22:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 64BEB86652;
	Thu,  4 Feb 2021 17:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VeZKpid11HYp; Thu,  4 Feb 2021 17:22:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B6AA866C4;
	Thu,  4 Feb 2021 17:22:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E61FC013A;
	Thu,  4 Feb 2021 17:22:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2C22C013A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B43F227A49
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ubyTpJE8+hRc
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:22:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 8F291275B0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o3uKySNVlPtFnZUr4id2X1iOfL1gG+jTT4Q7ufovkZI=;
 b=PCZb0yNLFG+9421oAH05oQefsrkZU7VoSJKk+NCKi7tgDbhlalL6EV0fuvYEPehhMta5Fv
 7yoviuLPf5ZaiXzyohn4QFWrsYp14VVvSHCgNfBC7Ba6BfrUMeYHi/uYkHu0k8I82ReW2W
 +vjxxnDhZpUlK4O9io/ukMDkzyx/JKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-wEAy_4raMMifjWApUgkh7Q-1; Thu, 04 Feb 2021 12:22:46 -0500
X-MC-Unique: wEAy_4raMMifjWApUgkh7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E73A4196632A;
 Thu,  4 Feb 2021 17:22:44 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-213.ams2.redhat.com
 [10.36.113.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6B9219709;
 Thu,  4 Feb 2021 17:22:42 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v3 02/13] vringh: add 'iotlb_lock' to synchronize iotlb
 accesses
Date: Thu,  4 Feb 2021 18:22:19 +0100
Message-Id: <20210204172230.85853-3-sgarzare@redhat.com>
In-Reply-To: <20210204172230.85853-1-sgarzare@redhat.com>
References: <20210204172230.85853-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, Xie Yongji <xieyongji@bytedance.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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
index 2183a833fcf4..53238989713d 100644
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
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
