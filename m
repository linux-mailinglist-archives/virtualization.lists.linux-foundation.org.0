Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D93163BCB99
	for <lists.virtualization@lfdr.de>; Tue,  6 Jul 2021 13:14:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 693D8832B0;
	Tue,  6 Jul 2021 11:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o45S0uWDjM2p; Tue,  6 Jul 2021 11:14:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4AAC582FCE;
	Tue,  6 Jul 2021 11:14:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C50FBC000E;
	Tue,  6 Jul 2021 11:14:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0EA8C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDAC440122
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Y8fJTvMhSyQ
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:14:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23CB1400CD
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 11:14:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F4D0619C5;
 Tue,  6 Jul 2021 11:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570092;
 bh=dwjCJhT1HGXtnEmZtAYdiTk+mnxlKa0LmxCkHY4vptI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nxd2X5zRQdnKZDDHW5OsfAqFvohZ2gu+2+i5NbhFVc2tD2699Q3IzA5Q9FDxcqHQT
 rB1+K4nfF7NSIGEQIaj+lLFScAdG86m7611ZY3jbHEW/XdNUc+tzgTWAGE5LgaJSej
 xA3JeOmUdCK6K+ZKaSPLyZSHn0waULASzLEvwQXBWNgT32GkPOLnRlWp/vSNAH4krL
 jvsVMXjlQ1XODoOqI77aosXohNTL74KtXFUuhPf/FzpYSKH9NUYCONbGQ9ZkMuIVNC
 fmMRT8tyCYXEcjzDLbHCMbHVG+oyGeBKaqtAkstRfWZH7N6P0I9XCwbMyieTdYgH3R
 WEgmEf92GujIw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 030/189] drm/virtio: Fixes a potential NULL
 pointer dereference on probe failure
Date: Tue,  6 Jul 2021 07:11:30 -0400
Message-Id: <20210706111409.2058071-30-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
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
index b375394193be..aa532ad31a23 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -264,6 +264,9 @@ void virtio_gpu_release(struct drm_device *dev)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 
+	if (!vgdev)
+		return;
+
 	virtio_gpu_modeset_fini(vgdev);
 	virtio_gpu_free_vbufs(vgdev);
 	virtio_gpu_cleanup_cap_cache(vgdev);
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
