Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B76915BF1C
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 14:22:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3E8A386E18;
	Thu, 13 Feb 2020 13:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XafQ1SwR++vb; Thu, 13 Feb 2020 13:22:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 00F8486D2F;
	Thu, 13 Feb 2020 13:22:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E902CC0177;
	Thu, 13 Feb 2020 13:22:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E6A9C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1D60A86C18
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OS5Dx0th22Uu
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:22:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 38A3986B68
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581600134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=5EatEPQudpiUKbeJ4n/F+XA+cWPrST5Nenz3vPabTag=;
 b=DF3jqZdThGLyv0/6L2tXft0Pfz5AvqFnpKbVcgGG0xvOuIrzDUk2sAeoI0d98NgWsZmPXw
 X8fNOUAYr524cZ7hLaD0mNqYnOfrZF9XVFXbh3U5VF/GBxVmlaX8kXJCtRkzKpaR1Vt6eZ
 79adMBQKTW4AS4sWwZ/kyuvi1SOMR+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-VFNE9Dm_M5aACxdNPrO6Cg-1; Thu, 13 Feb 2020 08:22:09 -0500
X-MC-Unique: VFNE9Dm_M5aACxdNPrO6Cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38C901005502;
 Thu, 13 Feb 2020 13:22:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5163660BF4;
 Thu, 13 Feb 2020 13:22:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 992CD3EC25; Thu, 13 Feb 2020 14:22:04 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/virtio: batch display query.
Date: Thu, 13 Feb 2020 14:22:03 +0100
Message-Id: <20200213132203.23441-5-kraxel@redhat.com>
In-Reply-To: <20200213132203.23441-1-kraxel@redhat.com>
References: <20200213132203.23441-1-kraxel@redhat.com>
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

Move virtio_gpu_notify() to higher-level functions for
virtio_gpu_cmd_get_display_info() and virtio_gpu_cmd_get_edids().

virtio_gpu_config_changed_work_func() and virtio_gpu_init() will
batch commands and notify only once per update

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
index 778b7acf2f7f..f5740d7b67be 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -774,7 +774,6 @@ int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev)
 	vgdev->display_info_pending = true;
 	cmd_p->type = cpu_to_le32(VIRTIO_GPU_CMD_GET_DISPLAY_INFO);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_notify(vgdev);
 	return 0;
 }
 
@@ -902,7 +901,6 @@ int virtio_gpu_cmd_get_edids(struct virtio_gpu_device *vgdev)
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
