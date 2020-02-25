Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E5F16C1CB
	for <lists.virtualization@lfdr.de>; Tue, 25 Feb 2020 14:11:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2D5DF2094D;
	Tue, 25 Feb 2020 13:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oMqFkBRO2ahe; Tue, 25 Feb 2020 13:11:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AC0C520370;
	Tue, 25 Feb 2020 13:11:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 983A7C0177;
	Tue, 25 Feb 2020 13:11:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D81CC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 13:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1B932878B3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 13:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mK-479FcWGKx
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 13:11:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DB40687765
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 13:11:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2F459B162;
 Tue, 25 Feb 2020 13:11:03 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, alexander.deucher@amd.com, emil.velikov@collabora.com
Subject: [PATCH v3 0/4] drm: Provide a simple encoder
Date: Tue, 25 Feb 2020 14:10:51 +0100
Message-Id: <20200225131055.27550-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
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

Many DRM drivers implement an encoder with an empty implementation. This
patchset adds drm_simple_encoder_init(), which can be used by drivers
instead. Except for the destroy callback, the simple encoder's implementation
is empty.

The patchset also converts 4 encoder instances to use the simple-encoder
helpers. But there are at least 11 other drivers which can use the helper
and I think I did not examine all drivers yet.

The patchset was smoke-tested on mgag200 by running the fbdev console
and Gnome on X11.

v3:
	* remove drm_simple_encoder_create() for lack of users (Sam, Daniel)
	* provide more precise documentation (Sam)
v2:
	* move simple encoder to KMS helpers (Daniel)
	* remove name argument; simplifies implementation (Gerd)
	* don't allocate with devm_ interfaces; unsafe with DRM (Noralf)

Thomas Zimmermann (4):
  drm/simple-kms: Add drm_simple_encoder_{init,create}()
  drm/ast: Use simple encoder
  drm/mgag200: Use simple encoder
  drm/qxl: Use simple encoder

 drivers/gpu/drm/ast/ast_drv.h           |  6 +-
 drivers/gpu/drm/ast/ast_mode.c          | 25 +++-----
 drivers/gpu/drm/drm_simple_kms_helper.c | 34 +++++++++-
 drivers/gpu/drm/mgag200/mgag200_drv.h   |  9 +--
 drivers/gpu/drm/mgag200/mgag200_mode.c  | 85 +++----------------------
 drivers/gpu/drm/qxl/qxl_display.c       | 18 +-----
 include/drm/drm_simple_kms_helper.h     |  4 ++
 7 files changed, 59 insertions(+), 122 deletions(-)

--
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
