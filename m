Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1FE11DF
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 07:58:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C31BDB50;
	Wed, 23 Oct 2019 05:57:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DC32DAE7
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 05:57:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4883014D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 05:57:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Oct 2019 22:57:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,219,1569308400"; d="scan'208";a="203865982"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Oct 2019 22:57:49 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
	(envelope-from <lkp@intel.com>)
	id 1iN9eW-0006xh-Pd; Wed, 23 Oct 2019 13:57:48 +0800
Date: Wed, 23 Oct 2019 13:55:38 +0800
From: kbuild test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/simple-kms: Standardize arguments for callbacks
Message-ID: <201910231343.cn5i5UQp%lkp@intel.com>
References: <20191022155536.27939-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022155536.27939-1-daniel.vetter@ffwll.ch>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kbuild-all@lists.01.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	virtualization@lists.linux-foundation.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel.vetter@intel.com>,
	Emil Velikov <emil.velikov@collabora.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to v5.4-rc4 next-20191022]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Daniel-Vetter/drm-simple-kms-Standardize-arguments-for-callbacks/20191023-073731
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 3b7c59a1950c75f2c0152e5a9cd77675b09233d6
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/xen/xen_drm_front_kms.c:289:23: sparse: sparse: incorrect type in initializer (incompatible argument 1 (different base types)) @@    expected int enum drm_mode_status ( *mode_valid )( ... ) @@    got int enum drm_mode_status ( *mode_valid )( ... ) @@
>> drivers/gpu/drm/xen/xen_drm_front_kms.c:289:23: sparse:    expected int enum drm_mode_status ( *mode_valid )( ... )
>> drivers/gpu/drm/xen/xen_drm_front_kms.c:289:23: sparse:    got int enum drm_mode_status ( * )( ... )

vim +289 drivers/gpu/drm/xen/xen_drm_front_kms.c

c575b7eeb89f94 Oleksandr Andrushchenko 2018-04-03  287  
c575b7eeb89f94 Oleksandr Andrushchenko 2018-04-03  288  static const struct drm_simple_display_pipe_funcs display_funcs = {
c575b7eeb89f94 Oleksandr Andrushchenko 2018-04-03 @289  	.mode_valid = display_mode_valid,
c575b7eeb89f94 Oleksandr Andrushchenko 2018-04-03  290  	.enable = display_enable,
c575b7eeb89f94 Oleksandr Andrushchenko 2018-04-03  291  	.disable = display_disable,
dd388ee1ecbb8c Daniel Vetter           2018-04-09  292  	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
c575b7eeb89f94 Oleksandr Andrushchenko 2018-04-03  293  	.update = display_update,
c575b7eeb89f94 Oleksandr Andrushchenko 2018-04-03  294  };
c575b7eeb89f94 Oleksandr Andrushchenko 2018-04-03  295  

:::::: The code at line 289 was first introduced by commit
:::::: c575b7eeb89f94356997abd62d6d5a0590e259b7 drm/xen-front: Add support for Xen PV display frontend

:::::: TO: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
:::::: CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
