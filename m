Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D701E77A7
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 10:03:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 080B6883B5;
	Fri, 29 May 2020 08:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUUKhBUOB-Gq; Fri, 29 May 2020 08:03:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C28CF883AF;
	Fri, 29 May 2020 08:03:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4FE2C0892;
	Fri, 29 May 2020 08:03:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18F07C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 011AB873DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DWKD0pI1G0A4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CBFBB873E3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590739410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16IIq+gtyyOuTA/+k/mFaqIaYYtPCzydoYwI/b/+K1s=;
 b=JX1bPUyptFB31/1RA0pVqyYlU4Q7hn67MKt0kQpTuZ+59pVONP8WXlyMqSCaF627b9O1O8
 E/3aKcH5fVqf9UtywLG+IfPg+drIDySZFSLANjY9+9c73HASSWcs4ji29xNn3HOFYfqebn
 p9Rpx8zzi0BEKxgjmWtvUbfs63m3x+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-m3IrS965MNWPb0j_hZqinw-1; Fri, 29 May 2020 04:03:26 -0400
X-MC-Unique: m3IrS965MNWPb0j_hZqinw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F6E8107ACCA;
 Fri, 29 May 2020 08:03:24 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-231.pek2.redhat.com [10.72.13.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06E6199DE6;
 Fri, 29 May 2020 08:03:15 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 1/6] vhost: allow device that does not depend on vhost worker
Date: Fri, 29 May 2020 16:02:58 +0800
Message-Id: <20200529080303.15449-2-jasowang@redhat.com>
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

vDPA device currently relays the eventfd via vhost worker. This is
inefficient due the latency of wakeup and scheduling, so this patch
tries to introduce a use_worker attribute for the vhost device. When
use_worker is not set with vhost_dev_init(), vhost won't try to
allocate a worker thread and the vhost_poll will be processed directly
in the wakeup function.

This help for vDPA since it reduces the latency caused by vhost worker.

In my testing, it saves 0.2 ms in pings between VMs on a mutual host.

Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/net.c   |  2 +-
 drivers/vhost/scsi.c  |  2 +-
 drivers/vhost/vdpa.c  |  2 +-
 drivers/vhost/vhost.c | 38 +++++++++++++++++++++++++-------------
 drivers/vhost/vhost.h |  2 ++
 drivers/vhost/vsock.c |  2 +-
 6 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 2927f02cc7e1..bf5e1d81ae25 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -1326,7 +1326,7 @@ static int vhost_net_open(struct inode *inode, struct file *f)
 	}
 	vhost_dev_init(dev, vqs, VHOST_NET_VQ_MAX,
 		       UIO_MAXIOV + VHOST_NET_BATCH,
-		       VHOST_NET_PKT_WEIGHT, VHOST_NET_WEIGHT,
+		       VHOST_NET_PKT_WEIGHT, VHOST_NET_WEIGHT, true,
 		       NULL);
 
 	vhost_poll_init(n->poll + VHOST_NET_VQ_TX, handle_tx_net, EPOLLOUT, dev);
diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index c39952243fd3..0cbaa0b3893d 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -1628,7 +1628,7 @@ static int vhost_scsi_open(struct inode *inode, struct file *f)
 		vs->vqs[i].vq.handle_kick = vhost_scsi_handle_kick;
 	}
 	vhost_dev_init(&vs->dev, vqs, VHOST_SCSI_MAX_VQ, UIO_MAXIOV,
-		       VHOST_SCSI_WEIGHT, 0, NULL);
+		       VHOST_SCSI_WEIGHT, 0, true, NULL);
 
 	vhost_scsi_init_inflight(vs, NULL);
 
diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 20476b505d99..6ff72289f488 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -696,7 +696,7 @@ static int vhost_vdpa_open(struct inode *inode, struct file *filep)
 		vqs[i] = &v->vqs[i];
 		vqs[i]->handle_kick = handle_vq_kick;
 	}
