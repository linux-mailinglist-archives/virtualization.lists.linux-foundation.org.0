Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D776E36036D
	for <lists.virtualization@lfdr.de>; Thu, 15 Apr 2021 09:32:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 683D140214;
	Thu, 15 Apr 2021 07:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VA5ehcUTVqlh; Thu, 15 Apr 2021 07:32:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D27140651;
	Thu, 15 Apr 2021 07:32:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F175FC000A;
	Thu, 15 Apr 2021 07:32:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7610C000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A7A34012C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:32:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m7Ep_p4ar0DV
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:32:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC53240214
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618471949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=EslG+sxn043pk37nYCmhIIIgjWBKLwgcBcHvAtxAEnk=;
 b=HNWFNEaaEfZHoRxOx7F9QmHZIvxleQmx/fbchBsIjjgCaMDNDgLQJVqX0SIL1Fv9MyK16x
 9RpB8KTKo/0etg1UBM33K7r7tLv32M+vsDUTANsETa75WmePZbOtQZY8ihZmVjdbfEDzVt
 rzax6lfERDLB7fAw841rojJa99CNoRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-7SKD4N5YO0yuvsxy8--Hiw-1; Thu, 15 Apr 2021 03:32:28 -0400
X-MC-Unique: 7SKD4N5YO0yuvsxy8--Hiw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50B54802B56;
 Thu, 15 Apr 2021 07:32:27 +0000 (UTC)
Received: from hp-dl380pg8-01.lab.eng.pek2.redhat.com
 (hp-dl380pg8-01.lab.eng.pek2.redhat.com [10.73.8.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 659806C32D;
 Thu, 15 Apr 2021 07:32:22 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 7/7] vp_vdpa: report doorbell address
Date: Thu, 15 Apr 2021 03:31:47 -0400
Message-Id: <20210415073147.19331-8-jasowang@redhat.com>
In-Reply-To: <20210415073147.19331-1-jasowang@redhat.com>
References: <20210415073147.19331-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: elic@nvidia.com, linux-kernel@vger.kernel.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This patch reports the per vq doorbell location and size to vDPA
bus. Userspace can then map the doorbell via mmap() via vhost-vDPA bus
driver.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/virtio_pci/vp_vdpa.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/virtio_pci/vp_vdpa.c b/drivers/vdpa/virtio_pci/vp_vdpa.c
index 98205e54d089..002b928d0ca1 100644
--- a/drivers/vdpa/virtio_pci/vp_vdpa.c
+++ b/drivers/vdpa/virtio_pci/vp_vdpa.c
@@ -26,6 +26,7 @@ struct vp_vring {
 	void __iomem *notify;
 	char msix_name[VP_VDPA_NAME_SIZE];
 	struct vdpa_callback cb;
+	resource_size_t notify_pa;
 	int irq;
 };
 
@@ -336,6 +337,19 @@ static void vp_vdpa_set_config_cb(struct vdpa_device *vdpa,
 	vp_vdpa->config_cb = *cb;
 }
 
+static struct vdpa_notification_area
+vp_vdpa_get_vq_notification(struct vdpa_device *vdpa, u16 qid)
+{
+	struct vp_vdpa *vp_vdpa = vdpa_to_vp(vdpa);
+	struct virtio_pci_modern_device *mdev = &vp_vdpa->mdev;
+	struct vdpa_notification_area notify;
+
+	notify.addr = vp_vdpa->vring[qid].notify_pa;
+	notify.size = mdev->notify_offset_multiplier;
+
+	return notify;
+}
+
 static const struct vdpa_config_ops vp_vdpa_ops = {
 	.get_features	= vp_vdpa_get_features,
 	.set_features	= vp_vdpa_set_features,
@@ -343,6 +357,7 @@ static const struct vdpa_config_ops vp_vdpa_ops = {
 	.set_status	= vp_vdpa_set_status,
 	.get_vq_num_max	= vp_vdpa_get_vq_num_max,
 	.get_vq_state	= vp_vdpa_get_vq_state,
+	.get_vq_notification = vp_vdpa_get_vq_notification,
 	.set_vq_state	= vp_vdpa_set_vq_state,
 	.set_vq_cb	= vp_vdpa_set_vq_cb,
 	.set_vq_ready	= vp_vdpa_set_vq_ready,
@@ -416,7 +431,8 @@ static int vp_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	for (i = 0; i < vp_vdpa->queues; i++) {
 		vp_vdpa->vring[i].irq = VIRTIO_MSI_NO_VECTOR;
 		vp_vdpa->vring[i].notify =
-			vp_modern_map_vq_notify(mdev, i, NULL);
+			vp_modern_map_vq_notify(mdev, i,
+						&vp_vdpa->vring[i].notify_pa);
 		if (!vp_vdpa->vring[i].notify) {
 			dev_warn(&pdev->dev, "Fail to map vq notify %d\n", i);
 			goto err;
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
