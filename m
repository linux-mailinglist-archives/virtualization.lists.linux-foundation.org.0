Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF1B69B123
	for <lists.virtualization@lfdr.de>; Fri, 17 Feb 2023 17:39:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AD7240191;
	Fri, 17 Feb 2023 16:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AD7240191
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c1DEMFQA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O7RAtawebMCB; Fri, 17 Feb 2023 16:39:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5527E40ABA;
	Fri, 17 Feb 2023 16:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5527E40ABA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78250C0078;
	Fri, 17 Feb 2023 16:39:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A051C002B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Feb 2023 16:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E168617B0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Feb 2023 16:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E168617B0
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=c1DEMFQA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1O8v55cwepd
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Feb 2023 16:39:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A3AE605A3
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A3AE605A3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Feb 2023 16:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676651973; x=1708187973;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=wB8bS9gaVZyffaJg0ZFoYa1F5bIUV9IsyIRY37Ib0Ic=;
 b=c1DEMFQADbHCH0A30Vd2Be20JeLpAC5k2zN58iwz6YdouRorviwEylvt
 y3PQdfEVGtry1bGwEHlNlqR+B5+lhlTRDD/QL/rQQgJJkikIXcL7xD7bc
 TRhaDS8YAN7PDv2ydOSlP8Z1JNAUcpL4wz4b3Su4yNTCqi9i8EiG4lePk
 Jp3TEhvSFsfJaCplGWRN9omV79gR8T7QMAZd9PCbhavo+USGcJlkL4Mlo
 48a3CoCwB/nb8iHedttAvEMf74uhtWhw0e8ijDCTPCrLCZOxlgwDXyeV5
 ssRaYykliY7aS/IRhzq/sQUBzekdz3KlXtGH32VAPsS6kVVCXixWpAxZB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="418248078"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="418248078"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 08:39:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="620438581"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="620438581"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 17 Feb 2023 08:39:28 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pT3lf-000BeE-14;
 Fri, 17 Feb 2023 16:39:27 +0000
