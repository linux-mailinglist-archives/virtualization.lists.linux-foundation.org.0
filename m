Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C22523719D4
	for <lists.virtualization@lfdr.de>; Mon,  3 May 2021 18:37:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A30D83EEF;
	Mon,  3 May 2021 16:37:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-zg1jBXg609; Mon,  3 May 2021 16:37:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9D1A842E0;
	Mon,  3 May 2021 16:37:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B71D7C0001;
	Mon,  3 May 2021 16:37:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4DCCC0001
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 16:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9489860B4E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 16:37:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBySgJpnrYZx
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 16:37:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF42B60B4B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 16:37:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D4D960FD7;
 Mon,  3 May 2021 16:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059825;
 bh=qzBd5KFoOot3ymsfol1NFk7ANSu/74D3rjHu6RHVPIg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UNcfoylACspnbkSLp3yhVbzrnk1CYsmQaKawvF8bEOcEeiqJNa0nYYu0nxUbDr7Zg
 jGsL18hpI4AKwYZ6ZhdpHeZQT89OSBJmHYB5qhkt9wtvuY9VcQzg908T+d/yBmkJQi
 fbooIIPtH+WHtXDZbatjC648oKPdiprHWqlh6llj7ITi++mRKSqyJnwlliZTQ1iZW0
 UiRB36R27NsHJKxME5+G+DFS02beiiikkVoCjiUr9/asTUARe+M/ptilBaqlKMl5yg
 3rcIB3eYSJ7UvoQ67AuRypla8P+MdwT2YnjYbPGLChoODCDi6m73eHyynrfuloEnhl
 woaRs/EWqxakw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 003/115] drm/qxl: release shadow on shutdown
Date: Mon,  3 May 2021 12:35:07 -0400
Message-Id: <20210503163700.2852194-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163700.2852194-1-sashal@kernel.org>
References: <20210503163700.2852194-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, spice-devel@lists.freedesktop.org
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

From: Gerd Hoffmann <kraxel@redhat.com>

[ Upstream commit 4ca77c513537700d3fae69030879f781dde1904c ]

In case we have a shadow surface on shutdown release
it so it doesn't leak.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: http://patchwork.freedesktop.org/patch/msgid/20210204145712.1531203-6-kraxel@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/qxl/qxl_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 10738e04c09b..56e0c6c625e9 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -1228,6 +1228,10 @@ int qxl_modeset_init(struct qxl_device *qdev)
 
 void qxl_modeset_fini(struct qxl_device *qdev)
 {
+	if (qdev->dumb_shadow_bo) {
+		drm_gem_object_put(&qdev->dumb_shadow_bo->tbo.base);
+		qdev->dumb_shadow_bo = NULL;
+	}
 	qxl_destroy_monitors_object(qdev);
 	drm_mode_config_cleanup(&qdev->ddev);
 }
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
