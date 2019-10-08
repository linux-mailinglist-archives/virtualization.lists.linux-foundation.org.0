Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC81CF0E2
	for <lists.virtualization@lfdr.de>; Tue,  8 Oct 2019 04:42:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C9F22CC3;
	Tue,  8 Oct 2019 02:42:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EC373CAC
	for <virtualization@lists.linux-foundation.org>;
	Tue,  8 Oct 2019 02:42:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 767178AB
	for <virtualization@lists.linux-foundation.org>;
	Tue,  8 Oct 2019 02:42:09 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 991DDDCAB4BC3935C2E2;
	Tue,  8 Oct 2019 10:42:01 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Tue, 8 Oct 2019
	10:41:53 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <airlied@redhat.com>, <kraxel@redhat.com>, <airlied@linux.ie>,
	<daniel@ffwll.ch>
Subject: [PATCH -next] drm/qxl: Fix randbuild error
Date: Tue, 8 Oct 2019 10:40:54 +0800
Message-ID: <20191008024054.32368-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org, YueHaibing <yuehaibing@huawei.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org
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

If DEM_QXL is y and DRM_TTM_HELPER is m, building fails:

drivers/gpu/drm/qxl/qxl_object.o: undefined reference to `drm_gem_ttm_print_info'

Select DRM_TTM_HELPER to fix this.

Fixes: 78d54f1f6a33 ("drm/qxl: use drm_gem_ttm_print_info")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/qxl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/qxl/Kconfig b/drivers/gpu/drm/qxl/Kconfig
index d0d691b..ca3f51c 100644
--- a/drivers/gpu/drm/qxl/Kconfig
+++ b/drivers/gpu/drm/qxl/Kconfig
@@ -4,6 +4,7 @@ config DRM_QXL
 	depends on DRM && PCI && MMU
 	select DRM_KMS_HELPER
 	select DRM_TTM
+	select DRM_TTM_HELPER
 	select CRC32
 	help
 	  QXL virtual GPU for Spice virtualization desktop integration.
-- 
2.7.4


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
