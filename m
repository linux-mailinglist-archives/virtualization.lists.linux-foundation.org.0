Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 278EC354EA0
	for <lists.virtualization@lfdr.de>; Tue,  6 Apr 2021 10:29:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA8F040F08;
	Tue,  6 Apr 2021 08:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7UrCx6gBgxe; Tue,  6 Apr 2021 08:29:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58F7240EE3;
	Tue,  6 Apr 2021 08:29:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBC87C000C;
	Tue,  6 Apr 2021 08:29:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18CA7C000A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 08:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EECEE83FAB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 08:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NxLvS-1VpN7I
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 08:29:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5316283FA4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 08:29:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6199FB089;
 Tue,  6 Apr 2021 08:29:44 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, bskeggs@redhat.com, kraxel@redhat.com
Subject: [PATCH 0/4] drm: Generic dumb_map_offset for TTM-based drivers
Date: Tue,  6 Apr 2021 10:29:38 +0200
Message-Id: <20210406082942.24049-1-tzimmermann@suse.de>
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

Thomas Zimmermann (4):
  drm/gem-ttm-helper: Provide helper for struct
    drm_driver.dumb_map_offset
  drm/vram-helper: Use drm_gem_ttm_dumb_map_offset()
  drm/nouveau: Use drm_gem_ttm_dumb_map_offset()
  drm/qxl: Use drm_gem_ttm_dumb_map_offset()

 drivers/gpu/drm/drm_gem_ttm_helper.c      | 33 ++++++++++++++++
 drivers/gpu/drm/drm_gem_vram_helper.c     | 48 -----------------------
 drivers/gpu/drm/nouveau/nouveau_display.c | 18 ---------
 drivers/gpu/drm/nouveau/nouveau_display.h |  2 -
 drivers/gpu/drm/nouveau/nouveau_drm.c     |  3 +-
 drivers/gpu/drm/qxl/qxl_drv.c             |  3 +-
 drivers/gpu/drm/qxl/qxl_drv.h             |  3 --
 drivers/gpu/drm/qxl/qxl_dumb.c            | 17 --------
 drivers/gpu/drm/qxl/qxl_ioctl.c           |  4 +-
 drivers/gpu/drm/qxl/qxl_object.h          |  5 ---
 include/drm/drm_gem_ttm_helper.h          |  5 ++-
 include/drm/drm_gem_vram_helper.h         |  7 +---
 12 files changed, 45 insertions(+), 103 deletions(-)

--
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
