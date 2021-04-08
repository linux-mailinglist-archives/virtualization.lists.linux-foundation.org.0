Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3630C35857E
	for <lists.virtualization@lfdr.de>; Thu,  8 Apr 2021 16:01:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B22A40F51;
	Thu,  8 Apr 2021 14:01:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1_bFnQJkOhD; Thu,  8 Apr 2021 14:01:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB6D940F53;
	Thu,  8 Apr 2021 14:01:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25481C000A;
	Thu,  8 Apr 2021 14:01:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF200C000A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 14:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CDD140117
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 14:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tn7apTuuYhhr
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 14:01:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A6A740100
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 14:01:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58723B00E;
 Thu,  8 Apr 2021 14:01:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, bskeggs@redhat.com, kraxel@redhat.com
Subject: [PATCH v2 0/4] drm: Generic dumb_map_offset for TTM-based drivers
Date: Thu,  8 Apr 2021 16:01:35 +0200
Message-Id: <20210408140139.27731-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
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

The implementation of drm_driver.dumb_map_offset is the same for several
TTM-based drivers. Provide a common function in GEM-TTM helpers.

v2:
	* update hibmc as well (kernel test robot)

Thomas Zimmermann (4):
  drm/gem-ttm-helper: Provide helper for struct
    drm_driver.dumb_map_offset
  drm/vram-helper: Use drm_gem_ttm_dumb_map_offset()
  drm/nouveau: Use drm_gem_ttm_dumb_map_offset()
  drm/qxl: Use drm_gem_ttm_dumb_map_offset()

 drivers/gpu/drm/drm_gem_ttm_helper.c          | 33 +++++++++++++
 drivers/gpu/drm/drm_gem_vram_helper.c         | 48 -------------------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     | 18 -------
 drivers/gpu/drm/nouveau/nouveau_display.h     |  2 -
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |  3 +-
 drivers/gpu/drm/qxl/qxl_drv.h                 |  3 --
 drivers/gpu/drm/qxl/qxl_dumb.c                | 17 -------
 drivers/gpu/drm/qxl/qxl_ioctl.c               |  4 +-
 drivers/gpu/drm/qxl/qxl_object.h              |  5 --
 include/drm/drm_gem_ttm_helper.h              |  5 +-
 include/drm/drm_gem_vram_helper.h             |  7 +--
 13 files changed, 46 insertions(+), 104 deletions(-)

--
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
