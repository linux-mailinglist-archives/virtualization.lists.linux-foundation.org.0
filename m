Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E50D31D970
	for <lists.virtualization@lfdr.de>; Wed, 17 Feb 2021 13:32:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 07D8B86D18;
	Wed, 17 Feb 2021 12:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9lU5WCw6x-Yf; Wed, 17 Feb 2021 12:32:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D6F186D2F;
	Wed, 17 Feb 2021 12:32:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F77DC0174;
	Wed, 17 Feb 2021 12:32:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A48DFC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9481286D18
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:32:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9rD7RjC31xRi
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:32:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8DE6486D19
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613565146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BMcEaTsr6hvZpRTO/Z+/hPVLzGmBLIj423n6krFv2UM=;
 b=jSZyKMSWwLspmy9FRZs0s0nJZXEsIFXudw4SUQLAxQ/wdObnv7AeLfs8jyeU5TZ0n5e8uV
 WbOS709tB+xBPU2ieI9nqRsjPDlPj/Lyn5hWvdGqLYCteXo/f1u4wMeI1g50i6kP++WKcn
 tIK+4LSy+LhWsBYrz/czLPSsXk2cSEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-6b1LB9eDNZCnIMIw3U7qcQ-1; Wed, 17 Feb 2021 07:32:24 -0500
X-MC-Unique: 6b1LB9eDNZCnIMIw3U7qcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42A08801975;
 Wed, 17 Feb 2021 12:32:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D77119D9B;
 Wed, 17 Feb 2021 12:32:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3A8EB1800630; Wed, 17 Feb 2021 13:32:15 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/11] drm/qxl: add lock asserts to qxl_bo_vmap_locked +
 qxl_bo_vunmap_locked
Date: Wed, 17 Feb 2021 13:32:13 +0100
Message-Id: <20210217123213.2199186-12-kraxel@redhat.com>
In-Reply-To: <20210217123213.2199186-1-kraxel@redhat.com>
References: <20210217123213.2199186-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
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

Try avoid re-introducing locking bugs.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_object.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 82c3bf195ad6..6e26d70f2f07 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -162,6 +162,8 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct dma_buf_map *map)
 {
 	int r;
 
+	dma_resv_assert_held(bo->tbo.base.resv);
+
 	if (bo->kptr) {
 		bo->map_count++;
 		goto out;
@@ -236,6 +238,8 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
 
 void qxl_bo_vunmap_locked(struct qxl_bo *bo)
 {
+	dma_resv_assert_held(bo->tbo.base.resv);
+
 	if (bo->kptr == NULL)
 		return;
 	bo->map_count--;
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
