Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0AC6C242C
	for <lists.virtualization@lfdr.de>; Mon, 20 Mar 2023 22:59:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83BEA417D0;
	Mon, 20 Mar 2023 21:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83BEA417D0
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DPh1PIeU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t10lIhJNY2Bq; Mon, 20 Mar 2023 21:59:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E9E12417B9;
	Mon, 20 Mar 2023 21:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9E12417B9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28F87C0089;
	Mon, 20 Mar 2023 21:59:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA67CC0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Mar 2023 21:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C36344179D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Mar 2023 21:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C36344179D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ymu2O1J153-y
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Mar 2023 21:59:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D2674097E
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D2674097E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Mar 2023 21:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679349542; x=1710885542;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Tmt/tQ5tXzsAkLZkD8VuKuRonbA1TUxiFvDRv3tD0G0=;
 b=DPh1PIeU44oqpN8OjCwshqsAVyTvP8njqUTmtrGBGRo2COL0USENek68
 2QIQJ7se66RG1O27FWsz1cMNuSJUsrPljw2BhQMQH+so8tJYqHlB+qFRt
 aqgnmAEbgzKpzLDfg6xntAA0KrN3/sBC5pXjua4CKylFyIUsohB2Cy5ju
 pw+eB0LctP8yqhSb2T5R5hy82bFpV48YYYtyJ0fT19ov8elEnUvFg5CnO
 /0XtyHnDJioiaYcSJR2SlsFd1pE2s+/4kWBrWlPfTYSjopYOVNbn/xvZ7
 89S0fupuSj1A3HEbLMyyEYJlyJCmfuArF8IRfwmMA8+l0GNAoWyneYhIS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="341148164"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="341148164"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 14:59:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="855418135"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="855418135"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 20 Mar 2023 14:58:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1peNWs-000BLi-0v;
 Mon, 20 Mar 2023 21:58:58 +0000
Date: Tue, 21 Mar 2023 05:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Viktor Prutyanov <viktor@daynix.com>, mst@redhat.com, jasowang@redhat.com
Subject: Re: [PATCH] virtio: add VIRTIO_F_NOTIFICATION_DATA feature support
Message-ID: <202303210515.ZhhE1NmC-lkp@intel.com>
References: <20230320115451.1232171-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230320115451.1232171-1-viktor@daynix.com>
Cc: yan@daynix.com, virtualization@lists.linux-foundation.org,
 viktor@daynix.com, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
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

Hi Viktor,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.3-rc3 next-20230320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viktor-Prutyanov/virtio-add-VIRTIO_F_NOTIFICATION_DATA-feature-support/20230320-195725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20230320115451.1232171-1-viktor%40daynix.com
patch subject: [PATCH] virtio: add VIRTIO_F_NOTIFICATION_DATA feature support
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230321/202303210515.ZhhE1NmC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/b6212a12ca1691dc346e5de046ec46bd3ce11247
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Viktor-Prutyanov/virtio-add-VIRTIO_F_NOTIFICATION_DATA-feature-support/20230320-195725
        git checkout b6212a12ca1691dc346e5de046ec46bd3ce11247
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/virtio/ net/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210515.ZhhE1NmC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_pci_common.c:54:19: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] data @@
   drivers/virtio/virtio_pci_common.c:54:19: sparse:     expected unsigned int [usertype]
   drivers/virtio/virtio_pci_common.c:54:19: sparse:     got restricted __le32 [usertype] data

vim +54 drivers/virtio/virtio_pci_common.c

    49	
    50	bool vp_notify_with_data(struct virtqueue *vq)
    51	{
    52		__le32 data = vring_fill_notification_data(vq);
    53	
  > 54		iowrite32(data, (void __iomem *)vq->priv);
    55	
    56		return true;
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
