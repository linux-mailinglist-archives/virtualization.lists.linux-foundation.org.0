Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D0518F738
	for <lists.virtualization@lfdr.de>; Mon, 23 Mar 2020 15:50:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 07D712002F;
	Mon, 23 Mar 2020 14:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x97bQ9Iw004z; Mon, 23 Mar 2020 14:50:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 094FD203FF;
	Mon, 23 Mar 2020 14:50:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D29B2C1D8E;
	Mon, 23 Mar 2020 14:50:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50BA8C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 14:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3E95720380
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 14:50:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YcLyit6Pin6g
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 14:50:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 205CB2002F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 14:50:08 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h15so5221185wrx.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8EEdhlDxPGCszNH39KDQNapCEw4c4r8sQpDp4YCg1tQ=;
 b=k6urjDIZuhuoPs7ZD1FcgK966/qfJ2UPTH/pF2x/0l3M2i5NjEOO2+CAPg/c5Jgmy7
 Xqox1R+kNuDHbksH1YUUSK19MipDveHSjMjRL/WnIAQU+7rjQkYIBFV8dOhNc4rjoz9u
 QPYbQbxCarRmHX4lypKkyIWHvlxsSzatXbFp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8EEdhlDxPGCszNH39KDQNapCEw4c4r8sQpDp4YCg1tQ=;
 b=fb7g17aKYj5zuCUFCQVknMOzfdoWK7UBJ3FOTdM+rOSFueioyhsYHZmAlqAEqyPgzq
 VJ+O60mKMP2BQc/6icprD/a7IspAzUaiJcoFQI2QaSfbCiPdzTZjHyJUYcGQuPH1Uo32
 1PVNasa3yHopvhniTx+GHV8U+QbII7ODV/2hr/5FsAzrbXBEKPvkIoVSLZlLvYVx/TYR
 oIX/EU/P5yBAgOXrPrEowOUJXFumCM92caeMXYheB44a/cAxuFFyNUsS70ZsavqR6fUi
 PDVxJqDCI3+wEkOQ4Vja8772vqu8ZGNCramJh1jZplBYVB/3uYHWtiICfsWmWHquG908
 gVoA==
X-Gm-Message-State: ANhLgQ28pYT0rsyxMbMxMYIk0qsdS3Tya4h3cruXnn8u1dl8yJaBolex
 x+zuOPkrBpndKhFP58yisF6j8A==
X-Google-Smtp-Source: ADFU+vvH2AC0AyJuWazp1JxP6K2wqcG7brSho8DLZzVQcpb9YvutEdwaVpcxqLcib+NAIqWSIGA0qA==
X-Received: by 2002:a5d:5286:: with SMTP id c6mr30023307wrv.418.1584975006564; 
 Mon, 23 Mar 2020 07:50:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:05 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/51] drm/qxl: Use drmm_add_final_kfree
Date: Mon, 23 Mar 2020 15:49:06 +0100
Message-Id: <20200323144950.3018436-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: spice-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
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

Acked-by: Gerd Hoffmann <kraxel@redhat.com>
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
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
