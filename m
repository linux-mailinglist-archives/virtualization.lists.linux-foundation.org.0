Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC53397E85
	for <lists.virtualization@lfdr.de>; Wed,  2 Jun 2021 04:11:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FEC14029F;
	Wed,  2 Jun 2021 02:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3RMuJAl7j48Y; Wed,  2 Jun 2021 02:11:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3DC640272;
	Wed,  2 Jun 2021 02:11:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71BF2C0001;
	Wed,  2 Jun 2021 02:11:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A6E3C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88DC8836FE
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:11:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2smwKhGeF4t3
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:11:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C50E9836E1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 02:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622599861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpp86MKQOz0QZsgGameycFz6/zr05nCyS0wGULJidQo=;
 b=cB9ebHzD/uMOPx+fJ1ij1V0nrUM+YCRol0VxCRdoNF6Pe9BWhHIE0eArwBiLqQZhyjIyGt
 08AnEGAR9s5M4jazk5Svw9wPkESkYFy7O0VuY4ivP5jAS+06bv+F1DM01VZqWMMsx/7xKH
 iJzUmLX7vd6+KQDd848sXh28C8hOiSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-a1fIgH-tN0WREjueqphQag-1; Tue, 01 Jun 2021 22:11:00 -0400
X-MC-Unique: a1fIgH-tN0WREjueqphQag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BDFB501E1;
 Wed,  2 Jun 2021 02:10:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-99.pek2.redhat.com [10.72.12.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FA2C5D6CF;
 Wed,  2 Jun 2021 02:10:56 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH V2 2/4] virtio-pci library: introduce
 vp_modern_get_driver_features()
Date: Wed,  2 Jun 2021 10:10:41 +0800
Message-Id: <20210602021043.39201-3-jasowang@redhat.com>
In-Reply-To: <20210602021043.39201-1-jasowang@redhat.com>
References: <20210602021043.39201-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: eli@mellanox.com
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

This patch introduce a helper to get driver/guest features from the
device.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_pci_modern_dev.c | 21 +++++++++++++++++++++
 include/linux/virtio_pci_modern.h      |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/virtio/virtio_pci_modern_dev.c b/drivers/virtio/virtio_pci_modern_dev.c
index 54f297028586..e11ed748e661 100644
--- a/drivers/virtio/virtio_pci_modern_dev.c
+++ b/drivers/virtio/virtio_pci_modern_dev.c
@@ -383,6 +383,27 @@ u64 vp_modern_get_features(struct virtio_pci_modern_device *mdev)
 }
 EXPORT_SYMBOL_GPL(vp_modern_get_features);
 
+/*
+ * vp_modern_get_driver_features - get driver features from device
+ * @mdev: the modern virtio-pci device
+ *
+ * Returns the driver features read from the device
+ */
+u64 vp_modern_get_driver_features(struct virtio_pci_modern_device *mdev)
+{
+	struct virtio_pci_common_cfg __iomem *cfg = mdev->common;
+
+	u64 features;
+
+	vp_iowrite32(0, &cfg->guest_feature_select);
+	features = vp_ioread32(&cfg->guest_feature);
+	vp_iowrite32(1, &cfg->guest_feature_select);
+	features |= ((u64)vp_ioread32(&cfg->guest_feature) << 32);
+
+	return features;
+}
+EXPORT_SYMBOL_GPL(vp_modern_get_driver_features);
+
 /*
  * vp_modern_set_features - set features to device
  * @mdev: the modern virtio-pci device
diff --git a/include/linux/virtio_pci_modern.h b/include/linux/virtio_pci_modern.h
index 6a95b58fd0f4..eb2bd9b4077d 100644
--- a/include/linux/virtio_pci_modern.h
+++ b/include/linux/virtio_pci_modern.h
@@ -79,6 +79,7 @@ static inline void vp_iowrite64_twopart(u64 val,
 }
 
 u64 vp_modern_get_features(struct virtio_pci_modern_device *mdev);
+u64 vp_modern_get_driver_features(struct virtio_pci_modern_device *mdev);
 void vp_modern_set_features(struct virtio_pci_modern_device *mdev,
 		     u64 features);
 u32 vp_modern_generation(struct virtio_pci_modern_device *mdev);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
