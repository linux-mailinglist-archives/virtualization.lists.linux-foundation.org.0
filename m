Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4760B2308BF
	for <lists.virtualization@lfdr.de>; Tue, 28 Jul 2020 13:32:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CFC7187C24;
	Tue, 28 Jul 2020 11:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VDhlPbcNTOqW; Tue, 28 Jul 2020 11:32:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C143F878C0;
	Tue, 28 Jul 2020 11:32:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78849C004D;
	Tue, 28 Jul 2020 11:32:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4ECCDC004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 11:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 385658813E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 11:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GksuhmCgDNrk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 11:32:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 65AE188127
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 11:32:06 +0000 (UTC)
IronPort-SDR: yGGQwkKHPsTvqBkqy0ZX3C+VBK4OC+cNAgAx9uV6f/DnRJAYaU3AMhdIi5lGyFRc6DWZxe2+OC
 NQ+oAnigF8VQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="149052243"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
 d="gz'50?scan'50,208,50";a="149052243"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2020 04:32:02 -0700
IronPort-SDR: kQD1e3wXT/EGKxuQYCjlM/HinQaywP0VaEjrO1PbIk5FpKj8PfiRUjERrLyrSGAuQRdRoRNpfQ
 kLR1toUu1oZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
 d="gz'50?scan'50,208,50";a="290139263"
Received: from lkp-server01.sh.intel.com (HELO d27eb53fc52b) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 28 Jul 2020 04:32:00 -0700
Received: from kbuild by d27eb53fc52b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k0Npv-0000fg-DG; Tue, 28 Jul 2020 11:31:59 +0000
Date: Tue, 28 Jul 2020 19:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [vhost:vhost 40/45] drivers/virtio/virtio_vdpa.c:301:9: error: void
 value not ignored as it ought to be
Message-ID: <202007281956.HeB9nxyO%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="gKMricLos+KVdGMg"
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


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
head:   84d40e4b4bc64456abf5ef5663871053b40e84ac
commit: 03750f7fa49f9384911059fe16f5367b7e86f99d [40/45] virtio_vdpa: legacy features handling
config: nds32-randconfig-r003-20200728 (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 03750f7fa49f9384911059fe16f5367b7e86f99d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=nds32 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from drivers/virtio/virtio_vdpa.c:17:
   include/linux/vdpa.h:43:21: error: expected ':', ',', ';', '}' or '__attribute__' before '.' token
      43 |  bool features_valid.
         |                     ^
   include/linux/vdpa.h: In function 'vdpa_reset':
   include/linux/vdpa.h:276:6: error: 'struct vdpa_device' has no member named 'features_valid'
     276 |  vdev->features_valid = false;
         |      ^~
   include/linux/vdpa.h: In function 'vdpa_set_features':
   include/linux/vdpa.h:284:6: error: 'struct vdpa_device' has no member named 'features_valid'
     284 |  vdev->features_valid = true;
         |      ^~
   include/linux/vdpa.h: In function 'vdpa_get_config':
   include/linux/vdpa.h:298:11: error: 'struct vdpa_device' has no member named 'features_valid'
     298 |  if (!vdev->features_valid)
         |           ^~
   drivers/virtio/virtio_vdpa.c: In function 'virtio_vdpa_get':
   drivers/virtio/virtio_vdpa.c:60:32: warning: unused variable 'ops' [-Wunused-variable]
      60 |  const struct vdpa_config_ops *ops = vdpa->config;
         |                                ^~~
   drivers/virtio/virtio_vdpa.c: In function 'virtio_vdpa_finalize_features':
>> drivers/virtio/virtio_vdpa.c:301:9: error: void value not ignored as it ought to be
     301 |  return vdpa_set_features(vdpa, vdev->features);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_vdpa.c:296:32: warning: unused variable 'ops' [-Wunused-variable]
     296 |  const struct vdpa_config_ops *ops = vdpa->config;
         |                                ^~~
>> drivers/virtio/virtio_vdpa.c:302:1: warning: control reaches end of non-void function [-Wreturn-type]
     302 | }
         | ^

vim +301 drivers/virtio/virtio_vdpa.c

   292	
   293	static int virtio_vdpa_finalize_features(struct virtio_device *vdev)
   294	{
   295		struct vdpa_device *vdpa = vd_get_vdpa(vdev);
   296		const struct vdpa_config_ops *ops = vdpa->config;
   297	
   298		/* Give virtio_ring a chance to accept features. */
   299		vring_transport_features(vdev);
   300	
 > 301		return vdpa_set_features(vdpa, vdev->features);
 > 302	}
   303	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--gKMricLos+KVdGMg
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
P2x4KnXLNQEA

--gKMricLos+KVdGMg
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--gKMricLos+KVdGMg--
