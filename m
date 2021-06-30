Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E0F3B8AE7
	for <lists.virtualization@lfdr.de>; Thu,  1 Jul 2021 01:22:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2288283BD3;
	Wed, 30 Jun 2021 23:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y42V8ms37eq9; Wed, 30 Jun 2021 23:22:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 254AB83BC0;
	Wed, 30 Jun 2021 23:22:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 879A9C000E;
	Wed, 30 Jun 2021 23:22:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD71DC000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 23:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A195F400D4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 23:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ns6mv-WMh_-U
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 23:22:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FA4C4000B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 23:22:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="272298528"
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="272298528"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 16:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="626174884"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 30 Jun 2021 16:22:13 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lyjX2-000A7j-Ap; Wed, 30 Jun 2021 23:22:12 +0000
Date: Thu, 1 Jul 2021 07:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, kraxel@redhat.com,
 daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [RFC PATCH] drm/bochs: bochs_mode_funcs can be static
Message-ID: <20210630232119.GA13084@179610431da4>
References: <20210630140659.17623-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210630140659.17623-2-tzimmermann@suse.de>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
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

drivers/gpu/drm/tiny/bochs.c:542:36: warning: symbol 'bochs_mode_funcs' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 bochs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index edcd31db5b9ce..067e043de437d 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -539,7 +539,7 @@ bochs_gem_fb_create(struct drm_device *dev, struct drm_file *file,
 	return drm_gem_fb_create(dev, file, mode_cmd);
 }
 
-const struct drm_mode_config_funcs bochs_mode_funcs = {
+static const struct drm_mode_config_funcs bochs_mode_funcs = {
 	.fb_create = bochs_gem_fb_create,
 	.mode_valid = drm_vram_helper_mode_valid,
 	.atomic_check = drm_atomic_helper_check,
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
