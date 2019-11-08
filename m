Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB8EF460D
	for <lists.virtualization@lfdr.de>; Fri,  8 Nov 2019 12:40:11 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D6ABA1425;
	Fri,  8 Nov 2019 11:40:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C9D02141D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 11:40:02 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 49928EC
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 11:40:02 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4AE39222C2;
	Fri,  8 Nov 2019 11:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573213202;
	bh=i2tWQS8K0Ossgcc5vBYSM8RWjs14zDUfRjUMgb8DQSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RI6D1H6WT2fLDZwloPGP2np3P381NSN9GYXoNXBGBIqQBf1FP83xmUZlJh26XbDGH
	XNGcMyCSHaOROvwMzT5GHM6XuMhwcxAFSV4R3iOLXhIFcCqn1kqBp7aNZVnKs9WzBf
	2cjQ7CknoIyUPYs/qNiQb0bVs9KJL6gXUCAOLY9w=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 085/205] qxl: fix null-pointer crash during
	suspend
Date: Fri,  8 Nov 2019 06:35:52 -0500
Message-Id: <20191108113752.12502-85-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108113752.12502-1-sashal@kernel.org>
References: <20191108113752.12502-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, Peter Wu <peter@lekensteyn.nl>,
	spice-devel@lists.freedesktop.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

From: Peter Wu <peter@lekensteyn.nl>

[ Upstream commit 7948a2b15873319d1bff4d37c09b9f2bf87b9021 ]

"crtc->helper_private" is not initialized by the QXL driver and thus the
"crtc_funcs->disable" call would crash (resulting in suspend failure).
Fix this by converting the suspend/resume functions to use the
drm_mode_config_helper_* helpers.

Tested system sleep with QEMU 3.0 using "echo mem > /sys/power/state".
During suspend the following message is visible from QEMU:

    spice/server/display-channel.c:2425:display_channel_validate_surface: canvas address is 0x7fd05da68308 for 0 (and is NULL)
    spice/server/display-channel.c:2426:display_channel_validate_surface: failed on 0

This seems to be triggered by QXL_IO_NOTIFY_CMD after
QXL_IO_DESTROY_PRIMARY_ASYNC, but aside from the warning things still
seem to work (tested with both the GTK and -spice options).

Signed-off-by: Peter Wu <peter@lekensteyn.nl>
Link: http://patchwork.freedesktop.org/patch/msgid/20180904202747.14968-1-peter@lekensteyn.nl
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 2445e75cf7ea6..d00f45eed03ca 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -136,20 +136,11 @@ static int qxl_drm_freeze(struct drm_device *dev)
 {
 	struct pci_dev *pdev = dev->pdev;
 	struct qxl_device *qdev = dev->dev_private;
-	struct drm_crtc *crtc;
-
-	drm_kms_helper_poll_disable(dev);
-
-	console_lock();
-	qxl_fbdev_set_suspend(qdev, 1);
-	console_unlock();
+	int ret;
 
-	/* unpin the front buffers */
-	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
-		if (crtc->enabled)
-			(*crtc_funcs->disable)(crtc);
-	}
+	ret = drm_mode_config_helper_suspend(dev);
+	if (ret)
+		return ret;
 
 	qxl_destroy_monitors_object(qdev);
 	qxl_surf_evict(qdev);
@@ -175,14 +166,7 @@ static int qxl_drm_resume(struct drm_device *dev, bool thaw)
 	}
 
 	qxl_create_monitors_object(qdev);
-	drm_helper_resume_force_mode(dev);
-
-	console_lock();
-	qxl_fbdev_set_suspend(qdev, 0);
-	console_unlock();
-
-	drm_kms_helper_poll_enable(dev);
-	return 0;
+	return drm_mode_config_helper_resume(dev);
 }
 
 static int qxl_pm_suspend(struct device *dev)
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
