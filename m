Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 887AA5946EB
	for <lists.virtualization@lfdr.de>; Tue, 16 Aug 2022 01:15:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B1F2402BC;
	Mon, 15 Aug 2022 23:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B1F2402BC
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NwNwhSfx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fD18p5QLVjaA; Mon, 15 Aug 2022 23:15:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1024E40441;
	Mon, 15 Aug 2022 23:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1024E40441
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10087C0078;
	Mon, 15 Aug 2022 23:15:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A763C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 23:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F304981766
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 23:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F304981766
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=NwNwhSfx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gCWVJo3jWLRU
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 23:15:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09B3D81462
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09B3D81462
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 23:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660605309; x=1692141309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gymUZdI4Zmk7S6OzFKoQtBE8+Fa1MVe79gGq0K3OHDA=;
 b=NwNwhSfxzG3YypdKpvqPHg2W6uWv9yVu3vMsjJ8xIFkHy+bJ7wk41do7
 q4P3WajYKDElshtrkdkvDgNKnbCYO5PqLPz8YTFu/cXfgTIBaZyDVA5Wa
 8vj1NYSv6o1i5KW6v7CtKFy65sVQwx/6s0mjEY1Lvnx2QBm60lcGYWfgk
 jLI6mPJE+5FHwRPzFjNqoo7TUFfn9ls7rmbgJnPF/SyTsNtsmjwAbD2jC
 ANZ5iumsgyaiBfpudpTaZl9w8ktsbUBl7ELmsH7pU2FU/3fiXU8TK7CPp
 vHRRz3DBZZjYzHywV7NcuWeZVVpEG5lVoVCwl7T/Ux9VOmMDpZ0pE5sur w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="318068469"
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; d="scan'208";a="318068469"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 16:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; d="scan'208";a="674992473"
Received: from lkp-server02.sh.intel.com (HELO 3d2a4d02a2a9) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 15 Aug 2022 16:14:41 -0700
Received: from kbuild by 3d2a4d02a2a9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oNjI8-0001Gb-1I;
 Mon, 15 Aug 2022 23:14:40 +0000
Date: Tue, 16 Aug 2022 07:13:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bobby Eshleman <bobby.eshleman@gmail.com>
Subject: Re: [PATCH 2/6] vsock: return errors other than -ENOMEM to socket
Message-ID: <202208160737.gXXFmPbY-lkp@intel.com>
References: <d81818b868216c774613dd03641fcfe63cc55a45.1660362668.git.bobby.eshleman@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d81818b868216c774613dd03641fcfe63cc55a45.1660362668.git.bobby.eshleman@bytedance.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, linux-hyperv@vger.kernel.org,
 Cong Wang <cong.wang@bytedance.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, llvm@lists.linux.dev,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, kbuild-all@lists.01.org,
 Jiang Wang <jiang.wang@bytedance.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Hi Bobby,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.0-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/virtio-vsock-introduce-dgrams-sk_buff-and-qdisc/20220816-015812
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
config: i386-randconfig-a014-20220815 (https://download.01.org/0day-ci/archive/20220816/202208160737.gXXFmPbY-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 6afcc4a459ead8809a0d6d9b4bf7b64bcc13582b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/68c9c8216a573cdfe2170cad677854e2f4a34634
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bobby-Eshleman/virtio-vsock-introduce-dgrams-sk_buff-and-qdisc/20220816-015812
        git checkout 68c9c8216a573cdfe2170cad677854e2f4a34634
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/vmw_vsock/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/vmw_vsock/virtio_transport.c:178: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Merge the two most recent skbs together if possible.


vim +178 net/vmw_vsock/virtio_transport.c

93afaf2cdefaa9 Bobby Eshleman 2022-08-15  176  
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  177  /**
93afaf2cdefaa9 Bobby Eshleman 2022-08-15 @178   * Merge the two most recent skbs together if possible.
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  179   *
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  180   * Caller must hold the queue lock.
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  181   */
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  182  static void
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  183  virtio_transport_add_to_queue(struct sk_buff_head *queue, struct sk_buff *new)
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  184  {
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  185  	struct sk_buff *old;
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  186  
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  187  	spin_lock_bh(&queue->lock);
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  188  	/* In order to reduce skb memory overhead, we merge new packets with
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  189  	 * older packets if they pass virtio_transport_skbs_can_merge().
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  190  	 */
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  191  	if (skb_queue_empty_lockless(queue)) {
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  192  		__skb_queue_tail(queue, new);
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  193  		goto out;
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  194  	}
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  195  
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  196  	old = skb_peek_tail(queue);
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  197  
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  198  	if (!virtio_transport_skbs_can_merge(old, new)) {
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  199  		__skb_queue_tail(queue, new);
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  200  		goto out;
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  201  	}
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  202  
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  203  	memcpy(skb_put(old, new->len), new->data, new->len);
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  204  	vsock_hdr(old)->len = cpu_to_le32(old->len);
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  205  	vsock_hdr(old)->buf_alloc = vsock_hdr(new)->buf_alloc;
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  206  	vsock_hdr(old)->fwd_cnt = vsock_hdr(new)->fwd_cnt;
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  207  	dev_kfree_skb_any(new);
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  208  
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  209  out:
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  210  	spin_unlock_bh(&queue->lock);
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  211  }
93afaf2cdefaa9 Bobby Eshleman 2022-08-15  212  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
