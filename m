Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AF741C7F6
	for <lists.virtualization@lfdr.de>; Wed, 29 Sep 2021 17:11:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2BAA83B2E;
	Wed, 29 Sep 2021 15:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZcDiEi8G4rf3; Wed, 29 Sep 2021 15:11:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0B02683B19;
	Wed, 29 Sep 2021 15:11:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1E81C000D;
	Wed, 29 Sep 2021 15:11:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A6ABC0026
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 15:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B96360E87
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 15:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=axis.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4SPS3kEoUYU5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 15:11:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1221960E2F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 15:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1632928285;
 x=1664464285; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hMm60rb8viQQxGuL+SPlQBQ/aT6iemOCC/qktwqpcxU=;
 b=IKAL9ocPhLZtMc4prlDg/vRNFh09kKgUkJ9IHVzJJLvixsH7NXCTxv1y
 lfAlekTA+XuXGOiuPGlMDtsVKRS82HU6S+jlGfQDyBI7YjiZ7friU8XLW
 Zw1QIRPVlVjRygPnpo/R643EWP6/zBVCodkh4BvUrhf9HuLHAGhpNR/QP
 BVl0mYlx+OT9ZHq+jfUEta9D3MvCtaUPIfIE+2yheteDCtqTmmp5Nn7v6
 e2Mglyx40XSQXik3pWuKktDHx0J/lYtGs1DjmXMvpi5v08JeNT1VNfhzb
 SPk5hNxsovXH4RK8rZr/kpnv/vw0CYoNG6YuhJfMFLeoFXLEvaFPLX7yJ g==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <mst@redhat.com>, <jasowang@redhat.com>
Subject: [RFC PATCH 05/10] vhost: extract common code for file_operations
 handling
Date: Wed, 29 Sep 2021 17:11:14 +0200
Message-ID: <20210929151119.14778-6-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210929151119.14778-1-vincent.whitchurch@axis.com>
References: <20210929151119.14778-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kernel@axis.com,
 stefanha@redhat.com, pbonzini@redhat.com
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

There is some duplicated code for handling of file_operations among
vhost drivers.  Move this to a common file.

Having file_operations in a common place also makes adding functions for
obaining a handle to a vhost device from a file descriptor simpler.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/vhost/Makefile |   3 +
 drivers/vhost/common.c | 134 +++++++++++++++++++++++++++++++++++++++++
 drivers/vhost/net.c    |  79 +++++++-----------------
 drivers/vhost/vhost.h  |  15 +++++
 drivers/vhost/vsock.c  |  75 +++++++----------------
 5 files changed, 197 insertions(+), 109 deletions(-)
 create mode 100644 drivers/vhost/common.c

diff --git a/drivers/vhost/Makefile b/drivers/vhost/Makefile
index f3e1897cce85..b1ddc976aede 100644
--- a/drivers/vhost/Makefile
+++ b/drivers/vhost/Makefile
@@ -15,5 +15,8 @@ vhost_vdpa-y := vdpa.o
 
 obj-$(CONFIG_VHOST)	+= vhost.o
 
+obj-$(CONFIG_VHOST)	+= vhost_common.o
+vhost_common-y := common.o
+
 obj-$(CONFIG_VHOST_IOTLB) += vhost_iotlb.o
 vhost_iotlb-y := iotlb.o
