Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E12260310
	for <lists.virtualization@lfdr.de>; Fri,  5 Jul 2019 11:26:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CC75D1127;
	Fri,  5 Jul 2019 09:26:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D05FC110D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 09:26:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3748987D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 09:26:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 378DEAE0C;
	Fri,  5 Jul 2019 09:26:17 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
	maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
	sean@poorly.run, noralf@tronnes.org, sam@ravnborg.org,
	yc_chen@aspeedtech.com
Subject: [PATCH v2 0/6] Unmappable DRM client buffers for fbdev emulation
Date: Fri,  5 Jul 2019 11:26:07 +0200
Message-Id: <20190705092613.7621-1-tzimmermann@suse.de>
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
permanently mapped, such devices often won't have enough space left to
display other content (e.g., X11).

This patch set introduces unmappable DRM client buffers for framebuffer
emulation with shadow buffers. While the shadow buffer remains in system
memory permanently, the respective buffer object will only be mapped briefly
during updates from the shadow buffer. Hence, the driver can relocate he
buffer object among memory regions as needed.

HW-based framebuffer consoles will still map the buffer permanently. This
is a special case required by the fbdev interface, which allows for mmaping
video memory to userspace. Some userspace clients rely on this
functionality. Hence, the patch set also changes DRM clients to not map the
buffer by default. Future DRM clients are expected to map buffers as needed.

The patch set converts ast and mgag200 to generic framebuffer emulation
and removes a large amount of framebuffer code from these drivers. For
bochs, a problem was reported where the driver could not display the console
because it was pinned in system memory. [1] The patch set fixes this bug
by converting bochs to use the shadow fb.

The patch set has been tested on ast and mga200 HW.

[1] https://lists.freedesktop.org/archives/dri-devel/2019-June/224423.html

Thomas Zimmermann (6):
  drm/client: Support unmapping of DRM client buffers
  drm/fb-helper: Map DRM client buffer only when required
  drm/fb-helper: Instanciate shadow FB if configured in device's
    mode_config
  drm/ast: Replace struct ast_fbdev with generic framebuffer emulation
  drm/bochs: Use shadow buffer for bochs framebuffer console
  drm/mgag200: Replace struct mga_fbdev with generic framebuffer
    emulation

 drivers/gpu/drm/ast/Makefile           |   2 +-
 drivers/gpu/drm/ast/ast_drv.c          |  13 +-
 drivers/gpu/drm/ast/ast_drv.h          |  17 --
 drivers/gpu/drm/ast/ast_fb.c           | 341 -------------------------
 drivers/gpu/drm/ast/ast_main.c         |   3 +-
 drivers/gpu/drm/ast/ast_mode.c         |  21 --
 drivers/gpu/drm/bochs/bochs_kms.c      |   1 +
 drivers/gpu/drm/drm_client.c           |  61 ++++-
 drivers/gpu/drm/drm_fb_helper.c        |  52 +++-
 drivers/gpu/drm/mgag200/Makefile       |   2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  19 --
 drivers/gpu/drm/mgag200/mgag200_fb.c   | 309 ----------------------
 drivers/gpu/drm/mgag200/mgag200_main.c |  31 +--
 drivers/gpu/drm/mgag200/mgag200_mode.c |  27 --
 include/drm/drm_client.h               |   3 +
 include/drm/drm_mode_config.h          |   5 +
 16 files changed, 109 insertions(+), 798 deletions(-)
 delete mode 100644 drivers/gpu/drm/ast/ast_fb.c
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_fb.c

--
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
