Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E103913C1BD
	for <lists.virtualization@lfdr.de>; Wed, 15 Jan 2020 13:52:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D69B8653F;
	Wed, 15 Jan 2020 12:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xyFAuBFnum4Z; Wed, 15 Jan 2020 12:52:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A90F2865EE;
	Wed, 15 Jan 2020 12:52:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86BE3C1D82;
	Wed, 15 Jan 2020 12:52:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B14EC077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 12:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6801184FC0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 12:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tuaXOcWU0P1R
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 12:52:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 44E5E85BBA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 12:52:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7BA3BAFE0;
 Wed, 15 Jan 2020 12:52:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v2 0/4] Use no_vblank property for drivers without VBLANK
Date: Wed, 15 Jan 2020 13:52:22 +0100
Message-Id: <20200115125226.13843-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: xen-devel@lists.xenproject.org, Thomas Zimmermann <tzimmermann@suse.de>,
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

(Resending because I did not cc dri-devel properly.)

Instead of faking VBLANK events by themselves, drivers without VBLANK
support can enable drm_crtc_vblank.no_vblank and let DRM do the rest.
The patchset makes this official and converts over several drivers.

Ast already uses the functionality and just needs a cleanup. Cirrus can
be converted easily by setting the field in the check() callback and
removing the existing VBLANK code. For most other simple-KMS drivers
without enable_vblank() and check(), simple-KMS helpers can enable the
faked VBLANK by default. The only exception is Xen, which comes with
its own VBLANK logic and should rather to disable no_vblank.

v2:
	* document functionality (Daniel)
	* cleanup ast (Daniel)
	* let simple-kms handle no_vblank where possible

Thomas Zimmermann (4):
  drm: Document struct drm_crtc_state.no_vblank for faking VBLANK events
  drm/ast: Set struct drm_crtc_state.no_vblank in atomic_check()
  drm/cirrus: Let DRM core send VBLANK events
  drm/simple-kms: Let DRM core send VBLANK events by default

 drivers/gpu/drm/ast/ast_mode.c          |  4 ++--
 drivers/gpu/drm/bochs/bochs_kms.c       |  9 ---------
 drivers/gpu/drm/cirrus/cirrus.c         | 10 ++--------
 drivers/gpu/drm/drm_atomic_helper.c     |  4 +++-
 drivers/gpu/drm/drm_mipi_dbi.c          |  9 ---------
 drivers/gpu/drm/drm_simple_kms_helper.c | 19 +++++++++++++++----
 drivers/gpu/drm/tiny/gm12u320.c         |  9 ---------
 drivers/gpu/drm/tiny/ili9225.c          |  9 ---------
 drivers/gpu/drm/tiny/repaper.c          |  9 ---------
 drivers/gpu/drm/tiny/st7586.c           |  9 ---------
 drivers/gpu/drm/udl/udl_modeset.c       | 11 -----------
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 13 +++++++++++++
 include/drm/drm_crtc.h                  |  9 +++++++--
 include/drm/drm_simple_kms_helper.h     |  7 +++++--
 14 files changed, 47 insertions(+), 84 deletions(-)

--
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
