Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB0341D7B2
	for <lists.virtualization@lfdr.de>; Thu, 30 Sep 2021 12:27:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A700F840C3;
	Thu, 30 Sep 2021 10:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4Tqm0iGv_xE; Thu, 30 Sep 2021 10:27:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 823D1840C4;
	Thu, 30 Sep 2021 10:27:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D631C001E;
	Thu, 30 Sep 2021 10:27:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F504C000D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 10:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10B8C613C0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 10:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=canonical.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id labb64O1HmRS
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 10:27:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAE3E6071F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 10:27:50 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 8585F4199A; 
 Thu, 30 Sep 2021 10:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632997668;
 bh=M6sy7w+Nseo+km9zhs6Ryq7ai4W52YENoxc1GDWogd8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=Y30t1JdbogXU0K+bW1bTvWxv86GNTLURM7AED2LkZ/ttZYw9LhYMnHQj3JHgmXkhW
 sRCjx5TjEc9egXxsVx0JmzEmckMXwjVV4c+eEG+eS/7JgPxs2Tbqt4nFbAyL3XKrWC
 KLcKhshLfR5P6Rr9vO4/xb2SCXlFdSQX5ZE0sRc2lHXcIWIeZj1XL76wiG5J8yjFYf
 ymGKmhVQ9QoEUgrPb8y0+maV7PIBRnBn1CPOTkwjmQcXWvI3W/QW+Z28BZUt4A2mLs
 QJ5o+tqnL4tzhB0ZX4Q4Zyc7vSg3pNHmIOH06odwTc4RNwoYj7oJ9Rqx5whH1lNjTv
 6u5G7YqrNz15w==
From: Colin King <colin.king@canonical.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lingfeng Yang <lfy@google.com>,
 Anthoine Bourgeois <anthoine.bourgeois@gmail.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH][next] drm/virtio: fix another potential integer overflow on
 shift of a int
Date: Thu, 30 Sep 2021 11:27:48 +0100
Message-Id: <20210930102748.16922-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

The left shift of unsigned int 32 bit integer constant 1 is evaluated
using 32 bit arithmetic and then assigned to a signed 64 bit integer.
In the case where value is 32 or more this can lead to an overflow
(value can be in range 0..MAX_CAPSET_ID (63). Fix this by shifting
the value 1ULL instead.

Addresses-Coverity: ("Uninitentional integer overflow")
Fixes: 4fb530e5caf7 ("drm/virtio: implement context init: support init ioctl")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index b3b0557d72cf..0007e423d885 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -774,7 +774,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 				goto out_unlock;
 			}
 
-			if ((vgdev->capset_id_mask & (1 << value)) == 0) {
+			if ((vgdev->capset_id_mask & (1ULL << value)) == 0) {
 				ret = -EINVAL;
 				goto out_unlock;
 			}
-- 
2.32.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
