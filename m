Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4297E2C5769
	for <lists.virtualization@lfdr.de>; Thu, 26 Nov 2020 15:52:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E79AE877DD;
	Thu, 26 Nov 2020 14:52:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8HgW6vWz-arL; Thu, 26 Nov 2020 14:52:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 80C07877E1;
	Thu, 26 Nov 2020 14:52:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CAFCC0052;
	Thu, 26 Nov 2020 14:52:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0070C1D9F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D589D2E242
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qy28hRImuCJF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:52:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id B5D692E243
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606402320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yd5o1ZhT6n3IllGPM9QevybiC1ZAZ/hson6rMvA9R3Y=;
 b=J+tA97uL+uV21kizknVIkGjhr0tQF7ulLU4oV/wOXmF4cZdjo4XH2FB7jkZza4JZbVpWjN
 kzmQJ14suG0plylaxYcJJTOJNTvmAnP0AdsrEiopPsHZgcNfBNpkA7XJrsWoy3KCTaxxVq
 RQoyY4xq44i/aiSkerzoLeICEtKfy10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-PX7VQgOZO52-vMZDb_ZqFg-1; Thu, 26 Nov 2020 09:51:56 -0500
X-MC-Unique: PX7VQgOZO52-vMZDb_ZqFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D87E1E7DB;
 Thu, 26 Nov 2020 14:51:55 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-252.ams2.redhat.com
 [10.36.113.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7673E60855;
 Thu, 26 Nov 2020 14:51:53 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v2 14/17] vdpa_sim: use kvmalloc to allocate vdpasim->buffer
Date: Thu, 26 Nov 2020 15:49:47 +0100
Message-Id: <20201126144950.92850-15-sgarzare@redhat.com>
In-Reply-To: <20201126144950.92850-1-sgarzare@redhat.com>
References: <20201126144950.92850-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <elic@nvidia.com>
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

The next patch will make the buffer size configurable from each
device.
Since the buffer could be larger than a page, we use kvmalloc()
instead of kmalloc().

Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 4327efd6d41e..3bcf622949c8 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -405,7 +405,7 @@ static struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr)
 	if (!vdpasim->iommu)
 		goto err_iommu;
 
-	vdpasim->buffer = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	vdpasim->buffer = kvmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!vdpasim->buffer)
 		goto err_iommu;
 
@@ -686,7 +686,7 @@ static void vdpasim_free(struct vdpa_device *vdpa)
 	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
 
 	cancel_work_sync(&vdpasim->work);
-	kfree(vdpasim->buffer);
+	kvfree(vdpasim->buffer);
 	if (vdpasim->iommu)
 		vhost_iotlb_free(vdpasim->iommu);
 	kfree(vdpasim->vqs);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
