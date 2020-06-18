Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EAE1FEB31
	for <lists.virtualization@lfdr.de>; Thu, 18 Jun 2020 07:58:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6488A2036C;
	Thu, 18 Jun 2020 05:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BvQwdHIzme6s; Thu, 18 Jun 2020 05:58:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9342420363;
	Thu, 18 Jun 2020 05:58:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56144C016E;
	Thu, 18 Jun 2020 05:58:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C416C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 43B6F20381
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TaNxmHYAAwgl
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:58:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 001F620134
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592459890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66Vpss/6YgMjhx6vRTetvURGgEhsE7DPQ/griSAiEc8=;
 b=FMBvRzv1eo0TKIk8/WkazJXru6XuJPtYYigMVyO/oJPkE14at8I1a7N1tNaeJ+Q+XKouTd
 iP3i+AbxvvkqibdZUMa4btP880fjX4PkXOFEHbI74Amd5kdRfX13exxW3YAYIo2c1oxpSJ
 VZUjBlCOG5jqdyHdAuKB0SMEtZuYTCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-W6CER-1KOi-h0D4f-wS0AQ-1; Thu, 18 Jun 2020 01:58:04 -0400
X-MC-Unique: W6CER-1KOi-h0D4f-wS0AQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 664491902EA2;
 Thu, 18 Jun 2020 05:58:02 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-219.pek2.redhat.com [10.72.13.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC88D5C1D6;
 Thu, 18 Jun 2020 05:57:53 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 4/5] vhost-vdpa: support IOTLB batching hints
Date: Thu, 18 Jun 2020 13:56:25 +0800
Message-Id: <20200618055626.25660-5-jasowang@redhat.com>
In-Reply-To: <20200618055626.25660-1-jasowang@redhat.com>
References: <20200618055626.25660-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: shahafs@mellanox.com, lulu@redhat.com, saugatm@xilinx.com,
 mhabets@solarflare.com, vmireyno@marvell.com, gdawar@xilinx.com,
 eperezma@redhat.com, hanand@xilinx.com, zhangweining@ruijie.com.cn,
 eli@mellanox.com, lingshan.zhu@intel.com, rob.miller@broadcom.com
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

This patches extend the vhost IOTLB API to accept batch updating hints
form userspace. When userspace wants update the device IOTLB in a
batch, it may do:

1) Write vhost_iotlb_msg with VHOST_IOTLB_BATCH_BEGIN flag
2) Perform a batch of IOTLB updating via VHOST_IOTLB_UPDATE/INVALIDATE
3) Write vhost_iotlb_msg with VHOST_IOTLB_BATCH_END flag

Vhost-vdpa may decide to batch the IOMMU/IOTLB updating in step 3 when
vDPA device support set_map() ops. This is useful for the vDPA device
that want to know all the mappings to tweak their own DMA translation
logic.

For vDPA device that doesn't require set_map(), no behavior changes.

This capability is advertised via VHOST_BACKEND_F_IOTLB_BATCH capability.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/vdpa.c             | 30 +++++++++++++++++++++++-------
 include/uapi/linux/vhost.h       |  2 ++
 include/uapi/linux/vhost_types.h |  7 +++++++
 3 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 453057421f80..8f624bbafee7 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -56,7 +56,9 @@ enum {
 };
 
 enum {
-	VHOST_VDPA_BACKEND_FEATURES = (1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2)
+	VHOST_VDPA_BACKEND_FEATURES =
+	(1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2) |
+	(1ULL << VHOST_BACKEND_F_IOTLB_BATCH),
 };
 
 /* Currently, only network backend w/o multiqueue is supported. */
@@ -77,6 +79,7 @@ struct vhost_vdpa {
 	int virtio_id;
 	int minor;
 	struct eventfd_ctx *config_ctx;
+	int in_batch;
 };
 
 static DEFINE_IDA(vhost_vdpa_ida);
@@ -125,6 +128,7 @@ static void vhost_vdpa_reset(struct vhost_vdpa *v)
 	const struct vdpa_config_ops *ops = vdpa->config;
 
 	ops->set_status(vdpa, 0);
