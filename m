Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D52D1CDE
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 23:14:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A75E2871BF;
	Mon,  7 Dec 2020 22:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8jvALFR_P1e; Mon,  7 Dec 2020 22:14:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 497768721C;
	Mon,  7 Dec 2020 22:14:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1021DC013B;
	Mon,  7 Dec 2020 22:14:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2D1AC013B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 22:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DADE42E202
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 22:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K9eINjJ5GSnd
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 22:14:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id AA3372E200
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 22:14:30 +0000 (UTC)
IronPort-SDR: 8CWvh6QXSW+4gQ7dS0w8w6LeQz8uwDhm33+dPkEliO8V0bpzOdIThRlhYQ0h8LpREAQc2sY6Il
 tyhQybm/b4yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173021428"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
 d="gz'50?scan'50,208,50";a="173021428"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 14:14:30 -0800
IronPort-SDR: 5zag2Y/BVB9BKVq/WLUqxgaeu2Pf0dqeovRsSwW1AmP6xZucjC65+y+xT+DDIfegYqhni1FCne
 TIuaYlbcX6RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
 d="gz'50?scan'50,208,50";a="539957642"
Received: from lkp-server01.sh.intel.com (HELO f1d34cfde454) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2020 14:14:25 -0800
Received: from kbuild by f1d34cfde454 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kmOm1-0000BI-7U; Mon, 07 Dec 2020 22:14:25 +0000
Date: Tue, 8 Dec 2020 06:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drivers: gpio: add virtio-gpio guest driver
Message-ID: <202012080644.2LjqW7Sc-lkp@intel.com>
References: <20201207204838.21406-1-info@metux.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <20201207204838.21406-1-info@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kbuild-all@lists.01.org, mst@redhat.com, linus.walleij@linaro.org,
 corbet@lwn.net, linux-doc@vger.kernel.org,
 virtualization@lists.linux-foundation.org, bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org, info@metux.net
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi "Enrico,

I love your patch! Yet something to improve:

[auto build test ERROR on gpio/for-next]
[also build test ERROR on linux/master linus/master v5.10-rc7 next-20201207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Enrico-Weigelt-metux-IT-consult/drivers-gpio-add-virtio-gpio-guest-driver/20201208-045646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
config: h8300-randconfig-r032-20201207 (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/fff1ac3789d850604f11c95b185116bea68e26a9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Enrico-Weigelt-metux-IT-consult/drivers-gpio-add-virtio-gpio-guest-driver/20201208-045646
        git checkout fff1ac3789d850604f11c95b185116bea68e26a9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=h8300 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/i2c/Kconfig:8:error: recursive dependency detected!
   drivers/i2c/Kconfig:8: symbol I2C is selected by FB_DDC
   drivers/video/fbdev/Kconfig:63: symbol FB_DDC depends on FB
   drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
   drivers/gpu/drm/Kconfig:80: symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
   drivers/gpu/drm/Kconfig:74: symbol DRM_KMS_HELPER is selected by DRM_VIRTIO_GPU
   drivers/gpu/drm/virtio/Kconfig:2: symbol DRM_VIRTIO_GPU depends on VIRTIO
   drivers/virtio/Kconfig:2: symbol VIRTIO is selected by GPIO_VIRTIO
   drivers/gpio/Kconfig:1628: symbol GPIO_VIRTIO depends on GPIOLIB
   drivers/gpio/Kconfig:14: symbol GPIOLIB is selected by I2C_MUX_LTC4306
   drivers/i2c/muxes/Kconfig:47: symbol I2C_MUX_LTC4306 depends on I2C
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

vim +8 drivers/i2c/Kconfig

da3c6647ee0871 Lan Tianyu         2014-05-20   7  
da3c6647ee0871 Lan Tianyu         2014-05-20  @8  config I2C
^1da177e4c3f41 Linus Torvalds     2005-04-16   9  	tristate "I2C support"
194684e596af4b Mika Kuoppala      2009-12-06  10  	select RT_MUTEXES
4d5538f5882a6b Benjamin Tissoires 2016-10-13  11  	select IRQ_DOMAIN
a7f7f6248d9740 Masahiro Yamada    2020-06-14  12  	help
622e040d577dc8 Michael Witten     2011-07-08  13  	  I2C (pronounce: I-squared-C) is a slow serial bus protocol used in
^1da177e4c3f41 Linus Torvalds     2005-04-16  14  	  many micro controller applications and developed by Philips.  SMBus,
^1da177e4c3f41 Linus Torvalds     2005-04-16  15  	  or System Management Bus is a subset of the I2C protocol.  More
^1da177e4c3f41 Linus Torvalds     2005-04-16  16  	  information is contained in the directory <file:Documentation/i2c/>,
^1da177e4c3f41 Linus Torvalds     2005-04-16  17  	  especially in the file called "summary" there.
^1da177e4c3f41 Linus Torvalds     2005-04-16  18  
^1da177e4c3f41 Linus Torvalds     2005-04-16  19  	  Both I2C and SMBus are supported here. You will need this for
^1da177e4c3f41 Linus Torvalds     2005-04-16  20  	  hardware sensors support, and also for Video For Linux support.
^1da177e4c3f41 Linus Torvalds     2005-04-16  21  
^1da177e4c3f41 Linus Torvalds     2005-04-16  22  	  If you want I2C support, you should say Y here and also to the
^1da177e4c3f41 Linus Torvalds     2005-04-16  23  	  specific driver for your bus adapter(s) below.
^1da177e4c3f41 Linus Torvalds     2005-04-16  24  
^1da177e4c3f41 Linus Torvalds     2005-04-16  25  	  This I2C support can also be built as a module.  If so, the module
^1da177e4c3f41 Linus Torvalds     2005-04-16  26  	  will be called i2c-core.
^1da177e4c3f41 Linus Torvalds     2005-04-16  27  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--OXfL5xGRrasGEqWY
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--OXfL5xGRrasGEqWY--
