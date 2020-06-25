Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AFF20A067
	for <lists.virtualization@lfdr.de>; Thu, 25 Jun 2020 15:58:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 09C48861B2;
	Thu, 25 Jun 2020 13:58:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chmdmb7v53BI; Thu, 25 Jun 2020 13:58:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0437084E49;
	Thu, 25 Jun 2020 13:58:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C89DDC0863;
	Thu, 25 Jun 2020 13:58:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D1B9C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F03CD8888C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWe9s1cIzMf1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3150C886EF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593093485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I02RA+QYEkrvsrT/YPtoqYBWwQdCy39TUmoOUKOxREo=;
 b=a/wItYx+hLrle+LsB2fIkCtWyzfoIbFk9gIszn3n5aCLqGAjNxO4O6W+4V48GN+k02jbH3
 JX2krh4NLSnscjOkg/wrT0HjdqbFmhVM/Xbu9J8Io1CAp+n/2QD5EqEi6r/yScXYtGyFHR
 FjRQVLYrb5iIhgD+Z9Yhuc9BwkDp1PM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-K8C6TJENOjamXr91Nc0bMQ-1; Thu, 25 Jun 2020 09:58:03 -0400
X-MC-Unique: K8C6TJENOjamXr91Nc0bMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69B86804001;
 Thu, 25 Jun 2020 13:58:02 +0000 (UTC)
Received: from localhost (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F94619D61;
 Thu, 25 Jun 2020 13:57:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC 1/3] virtio-pci: use NUMA-aware memory allocation in probe
Date: Thu, 25 Jun 2020 14:57:50 +0100
Message-Id: <20200625135752.227293-2-stefanha@redhat.com>
In-Reply-To: <20200625135752.227293-1-stefanha@redhat.com>
References: <20200625135752.227293-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
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

Allocate frequently-accessed data structures from the NUMA node
associated with this virtio-pci device. This avoids slow cross-NUMA node
memory accesses.

Only the following memory allocations are made NUMA-aware:

1. Called during probe. If called in the data path then hopefully we're
   executing on a CPU in the same NUMA node as the device. If the CPU is
   not in the right NUMA node then it's unclear whether forcing memory
   allocations to use the device's NUMA node will increase or decrease
   performance.

2. Memory will be frequently accessed from the data path. There is no
   need to worry about data that is not accessed from
   performance-critical code paths.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 drivers/virtio/virtio_pci_common.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index 222d630c41fc..cc6e49f9c698 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -178,11 +178,13 @@ static struct virtqueue *vp_setup_vq(struct virtio_device *vdev, unsigned index,
 				     u16 msix_vec)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
-	struct virtio_pci_vq_info *info = kmalloc(sizeof *info, GFP_KERNEL);
+	int node = dev_to_node(&vdev->dev);
+	struct virtio_pci_vq_info *info;
 	struct virtqueue *vq;
 	unsigned long flags;
 
 	/* fill out our structure that represents an active queue */
+	info = kmalloc_node(sizeof *info, GFP_KERNEL, node);
 	if (!info)
 		return ERR_PTR(-ENOMEM);
 
@@ -283,10 +285,12 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned nvqs,
 		struct irq_affinity *desc)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	int node = dev_to_node(&vdev->dev);
 	u16 msix_vec;
 	int i, err, nvectors, allocated_vectors, queue_idx = 0;
 
-	vp_dev->vqs = kcalloc(nvqs, sizeof(*vp_dev->vqs), GFP_KERNEL);
+	vp_dev->vqs = kcalloc_node(nvqs, sizeof(*vp_dev->vqs),
+				   GFP_KERNEL, node);
 	if (!vp_dev->vqs)
 		return -ENOMEM;
 
@@ -355,9 +359,11 @@ static int vp_find_vqs_intx(struct virtio_device *vdev, unsigned nvqs,
 		const char * const names[], const bool *ctx)
 {
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	int node = dev_to_node(&vdev->dev);
 	int i, err, queue_idx = 0;
 
-	vp_dev->vqs = kcalloc(nvqs, sizeof(*vp_dev->vqs), GFP_KERNEL);
+	vp_dev->vqs = kcalloc_node(nvqs, sizeof(*vp_dev->vqs),
+				   GFP_KERNEL, node);
 	if (!vp_dev->vqs)
 		return -ENOMEM;
 
@@ -513,10 +519,12 @@ static int virtio_pci_probe(struct pci_dev *pci_dev,
 			    const struct pci_device_id *id)
 {
 	struct virtio_pci_device *vp_dev, *reg_dev = NULL;
+	int node = dev_to_node(&pci_dev->dev);
 	int rc;
 
 	/* allocate our structure and fill it out */
-	vp_dev = kzalloc(sizeof(struct virtio_pci_device), GFP_KERNEL);
+	vp_dev = kzalloc_node(sizeof(struct virtio_pci_device),
+			      GFP_KERNEL, node);
 	if (!vp_dev)
 		return -ENOMEM;
 
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
