Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 708C453F49D
	for <lists.virtualization@lfdr.de>; Tue,  7 Jun 2022 05:38:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64F6660C19;
	Tue,  7 Jun 2022 03:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHwg_omlJsoI; Tue,  7 Jun 2022 03:38:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 20D1360E11;
	Tue,  7 Jun 2022 03:38:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F00BC007E;
	Tue,  7 Jun 2022 03:38:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4E34C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jun 2022 03:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F8D8415BF
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jun 2022 03:38:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rsHu5vKgmLHV
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jun 2022 03:38:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19DD840988
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jun 2022 03:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654573128; x=1686109128;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w4xeyqU+kOhDYzyqy82v69OYCHkAH6xk8Nd95qrz48A=;
 b=cI2CtkAJJHCwTU24iLHMl95jI+TLyqQ/r3CzxiuMBsum3Zv2lOijhywx
 7DQxnW0svepR7cp/Rauiczc3JEk/wEP7uw+iZJv1Ee5IL74PR6EiMkyxq
 D7kbQjvry7tdZe4f42EZ/drgMjgpCADrgfxO3h3i3qQ1FeSLQWIkDJQYB
 kieFIk5f/kvR16vOGkqCCcMAg/9btpMI1Y088XhRrhM/chcTLjbk9KAPd
 Ho5/plGjKvI5ADJA8DLH/y62CuUwY1ISoqsWmZM36GUBflL+xLtTSWE3x
 /dgtopIsWdfkoEzeAqYkJ9xLs+k8sMlFV0uH6o0ehNoz6lj9zRqRFrxQB w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="363048581"
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; d="scan'208";a="363048581"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 20:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; d="scan'208";a="579430786"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 06 Jun 2022 20:38:40 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nyQ3D-000DJf-KE;
 Tue, 07 Jun 2022 03:38:39 +0000
Date: Tue, 7 Jun 2022 11:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 04/20] mm/migrate: Convert buffer_migrate_page() to
 buffer_migrate_folio()
Message-ID: <202206071139.aWSx4GHH-lkp@intel.com>
References: <20220606204050.2625949-5-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606204050.2625949-5-willy@infradead.org>
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 kbuild-all@lists.01.org, linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
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

Hi "Matthew,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.19-rc1 next-20220606]
[cannot apply to jaegeuk-f2fs/dev-test trondmy-nfs/linux-next kdave/for-next xfs-linux/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/Convert-aops-migratepage-to-aops-migrate_folio/20220607-044509
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f2906aa863381afb0015a9eb7fefad885d4e5a56
config: i386-defconfig (https://download.01.org/0day-ci/archive/20220607/202206071139.aWSx4GHH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/96e64ba8b1be545885d89f44b1d8b968b22bdb4d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Wilcox-Oracle/Convert-aops-migratepage-to-aops-migrate_folio/20220607-044509
        git checkout 96e64ba8b1be545885d89f44b1d8b968b22bdb4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/migrate.c:775: warning: expecting prototype for buffer_migrate_folio_noref(). Prototype was for buffer_migrate_folio_norefs() instead


vim +775 mm/migrate.c

89cb0888ca1483a Jan Kara                2018-12-28  758  
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  759) /**
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  760)  * buffer_migrate_folio_noref() - Migration function for folios with buffers.
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  761)  * @mapping: The address space containing @src.
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  762)  * @dst: The folio to migrate to.
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  763)  * @src: The folio to migrate from.
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  764)  * @mode: How to migrate the folio.
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  765)  *
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  766)  * Like buffer_migrate_folio() except that this variant is more careful
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  767)  * and checks that there are also no buffer head references. This function
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  768)  * is the right one for mappings where buffer heads are directly looked
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  769)  * up and referenced (such as block device mappings).
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  770)  *
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  771)  * Return: 0 on success or a negative errno on failure.
89cb0888ca1483a Jan Kara                2018-12-28  772   */
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  773) int buffer_migrate_folio_norefs(struct address_space *mapping,
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  774) 		struct folio *dst, struct folio *src, enum migrate_mode mode)
89cb0888ca1483a Jan Kara                2018-12-28 @775  {
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  776) 	return __buffer_migrate_folio(mapping, dst, src, mode, true);
89cb0888ca1483a Jan Kara                2018-12-28  777  }
9361401eb7619c0 David Howells           2006-09-30  778  #endif
1d8b85ccf1ed53a Christoph Lameter       2006-06-23  779  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
