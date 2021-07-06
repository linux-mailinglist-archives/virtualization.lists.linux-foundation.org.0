Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 804393BCF01
	for <lists.virtualization@lfdr.de>; Tue,  6 Jul 2021 13:27:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C4AF403F1;
	Tue,  6 Jul 2021 11:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WWosDsB2DQHk; Tue,  6 Jul 2021 11:26:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 08DB8403E9;
	Tue,  6 Jul 2021 11:26:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F2F8C001F;
	Tue,  6 Jul 2021 11:26:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5BE56C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B64083829
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqS2qGapi3zM
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:26:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1A928381F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:26:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99A3461C9B;
 Tue,  6 Jul 2021 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570816;
 bh=4SACsFJG8/9jJecMl2IR/V5GA4+8aU0CP4m8Q7Ajasg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C6WUn1zChwRjp/VLW54vZl0rdCa5+2/a87A3XtqaAk2FP2OAtcQ0UE1nML744vOye
 6Sg+Iwe05fOsXFCz1J0xD0KdEDmJA4PbpTyRpNYbq4Ql8m2cxQQCA22xFFZN6q4Wg7
 0qxZgBFjNXeRkgDbuuvNdk80moP3tcFSfVyaZMejJhPL0G72FWXAfExcSKUkKOCErO
 ZCh6Ns9+YAmW/ZRzp7gPD98plHQE+ethGpzuuciKMTvV1vvux/fRD9jva5Unn3Pd+1
 PEYhzvU3JpG2c/ZTzpBPezlXANdftnASbF+a7RDD38Hc6tpKgFYba82Hb6B5ei7uWV
 kHzrq9BljUsJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 13/55] drm/virtio: Fixes a potential NULL pointer
 dereference on probe failure
Date: Tue,  6 Jul 2021 07:25:56 -0400
Message-Id: <20210706112638.2065023-13-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112638.2065023-1-sashal@kernel.org>
References: <20210706112638.2065023-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Xie Yongji <xieyongji@bytedance.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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

From: Xie Yongji <xieyongji@bytedance.com>

[ Upstream commit 17f46f488a5d82c5568e6e786cd760bba1c2ee09 ]

The dev->dev_private might not be allocated if virtio_gpu_pci_quirk()
or virtio_gpu_init() failed. In this case, we should avoid the cleanup
in virtio_gpu_release().

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20210517084913.403-1-xieyongji@bytedance.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 22397a23780c..2cfd0016bd70 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -261,6 +261,9 @@ void virtio_gpu_driver_unload(struct drm_device *dev)
 	flush_work(&vgdev->config_changed_work);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 
+	if (!vgdev)
+		return;
+
 	virtio_gpu_modeset_fini(vgdev);
 	virtio_gpu_ttm_fini(vgdev);
 	virtio_gpu_free_vbufs(vgdev);
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
