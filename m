Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6183A53C151
	for <lists.virtualization@lfdr.de>; Fri,  3 Jun 2022 01:27:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58E2982CE4;
	Thu,  2 Jun 2022 23:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id osdR8oyDRM2r; Thu,  2 Jun 2022 23:27:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E2EA1833A8;
	Thu,  2 Jun 2022 23:27:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AF27C0081;
	Thu,  2 Jun 2022 23:27:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 409A5C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jun 2022 23:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 381BF830DE
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jun 2022 23:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yCnG_VDvDJ_f
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jun 2022 23:27:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 204F982CE4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jun 2022 23:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654212421; x=1685748421;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GRhPAQ2CU2PMb7oMPFXlMaxADdhIAO/5kxDqAOm3iB0=;
 b=aLGF0v7PIzF4p7rcIB3yFUcLVwsmsQs3q6L64tScaEHKcbbGZjfrYMGx
 1W/pe0xmP9qs6OPRI/EJWOQQ+f9BdjLhDrLj2E3nSGdtzmSWxt+IM0IXN
 iODDDGY+XSKxO/+ZGPC8+pHz/Z043HZAs8Ko3+DRwpK6+ztzPlTtiYENk
 ZjTrJEEFFK0oDsXP5mgJYQIN+2oDydXJZO9R81mRaSVBB7n3EP62CIYAK
 GZAh5+K8nZTwd52nZiAWUfgqXdYP8DqONdHd8E5R36hthjkhJ2QSOFgf6
 R4nkUiYsq0RVRcT6J0MFB3lMEsFWz1dGZYBy0il6f6a8EHS4eblEYODnp Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="256591921"
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; d="scan'208";a="256591921"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 16:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; d="scan'208";a="563544713"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 02 Jun 2022 16:26:54 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nwuDN-0005WF-L0;
 Thu, 02 Jun 2022 23:26:53 +0000
Date: Fri, 3 Jun 2022 07:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zack@kde.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/qxl: Create mouse hotspot properties on cursor
 planes
Message-ID: <202206030750.8hv8vdBA-lkp@intel.com>
References: <20220602154243.1015688-4-zack@kde.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220602154243.1015688-4-zack@kde.org>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev,
 virtualization@lists.linux-foundation.org, krastevm@vmware.com,
 Dave Airlie <airlied@redhat.com>, spice-devel@lists.freedesktop.org,
 mombasawalam@vmware.com
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

