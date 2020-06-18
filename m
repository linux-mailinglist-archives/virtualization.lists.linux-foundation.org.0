Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id ED98B1FEB2D
	for <lists.virtualization@lfdr.de>; Thu, 18 Jun 2020 07:58:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6B05988515;
	Thu, 18 Jun 2020 05:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QzCikSL4Orvo; Thu, 18 Jun 2020 05:58:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D516288508;
	Thu, 18 Jun 2020 05:58:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6DCCC016E;
	Thu, 18 Jun 2020 05:58:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1CFCC016E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D0E4787DA6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUA6jpLZniDP
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:57:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3F45587DB4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 05:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592459877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QOnTc1Tc1olhU8CFMkkyzlIlNq+Dlnu6nonibpkABRc=;
 b=JoOR7ex4piCH9hxweIPdSftYiKlt5G/JdDZ0YH7JH3R92ni7IGft4tkieQ8v7IuJlCDS44
 NS+97VR1xl4ZtzS+FmCyssE1omDyHXrxwzUNiQWDEtwfIwyrTA2fSrFYG+Go2gtamO2z1j
 lzAUSmOW3cl0p+P76i7hlpJoCckhcZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-ZecySBeiOemJyhK2xF4QCw-1; Thu, 18 Jun 2020 01:57:55 -0400
X-MC-Unique: ZecySBeiOemJyhK2xF4QCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91FD58005AD;
 Thu, 18 Jun 2020 05:57:53 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-219.pek2.redhat.com [10.72.13.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1ACAC5C1D6;
 Thu, 18 Jun 2020 05:57:45 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 3/5] vhost-vdpa: support get/set backend features
Date: Thu, 18 Jun 2020 13:56:24 +0800
Message-Id: <20200618055626.25660-4-jasowang@redhat.com>
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

This patch makes userspace can get and set backend features to
vhost-vdpa.

Signed-off-by: Cindy Lu <lulu@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/vdpa.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index db4c9cb44c61..453057421f80 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -55,6 +55,10 @@ enum {
 		(1ULL << VIRTIO_NET_F_SPEED_DUPLEX),
 };
 
+enum {
+	VHOST_VDPA_BACKEND_FEATURES = (1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2)
+};
+
 /* Currently, only network backend w/o multiqueue is supported. */
 #define VHOST_VDPA_VQ_MAX	2
 
@@ -340,6 +344,8 @@ static long vhost_vdpa_vring_ioctl(struct vhost_vdpa *v, unsigned int cmd,
 	struct vdpa_callback cb;
 	struct vhost_virtqueue *vq;
 	struct vhost_vring_state s;
+	u64 __user *featurep = argp;
+	u64 features;
 	u32 idx;
 	long r;
 
@@ -362,6 +368,18 @@ static long vhost_vdpa_vring_ioctl(struct vhost_vdpa *v, unsigned int cmd,
 	case VHOST_GET_VRING_BASE:
 		vq->last_avail_idx = ops->get_vq_state(v->vdpa, idx);
 		break;
+	case VHOST_GET_BACKEND_FEATURES:
+		features = VHOST_VDPA_BACKEND_FEATURES;
+		if (copy_to_user(featurep, &features, sizeof(features)))
+			return -EFAULT;
+		return 0;
+	case VHOST_SET_BACKEND_FEATURES:
+		if (copy_from_user(&features, featurep, sizeof(features)))
+			return -EFAULT;
+		if (features & ~VHOST_VDPA_BACKEND_FEATURES)
+			return -EOPNOTSUPP;
+		vhost_set_backend_features(&v->vdev, features);
+		return 0;
 	}
 
 	r = vhost_vring_ioctl(&v->vdev, cmd, argp);
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
