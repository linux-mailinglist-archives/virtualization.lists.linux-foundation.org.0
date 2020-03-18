Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDE6189682
	for <lists.virtualization@lfdr.de>; Wed, 18 Mar 2020 09:04:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CDB7587CA2;
	Wed, 18 Mar 2020 08:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBY4e2+yL1My; Wed, 18 Mar 2020 08:04:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E619B87D7C;
	Wed, 18 Mar 2020 08:04:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0FDDC013E;
	Wed, 18 Mar 2020 08:04:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0A4CC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 08:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BC56F862AB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 08:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jfpcehwUs75r
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 08:04:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 77C098625E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584518642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qv2sf5ZLe8MVzng446R1oQxVfhG/+fRJUSulJ/I8CAY=;
 b=EuRoLDgfXx49L3nfHzOiANjPOEEAsrzS7fpfzRwdAS8qLAjo8Q+3Q7g8sE3VQmtci9Yzmj
 3xaYmhLUYUw4y7lrIKC7khivYPHB0v54SDZAve9byAaXemKS+bmUFT5GW/BLEMCGhMSvry
 81KGxHF56fwHWKxz+EGxCJublsSmlH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-OCU501FROFGJI-3DsIivUA-1; Wed, 18 Mar 2020 04:04:00 -0400
X-MC-Unique: OCU501FROFGJI-3DsIivUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41814800D50;
 Wed, 18 Mar 2020 08:03:57 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-166.pek2.redhat.com [10.72.13.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 164B119C58;
 Wed, 18 Mar 2020 08:03:47 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: [PATCH V6 1/8] vhost: allow per device message handler
Date: Wed, 18 Mar 2020 16:03:20 +0800
Message-Id: <20200318080327.21958-2-jasowang@redhat.com>
In-Reply-To: <20200318080327.21958-1-jasowang@redhat.com>
References: <20200318080327.21958-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: mhabets@solarflare.com, rob.miller@broadcom.com, saugatm@xilinx.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 jgg@mellanox.com, shahafs@mellanox.com, parav@mellanox.com,
 vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 rdunlap@infradead.org, maxime.coquelin@redhat.com, lingshan.zhu@intel.com
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

This patch allow device to register its own message handler during
vhost_dev_init(). vDPA device will use it to implement its own DMA
mapping logic.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/net.c   |  3 ++-
 drivers/vhost/scsi.c  |  2 +-
 drivers/vhost/vhost.c | 12 ++++++++++--
 drivers/vhost/vhost.h |  6 +++++-
 drivers/vhost/vsock.c |  2 +-
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index e158159671fa..c8ab8d83b530 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -1324,7 +1324,8 @@ static int vhost_net_open(struct inode *inode, struct file *f)
 	}
 	vhost_dev_init(dev, vqs, VHOST_NET_VQ_MAX,
 		       UIO_MAXIOV + VHOST_NET_BATCH,
-		       VHOST_NET_PKT_WEIGHT, VHOST_NET_WEIGHT);
+		       VHOST_NET_PKT_WEIGHT, VHOST_NET_WEIGHT,
+		       NULL);
 
 	vhost_poll_init(n->poll + VHOST_NET_VQ_TX, handle_tx_net, EPOLLOUT, dev);
 	vhost_poll_init(n->poll + VHOST_NET_VQ_RX, handle_rx_net, EPOLLIN, dev);
diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 0b949a14bce3..7653667a8cdc 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -1628,7 +1628,7 @@ static int vhost_scsi_open(struct inode *inode, struct file *f)
 		vs->vqs[i].vq.handle_kick = vhost_scsi_handle_kick;
 	}
 	vhost_dev_init(&vs->dev, vqs, VHOST_SCSI_MAX_VQ, UIO_MAXIOV,
-		       VHOST_SCSI_WEIGHT, 0);
+		       VHOST_SCSI_WEIGHT, 0, NULL);
 
 	vhost_scsi_init_inflight(vs, NULL);
 
diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index f44340b41494..8e9e2341e40a 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -457,7 +457,9 @@ static size_t vhost_get_desc_size(struct vhost_virtqueue *vq,
 
 void vhost_dev_init(struct vhost_dev *dev,
 		    struct vhost_virtqueue **vqs, int nvqs,
-		    int iov_limit, int weight, int byte_weight)
+		    int iov_limit, int weight, int byte_weight,
+		    int (*msg_handler)(struct vhost_dev *dev,
+				       struct vhost_iotlb_msg *msg))
 {
 	struct vhost_virtqueue *vq;
 	int i;
@@ -473,6 +475,7 @@ void vhost_dev_init(struct vhost_dev *dev,
 	dev->iov_limit = iov_limit;
 	dev->weight = weight;
 	dev->byte_weight = byte_weight;
+	dev->msg_handler = msg_handler;
 	init_llist_head(&dev->work_list);
 	init_waitqueue_head(&dev->wait);
 	INIT_LIST_HEAD(&dev->read_list);
@@ -1178,7 +1181,12 @@ ssize_t vhost_chr_write_iter(struct vhost_dev *dev,
 		ret = -EINVAL;
 		goto done;
 	}
-	if (vhost_process_iotlb_msg(dev, &msg)) {
+
+	if (dev->msg_handler)
+		ret = dev->msg_handler(dev, &msg);
+	else
+		ret = vhost_process_iotlb_msg(dev, &msg);
+	if (ret) {
 		ret = -EFAULT;
 		goto done;
 	}
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index a123fd70847e..f9d1a03dd153 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -174,11 +174,15 @@ struct vhost_dev {
 	int weight;
 	int byte_weight;
 	u64 kcov_handle;
+	int (*msg_handler)(struct vhost_dev *dev,
+			   struct vhost_iotlb_msg *msg);
 };
 
 bool vhost_exceeds_weight(struct vhost_virtqueue *vq, int pkts, int total_len);
 void vhost_dev_init(struct vhost_dev *, struct vhost_virtqueue **vqs,
-		    int nvqs, int iov_limit, int weight, int byte_weight);
+		    int nvqs, int iov_limit, int weight, int byte_weight,
+		    int (*msg_handler)(struct vhost_dev *dev,
+				       struct vhost_iotlb_msg *msg));
 long vhost_dev_set_owner(struct vhost_dev *dev);
 bool vhost_dev_has_owner(struct vhost_dev *dev);
 long vhost_dev_check_owner(struct vhost_dev *);
diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index c2d7d57e98cf..97669484a3f6 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -621,7 +621,7 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
 
 	vhost_dev_init(&vsock->dev, vqs, ARRAY_SIZE(vsock->vqs),
 		       UIO_MAXIOV, VHOST_VSOCK_PKT_WEIGHT,
-		       VHOST_VSOCK_WEIGHT);
+		       VHOST_VSOCK_WEIGHT, NULL);
 
 	file->private_data = vsock;
 	spin_lock_init(&vsock->send_pkt_list_lock);
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
