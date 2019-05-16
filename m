Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D3D20CEE
	for <lists.virtualization@lfdr.de>; Thu, 16 May 2019 18:28:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BB127CA6;
	Thu, 16 May 2019 16:27:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9465AC7C
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 16:27:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 05BA48AC
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 16:27:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id ED153AEA3;
	Thu, 16 May 2019 16:27:50 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH 0/2] Add BO reservation to GEM VRAM pin/unpin/push_to_system
Date: Thu, 16 May 2019 18:27:44 +0200
Message-Id: <20190516162746.11636-1-tzimmermann@suse.de>
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

A kernel test bot reported a problem with the locktorture testcase that
was triggered by the GEM VRAM helpers.

  ...
  [   10.004734] RIP: 0010:ttm_bo_validate+0x41/0x141 [ttm]
  ...
  [   10.015669]  ? kvm_sched_clock_read+0x5/0xd
  [   10.016157]  ? get_lock_stats+0x11/0x3f
  [   10.016607]  drm_gem_vram_pin+0x77/0xa2 [drm_vram_helper]
  [   10.017229]  drm_gem_vram_driver_gem_prime_vmap+0xe/0x39 [drm_vram_helper]
  [   10.018015]  drm_gem_vmap+0x36/0x43 [drm]
  [   10.018491]  drm_client_framebuffer_create+0xc6/0x1ca [drm]
  [   10.019143]  drm_fb_helper_generic_probe+0x4c/0x157 [drm_kms_helper]
  [   10.019864]  __drm_fb_helper_initial_config_and_unlock+0x307/0x442 [drm_kms_helper]
  [   10.020739]  drm_fbdev_client_hotplug+0xc8/0x115 [drm_kms_helper]
  [   10.021442]  drm_fbdev_generic_setup+0xc4/0xf1 [drm_kms_helper]
  [   10.022120]  bochs_pci_probe+0x123/0x143 [bochs_drm]
  [   10.022688]  local_pci_probe+0x34/0x75
  [   10.023127]  pci_device_probe+0xf8/0x150A
  ...

It turns out that the bochs and vbox drivers automatically reserved and
unreserved the BO from within their pin and unpin functions. The other
drivers; ast, hibmc and mgag200; performed reservation explicitly. With the
GEM VRAM conversion, automatic BO reservation within pin and unpin functions
accidentally got lost. So for bochs and vbox, ttm_bo_validate() worked on
unlocked BOs.

This patch set fixes the problem by adding automatic reservation to the
implementation of drm_gem_vram_{pin,unpin,push_to_system}() to fix bochs
and vbox. It removes explicit BO reservation around the pin, unpin and
push-to-system calls in the ast, hibmc and mgag200 drivers.

The only exception is the cursor handling of mgag200. In this case, the
mgag200 driver now calls drm_gem_vram_{pin,unpin}_reserved(), which works
with reserved BOs. The respective code should be refactored in a future
patch to work with the regular pin and unpin functions.

Thomas Zimmermann (2):
  drm: Add drm_gem_vram_{pin/unpin}_reserved() and convert mgag200
  drm: Reserve/unreserve GEM VRAM BOs from within pin/unpin functions

 drivers/gpu/drm/ast/ast_mode.c                |  24 +---
 drivers/gpu/drm/drm_gem_vram_helper.c         | 115 +++++++++++++++++-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |   6 -
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c |  17 +--
 drivers/gpu/drm/mgag200/mgag200_cursor.c      |  18 +--
 drivers/gpu/drm/mgag200/mgag200_mode.c        |  19 +--
 include/drm/drm_gem_vram_helper.h             |   3 +
 7 files changed, 126 insertions(+), 76 deletions(-)

--
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
