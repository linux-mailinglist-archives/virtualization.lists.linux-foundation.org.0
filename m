Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 92844674660
	for <lists.virtualization@lfdr.de>; Thu, 19 Jan 2023 23:52:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54B23821E1;
	Thu, 19 Jan 2023 22:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54B23821E1
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xj50Q0UN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTKS_x2naayf; Thu, 19 Jan 2023 22:52:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2D58D8212B;
	Thu, 19 Jan 2023 22:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D58D8212B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5AF96C007B;
	Thu, 19 Jan 2023 22:52:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4C7CC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Jan 2023 22:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B56E88210A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Jan 2023 22:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B56E88210A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pyOD0qqZpEZC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Jan 2023 22:52:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6245282018
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6245282018
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Jan 2023 22:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674168754; x=1705704754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P3bHaLVt0PP42WDlJCIlW9W0U3aAXXS762opeSLdDUk=;
 b=Xj50Q0UNvfRRBWOvHni7A+rBHR68pKW6/3v+KEsV8TK9mH6W+EXzXsSs
 rFiRJ5oILFyraerr5CqINwN+CWoBCthNez+/IJlA+CnU1ULqyMeXS3X1w
 dE2d6B2rgeR75baUiHL+oZO5Soygjt4MMRzdaBG5ydSq43xziV31MfUWT
 REwiiVyoetneCVJjhwl6zIW5WGMVsRLEek+JfUStGVpt7/NXp4Sm9b9L/
 41M50ie5mbVx3DaVBB3Pshh5cBAqbWIxehQeMiZwk5yFi0w4S2+ds2eaI
 bWZ7h6kvnhb4M4fwoZRX7bXChlbPJVbyVW1Y9lW1GRhpBq5FO64KkSEX1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="389969111"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="389969111"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 14:52:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="690805575"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="690805575"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 14:52:27 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pIdli-0001w4-2L;
 Thu, 19 Jan 2023 22:52:26 +0000
Date: Fri, 20 Jan 2023 06:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: Babis Chalios <bchalios@amazon.es>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 2/2] virtio-rng: add sysfs entries for leak detection
Message-ID: <202301200622.6x78gCS0-lkp@intel.com>
References: <20230119184349.74072-3-bchalios@amazon.es>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230119184349.74072-3-bchalios@amazon.es>
Cc: xmarcalx@amazon.co.uk, Jason@zx2c4.com, amit@kernel.org, graf@amazon.de,
 oe-kbuild-all@lists.linux.dev
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

