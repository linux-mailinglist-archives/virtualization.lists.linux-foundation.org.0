Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5FC3DEE8B
	for <lists.virtualization@lfdr.de>; Tue,  3 Aug 2021 14:59:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39CDE82A29;
	Tue,  3 Aug 2021 12:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jyEdX9adNEFc; Tue,  3 Aug 2021 12:59:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0A1D282B1E;
	Tue,  3 Aug 2021 12:59:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D70C8C0020;
	Tue,  3 Aug 2021 12:59:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BEBDC0010
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 12:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D312640350
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 12:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="FtXSrMLP";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="uZqe5xiS"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFUouIiiFRL9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 12:59:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3F1C402DA
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 12:59:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E5265200C7;
 Tue,  3 Aug 2021 12:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627995570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Oo7yGQ8xWLlslf1gITlpvrc+90Xs1VMWzRRK0oSWyR8=;
 b=FtXSrMLPAZAtwMfAo264mKElr4OQJq1vfwvaPOc6K4HI5szVavwkbEL5dQJTQlEfMmjWZb
 6bPMt707M/uO31+yQSyss6Cx2oobmF6v3+/ur6roBl+kzKKwC2Bc5ryi5Uze7/Es09Fv+l
 8ACDWoW7hAYd37BoQSwFiHMsch8ZeYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627995570;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Oo7yGQ8xWLlslf1gITlpvrc+90Xs1VMWzRRK0oSWyR8=;
 b=uZqe5xiSUzJN3CYZWTWmyh3yPtc2hsBV54E3mbDc6/CyfE/SNjtEepkEvh17H6uYPBhnS5
 Nje//IzmcKzKaIAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6926C13CD6;
 Tue,  3 Aug 2021 12:59:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AjtGGLI9CWExZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 12:59:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, noralf@tronnes.org,
 drawat.floss@gmail.com, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 sam@ravnborg.org
Subject: [PATCH 00/11] Provide offset-adjusted framebuffer mappings
Date: Tue,  3 Aug 2021 14:59:17 +0200
Message-Id: <20210803125928.27780-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: linux-hyperv@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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

A framebuffer's offsets field might be non-zero to make the BO data
start at the specified offset within the BO's memory. Handle this
case in drm_gem_fb_vmap() and update all callers. So far, many drivers
ignore the offsets, which can lead to visual artifacts.

Patch 1 adds an optional argument to drm_gem_fb_vmap() to return the
offset-adjusted data address for use with shadow-buffered planes.

Patches 3 and 11 convert gud and vkms, which are the other callers of
drm_gem_fb_vmap(). For gud, it's just a cleanup. Vkms will handle the
framebuffer offsets correctly for its input and output framebuffers.

The other patches convert users of shadow-buffered planes to use the
data address. After conversion, each driver will use the correct data
for non-zero offsets.

Thomas Zimmermann (11):
  drm/gem: Provide offset-adjusted framebuffer BO mappings
  drm/ast: Use offset-adjusted shadow-plane mappings
  drm/gud: Get offset-adjusted mapping from drm_gem_fb_vmap()
  drm/hyperv: Use offset-adjusted shadow-plane mappings
  drm/mgag200: Use offset-adjusted shadow-plane mappings
  drm/cirrus: Use offset-adjusted shadow-plane mappings
  drm/gm12u320: Use offset-adjusted shadow-plane mappings
  drm/simpledrm: Use offset-adjusted shadow-plane mapping
  drm/udl: Use offset-adjusted shadow-plane mapping
  drm/vbox: Use offset-adjusted shadow-plane mappings
  drm/vkms: Use offset-adjusted shadow-plane mappings and output

 drivers/gpu/drm/ast/ast_mode.c               |  2 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c      |  2 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 17 ++++++++++++++++-
 drivers/gpu/drm/gud/gud_pipe.c               |  5 +++--
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c  |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_mode.c       |  4 ++--
 drivers/gpu/drm/tiny/cirrus.c                |  4 ++--
 drivers/gpu/drm/tiny/gm12u320.c              |  4 ++--
 drivers/gpu/drm/tiny/simpledrm.c             |  4 ++--
 drivers/gpu/drm/udl/udl_modeset.c            |  4 ++--
 drivers/gpu/drm/vboxvideo/vbox_mode.c        |  2 +-
 drivers/gpu/drm/vkms/vkms_composer.c         |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h              |  1 +
 drivers/gpu/drm/vkms/vkms_plane.c            |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c        |  2 +-
 include/drm/drm_gem_atomic_helper.h          |  8 ++++++++
 include/drm/drm_gem_framebuffer_helper.h     |  3 ++-
 17 files changed, 48 insertions(+), 22 deletions(-)

--
2.32.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