diff --git a/drivers/vhost/common.c b/drivers/vhost/common.c
new file mode 100644
index 000000000000..27d4672b15d3
--- /dev/null
+++ b/drivers/vhost/common.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/eventfd.h>
+#include <linux/vhost.h>
+#include <linux/uio.h>
+#include <linux/mm.h>
+#include <linux/miscdevice.h>
+#include <linux/mutex.h>
+#include <linux/poll.h>
+#include <linux/file.h>
+#include <linux/highmem.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include <linux/kthread.h>
+#include <linux/cgroup.h>
+#include <linux/module.h>
+#include <linux/sort.h>
+#include <linux/sched/mm.h>
+#include <linux/sched/signal.h>
+#include <linux/interval_tree_generic.h>
+#include <linux/nospec.h>
+#include <linux/kcov.h>
+
+#include "vhost.h"
+
+struct vhost_ops;
+
+struct vhost {
+	struct miscdevice misc;
+	const struct vhost_ops *ops;
+};
+
+static int vhost_open(struct inode *inode, struct file *file)
+{
+	struct miscdevice *misc = file->private_data;
+	struct vhost *vhost = container_of(misc, struct vhost, misc);
+	struct vhost_dev *dev;
+
+	dev = vhost->ops->open(vhost);
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	dev->vhost = vhost;
+	dev->file = file;
+	file->private_data = dev;
+
+	return 0;
+}
+
+static int vhost_release(struct inode *inode, struct file *file)
+{
+	struct vhost_dev *dev = file->private_data;
+	struct vhost *vhost = dev->vhost;
+
+	vhost->ops->release(dev);
+
+	return 0;
+}
+
+static long vhost_ioctl(struct file *file, unsigned int ioctl, unsigned long arg)
+{
+	struct vhost_dev *dev = file->private_data;
+	struct vhost *vhost = dev->vhost;
+
+	return vhost->ops->ioctl(dev, ioctl, arg);
+}
+
+static ssize_t vhost_read_iter(struct kiocb *iocb, struct iov_iter *to)
+{
+	struct file *file = iocb->ki_filp;
+	struct vhost_dev *dev = file->private_data;
+	int noblock = file->f_flags & O_NONBLOCK;
+
+	return vhost_chr_read_iter(dev, to, noblock);
+}
+
+static ssize_t vhost_write_iter(struct kiocb *iocb, struct iov_iter *from)
+{
+	struct file *file = iocb->ki_filp;
+	struct vhost_dev *dev = file->private_data;
+
+	return vhost_chr_write_iter(dev, from);
+}
+
+static __poll_t vhost_poll(struct file *file, poll_table *wait)
+{
+	struct vhost_dev *dev = file->private_data;
+
+	return vhost_chr_poll(file, dev, wait);
+}
+
+static const struct file_operations vhost_fops = {
+	.owner          = THIS_MODULE,
+	.open           = vhost_open,
+	.release        = vhost_release,
+	.llseek		= noop_llseek,
+	.unlocked_ioctl = vhost_ioctl,
+	.compat_ioctl   = compat_ptr_ioctl,
+	.read_iter      = vhost_read_iter,
+	.write_iter     = vhost_write_iter,
+	.poll           = vhost_poll,
+};
+
+struct vhost *vhost_register(const struct vhost_ops *ops)
+{
+	struct vhost *vhost;
+	int ret;
+
+	vhost = kzalloc(sizeof(*vhost), GFP_KERNEL);
+	if (!vhost)
+		return ERR_PTR(-ENOMEM);
+
+	vhost->misc.minor = ops->minor;
+	vhost->misc.name = ops->name;
+	vhost->misc.fops = &vhost_fops;
+	vhost->ops = ops;
+
+	ret = misc_register(&vhost->misc);
+	if (ret) {
+		kfree(vhost);
+		return ERR_PTR(ret);
+	}
+
+	return vhost;
+}
+EXPORT_SYMBOL_GPL(vhost_register);
+
+void vhost_unregister(struct vhost *vhost)
+{
+	misc_deregister(&vhost->misc);
+	kfree(vhost);
+}
+EXPORT_SYMBOL_GPL(vhost_unregister);
+
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 8f82b646d4af..8910d9e2a74e 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -1281,7 +1281,7 @@ static void handle_rx_net(struct vhost_work *work)
 	handle_rx(net);
 }
 
