Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D66E1CD549
	for <lists.virtualization@lfdr.de>; Mon, 11 May 2020 11:36:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E6E95881D0;
	Mon, 11 May 2020 09:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6X9KVwBLXdB; Mon, 11 May 2020 09:36:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D1EAF8885A;
	Mon, 11 May 2020 09:36:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0DB2C016F;
	Mon, 11 May 2020 09:36:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C90CFC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 09:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B400D87913
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 09:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8JiWi6dgXYZE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 09:36:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B2A73861D2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 09:36:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g14so6377543wme.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 02:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a0X0skQipwwu/MYr2+ovRTNBZcwuUbLOjMGRxojQ+/8=;
 b=S5C43F1s8M379cfRkakmxvK3avAmpeW4DZs5wVNHwPskshXKfMAm9GMHG2u0rDEBBl
 pXYaajCxsJl9MpU4Jrk2qBYfGK6PXFhzbmXXGJ1SkkwJUnaAWKEMt8hwAgMZXR6MBNC6
 z07MgT5CjiNkfphpnBCnAntDwXEm5TWExOVaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a0X0skQipwwu/MYr2+ovRTNBZcwuUbLOjMGRxojQ+/8=;
 b=AE+HbF9VxdQ1cvoI4rxoIwaxTs/1eoKbEeiDEb+392VszLtZj0XR2autbNdA7Nofyh
 IJ9upr3Rd/81CV1iMbPq9zCdaz+J5qm8kTpdHnWhGbFn8gM+OpiDuEQo7tPC4UQGW465
 RlnTAsfEHORzSTKm0zTNLkQ2a8JfVRw19zs2Th7a+1NVOwgmR5JLL4dmQjwG7woKzumJ
 x68z60+U+fMKv55vyCbpeq9OL+i5anU6YrDsAYAqhR4DOgiZxOuPOp7yiCBidL1mBSzW
 UdMBVCBRYnNpmoukhxG2kvLr/KKI8NRnpnLdV2dc+r7vWrLLHVL2M75XgBfLjWqIlfWH
 dy/g==
X-Gm-Message-State: AGi0PubBBEnCz2lC9UzISY2/IBVa4IK68WyoOnDmvq3Q1Rbcer5n9f1m
 F+iRbZrdozSbeiiW4hKbBZlqRg==
X-Google-Smtp-Source: APiQypK2RGuKB4M48yS3I+tFBszsLZ1iQCZ3KihJ6U+IdRS5YIOSsz98h7iGrTA25CjEKuw0/oEsRw==
X-Received: by 2002:a1c:3d08:: with SMTP id k8mr20320037wma.16.1589189764098; 
 Mon, 11 May 2020 02:36:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q17sm9013945wmk.36.2020.05.11.02.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:36:03 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/9] drm/virtio: Call the right shmem helpers
Date: Mon, 11 May 2020 11:35:49 +0200
Message-Id: <20200511093554.211493-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Daniel Vetter <daniel.vetter@intel.com>
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

drm_gem_shmem_get_sg_table is meant to implement
obj->funcs->get_sg_table, for prime exporting. The one we want is
drm_gem_shmem_get_pages_sgt, which also handles imported dma-buf, not
just native objects.

v2: Rebase, this stuff moved around in

commit 2f2aa13724d56829d910b2fa8e80c502d388f106
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Feb 7 08:46:38 2020 +0100

    drm/virtio: move virtio_gpu_mem_entry initialization to new function

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 6ccbd01cd888..346cef5ce251 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -150,7 +150,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	if (ret < 0)
 		return -EINVAL;
 
-	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base.base);
+	shmem->pages = drm_gem_shmem_get_pages_sgt(&bo->base.base);
 	if (!shmem->pages) {
 		drm_gem_shmem_unpin(&bo->base.base);
 		return -EINVAL;
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
