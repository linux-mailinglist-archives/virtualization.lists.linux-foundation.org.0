Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D121B7CE837
	for <lists.virtualization@lfdr.de>; Wed, 18 Oct 2023 21:53:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AFF783005;
	Wed, 18 Oct 2023 19:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AFF783005
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cr8hzm/U
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BoCj3sg1S9IG; Wed, 18 Oct 2023 19:53:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 190E182F8A;
	Wed, 18 Oct 2023 19:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 190E182F8A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16A9BC008C;
	Wed, 18 Oct 2023 19:53:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7E8DC0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 19:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DEBA41BA3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 19:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DEBA41BA3
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=cr8hzm/U
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6e54cUfrTghV
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 19:53:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BD0D41B5C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 19:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BD0D41B5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697658791; x=1729194791;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=vVcTcLcqzSvvPpWvdFGa7bhaSwzPNStbb7uaXtpeqCI=;
 b=cr8hzm/U7E1ovbjawHrK5fQH4bsIFGQTxvSj60nfpr778ilOjBnA67VZ
 Yw0d0I4DLhb99KnM6dwGFVaiZ9daaqzknuwoRQi7jJu16CF35eOAET6RY
 pEaodAxmeOC8RSdjBM2260TzVf643z8/Rucp1Rh8F4DqhsFc1+N+C2Lwd
 xSwfyHRoZWCS2nirxBJWJYmjaU7RAuBDIVPMtf4A/6ecDCrSLh4+LhLxq
 C99CrhTrD644TaPbgAOvl4xueLaHv6GNbPLaFBdxBi6azKChGztO308an
 MDqmYeTNPpDyL5gDoll7UNCzTTy76IksL/yOCn7k8OXDMOTaZqhVVk+6i A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452569155"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="452569155"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 12:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="1003924988"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="1003924988"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 18 Oct 2023 12:52:20 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qtCaX-0000wa-1O;
 Wed, 18 Oct 2023 19:52:17 +0000
Date: Thu, 19 Oct 2023 03:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: [mst-vhost:vhost 18/35] drivers/virtio/virtio_pci_modern.c:54:17:
 warning: format '%ld' expects argument of type 'long int', but argument 3
 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202310190338.ES0nNnf4-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org,
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
head:   185ec99c107fe7659a9d809bc7a8e7ab3c338bf9
commit: 37c82be3988d4cc710dee436d47cd80e792cab93 [18/35] virtio_pci: add check for common cfg size
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310190338.ES0nNnf4-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190338.ES0nNnf4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190338.ES0nNnf4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from drivers/virtio/virtio_pci_common.h:21,
                    from drivers/virtio/virtio_pci_modern.c:20:
   drivers/virtio/virtio_pci_modern.c: In function '__vp_check_common_size_one_feature':
>> drivers/virtio/virtio_pci_modern.c:54:17: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      54 |                 "virtio: common cfg size(%ld) does not match the feature %s\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/virtio/virtio_pci_modern.c:53:9: note: in expansion of macro 'dev_err'
      53 |         dev_err(&vdev->dev,
         |         ^~~~~~~
   drivers/virtio/virtio_pci_modern.c:54:44: note: format string is defined here
      54 |                 "virtio: common cfg size(%ld) does not match the feature %s\n",
         |                                          ~~^
         |                                            |
         |                                            long int
         |                                          %d


vim +54 drivers/virtio/virtio_pci_modern.c

  > 20	#include "virtio_pci_common.h"
    21	
    22	static u64 vp_get_features(struct virtio_device *vdev)
    23	{
    24		struct virtio_pci_device *vp_dev = to_vp_device(vdev);
    25	
    26		return vp_modern_get_features(&vp_dev->mdev);
    27	}
    28	
    29	static void vp_transport_features(struct virtio_device *vdev, u64 features)
    30	{
    31		struct virtio_pci_device *vp_dev = to_vp_device(vdev);
    32		struct pci_dev *pci_dev = vp_dev->pci_dev;
    33	
    34		if ((features & BIT_ULL(VIRTIO_F_SR_IOV)) &&
    35				pci_find_ext_capability(pci_dev, PCI_EXT_CAP_ID_SRIOV))
    36			__virtio_set_bit(vdev, VIRTIO_F_SR_IOV);
    37	
    38		if (features & BIT_ULL(VIRTIO_F_RING_RESET))
    39			__virtio_set_bit(vdev, VIRTIO_F_RING_RESET);
    40	}
    41	
    42	static int __vp_check_common_size_one_feature(struct virtio_device *vdev, u32 fbit,
    43						    u32 offset, const char *fname)
    44	{
    45		struct virtio_pci_device *vp_dev = to_vp_device(vdev);
    46	
    47		if (!__virtio_test_bit(vdev, fbit))
    48			return 0;
    49	
    50		if (likely(vp_dev->mdev.common_len >= offset))
    51			return 0;
    52	
    53		dev_err(&vdev->dev,
  > 54			"virtio: common cfg size(%ld) does not match the feature %s\n",
    55			vp_dev->mdev.common_len, fname);
    56	
    57		return -EINVAL;
    58	}
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
