Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC5E1E77B1
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 10:03:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 50DB189347;
	Fri, 29 May 2020 08:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gbsLgvkMlEdW; Fri, 29 May 2020 08:03:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C709689343;
	Fri, 29 May 2020 08:03:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3259C016F;
	Fri, 29 May 2020 08:03:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE03BC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C721E883B1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jX1KsDjI+vP7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0BB5383EEA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590739433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8h+GPNLosU896j4lmpcz+nuuQdF3yl/18U4jyRqflms=;
 b=FjBcgmedLZNPuuWjga2lTRZcoNgWEThWY071/tTSJtILrQleIFC7pqPOQzjIsNdMXKZj9V
 tX+ErYK4gvDHgudps+uwBp0N9rfUnPMCe0iPzoHfh+6NxY3MhFskxAnuNiM7ZjM+IA5q3Y
 eIvmwRtnh1rbndxkA8p74azKpFCtMcE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-t9xoE6D0NPuqiutyuhmQCg-1; Fri, 29 May 2020 04:03:49 -0400
X-MC-Unique: t9xoE6D0NPuqiutyuhmQCg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0A0780183C;
 Fri, 29 May 2020 08:03:46 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-231.pek2.redhat.com [10.72.13.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D8DBA1038;
 Fri, 29 May 2020 08:03:40 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 4/6] vhost_vdpa: support doorbell mapping via mmap
Date: Fri, 29 May 2020 16:03:01 +0800
Message-Id: <20200529080303.15449-5-jasowang@redhat.com>
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

Currently the doorbell is relayed via eventfd which may have
significant overhead because of the cost of vmexits or syscall. This
patch introduces mmap() based doorbell mapping which can eliminate the
overhead caused by vmexit or syscall.

To ease the userspace modeling of the doorbell layout (usually
virtio-pci), this patch starts from a doorbell per page
model. Vhost-vdpa only support the hardware doorbell that sit at the
boundary of a page and does not share the page with other registers.

Doorbell of each virtqueue must be mapped separately, pgoff is the
index of the virtqueue. This allows userspace to map a subset of the
doorbell which may be useful for the implementation of software
assisted virtqueue (control vq) in the future.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/vdpa.c | 59 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 6ff72289f488..bbe23cea139a 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/cdev.h>
 #include <linux/device.h>
+#include <linux/mm.h>
 #include <linux/iommu.h>
 #include <linux/uuid.h>
 #include <linux/vdpa.h>
@@ -741,12 +742,70 @@ static int vhost_vdpa_release(struct inode *inode, struct file *filep)
 	return 0;
 }
 
+static vm_fault_t vhost_vdpa_fault(struct vm_fault *vmf)
+{
+	struct vhost_vdpa *v = vmf->vma->vm_file->private_data;
+	struct vdpa_device *vdpa = v->vdpa;
+	const struct vdpa_config_ops *ops = vdpa->config;
+	struct vdpa_notification_area notify;
+	struct vm_area_struct *vma = vmf->vma;
+	u16 index = vma->vm_pgoff;
+
+	notify = ops->get_vq_notification(vdpa, index);
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	if (remap_pfn_range(vma, vmf->address & PAGE_MASK,
+			    notify.addr >> PAGE_SHIFT, PAGE_SIZE,
+			    vma->vm_page_prot))
+		return VM_FAULT_SIGBUS;
+
+	return VM_FAULT_NOPAGE;
+}
+
+static const struct vm_operations_struct vhost_vdpa_vm_ops = {
+	.fault = vhost_vdpa_fault,
+};
+
+static int vhost_vdpa_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct vhost_vdpa *v = vma->vm_file->private_data;
+	struct vdpa_device *vdpa = v->vdpa;
+	const struct vdpa_config_ops *ops = vdpa->config;
+	struct vdpa_notification_area notify;
+	int index = vma->vm_pgoff;
+
+	if (vma->vm_end - vma->vm_start != PAGE_SIZE)
+		return -EINVAL;
+	if ((vma->vm_flags & VM_SHARED) == 0)
+		return -EINVAL;
+	if (vma->vm_flags & VM_READ)
+		return -EINVAL;
+	if (index > 65535)
+		return -EINVAL;
+	if (!ops->get_vq_notification)
+		return -ENOTSUPP;
+
+	/* To be safe and easily modelled by userspace, We only
+	 * support the doorbell which sits on the page boundary and
+	 * does not share the page with other registers.
+	 */
+	notify = ops->get_vq_notification(vdpa, index);
+	if (notify.addr & (PAGE_SIZE - 1))
+		return -EINVAL;
+	if (vma->vm_end - vma->vm_start != notify.size)
+		return -ENOTSUPP;
+
+	vma->vm_ops = &vhost_vdpa_vm_ops;
+	return 0;
+}
+
 static const struct file_operations vhost_vdpa_fops = {
 	.owner		= THIS_MODULE,
 	.open		= vhost_vdpa_open,
 	.release	= vhost_vdpa_release,
 	.write_iter	= vhost_vdpa_chr_write_iter,
 	.unlocked_ioctl	= vhost_vdpa_unlocked_ioctl,
+	.mmap		= vhost_vdpa_mmap,
 	.compat_ioctl	= compat_ptr_ioctl,
 };
 
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
