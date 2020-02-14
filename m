Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F3515D7BE
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 13:55:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BA0F52049B;
	Fri, 14 Feb 2020 12:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKEBUJEPAsjE; Fri, 14 Feb 2020 12:55:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 194BA2153B;
	Fri, 14 Feb 2020 12:55:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED6B1C0177;
	Fri, 14 Feb 2020 12:55:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5FD1EC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 12:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4E7C12049B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 12:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03VOh+EfGpcn
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 12:55:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 76A6F2000A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581684944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=8duA2CSTZJ/D4OXupaeu5RX7sn/+mjIbfxnUvdv+r4I=;
 b=VRsf7p3fX1U/nwCrYlgQfwH5vvAe40SKpu8uXzvkU3T0ue3+c2S9bPL8twbOcLEZ2WNYch
 Qcahvjn3CRSrZN5gQQbdpGCEjt2MlZEbj4R7vWQm9PLtYeqBa2KdvIXJ8piL6cCTq3Em0o
 OLbvonKBsj+xRZTy/Er11+pFipXutKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-nSNKCPexNCG9_rq1qT9k8A-1; Fri, 14 Feb 2020 07:55:42 -0500
X-MC-Unique: nSNKCPexNCG9_rq1qT9k8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA7B918C43C1;
 Fri, 14 Feb 2020 12:55:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 721041001B2D;
 Fri, 14 Feb 2020 12:55:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 070AD31F68; Fri, 14 Feb 2020 13:55:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 5/6] drm/virtio: batch display query
Date: Fri, 14 Feb 2020 13:55:34 +0100
Message-Id: <20200214125535.26349-6-kraxel@redhat.com>
In-Reply-To: <20200214125535.26349-1-kraxel@redhat.com>
References: <20200214125535.26349-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Move virtio_gpu_notify() to higher-level functions for
virtio_gpu_cmd_get_display_info() and virtio_gpu_cmd_get_edids().

virtio_gpu_config_changed_work_func() and virtio_gpu_init() will
batch commands and notify only once per update

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 2 ++
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 4009c2f97d08..8fd7acef960f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -44,6 +44,7 @@ static void virtio_gpu_config_changed_work_func(struct work_struct *work)
 		if (vgdev->has_edid)
 			virtio_gpu_cmd_get_edids(vgdev);
 		virtio_gpu_cmd_get_display_info(vgdev);
+		virtio_gpu_notify(vgdev);
 		drm_helper_hpd_irq_event(vgdev->ddev);
 		events_clear |= VIRTIO_GPU_EVENT_DISPLAY;
 	}
@@ -205,6 +206,7 @@ int virtio_gpu_init(struct drm_device *dev)
 	if (vgdev->has_edid)
 		virtio_gpu_cmd_get_edids(vgdev);
 	virtio_gpu_cmd_get_display_info(vgdev);
+	virtio_gpu_notify(vgdev);
 	wait_event_timeout(vgdev->resp_wq, !vgdev->display_info_pending,
 			   5 * HZ);
 	return 0;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 4e9b2f2e71bd..2e108b426244 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -775,7 +775,6 @@ int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev)
 	vgdev->display_info_pending = true;
 	cmd_p->type = cpu_to_le32(VIRTIO_GPU_CMD_GET_DISPLAY_INFO);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_notify(vgdev);
 	return 0;
 }
 
@@ -903,7 +902,6 @@ int virtio_gpu_cmd_get_edids(struct virtio_gpu_device *vgdev)
 		cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_EDID);
 		cmd_p->scanout = cpu_to_le32(scanout);
 		virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-		virtio_gpu_notify(vgdev);
 	}
 
 	return 0;
-- 
2.18.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
