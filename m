Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 782CF2766E3
	for <lists.virtualization@lfdr.de>; Thu, 24 Sep 2020 05:22:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2AF8C84103;
	Thu, 24 Sep 2020 03:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yw4YrrE+M1xi; Thu, 24 Sep 2020 03:22:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 137F086AD7;
	Thu, 24 Sep 2020 03:22:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E726EC0889;
	Thu, 24 Sep 2020 03:22:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B171FC0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 03:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A12B6862BC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 03:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id irtGBM5gm88J
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 03:22:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D00868679E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 03:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600917758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQQgZh+gmoXmevwc83LrqfZS2uZOmcneMxMvJmUeEy4=;
 b=OQL5ciV1MUoQ99mp0/MWdUcAVKbdFt+xDLZx0VbjKWI9TJRW6iFc5AcKdLVIlBwa308jMg
 ChjMTPL3DCD+sHCrvYYr/8vceaDP7AOchtzCON2hrsxn1Aw8akSDovJOZM2m9mDWCToceq
 yzeXYdcLLdhwJP5VJp+L83TB/07x5rE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-AmEEzgldPdWN3B4wDLZIfg-1; Wed, 23 Sep 2020 23:22:36 -0400
X-MC-Unique: AmEEzgldPdWN3B4wDLZIfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C804807352;
 Thu, 24 Sep 2020 03:22:35 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-193.pek2.redhat.com [10.72.13.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77B6355768;
 Thu, 24 Sep 2020 03:22:29 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [RFC PATCH 05/24] vhost-vdpa: passing iotlb to IOMMU mapping helpers
Date: Thu, 24 Sep 2020 11:21:06 +0800
Message-Id: <20200924032125.18619-6-jasowang@redhat.com>
In-Reply-To: <20200924032125.18619-1-jasowang@redhat.com>
References: <20200924032125.18619-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: lulu@redhat.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 mhabets@solarflare.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, stefanha@redhat.com, eli@mellanox.com,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com, rob.miller@broadcom.com
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

To prepare for the ASID support for vhost-vdpa, try to pass IOTLB
object to dma helpers.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/vdpa.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 9c641274b9f3..74bef1c15a70 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -489,10 +489,11 @@ static long vhost_vdpa_unlocked_ioctl(struct file *filep,
 	return r;
 }
 
-static void vhost_vdpa_iotlb_unmap(struct vhost_vdpa *v, u64 start, u64 last)
+static void vhost_vdpa_iotlb_unmap(struct vhost_vdpa *v,
+				   struct vhost_iotlb *iotlb,
+				   u64 start, u64 last)
 {
 	struct vhost_dev *dev = &v->vdev;
-	struct vhost_iotlb *iotlb = dev->iotlb;
 	struct vhost_iotlb_map *map;
 	struct page *page;
 	unsigned long pfn, pinned;
@@ -514,8 +515,9 @@ static void vhost_vdpa_iotlb_unmap(struct vhost_vdpa *v, u64 start, u64 last)
 static void vhost_vdpa_iotlb_free(struct vhost_vdpa *v)
 {
 	struct vhost_dev *dev = &v->vdev;
+	struct vhost_iotlb *iotlb = dev->iotlb;
 
-	vhost_vdpa_iotlb_unmap(v, 0ULL, 0ULL - 1);
+	vhost_vdpa_iotlb_unmap(v, iotlb, 0ULL, 0ULL - 1);
 	kfree(dev->iotlb);
 	dev->iotlb = NULL;
 }
@@ -542,15 +544,14 @@ static int perm_to_iommu_flags(u32 perm)
 	return flags | IOMMU_CACHE;
 }
 
-static int vhost_vdpa_map(struct vhost_vdpa *v,
+static int vhost_vdpa_map(struct vhost_vdpa *v, struct vhost_iotlb *iotlb,
 			  u64 iova, u64 size, u64 pa, u32 perm)
 {
-	struct vhost_dev *dev = &v->vdev;
 	struct vdpa_device *vdpa = v->vdpa;
 	const struct vdpa_config_ops *ops = vdpa->config;
 	int r = 0;
 
-	r = vhost_iotlb_add_range(dev->iotlb, iova, iova + size - 1,
+	r = vhost_iotlb_add_range(iotlb, iova, iova + size - 1,
 				  pa, perm);
 	if (r)
 		return r;
@@ -559,7 +560,7 @@ static int vhost_vdpa_map(struct vhost_vdpa *v,
 		r = ops->dma_map(vdpa, iova, size, pa, perm);
 	} else if (ops->set_map) {
 		if (!v->in_batch)
-			r = ops->set_map(vdpa, dev->iotlb);
+			r = ops->set_map(vdpa, iotlb);
 	} else {
 		r = iommu_map(v->domain, iova, pa, size,
 			      perm_to_iommu_flags(perm));
@@ -568,29 +569,30 @@ static int vhost_vdpa_map(struct vhost_vdpa *v,
 	return r;
 }
 
-static void vhost_vdpa_unmap(struct vhost_vdpa *v, u64 iova, u64 size)
+static void vhost_vdpa_unmap(struct vhost_vdpa *v,
+			     struct vhost_iotlb *iotlb,
+			     u64 iova, u64 size)
 {
-	struct vhost_dev *dev = &v->vdev;
 	struct vdpa_device *vdpa = v->vdpa;
 	const struct vdpa_config_ops *ops = vdpa->config;
 
-	vhost_vdpa_iotlb_unmap(v, iova, iova + size - 1);
+	vhost_vdpa_iotlb_unmap(v, iotlb, iova, iova + size - 1);
 
 	if (ops->dma_map) {
 		ops->dma_unmap(vdpa, iova, size);
 	} else if (ops->set_map) {
 		if (!v->in_batch)
-			ops->set_map(vdpa, dev->iotlb);
+			ops->set_map(vdpa, iotlb);
 	} else {
 		iommu_unmap(v->domain, iova, size);
 	}
 }
 
 static int vhost_vdpa_process_iotlb_update(struct vhost_vdpa *v,
+					   struct vhost_iotlb *iotlb,
 					   struct vhost_iotlb_msg *msg)
 {
 	struct vhost_dev *dev = &v->vdev;
-	struct vhost_iotlb *iotlb = dev->iotlb;
 	struct page **page_list;
 	unsigned long list_size = PAGE_SIZE / sizeof(struct page *);
 	unsigned int gup_flags = FOLL_LONGTERM;
@@ -644,7 +646,7 @@ static int vhost_vdpa_process_iotlb_update(struct vhost_vdpa *v,
 			if (last_pfn && (this_pfn != last_pfn + 1)) {
 				/* Pin a contiguous chunk of memory */
 				csize = (last_pfn - map_pfn + 1) << PAGE_SHIFT;
-				if (vhost_vdpa_map(v, iova, csize,
+				if (vhost_vdpa_map(v, iotlb, iova, csize,
 						   map_pfn << PAGE_SHIFT,
 						   msg->perm))
 					goto out;
@@ -660,11 +662,12 @@ static int vhost_vdpa_process_iotlb_update(struct vhost_vdpa *v,
 	}
 
 	/* Pin the rest chunk */
-	ret = vhost_vdpa_map(v, iova, (last_pfn - map_pfn + 1) << PAGE_SHIFT,
+	ret = vhost_vdpa_map(v, iotlb, iova,
+			     (last_pfn - map_pfn + 1) << PAGE_SHIFT,
 			     map_pfn << PAGE_SHIFT, msg->perm);
 out:
 	if (ret) {
-		vhost_vdpa_unmap(v, msg->iova, msg->size);
+		vhost_vdpa_unmap(v, iotlb, msg->iova, msg->size);
 		atomic64_sub(npages, &dev->mm->pinned_vm);
 	}
 	mmap_read_unlock(dev->mm);
@@ -678,6 +681,7 @@ static int vhost_vdpa_process_iotlb_msg(struct vhost_dev *dev,
 	struct vhost_vdpa *v = container_of(dev, struct vhost_vdpa, vdev);
 	struct vdpa_device *vdpa = v->vdpa;
 	const struct vdpa_config_ops *ops = vdpa->config;
+	struct vhost_iotlb *iotlb = dev->iotlb;
 	int r = 0;
 
 	r = vhost_dev_check_owner(dev);
@@ -686,17 +690,17 @@ static int vhost_vdpa_process_iotlb_msg(struct vhost_dev *dev,
 
 	switch (msg->type) {
 	case VHOST_IOTLB_UPDATE:
-		r = vhost_vdpa_process_iotlb_update(v, msg);
+		r = vhost_vdpa_process_iotlb_update(v, iotlb, msg);
 		break;
 	case VHOST_IOTLB_INVALIDATE:
-		vhost_vdpa_unmap(v, msg->iova, msg->size);
+		vhost_vdpa_unmap(v, iotlb, msg->iova, msg->size);
 		break;
 	case VHOST_IOTLB_BATCH_BEGIN:
 		v->in_batch = true;
 		break;
 	case VHOST_IOTLB_BATCH_END:
 		if (v->in_batch && ops->set_map)
-			ops->set_map(vdpa, dev->iotlb);
+			ops->set_map(vdpa, iotlb);
 		v->in_batch = false;
 		break;
 	default:
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
