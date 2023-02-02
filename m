Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6B7688A6F
	for <lists.virtualization@lfdr.de>; Fri,  3 Feb 2023 00:03:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E06082080;
	Thu,  2 Feb 2023 23:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E06082080
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NZyXMBrw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULH0FnbkvM80; Thu,  2 Feb 2023 23:03:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F19C482082;
	Thu,  2 Feb 2023 23:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F19C482082
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A890C0078;
	Thu,  2 Feb 2023 23:03:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 326DFC002B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Feb 2023 23:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC7CF405F3
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Feb 2023 23:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC7CF405F3
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=NZyXMBrw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SwEOxRUT_OAJ
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Feb 2023 23:03:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82FF440192
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82FF440192
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Feb 2023 23:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675378982; x=1706914982;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=53RNLMoQEXs/8h3PKrRplWnOeJwQKRWrDky6pO2LlBw=;
 b=NZyXMBrwOduJtrn6NzW/2Z45Mhmg9L+MxMy4LJfQQwbGN3KDr5h9GJqN
 z3d0EhbkiM1JeIaFPMnhnARKZyVlFLJF6QnyOgIPQaAnpuP3f3/3L7BhE
 2X38qUP9HvoXypgb1dmDd3yJefIjx+GZ07ilAEken7Vdo8qT5tVOmjMQm
 +wUVl6Nb5f81DlSpw99ZgpjK49DKzSYQabG0vZc5TLxRCxAAWuSJtWMnT
 ibjn3zzuAYjV1zba2iMfLNC8CE09OhqCYj7hHGHrCK/fyyy0zdcSeq1Ei
 YgJ8T/3c0m/JV4+iGZNO96jDHJ57m4Q8PCp2YK1U9I0UccpPoNP7yNOXl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="316589865"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="316589865"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 15:03:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="695944506"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="695944506"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 02 Feb 2023 15:02:55 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pNibW-0006vo-1T;
 Thu, 02 Feb 2023 23:02:54 +0000
Date: Fri, 3 Feb 2023 07:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, netdev@vger.kernel.org
Subject: Re: [PATCH 22/33] virtio_net: xsk: introduce xsk disable
Message-ID: <202302030652.8JBKpzat-lkp@intel.com>
References: <20230202110058.130695-23-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230202110058.130695-23-xuanzhuo@linux.alibaba.com>
Cc: Petr Machata <petrm@nvidia.com>, Menglong Dong <imagedong@tencent.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, virtualization@lists.linux-foundation.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Magnus Karlsson <magnus.karlsson@intel.com>
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on next-20230202]
[cannot apply to net/master mst-vhost/linux-next linus/master v6.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuan-Zhuo/virtio_ring-virtqueue_add-support-premapped/20230202-190707
patch link:    https://lore.kernel.org/r/20230202110058.130695-23-xuanzhuo%40linux.alibaba.com
patch subject: [PATCH 22/33] virtio_net: xsk: introduce xsk disable
config: nios2-randconfig-s033-20230202 (https://download.01.org/0day-ci/archive/20230203/202302030652.8JBKpzat-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/3c385ac45368b585d2ca1a45263b4a0536cef0dd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xuan-Zhuo/virtio_ring-virtqueue_add-support-premapped/20230202-190707
        git checkout 3c385ac45368b585d2ca1a45263b4a0536cef0dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/net/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/net/virtio/xsk.c:133:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct xsk_buff_pool *pool @@     got struct xsk_buff_pool [noderef] __rcu *pool @@
   drivers/net/virtio/xsk.c:133:35: sparse:     expected struct xsk_buff_pool *pool
   drivers/net/virtio/xsk.c:133:35: sparse:     got struct xsk_buff_pool [noderef] __rcu *pool

vim +133 drivers/net/virtio/xsk.c

   116	
   117	static int virtnet_xsk_pool_disable(struct net_device *dev, u16 qid)
   118	{
   119		struct virtnet_info *vi = netdev_priv(dev);
   120		struct receive_queue *rq;
   121		struct send_queue *sq;
   122		int err1, err2;
   123	
   124		if (qid >= vi->curr_queue_pairs)
   125			return -EINVAL;
   126	
   127		sq = &vi->sq[qid];
   128		rq = &vi->rq[qid];
   129	
   130		virtio_dma_unmap(&vi->vdev->dev, sq->xsk.hdr_dma_address, vi->hdr_len,
   131				 DMA_TO_DEVICE);
   132	
 > 133		xsk_pool_dma_unmap(sq->xsk.pool, 0);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