Hi Babis,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.2-rc4 next-20230119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babis-Chalios/virtio-rng-implement-entropy-leak-feature/20230120-024631
patch link:    https://lore.kernel.org/r/20230119184349.74072-3-bchalios%40amazon.es
patch subject: [PATCH 2/2] virtio-rng: add sysfs entries for leak detection
config: ia64-randconfig-r023-20230119 (https://download.01.org/0day-ci/archive/20230120/202301200622.6x78gCS0-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2a801d93b8225555e4cb293a173e2053870cb2d1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Babis-Chalios/virtio-rng-implement-entropy-leak-feature/20230120-024631
        git checkout 2a801d93b8225555e4cb293a173e2053870cb2d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/char/hw_random/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/char/hw_random/virtio-rng.c:61:9: warning: no previous prototype for 'virtrng_sysfs_read' [-Wmissing-prototypes]
      61 | ssize_t virtrng_sysfs_read(struct file *filep, struct kobject *kobj,
         |         ^~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:76:5: warning: no previous prototype for 'virtrng_sysfs_mmap' [-Wmissing-prototypes]
      76 | int virtrng_sysfs_mmap(struct file *filep, struct kobject *kobj,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:106:5: warning: no previous prototype for 'add_fill_on_leak_request' [-Wmissing-prototypes]
     106 | int add_fill_on_leak_request(struct virtrng_info *vi, struct virtqueue *vq, void *data, size_t len)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:120:5: warning: no previous prototype for 'virtrng_fill_on_leak' [-Wmissing-prototypes]
     120 | int virtrng_fill_on_leak(struct virtrng_info *vi, void *data, size_t len)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:141:5: warning: no previous prototype for 'add_copy_on_leak_request' [-Wmissing-prototypes]
     141 | int add_copy_on_leak_request(struct virtrng_info *vi, struct virtqueue *vq,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:160:5: warning: no previous prototype for 'virtrng_copy_on_leak' [-Wmissing-prototypes]
     160 | int virtrng_copy_on_leak(struct virtrng_info *vi, void *to, void *from, size_t len)
         |     ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/virtio.h:9,
                    from drivers/char/hw_random/virtio-rng.c:15:
   include/linux/module.h:130:49: error: redefinition of '__inittest'
     130 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_init'
     267 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/virtio.h:207:9: note: in expansion of macro 'module_driver'
     207 |         module_driver(__virtio_driver, register_virtio_driver, \
         |         ^~~~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:609:1: note: in expansion of macro 'module_virtio_driver'
     609 | module_virtio_driver(virtio_rng_driver);
         | ^~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:130:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     130 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:605:1: note: in expansion of macro 'module_init'
     605 | module_init(virtio_rng_init);
         | ^~~~~~~~~~~
   include/linux/module.h:132:13: error: redefinition of 'init_module'
     132 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_init'
     267 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/virtio.h:207:9: note: in expansion of macro 'module_driver'
     207 |         module_driver(__virtio_driver, register_virtio_driver, \
         |         ^~~~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:609:1: note: in expansion of macro 'module_virtio_driver'
     609 | module_virtio_driver(virtio_rng_driver);
         | ^~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: note: previous definition of 'init_module' with type 'int(void)'
     132 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:605:1: note: in expansion of macro 'module_init'
     605 | module_init(virtio_rng_init);
         | ^~~~~~~~~~~
>> include/linux/module.h:138:49: error: redefinition of '__exittest'
     138 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:272:1: note: in expansion of macro 'module_exit'
     272 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/virtio.h:207:9: note: in expansion of macro 'module_driver'
     207 |         module_driver(__virtio_driver, register_virtio_driver, \
         |         ^~~~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:609:1: note: in expansion of macro 'module_virtio_driver'
     609 | module_virtio_driver(virtio_rng_driver);
         | ^~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:138:49: note: previous definition of '__exittest' with type 'void (*(void))(void)'
     138 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:606:1: note: in expansion of macro 'module_exit'
     606 | module_exit(virtio_rng_fini);
         | ^~~~~~~~~~~
>> include/linux/module.h:140:14: error: redefinition of 'cleanup_module'
     140 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^~~~~~~~~~~~~~
   include/linux/device/driver.h:272:1: note: in expansion of macro 'module_exit'
     272 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/virtio.h:207:9: note: in expansion of macro 'module_driver'
     207 |         module_driver(__virtio_driver, register_virtio_driver, \
         |         ^~~~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:609:1: note: in expansion of macro 'module_virtio_driver'
     609 | module_virtio_driver(virtio_rng_driver);
         | ^~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:140:14: note: previous definition of 'cleanup_module' with type 'void(void)'
     140 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^~~~~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:606:1: note: in expansion of macro 'module_exit'
     606 | module_exit(virtio_rng_fini);
         | ^~~~~~~~~~~


vim +/__exittest +138 include/linux/module.h

0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  127  
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  128  /* Each module must use one module_init(). */
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  129  #define module_init(initfn)					\
1f318a8bafcfba9 Arnd Bergmann  2017-02-01  130  	static inline initcall_t __maybe_unused __inittest(void)		\
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  131  	{ return initfn; }					\
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  132  	int init_module(void) __copy(initfn)			\
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  133  		__attribute__((alias(#initfn)));		\
92efda8eb15295a Sami Tolvanen  2022-09-08  134  	___ADDRESSABLE(init_module, __initdata);
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  135  
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  136  /* This is only required if you want to be unloadable. */
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  137  #define module_exit(exitfn)					\
1f318a8bafcfba9 Arnd Bergmann  2017-02-01 @138  	static inline exitcall_t __maybe_unused __exittest(void)		\
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  139  	{ return exitfn; }					\
cf68fffb66d60d9 Sami Tolvanen  2021-04-08 @140  	void cleanup_module(void) __copy(exitfn)		\
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  141  		__attribute__((alias(#exitfn)));		\
92efda8eb15295a Sami Tolvanen  2022-09-08  142  	___ADDRESSABLE(cleanup_module, __exitdata);
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  143  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
