Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA6D172649
	for <lists.virtualization@lfdr.de>; Thu, 27 Feb 2020 19:15:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 48CE187943;
	Thu, 27 Feb 2020 18:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11BpHM7xNe5v; Thu, 27 Feb 2020 18:15:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A82A8793D;
	Thu, 27 Feb 2020 18:15:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FB31C08A0;
	Thu, 27 Feb 2020 18:15:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2A31C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 18:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 914D98793D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 18:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VXUD9IA9RvnY
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 18:15:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0BECD85D26
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 18:15:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j7so4574378wrp.13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 10:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jGkQy6GARMrTdcko1Rer3WUnvLpzhV0C66wlxAxhWNE=;
 b=UGjp3j2m8tSpVtgqlVsaT55NLPaJ+bCVZNIyBF9xRUhtONMNz9C25aIe4AKs+mpAuI
 fPMK5fZkOxdJBP1TkttHVjsFqD+3P/nq/HjaSFpRwkSmPeNftrevjNHz9YaqdM+rUxyq
 EdjgWR4GUIZHrdJ5QqimuB/ajA7WfCZI5Ptjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jGkQy6GARMrTdcko1Rer3WUnvLpzhV0C66wlxAxhWNE=;
 b=KRE4cCuUsXzjljY7pv4IFDJ067xyuzTYkkzZUHzzN7mJdm/GyjHWMgoZtcrM4aQHL/
 jLz7B+sOba2WzZM1zpTP8ex/k3UzxIZyLypJjlCKWiBdWnx7cEmFh8Xri00KKI1zPj91
 +8+6NsmChQokFyfuk/aEfuOlp0GLSozPtYU/HQsFWEZxoWUAlHr7erTCyRrbF+PWzmBb
 lDfIYAcHdHMfWzD9rn1Jh35byAVGzJauX4TdeInnjW00D6agdOfq9M8Bp8ktc0mBw54M
 7ceKziEXnXOBckk8JiU1XxsEULj45BI+5krJsacMx9kAbcyEfwwwXdUipHmxNyenI3h5
 lLZw==
X-Gm-Message-State: APjAAAUzH3TWciAnDyNLky1MJc5DUUffoU4rLl8u8XjA1ZLjq/g/Iyoy
 WQZPP0BDV4Nq7BYwmvpSRutSeQ==
X-Google-Smtp-Source: APXvYqzi6pnLYSD8cXiyxKS8GvQP4s+u1dCT+w1GY+i7lVlNGRL1AhMKB3TARM9gKM0sDr2ZmPcmHQ==
X-Received: by 2002:adf:cc8b:: with SMTP id p11mr155186wrj.8.1582827338247;
 Thu, 27 Feb 2020 10:15:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:15:37 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/51] drm/qxl: Use drmm_add_final_kfree
Date: Thu, 27 Feb 2020 19:14:38 +0100
Message-Id: <20200227181522.2711142-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: spice-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, virtualization@lists.linux-foundation.org,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 l.stach@pengutronix.de
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

With this we can drop the final kfree from the release function.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 --
 drivers/gpu/drm/qxl/qxl_kms.c | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 4fda3f9b29f4..09102e2efabc 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -144,8 +144,6 @@ static void qxl_drm_release(struct drm_device *dev)
 	 */
 	qxl_modeset_fini(qdev);
 	qxl_device_fini(qdev);
-	dev->dev_private = NULL;
-	kfree(qdev);
 }
 
 static void
diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 70b20ee4741a..09d7b5f6d172 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -27,6 +27,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
 #include "qxl_drv.h"
@@ -121,6 +122,7 @@ int qxl_device_init(struct qxl_device *qdev,
 	qdev->ddev.pdev = pdev;
 	pci_set_drvdata(pdev, &qdev->ddev);
 	qdev->ddev.dev_private = qdev;
+	drmm_add_final_kfree(&qdev->ddev, qdev);
 
 	mutex_init(&qdev->gem.mutex);
 	mutex_init(&qdev->update_area_mutex);
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
