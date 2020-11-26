Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD542C575F
	for <lists.virtualization@lfdr.de>; Thu, 26 Nov 2020 15:50:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 27D69878CF;
	Thu, 26 Nov 2020 14:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9+bhdNuDazNA; Thu, 26 Nov 2020 14:50:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 73E21878CC;
	Thu, 26 Nov 2020 14:50:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 507C9C0052;
	Thu, 26 Nov 2020 14:50:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC95EC0052
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 94F37878C2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yAvbkKbJQAxm
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:50:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8ECD0878C4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606402245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgeOvdyIExWUoyLX31++F3PhFzZaDc7ReaHXAYKQi0E=;
 b=TpJ4/KNBCl/idNC6c9IfCbmFihIgZcsdiPBDq3Kzkz/ZzKFSE1Z01AK2UTiObLjYtI2jby
 /+6b3bRT2LlrblsQQHbJTmH1l+8/NiY7Ms8Avu24FPKqv5qky4+kvQwjptHZs3c/c1Ttw+
 srwjPz1KvLpHN6OAr9ZuYkkfexlg2qE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-KtY14Q4pPNeDm9PhnlYJUg-1; Thu, 26 Nov 2020 09:50:43 -0500
X-MC-Unique: KtY14Q4pPNeDm9PhnlYJUg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4C51805BFA;
 Thu, 26 Nov 2020 14:50:41 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-252.ams2.redhat.com
 [10.36.113.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19F1B5C1BD;
 Thu, 26 Nov 2020 14:50:39 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v2 07/17] vdpa_sim: add device id field in vdpasim_dev_attr
Date: Thu, 26 Nov 2020 15:49:40 +0100
Message-Id: <20201126144950.92850-8-sgarzare@redhat.com>
In-Reply-To: <20201126144950.92850-1-sgarzare@redhat.com>
References: <20201126144950.92850-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Remove VDPASIM_DEVICE_ID macro and add 'id' field in vdpasim_dev_attr,
that will be returned by vdpasim_get_device_id().

Use VIRTIO_ID_NET for vDPA-net simulator device id.

Co-developed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index f98262add0e1..393b54a9f0e4 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -44,7 +44,6 @@ struct vdpasim_virtqueue {
 
 #define VDPASIM_QUEUE_ALIGN PAGE_SIZE
 #define VDPASIM_QUEUE_MAX 256
-#define VDPASIM_DEVICE_ID 0x1
 #define VDPASIM_VENDOR_ID 0
 #define VDPASIM_IOTLB_LIMIT 0 /* unlimited */
 #define VDPASIM_VQ_NUM 0x2
@@ -57,6 +56,7 @@ static u64 vdpasim_features = (1ULL << VIRTIO_F_ANY_LAYOUT) |
 
 struct vdpasim_dev_attr {
 	int nvqs;
+	u32 id;
 };
 
 /* State of each vdpasim device */
@@ -536,7 +536,9 @@ static u16 vdpasim_get_vq_num_max(struct vdpa_device *vdpa)
 
 static u32 vdpasim_get_device_id(struct vdpa_device *vdpa)
 {
-	return VDPASIM_DEVICE_ID;
+	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
+
+	return vdpasim->dev_attr.id;
 }
 
 static u32 vdpasim_get_vendor_id(struct vdpa_device *vdpa)
@@ -719,6 +721,7 @@ static int __init vdpasim_dev_init(void)
 {
 	struct vdpasim_dev_attr dev_attr = {};
 
+	dev_attr.id = VIRTIO_ID_NET;
 	dev_attr.nvqs = VDPASIM_VQ_NUM;
 
 	vdpasim_dev = vdpasim_create(&dev_attr);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
