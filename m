Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 42726291AD8
	for <lists.virtualization@lfdr.de>; Sun, 18 Oct 2020 21:27:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED223873E9;
	Sun, 18 Oct 2020 19:27:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LRFcxCUUPUMY; Sun, 18 Oct 2020 19:27:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7FF96873E3;
	Sun, 18 Oct 2020 19:27:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68A0FC0051;
	Sun, 18 Oct 2020 19:27:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3D15C0051
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Oct 2020 19:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B6A7C229A3
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Oct 2020 19:27:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sFlIHsyxGcae
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Oct 2020 19:27:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id C098C228DC
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Oct 2020 19:27:18 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B28B0222E9;
 Sun, 18 Oct 2020 19:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603049238;
 bh=9/P4t3T4oK4ugxqKvYoEhfqCdKZSPxWGBfHV5mm1LCU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oYp+3lbHnAD3g+R5E7FO2hOWqqDBCELTFMbbgkFnXHfvjOY6Gt6RQzc61YtivADfn
 RWj3ObMFW8XxY1cTVY6bg9qGP6CyMVlHF7sm/8i0Vw+KctnScvIcvn7JnOp1RpY3sP
 tLqvjImrTPDIvYcTgcX++kBvcwNg3JMXuZ80T5TU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 35/41] Fix use after free in get_capset_info
 callback.
Date: Sun, 18 Oct 2020 15:26:29 -0400
Message-Id: <20201018192635.4056198-35-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018192635.4056198-1-sashal@kernel.org>
References: <20201018192635.4056198-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, virtualization@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, Doug Horn <doughorn@google.com>
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

From: Doug Horn <doughorn@google.com>

[ Upstream commit e219688fc5c3d0d9136f8d29d7e0498388f01440 ]

If a response to virtio_gpu_cmd_get_capset_info takes longer than
five seconds to return, the callback will access freed kernel memory
in vg->capsets.

Signed-off-by: Doug Horn <doughorn@google.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20200902210847.2689-2-gurchetansingh@chromium.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c |  2 ++
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 10 +++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 036b0fbae0fb7..ba7855da7c7f6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -113,8 +113,10 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
 					 vgdev->capsets[i].id > 0, 5 * HZ);
 		if (ret == 0) {
 			DRM_ERROR("timed out waiting for cap set %d\n", i);
+			spin_lock(&vgdev->display_info_lock);
 			kfree(vgdev->capsets);
 			vgdev->capsets = NULL;
+			spin_unlock(&vgdev->display_info_lock);
 			return;
 		}
 		DRM_INFO("cap set %d: id %d, max-version %d, max-size %d\n",
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 772a5a3b0ce1a..18e8fcad6690b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -596,9 +596,13 @@ static void virtio_gpu_cmd_get_capset_info_cb(struct virtio_gpu_device *vgdev,
 	int i = le32_to_cpu(cmd->capset_index);
 
 	spin_lock(&vgdev->display_info_lock);
-	vgdev->capsets[i].id = le32_to_cpu(resp->capset_id);
-	vgdev->capsets[i].max_version = le32_to_cpu(resp->capset_max_version);
-	vgdev->capsets[i].max_size = le32_to_cpu(resp->capset_max_size);
+	if (vgdev->capsets) {
+		vgdev->capsets[i].id = le32_to_cpu(resp->capset_id);
+		vgdev->capsets[i].max_version = le32_to_cpu(resp->capset_max_version);
+		vgdev->capsets[i].max_size = le32_to_cpu(resp->capset_max_size);
+	} else {
+		DRM_ERROR("invalid capset memory.");
+	}
 	spin_unlock(&vgdev->display_info_lock);
 	wake_up(&vgdev->resp_wq);
 }
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
