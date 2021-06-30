Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 068723B84B2
	for <lists.virtualization@lfdr.de>; Wed, 30 Jun 2021 16:07:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70DDF83B90;
	Wed, 30 Jun 2021 14:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0wXMZA3CTfxh; Wed, 30 Jun 2021 14:07:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 34DCE83B7B;
	Wed, 30 Jun 2021 14:07:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B041C000E;
	Wed, 30 Jun 2021 14:07:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2989C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 14:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D352141584
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 14:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="cKrdQ0t/";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="al3lmBcp"; dkim=pass (1024-bit key)
 header.d=suse.de header.b="cKrdQ0t/"; dkim=neutral
 reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="al3lmBcp"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id riQ62Y1rqw9f
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 14:07:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FC5140648
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 14:07:03 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE3712273C;
 Wed, 30 Jun 2021 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625062020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=phGrejQ0jDKrDlJ00AqTFtkuLpapOdSDZHKKMH8fqu0=;
 b=cKrdQ0t/cCz9S3FLDLLdUf34pRVoyfOsZ2YE0CMZDjQUrSs8IqVMXUFA85mX40RoXlNEcP
 UbSNTB/hh7LXTySGbbQoG9rzqF0rn22VgCsOxUgOimQZnoH9xh6yvkrmtCCGujE/6kjT+U
 R8o9KO60Jg7Tz+NyQWxcnX2XZh1PePs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625062020;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=phGrejQ0jDKrDlJ00AqTFtkuLpapOdSDZHKKMH8fqu0=;
 b=al3lmBcppoBcNjPexB43qGFzKoQkiAjBfoX9UlnZyYQ9vABa0shM91UwDd+K0fbc+jjAHC
 j3z766cG79l5hkBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C3593118DD;
 Wed, 30 Jun 2021 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625062020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=phGrejQ0jDKrDlJ00AqTFtkuLpapOdSDZHKKMH8fqu0=;
 b=cKrdQ0t/cCz9S3FLDLLdUf34pRVoyfOsZ2YE0CMZDjQUrSs8IqVMXUFA85mX40RoXlNEcP
 UbSNTB/hh7LXTySGbbQoG9rzqF0rn22VgCsOxUgOimQZnoH9xh6yvkrmtCCGujE/6kjT+U
 R8o9KO60Jg7Tz+NyQWxcnX2XZh1PePs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625062020;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=phGrejQ0jDKrDlJ00AqTFtkuLpapOdSDZHKKMH8fqu0=;
 b=al3lmBcppoBcNjPexB43qGFzKoQkiAjBfoX9UlnZyYQ9vABa0shM91UwDd+K0fbc+jjAHC
 j3z766cG79l5hkBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ygLPLoR63GBNDQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Jun 2021 14:07:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/3] drm/bochs: Move to tiny/ and simplify
Date: Wed, 30 Jun 2021 16:06:56 +0200
Message-Id: <20210630140659.17623-1-tzimmermann@suse.de>
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
 drivers/gpu/drm/bochs/bochs_hw.c      | 323 -----------
 drivers/gpu/drm/bochs/bochs_kms.c     | 178 -------
 drivers/gpu/drm/bochs/bochs_mm.c      |  24 -
 drivers/gpu/drm/drm_gem_vram_helper.c |   9 +-
 drivers/gpu/drm/tiny/Kconfig          |  13 +
 drivers/gpu/drm/tiny/Makefile         |   1 +
 drivers/gpu/drm/tiny/bochs.c          | 735 ++++++++++++++++++++++++++
 include/drm/drm_gem_vram_helper.h     |   4 -
 15 files changed, 753 insertions(+), 857 deletions(-)
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
