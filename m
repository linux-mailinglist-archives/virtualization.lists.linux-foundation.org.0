Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F35AD99D
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 15:05:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 822F31081;
	Mon,  9 Sep 2019 13:05:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2BFA71064
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 13:04:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A663E7DB
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 13:04:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id C4625ABCB;
	Mon,  9 Sep 2019 13:04:56 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, kraxel@redhat.com, airlied@linux.ie, corbet@lwn.net,
	z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
	kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
	hdegoede@redhat.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH 0/4] Merge VRAM MM and GEM VRAM source files
Date: Mon,  9 Sep 2019 15:04:49 +0200
Message-Id: <20190909130453.6718-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtualization@lists.linux-foundation.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
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

VRAM MM and GEM VRAM are only used with each other. This patch set
moves VRAM MM into GEM VRAM source files and cleans up the helper's
public interface.

Thomas Zimmermann (4):
  drm/vram: Move VRAM memory manager to GEM VRAM implementation
  drm/vram: Have VRAM MM call GEM VRAM functions directly
  drm/vram: Unexport internal functions of VRAM MM
  drm/vram: Unconditonally set BO call-back functions

 Documentation/gpu/drm-mm.rst                  |  12 -
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/ast/ast_drv.c                 |   1 -
 drivers/gpu/drm/ast/ast_main.c                |   1 -
 drivers/gpu/drm/ast/ast_ttm.c                 |   3 +-
 drivers/gpu/drm/bochs/bochs.h                 |   1 -
 drivers/gpu/drm/bochs/bochs_mm.c              |   3 +-
 drivers/gpu/drm/drm_gem_vram_helper.c         | 361 ++++++++++++++----
 drivers/gpu/drm/drm_vram_helper_common.c      |   8 +-
 drivers/gpu/drm/drm_vram_mm_helper.c          | 309 ---------------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c   |   3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h         |   1 -
 drivers/gpu/drm/mgag200/mgag200_ttm.c         |   3 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h          |   2 -
 drivers/gpu/drm/vboxvideo/vbox_ttm.c          |   3 +-
 include/drm/drm_gem_vram_helper.h             |  90 ++++-
 include/drm/drm_vram_mm_helper.h              | 108 ------
 18 files changed, 375 insertions(+), 538 deletions(-)
 delete mode 100644 drivers/gpu/drm/drm_vram_mm_helper.c
 delete mode 100644 include/drm/drm_vram_mm_helper.h

--
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
