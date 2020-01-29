Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3124514CA21
	for <lists.virtualization@lfdr.de>; Wed, 29 Jan 2020 13:05:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D9185203DD;
	Wed, 29 Jan 2020 12:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1h8hyr-NbDm; Wed, 29 Jan 2020 12:05:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A241820417;
	Wed, 29 Jan 2020 12:05:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91052C0171;
	Wed, 29 Jan 2020 12:05:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82CEAC1D84
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6C9C583597
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 538k2Ox5OOz9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A1CE483608
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B145AAFAC;
 Wed, 29 Jan 2020 12:05:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v5 00/15] Use no_vblank property for drivers without VBLANK
Date: Wed, 29 Jan 2020 13:05:16 +0100
Message-Id: <20200129120531.6891-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
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

The current implementation looks at state of a device wrt vblanking. If
vblanking has been initialized for the device, the driver is responsible
for sending out VBLANK events. Otherwise, DRM will send out the event.
The behaviour is selected by initializing no_vblank as part of
drm_atomic_helper_check_modeset().

I went through all drivers, looking for those that call send out VBLANK
events but do not call drm_vblank_init(). These are converted to the new
semantics. This affects tiny drivers; drivers for virtual hardware; and
a few others, which do not support interrupts. Xen comes with its
own VBLANK logic and now disables no_vblank explicitly.

v5:
	* documentation updates in DRM core and xen (Daniel, Emil, Oleksandr)
v4:
	* replaced drm_crtc_has_vblank() with drm_dev_has_vblank() (Daniel)
	* squashed patches 1 and 2
	* moved driver updates into separate patches
v3:
	* reorder and squash patches
	* set no_vblank in drm_atomic_helper_check_modeset() for *all*
	  drivers (Daniel)
	* convert all drivers to new semnatics as necessary
v2:
	* document functionality (Daniel)
	* cleanup ast (Daniel)
	* let simple-kms handle no_vblank where possible

Thomas Zimmermann (15):
  drm: Initialize struct drm_crtc_state.no_vblank from device settings
  drm/arc: Remove sending of vblank event
  drm/ast: Don't set struct drm_crtc_state.no_vblank explictly
  drm/bochs: Remove sending of vblank event
  drm/cirrus: Remove sending of vblank event
  drm/gm12u320: Remove sending of vblank event
  drm/ili9225: Remove sending of vblank event
  drm/mipi-dbi: Remove sending of vblank event
  drm/qxl: Remove sending of vblank event
  drm/repaper: Remove sending of vblank event
  drm/st7586: Remove sending of vblank event
  drm/udl: Don't set struct drm_crtc_state.no_vblank explictly
  drm/vboxvideo: Remove sending of vblank event
  drm/virtio: Remove sending of vblank event
  drm/xen: Explicitly disable automatic sending of vblank event

 drivers/gpu/drm/arc/arcpgu_crtc.c        | 16 -----------
 drivers/gpu/drm/ast/ast_mode.c           |  2 --
 drivers/gpu/drm/bochs/bochs_kms.c        |  9 -------
 drivers/gpu/drm/cirrus/cirrus.c          |  8 ------
 drivers/gpu/drm/drm_atomic_helper.c      | 10 ++++++-
 drivers/gpu/drm/drm_mipi_dbi.c           |  9 -------
 drivers/gpu/drm/drm_vblank.c             | 28 +++++++++++++++++++
 drivers/gpu/drm/qxl/qxl_display.c        | 14 ----------
 drivers/gpu/drm/tiny/gm12u320.c          |  9 -------
 drivers/gpu/drm/tiny/ili9225.c           |  9 -------
 drivers/gpu/drm/tiny/repaper.c           |  9 -------
 drivers/gpu/drm/tiny/st7586.c            |  9 -------
 drivers/gpu/drm/udl/udl_modeset.c        | 11 --------
 drivers/gpu/drm/vboxvideo/vbox_mode.c    | 12 ---------
 drivers/gpu/drm/virtio/virtgpu_display.c |  8 ------
 drivers/gpu/drm/xen/xen_drm_front_kms.c  | 19 +++++++++++++
 include/drm/drm_crtc.h                   | 34 +++++++++++++++++++-----
 include/drm/drm_simple_kms_helper.h      |  7 +++--
 include/drm/drm_vblank.h                 |  1 +
 19 files changed, 89 insertions(+), 135 deletions(-)

--
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
