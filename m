Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A2C6E3FE3
	for <lists.virtualization@lfdr.de>; Mon, 17 Apr 2023 08:38:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C8D360F4B;
	Mon, 17 Apr 2023 06:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C8D360F4B
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NUGYxRJK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6I0Z3Yxz0zqF; Mon, 17 Apr 2023 06:38:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BEB3560F44;
	Mon, 17 Apr 2023 06:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEB3560F44
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1795C0089;
	Mon, 17 Apr 2023 06:38:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2457FC002A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 06:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA7DD415E3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 06:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA7DD415E3
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=NUGYxRJK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQo4DqrxRFTq
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 06:38:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDB80415D7
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDB80415D7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 06:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681713524; x=1713249524;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=APSV8unHo6232fDV6VKenS3ZBFA96bR9koTl2+6CQjk=;
 b=NUGYxRJKyfxby7dQaJ2TAH10e1KBy6u2NmRnNEhLQXm+5kGHGy5LL+am
 Y4/I5Xki9D/xYYJ/Vv4kHGgl3CPmrmn5kAviZ/YICis3SwHrS18SQmig/
 PRQDbfNQTD4sLejJ2A3n2MjChIYraXxjS0QqKz42aIwX6/7+p7G82o1JA
 KijFLwNKwudb6O+ngV0dhG+1yqqqvLK9Lrc0QfakUumZaqhpBcfF9oUmj
 JZGCbHlv0br+eDQlg8T92Cc7LAGCnXzLF3EAvZcOojZPk2PXJTTVGaFxv
 18DeZXAQbIDD0XzZpcJvGabbG6b+ZG5/jEGlDei+5vyUFgk3qmXwVxsGV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="325162552"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="325162552"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2023 23:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="684051518"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="684051518"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 16 Apr 2023 23:38:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1poIVZ-000cD3-0V;
 Mon, 17 Apr 2023 06:38:37 +0000
Date: Mon, 17 Apr 2023 14:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] xsk: introduce xsk_dma_ops
Message-ID: <202304171427.Uaryn9jl-lkp@intel.com>
References: <20230417032750.7086-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230417032750.7086-1-xuanzhuo@linux.alibaba.com>
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>, oe-kbuild-all@lists.linux.dev,
 "Michael S. Tsirkin" <mst@redhat.com>, llvm@lists.linux.dev,
 John Fastabend <john.fastabend@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Alexei Starovoitov <ast@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, virtualization@lists.linux-foundation.org,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>
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

Hi Xuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuan-Zhuo/xsk-introduce-xsk_dma_ops/20230417-112903
patch link:    https://lore.kernel.org/r/20230417032750.7086-1-xuanzhuo%40linux.alibaba.com
patch subject: [PATCH net-next] xsk: introduce xsk_dma_ops
config: i386-randconfig-a011-20230417 (https://download.01.org/0day-ci/archive/20230417/202304171427.Uaryn9jl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/28e766603a33761d7bd1fdd3e107595408319f7d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xuan-Zhuo/xsk-introduce-xsk_dma_ops/20230417-112903
        git checkout 28e766603a33761d7bd1fdd3e107595408319f7d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304171427.Uaryn9jl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/xdp/xsk_buff_pool.c:430:26: error: incompatible function pointer types assigning to 'dma_addr_t (*)(struct device *, struct page *, unsigned long, size_t, enum dma_data_direction, unsigned long)' (aka 'unsigned int (*)(struct device *, struct page *, unsigned long, unsigned int, enum dma_data_direction, unsigned long)') from 'dma_addr_t (struct device *, struct page *, size_t, size_t, enum dma_data_direction, unsigned long)' (aka 'unsigned int (struct device *, struct page *, unsigned int, unsigned int, enum dma_data_direction, unsigned long)') [-Werror,-Wincompatible-function-pointer-types]
                   pool->dma_ops.map_page = dma_map_page_attrs;
                                          ^ ~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +430 net/xdp/xsk_buff_pool.c

   409	
   410	int xp_dma_map(struct xsk_buff_pool *pool, struct device *dev,
   411		       struct xsk_dma_ops *dma_ops,
   412		       unsigned long attrs, struct page **pages, u32 nr_pages)
   413	{
   414		struct xsk_dma_map *dma_map;
   415		dma_addr_t dma;
   416		int err;
   417		u32 i;
   418	
   419		dma_map = xp_find_dma_map(pool);
   420		if (dma_map) {
   421			err = xp_init_dma_info(pool, dma_map);
   422			if (err)
   423				return err;
   424	
   425			refcount_inc(&dma_map->users);
   426			return 0;
   427		}
   428	
   429		if (!dma_ops) {
 > 430			pool->dma_ops.map_page = dma_map_page_attrs;
   431			pool->dma_ops.mapping_error = dma_mapping_error;
   432			pool->dma_ops.need_sync = dma_need_sync;
   433			pool->dma_ops.sync_single_range_for_device = dma_sync_single_range_for_device;
   434			pool->dma_ops.sync_single_range_for_cpu = dma_sync_single_range_for_cpu;
   435			dma_ops = &pool->dma_ops;
   436		} else {
   437			pool->dma_ops = *dma_ops;
   438		}
   439	
   440		dma_map = xp_create_dma_map(dev, pool->netdev, nr_pages, pool->umem);
   441		if (!dma_map)
   442			return -ENOMEM;
   443	
   444		for (i = 0; i < dma_map->dma_pages_cnt; i++) {
   445			dma = dma_ops->map_page(dev, pages[i], 0, PAGE_SIZE,
   446						DMA_BIDIRECTIONAL, attrs);
   447			if (dma_ops->mapping_error(dev, dma)) {
   448				__xp_dma_unmap(dma_map, dma_ops, attrs);
   449				return -ENOMEM;
   450			}
   451			if (dma_ops->need_sync(dev, dma))
   452				dma_map->dma_need_sync = true;
   453			dma_map->dma_pages[i] = dma;
   454		}
   455	
   456		if (pool->unaligned)
   457			xp_check_dma_contiguity(dma_map);
   458	
   459		err = xp_init_dma_info(pool, dma_map);
   460		if (err) {
   461			__xp_dma_unmap(dma_map, dma_ops, attrs);
   462			return err;
   463		}
   464	
   465		return 0;
   466	}
   467	EXPORT_SYMBOL(xp_dma_map);
   468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
