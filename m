Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E03703B9D26
	for <lists.virtualization@lfdr.de>; Fri,  2 Jul 2021 09:54:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F67640670;
	Fri,  2 Jul 2021 07:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AySoGdxrup7W; Fri,  2 Jul 2021 07:54:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 025D640553;
	Fri,  2 Jul 2021 07:54:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F9D9C000E;
	Fri,  2 Jul 2021 07:54:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C6E4C000E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 07:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CE2540179
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 07:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="OsPoqp1S";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="+GHENryS"; dkim=pass (1024-bit key)
 header.d=suse.de header.b="OsPoqp1S"; dkim=neutral
 reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="+GHENryS"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSrDNxWMIcVp
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 07:54:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9A29400BF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 07:54:39 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC5302005C;
 Fri,  2 Jul 2021 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625212476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4Tv6jbyMyIKQVG1JMkGglWPb6ChlXmHD7QQGXoJILGo=;
 b=OsPoqp1SOinmTHS2Dhwi+UnPQ6QUbEaPLxYyzr/36Tc7X9UykVQvzIe+U79vokDAyCesjd
 WxxrmAUec0f43YgMovTcP+9GbW4Mru9Q1o7QFhdwQhNx1Ui/AXOIZsJwIeA2ElpUwH3xih
 ahN2cng6DIZvC0EiYgG/3YvsEjB9Vgg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625212476;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4Tv6jbyMyIKQVG1JMkGglWPb6ChlXmHD7QQGXoJILGo=;
 b=+GHENrySAfreK0CvbOOsNmCY4/g33aK+esfx+atgaJ5S5jOE9lZnfrTQKJGxTfK5a8yLs6
 cW4J+/0E40SQmQDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8FC4611CD6;
 Fri,  2 Jul 2021 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625212476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4Tv6jbyMyIKQVG1JMkGglWPb6ChlXmHD7QQGXoJILGo=;
 b=OsPoqp1SOinmTHS2Dhwi+UnPQ6QUbEaPLxYyzr/36Tc7X9UykVQvzIe+U79vokDAyCesjd
 WxxrmAUec0f43YgMovTcP+9GbW4Mru9Q1o7QFhdwQhNx1Ui/AXOIZsJwIeA2ElpUwH3xih
 ahN2cng6DIZvC0EiYgG/3YvsEjB9Vgg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625212476;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4Tv6jbyMyIKQVG1JMkGglWPb6ChlXmHD7QQGXoJILGo=;
 b=+GHENrySAfreK0CvbOOsNmCY4/g33aK+esfx+atgaJ5S5jOE9lZnfrTQKJGxTfK5a8yLs6
 cW4J+/0E40SQmQDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id WJQ+IjzG3mALDgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Jul 2021 07:54:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 0/3] drm/bochs: Move to tiny/ and simplify
Date: Fri,  2 Jul 2021 09:54:31 +0200
Message-Id: <20210702075434.27677-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
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

Move the bochs driver to tiny/ and simplify the clean-up code. Also
update GEM VRAM helpers accordingly.

v2:
	* make bochs_mode_funcs static (Daniel, kernel test robot)

Thomas Zimmermann (3):
  drm/bochs: Move to tiny/
  drm/bochs: Use managed initialization for GEM VRAM helpers
  drm/vram-helper: Unexport drm_vram_helper_{alloc,release}_mm()

 MAINTAINERS                           |   2 +-
 drivers/gpu/drm/Kconfig               |   2 -
 drivers/gpu/drm/Makefile              |   1 -
 drivers/gpu/drm/bochs/Kconfig         |  11 -
 drivers/gpu/drm/bochs/Makefile        |   4 -
 drivers/gpu/drm/bochs/bochs.h         |  98 ----
 drivers/gpu/drm/bochs/bochs_drv.c     | 205 -------
 drivers/gpu/drm/bochs/bochs_hw.c      | 323 ------------
 drivers/gpu/drm/bochs/bochs_kms.c     | 178 -------
 drivers/gpu/drm/bochs/bochs_mm.c      |  24 -
 drivers/gpu/drm/drm_gem_vram_helper.c |   9 +-
 drivers/gpu/drm/tiny/Kconfig          |  13 +
 drivers/gpu/drm/tiny/Makefile         |   1 +
 drivers/gpu/drm/tiny/bochs.c          | 733 ++++++++++++++++++++++++++
 include/drm/drm_gem_vram_helper.h     |   4 -
 15 files changed, 751 insertions(+), 857 deletions(-)
 delete mode 100644 drivers/gpu/drm/bochs/Kconfig
 delete mode 100644 drivers/gpu/drm/bochs/Makefile
 delete mode 100644 drivers/gpu/drm/bochs/bochs.h
 delete mode 100644 drivers/gpu/drm/bochs/bochs_drv.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_hw.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_kms.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_mm.c
 create mode 100644 drivers/gpu/drm/tiny/bochs.c

--
2.32.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
