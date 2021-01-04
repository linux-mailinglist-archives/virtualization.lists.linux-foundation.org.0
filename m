Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5132E9083
	for <lists.virtualization@lfdr.de>; Mon,  4 Jan 2021 07:55:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8859486805;
	Mon,  4 Jan 2021 06:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJHqwI8iMYVo; Mon,  4 Jan 2021 06:55:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2D75886834;
	Mon,  4 Jan 2021 06:55:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 063F7C0893;
	Mon,  4 Jan 2021 06:55:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6045FC013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5CA4E2011B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mmNF4j-pWgA
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 930D220111
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 06:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609743346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWQOtPyifN/PjEn3xTBf4iGLE1QrxjMiv/aT+1c7dfI=;
 b=CnrHMRtDf7KixdkbJ9IdpbE5wXfn+kLZmSat/uorh6FyX+uXMrNNVXV6M0ZSJWs6PTIiFG
 w9ltjq6M09JN2ZuwQom1HYjP4ztiad5Sw338i3WCgyb21OE/sx1MzX47rfgWAU3Wa280yz
 sqncjsqqifGmsQQdmXI9xuqMFOuYqto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-PR6Oina1Mji3ezzOKe1c0w-1; Mon, 04 Jan 2021 01:55:42 -0500
X-MC-Unique: PR6Oina1Mji3ezzOKe1c0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5095E800D55;
 Mon,  4 Jan 2021 06:55:41 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-91.pek2.redhat.com [10.72.13.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AD5D1002388;
 Mon,  4 Jan 2021 06:55:38 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V3 08/19] virtio-pci-modern: introduce vp_modern_generation()
Date: Mon,  4 Jan 2021 14:54:52 +0800
Message-Id: <20210104065503.199631-9-jasowang@redhat.com>
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

This patch introduces vp_modern_generation() to get device generation.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_pci_modern.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index cb14fc334a9c..a128e5814045 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -289,15 +289,26 @@ static void vp_set(struct virtio_device *vdev, unsigned offset,
 	}
 }
 
-static u32 vp_generation(struct virtio_device *vdev)
+/*
+ * vp_modern_generation - get the device genreation
+ * @mdev: the modern virtio-pci device
+ *
+ * Returns the genreation read from device
+ */
+static u32 vp_modern_generation(struct virtio_pci_modern_device *mdev)
 {
-	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
-	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
 	struct virtio_pci_common_cfg __iomem *cfg = mdev->common;
 
 	return vp_ioread8(&cfg->config_generation);
 }
 
+static u32 vp_generation(struct virtio_device *vdev)
+{
+	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+
+	return vp_modern_generation(&vp_dev->mdev);
+}
+
 /*
  * vp_modern_get_status - get the device status
  * @mdev: the modern virtio-pci device
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