-	vhost_dev_init(dev, vqs, nvqs, 0, 0, 0,
+	vhost_dev_init(dev, vqs, nvqs, 0, 0, 0, false,
 		       vhost_vdpa_process_iotlb_msg);
 
 	dev->iotlb = vhost_iotlb_alloc(0, 0);
diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index d450e16c5c25..70105e045768 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -166,11 +166,16 @@ static int vhost_poll_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync,
 			     void *key)
 {
 	struct vhost_poll *poll = container_of(wait, struct vhost_poll, wait);
+	struct vhost_work *work = &poll->work;
 
 	if (!(key_to_poll(key) & poll->mask))
 		return 0;
 
-	vhost_poll_queue(poll);
+	if (!poll->dev->use_worker)
+		work->fn(work);
+	else
+		vhost_poll_queue(poll);
+
 	return 0;
 }
 
@@ -454,6 +459,7 @@ static size_t vhost_get_desc_size(struct vhost_virtqueue *vq,
 void vhost_dev_init(struct vhost_dev *dev,
 		    struct vhost_virtqueue **vqs, int nvqs,
 		    int iov_limit, int weight, int byte_weight,
+		    bool use_worker,
 		    int (*msg_handler)(struct vhost_dev *dev,
 				       struct vhost_iotlb_msg *msg))
 {
@@ -471,6 +477,7 @@ void vhost_dev_init(struct vhost_dev *dev,
 	dev->iov_limit = iov_limit;
 	dev->weight = weight;
 	dev->byte_weight = byte_weight;
+	dev->use_worker = use_worker;
 	dev->msg_handler = msg_handler;
 	init_llist_head(&dev->work_list);
 	init_waitqueue_head(&dev->wait);
@@ -549,18 +556,21 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
 	/* No owner, become one */
 	dev->mm = get_task_mm(current);
 	dev->kcov_handle = kcov_common_handle();
-	worker = kthread_create(vhost_worker, dev, "vhost-%d", current->pid);
-	if (IS_ERR(worker)) {
-		err = PTR_ERR(worker);
-		goto err_worker;
-	}
+	if (dev->use_worker) {
+		worker = kthread_create(vhost_worker, dev,
+					"vhost-%d", current->pid);
+		if (IS_ERR(worker)) {
+			err = PTR_ERR(worker);
+			goto err_worker;
+		}
 
-	dev->worker = worker;
-	wake_up_process(worker);	/* avoid contributing to loadavg */
+		dev->worker = worker;
+		wake_up_process(worker); /* avoid contributing to loadavg */
 
-	err = vhost_attach_cgroups(dev);
-	if (err)
-		goto err_cgroup;
+		err = vhost_attach_cgroups(dev);
+		if (err)
+			goto err_cgroup;
+	}
 
 	err = vhost_dev_alloc_iovecs(dev);
 	if (err)
@@ -568,8 +578,10 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
 
 	return 0;
 err_cgroup:
-	kthread_stop(worker);
-	dev->worker = NULL;
+	if (dev->worker) {
+		kthread_stop(dev->worker);
+		dev->worker = NULL;
+	}
 err_worker:
 	if (dev->mm)
 		mmput(dev->mm);
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index f8403bd46b85..0feb6701e273 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -154,6 +154,7 @@ struct vhost_dev {
 	int weight;
 	int byte_weight;
 	u64 kcov_handle;
+	bool use_worker;
 	int (*msg_handler)(struct vhost_dev *dev,
 			   struct vhost_iotlb_msg *msg);
 };
@@ -161,6 +162,7 @@ struct vhost_dev {
 bool vhost_exceeds_weight(struct vhost_virtqueue *vq, int pkts, int total_len);
 void vhost_dev_init(struct vhost_dev *, struct vhost_virtqueue **vqs,
 		    int nvqs, int iov_limit, int weight, int byte_weight,
+		    bool use_worker,
 		    int (*msg_handler)(struct vhost_dev *dev,
 				       struct vhost_iotlb_msg *msg));
 long vhost_dev_set_owner(struct vhost_dev *dev);
diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index e36aaf9ba7bd..2eb85c42bac4 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -621,7 +621,7 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
 
 	vhost_dev_init(&vsock->dev, vqs, ARRAY_SIZE(vsock->vqs),
 		       UIO_MAXIOV, VHOST_VSOCK_PKT_WEIGHT,
-		       VHOST_VSOCK_WEIGHT, NULL);
+		       VHOST_VSOCK_WEIGHT, true, NULL);
 
 	file->private_data = vsock;
 	spin_lock_init(&vsock->send_pkt_list_lock);
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
