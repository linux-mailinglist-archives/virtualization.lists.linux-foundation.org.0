Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788031A33A
	for <lists.virtualization@lfdr.de>; Fri, 12 Feb 2021 18:04:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BB5448659E;
	Fri, 12 Feb 2021 17:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wSkuuBLXLkIA; Fri, 12 Feb 2021 17:04:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E444485BD5;
	Fri, 12 Feb 2021 17:04:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADDCCC013A;
	Fri, 12 Feb 2021 17:04:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D651BC013A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Feb 2021 17:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D04B585BD5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Feb 2021 17:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YiEzUX7enng0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Feb 2021 17:04:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6557F8659E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Feb 2021 17:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613149465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=muci2bFECA89B0jMNuPjwDVm80b8N6IObvOF04Qj7Xg=;
 b=O9MZKX4oe3G1eSsSd+dQ0VY1uEeeKZZNaEyqLN0bSa/AGdJcZA7TQzBta1MteRifB/6qFR
 A+USrKXzCBwIwSF1TtB8aFpPo/zz11bRJx0xIFeapeArT6ebGQbPgGon82RHzYs2qClA1r
 dnSlajuKYekCchzz0jM1pANbdUFQwRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-PCm_6tleO5CUMpRycwNyYw-1; Fri, 12 Feb 2021 12:04:20 -0500
X-MC-Unique: PCm_6tleO5CUMpRycwNyYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42AFA85B671;
 Fri, 12 Feb 2021 17:04:16 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-189.ams2.redhat.com
 [10.36.113.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4F2B19D80;
 Fri, 12 Feb 2021 17:04:14 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: [PATCH] virtio/s390: implement virtio-ccw revision 2 correctly
Date: Fri, 12 Feb 2021 18:04:11 +0100
Message-Id: <20210212170411.992217-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: linux-s390@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, Pierre Morel <pmorel@linux.ibm.com>,
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

CCW_CMD_READ_STATUS was introduced with revision 2 of virtio-ccw,
and drivers should only rely on it being implemented when they
negotiated at least that revision with the device.

However, virtio_ccw_get_status() issued READ_STATUS for any
device operating at least at revision 1. If the device accepts
READ_STATUS regardless of the negotiated revision (which it is
free to do), everything works as intended; a device rejecting the
command should also be handled gracefully. For correctness, we
should really limit the command to revision 2 or higher, though.

We also negotiated the revision to at most 1, as we never bumped
the maximum revision; let's do that now.

Fixes: 7d3ce5ab9430 ("virtio/s390: support READ_STATUS command for virtio-ccw")
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---

QEMU does not fence off READ_STATUS for revisions < 2, which is probably
why we never noticed this. I'm not aware of other hypervisors that do
fence it off, nor any that cannot deal properly with an unknown command.

Not sure whether this is stable worthy?

---
 drivers/s390/virtio/virtio_ccw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index 5730572b52cd..54e686dca6de 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -117,7 +117,7 @@ struct virtio_rev_info {
 };
 
 /* the highest virtio-ccw revision we support */
-#define VIRTIO_CCW_REV_MAX 1
+#define VIRTIO_CCW_REV_MAX 2
 
 struct virtio_ccw_vq_info {
 	struct virtqueue *vq;
@@ -952,7 +952,7 @@ static u8 virtio_ccw_get_status(struct virtio_device *vdev)
 	u8 old_status = vcdev->dma_area->status;
 	struct ccw1 *ccw;
 
-	if (vcdev->revision < 1)
+	if (vcdev->revision < 2)
 		return vcdev->dma_area->status;
 
 	ccw = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*ccw));
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
