Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B79111CD8F
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 13:54:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2078488802;
	Thu, 12 Dec 2019 12:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PwPyiLWEde-4; Thu, 12 Dec 2019 12:54:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AF1A688800;
	Thu, 12 Dec 2019 12:54:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9196FC0881;
	Thu, 12 Dec 2019 12:54:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32BD0C0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2C45086F0F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2yWPR5bUG9Og
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:53:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5639286DBF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576155236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=VVeZNerFz0m8O8v6gQkmOYeCxlg/A2VEf1w2oz635Wg=;
 b=irOxEBT8u4JUbG7ue27fUm3TJo/s0U4IR1pTgs7fvmz29vCt+vp1BfA3QAOfVqnIE/ARMM
 sAIxwhQj+1kPAe/zbZ07ekqz+AqqfEm9UBXYv/cR4pgabMEOWEOzpSTUl4T1YujVHryJo8
 oHl5q9/aYDDB1oL7cwsNU8AoBeSTsAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-KWdqMaUROhClFtPph7_W8w-1; Thu, 12 Dec 2019 07:53:52 -0500
X-MC-Unique: KWdqMaUROhClFtPph7_W8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36297A89A18;
 Thu, 12 Dec 2019 12:53:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.36.118.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA8EA5DA7D;
 Thu, 12 Dec 2019 12:53:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E843C9DB3; Thu, 12 Dec 2019 13:53:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/virtio: skip set_scanout if framebuffer didn't
 change
Date: Thu, 12 Dec 2019 13:53:44 +0100
Message-Id: <20191212125346.8334-2-kraxel@redhat.com>
In-Reply-To: <20191212125346.8334-1-kraxel@redhat.com>
References: <20191212125346.8334-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

v2: also check src rect (Chia-I Wu).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 35 +++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index bc4bc4475a8c..59bf76d4a333 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -151,20 +151,27 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	if (bo->dumb)
 		virtio_gpu_update_dumb_bo(vgdev, bo, plane->state);
 
-	DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
-		  bo->hw_res_handle,
-		  plane->state->crtc_w, plane->state->crtc_h,
-		  plane->state->crtc_x, plane->state->crtc_y,
-		  plane->state->src_w >> 16,
-		  plane->state->src_h >> 16,
-		  plane->state->src_x >> 16,
-		  plane->state->src_y >> 16);
-	virtio_gpu_cmd_set_scanout(vgdev, output->index,
-				   bo->hw_res_handle,
-				   plane->state->src_w >> 16,
-				   plane->state->src_h >> 16,
-				   plane->state->src_x >> 16,
-				   plane->state->src_y >> 16);
+	if (plane->state->fb != old_state->fb ||
+	    plane->state->src_w != old_state->src_w ||
+	    plane->state->src_h != old_state->src_h ||
+	    plane->state->src_x != old_state->src_x ||
+	    plane->state->src_y != old_state->src_y) {
+		DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
+			  bo->hw_res_handle,
+			  plane->state->crtc_w, plane->state->crtc_h,
+			  plane->state->crtc_x, plane->state->crtc_y,
+			  plane->state->src_w >> 16,
+			  plane->state->src_h >> 16,
+			  plane->state->src_x >> 16,
+			  plane->state->src_y >> 16);
+		virtio_gpu_cmd_set_scanout(vgdev, output->index,
+					   bo->hw_res_handle,
+					   plane->state->src_w >> 16,
+					   plane->state->src_h >> 16,
+					   plane->state->src_x >> 16,
+					   plane->state->src_y >> 16);
+	}
+
 	virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
 				      plane->state->src_x >> 16,
 				      plane->state->src_y >> 16,
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
