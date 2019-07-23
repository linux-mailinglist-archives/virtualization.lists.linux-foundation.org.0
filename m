Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 122E473775
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:09:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E8FA31512;
	Wed, 24 Jul 2019 18:59:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7B125AAE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 10:11:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3702AFE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 10:11:22 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x15so8848866pgg.8
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 03:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hbUuvVU1khp7VKFUFggKwVLkVb4q2fUGBg+CHMkUJd0=;
	b=l2j4H0CdEmZdpJCZvrzmmDahBvKCJ8fXgy9HbAdqesEQ8sZ1khYFM0LnORwhE0hYZ0
	3Ze25ytmIxhjnmXe3bQwRjJ54RsCOGLmVfy40uxaV/DUaqP0KDeJlf9RZD41izLJrZiP
	gqsxN0rhaGjKtFeWhCWAaiu7Qp4tfMieiTwmdDSW4eP7uzpVH0Fvu7FquuWyi0AqR6ek
	YHV3VCX2oqZlsxUPmlxxHdyGpoK5fnI+6t/Je1c5LbRl6cw83448Ey1iIOjizX1xb2u9
	1UIinCNFpTGduwYlPA3TYct8ABOKHz3JOc2A+IW+tqVEFULDqAXXgDGdoWRSrXKDwJDf
	QwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hbUuvVU1khp7VKFUFggKwVLkVb4q2fUGBg+CHMkUJd0=;
	b=Otn1YXslE7C29H45W+hTNSUHfhsl/r17lVpcvP7CdoliFhS9kFdCD32Z19YKV3f5S9
	tTSLbzTLopnpSa21ZNMf0tTD7MMykzT7ILD6Rly+mwwKnkW8/sjPSrp74Zn5G21C6xn5
	KY7xLSV2RRAC8ITE3lzylXHUCfNknX2A3UuLQpDUMUuxn0b0vveJYA/Oi1mT8x4x0H47
	xcl5Xm9Myu1Up5YEV8m+wR424S/L5B2QVof1BR0eG5wz7UxfLV0YMxzbsvRjCzmi6e+n
	nzEZeqUxK47C/j+aPA0cOTTRbWf//kqK0uX7YTax34vGO+9GSDsu88ZPhiUcXBRLW9x0
	fc2g==
X-Gm-Message-State: APjAAAXmDiJEh8OhhX+rNZuz/5kDN0Zoe1LiZZDP/faJXs/CE8hmB2Md
	zStvCWm/LKzgZQ9TxZo1Wn8=
X-Google-Smtp-Source: APXvYqwy0r8ZusvFqfsldnwyEu98w+HFWmNsxG7OqhmiSQqukGtgNtu0HJn5kk33sRugAZkhG5uf6w==
X-Received: by 2002:a63:ff66:: with SMTP id s38mr76616987pgk.363.1563876681873;
	Tue, 23 Jul 2019 03:11:21 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
	by smtp.gmail.com with ESMTPSA id
	s12sm43414905pgr.79.2019.07.23.03.11.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 03:11:21 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/bochs: Use dev_get_drvdata
Date: Tue, 23 Jul 2019 18:11:04 +0800
Message-Id: <20190723101103.30250-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: David Airlie <airlied@linux.ie>, Chuhong Yuan <hslester96@gmail.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>
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

Instead of using to_pci_dev + pci_get_drvdata,
use dev_get_drvdata to make code simpler.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/gpu/drm/bochs/bochs_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index 8f3a5bda9d03..d8a50200408c 100644
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ b/drivers/gpu/drm/bochs/bochs_drv.c
@@ -83,16 +83,14 @@ static struct drm_driver bochs_driver = {
 #ifdef CONFIG_PM_SLEEP
 static int bochs_pm_suspend(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *drm_dev = pci_get_drvdata(pdev);
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
 	return drm_mode_config_helper_suspend(drm_dev);
 }
 
 static int bochs_pm_resume(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *drm_dev = pci_get_drvdata(pdev);
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
 	return drm_mode_config_helper_resume(drm_dev);
 }
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
