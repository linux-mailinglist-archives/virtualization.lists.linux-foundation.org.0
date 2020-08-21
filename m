Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4461724D172
	for <lists.virtualization@lfdr.de>; Fri, 21 Aug 2020 11:28:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 038D485F66;
	Fri, 21 Aug 2020 09:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IMEH8AeMvVEm; Fri, 21 Aug 2020 09:28:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 96E9685C63;
	Fri, 21 Aug 2020 09:28:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BF36C0051;
	Fri, 21 Aug 2020 09:28:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C50AC0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 09:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8627288614
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 09:28:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tl7xrx8-CR39
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 09:28:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CD21688611
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 09:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598002115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=EfuSz9sq7bu7KMXpjENGk8A6GgtVjh1dqr2JFHwc5Pc=;
 b=QICOO7Y8bdcyxNArkUgdjc1iP0fBHdF2S/2JP96kjTD6EKeis30OY2ZzQlf9i+2pHUaMdN
 Q7HyqhXe9uxM5GwMRX5pGUzBdy0uuzvuHyVFzuL5hFeSuI3Vrnt69EV7BKNrpCbnYU7zlP
 i0WNuhbu2OZnGEHkECrMDROrytiU+n4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-lOsv2HXYPVScwGHlISun5A-1; Fri, 21 Aug 2020 05:28:30 -0400
X-MC-Unique: lOsv2HXYPVScwGHlISun5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0AC6100CF71;
 Fri, 21 Aug 2020 09:28:28 +0000 (UTC)
Received: from hp-dl380pg8-01.lab.eng.pek2.redhat.com
 (hp-dl380pg8-01.lab.eng.pek2.redhat.com [10.73.8.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5A5A71780;
 Fri, 21 Aug 2020 09:28:23 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/3] vdpa: introduce config op to get valid iova range
Date: Fri, 21 Aug 2020 05:28:11 -0400
Message-Id: <20200821092813.8952-2-jasowang@redhat.com>
In-Reply-To: <20200821092813.8952-1-jasowang@redhat.com>
References: <20200821092813.8952-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This patch introduce a config op to get valid iova range from the vDPA
device.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/linux/vdpa.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index eae0bfd87d91..30bc7a7223bb 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -52,6 +52,16 @@ struct vdpa_device {
 	int nvqs;
 };
 
+/**
+ * vDPA IOVA range - the IOVA range support by the device
+ * @first: start of the IOVA range
+ * @last: end of the IOVA range
+ */
+struct vdpa_iova_range {
+	u64 first;
+	u64 last;
+};
+
 /**
  * vDPA_config_ops - operations for configuring a vDPA device.
  * Note: vDPA device drivers are required to implement all of the
@@ -151,6 +161,10 @@ struct vdpa_device {
  * @get_generation:		Get device config generation (optional)
  *				@vdev: vdpa device
  *				Returns u32: device generation
+ * @get_iova_range:		Get supported iova range (optional)
+ *				@vdev: vdpa device
+ *				Returns the iova range supported by
+ *				the device.
  * @set_map:			Set device memory mapping (optional)
  *				Needed for device that using device
  *				specific DMA translation (on-chip IOMMU)
@@ -216,6 +230,7 @@ struct vdpa_config_ops {
 	void (*set_config)(struct vdpa_device *vdev, unsigned int offset,
 			   const void *buf, unsigned int len);
 	u32 (*get_generation)(struct vdpa_device *vdev);
+	struct vdpa_iova_range (*get_iova_range)(struct vdpa_device *vdev);
 
 	/* DMA ops */
 	int (*set_map)(struct vdpa_device *vdev, struct vhost_iotlb *iotlb);
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
