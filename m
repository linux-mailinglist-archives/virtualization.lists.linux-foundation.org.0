Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C12E42DAF33
	for <lists.virtualization@lfdr.de>; Tue, 15 Dec 2020 15:44:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 73C8F87273;
	Tue, 15 Dec 2020 14:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9zjZGsXP4286; Tue, 15 Dec 2020 14:44:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B787871F4;
	Tue, 15 Dec 2020 14:44:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7AEA4C0893;
	Tue, 15 Dec 2020 14:44:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EEA4C013B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Dec 2020 14:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0AFED848D5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Dec 2020 14:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eBX12BrSHvZe
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Dec 2020 14:44:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C5805848ED
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Dec 2020 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608043473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4MVer4AY7D1InAp6Yf5ndbR/fungElNkshm4qVmMcTU=;
 b=IcZzNHJcPfWtiEmM7Iuof8a158aITWmkmwIubL7p6fxv4WPWvimoQyZ++A38dVinqPK7ey
 pWKVO1bUiiWq6OCaxvx76/m8AbbcAYkDa09+G9tU/X+YIaTLVVLG3LH37c0ioO/ObfYIVZ
 gH2M/L0CaqYC4XHx7+INOO/GByVbgpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-qlhpFPY_P_WcPUTp59rrkQ-1; Tue, 15 Dec 2020 09:44:30 -0500
X-MC-Unique: qlhpFPY_P_WcPUTp59rrkQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 896681842140;
 Tue, 15 Dec 2020 14:44:29 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-115-49.ams2.redhat.com
 [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A94C110013C1;
 Tue, 15 Dec 2020 14:44:26 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v4 09/18] vdpa_sim: add work_fn in vdpasim_dev_attr
Date: Tue, 15 Dec 2020 15:42:47 +0100
Message-Id: <20201215144256.155342-10-sgarzare@redhat.com>
In-Reply-To: <20201215144256.155342-1-sgarzare@redhat.com>
References: <20201215144256.155342-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Shahaf Shuler <shahafs@nvidia.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <elic@nvidia.com>,
 Oren Duer <oren@nvidia.com>
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

Rename vdpasim_work() in vdpasim_net_work() and add it to
the vdpasim_dev_attr structure.

Co-developed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 6cf3c78b0e33..d356929f9dd3 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -70,6 +70,8 @@ struct vdpasim_dev_attr {
 	u64 supported_features;
 	int nvqs;
 	u32 id;
+
+	work_func_t work_fn;
 };
 
 /* State of each vdpasim device */
@@ -163,7 +165,7 @@ static void vdpasim_reset(struct vdpasim *vdpasim)
 	++vdpasim->generation;
 }
 
-static void vdpasim_work(struct work_struct *work)
+static void vdpasim_net_work(struct work_struct *work)
 {
 	struct vdpasim *vdpasim = container_of(work, struct
 						 vdpasim, work);
@@ -370,7 +372,7 @@ static struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr)
 		goto err_alloc;
 
 	vdpasim->dev_attr = *dev_attr;
-	INIT_WORK(&vdpasim->work, vdpasim_work);
+	INIT_WORK(&vdpasim->work, dev_attr->work_fn);
 	spin_lock_init(&vdpasim->lock);
 	spin_lock_init(&vdpasim->iommu_lock);
 
@@ -740,6 +742,7 @@ static int __init vdpasim_dev_init(void)
 	dev_attr.id = VIRTIO_ID_NET;
 	dev_attr.supported_features = VDPASIM_NET_FEATURES;
 	dev_attr.nvqs = VDPASIM_VQ_NUM;
+	dev_attr.work_fn = vdpasim_net_work;
 
 	vdpasim_dev = vdpasim_create(&dev_attr);
 
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
