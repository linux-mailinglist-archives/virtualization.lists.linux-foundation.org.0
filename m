Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FB0446169
	for <lists.virtualization@lfdr.de>; Fri,  5 Nov 2021 10:36:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46FD540448;
	Fri,  5 Nov 2021 09:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ob3NcczJxnCD; Fri,  5 Nov 2021 09:36:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F1AC94044B;
	Fri,  5 Nov 2021 09:36:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F286C0036;
	Fri,  5 Nov 2021 09:36:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B443EC000E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Nov 2021 09:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DE3681D0B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Nov 2021 09:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="uAmrBd1t";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="Sxx/wgwZ"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mMvH9O4AXKWS
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Nov 2021 09:36:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6389481CE1
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Nov 2021 09:36:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C91D421892;
 Fri,  5 Nov 2021 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636104960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nDa9zWVnZDqdiCrIxzYmPuy18f6Bp5MOv2N2VeoCCm4=;
 b=uAmrBd1t8eT0hzo+fC9iteTc3eeDTpTxrfudnMZnzhSAYEaY/VM7AQZTmH5LWVoH1NijbA
 B5vn+Qg2KFjMvjd5q0Fz/iQtWaAzHTEY6gpqYGLvCQ2ftZ+1s91bP9hFrabI9pE07ZzSfW
 w5TkvZbArtnHZzbHzCLE2pial54T1Nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636104960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nDa9zWVnZDqdiCrIxzYmPuy18f6Bp5MOv2N2VeoCCm4=;
 b=Sxx/wgwZCwKoaoy1fE97tTWxbHRxw5Qh+z0qIWFio1T9DDMDsQq1lmWQFu99FZ9LG9hpeT
 gp5192TqyxQ+JgDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9808A13B97;
 Fri,  5 Nov 2021 09:36:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eGQzJAD7hGFTaQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Nov 2021 09:36:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/3] drm/shmem-helper: Cleanup public interface
Date: Fri,  5 Nov 2021 10:35:55 +0100
Message-Id: <20211105093558.5084-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Cc: Thomas Zimmermann <tzimmermann@suse.de>, lima@lists.freedesktop.org,
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

The interface of GEM SHMEM helpers inconsistently uses either struct
drm_gem_object or drm_gem_shmem_object for the GEM object. Convert GEM
SHMEM functions to accept struct drm_gem_shmem_object, provide small
wrappers for GEM object callbacks and update all users.

Converting all GEM object functions to use drm_gem_shmem_object enables
type checking by the C compiler. Previous callers could have passed any
implementation of drm_gem_object to the GEM SHMEM helpers. It also
removes upcasting in the GEM functions and simplifies the caller side.
No functional changes.

For GEM object callbacks, the SHMEM helper library now provides a
number of small wrappers that do the necessary upcasting. Again no
functional changes.

Thomas Zimmermann (3):
  drm/shmem-helper: Unexport drm_gem_shmem_create_with_handle()
  drm/shmem-helper: Export dedicated wrappers for GEM object functions
  drm/shmem-helper: Pass GEM shmem object in public interfaces

 drivers/gpu/drm/drm_gem_shmem_helper.c        | 126 +++++--------
 drivers/gpu/drm/lima/lima_gem.c               |  18 +-
 drivers/gpu/drm/lima/lima_sched.c             |   4 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  20 ++-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |   5 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |   6 +-
 drivers/gpu/drm/v3d/v3d_bo.c                  |  22 +--
 drivers/gpu/drm/virtio/virtgpu_object.c       |  27 ++-
 include/drm/drm_gem_shmem_helper.h            | 168 +++++++++++++++---
 11 files changed, 251 insertions(+), 149 deletions(-)

--
2.33.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
