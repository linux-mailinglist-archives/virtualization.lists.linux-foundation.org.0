Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2B323D2DA
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 22:17:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4417E88689;
	Wed,  5 Aug 2020 20:17:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lrxQL7A-cQRU; Wed,  5 Aug 2020 20:17:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A6FD885F0;
	Wed,  5 Aug 2020 20:17:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FF6CC004C;
	Wed,  5 Aug 2020 20:17:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64006C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 20:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4C11A882DD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 20:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WcnNXDzwxK-M
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 20:17:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E35C486DC6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 20:17:29 +0000 (UTC)
IronPort-SDR: 2Ps429ioy+pYmdHoghd/NC3OTr8+dCN/vS9aLCBjLXBHhgjMYMFCDfWTOtWnnrLzwx757tWvvc
 xsKcK+AOUR7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="151874886"
X-IronPort-AV: E=Sophos;i="5.75,438,1589266800"; 
 d="gz'50?scan'50,208,50";a="151874886"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 13:17:28 -0700
IronPort-SDR: emRYuEeSzj9pB5v4/ZdEFR/8jechPRSrsQGO+f1dElQ7JMeRYnKJjyh0k0vl7oJu2Qwy3932KF
 /NWqWxAbQfAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,438,1589266800"; 
 d="gz'50?scan'50,208,50";a="467584503"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 05 Aug 2020 13:17:26 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k3Pqn-0000u6-NY; Wed, 05 Aug 2020 20:17:25 +0000
Date: Thu, 6 Aug 2020 04:17:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [vhost:vhost 32/52] include/linux/typecheck.h:12:18: warning:
 comparison of distinct pointer types lacks a cast
Message-ID: <202008060456.M9GRXltb%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: netdev@vger.kernel.org, kbuild-all@lists.01.org, kvm@vger.kernel.org,
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
head:   4c05433bc6fb4ae172270f0279be8ba89a3da64f
commit: b025584098e621d88894d28e80af686958e273af [32/52] virtio_input: convert to LE accessors
config: parisc-randconfig-r003-20200805 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout b025584098e621d88894d28e80af686958e273af
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:15,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/parisc/include/asm/cmpxchg.h:89,
                    from arch/parisc/include/asm/atomic.h:10,
                    from include/linux/atomic.h:7,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/virtio/virtio_input.c:2:
   drivers/virtio/virtio_input.c: In function 'virtinput_probe':
>> include/linux/typecheck.h:12:18: warning: comparison of distinct pointer types lacks a cast
      12 |  (void)(&__dummy == &__dummy2); \
         |                  ^~
   include/linux/virtio_config.h:405:3: note: in expansion of macro 'typecheck'
     405 |   typecheck(typeof(virtio_le_to_cpu(virtio_cread_v)), *(ptr)); \
         |   ^~~~~~~~~
   drivers/virtio/virtio_input.c:247:3: note: in expansion of macro 'virtio_cread_le'
     247 |   virtio_cread_le(vi->vdev, struct virtio_input_config,
         |   ^~~~~~~~~~~~~~~
>> include/linux/typecheck.h:12:18: warning: comparison of distinct pointer types lacks a cast
      12 |  (void)(&__dummy == &__dummy2); \
         |                  ^~
   include/linux/virtio_config.h:405:3: note: in expansion of macro 'typecheck'
     405 |   typecheck(typeof(virtio_le_to_cpu(virtio_cread_v)), *(ptr)); \
         |   ^~~~~~~~~
   drivers/virtio/virtio_input.c:249:3: note: in expansion of macro 'virtio_cread_le'
     249 |   virtio_cread_le(vi->vdev, struct virtio_input_config,
         |   ^~~~~~~~~~~~~~~
>> include/linux/typecheck.h:12:18: warning: comparison of distinct pointer types lacks a cast
      12 |  (void)(&__dummy == &__dummy2); \
         |                  ^~
   include/linux/virtio_config.h:405:3: note: in expansion of macro 'typecheck'
     405 |   typecheck(typeof(virtio_le_to_cpu(virtio_cread_v)), *(ptr)); \
         |   ^~~~~~~~~
   drivers/virtio/virtio_input.c:251:3: note: in expansion of macro 'virtio_cread_le'
     251 |   virtio_cread_le(vi->vdev, struct virtio_input_config,
         |   ^~~~~~~~~~~~~~~
>> include/linux/typecheck.h:12:18: warning: comparison of distinct pointer types lacks a cast
      12 |  (void)(&__dummy == &__dummy2); \
         |                  ^~
   include/linux/virtio_config.h:405:3: note: in expansion of macro 'typecheck'
     405 |   typecheck(typeof(virtio_le_to_cpu(virtio_cread_v)), *(ptr)); \
         |   ^~~~~~~~~
   drivers/virtio/virtio_input.c:253:3: note: in expansion of macro 'virtio_cread_le'
     253 |   virtio_cread_le(vi->vdev, struct virtio_input_config,
         |   ^~~~~~~~~~~~~~~

vim +12 include/linux/typecheck.h

e0deaff470900a4 Andrew Morton 2008-07-25   4  
e0deaff470900a4 Andrew Morton 2008-07-25   5  /*
e0deaff470900a4 Andrew Morton 2008-07-25   6   * Check at compile time that something is of a particular type.
e0deaff470900a4 Andrew Morton 2008-07-25   7   * Always evaluates to 1 so you may use it easily in comparisons.
e0deaff470900a4 Andrew Morton 2008-07-25   8   */
e0deaff470900a4 Andrew Morton 2008-07-25   9  #define typecheck(type,x) \
e0deaff470900a4 Andrew Morton 2008-07-25  10  ({	type __dummy; \
e0deaff470900a4 Andrew Morton 2008-07-25  11  	typeof(x) __dummy2; \
e0deaff470900a4 Andrew Morton 2008-07-25 @12  	(void)(&__dummy == &__dummy2); \
e0deaff470900a4 Andrew Morton 2008-07-25  13  	1; \
e0deaff470900a4 Andrew Morton 2008-07-25  14  })
e0deaff470900a4 Andrew Morton 2008-07-25  15  

:::::: The code at line 12 was first introduced by commit
:::::: e0deaff470900a4c3222ca7139f6c9639e26a2f5 split the typecheck macros out of include/linux/kernel.h

:::::: TO: Andrew Morton <akpm@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--CE+1k2dSO48ffgeK
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--CE+1k2dSO48ffgeK--