+	v->in_batch = 0;
 }
 
 static long vhost_vdpa_get_device_id(struct vhost_vdpa *v, u8 __user *argp)
@@ -540,9 +544,10 @@ static int vhost_vdpa_map(struct vhost_vdpa *v,
 
 	if (ops->dma_map)
 		r = ops->dma_map(vdpa, iova, size, pa, perm);
-	else if (ops->set_map)
-		r = ops->set_map(vdpa, dev->iotlb);
-	else
+	else if (ops->set_map) {
+		if (!v->in_batch)
+			r = ops->set_map(vdpa, dev->iotlb);
+	} else
 		r = iommu_map(v->domain, iova, pa, size,
 			      perm_to_iommu_flags(perm));
 
@@ -559,9 +564,10 @@ static void vhost_vdpa_unmap(struct vhost_vdpa *v, u64 iova, u64 size)
 
 	if (ops->dma_map)
 		ops->dma_unmap(vdpa, iova, size);
-	else if (ops->set_map)
-		ops->set_map(vdpa, dev->iotlb);
-	else
+	else if (ops->set_map) {
+		if (!v->in_batch)
+			ops->set_map(vdpa, dev->iotlb);
+	} else
 		iommu_unmap(v->domain, iova, size);
 }
 
@@ -655,6 +661,8 @@ static int vhost_vdpa_process_iotlb_msg(struct vhost_dev *dev,
 					struct vhost_iotlb_msg *msg)
 {
 	struct vhost_vdpa *v = container_of(dev, struct vhost_vdpa, vdev);
+	struct vdpa_device *vdpa = v->vdpa;
+	const struct vdpa_config_ops *ops = vdpa->config;
 	int r = 0;
 
 	r = vhost_dev_check_owner(dev);
@@ -668,6 +676,14 @@ static int vhost_vdpa_process_iotlb_msg(struct vhost_dev *dev,
 	case VHOST_IOTLB_INVALIDATE:
 		vhost_vdpa_unmap(v, msg->iova, msg->size);
 		break;
+	case VHOST_IOTLB_BATCH_BEGIN:
+		v->in_batch = true;
+		break;
+	case VHOST_IOTLB_BATCH_END:
+		if (v->in_batch && ops->set_map)
+			ops->set_map(vdpa, dev->iotlb);
+		v->in_batch = false;
+		break;
 	default:
 		r = -EINVAL;
 		break;
diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
index 0c2349612e77..565da96f55d5 100644
--- a/include/uapi/linux/vhost.h
+++ b/include/uapi/linux/vhost.h
@@ -91,6 +91,8 @@
 
 /* Use message type V2 */
 #define VHOST_BACKEND_F_IOTLB_MSG_V2 0x1
+/* IOTLB can accpet batching hints */
+#define VHOST_BACKEND_F_IOTLB_BATCH  0x2
 
 #define VHOST_SET_BACKEND_FEATURES _IOW(VHOST_VIRTIO, 0x25, __u64)
 #define VHOST_GET_BACKEND_FEATURES _IOR(VHOST_VIRTIO, 0x26, __u64)
diff --git a/include/uapi/linux/vhost_types.h b/include/uapi/linux/vhost_types.h
index 669457ce5c48..5c12faffdde9 100644
--- a/include/uapi/linux/vhost_types.h
+++ b/include/uapi/linux/vhost_types.h
@@ -60,6 +60,13 @@ struct vhost_iotlb_msg {
 #define VHOST_IOTLB_UPDATE         2
 #define VHOST_IOTLB_INVALIDATE     3
 #define VHOST_IOTLB_ACCESS_FAIL    4
+/* VHOST_IOTLB_BATCH_BEGIN is a hint that userspace will update
+ * several mappings afterwards. VHOST_IOTLB_BATCH_END is a hint that
+ * userspace had finished the mapping updating. When those two flags
+ * were set, kernel will ignore the rest fileds of the IOTLB message.
+ */
+#define VHOST_IOTLB_BATCH_BEGIN    5
+#define VHOST_IOTLB_BATCH_END      6
 	__u8 type;
 };
 
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
