Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACA55DFD7
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 10:33:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9F52F1029;
	Wed,  3 Jul 2019 08:33:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 571DC100B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 08:33:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 17566854
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 08:33:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 193A5AF7E;
	Wed,  3 Jul 2019 08:33:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
	maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
	sean@poorly.run, noralf@tronnes.org, sam@ravnborg.org,
	yc_chen@aspeedtech.com
Subject: [PATCH 0/5] Unmappable DRM client buffers for fbdev emulation
Date: Wed,  3 Jul 2019 10:32:57 +0200
Message-Id: <20190703083302.2609-1-tzimmermann@suse.de>
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

DRM client buffers are permanently mapped throughout their lifetime. This
prevents us from using generic framebuffer emulation for devices with
small dedicated video memory, such as ast or mgag200. With fb buffers
permanently mapped, such devices often won't have enougth space left to
display other content (e.g., X11).

This patch set introduces unmappable DRM client buffers for framebuffer
emulation with shadow buffers. While the shadow buffer remains in system
memory permanently, the respective buffer object will only be mapped briefly
during updates from the shadow buffer. Hence, the driver can relocate he
buffer object among memory regions as needed.

The default behoviour for DRM client buffers is still to be permanently
mapped.

The patch set converts ast and mgag200 to generic framebuffer emulation
and removes a large amount of framebuffer code from these drivers. For
bochs, a problem was reported where the driver could not display the console
because it was pinned in system memory. [1] The patch set fixes this bug
by converting bochs to use the shadow fb.

The patch set has been tested on ast and mga200 HW.

[1] https://lists.freedesktop.org/archives/dri-devel/2019-June/224423.html

Thomas Zimmermann (5):
  drm/client: Support unmapping of DRM client buffers
  drm/fb-helper: Unmap BO for shadow-buffered framebuffer console
  drm/ast: Replace struct ast_fbdev with generic framebuffer emulation
  drm/bochs: Use shadow buffer for bochs framebuffer console
  drm/mgag200: Replace struct mga_fbdev with generic framebuffer
    emulation

 drivers/gpu/drm/ast/Makefile           |   2 +-
 drivers/gpu/drm/ast/ast_drv.c          |  22 +-
 drivers/gpu/drm/ast/ast_drv.h          |  17 --
 drivers/gpu/drm/ast/ast_fb.c           | 341 -------------------------
 drivers/gpu/drm/ast/ast_main.c         |  30 ++-
 drivers/gpu/drm/ast/ast_mode.c         |  21 --
 drivers/gpu/drm/bochs/bochs_kms.c      |   2 +-
 drivers/gpu/drm/drm_client.c           |  71 ++++-
 drivers/gpu/drm/drm_fb_helper.c        |  14 +-
 drivers/gpu/drm/mgag200/Makefile       |   2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  19 --
 drivers/gpu/drm/mgag200/mgag200_fb.c   | 309 ----------------------
 drivers/gpu/drm/mgag200/mgag200_main.c |  61 +++--
 drivers/gpu/drm/mgag200/mgag200_mode.c |  27 --
 include/drm/drm_client.h               |   3 +
 15 files changed, 154 insertions(+), 787 deletions(-)
 delete mode 100644 drivers/gpu/drm/ast/ast_fb.c
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_fb.c

--
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
