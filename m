Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E81AE40843D
	for <lists.virtualization@lfdr.de>; Mon, 13 Sep 2021 07:56:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9598B81815;
	Mon, 13 Sep 2021 05:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hoRv5GyktH2C; Mon, 13 Sep 2021 05:56:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 69B3C81831;
	Mon, 13 Sep 2021 05:56:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFC92C000D;
	Mon, 13 Sep 2021 05:56:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C911C000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 05:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E46C40438
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 05:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ez4yQI3tK2KH
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 05:56:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C972140422
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 05:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631512561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtqcK8OBOXRr6ZBw1JH6UfUdpU3S//kleHWjxjhJDLY=;
 b=ML5Uw+zn/VvDEPGVuoHCIiSuV3GRSaGMx2O/LyfYII6VgX2ndyLyFOb4mASfJfUgCGuPVw
 NtqJF2PoGlJgiSUje0uL170grLc3w46bEwIssIfJ/MxA13Eds6jl33QQTQ+hI+mDjMJpbQ
 cvUoeCJv5AF92XxAkM7iMGDW0ke/ULs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-eqVKmdeqNLGOQlI_rUhG-g-1; Mon, 13 Sep 2021 01:54:43 -0400
X-MC-Unique: eqVKmdeqNLGOQlI_rUhG-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D3C7800FF3;
 Mon, 13 Sep 2021 05:54:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-146.pek2.redhat.com
 [10.72.13.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 180445C3E0;
 Mon, 13 Sep 2021 05:54:39 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 5/9] virtio_config: introduce a new ready method
Date: Mon, 13 Sep 2021 13:53:49 +0800
Message-Id: <20210913055353.35219-6-jasowang@redhat.com>
In-Reply-To: <20210913055353.35219-1-jasowang@redhat.com>
References: <20210913055353.35219-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: konrad.wilk@oracle.com, f.hetzelt@tu-berlin.de,
 linux-kernel@vger.kernel.org, david.kaplan@amd.com,
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

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/linux/virtio_config.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index 8519b3ae5d52..f2891c6221a1 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -23,6 +23,8 @@ struct virtio_shm_region {
  *       any of @get/@set, @get_status/@set_status, or @get_features/
  *       @finalize_features are NOT safe to be called from an atomic
  *       context.
+ * @ready: make the device ready
+ *      vdev: the virtio_device
  * @get: read the value of a configuration field
  *	vdev: the virtio_device
  *	offset: the offset of the configuration field
@@ -75,6 +77,7 @@ struct virtio_shm_region {
  */
 typedef void vq_callback_t(struct virtqueue *);
 struct virtio_config_ops {
+	void (*ready)(struct virtio_device *vdev);
 	void (*get)(struct virtio_device *vdev, unsigned offset,
 		    void *buf, unsigned len);
 	void (*set)(struct virtio_device *vdev, unsigned offset,
@@ -229,6 +232,9 @@ void virtio_device_ready(struct virtio_device *dev)
 {
 	unsigned status = dev->config->get_status(dev);
 
+	if (dev->config->ready)
+                  dev->config->ready(dev);
+
 	BUG_ON(status & VIRTIO_CONFIG_S_DRIVER_OK);
 	dev->config->set_status(dev, status | VIRTIO_CONFIG_S_DRIVER_OK);
 }
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
