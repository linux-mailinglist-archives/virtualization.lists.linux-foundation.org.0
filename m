Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 347C32EEFD2
	for <lists.virtualization@lfdr.de>; Fri,  8 Jan 2021 10:43:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9C1572E120;
	Fri,  8 Jan 2021 09:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvCTI0XsGVZt; Fri,  8 Jan 2021 09:43:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EDB48204F2;
	Fri,  8 Jan 2021 09:43:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6D09C013A;
	Fri,  8 Jan 2021 09:43:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 967F2C013A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 09:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8526586D08
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 09:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tl6lmJr7xIb
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 09:43:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0D0DF86CF9
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 09:43:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C4A7ACC6;
 Fri,  8 Jan 2021 09:43:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, airlied@redhat.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 sam@ravnborg.org
Subject: [PATCH v4 00/13] drm: Support short-term vmap via vmap_local
Date: Fri,  8 Jan 2021 10:43:27 +0100
Message-Id: <20210108094340.15290-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: linaro-mm-sig@lists.linaro.org, virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
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

GEM VRAM helpers used to pin the BO in their implementation of vmap, so
that they could not be relocated. In recent discussions, [1][2] it became
clear that this is incorrect for in-kernel use cases, such as fbdev
emulation; which should rather depend on the reservation lock to prevent
relocation.

This patchset addresses the issue by introducing the new interfaces
vmap_local and vunmap_local throughout dma-buf and GEM. It further adds
support to DRM's CMA, SHMEM and VRAM helpers and finally converts fbdev
emulation to the new interface.

Patches 1 and 2 add the vmap_local infrastructure throughout dma-buf,
GEM and PRIME.

Patches 3 to 11 add implementations of vmap_local to DRM's various GEM
helper libraries. Due to the simple nature of these libraries, existing
vmap code can be reused easily. Several drivers are updated as well to
use the new interfaces.

Patch 12 converts generic fbdev emulation to use vmap_local. Only DRM
drivers that use GEM helpers currently use fbdev emulation, so patches
3 to 11 covered all necessary instances.

Finally patch 13 removes drm_gem_vram_vmap() functionality, which is now
unused.

I smoke-tested the patchset with ast (VRAM helpers), mgag200 (SHMEM) and
vc4 (CMA). I also tested with a version of radeon (raw TTM) that had been
converted to generic fbdev emulation.

v4:
	* move driver changes out of SHMEM and VRAM patches (Daniel)
	* call dma_buf_vmap_local() in SHMEM implementation (Daniel)
	* remove unused drm_gem_vram_vmap() functionality
	* update documentation (Daniel)
v3:
	* rewrite patchset around vmap_local
v2:
	* make importers acquire resv locks by themselves
	* document dma-buf vmap/vunmap ops

[1] https://patchwork.freedesktop.org/patch/400054/?series=83765&rev=1
[2] https://patchwork.freedesktop.org/patch/405407/?series=84401&rev=2

Thomas Zimmermann (13):
  dma-buf: Add vmap_local and vnumap_local operations
  drm/gem: Create infrastructure for GEM vmap_local
  drm/cma-helper: Provide a vmap function for short-term mappings
  drm/shmem-helper: Provide a vmap function for short-term mappings
  drm/mgag200: Use drm_gem_shmem_vmap_local() in damage handling
  drm/cirrus: Use drm_gem_shmem_vmap_local() in damage handling
  drm/gm12u320: Use drm_gem_shmem_vmap_local() in damage handling
  drm/udl: Use drm_gem_shmem_vmap_local() in damage handling
  drm/vram-helper: Provide a vmap function for short-term mappings
  drm/ast: Use drm_gem_vram_vmap_local() in cursor update
  drm/vboxvideo: Use drm_gem_vram_vmap_local() in cursor update
  drm/fb-helper: Move BO locking from DRM client to fbdev damage worker
  drm/vram-helper: Remove unused drm_gem_vram_{vmap,vunmap}()

 drivers/dma-buf/dma-buf.c              |  81 ++++++++++++++
 drivers/gpu/drm/ast/ast_cursor.c       |  37 +++++--
 drivers/gpu/drm/drm_client.c           |  94 +++++++++++++++++
 drivers/gpu/drm/drm_fb_helper.c        |  41 ++++----
 drivers/gpu/drm/drm_gem.c              |  28 +++++
 drivers/gpu/drm/drm_gem_cma_helper.c   |  27 +++++
 drivers/gpu/drm/drm_gem_shmem_helper.c |  90 ++++++++++++++--
 drivers/gpu/drm/drm_gem_vram_helper.c  | 139 ++++++++-----------------
 drivers/gpu/drm/drm_internal.h         |   2 +
 drivers/gpu/drm/drm_prime.c            |  39 +++++++
 drivers/gpu/drm/mgag200/mgag200_mode.c |  16 ++-
 drivers/gpu/drm/tiny/cirrus.c          |  10 +-
 drivers/gpu/drm/tiny/gm12u320.c        |  14 ++-
 drivers/gpu/drm/udl/udl_modeset.c      |  18 ++--
 drivers/gpu/drm/vboxvideo/vbox_mode.c  |  15 +--
 drivers/gpu/drm/vc4/vc4_bo.c           |   1 +
 drivers/gpu/drm/virtio/virtgpu_prime.c |   2 +
 include/drm/drm_client.h               |   4 +
 include/drm/drm_gem.h                  |  21 ++++
 include/drm/drm_gem_cma_helper.h       |   1 +
 include/drm/drm_gem_shmem_helper.h     |   2 +
 include/drm/drm_gem_vram_helper.h      |   4 +-
 include/drm/drm_prime.h                |   2 +
 include/linux/dma-buf.h                |  34 ++++++
 24 files changed, 566 insertions(+), 156 deletions(-)

--
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