Hi Zack,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip v5.18 next-20220602]
[cannot apply to airlied/drm-next tegra-drm/drm/tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Zack-Rusin/drm-Add-mouse-cursor-hotspot-support-to-atomic-KMS/20220602-234633
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220603/202206030750.8hv8vdBA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0bf2395ee17bd25ae6411c560de883496256195d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zack-Rusin/drm-Add-mouse-cursor-hotspot-support-to-atomic-KMS/20220602-234633
        git checkout 0bf2395ee17bd25ae6411c560de883496256195d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/qxl/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/qxl/qxl_display.c:486:26: warning: unused variable 'fb' [-Wunused-variable]
           struct drm_framebuffer *fb = plane_state->fb;
                                   ^
   drivers/gpu/drm/qxl/qxl_display.c:532:26: warning: unused variable 'fb' [-Wunused-variable]
           struct drm_framebuffer *fb = plane_state->fb;
                                   ^
   2 warnings generated.


vim +/fb +486 drivers/gpu/drm/qxl/qxl_display.c

c2ff663260fee3 Gabriel Krisman Bertazi 2017-02-27  482  
b4b27f08f9f96d Gerd Hoffmann           2021-02-17  483  static int qxl_primary_apply_cursor(struct qxl_device *qdev,
b4b27f08f9f96d Gerd Hoffmann           2021-02-17  484  				    struct drm_plane_state *plane_state)
9428088c90b6f7 Ray Strode              2017-11-27  485  {
b4b27f08f9f96d Gerd Hoffmann           2021-02-17 @486  	struct drm_framebuffer *fb = plane_state->fb;
b4b27f08f9f96d Gerd Hoffmann           2021-02-17  487  	struct qxl_crtc *qcrtc = to_qxl_crtc(plane_state->crtc);
9428088c90b6f7 Ray Strode              2017-11-27  488  	struct qxl_cursor_cmd *cmd;
9428088c90b6f7 Ray Strode              2017-11-27  489  	struct qxl_release *release;
9428088c90b6f7 Ray Strode              2017-11-27  490  	int ret = 0;
9428088c90b6f7 Ray Strode              2017-11-27  491  
9428088c90b6f7 Ray Strode              2017-11-27  492  	if (!qcrtc->cursor_bo)
9428088c90b6f7 Ray Strode              2017-11-27  493  		return 0;
9428088c90b6f7 Ray Strode              2017-11-27  494  
9428088c90b6f7 Ray Strode              2017-11-27  495  	ret = qxl_alloc_release_reserved(qdev, sizeof(*cmd),
9428088c90b6f7 Ray Strode              2017-11-27  496  					 QXL_RELEASE_CURSOR_CMD,
9428088c90b6f7 Ray Strode              2017-11-27  497  					 &release, NULL);
9428088c90b6f7 Ray Strode              2017-11-27  498  	if (ret)
9428088c90b6f7 Ray Strode              2017-11-27  499  		return ret;
9428088c90b6f7 Ray Strode              2017-11-27  500  
9428088c90b6f7 Ray Strode              2017-11-27  501  	ret = qxl_release_list_add(release, qcrtc->cursor_bo);
9428088c90b6f7 Ray Strode              2017-11-27  502  	if (ret)
9428088c90b6f7 Ray Strode              2017-11-27  503  		goto out_free_release;
9428088c90b6f7 Ray Strode              2017-11-27  504  
9428088c90b6f7 Ray Strode              2017-11-27  505  	ret = qxl_release_reserve_list(release, false);
9428088c90b6f7 Ray Strode              2017-11-27  506  	if (ret)
9428088c90b6f7 Ray Strode              2017-11-27  507  		goto out_free_release;
9428088c90b6f7 Ray Strode              2017-11-27  508  
9428088c90b6f7 Ray Strode              2017-11-27  509  	cmd = (struct qxl_cursor_cmd *)qxl_release_map(qdev, release);
9428088c90b6f7 Ray Strode              2017-11-27  510  	cmd->type = QXL_CURSOR_SET;
0bf2395ee17bd2 Zack Rusin              2022-06-02  511  	cmd->u.set.position.x = plane_state->crtc_x + plane_state->hotspot_x;
0bf2395ee17bd2 Zack Rusin              2022-06-02  512  	cmd->u.set.position.y = plane_state->crtc_y + plane_state->hotspot_y;
9428088c90b6f7 Ray Strode              2017-11-27  513  
9428088c90b6f7 Ray Strode              2017-11-27  514  	cmd->u.set.shape = qxl_bo_physical_address(qdev, qcrtc->cursor_bo, 0);
9428088c90b6f7 Ray Strode              2017-11-27  515  
9428088c90b6f7 Ray Strode              2017-11-27  516  	cmd->u.set.visible = 1;
9428088c90b6f7 Ray Strode              2017-11-27  517  	qxl_release_unmap(qdev, release, &cmd->release_info);
9428088c90b6f7 Ray Strode              2017-11-27  518  
9428088c90b6f7 Ray Strode              2017-11-27  519  	qxl_release_fence_buffer_objects(release);
933db73351d359 Vasily Averin           2020-04-29  520  	qxl_push_cursor_ring_release(qdev, release, QXL_CMD_CURSOR, false);
9428088c90b6f7 Ray Strode              2017-11-27  521  
9428088c90b6f7 Ray Strode              2017-11-27  522  	return ret;
9428088c90b6f7 Ray Strode              2017-11-27  523  
9428088c90b6f7 Ray Strode              2017-11-27  524  out_free_release:
9428088c90b6f7 Ray Strode              2017-11-27  525  	qxl_release_free(qdev, release);
9428088c90b6f7 Ray Strode              2017-11-27  526  	return ret;
9428088c90b6f7 Ray Strode              2017-11-27  527  }
9428088c90b6f7 Ray Strode              2017-11-27  528  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
