Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B9865EA
	for <lists.virtualization@lfdr.de>; Thu,  8 Aug 2019 17:35:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 60620111B;
	Thu,  8 Aug 2019 15:35:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 73FF8FF0
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 15:35:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 742C589D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 15:35:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D92C560171;
	Thu,  8 Aug 2019 15:35:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
	[10.36.116.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F4A1600C8;
	Thu,  8 Aug 2019 15:34:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 341EB16E08; Thu,  8 Aug 2019 17:34:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: use virtio_max_dma_size
Date: Thu,  8 Aug 2019 17:34:45 +0200
Message-Id: <20190808153445.27177-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 08 Aug 2019 15:35:01 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>, "open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

We must make sure our scatterlist segments are not too big, otherwise
we might see swiotlb failures (happens with sev, also reproducable with
swiotlb=force).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index b2da31310d24..6e44568813dd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -204,6 +204,7 @@ int virtio_gpu_object_get_sg_table(struct virtio_gpu_device *qdev,
 		.interruptible = false,
 		.no_wait_gpu = false
 	};
+	unsigned max_segment;
 
 	/* wtf swapping */
 	if (bo->pages)
@@ -215,8 +216,13 @@ int virtio_gpu_object_get_sg_table(struct virtio_gpu_device *qdev,
 	if (!bo->pages)
 		goto out;
 
-	ret = sg_alloc_table_from_pages(bo->pages, pages, nr_pages, 0,
-					nr_pages << PAGE_SHIFT, GFP_KERNEL);
+	max_segment = virtio_max_dma_size(qdev->vdev);
+	max_segment &= ~(size_t)(PAGE_SIZE - 1);
+	if (max_segment > SCATTERLIST_MAX_SEGMENT)
+		max_segment = SCATTERLIST_MAX_SEGMENT;
+	ret = __sg_alloc_table_from_pages(bo->pages, pages, nr_pages, 0,
+					  nr_pages << PAGE_SHIFT,
+					  max_segment, GFP_KERNEL);
 	if (ret)
 		goto out;
 	return 0;
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