-static int vhost_net_open(struct inode *inode, struct file *f)
+static struct vhost_dev *vhost_net_open(struct vhost *vhost)
 {
 	struct vhost_net *n;
 	struct vhost_dev *dev;
@@ -1292,11 +1292,11 @@ static int vhost_net_open(struct inode *inode, struct file *f)
 
 	n = kvmalloc(sizeof *n, GFP_KERNEL | __GFP_RETRY_MAYFAIL);
 	if (!n)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 	vqs = kmalloc_array(VHOST_NET_VQ_MAX, sizeof(*vqs), GFP_KERNEL);
 	if (!vqs) {
 		kvfree(n);
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	queue = kmalloc_array(VHOST_NET_BATCH, sizeof(void *),
@@ -1304,7 +1304,7 @@ static int vhost_net_open(struct inode *inode, struct file *f)
 	if (!queue) {
 		kfree(vqs);
 		kvfree(n);
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 	}
 	n->vqs[VHOST_NET_VQ_RX].rxq.queue = queue;
 
@@ -1313,7 +1313,7 @@ static int vhost_net_open(struct inode *inode, struct file *f)
 		kfree(vqs);
 		kvfree(n);
 		kfree(queue);
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 	}
 	n->vqs[VHOST_NET_VQ_TX].xdp = xdp;
 
@@ -1341,11 +1341,10 @@ static int vhost_net_open(struct inode *inode, struct file *f)
 	vhost_poll_init(n->poll + VHOST_NET_VQ_TX, handle_tx_net, EPOLLOUT, dev);
 	vhost_poll_init(n->poll + VHOST_NET_VQ_RX, handle_rx_net, EPOLLIN, dev);
 
-	f->private_data = n;
 	n->page_frag.page = NULL;
 	n->refcnt_bias = 0;
 
-	return 0;
+	return dev;
 }
 
 static struct socket *vhost_net_stop_vq(struct vhost_net *n,
@@ -1395,9 +1394,9 @@ static void vhost_net_flush(struct vhost_net *n)
 	}
 }
 
-static int vhost_net_release(struct inode *inode, struct file *f)
+static void vhost_net_release(struct vhost_dev *dev)
 {
-	struct vhost_net *n = f->private_data;
+	struct vhost_net *n = container_of(dev, struct vhost_net, dev);
 	struct socket *tx_sock;
 	struct socket *rx_sock;
 
@@ -1421,7 +1420,6 @@ static int vhost_net_release(struct inode *inode, struct file *f)
 	if (n->page_frag.page)
 		__page_frag_cache_drain(n->page_frag.page, n->refcnt_bias);
 	kvfree(n);
-	return 0;
 }
 
 static struct socket *get_raw_socket(int fd)
@@ -1687,10 +1685,10 @@ static long vhost_net_set_owner(struct vhost_net *n)
 	return r;
 }
 
-static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
+static long vhost_net_ioctl(struct vhost_dev *dev, unsigned int ioctl,
 			    unsigned long arg)
 {
-	struct vhost_net *n = f->private_data;
+	struct vhost_net *n = container_of(dev, struct vhost_net, dev);
 	void __user *argp = (void __user *)arg;
 	u64 __user *featurep = argp;
 	struct vhost_vring_file backend;
@@ -1741,63 +1739,32 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
 	}
 }
 
