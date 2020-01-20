Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D123F142A76
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 13:21:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 77DF487535;
	Mon, 20 Jan 2020 12:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DrhFU8TI0W8q; Mon, 20 Jan 2020 12:21:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9FA0787554;
	Mon, 20 Jan 2020 12:21:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7579BC0178;
	Mon, 20 Jan 2020 12:21:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94210C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8FBB984EC0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hXKuBwqbIvdH
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:20:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 08C2A862B2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:20:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BE130AC7C;
 Mon, 20 Jan 2020 12:20:54 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v3 0/4] Use no_vblank property for drivers without VBLANK
Date: Mon, 20 Jan 2020 13:20:47 +0100
Message-Id: <20200120122051.25178-1-tzimmermann@suse.de>
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

Instead of faking VBLANK events by themselves, drivers without VBLANK
support can enable drm_crtc_vblank.no_vblank and let DRM do the rest.
The patchset makes this official and converts over drivers.

The current implementation looks at the number of initialized CRTCs
wrt vblanking. If vblanking has been initialized for a CRTC, the driver
is responsible for sending out VBLANK events. Otherwise, DRM will send
out the event. The behaviour selected by initializing no_vblank as part
of drm_atomic_helper_check_modeset().

I went through all drivers, looking for those that call send out VBLANK
events but do not call drm_vblank_init(). These are converted to the new
semantics. This affects tiny drivers; drivers for virtual hardware; and
a few others, which do not support interrupts. Xen comes with its
own VBLANK logic and disables no_vblank explictly.

For now, I left out Hans' R-b on v2 of the series, as the patches changed
quite a bit.

v3:
	* reorder and squash patches
	* set no_vblank in drm_atomic_helper_check_modeset() for *all*
	  drivers (Daniel)
	* convert all drivers to new semnatics as necessary
v2:
	* document functionality (Daniel)
	* cleanup ast (Daniel)
	* let simple-kms handle no_vblank where possible

Thomas Zimmermann (4):
  drm: Add drm_crtc_has_vblank()
  drm: Initialize struct drm_crtc_state.no_vblank from device settings
  drm/ast: Don't set struct drm_crtc_state.no_vblank explictly
  drm/udl: Don't set struct drm_crtc_state.no_vblank explictly

 drivers/gpu/drm/arc/arcpgu_crtc.c        | 16 -------------
 drivers/gpu/drm/ast/ast_mode.c           |  2 --
 drivers/gpu/drm/bochs/bochs_kms.c        |  9 -------
 drivers/gpu/drm/cirrus/cirrus.c          |  8 -------
 drivers/gpu/drm/drm_atomic_helper.c      | 10 +++++++-
 drivers/gpu/drm/drm_mipi_dbi.c           |  9 -------
 drivers/gpu/drm/drm_vblank.c             | 30 ++++++++++++++++++++++++
 drivers/gpu/drm/qxl/qxl_display.c        | 14 -----------
 drivers/gpu/drm/tiny/gm12u320.c          |  9 -------
 drivers/gpu/drm/tiny/ili9225.c           |  9 -------
 drivers/gpu/drm/tiny/repaper.c           |  9 -------
 drivers/gpu/drm/tiny/st7586.c            |  9 -------
 drivers/gpu/drm/udl/udl_modeset.c        | 11 ---------
 drivers/gpu/drm/vboxvideo/vbox_mode.c    | 12 ----------
 drivers/gpu/drm/virtio/virtgpu_display.c |  8 -------
 drivers/gpu/drm/xen/xen_drm_front_kms.c  | 13 ++++++++++
 include/drm/drm_crtc.h                   | 27 +++++++++++++++------
 include/drm/drm_simple_kms_helper.h      |  7 ++++--
 include/drm/drm_vblank.h                 |  1 +
 19 files changed, 78 insertions(+), 135 deletions(-)

--
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
