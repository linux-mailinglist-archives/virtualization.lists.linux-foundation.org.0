Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9171E247FBC
	for <lists.virtualization@lfdr.de>; Tue, 18 Aug 2020 09:48:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DD7078455D;
	Tue, 18 Aug 2020 07:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6l3VYiFWyrU; Tue, 18 Aug 2020 07:48:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 954EA8454F;
	Tue, 18 Aug 2020 07:48:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71B6DC0051;
	Tue, 18 Aug 2020 07:48:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E9BBC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 07:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6DAE28613C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 07:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hHiRTOqXYHPP
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 07:48:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E7D2586132
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 07:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597736916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=yo4kEY+qRk9I44ALuDXlR4fywd4izKlmhlTyX/YouR0=;
 b=ZNiV8PG5ekhk7Yj3e7k0C1HQrloW2wq2EIdpBrtVnz03L+DoW5a6BrQ1YKwlTHWgybhf8K
 RKSGwrdor8/gyMMMiX6ily9eMztTh6Q4JAkBGwP+5Gt6gDl1Zsc7aHya2GElqVM8snx56T
 yKk//BuNwP2ZDdPw4X7TgLs+S7F1PYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-wnVYBnzFPBOs3Ycc8Zs0ow-1; Tue, 18 Aug 2020 03:48:34 -0400
X-MC-Unique: wnVYBnzFPBOs3Ycc8Zs0ow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA694185E52C;
 Tue, 18 Aug 2020 07:48:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C615261B7;
 Tue, 18 Aug 2020 07:48:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 76E519CA6; Tue, 18 Aug 2020 09:48:29 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/virtio: set max_segment
Date: Tue, 18 Aug 2020 09:48:28 +0200
Message-Id: <20200818074828.9509-3-kraxel@redhat.com>
In-Reply-To: <20200818074828.9509-1-kraxel@redhat.com>
References: <20200818074828.9509-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
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

When initializing gem objects call virtio_max_dma_size() to figure the
scatter list limit.  Needed to make virtio-gpu work properly with SEV.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 1359eb8f1a02..26b608e2554e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -214,6 +214,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		goto err_free_gem;
 
 	bo->dumb = params->dumb;
+	shmem_obj->base.max_segment = virtio_max_dma_size(vgdev->vdev);
 
 	if (fence) {
 		ret = -ENOMEM;
-- 
2.18.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