-static ssize_t vhost_net_chr_read_iter(struct kiocb *iocb, struct iov_iter *to)
-{
-	struct file *file = iocb->ki_filp;
-	struct vhost_net *n = file->private_data;
-	struct vhost_dev *dev = &n->dev;
-	int noblock = file->f_flags & O_NONBLOCK;
-
-	return vhost_chr_read_iter(dev, to, noblock);
-}
-
-static ssize_t vhost_net_chr_write_iter(struct kiocb *iocb,
-					struct iov_iter *from)
-{
-	struct file *file = iocb->ki_filp;
-	struct vhost_net *n = file->private_data;
-	struct vhost_dev *dev = &n->dev;
-
-	return vhost_chr_write_iter(dev, from);
-}
-
-static __poll_t vhost_net_chr_poll(struct file *file, poll_table *wait)
-{
-	struct vhost_net *n = file->private_data;
-	struct vhost_dev *dev = &n->dev;
-
-	return vhost_chr_poll(file, dev, wait);
-}
-
-static const struct file_operations vhost_net_fops = {
-	.owner          = THIS_MODULE,
-	.release        = vhost_net_release,
-	.read_iter      = vhost_net_chr_read_iter,
-	.write_iter     = vhost_net_chr_write_iter,
-	.poll           = vhost_net_chr_poll,
-	.unlocked_ioctl = vhost_net_ioctl,
-	.compat_ioctl   = compat_ptr_ioctl,
+static const struct vhost_ops vhost_net_ops = {
+	.minor		= VHOST_NET_MINOR,
+	.name		= "vhost-net",
 	.open           = vhost_net_open,
-	.llseek		= noop_llseek,
+	.release        = vhost_net_release,
+	.ioctl		= vhost_net_ioctl,
 };
 
-static struct miscdevice vhost_net_misc = {
-	.minor = VHOST_NET_MINOR,
-	.name = "vhost-net",
-	.fops = &vhost_net_fops,
-};
+static struct vhost *vhost_net;
 
 static int vhost_net_init(void)
 {
 	if (experimental_zcopytx)
 		vhost_net_enable_zcopy(VHOST_NET_VQ_TX);
-	return misc_register(&vhost_net_misc);
+
+	vhost_net = vhost_register(&vhost_net_ops);
+	if (IS_ERR(vhost_net))
+		return PTR_ERR(vhost_net);
+
+	return 0;
 }
 module_init(vhost_net_init);
 
 static void vhost_net_exit(void)
 {
-	misc_deregister(&vhost_net_misc);
+	vhost_unregister(vhost_net);
 }
 module_exit(vhost_net_exit);
 
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index ded1b39d7852..562387b92730 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -15,6 +15,19 @@
 #include <linux/vhost_iotlb.h>
 #include <linux/irqbypass.h>
 
+struct vhost;
+
+struct vhost_ops {
+	int minor;
+	const char *name;
+	struct vhost_dev * (*open)(struct vhost *vhost);
+	long (*ioctl)(struct vhost_dev *dev, unsigned int ioctl, unsigned long arg);
+	void (*release)(struct vhost_dev *dev);
+};
+
+struct vhost *vhost_register(const struct vhost_ops *ops);
+void vhost_unregister(struct vhost *vhost);
+
 struct vhost_work;
 typedef void (*vhost_work_fn_t)(struct vhost_work *work);
 
@@ -160,6 +173,8 @@ struct vhost_dev {
 	struct mm_struct *mm;
 	struct mutex mutex;
 	struct vhost_virtqueue **vqs;
+	struct vhost *vhost;
+	struct file *file;
 	int nvqs;
 	struct eventfd_ctx *log_ctx;
 	struct llist_head work_list;
diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index 190e5a6ea045..93f74a0010d5 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -662,7 +662,7 @@ static void vhost_vsock_free(struct vhost_vsock *vsock)
 	kvfree(vsock);
 }
 
-static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
+static struct vhost_dev *vhost_vsock_dev_open(struct vhost *vhost)
 {
 	struct vhost_virtqueue **vqs;
 	struct vhost_vsock *vsock;
@@ -673,7 +673,7 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
 	 */
 	vsock = kvmalloc(sizeof(*vsock), GFP_KERNEL | __GFP_RETRY_MAYFAIL);
 	if (!vsock)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	vqs = kmalloc_array(ARRAY_SIZE(vsock->vqs), sizeof(*vqs), GFP_KERNEL);
 	if (!vqs) {
@@ -694,15 +694,14 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
 		       UIO_MAXIOV, VHOST_VSOCK_PKT_WEIGHT,
 		       VHOST_VSOCK_WEIGHT, true, NULL);
 
-	file->private_data = vsock;
 	spin_lock_init(&vsock->send_pkt_list_lock);
 	INIT_LIST_HEAD(&vsock->send_pkt_list);
 	vhost_work_init(&vsock->send_pkt_work, vhost_transport_send_pkt_work);
-	return 0;
+	return &vsock->dev;
 
 out:
 	vhost_vsock_free(vsock);
-	return ret;
+	return ERR_PTR(ret);
 }
 
 static void vhost_vsock_flush(struct vhost_vsock *vsock)
@@ -741,9 +740,9 @@ static void vhost_vsock_reset_orphans(struct sock *sk)
 	sk_error_report(sk);
 }
 
