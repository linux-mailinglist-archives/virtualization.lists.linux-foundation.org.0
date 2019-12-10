Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C9B1182E8
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 09:58:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8E7CB20532;
	Tue, 10 Dec 2019 08:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQUpByV8dRbt; Tue, 10 Dec 2019 08:58:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A7FB820780;
	Tue, 10 Dec 2019 08:58:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FFD6C0881;
	Tue, 10 Dec 2019 08:58:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD0F9C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 08:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C957A20532
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 08:58:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKMOsWz799QD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 08:58:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 0A9CB2046D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 08:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575968288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B3uP/SCLcrRR2RNPhR22qrcwSwHoRfQCsZKJS7KksnQ=;
 b=cALaxNX4OXju1tZiGP6Pw8x+Wph4faaAHTOjqD1Er8hJyz1IYclVNSK/TkcafdJtQXkX7N
 TcJ6tgONRrXHMjBZ4sFXacsFmO+LKo8/Y4UfbeWhTtA3VelEuahRLJDiOxkIBu/VLXPxPX
 S5Loh+e/U8Kg18wIEq5vwLL2Pp+cHos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-5yTMreCZOyGtterTydZw-g-1; Tue, 10 Dec 2019 03:58:05 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA41318557E6;
 Tue, 10 Dec 2019 08:58:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E04E6F12C;
 Tue, 10 Dec 2019 08:58:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 95C5E16E18; Tue, 10 Dec 2019 09:57:59 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: fix mmap page attributes
Date: Tue, 10 Dec 2019 09:57:59 +0100
Message-Id: <20191210085759.14763-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 5yTMreCZOyGtterTydZw-g-1
X-Mimecast-Spam-Score: 0
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
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

virtio-gpu uses cached mappings.  shmem helpers use writecombine though.
So roll our own mmap function, wrapping drm_gem_shmem_mmap(), to tweak
vm_page_prot accordingly.

Reported-by: Gurchetan Singh <gurchetansingh@chromium.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 017a9e0fc3bb..158610902054 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -75,6 +75,22 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 	drm_gem_shmem_free_object(obj);
 }
 
+static int virtio_gpu_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	pgprot_t prot;
+	int ret;
+
+	ret = drm_gem_shmem_mmap(obj, vma);
+	if (ret < 0)
+		return ret;
+
+	/* virtio-gpu needs normal caching, so clear writecombine */
+	prot = vm_get_page_prot(vma->vm_flags);
+	prot = pgprot_decrypted(prot);
+	vma->vm_page_prot = prot;
+	return 0;
+}
+
 static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
 	.free = virtio_gpu_free_object,
 	.open = virtio_gpu_gem_object_open,
@@ -86,7 +102,7 @@ static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
 	.get_sg_table = drm_gem_shmem_get_sg_table,
 	.vmap = drm_gem_shmem_vmap,
 	.vunmap = drm_gem_shmem_vunmap,
-	.mmap = &drm_gem_shmem_mmap,
+	.mmap = &virtio_gpu_gem_mmap,
 };
 
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
