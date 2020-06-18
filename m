Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8888E1FEB2B
	for <lists.virtualization@lfdr.de>; Thu, 18 Jun 2020 07:57:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1FD9C884F4;
	Thu, 18 Jun 2020 05:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A5M49kw1AGRX; Thu, 18 Jun 2020 05:57:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9CAED884F5;
	Thu, 18 Jun 2020 05:57:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F738C016E;
	Thu, 18 Jun 2020 05:57:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE06CC016E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A896287DA6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IhVVfPgw81jz
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:57:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 12BE987DAD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592459873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMPqqdA13OB8Wbq1cykQlNhk0fPsMbbs+lqAtCf74+Q=;
 b=KRPzyrKpi1VzmawOI0fD8Ecs8/KSmI5kv7qxJ67D5mJ/dXrFm+KoMYJLlNh95LoxxTBX3p
 BONrjLu996QicP4KXBNwNCTxa3QUFqL5TIJjQVUP+UQrNnaIBj13t9L9Coy0JJvKqyrVEU
 QaK+FvHK4pMQDqLhKQY+KS6vTtbylF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-zHg3apR0ONudhpoy5oB-GA-1; Thu, 18 Jun 2020 01:57:47 -0400
X-MC-Unique: zHg3apR0ONudhpoy5oB-GA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BFFD107ACF2;
 Thu, 18 Jun 2020 05:57:45 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-219.pek2.redhat.com [10.72.13.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E99F25C28E;
 Thu, 18 Jun 2020 05:57:39 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 2/5] vhost: generialize backend features setting/getting
Date: Thu, 18 Jun 2020 13:56:23 +0800
Message-Id: <20200618055626.25660-3-jasowang@redhat.com>
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
