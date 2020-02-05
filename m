Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B4E152914
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 11:26:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C5AF085A54;
	Wed,  5 Feb 2020 10:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmdl7L7a88yO; Wed,  5 Feb 2020 10:26:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D164E85A32;
	Wed,  5 Feb 2020 10:26:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7048C0174;
	Wed,  5 Feb 2020 10:26:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0AEEC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CF32985A32
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ow2QKu434PSr
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:26:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4125D85A1E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580898362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=ty2qopoz5uFvayM3OqAA/q+IIy2XgdQGOmBn5/Sdrz8=;
 b=ICfvoMYKQ6uXyXkZqzgEKBgkC4OhaBkclCI0oP3BOKrIEjZqgWt/JtyLCEPdw9ujubcSQw
 jZsVjvaBFqqa+5nNMwKLMzg0JAZrsOSGhFmpuO7SLSFimg+7bwqVq+UCiH+kgHG6pRM4BS
 pQrqdqwlEuxdIPKghVigO4rQ+J/B3mM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-vJRFFA-wOqCyJns9a-gY-g-1; Wed, 05 Feb 2020 05:25:58 -0500
X-MC-Unique: vJRFFA-wOqCyJns9a-gY-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EB471075920;
 Wed,  5 Feb 2020 10:25:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8441E2135;
 Wed,  5 Feb 2020 10:25:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BCD69A1E0; Wed,  5 Feb 2020 11:25:52 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: ratelimit error logging
Date: Wed,  5 Feb 2020 11:25:52 +0100
Message-Id: <20200205102552.21409-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Avoid flooding the log in case we screw up badly.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 5914e79d3429..83f22933c3bb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -212,9 +212,9 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
 			if (resp->type >= cpu_to_le32(VIRTIO_GPU_RESP_ERR_UNSPEC)) {
 				struct virtio_gpu_ctrl_hdr *cmd;
 				cmd = (struct virtio_gpu_ctrl_hdr *)entry->buf;
-				DRM_ERROR("response 0x%x (command 0x%x)\n",
-					  le32_to_cpu(resp->type),
-					  le32_to_cpu(cmd->type));
+				DRM_ERROR_RATELIMITED("response 0x%x (command 0x%x)\n",
+						      le32_to_cpu(resp->type),
+						      le32_to_cpu(cmd->type));
 			} else
 				DRM_DEBUG("response 0x%x\n", le32_to_cpu(resp->type));
 		}
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