Date: Sat, 18 Feb 2023 00:39:18 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 c068f40300a0eaa34f7105d137a5560b86951aa9
Message-ID: <63efadb6.cR48xA1nWh81uK+0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-serial@vger.kernel.org, ntfs3@lists.linux.dev
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: c068f40300a0eaa34f7105d137a5560b86951aa9  Add linux-next specific files for 20230217

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202302062224.ByzeTXh1-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302092211.54EYDhYH-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302111601.jtY4lKrA-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302112104.g75cGHZd-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302161117.pNuySGWi-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302170355.Ljqlzucu-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302172104.q3ddwzqu-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Documentation/sphinx/templates/kernel-toc.html: 1:36 Invalid token: #}
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
arch/mips/kernel/vpe.c:643:35: error: no member named 'mod_mem' in 'struct module'
arch/mips/kernel/vpe.c:643:41: error: 'struct module' has no member named 'mod_mem'
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:294:6: warning: no previous prototype for 'optc3_wait_drr_doublebuffer_pending_clear' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:62:18: warning: variable 'cursor_bpp' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1199: warning: expecting prototype for dc_link_detect_connection_type(). Prototype was for link_detect_connection_type() instead
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:1292:32: warning: variable 'result_write_min_hblank' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.c:1586:38: warning: variable 'result' set but not used [-Wunused-but-set-variable]
drivers/net/ethernet/sfc/ef100_nic.c:1128:21: warning: unused variable 'net_dev' [-Wunused-variable]
drivers/net/ethernet/sfc/ef100_nic.c:1170:9: warning: variable 'rc' is uninitialized when used here [-Wuninitialized]
drivers/net/ethernet/sfc/efx_devlink.c:185:17: error: expected declaration or statement at end of input
drivers/net/ethernet/sfc/efx_devlink.c:185:23: error: expected ';' at end of input
drivers/net/ethernet/sfc/efx_devlink.c:522:2: error: unterminated argument list invoking macro "memset"
include/linux/build_bug.h:78:41: error: static assertion failed: "SKB_WITH_OVERHEAD(TEST_XDP_FRAME_SIZE - XDP_PACKET_HEADROOM) == TEST_MAX_PKT_SIZE"

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/tty/serial/8250/8250_dfl.c:63 dfl_uart_get_params() error: uninitialized symbol 'clk_freq'.
drivers/tty/serial/8250/8250_dfl.c:69 dfl_uart_get_params() error: uninitialized symbol 'fifo_len'.
drivers/tty/serial/8250/8250_dfl.c:90 dfl_uart_get_params() error: uninitialized symbol 'reg_layout'.
drivers/usb/gadget/composite.c:2082:33: sparse: sparse: restricted __le16 degrades to integer
drivers/virtio/virtio_ring.c:1585 virtqueue_add_packed_vring() error: uninitialized symbol 'prev'.
drivers/virtio/virtio_ring.c:1593 virtqueue_add_packed_vring() error: uninitialized symbol 'head_flags'.
drivers/virtio/virtio_ring.c:697 virtqueue_add_split_vring() error: uninitialized symbol 'prev'.
fs/ntfs3/super.c:1351 ntfs_fill_super() warn: passing a valid pointer to 'PTR_ERR'
net/mac80211/mlme.c:7124 ieee80211_setup_assoc_link() warn: variable dereferenced before check 'elem' (see line 7122)
net/mac80211/rx.c:2947 __ieee80211_rx_h_amsdu() error: we previously assumed 'rx->sta' could be null (see line 2933)

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_detection.c:warning:expecting-prototype-for-dc_link_detect_connection_type().-Prototype-was-for-link_detect_connection_type()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- alpha-randconfig-c041-20230212
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_detection.c:warning:expecting-prototype-for-dc_link_detect_connection_type().-Prototype-was-for-link_detect_connection_type()-instead
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_detection.c:warning:expecting-prototype-for-dc_link_detect_connection_type().-Prototype-was-for-link_detect_connection_type()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_detection.c:warning:expecting-prototype-for-dc_link_detect_connection_type().-Prototype-was-for-link_detect_connection_type()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_detection.c:warning:expecting-prototype-for-dc_link_detect_connection_type().-Prototype-was-for-link_detect_connection_type()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn30-dcn30_optc.c:warning:no-previous-prototype-for-optc3_wait_drr_doublebuffer_pending_clear
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_resource_helpers.c:warning:variable-cursor_bpp-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_detection.c:warning:expecting-prototype-for-dc_link_detect_connection_type().-Prototype-was-for-link_detect_connection_type()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm64-randconfig-r031-20230212
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn30-dcn30_optc.c:warning:no-previous-prototype-for-optc3_wait_drr_doublebuffer_pending_clear
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_resource_helpers.c:warning:variable-cursor_bpp-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_detection.c:warning:expecting-prototype-for-dc_link_detect_connection_type().-Prototype-was-for-link_detect_connection_type()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn30-dcn30_optc.c:warning:no-previous-prototype-for-optc3_wait_drr_doublebuffer_pending_clear
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_resource_helpers.c:warning:variable-cursor_bpp-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_detection.c:warning:expecting-prototype-for-dc_link_detect_connection_type().-Prototype-was-for-link_detect_connection_type()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- i386-randconfig-m021
|   |-- drivers-virtio-virtio_ring.c-virtqueue_add_packed_vring()-error:uninitialized-symbol-head_flags-.
|   |-- drivers-virtio-virtio_ring.c-virtqueue_add_packed_vring()-error:uninitialized-symbol-prev-.
|   `-- drivers-virtio-virtio_ring.c-virtqueue_add_split_vring()-error:uninitialized-symbol-prev-.
|-- i386-randconfig-s001
|   |-- drivers-gpu-drm-i915-gem-i915_gem_ttm.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-vm_fault_t-assigned-usertype-ret-got-int
|   `-- drivers-usb-gadget-composite.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- i386-randconfig-s002
|   `-- drivers-gpu-drm-i915-gem-i915_gem_ttm.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-vm_fault_t-assigned-usertype-ret-got-int
|-- i386-randconfig-s003
|   `-- drivers-usb-gadget-composite.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_detection.c:warning:expecting-prototype-for-dc_link_detect_connection_type().-Prototype-was-for-link_detect_connection_type()-instead
clang_recent_errors
|-- i386-randconfig-a015
|   |-- drivers-net-ethernet-sfc-ef100_nic.c:warning:unused-variable-net_dev
|   `-- drivers-net-ethernet-sfc-ef100_nic.c:warning:variable-rc-is-uninitialized-when-used-here
`-- mips-maltaaprp_defconfig
    `-- arch-mips-kernel-vpe.c:error:no-member-named-mod_mem-in-struct-module

elapsed time: 727m

configs tested: 112
configs skipped: 5

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                          axs101_defconfig
arc                                 defconfig
arc                  randconfig-r043-20230217
arm                              allmodconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                                 defconfig
arm                            hisi_defconfig
arm                       multi_v4t_defconfig
arm                  randconfig-c002-20230217
arm64                            alldefconfig
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                         debian-10.3-func
i386                   debian-10.3-kselftests
i386                        debian-10.3-kunit
i386                          debian-10.3-kvm
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                 randconfig-a011-20230213
i386                 randconfig-a012-20230213
i386                 randconfig-a013-20230213
i386                 randconfig-a014-20230213
i386                 randconfig-a015-20230213
i386                 randconfig-a016-20230213
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                         amcore_defconfig
m68k                         apollo_defconfig
m68k                                defconfig
m68k                        stmark2_defconfig
m68k                           virt_defconfig
mips                             allmodconfig
mips                             allyesconfig
mips                           xway_defconfig
nios2                               defconfig
openrisc                    or1ksim_defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                      cm5200_defconfig
powerpc                mpc7448_hpc2_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv             nommu_k210_sdcard_defconfig
riscv                randconfig-r042-20230217
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
s390                 randconfig-r044-20230217
sh                               allmodconfig
sh                           se7619_defconfig
sh                           se7751_defconfig
sh                        sh7757lcr_defconfig
sh                  sh7785lcr_32bit_defconfig
sparc                               defconfig
sparc64                             defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64               randconfig-a011-20230213
x86_64               randconfig-a012-20230213
x86_64               randconfig-a013-20230213
x86_64               randconfig-a014-20230213
x86_64               randconfig-a015-20230213
x86_64               randconfig-a016-20230213
x86_64                               rhel-8.3
xtensa                       common_defconfig

clang tested configs:
arm                         bcm2835_defconfig
arm                           omap1_defconfig
arm                          pxa168_defconfig
arm                  randconfig-r046-20230217
hexagon              randconfig-r041-20230217
hexagon              randconfig-r045-20230217
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
mips                          malta_defconfig
mips                      maltaaprp_defconfig
mips                           mtx1_defconfig
mips                       rbtx49xx_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                      walnut_defconfig
powerpc                 xes_mpc85xx_defconfig
riscv                            alldefconfig
x86_64               randconfig-a001-20230213
x86_64               randconfig-a002-20230213
x86_64               randconfig-a003-20230213
x86_64               randconfig-a004-20230213
x86_64               randconfig-a005-20230213
x86_64               randconfig-a006-20230213
x86_64                        randconfig-k001
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
