Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FEE1E77AF
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 10:03:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 028D1883AF;
	Fri, 29 May 2020 08:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4gmcGBgC4kUV; Fri, 29 May 2020 08:03:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 890E783EEA;
	Fri, 29 May 2020 08:03:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68A7AC07FF;
	Fri, 29 May 2020 08:03:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75B58C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 70C8A883AF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wzg-FATcktqE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A5ECA83EEA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590739424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HcTPYCfr5sCNE0h8qLNyyGd6WCD8Ts7vuwtEmnD7m9Y=;
 b=AD6ybSye3q/BG0vqcgWJir6q9uvG/yi2PFfG/n44UU16U6ShKkbbRaIHlIE7QfRRCGyv/B
 6FbRlErcdy6tnGZ+v5IyByYgQYvHoTprD4n57W8vnqWfKNqoBMf/saMnEFxQn8vZc/qj6t
 3Fx4ilU8U7nMN66yPRddK3dWpkGm7gM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-gUMe24RiOTij-A2w3OfVrg-1; Fri, 29 May 2020 04:03:42 -0400
X-MC-Unique: gUMe24RiOTij-A2w3OfVrg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81F34464;
 Fri, 29 May 2020 08:03:40 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-231.pek2.redhat.com [10.72.13.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F4BD99DE6;
 Fri, 29 May 2020 08:03:34 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 3/6] vdpa: introduce get_vq_notification method
Date: Fri, 29 May 2020 16:03:00 +0800
Message-Id: <20200529080303.15449-4-jasowang@redhat.com>
In-Reply-To: <20200529080303.15449-1-jasowang@redhat.com>
References: <20200529080303.15449-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: shahafs@mellanox.com, lulu@redhat.com, kvm@vger.kernel.org,
 saugatm@xilinx.com, netdev@vger.kernel.org, mhabets@solarflare.com,
 vmireyno@marvell.com, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, zhangweining@ruijie.com.cn, eli@mellanox.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

This patch introduces a new method in the vdpa_config_ops which
reports the physical address and the size of the doorbell for a
specific virtqueue.

This will be used by the future patches that maps doorbell to
userspace.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/linux/vdpa.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index 5453af87a33e..239db794357c 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -17,6 +17,16 @@ struct vdpa_callback {
 	void *private;
 };
 
+/**
+ * vDPA notification area
+ * @addr: base address of the notification area
+ * @size: size of the notification area
+ */
+struct vdpa_notification_area {
+	resource_size_t addr;
+	resource_size_t size;
+};
+
 /**
  * vDPA device - representation of a vDPA device
  * @dev: underlying device
@@ -73,6 +83,10 @@ struct vdpa_device {
  *				@vdev: vdpa device
  *				@idx: virtqueue index
  *				Returns virtqueue state (last_avail_idx)
+ * @get_vq_notification: 	Get the notification area for a virtqueue
+ *				@vdev: vdpa device
+ *				@idx: virtqueue index
+ *				Returns the notifcation area
  * @get_vq_align:		Get the virtqueue align requirement
  *				for the device
  *				@vdev: vdpa device
@@ -162,6 +176,8 @@ struct vdpa_config_ops {
 	bool (*get_vq_ready)(struct vdpa_device *vdev, u16 idx);
 	int (*set_vq_state)(struct vdpa_device *vdev, u16 idx, u64 state);
 	u64 (*get_vq_state)(struct vdpa_device *vdev, u16 idx);
+	struct vdpa_notification_area
+	(*get_vq_notification)(struct vdpa_device *vdev, u16 idx);
 
 	/* Device ops */
 	u32 (*get_vq_align)(struct vdpa_device *vdev);
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
