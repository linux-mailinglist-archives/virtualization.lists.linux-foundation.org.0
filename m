Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C711015532D
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 08:46:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D7BA875C2;
	Fri,  7 Feb 2020 07:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XELRY8L9d9UP; Fri,  7 Feb 2020 07:46:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BA15987B2B;
	Fri,  7 Feb 2020 07:46:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90A8AC013E;
	Fri,  7 Feb 2020 07:46:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7308C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9D5BA203B5
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7H8r9GR1gQKw
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:46:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id B80E1203CA
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581061605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=SUzQd6LFEwB3hirjXChHgZ4lmXv/SBqu0oNtoi7asxQ=;
 b=ax75UrtcEnxvYpsjZevD7Y3ggegCKZYH9UxOBrYm/INNfh6dKtWPcBwpCVQvqoE4AvvYFl
 eyHXNLytFJ/pBdS+vuI7e7pB4DJcorcJIX15sNdUzjxGsNlat00q4THbxQIQ0u0YqpC+rX
 DBEV9YHbI1Tfk9Xd1XIU6rve84GdNf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-Ase0DdZMOJG3dMa_il8VyA-1; Fri, 07 Feb 2020 02:46:43 -0500
X-MC-Unique: Ase0DdZMOJG3dMa_il8VyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6D64DB60;
 Fri,  7 Feb 2020 07:46:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16B4B60C05;
 Fri,  7 Feb 2020 07:46:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6C06431F39; Fri,  7 Feb 2020 08:46:38 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/virtio: simplify virtio_gpu_alloc_cmd
Date: Fri,  7 Feb 2020 08:46:35 +0100
Message-Id: <20200207074638.26386-2-kraxel@redhat.com>
In-Reply-To: <20200207074638.26386-1-kraxel@redhat.com>
References: <20200207074638.26386-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, gurchetansingh@chromium.org,
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

Just call virtio_gpu_alloc_cmd_resp with some fixed args
instead of duplicating most of the function body.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 41e475fbd67b..df499fb64ac7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -120,23 +120,6 @@ virtio_gpu_vbuf_ctrl_hdr(struct virtio_gpu_vbuffer *vbuf)
 	return (struct virtio_gpu_ctrl_hdr *)vbuf->buf;
 }
 
-static void *virtio_gpu_alloc_cmd(struct virtio_gpu_device *vgdev,
-				  struct virtio_gpu_vbuffer **vbuffer_p,
-				  int size)
-{
-	struct virtio_gpu_vbuffer *vbuf;
-
-	vbuf = virtio_gpu_get_vbuf(vgdev, size,
-				   sizeof(struct virtio_gpu_ctrl_hdr),
-				   NULL, NULL);
-	if (IS_ERR(vbuf)) {
-		*vbuffer_p = NULL;
-		return ERR_CAST(vbuf);
-	}
-	*vbuffer_p = vbuf;
-	return vbuf->buf;
-}
-
 static struct virtio_gpu_update_cursor*
 virtio_gpu_alloc_cursor(struct virtio_gpu_device *vgdev,
 			struct virtio_gpu_vbuffer **vbuffer_p)
@@ -172,6 +155,15 @@ static void *virtio_gpu_alloc_cmd_resp(struct virtio_gpu_device *vgdev,
 	return (struct virtio_gpu_command *)vbuf->buf;
 }
 
+static void *virtio_gpu_alloc_cmd(struct virtio_gpu_device *vgdev,
+				  struct virtio_gpu_vbuffer **vbuffer_p,
+				  int size)
+{
+	return virtio_gpu_alloc_cmd_resp(vgdev, NULL, vbuffer_p, size,
+					 sizeof(struct virtio_gpu_ctrl_hdr),
+					 NULL);
+}
+
 static void free_vbuf(struct virtio_gpu_device *vgdev,
 		      struct virtio_gpu_vbuffer *vbuf)
 {
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
