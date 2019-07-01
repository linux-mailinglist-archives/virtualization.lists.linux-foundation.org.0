Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E13E537
	for <lists.virtualization@lfdr.de>; Mon, 29 Apr 2019 16:47:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 350382230;
	Mon, 29 Apr 2019 14:46:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8E557218C
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:43:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 988D7878
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:43:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 71AA1AF94;
	Mon, 29 Apr 2019 14:43:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, Jerry.Zhang@amd.com,
	hdegoede@redhat.com, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
	kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
Subject: [PATCH v3 00/19] Share TTM code among DRM framebuffer drivers
Date: Mon, 29 Apr 2019 16:43:22 +0200
Message-Id: <20190429144341.12615-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
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

Several simple framebuffer drivers copy most of the TTM code from each
other. The implementation is always the same; except for the name of
some data structures.

As recently discussed, this patch set provides generic memory-management
code for simple framebuffers with dedicated video memory. It further
converts the respective drivers to the generic code. The shared code
is basically the same implementation as the one copied among individual
drivers.

The patch set contains two major changes: first, it introduces
|struct drm_gem_vram_object| and helpers (GEM VRAM). It's a GEM object
that is backed by VRAM. The type's purpose is somewhat similar to
|struct drm_gem_{cma, shmem}_object|: it provides an commom implementation
that handles all the basic cases. Second, the patch set introduces
|struct drm_vram_mm| and helpers (VRAM MM). It's an implementation of a
basic memory manager for VRAM.

Both, GEM VRAM and VRAM MM, support buffer placement in VRAM and system
memory. Both can be used independedly from each other if desired by the
DRM driver.

Currently ast, bochs, mgag200, vboxvideo and hisilicon/hibmc can use
these helpers.

Future directions: with these changes, the respective drivers can also
share some of their mode-setting or fbdev code. GEM VRAM could implement
PRIME helpers, which would allow for using the generic fbcon.

The patch set is against a recent drm-tip.

v3:
	* share VRAM MM callback structure among drivers
	* move VRAM MM instances to drm_device and share rsp. code
v2:
	* rename |struct drm_gem_ttm_object| to |struct drm_gem_vram_object|
	* rename |struct drm_simple_ttm| to |struct drm_vram_mm|
	* make drm_is_gem_ttm() an internal helper
	* add drm_gem_vram_kmap_at()
	* return is_iomem from kmap functions
	* redefine TTM placement flags for public interface
	* add drm_vram_mm_mmap() helper
	* replace almost all of driver's TTM code with these helpers
	* documentation fixes

Thomas Zimmermann (19):
  drm: Add |struct drm_gem_vram_object| and helpers
  drm: Add |struct drm_gem_vram_object| callbacks for |struct
    ttm_bo_driver|
  drm: Add |struct drm_gem_vram_object| callbacks for |struct
    drm_driver|
  drm: Add drm_gem_vram_fill_create_dumb() to create dumb buffers
  drm: Add VRAM MM, a simple memory manager for dedicated VRAM
  drm: Add default instance for VRAM MM callback functions
  drm: Integrate VRAM MM into struct drm_device
  drm/ast: Convert AST driver to |struct drm_gem_vram_object|
  drm/ast: Convert AST driver to VRAM MM
  drm/ast: Replace mapping code with drm_gem_vram_{kmap/kunmap}()
  drm/bochs: Convert bochs driver to |struct drm_gem_vram_object|
  drm/bochs: Convert bochs driver to VRAM MM
  drm/mgag200: Convert mgag200 driver to |struct drm_gem_vram_object|
  drm/mgag200: Convert mgag200 driver to VRAM MM
  drm/mgag200: Replace mapping code with drm_gem_vram_{kmap/kunmap}()
  drm/vboxvideo: Convert vboxvideo driver to |struct
    drm_gem_vram_object|
  drm/vboxvideo: Convert vboxvideo driver to VRAM MM
  drm/hisilicon: Convert hibmc-drm driver to |struct
    drm_gem_vram_object|
  drm/hisilicon: Convert hibmc-drm driver to VRAM MM

 Documentation/gpu/drm-mm.rst                  |  25 +-
 drivers/gpu/drm/Kconfig                       |  20 +
 drivers/gpu/drm/Makefile                      |   5 +
 drivers/gpu/drm/ast/Kconfig                   |   3 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  13 +-
 drivers/gpu/drm/ast/ast_drv.h                 |  71 +-
 drivers/gpu/drm/ast/ast_fb.c                  |  30 +-
 drivers/gpu/drm/ast/ast_main.c                |  77 +--
 drivers/gpu/drm/ast/ast_mode.c                | 124 ++--
 drivers/gpu/drm/ast/ast_ttm.c                 | 302 +--------
 drivers/gpu/drm/bochs/Kconfig                 |   2 +
 drivers/gpu/drm/bochs/bochs.h                 |  47 +-
 drivers/gpu/drm/bochs/bochs_drv.c             |  13 +-
 drivers/gpu/drm/bochs/bochs_kms.c             |  18 +-
 drivers/gpu/drm/bochs/bochs_mm.c              | 408 +-----------
 drivers/gpu/drm/drm_gem_vram_helper.c         | 612 ++++++++++++++++++
 drivers/gpu/drm/drm_vram_helper_common.c      |   6 +
 drivers/gpu/drm/drm_vram_mm_helper.c          | 278 ++++++++
 drivers/gpu/drm/hisilicon/hibmc/Kconfig       |   2 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  21 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  13 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  33 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c |  30 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c   | 341 +---------
 drivers/gpu/drm/mgag200/Kconfig               |   2 +
 drivers/gpu/drm/mgag200/mgag200_cursor.c      |  88 +--
 drivers/gpu/drm/mgag200/mgag200_drv.c         |  13 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h         |  74 +--
 drivers/gpu/drm/mgag200/mgag200_fb.c          |  30 +-
 drivers/gpu/drm/mgag200/mgag200_main.c        |  87 +--
 drivers/gpu/drm/mgag200/mgag200_mode.c        |  52 +-
 drivers/gpu/drm/mgag200/mgag200_ttm.c         | 301 +--------
 drivers/gpu/drm/vboxvideo/Kconfig             |   2 +
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  12 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h          |  75 +--
 drivers/gpu/drm/vboxvideo/vbox_fb.c           |  22 +-
 drivers/gpu/drm/vboxvideo/vbox_main.c         |  75 +--
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |  36 +-
 drivers/gpu/drm/vboxvideo/vbox_ttm.c          | 355 +---------
 include/drm/drm_device.h                      |   4 +
 include/drm/drm_gem_vram_helper.h             | 139 ++++
 include/drm/drm_vram_mm_helper.h              |  99 +++
 42 files changed, 1581 insertions(+), 2379 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_gem_vram_helper.c
 create mode 100644 drivers/gpu/drm/drm_vram_helper_common.c
 create mode 100644 drivers/gpu/drm/drm_vram_mm_helper.c
 create mode 100644 include/drm/drm_gem_vram_helper.h
 create mode 100644 include/drm/drm_vram_mm_helper.h

--
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