-static int vhost_vsock_dev_release(struct inode *inode, struct file *file)
+static void vhost_vsock_dev_release(struct vhost_dev *dev)
 {
-	struct vhost_vsock *vsock = file->private_data;
+	struct vhost_vsock *vsock = container_of(dev, struct vhost_vsock, dev);
 
 	mutex_lock(&vhost_vsock_mutex);
 	if (vsock->guest_cid)
@@ -775,7 +774,6 @@ static int vhost_vsock_dev_release(struct inode *inode, struct file *file)
 	vhost_dev_cleanup(&vsock->dev);
 	kfree(vsock->dev.vqs);
 	vhost_vsock_free(vsock);
-	return 0;
 }
 
 static int vhost_vsock_set_cid(struct vhost_vsock *vsock, u64 guest_cid)
@@ -851,10 +849,10 @@ static int vhost_vsock_set_features(struct vhost_vsock *vsock, u64 features)
 	return -EFAULT;
 }
 
-static long vhost_vsock_dev_ioctl(struct file *f, unsigned int ioctl,
+static long vhost_vsock_dev_ioctl(struct vhost_dev *dev, unsigned int ioctl,
 				  unsigned long arg)
 {
-	struct vhost_vsock *vsock = f->private_data;
+	struct vhost_vsock *vsock = container_of(dev, struct vhost_vsock, dev);
 	void __user *argp = (void __user *)arg;
 	u64 guest_cid;
 	u64 features;
@@ -906,51 +904,15 @@ static long vhost_vsock_dev_ioctl(struct file *f, unsigned int ioctl,
 	}
 }
 
-static ssize_t vhost_vsock_chr_read_iter(struct kiocb *iocb, struct iov_iter *to)
-{
-	struct file *file = iocb->ki_filp;
-	struct vhost_vsock *vsock = file->private_data;
-	struct vhost_dev *dev = &vsock->dev;
-	int noblock = file->f_flags & O_NONBLOCK;
-
-	return vhost_chr_read_iter(dev, to, noblock);
-}
-
-static ssize_t vhost_vsock_chr_write_iter(struct kiocb *iocb,
-					struct iov_iter *from)
-{
-	struct file *file = iocb->ki_filp;
-	struct vhost_vsock *vsock = file->private_data;
-	struct vhost_dev *dev = &vsock->dev;
-
-	return vhost_chr_write_iter(dev, from);
-}
-
-static __poll_t vhost_vsock_chr_poll(struct file *file, poll_table *wait)
-{
-	struct vhost_vsock *vsock = file->private_data;
-	struct vhost_dev *dev = &vsock->dev;
-
-	return vhost_chr_poll(file, dev, wait);
-}
-
-static const struct file_operations vhost_vsock_fops = {
-	.owner          = THIS_MODULE,
+static const struct vhost_ops vhost_vsock_ops = {
+	.minor		= VHOST_VSOCK_MINOR,
+	.name		= "vhost-vsock",
 	.open           = vhost_vsock_dev_open,
 	.release        = vhost_vsock_dev_release,
-	.llseek		= noop_llseek,
-	.unlocked_ioctl = vhost_vsock_dev_ioctl,
-	.compat_ioctl   = compat_ptr_ioctl,
-	.read_iter      = vhost_vsock_chr_read_iter,
-	.write_iter     = vhost_vsock_chr_write_iter,
-	.poll           = vhost_vsock_chr_poll,
+	.ioctl		= vhost_vsock_dev_ioctl,
 };
 
-static struct miscdevice vhost_vsock_misc = {
-	.minor = VHOST_VSOCK_MINOR,
-	.name = "vhost-vsock",
-	.fops = &vhost_vsock_fops,
-};
+static struct vhost *vhost_vsock;
 
 static int __init vhost_vsock_init(void)
 {
@@ -960,12 +922,19 @@ static int __init vhost_vsock_init(void)
 				  VSOCK_TRANSPORT_F_H2G);
 	if (ret < 0)
 		return ret;
-	return misc_register(&vhost_vsock_misc);
+
+	vhost_vsock = vhost_register(&vhost_vsock_ops);
+	if (IS_ERR(vhost_vsock)) {
+		vsock_core_unregister(&vhost_transport.transport);
+		return PTR_ERR(vhost_vsock);
+	}
+
+	return 0;
 };
 
 static void __exit vhost_vsock_exit(void)
 {
-	misc_deregister(&vhost_vsock_misc);
+	vhost_unregister(vhost_vsock);
 	vsock_core_unregister(&vhost_transport.transport);
 };
 
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
