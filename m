Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0041D11AA9F
	for <lists.virtualization@lfdr.de>; Wed, 11 Dec 2019 13:20:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6FA8088538;
	Wed, 11 Dec 2019 12:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6O9emjIrfRG1; Wed, 11 Dec 2019 12:20:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DD0F688171;
	Wed, 11 Dec 2019 12:20:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEE32C0881;
	Wed, 11 Dec 2019 12:20:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC3B5C0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 12:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C7FFF878A0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 12:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7gQCKENBHrii
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 12:20:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 72A60878A8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576066806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UIewAyx++ktQ/Uek8hL3crFT01ZthoO/ZwsAoVP4Ej8=;
 b=K/p3RvmEV2+B9h+FgaKu8/5HR78X/NHceqzzq2SeQ5c76d516ok0X4DyrHttFekhP9tdlz
 IXw/HqFyD7UT0afVb/B3/iOp8w85ly0ltBSBSQw26ZK03/jbJazQ7BO5sVTw2FBIIdP5bc
 jA9Wul27rZNEogkUuKNkW95mSq4VAvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-VXS_jZefO9GEJcB7iAO75Q-1; Wed, 11 Dec 2019 07:20:02 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 052361005524;
 Wed, 11 Dec 2019 12:20:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D956691A0;
 Wed, 11 Dec 2019 12:19:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 746BA17536; Wed, 11 Dec 2019 13:19:57 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/virtio: fix mmap page attributes
Date: Wed, 11 Dec 2019 13:19:55 +0100
Message-Id: <20191211121957.18637-4-kraxel@redhat.com>
In-Reply-To: <20191211121957.18637-1-kraxel@redhat.com>
References: <20191211121957.18637-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: VXS_jZefO9GEJcB7iAO75Q-1
X-Mimecast-Spam-Score: 0
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, gurchetansingh@chromium.org
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

virtio-gpu uses cached mappings, set virtio_gpu_gem_funcs.pgprot
accordingly.

Reported-by: Gurchetan Singh <gurchetansingh@chromium.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 017a9e0fc3bb..0b754c5bbcce 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -87,6 +87,7 @@ static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
 	.vmap = drm_gem_shmem_vmap,
 	.vunmap = drm_gem_shmem_vunmap,
 	.mmap = &drm_gem_shmem_mmap,
+	.pgprot = &drm_gem_pgprot_cached,
 };
 
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
