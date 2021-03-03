Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AE732D632
	for <lists.virtualization@lfdr.de>; Thu,  4 Mar 2021 16:14:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42BF283E5A;
	Thu,  4 Mar 2021 15:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stGctJBoRHfA; Thu,  4 Mar 2021 15:14:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14D67833D3;
	Thu,  4 Mar 2021 15:14:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F18AC0001;
	Thu,  4 Mar 2021 15:14:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63345C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 15:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5568149B7A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 15:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="xMnck+A/";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="puGQh+pR"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2HpDC1NzlhSf
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 15:14:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2C7B475AA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 15:14:08 +0000 (UTC)
Message-Id: <20210303132023.077167457@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614870844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CdClLt4+fuyCD6ZyqthkXbcv3Ic59BWpZ3AO1GEhCVA=;
 b=xMnck+A//N+JJ/RpCJYdExXhoUvZ2fcDik9DVsp1+5j7nuopQjCucFhmvkqVup9fM19Grj
 BXnfokOAQ6iuFq44L7pJ4+c4eVzu+k+76u9fdHc+X7OnXi0aAftiBRG89BlNAzJpRFBBJD
 0M4yCujiJH2tIhkhYO+VhD3K8VhrGHcp+ALOlmOexUgS1vIovXUubnt2oT6Nx6A6SmS/l3
 vzPAPkoceU7qZmr7PyHWloesBXaP6TBOlyFg+fytBEZRG2FbHaO8xuMcvI/nmYapv0qIO8
 m8+eGV23YjiKIi9mf8XHp90jzjRch6yjA6YXHjJhKuuZt3XMjXT6+iEyiqVurw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614870844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CdClLt4+fuyCD6ZyqthkXbcv3Ic59BWpZ3AO1GEhCVA=;
 b=puGQh+pRRhN/TY3HF9OfSaRiQL69Lg4hw447EvqmiySd+QW3AXl1HHcjurw7yenjNobZem
 +chTQ0TX3LANkTDQ==
Date: Wed, 03 Mar 2021 14:20:23 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 0/7] drm, highmem: Cleanup io/kmap_atomic*() usage
MIME-Version: 1.0
Cc: Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 spice-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Christian Koenig <christian.koenig@amd.com>, Zack Rusin <zackr@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>
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

None of the DRM usage sites of temporary mappings requires the side
effects of io/kmap_atomic(), i.e. preemption and pagefault disable.

Replace them with the io/kmap_local() variants, simplify the
copy_to/from_user() error handling and remove the atomic variants.

Thanks,

	tglx
---
 Documentation/driver-api/io-mapping.rst             |   22 +++-------
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c      |    7 +--
 drivers/gpu/drm/i915/i915_gem.c                     |   40 ++++++-------------
 drivers/gpu/drm/i915/selftests/i915_gem.c           |    4 -
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c       |    8 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/fbmem.h |    8 +--
 drivers/gpu/drm/qxl/qxl_image.c                     |   18 ++++----
 drivers/gpu/drm/qxl/qxl_ioctl.c                     |   27 ++++++------
 drivers/gpu/drm/qxl/qxl_object.c                    |   12 ++---
 drivers/gpu/drm/qxl/qxl_object.h                    |    4 -
 drivers/gpu/drm/qxl/qxl_release.c                   |    4 -
 drivers/gpu/drm/ttm/ttm_bo_util.c                   |   20 +++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c                |   30 +++++---------
 include/linux/highmem-internal.h                    |   14 ------
 include/linux/io-mapping.h                          |   42 --------------------
 15 files changed, 93 insertions(+), 167 deletions(-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
