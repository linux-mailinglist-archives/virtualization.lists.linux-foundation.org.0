Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 077E51A5E54
	for <lists.virtualization@lfdr.de>; Sun, 12 Apr 2020 13:45:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A02C22002F;
	Sun, 12 Apr 2020 11:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RGXHoAmO5yTy; Sun, 12 Apr 2020 11:44:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2248D2000D;
	Sun, 12 Apr 2020 11:44:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E302C0172;
	Sun, 12 Apr 2020 11:44:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C569DC0172
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 11:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B05D886138
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 11:44:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 93rbMRDh6cVK
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 11:44:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B155185810
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 11:44:54 +0000 (UTC)
IronPort-SDR: 8PTYe0qNCZqsuufP1WOwJHhhakOFk9XSheqOGgiYTFauf6iSqXAE9Fr65tjfqdZ1wzCL5o3aV2
 ZD8b7nGAGjoA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2020 04:44:53 -0700
IronPort-SDR: 2JvDTeIGcqgG/475L9lHVmxP1xtKEZv0gZNl/xROFiWqC1Bp80a7aQaVcKJJnKTPoEktKnXNvU
 JdjLjdoDVzQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,374,1580803200"; d="scan'208";a="426406933"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 12 Apr 2020 04:44:52 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jNb2h-000IzZ-Gi; Sun, 12 Apr 2020 19:44:51 +0800
Date: Sun, 12 Apr 2020 19:44:28 +0800
From: kbuild test robot <lkp@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [vhost:vhost 54/54] drivers/virtio/Kconfig:49: syntax error
Message-ID: <202004121905.c0e81F5r%lkp@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
head:   e282a85dc20e6d5da055e65c48aae15cc14897c7
commit: e282a85dc20e6d5da055e65c48aae15cc14897c7 [54/54] vdpa: make vhost, virtio depend on menu
config: s390-randconfig-a001-20200412
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout e282a85dc20e6d5da055e65c48aae15cc14897c7
        GCC_VERSION=9.3.0 make.cross ARCH=s390  randconfig
        GCC_VERSION=9.3.0 make.cross ARCH=s390 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/virtio/Kconfig:49: syntax error
>> drivers/virtio/Kconfig:48: unknown statement "depend"
>> drivers/virtio/Kconfig:49: invalid statement
   drivers/virtio/Kconfig:50: invalid statement
>> drivers/virtio/Kconfig:51: unknown statement "This"
   drivers/virtio/Kconfig:52:warning: ignoring unsupported character '.'
   drivers/virtio/Kconfig:52:warning: ignoring unsupported character ','
>> drivers/virtio/Kconfig:52: unknown statement "device"
>> drivers/virtio/Kconfig:53: unknown statement "an"
>> drivers/virtio/Kconfig:54: unknown statement "physical"
   drivers/virtio/Kconfig:55:warning: ignoring unsupported character '.'
>> drivers/virtio/Kconfig:55: unknown statement "offloaded"
   drivers/virtio/Kconfig:57:warning: ignoring unsupported character ','
   drivers/virtio/Kconfig:57:warning: ignoring unsupported character '.'
>> drivers/virtio/Kconfig:57: unknown statement "If"
   make[2]: *** [scripts/kconfig/Makefile:75: oldconfig] Error 1
   make[1]: *** [Makefile:568: oldconfig] Error 2
   make: *** [Makefile:180: sub-make] Error 2
   4 real  1 user  0 sys  35.45% cpu 	make oldconfig
--
>> drivers/virtio/Kconfig:49: syntax error
>> drivers/virtio/Kconfig:48: unknown statement "depend"
>> drivers/virtio/Kconfig:49: invalid statement
   drivers/virtio/Kconfig:50: invalid statement
>> drivers/virtio/Kconfig:51: unknown statement "This"
   drivers/virtio/Kconfig:52:warning: ignoring unsupported character '.'
   drivers/virtio/Kconfig:52:warning: ignoring unsupported character ','
>> drivers/virtio/Kconfig:52: unknown statement "device"
>> drivers/virtio/Kconfig:53: unknown statement "an"
>> drivers/virtio/Kconfig:54: unknown statement "physical"
   drivers/virtio/Kconfig:55:warning: ignoring unsupported character '.'
>> drivers/virtio/Kconfig:55: unknown statement "offloaded"
   drivers/virtio/Kconfig:57:warning: ignoring unsupported character ','
   drivers/virtio/Kconfig:57:warning: ignoring unsupported character '.'
>> drivers/virtio/Kconfig:57: unknown statement "If"
   make[2]: *** [scripts/kconfig/Makefile:75: olddefconfig] Error 1
   make[1]: *** [Makefile:568: olddefconfig] Error 2
   make: *** [Makefile:180: sub-make] Error 2
   5 real  1 user  0 sys  28.87% cpu 	make olddefconfig

vim +49 drivers/virtio/Kconfig

