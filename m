Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C7847AA1F
	for <lists.virtualization@lfdr.de>; Mon, 20 Dec 2021 14:07:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AF1460D4B;
	Mon, 20 Dec 2021 13:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tQPcsNWwkkLy; Mon, 20 Dec 2021 13:07:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E046F60C34;
	Mon, 20 Dec 2021 13:07:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46F29C0012;
	Mon, 20 Dec 2021 13:07:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 561BCC0012
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Dec 2021 13:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 359BE81C0A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Dec 2021 13:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=axis.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C19jEr45VNj3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Dec 2021 13:07:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E549B81BE3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Dec 2021 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1640005623;
 x=1671541623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WaxVAs1ueWqebp9zPoOJfkKS0rODc9paXkK8rXkLlR4=;
 b=MMbPL9NuVm4KGJqFRHvuYNW6pC0zGZfdNPCIQchqS/ubt/2migrRGG9+
 mFMYSCCLs97g/Y9cDDwm0EN7HEExORuyRRAZ4DxyTFBYs2Bt5OLdEGOQT
 /mUpXdat5J4jUUHLb4OeKkwU7qJUTMSnOi5P4SMuk1F8UPQWo8MNZ2ICM
 D9/yaiHCheFFm9jVB0RTlRixpY6y4OX6SpNMNhUwdB0zEHj8HeAmbYtQO
 Y9oSGz74qpR3iDV0biMAdcKGQpXYUtO6j2OtMLoZgJKXUkpV7eEL2dcB8
 p7qQMHeMSW4QFaSjb1YP8t6e3zl1VQQvSvpFPSALjGoj/Fz4WGVbKh9NA A==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>, Viresh Kumar
 <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Bartosz
 Golaszewski" <brgl@bgdev.pl>
Subject: [PATCH] gpio: virtio: remove timeout
Date: Mon, 20 Dec 2021 14:06:56 +0100
Message-ID: <20211220130656.16900-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Cc: mst@redhat.com, linux-gpio@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel@axis.com
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

The driver imposes an arbitrary one second timeout on virtio requests,
but the specification doesn't prevent the virtio device from taking
longer to process requests, so remove this timeout to support all
systems and device implementations.

Fixes: 3a29355a22c0275fe86 ("gpio: Add virtio-gpio driver")
Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/gpio/gpio-virtio.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 84f96b78f32a..9f4941bc5760 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -100,11 +100,7 @@ static int _virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
 	virtqueue_kick(vgpio->request_vq);
 	mutex_unlock(&vgpio->lock);
 
-	if (!wait_for_completion_timeout(&line->completion, HZ)) {
-		dev_err(dev, "GPIO operation timed out\n");
-		ret = -ETIMEDOUT;
-		goto out;
-	}
+	wait_for_completion(&line->completion);
 
 	if (unlikely(res->status != VIRTIO_GPIO_STATUS_OK)) {
 		dev_err(dev, "GPIO request failed: %d\n", gpio);
-- 
2.33.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
