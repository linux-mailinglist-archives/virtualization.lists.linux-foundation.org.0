Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 668CB17030D
	for <lists.virtualization@lfdr.de>; Wed, 26 Feb 2020 16:48:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B9AE86E0A;
	Wed, 26 Feb 2020 15:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KAFYiuT06z-V; Wed, 26 Feb 2020 15:48:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9A0F7876DB;
	Wed, 26 Feb 2020 15:48:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80DA6C0177;
	Wed, 26 Feb 2020 15:48:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11C8AC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 15:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 000AC86B1C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 15:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QK2nPX5_FXnP
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 15:48:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E82B2862B4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 15:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582732084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=0hBOHXRxGQzs7sC6MP4NSUkQgLwz4qRn+BWsljwDM7Q=;
 b=eDfIyeCdBgkGP/nzsUjHA0hDpt7lpso1EVy0fnI4aHgh5x46jdd2LsJYYwxkdOkpCk8RIA
 /9bJn2ZYnkCcG2E4WcyGeUAvPOpA5zkflJMUiMKEdZzdRRCJh1D3WtFOyqrBh2yPwL8Fth
 SkbkoqnwnuX9aIUL2WSh0wfEjCmWGYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-3H3FylnoMz6nWrRPDbsPGQ-1; Wed, 26 Feb 2020 10:47:59 -0500
X-MC-Unique: 3H3FylnoMz6nWrRPDbsPGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA4141137840;
 Wed, 26 Feb 2020 15:47:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10D1A60BE1;
 Wed, 26 Feb 2020 15:47:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2D95E1FCE8; Wed, 26 Feb 2020 16:47:53 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/3] drm/virtio: fix mmap page attributes
Date: Wed, 26 Feb 2020 16:47:51 +0100
Message-Id: <20200226154752.24328-3-kraxel@redhat.com>
In-Reply-To: <20200226154752.24328-1-kraxel@redhat.com>
References: <20200226154752.24328-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Guillaume.Gardet@arm.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 gurchetansingh@chromium.org, tzimmermann@suse.de,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 olvaffe@gmail.com
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

virtio-gpu uses cached mappings, set
drm_gem_shmem_object.map_cached accordingly.

Cc: stable@vger.kernel.org
Fixes: c66df701e783 ("drm/virtio: switch from ttm to gem shmem helpers")
Reported-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reported-by: Guillaume Gardet <Guillaume.Gardet@arm.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 3d2a6d489bfc..59319435218f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -119,6 +119,7 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 		return NULL;
 
 	bo->base.base.funcs = &virtio_gpu_gem_funcs;
+	bo->base.map_cached = true;
 	return &bo->base.base;
 }
 
-- 
2.18.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