e72542191cbba4 Ohad Ben-Cohen     2011-07-05  14  
3343660d8c62c6 Anthony Liguori    2007-11-12  15  config VIRTIO_PCI
d72c5a8c8c57cb Kees Cook          2012-10-02  16  	tristate "PCI driver for virtio devices"
d72c5a8c8c57cb Kees Cook          2012-10-02  17  	depends on PCI
3343660d8c62c6 Anthony Liguori    2007-11-12  18  	select VIRTIO
3343660d8c62c6 Anthony Liguori    2007-11-12  19  	---help---
b2a6d51ddf7b23 Michael S. Tsirkin 2015-01-15  20  	  This driver provides support for virtio based paravirtual device
3343660d8c62c6 Anthony Liguori    2007-11-12  21  	  drivers over PCI.  This requires that your VMM has appropriate PCI
3343660d8c62c6 Anthony Liguori    2007-11-12  22  	  virtio backends.  Most QEMU based VMMs should support these devices
3343660d8c62c6 Anthony Liguori    2007-11-12  23  	  (like KVM or Xen).
3343660d8c62c6 Anthony Liguori    2007-11-12  24  
3343660d8c62c6 Anthony Liguori    2007-11-12  25  	  If unsure, say M.
3343660d8c62c6 Anthony Liguori    2007-11-12  26  
46506da5f365ef Michael S. Tsirkin 2015-01-15  27  config VIRTIO_PCI_LEGACY
46506da5f365ef Michael S. Tsirkin 2015-01-15  28  	bool "Support for legacy virtio draft 0.9.X and older devices"
46506da5f365ef Michael S. Tsirkin 2015-01-15  29  	default y
46506da5f365ef Michael S. Tsirkin 2015-01-15  30  	depends on VIRTIO_PCI
46506da5f365ef Michael S. Tsirkin 2015-01-15  31  	---help---
46506da5f365ef Michael S. Tsirkin 2015-01-15  32            Virtio PCI Card 0.9.X Draft (circa 2014) and older device support.
46506da5f365ef Michael S. Tsirkin 2015-01-15  33  
46506da5f365ef Michael S. Tsirkin 2015-01-15  34  	  This option enables building a transitional driver, supporting
46506da5f365ef Michael S. Tsirkin 2015-01-15  35  	  both devices conforming to Virtio 1 specification, and legacy devices.
46506da5f365ef Michael S. Tsirkin 2015-01-15  36  	  If disabled, you get a slightly smaller, non-transitional driver,
46506da5f365ef Michael S. Tsirkin 2015-01-15  37  	  with no legacy compatibility.
46506da5f365ef Michael S. Tsirkin 2015-01-15  38  
46506da5f365ef Michael S. Tsirkin 2015-01-15  39            So look out into your driveway.  Do you have a flying car?  If
46506da5f365ef Michael S. Tsirkin 2015-01-15  40            so, you can happily disable this option and virtio will not
46506da5f365ef Michael S. Tsirkin 2015-01-15  41            break.  Otherwise, leave it set.  Unless you're testing what
46506da5f365ef Michael S. Tsirkin 2015-01-15  42            life will be like in The Future.
46506da5f365ef Michael S. Tsirkin 2015-01-15  43  
46506da5f365ef Michael S. Tsirkin 2015-01-15  44  	  If unsure, say Y.
46506da5f365ef Michael S. Tsirkin 2015-01-15  45  
c043b4a8cf3b16 Jason Wang         2020-03-26  46  config VIRTIO_VDPA
c043b4a8cf3b16 Jason Wang         2020-03-26  47  	tristate "vDPA driver for virtio devices"
e282a85dc20e6d Michael S. Tsirkin 2020-04-12 @48  	depend on VDPA
c043b4a8cf3b16 Jason Wang         2020-03-26 @49  	select VIRTIO
c043b4a8cf3b16 Jason Wang         2020-03-26  50  	help
c043b4a8cf3b16 Jason Wang         2020-03-26 @51  	  This driver provides support for virtio based paravirtual
c043b4a8cf3b16 Jason Wang         2020-03-26 @52  	  device driver over vDPA bus. For this to be useful, you need
c043b4a8cf3b16 Jason Wang         2020-03-26 @53  	  an appropriate vDPA device implementation that operates on a
c043b4a8cf3b16 Jason Wang         2020-03-26 @54  	  physical device to allow the datapath of virtio to be
c043b4a8cf3b16 Jason Wang         2020-03-26 @55  	  offloaded to hardware.
c043b4a8cf3b16 Jason Wang         2020-03-26  56  
c043b4a8cf3b16 Jason Wang         2020-03-26 @57  	  If unsure, say M.
c043b4a8cf3b16 Jason Wang         2020-03-26  58  

:::::: The code at line 49 was first introduced by commit
:::::: c043b4a8cf3b16fbdcaec1126841431c33b16e98 virtio: introduce a vDPA based transport

:::::: TO: Jason Wang <jasowang@redhat.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
