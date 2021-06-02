Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAD8397EA8
	for <lists.virtualization@lfdr.de>; Wed,  2 Jun 2021 04:15:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1EB2402C9;
	Wed,  2 Jun 2021 02:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gw5eWRepWvCm; Wed,  2 Jun 2021 02:15:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6B5A402A8;
	Wed,  2 Jun 2021 02:15:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FC7BC0001;
	Wed,  2 Jun 2021 02:15:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15639C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 126B3402A8
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TrfV_XDXV2Wf
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:15:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55EC740249
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622600149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkilwBwFhJtLCkWc/s8f79yGTq+PN2d+n/O8mKBEbHc=;
 b=jH6Y0KlWPQaNOBUN+mD2+Z7FU+4ZDPqVHDr1avL9KuE9LjSR2ytOOQ0Z9Ipw8utP2N8sFF
 +HczEpaC+++T36LUJ+D4u7F6isDom0nxK/mKuoAHJ4fSeyvQTo9uu5MlgF03xp6EjIuobb
 HhmyYv7GHfaQAbZ7aEEEJr/ELWafcA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-bP-P4YtJPmuCb0TnQ0A9lw-1; Tue, 01 Jun 2021 22:15:48 -0400
X-MC-Unique: bP-P4YtJPmuCb0TnQ0A9lw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B1B1107ACCA;
 Wed,  2 Jun 2021 02:15:47 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-99.pek2.redhat.com [10.72.12.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCDBD6A03C;
 Wed,  2 Jun 2021 02:15:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH V2 RESEND 1/4] vdpa: support packed virtqueue for
 set/get_vq_state()
Date: Wed,  2 Jun 2021 10:15:33 +0800
Message-Id: <20210602021536.39525-2-jasowang@redhat.com>
In-Reply-To: <20210602021536.39525-1-jasowang@redhat.com>
References: <20210602021536.39525-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: eli@mellanox.com
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

This patch extends the vdpa_vq_state to support packed virtqueue
state which is basically the device/driver ring wrap counters and the
avail and used index. This will be used for the virito-vdpa support
for the packed virtqueue and the future vhost/vhost-vdpa support for
the packed virtqueue.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/ifcvf/ifcvf_main.c   |  4 ++--
 drivers/vdpa/mlx5/net/mlx5_vnet.c |  8 ++++----
 drivers/vdpa/vdpa_sim/vdpa_sim.c  |  4 ++--
 drivers/vhost/vdpa.c              |  4 ++--
 include/linux/vdpa.h              | 25 +++++++++++++++++++++++--
 5 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
index ab0ab5cf0f6e..5d3891b1ca28 100644
--- a/drivers/vdpa/ifcvf/ifcvf_main.c
+++ b/drivers/vdpa/ifcvf/ifcvf_main.c
@@ -264,7 +264,7 @@ static int ifcvf_vdpa_get_vq_state(struct vdpa_device *vdpa_dev, u16 qid,
 {
 	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
 
-	state->avail_index = ifcvf_get_vq_state(vf, qid);
+	state->split.avail_index = ifcvf_get_vq_state(vf, qid);
 	return 0;
 }
 
@@ -273,7 +273,7 @@ static int ifcvf_vdpa_set_vq_state(struct vdpa_device *vdpa_dev, u16 qid,
 {
 	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
 
-	return ifcvf_set_vq_state(vf, qid, state->avail_index);
+	return ifcvf_set_vq_state(vf, qid, state->split.avail_index);
 }
 
 static void ifcvf_vdpa_set_vq_cb(struct vdpa_device *vdpa_dev, u16 qid,
diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index 189e4385df40..e5505d760bca 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -1427,8 +1427,8 @@ static int mlx5_vdpa_set_vq_state(struct vdpa_device *vdev, u16 idx,
 		return -EINVAL;
 	}
 
-	mvq->used_idx = state->avail_index;
-	mvq->avail_idx = state->avail_index;
+	mvq->used_idx = state->split.avail_index;
+	mvq->avail_idx = state->split.avail_index;
 	return 0;
 }
 
@@ -1449,7 +1449,7 @@ static int mlx5_vdpa_get_vq_state(struct vdpa_device *vdev, u16 idx, struct vdpa
 		 * Since both values should be identical, we take the value of
 		 * used_idx which is reported correctly.
 		 */
-		state->avail_index = mvq->used_idx;
+		state->split.avail_index = mvq->used_idx;
 		return 0;
 	}
 
@@ -1458,7 +1458,7 @@ static int mlx5_vdpa_get_vq_state(struct vdpa_device *vdev, u16 idx, struct vdpa
 		mlx5_vdpa_warn(mvdev, "failed to query virtqueue\n");
 		return err;
 	}
-	state->avail_index = attr.used_index;
+	state->split.avail_index = attr.used_index;
 	return 0;
 }
 
diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 98f793bc9376..14e024de5cbf 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -374,7 +374,7 @@ static int vdpasim_set_vq_state(struct vdpa_device *vdpa, u16 idx,
 	struct vringh *vrh = &vq->vring;
 
 	spin_lock(&vdpasim->lock);
-	vrh->last_avail_idx = state->avail_index;
+	vrh->last_avail_idx = state->split.avail_index;
 	spin_unlock(&vdpasim->lock);
 
 	return 0;
@@ -387,7 +387,7 @@ static int vdpasim_get_vq_state(struct vdpa_device *vdpa, u16 idx,
 	struct vdpasim_virtqueue *vq = &vdpasim->vqs[idx];
 	struct vringh *vrh = &vq->vring;
 
-	state->avail_index = vrh->last_avail_idx;
+	state->split.avail_index = vrh->last_avail_idx;
 	return 0;
 }
 
diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index fb41db3da611..210ab35a7ebf 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -383,7 +383,7 @@ static long vhost_vdpa_vring_ioctl(struct vhost_vdpa *v, unsigned int cmd,
 		if (r)
 			return r;
 
-		vq->last_avail_idx = vq_state.avail_index;
+		vq->last_avail_idx = vq_state.split.avail_index;
 		break;
 	}
 
@@ -401,7 +401,7 @@ static long vhost_vdpa_vring_ioctl(struct vhost_vdpa *v, unsigned int cmd,
 		break;
 
 	case VHOST_SET_VRING_BASE:
-		vq_state.avail_index = vq->last_avail_idx;
+		vq_state.split.avail_index = vq->last_avail_idx;
 		if (ops->set_vq_state(vdpa, idx, &vq_state))
 			r = -EINVAL;
 		break;
diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index f311d227aa1b..3357ac98878d 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -28,13 +28,34 @@ struct vdpa_notification_area {
 };
 
 /**
- * struct vdpa_vq_state - vDPA vq_state definition
+ * struct vdpa_vq_state_split - vDPA split virtqueue state
  * @avail_index: available index
  */
-struct vdpa_vq_state {
+struct vdpa_vq_state_split {
 	u16	avail_index;
 };
 
+/**
+ * struct vdpa_vq_state_packed - vDPA packed virtqueue state
+ * @last_avail_counter: last driver ring wrap counter observed by device
+ * @last_avail_idx: device available index
+ * @last_used_counter: device ring wrap counter
+ * @last_used_idx: used index
+ */
+struct vdpa_vq_state_packed {
+        u16	last_avail_counter:1;
+        u16	last_avail_idx:15;
+        u16	last_used_counter:1;
+        u16	last_used_idx:15;
+};
+
+struct vdpa_vq_state {
+     union {
+          struct vdpa_vq_state_split split;
+          struct vdpa_vq_state_packed packed;
+     };
+};
+
 struct vdpa_mgmt_dev;
 
 /**
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
