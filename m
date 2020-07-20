Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D8A225A5D
	for <lists.virtualization@lfdr.de>; Mon, 20 Jul 2020 10:51:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8EE9E87D96;
	Mon, 20 Jul 2020 08:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xSQKw2w46FXh; Mon, 20 Jul 2020 08:51:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EA1EE87E58;
	Mon, 20 Jul 2020 08:51:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DEE71C016F;
	Mon, 20 Jul 2020 08:51:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C78A2C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 08:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B616486BD5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 08:51:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-sBsKBIv2HT
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 08:50:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 95C1C864D2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595235057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y9alvxXRA5HGHZ+mBaUFBL6krSh1l8I0iweYECqaRAI=;
 b=JwbAu9PrIH9ldzdzBukxFqWWXhSu8kAPolV4efZUzbHckIjm1E5vC0SH+UzR4y/7QzTMGu
 WU292x1FRwC4JhAJALbGhAXZi8nsqHuztetZ6mBaLAy4cMb0roRYgGG8SGulDRY1B1Bw0p
 XWA2eI54S6DuwUsfzlQ2Tn/KjJYVET8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-OjPYk_K7ONe759fJWsHSAw-1; Mon, 20 Jul 2020 04:50:53 -0400
X-MC-Unique: OjPYk_K7ONe759fJWsHSAw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 103071932480;
 Mon, 20 Jul 2020 08:50:52 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-53.pek2.redhat.com [10.72.12.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E95181001B07;
 Mon, 20 Jul 2020 08:50:45 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] vhost: vdpa: remove per device feature whitelist
Date: Mon, 20 Jul 2020 16:50:43 +0800
Message-Id: <20200720085043.16485-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: lulu@redhat.com, eli@mellanox.com
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

We used to have a per device feature whitelist to filter out the
unsupported virtio features. But this seems unnecessary since:

- the main idea behind feature whitelist is to block control vq
  feature until we finalize the control virtqueue API. But the current
  vhost-vDPA uAPI is sufficient to support control virtqueue. For
  device that has hardware control virtqueue, the vDPA device driver
  can just setup the hardware virtqueue and let userspace to use
  hardware virtqueue directly. For device that doesn't have a control
  virtqueue, the vDPA device driver need to use e.g vringh to emulate
  a software control virtqueue.
- we don't do it in virtio-vDPA driver

So remove this limitation.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/vdpa.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 77a0c9fb6cc3..f7f6ddd681ce 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -26,35 +26,6 @@
 
 #include "vhost.h"
 
-enum {
-	VHOST_VDPA_FEATURES =
-		(1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) |
-		(1ULL << VIRTIO_F_ANY_LAYOUT) |
-		(1ULL << VIRTIO_F_VERSION_1) |
-		(1ULL << VIRTIO_F_IOMMU_PLATFORM) |
-		(1ULL << VIRTIO_F_RING_PACKED) |
-		(1ULL << VIRTIO_F_ORDER_PLATFORM) |
-		(1ULL << VIRTIO_RING_F_INDIRECT_DESC) |
-		(1ULL << VIRTIO_RING_F_EVENT_IDX),
-
-	VHOST_VDPA_NET_FEATURES = VHOST_VDPA_FEATURES |
-		(1ULL << VIRTIO_NET_F_CSUM) |
-		(1ULL << VIRTIO_NET_F_GUEST_CSUM) |
-		(1ULL << VIRTIO_NET_F_MTU) |
-		(1ULL << VIRTIO_NET_F_MAC) |
-		(1ULL << VIRTIO_NET_F_GUEST_TSO4) |
-		(1ULL << VIRTIO_NET_F_GUEST_TSO6) |
-		(1ULL << VIRTIO_NET_F_GUEST_ECN) |
-		(1ULL << VIRTIO_NET_F_GUEST_UFO) |
-		(1ULL << VIRTIO_NET_F_HOST_TSO4) |
-		(1ULL << VIRTIO_NET_F_HOST_TSO6) |
-		(1ULL << VIRTIO_NET_F_HOST_ECN) |
-		(1ULL << VIRTIO_NET_F_HOST_UFO) |
-		(1ULL << VIRTIO_NET_F_MRG_RXBUF) |
-		(1ULL << VIRTIO_NET_F_STATUS) |
-		(1ULL << VIRTIO_NET_F_SPEED_DUPLEX),
-};
-
 /* Currently, only network backend w/o multiqueue is supported. */
 #define VHOST_VDPA_VQ_MAX	2
 
@@ -79,10 +50,6 @@ static DEFINE_IDA(vhost_vdpa_ida);
 
 static dev_t vhost_vdpa_major;
 
-static const u64 vhost_vdpa_features[] = {
-	[VIRTIO_ID_NET] = VHOST_VDPA_NET_FEATURES,
-};
-
 static void handle_vq_kick(struct vhost_work *work)
 {
 	struct vhost_virtqueue *vq = container_of(work, struct vhost_virtqueue,
@@ -255,7 +222,6 @@ static long vhost_vdpa_get_features(struct vhost_vdpa *v, u64 __user *featurep)
 	u64 features;
 
 	features = ops->get_features(vdpa);
-	features &= vhost_vdpa_features[v->virtio_id];
 
 	if (copy_to_user(featurep, &features, sizeof(features)))
 		return -EFAULT;
@@ -279,9 +245,6 @@ static long vhost_vdpa_set_features(struct vhost_vdpa *v, u64 __user *featurep)
 	if (copy_from_user(&features, featurep, sizeof(features)))
 		return -EFAULT;
 
-	if (features & ~vhost_vdpa_features[v->virtio_id])
-		return -EINVAL;
-
 	if (ops->set_features(vdpa, features))
 		return -EINVAL;
 
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
