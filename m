Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 10435209712
	for <lists.virtualization@lfdr.de>; Thu, 25 Jun 2020 01:21:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A4F628840E;
	Wed, 24 Jun 2020 23:21:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIX2ixrfMpcC; Wed, 24 Jun 2020 23:21:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E89F988396;
	Wed, 24 Jun 2020 23:21:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6327C016F;
	Wed, 24 Jun 2020 23:21:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F625C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 23:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6ED7A883C0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 23:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dsSLxkP9ULR4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 23:21:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 360C488388
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 23:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593040891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wi1znm31qzcMq6s+LEuReOxrOa/3crQuccyoaVP19ws=;
 b=SuNJnLJZSzCNDzLbd77UEinFgelhJ43kYbBP/App4LSag+dRmM6eaerhTB3OUchN2OIgx3
 C8FDHySjIkD7SwCfiSJ51KYy1kNdOO6dGMovbFwJUmOHa+DQpP4tbL4Y5yxl6h+jKdjYzK
 O3hXdmJKFl/sQtCw13d6yH+KzhBiz9w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-tQaDOSa3OSGk9ZKj_n6euQ-1; Wed, 24 Jun 2020 19:21:29 -0400
X-MC-Unique: tQaDOSa3OSGk9ZKj_n6euQ-1
Received: by mail-wr1-f71.google.com with SMTP id n4so2798601wrj.15
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 16:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wi1znm31qzcMq6s+LEuReOxrOa/3crQuccyoaVP19ws=;
 b=c4V/NopsZB46r/LCD/0H3AGqQF2USZbOWBUTuEndohHoV38sqixp02oqAPEEsXQk3h
 Y1CfwjCPcfBqw8GkeGdZhR7vqLyjJOz6+D4Axnslf2GRs9RK8izua2rH8g03WDjKcn+i
 nOIcs5lKWH9uXjwXk/C9lHUDkV1MTxAUtEkgZN9pKxf8/zHONp7tQmRR8QPZXbvdtbRr
 1Z/HStMHJW6ZQ3D2oqoqTY9lJxMkbWJrDLRQW5XO43U0+lBgfdXLbzX+6QONnWdRyqmc
 NU8MBhCFBTULXfzgQ/NH3lRXvRVm0rPID4TDH8PZOOmMFX9VDeb56HkoB68OeLU/hEf4
 Fk4g==
X-Gm-Message-State: AOAM530EkpV40hv6JHhZ92W1yj6LGQ4cG6vZoe1t3HUqRWqZZFKX5lp0
 vDbw4vgQeSJZmtEhQ0RqHsaz/F2osSW9OgcagRLaN4o2aCeiE13RBkHKMBTNwZ3pvJh0p1doVXA
 31othx45wcluhkM8S6GeUGOjfsBk9rjIW597kX+veaQ==
X-Received: by 2002:adf:d1a9:: with SMTP id w9mr30827315wrc.344.1593040887206; 
 Wed, 24 Jun 2020 16:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5ir4N9wbti9tYY2l2bny6BHZhcJVYIhD0t4MJ3ccxojugpKeIyFBm3DZYFEVnjAyCrm+GsQ==
X-Received: by 2002:adf:d1a9:: with SMTP id w9mr30827294wrc.344.1593040886954; 
 Wed, 24 Jun 2020 16:21:26 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 e4sm2757194wrt.97.2020.06.24.16.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 16:21:26 -0700 (PDT)
Date: Wed, 24 Jun 2020 19:21:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] virtio: virtio_has_iommu_quirk -> virtio_has_dma_quirk
Message-ID: <20200624232035.704217-3-mst@redhat.com>
References: <20200624232035.704217-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200624232035.704217-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>
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

Now that the corresponding feature bit has been renamed,
rename the quirk too - it's about special ways to
do DMA, not necessarily about the IOMMU.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 4 ++--
 drivers/virtio/virtio_ring.c            | 2 +-
 include/linux/virtio_config.h           | 4 ++--
 tools/virtio/linux/virtio_config.h      | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 6ccbd01cd888..e8799ab0c753 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -141,7 +141,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 					struct virtio_gpu_mem_entry **ents,
 					unsigned int *nents)
 {
-	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
+	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
 	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 	struct scatterlist *sg;
 	int si, ret;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 9e663a5d9952..53af60d484a4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -599,7 +599,7 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
 	struct virtio_gpu_transfer_to_host_2d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
-	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
+	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
 	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 
 	if (use_dma_api)
@@ -1015,7 +1015,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
 	struct virtio_gpu_transfer_host_3d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
-	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
+	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
 	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 
 	if (use_dma_api)
diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index a1a5c2a91426..34253cb69cb8 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -240,7 +240,7 @@ static inline bool virtqueue_use_indirect(struct virtqueue *_vq,
 
 static bool vring_use_dma_api(struct virtio_device *vdev)
 {
-	if (!virtio_has_iommu_quirk(vdev))
+	if (!virtio_has_dma_quirk(vdev))
 		return true;
 
 	/* Otherwise, we are left to guess. */
diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index f2cc2a0df174..3b4eae5ac5e3 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -162,10 +162,10 @@ static inline bool virtio_has_feature(const struct virtio_device *vdev,
 }
 
 /**
- * virtio_has_iommu_quirk - determine whether this device has the iommu quirk
+ * virtio_has_dma_quirk - determine whether this device has the DMA quirk
  * @vdev: the device
  */
-static inline bool virtio_has_iommu_quirk(const struct virtio_device *vdev)
+static inline bool virtio_has_dma_quirk(const struct virtio_device *vdev)
 {
 	/*
 	 * Note the reverse polarity of the quirk feature (compared to most
diff --git a/tools/virtio/linux/virtio_config.h b/tools/virtio/linux/virtio_config.h
index f99ae42668e0..f2640e505c4e 100644
--- a/tools/virtio/linux/virtio_config.h
+++ b/tools/virtio/linux/virtio_config.h
@@ -42,10 +42,10 @@ static inline void __virtio_clear_bit(struct virtio_device *vdev,
 	(__virtio_test_bit((dev), feature))
 
 /**
- * virtio_has_iommu_quirk - determine whether this device has the iommu quirk
+ * virtio_has_dma_quirk - determine whether this device has the DMA quirk
  * @vdev: the device
  */
-static inline bool virtio_has_iommu_quirk(const struct virtio_device *vdev)
+static inline bool virtio_has_dma_quirk(const struct virtio_device *vdev)
 {
 	/*
 	 * Note the reverse polarity of the quirk feature (compared to most
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
