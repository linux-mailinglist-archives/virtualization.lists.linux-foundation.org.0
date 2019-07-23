Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9848173776
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:09:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2D4141515;
	Wed, 24 Jul 2019 18:59:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4C485B59
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 10:40:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 00A0CFE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 10:40:22 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i189so18940293pfg.10
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PK0IBZUbQHnyOZDtUqj2prrcS6SHRWpLkmBXJgDEKWo=;
	b=JJEGgQaULMIyBtsF9Zmew5QKL6iwU5DJsa+yzl56UpjBCSjzgnjbTm1D8sUg4zA1fo
	Rqvm5clXYIpVWuG3UvJ9Guhup1h3dWDqi38rpeBx/FQY9fMC+0kHJ/8HCq7soKQOzCxx
	nwgn3YjizCPCQ+Qi1XLpVkmwNITnKWINbFnzbGrSoayK4iQeWX6AjULlyQGLwmHCQtVV
	amlHgx7MOvg5GCeXx3OWz4VxnjAET5qyqL22PCCiUT9Jg/TO7ESxfPptPJhKRwX6ycIF
	GmOZ/RysLc2ZGHYfZv3DeeT+V/3DXyPwVvAGE2FKJKioGkfe9H/X7N7azeOk2u9XISBs
	q4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PK0IBZUbQHnyOZDtUqj2prrcS6SHRWpLkmBXJgDEKWo=;
	b=fBWANnuAjpfOaBmuMUEQsy/ZO2Fiow+VqlA/FT1HO0HxuqdxZPaFWJ3nwvjOT0dyIN
	yU5XDQFmVQGvW6fgb37Duk6pwRRZp6FJGxO+Ldf59wHcNRKH57M5euFVeIXzPteevK0K
	HOwINsWdLDcijOfb61QwVps34UN/F81p4ORYzJ4FeIWj1f36pqyM0n67wvmPG7tPxwaf
	Hbjt2ND9hU0zb1EuiE6Y2NshryDgHJmR0W7m9wo/PSlDTrBf87tTfdl8CBGUD+yCqyNm
	xLPyyvo8O8LQGPDtC8is6/ZlLh4I5CrEyTvMJUeU68iA165kUMG/7HNFSXqunUvpI8nS
	iM9Q==
X-Gm-Message-State: APjAAAX8Wx243CgeMM5epQy/wCZEGI6700IlWYjoPtC/wdJz69x+nNP/
	rqRyD3U6z4EihQO+SGtNIfs=
X-Google-Smtp-Source: APXvYqxNi+SizBMl+BpgOlGEa4wEMzr8MJSUWRsgRL/2x6RHFUOsxCW0h9hrMpeXnwK8haoe2AWQXQ==
X-Received: by 2002:a17:90a:1a45:: with SMTP id
	5mr83413685pjl.43.1563878422662; 
	Tue, 23 Jul 2019 03:40:22 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
	by smtp.gmail.com with ESMTPSA id c8sm47990214pjq.2.2019.07.23.03.40.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 03:40:22 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/qxl: Use dev_get_drvdata where possible
Date: Tue, 23 Jul 2019 18:40:00 +0800
Message-Id: <20190723103959.4078-1-hslester96@gmail.com>
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
	virtualization@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
	spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
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
 drivers/gpu/drm/qxl/qxl_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index f33e349c4ec5..af1e2b377945 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -206,16 +206,14 @@ static int qxl_pm_resume(struct device *dev)
 
 static int qxl_pm_thaw(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *drm_dev = pci_get_drvdata(pdev);
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
 	return qxl_drm_resume(drm_dev, true);
 }
 
 static int qxl_pm_freeze(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *drm_dev = pci_get_drvdata(pdev);
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
 	return qxl_drm_freeze(drm_dev);
 }
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
