Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F8A2107B1
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 11:10:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 38DE88AC65;
	Wed,  1 Jul 2020 09:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mKlv8AhCgIlc; Wed,  1 Jul 2020 09:10:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AA05D8AC69;
	Wed,  1 Jul 2020 09:10:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80472C0733;
	Wed,  1 Jul 2020 09:10:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60AC1C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 09:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4FFFC8956E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 09:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VYCrKHbXN5bF
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 09:10:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ADD838956D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 09:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593594616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMPqqdA13OB8Wbq1cykQlNhk0fPsMbbs+lqAtCf74+Q=;
 b=RGeBX6Lw/DtTHZuKT1L2Nur4+Vf1FDHrr76o6KauCvru2mJZn87mKaSYEQBakn4s730H4S
 35iS3KlySliUJQXqgd0y2pYY2zu92v6n519AXUwoX36d478ZWXq7gE/c1sNVZLMIhRuSg5
 Z6WFuMFLEs86qDcrP/t43eqD57rbGIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-f_I8q3zRMJ-cHIdTAEwUqQ-1; Wed, 01 Jul 2020 05:10:15 -0400
X-MC-Unique: f_I8q3zRMJ-cHIdTAEwUqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BFE2EC1A2;
 Wed,  1 Jul 2020 09:10:13 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-177.pek2.redhat.com [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6AB871662;
 Wed,  1 Jul 2020 09:09:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] vhost: generialize backend features setting/getting
Date: Wed,  1 Jul 2020 17:08:36 +0800
Message-Id: <20200701090839.12994-3-jasowang@redhat.com>
In-Reply-To: <20200701090839.12994-1-jasowang@redhat.com>
References: <20200701090839.12994-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Move the backend features setting/getting from net.c to vhost.c to be
reused by vhost-vdpa.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/net.c   | 18 ++----------------
 drivers/vhost/vhost.c | 15 +++++++++++++++
 drivers/vhost/vhost.h |  2 ++
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 0b509be8d7b1..d88afe3f6060 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -1622,21 +1622,6 @@ static long vhost_net_reset_owner(struct vhost_net *n)
 	return err;
 }
 
-static int vhost_net_set_backend_features(struct vhost_net *n, u64 features)
-{
-	int i;
-
-	mutex_lock(&n->dev.mutex);
-	for (i = 0; i < VHOST_NET_VQ_MAX; ++i) {
-		mutex_lock(&n->vqs[i].vq.mutex);
-		n->vqs[i].vq.acked_backend_features = features;
-		mutex_unlock(&n->vqs[i].vq.mutex);
-	}
-	mutex_unlock(&n->dev.mutex);
-
-	return 0;
-}
-
 static int vhost_net_set_features(struct vhost_net *n, u64 features)
 {
 	size_t vhost_hlen, sock_hlen, hdr_len;
@@ -1737,7 +1722,8 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
 			return -EFAULT;
 		if (features & ~VHOST_NET_BACKEND_FEATURES)
 			return -EOPNOTSUPP;
-		return vhost_net_set_backend_features(n, features);
+		vhost_set_backend_features(&n->dev, features);
+		return 0;
 	case VHOST_RESET_OWNER:
 		return vhost_net_reset_owner(n);
 	case VHOST_SET_OWNER:
diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index dc510dc2b1ef..ba61f499d420 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2700,6 +2700,21 @@ struct vhost_msg_node *vhost_dequeue_msg(struct vhost_dev *dev,
 }
 EXPORT_SYMBOL_GPL(vhost_dequeue_msg);
 
+void vhost_set_backend_features(struct vhost_dev *dev, u64 features)
+{
+	struct vhost_virtqueue *vq;
+	int i;
+
+	mutex_lock(&dev->mutex);
+	for (i = 0; i < dev->nvqs; ++i) {
+		vq = dev->vqs[i];
+		mutex_lock(&vq->mutex);
+		vq->acked_backend_features = features;
+		mutex_unlock(&vq->mutex);
+	}
+	mutex_unlock(&dev->mutex);
+}
+EXPORT_SYMBOL_GPL(vhost_set_backend_features);
 
 static int __init vhost_init(void)
 {
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index 264a2a2fae97..52753aecd82a 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -223,6 +223,8 @@ void vhost_enqueue_msg(struct vhost_dev *dev,
 		       struct vhost_msg_node *node);
 struct vhost_msg_node *vhost_dequeue_msg(struct vhost_dev *dev,
 					 struct list_head *head);
+void vhost_set_backend_features(struct vhost_dev *dev, u64 features);
+
 __poll_t vhost_chr_poll(struct file *file, struct vhost_dev *dev,
 			    poll_table *wait);
 ssize_t vhost_chr_read_iter(struct vhost_dev *dev, struct iov_iter *to,
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
