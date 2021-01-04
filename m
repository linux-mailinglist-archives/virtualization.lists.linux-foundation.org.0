Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CB68A2E907D
	for <lists.virtualization@lfdr.de>; Mon,  4 Jan 2021 07:55:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 861118709F;
	Mon,  4 Jan 2021 06:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KZt2TgNo8oCr; Mon,  4 Jan 2021 06:55:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 187A786F9F;
	Mon,  4 Jan 2021 06:55:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F306EC0893;
	Mon,  4 Jan 2021 06:55:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B81B9C1E6F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9EEF4203D5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AvYHkz2g78UB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 7FFBE20425
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609743328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zsLbOav7/E39nNDxLtrE61Pdclqr7iYbX9oecocZesI=;
 b=ByJ0PocIE5+RuMGnrF/9kgR8J7JRx4OeaXisbMLMpFlbJIWM2y9ffrJdiXSvpqD+Nu8l2G
 N2Tx1eKZcdY+o1IAeClYXvkUMJA4OFQX/0NZxeWNHlmV1SxQ9C1/3EiXa8LrN0PHzqoxTi
 rFw8VTcnn6h5IM8C6D9bOmo2qaRXbhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-n0WDfo1iMImY1CwnHcayjQ-1; Mon, 04 Jan 2021 01:55:25 -0500
X-MC-Unique: n0WDfo1iMImY1CwnHcayjQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C3B659;
 Mon,  4 Jan 2021 06:55:24 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-91.pek2.redhat.com [10.72.13.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEBBA1002388;
 Mon,  4 Jan 2021 06:55:21 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V3 04/19] virtio-pci-modern: introduce vp_modern_remove()
Date: Mon,  4 Jan 2021 14:54:48 +0800
Message-Id: <20210104065503.199631-5-jasowang@redhat.com>
In-Reply-To: <20210104065503.199631-1-jasowang@redhat.com>
References: <20210104065503.199631-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: shahafs@mellanox.com, rdunlap@infradead.org, lulu@redhat.com
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

This patch introduces vp_modern_remove() doing device resources
cleanup to make it can be used.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_pci_modern.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 5d2d2ae0dfdb..4be9afad547e 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -873,9 +873,12 @@ int virtio_pci_modern_probe(struct virtio_pci_device *vp_dev)
 	return 0;
 }
 
-void virtio_pci_modern_remove(struct virtio_pci_device *vp_dev)
+/*
+ * vp_modern_probe: remove and cleanup the modern virtio pci device
+ * @mdev: the modern virtio-pci device
+ */
+static void vp_modern_remove(struct virtio_pci_modern_device *mdev)
 {
-	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
 	struct pci_dev *pci_dev = mdev->pci_dev;
 
 	if (mdev->device)
@@ -886,3 +889,10 @@ void virtio_pci_modern_remove(struct virtio_pci_device *vp_dev)
 	pci_iounmap(pci_dev, mdev->common);
 	pci_release_selected_regions(pci_dev, mdev->modern_bars);
 }
+
+void virtio_pci_modern_remove(struct virtio_pci_device *vp_dev)
+{
+	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
+
+	vp_modern_remove(mdev);
+}
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
